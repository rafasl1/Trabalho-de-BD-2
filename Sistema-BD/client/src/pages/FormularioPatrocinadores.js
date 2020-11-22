import React from 'react';
import '../pages/styles/Form.css'

function FormularioPatrocinadores() {
    return (
        <div>
            <h1>Formulario de Patrocinadores</h1>
            <div>
                <form className="formsContainer">
                    <div className="itemForms">
                        <label>Nome:
                        <input type="text"/>
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Endereço:
                        <input type="text"/>
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Telefone:
                        <input type="text"/>
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Email:
                        <input type="text"/>
                        </label>
                    </div>

                    <button>Enviar</button>
                    
                </form>
            </div>
            
        </div>
    );
}

export default FormularioPatrocinadores;