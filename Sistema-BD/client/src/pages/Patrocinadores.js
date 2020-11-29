import React from 'react';
import BotaoForm from '../components/BotaoForm';
import '../pages/styles/Geral.css';

function Patrocinadores() {
    return (
        <div>
            <div className="topo">
                <h1>Patrocinadores</h1>
                <BotaoForm rota="/formPatrocinadores"/>
            </div>

            <div className="table-container">

            </div>
        </div>
    )
}

export default Patrocinadores;