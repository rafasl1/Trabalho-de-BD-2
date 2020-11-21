import React from 'react';
import {Link} from 'react-router-dom';

function Header() {
    return (
        <>
            <header style={headerStyle} >
                <h1>Administrador de Eventos</h1>
                <Link style={linkStyle} to="/">Eventos</Link> | <Link style={linkStyle} to="/patrocinadores">Patrocinadores</Link> 
            </header>
            
        </>
    )
}

const headerStyle = {
    background: '#333',
    color: '#fff',
    textAlign: 'center',
    padding: '10px'
}

const linkStyle = {
    color: '#fff',
    textDecoration: 'none'
}

export default Header;