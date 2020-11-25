import React, {useState, useEffect} from 'react';
import axios from 'axios';
/* import  { Redirect } from 'react-router-dom' */
import '../pages/styles/Form.css'

function EditaEventos() {

    const [nome, setNome] = useState("");
    const [edicao, setEdicao] = useState("");
    const [tema, setTema] = useState("");
    const [publicoAlvo, setPublicoAlvo] = useState("");

    const [listaEventos, setListaEventos] = useState([])
    /* const [listaPatrocinadores, setListaPatrocinadores] = useState([]) */

    const getDadosEvento = async(id) => {
        
    }

    /* const getPatrocinadores = async() => {
        
    } */

    const atualizaEvento = async() => {
        
    }

    useEffect(getDadosEvento, [])

    return (
        <div>
            <h1>Edição do evento {}</h1>
            
                <form onSubmit={atualizaEvento}>
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

                    {/* <div className="checkbox-container">
                    <label>Patrocinadores:</label>
                        {listaPatrocinadores.map(element => { 
                        return (
                            <div className="checkbox-element">
                                <input type="checkbox" id={element.nome} name={element.nome}/>
                                <label for={element.nome}>{element.nome}</label>
                            </div>
                            )
                        })}
                    
                    </div> */}

                    <div className="formsContainer">
                        <button type='submit'>Enviar</button>
                    </div>
                </form>
        </div>
    )
}

export default EditaEventos;