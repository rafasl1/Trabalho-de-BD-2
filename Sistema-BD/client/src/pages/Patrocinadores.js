import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import Modal from 'react-modal';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';
import '../pages/styles/Tabela.css';
import '../pages/styles/Form.css'

function Patrocinadores() {

    const [modalIsOpen, setIsOpen] = React.useState(false);
    const [listaPatrocinadores, setListaPatrocinadores] = useState([])
    const [listaEventos, setListaEventos] = useState([])
    const [idEventos, setIdEventos] = useState([])
    const [todosOsEventos, setTodosOsEventos] = useState([])

    const [nomePatrocinador, setnomePatrocinador] = useState("");
    const [idPatrocinador, setidPatrocinador] = useState("");
    const [novoEventoPatrocinado, setNovoEventoPatrocinado] = useState("");
    const [novoPatrocTaxa, setNovoPatrocTaxa] = useState("");
    const [novoPatrocCategoria, setNovoPatrocCategoria] = useState("");

    const [eventoPatrocinadoEditadoId, setEventoPatrocinadoEditadoId] = useState("");
    const [patrocEditadoNome, setPatrocEditadoNome] = useState("");
    const [patrocEditadoTaxa, setPatrocEditadoTaxa] = useState("");
    const [patrocEditadoCategoria, setPatrocEditadoCategoria] = useState("");

    const [hiddenDiv, setHiddenDiv] = useState("none");

    const getPatrocinadores = async (id) => {
        const response = await axios.get("http://localhost:3001/Patrocinadores")
        setListaPatrocinadores(response.data.rows)
    }
    const getEventos = async () => {
        const response = await axios.get("http://localhost:3001/Eventos")
        setTodosOsEventos(response.data.rows)
    }

    useEffect(getEventos, [])
    useEffect(getPatrocinadores, [])

    const delPatrocinador = (id) => {

        let confirmDelete = window.confirm('Tem certeza que deseja deletar esse item?')
        if (confirmDelete) {
            axios.delete("http://localhost:3001/removePatrocinador/" + id)
            setListaPatrocinadores(listaPatrocinadores.filter(entidade => entidade.id !== id))
        }
    }

    const delPatrocinio = (id) => {
        let evento = id[0]
        let entidade = id[1]

        axios.delete("http://localhost:3001/removePatrocinio/" + evento + "/" + entidade)
        setListaEventos(listaEventos.filter(element => element.evento_id !== evento))
        /* setIdPatrocinadores(idPatrocinadores.filter(element => element.id !== entidade)) */

    }

    const getPatrocinio = async (id) => {
        const response = await axios.get("http://localhost:3001/PatrocinioPelaEntidade/" + id)
        setListaEventos(response.data.rows)
        console.log(response.data.rows)
        let i = 0
        let ids = []
        while (i < response.data.rows.length) {
            /* console.log(response.data.rows[i].entidade_id) */
            ids.push(response.data.rows[i].evento_id)
            i++
        }
        console.log(ids)
        setIdEventos(ids)
    }

    const addNovoEventoPatrocinado = async () => {
        const teste = novoEventoPatrocinado[0].split(",");
        console.log(teste)

        const evento = [{
            id: teste[0],
            nome: teste[1]
        }]

        const taxa = [{
            id: evento[0].id,
            value: novoPatrocTaxa
        }]
        const categoria = [{
            id: evento[0].id,
            value: novoPatrocCategoria
        }]

        await axios.post("http://localhost:3001/adicionaPatrocinioPelaEntidade", {
            id_entidade: idPatrocinador,
            nome_entidade: nomePatrocinador,
            dados_evento: evento,
            taxa_patrocinios: taxa,
            categoria_patrocinios: categoria
        }).then(
            window.location = "/"
        )
    }

    const abreDivEditar = (dados) => {
        setidPatrocinador(dados[0])
        setEventoPatrocinadoEditadoId(dados[1])
        setPatrocEditadoNome(dados[2])
        setPatrocEditadoTaxa(dados[3])
        setPatrocEditadoCategoria(dados[4])

        setHiddenDiv("block")
        console.log(idEventos)
        console.log('abriu')
    }

    const editarPatrocinio = async () => {
        setHiddenDiv("none")
        console.log(listaEventos)
        console.log(listaEventos.filter(element => element.evento_id !== eventoPatrocinadoEditadoId))
        axios.put("http://localhost:3001/updatePatrocinio", {
            id_evento: eventoPatrocinadoEditadoId,
            id_patrocinador: idPatrocinador,
            taxa: patrocEditadoTaxa,
            categoria: patrocEditadoCategoria
        }).then(
            //Mandar de volta para página de eventos
            //window.location = "/"
            setListaEventos([...listaEventos.filter(element => element.evento_id !== eventoPatrocinadoEditadoId), {
                taxa: patrocEditadoTaxa,
                categoria: patrocEditadoCategoria,
                evento_id: eventoPatrocinadoEditadoId,
                evento_nome: patrocEditadoNome,
                entidade_id: idPatrocinador,
                entidade_nome: ""
            }])
        )
    }

    async function openModal(id, nome) {
        setidPatrocinador(id);
        setnomePatrocinador(nome);
        await getPatrocinio(id);
        setIsOpen(true);
    }

    function closeModal() {
        setIsOpen(false);
        setHiddenDiv("none")
    }

    return (
        <div>
            <div className="topo">
                <h1>Patrocinadores</h1>
                <BotaoForm rota="/formPatrocinadores" />
            </div>

            <div className="table-container">
                <table>
                    <tr>
                        <th>Nome</th>
                        <th>Endereço</th>
                        <th>Telefone</th>
                        <th>Email</th>
                        <th>Eventos patrocinados</th>
                        <th></th>
                        <th></th>
                    </tr>

                    {listaPatrocinadores.map(element => {
                        return (
                            <tr>
                                <td>{element.nome}</td>
                                <td>{element.endereco}</td>
                                <td>{element.telefone}</td>
                                <td>{element.email}</td>
                                <td><button className="botaoSecundario" onClick={() => { openModal(element.id, element.nome) }}>Ver eventos patrocinados</button></td>
                                {<td><Link to={"/editPatrocinador/" + element.id}><button className="botaoSecundario">Editar</button></Link></td>}
                                <td><button className="botaoSecundario" onClick={() => { delPatrocinador(element.id) }}>Apagar</button></td>
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
                    <h1>Eventos patrocinados</h1>
                    <div className="table-container">
                        <table>
                            <tr>
                                <th>Evento</th>
                                <th>Taxa</th>
                                <th>Categoria</th>
                            </tr>

                            {listaEventos.map(element => {
                                return (
                                    <tr>
                                        <td>{element.evento_nome}</td>
                                        <td>{element.taxa}</td>
                                        <td>{element.categoria}</td>
                                        <td><button className="botaoSecundario" onClick={() => { abreDivEditar([element.entidade_id, element.evento_id, element.evento_nome, element.taxa, element.categoria]) }}>Editar patrocínio</button></td>
                                        <td><button className="botaoSecundario" onClick={() => { delPatrocinio([element.evento_id, element.entidade_id]) }}>Apagar</button></td>
                                    </tr>
                                )
                            })}
                        </table>

                    </div>

                    <div style={{ display: hiddenDiv }}>
                        <h1>Editar patrocínio do evento {patrocEditadoNome}</h1>
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
                        <h1>Adicionar novo evento patrocinado</h1>
                        <form >
                            <div className="formsContainer">

                                <div className="itemForms">
                                    <label>Categoria do patrocinio:
                                    <div onChange={(event) => { setNovoEventoPatrocinado([event.target.value]); }}>
                                            {todosOsEventos.map(element => {
                                                if (!idEventos.includes(element.id)) {
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
                                <button type='button' onClick={() => { addNovoEventoPatrocinado() }}>Adicionar patrocínio</button>
                            </div>
                        </form>
                    </div>

                </Modal>
            </div>


        </div>
    )
}

export default Patrocinadores;