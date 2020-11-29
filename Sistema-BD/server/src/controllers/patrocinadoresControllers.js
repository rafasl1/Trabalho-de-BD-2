const { Pool } = require('pg');

const pool = new Pool({
    host: 'motty.db.elephantsql.com',
    user: 'vnyspson',
    password: 'dScNDBzo2EsRd4zXvx4NosDeqwt3IMwI',
    database: 'vnyspson'
})

const getPatrocinadores = async (req, res) => {
    const query = "SELECT * FROM entidade";
    const response = await pool.query(query, (err, result) => {
        if (err) {
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