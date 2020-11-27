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
            /* console.log("Show") */
            /* console.log(result.rows) */
            res.send(result)
        }
    });
    /* console.log(res.json(response)) */
    /* res.status(200).json(response); */
}

module.exports = {
    getPatrocinadores
}