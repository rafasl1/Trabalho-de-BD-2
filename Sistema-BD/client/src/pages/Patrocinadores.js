import React from 'react';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';

function Patrocinadores() {
    return (
        <div className="container-tabelas">
            <div className="topo">
                <BotaoForm rota="/formPatrocinadores"/>
                <h1>Patrocinadores</h1>
            </div>
        </div>
    )
}

export default Patrocinadores;