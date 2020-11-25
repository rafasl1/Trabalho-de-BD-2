const {Pool} = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: 'a1b2c3d4',
    database: 'Gerenciador_de_eventos',
    port: '5432'
})

const getPatrocinio = async (req, res) => {
    console.log('entrou pra pegar')

    let id = req.params.id;

    const query = "SELECT entidade_nome, taxa, categoria FROM patrocina WHERE evento_id = '" + id + "'";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } else {
            /* console.log("Show") */
            console.log(result.rows)
            res.send(result)
        }
    });
    /* console.log(res.json(response)) */
    /* res.status(200).json(response); */
}

module.exports = {
    getPatrocinio
}