const {Pool} = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: 'a1b2c3d4',
    database: 'Gerenciador_de_eventos',
    port: '5432'
})

const getEventos = async (req, res) => {
    const query = "SELECT * FROM evento";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            /* console.log("Show") */
            res.send(result)
        }
    });
    /* console.log(res.json(response)) */
    /* res.status(200).json(response); */
}

const addEventos = async (req, res) => {
    let nome = req.body.nome;
    let edicao = req.body.edicao;
    let tema = req.body.tema;
    let publicoAlvo = req.body.publicoAlvo;

    console.log('chegou aqui')

    const query = "INSERT INTO EVENTO (Nome, Edicao, Tema, Publico_Alvo) VALUES ('" + nome + "', '" + edicao + "', '" + tema + "', '" + publicoAlvo + "')";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            console.log("Show")
        }
    }); 
}

const removeEventos = async (req, res) => {
    console.log('chegou aqui')
    let id = req.params.id;
    console.log(id)

    const query = "DELETE FROM EVENTO WHERE Id = '" + id + "'" ;
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            console.log("Show")
        }
    });
}

const getEventoEspecifico = async (req, res) => {
    let id = req.params.id;

    const query = "SELECT * FROM evento WHERE id = '" + id + "'";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            res.send(result)
        }
    });
}

const updateEventos = async (req, res) => {
    let id = req.body.id;
    let nome = req.body.nome;
    let edicao = req.body.edicao;
    let tema = req.body.tema;
    let publicoAlvo = req.body.publicoAlvo;

    const query = "UPDATE EVENTO SET Nome = '" + nome + "', Edicao = '" + edicao + "', Tema = '" + tema + "', Publico_Alvo = '" + publicoAlvo + "' WHERE id = '" + id + "'";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            console.log("Show")
        }
    });
}

module.exports = {
    getEventos,
    addEventos,
    removeEventos,
    updateEventos,
    getEventoEspecifico
}