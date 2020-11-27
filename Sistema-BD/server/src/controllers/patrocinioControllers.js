const {Pool} = require('pg');

const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: 'a1b2c3d4',
    database: 'Gerenciador_de_eventos',
    port: '5432'
})

const getPatrocinio = async (req, res) => {
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

const addPatrocinio = async (req, res) => {
    let id_evento = req.body.id_evento; 
    let nome_evento = req.body.nome_evento;
    let dados_entidade = req.body.dados_entidade;

    /* console.log(id_evento)
    console.log(nome_evento)
    console.log(dados_entidade)
    console.log('agora vamos percorrer o array') */

    dados_entidade.forEach(async element => { 
        /* console.log(element);
        console.log(element.id); 
        console.log(element.nome);  */ 
        const query = "INSERT INTO patrocina (evento_id, evento_nome, entidade_id, entidade_nome) VALUES ('" + id_evento + "', '" + nome_evento + "', '" + element.id + "', '" + element.nome + "')";
        const response = await pool.query(query, async(err, result) => {
        if(err) {
            console.log(err)
        } else {
            console.log('Fooooi' + element.id); 
        }
    });  
      });  

}

module.exports = {
    getPatrocinio,
    addPatrocinio
}