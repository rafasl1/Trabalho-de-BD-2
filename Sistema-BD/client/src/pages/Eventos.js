import React, {useState, useEffect} from 'react';
import axios from 'axios';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';
import '../pages/styles/Tabela.css';

function Eventos() {

    const [listaEventos, setListaEventos] = useState([])
    
    const getEventos = async() => {
        const response = await axios.get("http://localhost:3001/Eventos")
        setListaEventos(response.data.rows)
    }

    const editEventos = (id) => {
        console.log('Id quando edita: ' + id)
    }

    const delEventos = (id) => {

        let confirmDelete = window.confirm('Delete item forever?')
        if(confirmDelete){
            axios.delete("http://localhost:3001/removeEventos/" + id)
            setListaEventos(listaEventos.filter(evento => evento.id !== id))
        }
    }

    function getPatrocinio(id) {
        console.log('Id quando procura patrocinadores: ' + id)
    }

    useEffect(getEventos, [])
    
        return (
            <div>

                <div className="topo">
                    <BotaoForm rota="/formEvento"/>
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
                                            <td><button className="botaoSecundario" onClick={() => {getPatrocinio(element.id)}}>Ver patrocinadores</button></td>
                                            <td><button className="botaoSecundario" onClick={() => {editEventos(element.id)}}>Editar</button></td>
                                            <td><button className="botaoSecundario" onClick={() => {delEventos(element.id)}}>Apagar</button></td>
                                        </tr>
                                )
                            })}
                        
                    
                </table>
                        
                        
                </div>
    
            </div>
        )
}

export default Eventos;