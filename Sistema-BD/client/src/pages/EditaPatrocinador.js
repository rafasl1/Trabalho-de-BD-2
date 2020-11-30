import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom'
import '../pages/styles/Form.css'

function EditaPatrocinador() {

    const params = useParams();
    let id;

    const [ident, setIdent] = useState("");
    const [nome, setNome] = useState("");
    const [endereco, setEndereco] = useState("");
    const [telefone, setTelefone] = useState("");
    const [email, setEmail] = useState("");

    /* const [listaPatrocinadores, setListaPatrocinadores] = useState([]) */

    const getDadosPatrocinador = async () => {
        id = params.id
        const response = await axios.get("http://localhost:3001/patrocinadorEspecifico/" + id)
        setIdent(id)
        setNome(response.data.rows[0].nome)
        setEndereco(response.data.rows[0].endereco)
        setTelefone(response.data.rows[0].telefone)
        setEmail(response.data.rows[0].email)
    }

    const atualizaPatrocinador = async () => {
        let confirmDelete = window.confirm('Tem certeza que deseja atualizar esse evento?')
        if (confirmDelete) {

            axios.put("http://localhost:3001/updatePatrocinador", {
                id: ident,
                nome: nome,
                endereco: endereco,
                telefone: telefone,
                email: email
            }).then(
                //Mandar de volta para página de eventos
                window.location = "/"
            )

        }
    }

    useEffect(getDadosPatrocinador, [])

    return (
        <div>
            <h1>Editar patrocinador {nome}</h1>

            <form onSubmit={atualizaPatrocinador}>
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
                        <label>Endereço:
                        <input type="text"
                                onChange={(event) => {
                                    setEndereco(event.target.value);
                                }}
                                value={endereco}
                            />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Telefone:
                        <input type="text"
                                onChange={(event) => {
                                    setTelefone(event.target.value);
                                }}
                                value={telefone}
                            />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Email:
                        <input type="text"
                                onChange={(event) => {
                                    setEmail(event.target.value);
                                }}
                                value={email}
                            />
                        </label>
                    </div>
                </div>

                <div className="formsContainer">
                    <button type='submit'>Enviar</button>
                </div>
            </form>
        </div>
    )
}

export default EditaPatrocinador;