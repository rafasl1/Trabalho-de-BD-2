import React, {useState} from 'react';
import axios from 'axios';
/* import  { Redirect } from 'react-router-dom' */
import '../pages/styles/Form.css'

function FormularioEvento() {

    const [nome, setNome] = useState("");
    const [edicao, setEdicao] = useState("");
    const [tema, setTema] = useState("");
    const [publicoAlvo, setPublicoAlvo] = useState("");

    const adicionaTarefa = async() => {

        await axios.post("http://localhost:3001/adicionaEventos", {
            nome: nome, 
            edicao: edicao,
            tema: tema,
            publicoAlvo: publicoAlvo
        })
        
        /* console.log("sucesso");
        return <Redirect to='/'  /> */
        
    }

    return (
        <div>
            <h1>Formulario de evento</h1>
            <div>
                <form className="formsContainer" onSubmit={adicionaTarefa}>
                    <div className="itemForms">
                        <label>Nome:
                        <input type="text"
                                onChange = {(event) => {
                                    setNome(event.target.value);
                                }} 
                        />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Edição:
                        <input type="text"
                                onChange = {(event) => {
                                    setEdicao(event.target.value);
                                }} 
                        />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Tema:
                        <input type="text"
                                onChange = {(event) => {
                                    setTema(event.target.value);
                                }} 
                        />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Público alvo:
                        <input type="text"
                                onChange = {(event) => {
                                    setPublicoAlvo(event.target.value);
                                }} 
                        />
                        </label>
                    </div>

                    <button type='submit'>Enviar</button>
                </form>
            </div>
            
        </div>
    )
}

export default FormularioEvento;