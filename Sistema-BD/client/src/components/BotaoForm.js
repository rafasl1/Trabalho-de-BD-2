import React from 'react';
import {Link} from 'react-router-dom';
import '../pages/styles/Geral.css';

function BotaoForm(props) {
    return (
        <div>
            <Link to={props.rota}><button className="botaoPrincipal" renderAs={Link} onClick={console.log(props.rota)} >Cadastrar</button></Link>
        </div>
    )
}

/*const buttonStyle = {
    alingSelf: 'flex-end'
}*/

export default BotaoForm;