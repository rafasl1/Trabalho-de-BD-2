import React, {Component, useState} from 'react';
import axios from 'axios';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';

class Eventos extends Component {

    const [listaEventos, setListaEventos] = useState([]);

    listaEventos= () => {
        const [listaEventos, setListaEventos] = useState([]);
     }

    getEventos = () => {
        axios.get("http://localhost:3001/Eventos").then((response) => {
            /* console.log(response.data.rows) */
            setListaEventos(response.data.rows)
            /* console.log(listaEventos) */
            listaEventos.forEach(element => {
                console.log(element)
            });
        });
    }

    listEventos = () => {
        listaEventos.forEach(element => {
            return (
                <>
                <h1>Teste</h1>
                    <td>{element.nome}</td>
                    <td>{element.edicao}</td>
                    <td>{element.tema}</td>
                    <td>{element.publico_alvo}</td>
                    <td>Lalalala</td>
                    <td><button>Editar</button></td>
                    <td><button>Apagar</button></td>
                </>
            )
        });
        
            /* listaEventos.map((value, index) => {
                return (
                    <>
                    <h1>Teste</h1>
                        <td key={index}>{value.nome}</td>
                        <td key={index}>{value.edicao}</td>
                        <td key={index}>{value.tema}</td>
                        <td key={index}>{value.publico_alvo}</td>
                        <td>Lalalala</td>
                        <td><button>Editar</button></td>
                        <td><button>Apagar</button></td>
                    </>
                )
            }) */
        
    }

    render() {
        return (
            <div className="container-tabelas">
                <div className="topo">
                    <BotaoForm rota="/formEvento"/>
                    <h1>Eventos</h1>
                </div>
                {/* <button onClick={getEventos}>Teste</button> */}
                {getEventos}
    
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
                    <tr>
                        {/* listaEventos.forEach(element => {
                            return (
                                <>
                                <h1>Teste</h1>
                                    <td>{element.nome}</td>
                                    <td>{element.edicao}</td>
                                    <td>{element.tema}</td>
                                    <td>{element.publico_alvo}</td>
                                    <td>Lalalala</td>
                                    <td><button>Editar</button></td>
                                    <td><button>Apagar</button></td>
                                </>
                            )
                        }) */}
                        {/* listaEventos.map((value, index) => {
                            return (
                                <>
                                <h1>Teste</h1>
                                    <td key={index}>{value.nome}</td>
                                    <td key={index}>{value.edicao}</td>
                                    <td key={index}>{value.tema}</td>
                                    <td key={index}>{value.publico_alvo}</td>
                                    <td>Lalalala</td>
                                    <td><button>Editar</button></td>
                                    <td><button>Apagar</button></td>
                                </>
                            )
                        }) */}
                        {listEventos}
                        {/* <td>Jill</td>
                        <td>Smith</td>
                        <td>50</td> */}
                    </tr>
                </table>
    
                {/* {listaEventos.map((val, key) => {
                    return <div>{val.nome}</div>
                })} */}
            </div>
        )
    }

    
}

export default Eventos;