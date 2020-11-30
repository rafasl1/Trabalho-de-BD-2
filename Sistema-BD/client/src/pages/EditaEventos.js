import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom'
import '../pages/styles/Form.css'

function EditaEventos() {

    const params = useParams();
    let id;

    const [ident, setIdent] = useState("");
    const [nome, setNome] = useState("");
    const [edicao, setEdicao] = useState("");
    const [tema, setTema] = useState("");
    const [publicoAlvo, setPublicoAlvo] = useState("");

    /* const [listaPatrocinadores, setListaPatrocinadores] = useState([]) */

    const getDadosEvento = async () => {
        id = params.id
        const response = await axios.get("https://bdbackend.herokuapp.com/eventoEspecifico/" + id)
        setIdent(id)
        setNome(response.data.rows[0].nome)
        setEdicao(response.data.rows[0].edicao)
        setTema(response.data.rows[0].tema)
        setPublicoAlvo(response.data.rows[0].publico_alvo)
    }

    /* const getPatrocinadores = async() => {
        
    } */

    const atualizaEvento = async () => {
        console.log(ident)
        let confirmDelete = window.confirm('Tem certeza que deseja atualizar esse evento?')
        if (confirmDelete) {

            axios.put("https://bdbackend.herokuapp.com/updateEventos", {
                id: ident,
                nome: nome,
                edicao: edicao,
                tema: tema,
                publicoAlvo: publicoAlvo
            }).then(
                //Mandar de volta para página de eventos
                window.location = "/"
            )

        }
    }

    useEffect(getDadosEvento, [])

    return (
        <div>
            <h1>Edição do evento { }</h1>

            <form onSubmit={atualizaEvento}>
                <div className="formsContainer">
                    <div className="itemForms">
                        <label>Nome:
                        <input type="text"
                                onChange={(event) => {
                                    setNome(event.target.value);
                                }}
                                value={nome}
                            />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Edição:
                        <input type="text"
                                onChange={(event) => {
                                    setEdicao(event.target.value);
                                }}
                                value={edicao}
                            />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Tema:
                        <input type="text"
                                onChange={(event) => {
                                    setTema(event.target.value);
                                }}
                                value={tema}
                            />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Público alvo:
                        <input type="text"
                                onChange={(event) => {
                                    setPublicoAlvo(event.target.value);
                                }}
                                value={publicoAlvo}
                            />
                        </label>
                    </div>
                </div>

                <div className="formsContainer">
                    <button type='submit'>Enviar</button>
                </div>
            </form>

            <h3>OBS: Caso deseje, editar os patrocinadores desse evento, faça isso através do botão "Ver patrocinadores" na página principal"</h3>
        </div>
    )
}

export default EditaEventos;