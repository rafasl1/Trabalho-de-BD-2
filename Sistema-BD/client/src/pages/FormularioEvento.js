import React from 'react';
import '../pages/Form.css'

function FormularioEvento() {
    return (
        <div>
            <h1>Formulario de evento</h1>
            <div>
                <form className="formsContainer">
                    <div className="itemForms">
                        <label>Nome:
                        <input type="text"/>
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Edição:
                        <input type="text"/>
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Tema:
                        <input type="text"/>
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Público alvo:
                        <input type="text"/>
                        </label>
                    </div>

                    <button>Enviar</button>
                </form>
            </div>
            
        </div>
    )
}

export default FormularioEvento;