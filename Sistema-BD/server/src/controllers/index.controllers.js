const {Pool} = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: 'a1b2c3d4',
    database: 'Gerenciador_de_eventos',
    port: '5432'
})

const getCoisa = async (req, res) => {
    const query = "SELECT * FROM tabela";
    const response = await pool.query(query);
    res.status(200).json(response.rows);
}

const createCoisa = async (req, res) => {
    let nome = req.body.nome;
    let categoria = req.body.categoria;

    const query = "INSERT INTO tabela (nome, categoria) VALUES ('" + nome + "', '" + categoria + "')";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            console.log("Show")
        }
    });
}

module.exports = {
    /* exporta as funções */
}