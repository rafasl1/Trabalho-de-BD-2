import React, {useState, useEffect} from 'react';
import axios from 'axios';
/* import  { Redirect } from 'react-router-dom' */
import '../pages/styles/Form.css'

function FormularioEvento() {

    const [nome, setNome] = useState("");
    const [edicao, setEdicao] = useState("");
    const [tema, setTema] = useState("");
    const [publicoAlvo, setPublicoAlvo] = useState("");

    const [listaPatrocinadores, setListaPatrocinadores] = useState([]);

    const [patrocinadoresSelecionados, setPatrocinadoresSelecionados] = useState([])
    const [idNovo, setIdNovo] = useState(0);

    const getPatrocinadores = async() => {
        const response = await axios.get("http://localhost:3001/Patrocinadores")
        setListaPatrocinadores(response.data.rows)
    }

    const getLastId = async() => {
        const response = await axios.get("http://localhost:3001/eventoLastId")
        setIdNovo(response.data)
        /* adicionaPatrocinadores() */
    }

    const selectPatrocinadores = (event) => {
        let valores = event.target.name.split(',')
        let id = valores[0]
        let nome = valores[1]
        
        const x = {
            id: id,
            nome: nome
        }

        if(event.target.checked) {
            setPatrocinadoresSelecionados([...patrocinadoresSelecionados, x])
        } else {
            setPatrocinadoresSelecionados(patrocinadoresSelecionados.filter(entidade => entidade.id !== id))
        }
    }

    const adicionaEvento = async() => {

        await axios.post("http://localhost:3001/adicionaEventos", {
            nome: nome, 
            edicao: edicao,
            tema: tema,
            publicoAlvo: publicoAlvo
        }).then((response) => {
            getLastId()
        })
    }

    const adicionaPatrocinadores = async() => {
        console.log('devagar e sempre')
        console.log(idNovo)
        console.log(nome)
        console.log(patrocinadoresSelecionados)

        await axios.post("http://localhost:3001/adicionaPatrocinio", {
            id_evento: idNovo,
            nome_evento: nome, 
            dados_entidade: patrocinadoresSelecionados
        }).then(
            //Mandar de volta para página de eventos
        )
    }

    useEffect(() => {
        if(idNovo !== 0) {
            adicionaPatrocinadores()
        }
      }, [idNovo]);

    useEffect(getPatrocinadores, [])

    return (
        <div>
            <h1>Formulario de evento</h1>
            
                <form >
                <div className="formsContainer">
                    <div className="itemForms">
                        <label>Nome:
                        <input type="text"
                                onChange = {(event) => {
                                    setNome(event.target.value);
                                }} 
                        />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Edição:
                        <input type="text"
                                onChange = {(event) => {
                                    setEdicao(event.target.value);
                                }} 
                        />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Tema:
                        <input type="text"
                                onChange = {(event) => {
                                    setTema(event.target.value);
                                }} 
                        />
                        </label>
                    </div>

                    <div className="itemForms">
                        <label>Público alvo:
                        <input type="text"
                                onChange = {(event) => {
                                    setPublicoAlvo(event.target.value);
                                }} 
                        />
                        </label>
                    </div>
                    </div>

                    <div className="checkbox-container">
                    <label>Patrocinadores:</label>
                        {listaPatrocinadores.map(element => { 
                        return (
                            <div className="checkbox-element">
                                <input type="checkbox" id={element.nome} name={[element.id, element.nome]} onChange={selectPatrocinadores}/>{/* {element.nome} */}
                                <label for={element.nome}>{element.nome}</label>
                            </div>
                            )
                        })}
                    
                    </div>

                    <div className="formsContainer">
                        <button type='button' onClick={adicionaEvento}>Enviar</button>
                    </div>
                </form>
            
            
        </div>
    )
}

export default FormularioEvento;