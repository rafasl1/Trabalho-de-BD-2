import React, { useState, useEffect } from 'react';
import axios from 'axios';
import {Link} from 'react-router-dom';
import Modal from 'react-modal';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';
import '../pages/styles/Tabela.css';

// Make sure to bind modal to your appElement (http://reactcommunity.org/react-modal/accessibility/)
//Modal.setAppElement('#yourAppElement')
// IMPORTANTEEEEEEEEEEEEEEEEEEEEEEEEEE

function Eventos() {

    const [modalIsOpen, setIsOpen] = React.useState(false);
    const [listaEventos, setListaEventos] = useState([])
    const [listaPatrocinadores, setListaPatrocinadores] = useState([])

    const getEventos = async () => {
        const response = await axios.get("http://localhost:3001/Eventos")
        setListaEventos(response.data.rows)
    }
    useEffect(getEventos, [])

    const delEventos = (id) => {

        let confirmDelete = window.confirm('Tem certeza que deseja deletar esse item?')
        if (confirmDelete) {
            axios.delete("http://localhost:3001/removeEventos/" + id)
            setListaEventos(listaEventos.filter(evento => evento.id !== id))
        }
    }

    const delPatrocinio = (id) => {
        let evento = id[0]
        let entidade = id[1]

        axios.delete("http://localhost:3001/removePatrocinio/" + evento + "/" + entidade)
        setListaPatrocinadores(listaPatrocinadores.filter(element => element.entidade_id !== entidade))
    }

    const getPatrocinio = async(id) => {
        console.log('xuxu beleza')
        const response = await axios.get("http://localhost:3001/Patrocinio/" + id)
        setListaPatrocinadores(response.data.rows)
    }

    async function openModal (id) {
        await getPatrocinio(id)
        setIsOpen(true);
    }

    function closeModal() {
        setIsOpen(false);
    }

    return (
        <div>

            <div className="topo">
                <h1>Eventos</h1>
                <BotaoForm rota="/formEvento" />
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
                                <td><button className="botaoSecundario" onClick={() => { openModal(element.id) }}>Ver patrocinadores</button></td>
                                {<td><Link to={"/editEvento/" + element.id}><button className="botaoSecundario">Editar</button></Link></td>}
                                {/* <td><button className="botaoSecundario" ><Link to={{
                                        pathname: '/editEvento',
                                        state: [{id: openModal(element.id)}]
                                    }}>Editar</Link></button></td> */}
                                <td><button className="botaoSecundario" onClick={() => { delEventos(element.id) }}>Apagar</button></td>
                            </tr>
                        )
                    })}
                </table>
            </div>

            <div className="modal-container">
                <Modal
                    isOpen={modalIsOpen}
                    onRequestClose={closeModal}
                    contentLabel="Example Modal"
                >
                    <div className="modal-button-container">
                    <button className="modal-button" onClick={closeModal}>Fechar</button>
                    </div>
                    <h1>Patrocinadores do evento</h1>
                    <div className="table-container">
                <table>
                    <tr>
                        <th>Entidade</th>
                        <th>Taxa</th>
                        <th>Categoria</th>
                    </tr>

                    {listaPatrocinadores.map(element => {
                        return (
                            <tr>
                                <td>{element.entidade_nome}</td>
                                <td>{element.taxa}</td>
                                <td>{element.categoria}</td>
                                <td><button className="botaoSecundario">Editar patrocínio</button></td>
                                <td><button className="botaoSecundario" onClick={() => { delPatrocinio([element.evento_id, element.entidade_id]) }}>Apagar</button></td>
                            </tr>
                        )
                    })}
                </table>
                <button className="botaoSecundario">Adicionar patrocínio</button>
            </div>
                </Modal>
            </div>

        </div>
    )
}

export default Eventos;