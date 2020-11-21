import React from 'react';

function FormularioPatrocinadores() {
    return (
        <div>
            <h1>Formulario de Patrocinadores</h1>
            <form>
                <div>
                    <label>Nome:
                    <input type="text"/>
                    </label>
                </div>

                <div>
                    <label>Endereço:
                    <input type="text"/>
                    </label>
                </div>

                <div>
                    <label>Telefone:
                    <input type="text"/>
                    </label>
                </div>

                <div>
                    <label>Email:
                    <input type="text"/>
                    </label>
                </div>

                <input type="submit" value="Enviar" />
                
            </form>
        </div>
    )
}

export default FormularioPatrocinadores;