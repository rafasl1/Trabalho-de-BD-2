const {Pool} = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: 'a1b2c3d4',
    database: 'Gerenciador_de_eventos',
    port: '5432'
})

const getEventos = async (req, res) => {
    const query = "SELECT * FROM EVENTO";
    const response = await pool.query(query);
    if(err) {
        console.log(err);
    }
    res.status(200).json(response.rows);
}

const addEventos = async (req, res) => {
    let nome = req.body.nome;
    let edicao = req.body.edicao;
    let tema = req.body.tema;
    let publicoAlvo = req.body.publicoAlvo;

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
    let id = req.params.id;

    const query = "DELETE * FROM EVENTO WHERE Id = '" + id + "'" ;
    const response = await pool.query(query);
    if(err) {
        console.log(err);
    }
    res.status(200).json(response.rows);
}

const updateEventos = async (req, res) => {
    let id = req.params.id;

    let nome = req.body.nome;
    let edicao = req.body.edicao;
    let tema = req.body.tema;
    let publicoAlvo = req.body.publicoAlvo;

    const query = "UPDATE EVENTO SET Nome = '" + nome + "', Edicao = '" + edicao + "', Tema = '" + tema + "', Publico_Alvo = '" + publicoAlvo + "'";
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
    updateEventos
}