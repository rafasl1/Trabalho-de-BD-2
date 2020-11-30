const {Pool} = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: 'a1b2c3d4',
    database: 'Gerenciador_de_eventos',
    port: '5432'
})

const getPatrocinadores = async (req, res) => {
    const query = "SELECT * FROM entidade";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            res.send(result)
        }
    });
}

const addPatrocinador = async (req, res) => {
    let nome = req.body.nome;
    let endereco = req.body.endereco;
    let telefone = req.body.telefone;
    let email = req.body.email;

    const query = "INSERT INTO entidade (Nome, endereco, telefone, email) VALUES ('" + nome + "', '" + endereco + "', '" + telefone + "', '" + email + "')";
    const response = await pool.query(query, async(err, result) => {
        if(err) {
            console.log(err)
        } else {
            res.send(result)
        }
    }); 
}

const getLastPatrocinadorId = async (req, res) => {
    const query = "SELECT currval(pg_get_serial_sequence('entidade','id'));";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            res.send(result.rows[0].currval)
        }
    });
}

const removePatrocinador = async (req, res) => {
    let id = req.params.id;

    const query2 = "DELETE FROM patrocina WHERE entidade_id = '" + id + "'";
    const response2 = await pool.query(query2, (err, result) => {
        if(err) {
            console.log(err)
        } 
    });

    const query = "DELETE FROM entidade WHERE Id = '" + id + "'" ;
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } 
    });
}

const getPatrocinadorEspecifico = async (req, res) => {
    let id = req.params.id;

    const query = "SELECT * FROM entidade WHERE id = '" + id + "'";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            res.send(result)
        }
    });
}

const updatePatrocinador = async (req, res) => {
    let id = req.body.id;
    let nome = req.body.nome;
    let endereco = req.body.endereco;
    let telefone = req.body.telefone;
    let email = req.body.email;

    const query = "UPDATE entidade SET Nome = '" + nome + "', endereco = '" + endereco + "', telefone = '" + telefone + "', email = '" + email + "' WHERE id = '" + id + "'";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } 
    });
}

module.exports = {
    getPatrocinadores,
    addPatrocinador, 
    removePatrocinador, 
    updatePatrocinador, 
    getPatrocinadorEspecifico, 
    getLastPatrocinadorId
}