import React from 'react';
import {Link} from 'react-router-dom';

function BotaoForm(props) {
    return (
        <div>
            <Link to={props.rota}><button renderAs={Link} style={buttonStyle}>Cadastrar</button></Link>
        </div>
    )
}

const buttonStyle = {
    alingSelf: 'flex-end'
}

export default BotaoForm;