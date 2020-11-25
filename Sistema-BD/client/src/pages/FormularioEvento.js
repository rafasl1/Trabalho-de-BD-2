import React, {useState, useEffect} from 'react';
import axios from 'axios';
/* import  { Redirect } from 'react-router-dom' */
import '../pages/styles/Form.css'

function FormularioEvento() {

    const [nome, setNome] = useState("");
    const [edicao, setEdicao] = useState("");
    const [tema, setTema] = useState("");
    const [publicoAlvo, setPublicoAlvo] = useState("");

    const [listaPatrocinadores, setListaPatrocinadores] = useState([])

    const getPatrocinadores = async() => {
        console.log('xuxu beleza')
        const response = await axios.get("http://localhost:3001/Patrocinadores")
        setListaPatrocinadores(response.data.rows)
    }

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

    useEffect(getPatrocinadores, [])

    return (
        <div>
            <h1>Formulario de evento</h1>
            
                <form onSubmit={adicionaTarefa}>
                <div className="formsContainer">
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
                    </div>

                    <div className="checkbox-container">
                    <label>Patrocinadores:</label>
                        {listaPatrocinadores.map(element => { 
                        return (
                            <div className="checkbox-element">
                                <input type="checkbox" id={element.nome} name={element.nome}/>{/* {element.nome} */}
                                <label for={element.nome}>{element.nome}</label>
                            </div>
                            )
                        })}
                    
                    </div>

                    <div className="formsContainer">
                        <button type='submit'>Enviar</button>
                    </div>
                </form>
            
            
        </div>
    )
}

export default FormularioEvento;