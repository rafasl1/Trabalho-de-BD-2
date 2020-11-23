import React, {useState, useEffect} from 'react';
import axios from 'axios';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';
import '../pages/styles/Tabela.css';

function Eventos() {

    const [listaEventos, setListaEventos] = useState([])
    
    const getEventos = async() => {
        const response = await axios.get("http://localhost:3001/Eventos")
            
        console.log('entrou pro back')
        setListaEventos(response.data.rows)
    }

    useEffect(getEventos, [])
    
        return (
            <div>

                <div className="topo">
                    <BotaoForm rota="http://localhost:3000/formEvento/formEvento"/>
                    <h1>Eventos</h1>
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
                                            <td><button className="botaoSecundario">Ver patrocinadores</button></td>
                                            <td><button className="botaoSecundario">Editar</button></td>
                                            <td><button className="botaoSecundario">Apagar</button></td>
                                        </tr>
                                )
                            })}
                        
                    
                </table>
                        
                        
                </div>
    
            </div>
        )
}

export default Eventos;