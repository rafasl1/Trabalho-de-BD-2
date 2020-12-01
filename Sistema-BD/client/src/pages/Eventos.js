import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import Modal from 'react-modal';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';
import '../pages/styles/Tabela.css';
import '../pages/styles/Form.css'

// Make sure to bind modal to your appElement (http://reactcommunity.org/react-modal/accessibility/)
//Modal.setAppElement('#yourAppElement')
// IMPORTANTEEEEEEEEEEEEEEEEEEEEEEEEEE

function Eventos() {

    const [modalIsOpen, setIsOpen] = React.useState(false);
    const [listaEventos, setListaEventos] = useState([])
    const [listaPatrocinadores, setListaPatrocinadores] = useState([])
    const [idPatrocinadores, setIdPatrocinadores] = useState([])
    const [todosOsPatrocinadores, setTodosOsPatrocinadores] = useState([])

    const [nomeEvento, setnomeEvento] = useState("");
    const [idEvento, setidEvento] = useState("");
    const [novoPatrocinador, setNovoPatrocinador] = useState("");
    const [novoPatrocTaxa, setNovoPatrocTaxa] = useState("");
    const [novoPatrocCategoria, setNovoPatrocCategoria] = useState("");

    const [patrocEditadoId, setPatrocEditadoId] = useState("");
    const [patrocEditadoNome, setPatrocEditadoNome] = useState("");
    const [patrocEditadoTaxa, setPatrocEditadoTaxa] = useState("");
    const [patrocEditadoCategoria, setPatrocEditadoCategoria] = useState("");

    const [hiddenDiv, setHiddenDiv] = useState("none");


    useEffect(() => {
        const getEventos = async () => {
            const response = await axios.get("https://bdbackend.herokuapp.com/Eventos")
            setListaEventos(response.data.rows)
        }

        getEventos();
    }, [])

    useEffect(() => {
        const getPatrocinadores = async (id) => {
            const response = await axios.get("https://bdbackend.herokuapp.com/Patrocinadores")
            setTodosOsPatrocinadores(response.data.rows)
        }

        getPatrocinadores();
    }, [])

    const delEventos = (id) => {

        let confirmDelete = window.confirm('Tem certeza que deseja deletar esse item?')
        if (confirmDelete) {
            axios.get("https://bdbackend.herokuapp.com/removeEventos/" + id)
            setListaEventos(listaEventos.filter(evento => evento.id !== id))
        }
    }

    const delPatrocinio = (id) => {
        let evento = id[0]
        let entidade = id[1]

        axios.get("https://bdbackend.herokuapp.com/removePatrocinio/" + evento + "/" + entidade)
        setListaPatrocinadores(listaPatrocinadores.filter(element => element.entidade_id !== entidade))
        /* setIdPatrocinadores(idPatrocinadores.filter(element => element.id !== entidade)) */

    }

    const getPatrocinio = async (id) => {
        const response = await axios.get("https://bdbackend.herokuapp.com/Patrocinio/" + id)
        setListaPatrocinadores(response.data.rows)
        let i = 0
        let ids = []
        while (i < response.data.rows.length) {
            /* console.log(response.data.rows[i].entidade_id) */
            ids.push(response.data.rows[i].entidade_id)
            i++
        }
        console.log(ids)
        setIdPatrocinadores(ids)
    }

    const addNovoPatrocinador = async () => {
        console.log(novoPatrocinador)
        const teste = novoPatrocinador[0].split(",");
        console.log(teste)

        const patrocinador = [{
            id: teste[0],
            nome: teste[1]
        }]
        console.log(patrocinador)
        console.log(patrocinador.id)


        const taxa = [{
            id: patrocinador[0].id,
            value: novoPatrocTaxa
        }]
        const categoria = [{
            id: patrocinador[0].id,
            value: novoPatrocCategoria
        }]

        await axios.get("https://bdbackend.herokuapp.com/adicionaPatrocinio", {
            id_evento: idEvento,
            nome_evento: nomeEvento,
            dados_entidade: patrocinador,
            taxa_patrocinios: taxa,
            categoria_patrocinios: categoria
        }).then(
            window.location = "/"
        )
    }

    const abreDivEditar = (dados) => {
        setidEvento(dados[0])
        setPatrocEditadoId(dados[1])
        setPatrocEditadoNome(dados[2])
        setPatrocEditadoTaxa(dados[3])
        setPatrocEditadoCategoria(dados[4])

        setHiddenDiv("block")
    }

    const editarPatrocinio = async () => {
        console.log(listaPatrocinadores)
        setHiddenDiv("none")
        axios.get("https://bdbackend.herokuapp.com/updatePatrocinio", {
            id_evento: idEvento,
            id_patrocinador: patrocEditadoId,
            taxa: patrocEditadoTaxa,
            categoria: patrocEditadoCategoria
        }).then(
            //Mandar de volta para página de eventos
            //window.location = "/"
            setListaPatrocinadores([...listaPatrocinadores.filter(element => element.entidade_id !== patrocEditadoId), {
                taxa: patrocEditadoTaxa,
                categoria: patrocEditadoCategoria,
                evento_id: idEvento,
                evento_nome: "",
                entidade_id: patrocEditadoId,
                entidade_nome: patrocEditadoNome
            }])
        )
    }

    async function openModal(id, nome) {
        setidEvento(id);
        setnomeEvento(nome);
        await getPatrocinio(id);
        setIsOpen(true);
    }

    function closeModal() {
        setIsOpen(false);
        setHiddenDiv("none")
    }

    useEffect(() => {
        console.log(novoPatrocinador)
    }, [novoPatrocinador]);

    return (
        <div>

            <div className="topo">
                <h1>Eventos</h1>
                <BotaoForm rota="/formEvento" />
            </div>

            <div className="table-container">
                <table>
                    <tr>
                        <th>Nome</th>
                        <th>Edição</th>
                        <th>Tema</th>
                        <th>Público Alvo</th>
                        <th>Patrocinadores</th>
                        <th></th>
                        <th></th>
                    </tr>

                    {listaEventos.map(element => {
                        return (
                            <tr>
                                <td>{element.nome}</td>
                                <td>{element.edicao}</td>
                                <td>{element.tema}</td>
                                <td>{element.publico_alvo}</td>
                                <td><button className="botaoSecundario" onClick={() => { openModal(element.id, element.nome) }}>Ver patrocinadores</button></td>
                                {<td><Link to={"/editEvento/" + element.id}><button className="botaoSecundario">Editar</button></Link></td>}
                                {/* <td><button className="botaoSecundario" ><Link to={{
                                        pathname: '/editEvento',
                                        state: [{id: openModal(element.id)}]
                                    }}>Editar</Link></button></td> */}
                                <td><button className="botaoSecundario" onClick={() => { delEventos(element.id) }}>Apagar</button></td>
                            </tr>
                        )
                    })}
                </table>
            </div>

            <div className="modal-container">
                <Modal
                    isOpen={modalIsOpen}
                    onRequestClose={closeModal}
                    contentLabel="Example Modal"
                >
                    <div className="modal-button-container">
                        <button className="modal-button" onClick={closeModal}>Fechar</button>
                    </div>
                    <h1>Patrocinadores do evento</h1>
                    <div className="table-container">
                        <table>
                            <tr>
                                <th>Entidade</th>
                                <th>Taxa</th>
                                <th>Categoria</th>
                            </tr>

                            {listaPatrocinadores.map(element => {
                                return (
                                    <tr>
                                        <td>{element.entidade_nome}</td>
                                        <td>{element.taxa}</td>
                                        <td>{element.categoria}</td>
                                        <td><button className="botaoSecundario" onClick={() => { abreDivEditar([element.evento_id, element.entidade_id, element.entidade_nome, element.taxa, element.categoria]) }}>Editar patrocínio</button></td>
                                        <td><button className="botaoSecundario" onClick={() => { delPatrocinio([element.evento_id, element.entidade_id]) }}>Apagar</button></td>
                                    </tr>
                                )
                            })}
                        </table>

                    </div>

                    <div style={{ display: hiddenDiv }}>
                        <h1>Editar patrocinador {patrocEditadoNome}</h1>
                        <form >
                            <div className="formsContainer">

                                <div className="itemForms">
                                    <label>Taxa:
                                        <input type="text"
                                            onChange={(event) => { setPatrocEditadoTaxa(event.target.value); }}
                                            value={patrocEditadoTaxa}
                                        />
                                    </label>
                                </div>

                                <div className="itemForms">
                                    <label>Categoria:
                                        {/* <input type="text"
                                            onChange = {(event) => {setPatrocEditadoCategoria(event.target.value);}}
                                            value={patrocEditadoCategoria}
                                        /> */}
                                        <div onChange={(event) => { setPatrocEditadoCategoria(event.target.value); }} >
                                            {/* <input type="radio" name="entidade" value="Ouro" checked={patrocEditadoCategoria === "Ouro"}/>Ouro
                                            <input type="radio" name="entidade" value="Prata" checked={patrocEditadoCategoria === "Prata"}/>Prata
                                            <input type="radio" name="entidade" value="Bronze" checked={patrocEditadoCategoria === "Bronze"}/>Bronze */}
                                            <div className="checkbox-element">
                                                <input type="radio" name="entidade" value="Ouro" checked={patrocEditadoCategoria === "Ouro"} />
                                                <label >Ouro</label>
                                            </div>
                                            <div className="checkbox-element">
                                                <input type="radio" name="entidade" value="Prata" checked={patrocEditadoCategoria === "Prata"} />
                                                <label >Prata</label>
                                            </div>
                                            <div className="checkbox-element">
                                                <input type="radio" name="entidade" value="Bronze" checked={patrocEditadoCategoria === "Bronze"} />
                                                <label >Bronze</label>
                                            </div>
                                        </div>
                                    </label>
                                </div>

                            </div>

                            <div className="formsContainer">
                                <button type='button' onClick={() => { editarPatrocinio() }}>Editar patrocínio</button>
                            </div>
                        </form>
                    </div>

                    <div>
                        <h1>Adicionar novo patrocinador para esse evento</h1>
                        <form >
                            <div className="formsContainer">

                                <div className="itemForms">
                                    <label>Entidade patrocinadora:
                                    <div onChange={(event) => { setNovoPatrocinador([event.target.value]); }}>
                                            {todosOsPatrocinadores.map(element => { // eslint-disable-line
                                                if (!idPatrocinadores.includes(element.id)) {
                                                    return (
                                                        <div className="checkbox-element">
                                                            <input type="radio" name="entidade" value={element.id + "," + element.nome} />
                                                            <label>{element.nome}</label>
                                                        </div>
                                                    )
                                                }
                                            })}
                                        </div>
                                    </label>
                                </div>

                                <div className="itemForms">
                                    <label>Taxa:
                                        <input type="text"
                                            onChange={(event) => { setNovoPatrocTaxa(event.target.value); }}
                                        />
                                    </label>
                                </div>

                                <div className="itemForms">
                                    <label>Categoria do patrocinio:
                                    <div onChange={(event) => { setNovoPatrocCategoria(event.target.value); }} >
                                            <div className="checkbox-element">
                                                <input type="radio" name="categoria" value="Ouro" />
                                                <label >Ouro</label>
                                            </div>
                                            <div className="checkbox-element">
                                                <input type="radio" name="categoria" value="Prata" />
                                                <label >´Prata</label>
                                            </div>
                                            <div className="checkbox-element">
                                                <input type="radio" name="categoria" value="Bronze" />
                                                <label >Bronze</label>
                                            </div>
                                        </div>
                                    </label>
                                </div>

                            </div>

                            <div className="formsContainer">
                                <button type='button' onClick={() => { addNovoPatrocinador() }}>Adicionar patrocínio</button>
                            </div>
                        </form>
                    </div>

                </Modal>
            </div>

        </div>
    )
}

export default Eventos;