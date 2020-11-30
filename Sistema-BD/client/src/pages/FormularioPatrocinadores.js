import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../pages/styles/Form.css'

function FormularioPatrocinadores() {

    const [nome, setNome] = useState("");
    const [endereco, setEndereco] = useState("");
    const [telefone, setTelefone] = useState("");
    const [email, setEmail] = useState("");

    const [listaEventos, setListaEventos] = useState([]);

    const [eventosSelecionados, setEventosSelecionados] = useState([])
    const [quantEventosSelecionados, setQuantEventosSelecionados] = useState(0)
    const [taxasEventosSelecionados, setTaxasEventosSelecionados] = useState([])
    const [categoriasEventosSelecionados, setCategoriasEventosSelecionados] = useState([])
    const [idNovo, setIdNovo] = useState(0);

    const getEventos = async () => {
        const response = await axios.get("https://bdbackend.herokuapp.com/Eventos")
        setListaEventos(response.data.rows)
    }

    const getLastId = async () => {
        const response = await axios.get("https://bdbackend.herokuapp.com/patrocinadorLastId")
        setIdNovo(response.data)
    }

    const selectEventosPatrocinados = (event) => {
        let valores = event.target.name.split(',')
        let id = valores[0]
        let nome = valores[1]

        const x = {
            id: id,
            nome: nome
        }

        if (event.target.checked) {
            setEventosSelecionados([...eventosSelecionados, x])
        } else {
            setEventosSelecionados(eventosSelecionados.filter(evento => evento.id !== id))
            setTaxasEventosSelecionados(taxasEventosSelecionados.filter(taxa => taxa.id !== id))
            setCategoriasEventosSelecionados(categoriasEventosSelecionados.filter(categoria => categoria.id !== id))
        }
    }

    const adicionaPatrocinador = async () => {

        await axios.post("https://bdbackend.herokuapp.com/adicionaPatrocinador", {
            nome: nome,
            endereco: endereco,
            telefone: telefone,
            email: email

        }).then((response) => {
            getLastId()
        })
    }

    const adicionaPatrocinio = async () => {
        await axios.post("https://bdbackend.herokuapp.com/adicionaPatrocinioPelaEntidade", {
            id_entidade: idNovo,
            nome_entidade: nome,
            dados_evento: eventosSelecionados,
            taxa_patrocinios: taxasEventosSelecionados,
            categoria_patrocinios: categoriasEventosSelecionados
        }).then(
            //Mandar de volta para página de eventos
            window.location = "/patrocinadores"
        )
    }

    useEffect(() => {
        console.log(idNovo)
        if (idNovo !== 0 && categoriasEventosSelecionados.length === quantEventosSelecionados && taxasEventosSelecionados.length === quantEventosSelecionados) {
            adicionaPatrocinio()
        }
    }, [idNovo]);

    useEffect(() => {
        setQuantEventosSelecionados(eventosSelecionados.length)
    }, [eventosSelecionados]);

    useEffect(() => {
        if (idNovo !== 0 && categoriasEventosSelecionados.length === quantEventosSelecionados && taxasEventosSelecionados.length === quantEventosSelecionados) {
            adicionaPatrocinio()
        }
    }, [categoriasEventosSelecionados]);

    useEffect(() => {
        if (idNovo !== 0 && categoriasEventosSelecionados.length === quantEventosSelecionados && taxasEventosSelecionados.length === quantEventosSelecionados) {
            adicionaPatrocinio()
        }
    }, [taxasEventosSelecionados]);

    useEffect(getEventos, [])

    return (
        <div>
            <h1>Formulario de Patrocinadores</h1>

            <form >
                <div className="formsContainer">
                    <div className="itemForms">
                        <label>Nome:
                        <input type="text"
                                onChange={(event) => {
                                    setNome(event.target.value);
                                }} />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Endereço:
                        <input type="text"
                                onChange={(event) => {
                                    setEndereco(event.target.value);
                                }} />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Telefone:
                        <input type="text"
                                onChange={(event) => {
                                    setTelefone(event.target.value);
                                }} />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Email:
                        <input type="text"
                                onChange={(event) => {
                                    setEmail(event.target.value);
                                }} />
                        </label>
                    </div>

                </div>

                <div className="checkbox-container">
                    <label>Eventos que patrocina:</label>
                    {listaEventos.map(element => {
                        return (
                            <div className="checkbox-element">
                                <input type="checkbox" id={element.nome} name={[element.id, element.nome]} onChange={selectEventosPatrocinados} />{/* {element.nome} */}
                                <label for={element.nome}>{element.nome}</label>
                            </div>
                        )
                    })}

                </div>

                <div >
                    <label>Forneça os seguintes dados sobre o patrocínio dos eventos selecionados:</label>
                    {eventosSelecionados.map(element => {
                        return (
                            <div className="checkbox-element">
                                <h4>{element.nome}</h4>
                                <label>Taxa do patrocinio:
                                    <input id={element.id}
                                        type="text"
                                        onChange={async (event) => {
                                            setTaxasEventosSelecionados([...taxasEventosSelecionados.filter(taxa => taxa.id !== event.target.id), {
                                                id: event.target.id,
                                                value: event.target.value
                                            }])
                                        }}
                                    />
                                </label>

                                <label>Categoria do patrocinio:
                                    <div onChange={(event) => {
                                        setCategoriasEventosSelecionados([...categoriasEventosSelecionados.filter(categoria => categoria.id !== event.target.id), {
                                            id: event.target.id,
                                            value: event.target.value
                                        }])
                                    }} >
                                        <div className="checkbox-element">
                                            <input id={element.id} type="radio" name={"entidade" + element.id} value="Ouro" />
                                            <label >Ouro</label>
                                        </div>
                                        <div className="checkbox-element">
                                            <input id={element.id} type="radio" name={"entidade" + element.id} value="Prata" />
                                            <label >´Prata</label>
                                        </div>
                                        <div className="checkbox-element">
                                            <input id={element.id} type="radio" name={"entidade" + element.id} value="Bronze" />
                                            <label >Bronze</label>
                                        </div>
                                    </div>
                                </label>
                            </div>
                        )
                    })}

                </div>

                <div className="formsContainer">
                    <button type='button' onClick={adicionaPatrocinador}>Enviar</button>
                </div>

            </form>
        </div>
    );
}

export default FormularioPatrocinadores;