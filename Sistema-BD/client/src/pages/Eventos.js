import React from 'react';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';

function Eventos() {
    return (
        <div className="container-tabelas">
            <div className="topo">
                <BotaoForm rota="/formEvento"/>
                <h1>Eventos</h1>
            </div>
        </div>
    )
}

export default Eventos;