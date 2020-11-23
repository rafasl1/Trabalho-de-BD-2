import React, {useState, useEffect} from 'react';
import axios from 'axios';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';

function Eventos() {

    const [listaEventos, setListaEventos] = useState([])
    
    const getEventos = async() => {
        const response = await axios.get("http://localhost:3001/Eventos")
            
        console.log('entrou pro back')
        setListaEventos(response.data.rows)
    }

    useEffect(getEventos, [])
    
        return (
            <div className="container-tabelas">
                <div className="topo">
                    <BotaoForm rota="/formEvento"/>
                    <h1>Eventos</h1>
                </div>
    
                <table>
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Edição</th>
                            <th>Tema</th>
                            <th>Público Alvo</th>
                            <th>Patrocinadores</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            {listaEventos.map(element => { 
                                return (
                                        <tr>
                                            <td>{element.nome}</td>
                                            <td>{element.edicao}</td>
                                            <td>{element.tema}</td>
                                            <td>{element.publico_alvo}</td>
                                            <td>Lalalala</td>
                                            <td><button>Editar</button></td>
                                            <td><button>Apagar</button></td>
                                        </tr>
                                )
                            })}
                        </tr>
                    </tbody>
                </table>
    
            </div>
        )
}

export default Eventos;