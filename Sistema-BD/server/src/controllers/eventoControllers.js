const { Pool } = require('pg');

const pool = new Pool({
    host: 'motty.db.elephantsql.com',
    user: 'vnyspson',
    password: 'dScNDBzo2EsRd4zXvx4NosDeqwt3IMwI',
    database: 'vnyspson'
})

const getEventos = async (req, res) => {
    const query = "SELECT * FROM evento";
    const response = await pool.query(query, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            res.send(result)
        }
    });
}

const addEventos = async (req, res) => {
    let nome = req.body.nome;
    let edicao = req.body.edicao;
    let tema = req.body.tema;
    let publicoAlvo = req.body.publicoAlvo;
    let idInserido;

    const query = "INSERT INTO EVENTO (Nome, Edicao, Tema, Publico_Alvo) VALUES ('" + nome + "', '" + edicao + "', '" + tema + "', '" + publicoAlvo + "')";
    const response = await pool.query(query, async (err, result) => {
        if (err) {
            console.log(err)
        } else {
            res.send(result)
        }
    });

}

const getLastEventoId = async (req, res) => {
    const query = "SELECT currval(pg_get_serial_sequence('evento','id'));";
    const response = await pool.query(query, (err, result) => {
        if (err) {
            console.log(err)
        } else {
            res.send(result.rows[0].currval)
        }
    });
}

const removeEventos = async (req, res) => {
    let id = req.params.id;

    const query2 = "DELETE FROM patrocina WHERE evento_id = '" + id + "'";
    const response2 = await pool.query(query2, (err, result) => {
        if (err) {
            console.log(err)
        }
    });

    const query = "DELETE FROM EVENTO WHERE Id = '" + id + "'";
    const response = await pool.query(query, (err, result) => {
        if (err) {
            console.log(err)
        }
    });
}

const getEventoEspecifico = async (req, res) => {
    let id = req.params.id;

    const query = "SELECT * FROM evento WHERE id = '" + id + "'";
    const response = await pool.query(query, (err, result) => {
        if (err) {
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
        if (err) {
            console.log(err)
        }
    });
}

module.exports = {
    getEventos,
    addEventos,
    getLastEventoId,
    removeEventos,
    updateEventos,
    getEventoEspecifico
}