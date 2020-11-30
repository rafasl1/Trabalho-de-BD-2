import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../pages/styles/Form.css'

function FormularioEvento() {

    const [nome, setNome] = useState("");
    const [edicao, setEdicao] = useState("");
    const [tema, setTema] = useState("");
    const [publicoAlvo, setPublicoAlvo] = useState("");

    const [listaPatrocinadores, setListaPatrocinadores] = useState([]);

    const [patrocinadoresSelecionados, setPatrocinadoresSelecionados] = useState([])
    const [quantPatrocinadoresSelecionados, setQuantPatrocinadoresSelecionados] = useState(0)
    const [taxasPatrocinadoresSelecionados, setTaxasPatrocinadoresSelecionados] = useState([])
    const [categoriasPatrocinadoresSelecionados, setCategoriasPatrocinadoresSelecionados] = useState([])
    const [idNovo, setIdNovo] = useState(0);

    const getPatrocinadores = async () => {
<<<<<<< HEAD
        const response = await axios.get("http://localhost:3001/Patrocinadores")
=======
        const response = await axios.get("https://bdbackend.herokuapp.com/Patrocinadores")
>>>>>>> 6a456da256755bd9976ab3215d5bc3348bc4aa67
        setListaPatrocinadores(response.data.rows)
    }

    const getLastId = async () => {
<<<<<<< HEAD
        const response = await axios.get("http://localhost:3001/eventoLastId")
=======
        const response = await axios.get("https://bdbackend.herokuapp.com/eventoLastId")
>>>>>>> 6a456da256755bd9976ab3215d5bc3348bc4aa67
        setIdNovo(response.data)
    }

    const selectPatrocinadores = (event) => {
        let valores = event.target.name.split(',')
        let id = valores[0]
        let nome = valores[1]

        const x = {
            id: id,
            nome: nome
        }

        if (event.target.checked) {
            setPatrocinadoresSelecionados([...patrocinadoresSelecionados, x])
        } else {
            setPatrocinadoresSelecionados(patrocinadoresSelecionados.filter(entidade => entidade.id !== id))
            setTaxasPatrocinadoresSelecionados(taxasPatrocinadoresSelecionados.filter(taxa => taxa.id !== id))
            setCategoriasPatrocinadoresSelecionados(categoriasPatrocinadoresSelecionados.filter(categoria => categoria.id !== id))
        }
    }

    const adicionaEvento = async () => {

<<<<<<< HEAD
        await axios.post("http://localhost:3001/adicionaEventos", {
=======
        await axios.post("https://bdbackend.herokuapp.com/adicionaEventos", {
>>>>>>> 6a456da256755bd9976ab3215d5bc3348bc4aa67
            nome: nome,
            edicao: edicao,
            tema: tema,
            publicoAlvo: publicoAlvo
        }).then((response) => {
            getLastId()
        })
    }

    const adicionaPatrocinadores = async () => {
        console.log('entrou pra adicionar no relacionamento')

        await axios.post("https://bdbackend.herokuapp.com/adicionaPatrocinio", {
            id_evento: idNovo,
            nome_evento: nome,
            dados_entidade: patrocinadoresSelecionados,
            taxa_patrocinios: taxasPatrocinadoresSelecionados,
            categoria_patrocinios: categoriasPatrocinadoresSelecionados
        }).then(
            //Mandar de volta para página de eventos
            window.location = "/"
        )
    }

    useEffect(() => {
        console.log(idNovo)
        if (idNovo !== 0 && categoriasPatrocinadoresSelecionados.length === quantPatrocinadoresSelecionados && taxasPatrocinadoresSelecionados.length === quantPatrocinadoresSelecionados) {
            adicionaPatrocinadores()
        }
    }, [idNovo]);

    useEffect(() => {
        setQuantPatrocinadoresSelecionados(patrocinadoresSelecionados.length)
    }, [patrocinadoresSelecionados]);

    useEffect(() => {
        if (idNovo !== 0 && categoriasPatrocinadoresSelecionados.length === quantPatrocinadoresSelecionados && taxasPatrocinadoresSelecionados.length === quantPatrocinadoresSelecionados) {
            adicionaPatrocinadores()
        }
    }, [categoriasPatrocinadoresSelecionados]);

    useEffect(() => {
        if (idNovo !== 0 && categoriasPatrocinadoresSelecionados.length === quantPatrocinadoresSelecionados && taxasPatrocinadoresSelecionados.length === quantPatrocinadoresSelecionados) {
            adicionaPatrocinadores()
        }
    }, [taxasPatrocinadoresSelecionados]);

    useEffect(getPatrocinadores, [])

    return (
        <div>
            <h1>Formulario de evento</h1>

            <form >
                <div className="formsContainer">
                    <div className="itemForms">
                        <label>Nome:
                        <input type="text"
                                onChange={(event) => {
                                    setNome(event.target.value);
                                }}
                            />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Edição:
                        <input type="text"
                                onChange={(event) => {
                                    setEdicao(event.target.value);
                                }}
                            />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Tema:
                        <input type="text"
                                onChange={(event) => {
                                    setTema(event.target.value);
                                }}
                            />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Público alvo:
                        <input type="text"
                                onChange={(event) => {
                                    setPublicoAlvo(event.target.value);
                                }}
                            />
                        </label>
                    </div>
                </div>

                <div className="checkbox-container">
                    <label>Patrocinadores:</label>
                    {listaPatrocinadores.map(element => {
                        return (
                            <div className="checkbox-element">
                                <input type="checkbox" id={element.nome} name={[element.id, element.nome]} onChange={selectPatrocinadores} />{/* {element.nome} */}
                                <label for={element.nome}>{element.nome}</label>
                            </div>
                        )
                    })}
<<<<<<< HEAD

                </div>

=======

                </div>

>>>>>>> 6a456da256755bd9976ab3215d5bc3348bc4aa67
                <div >
                    <label>Forneça os seguintes dados sobre os patrocinadores desse evento:</label>
                    {patrocinadoresSelecionados.map(element => {
                        return (
                            <div className="checkbox-element">
                                <h4>{element.nome}</h4>
                                <label>Taxa do patrocinio:
                                    <input id={element.id}
                                        type="text"
                                        onChange={async (event) => {
                                            setTaxasPatrocinadoresSelecionados([...taxasPatrocinadoresSelecionados.filter(taxa => taxa.id !== event.target.id), {
                                                id: event.target.id,
                                                value: event.target.value
                                            }])
                                        }}
                                    />
                                </label>

                                <label>Categoria do patrocinio:
<<<<<<< HEAD
=======
                                    {/* <input id={element.id}
                                        type="text"
                                        onChange = {(event) => {
                                            setCategoriasPatrocinadoresSelecionados([...categoriasPatrocinadoresSelecionados.filter(categoria => categoria.id !== event.target.id), {
                                                id: event.target.id,
                                                value: event.target.value
                                            }])
                                    }} 
                                />  */}
>>>>>>> 6a456da256755bd9976ab3215d5bc3348bc4aa67
                                    <div onChange={(event) => {
                                        setCategoriasPatrocinadoresSelecionados([...categoriasPatrocinadoresSelecionados.filter(categoria => categoria.id !== event.target.id), {
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
                    <button type='button' onClick={adicionaEvento}>Enviar</button>
                </div>
            </form>


        </div>
    )
}

export default FormularioEvento;