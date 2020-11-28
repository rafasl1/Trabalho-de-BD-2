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
    let taxa_patrocinios = req.body.taxa_patrocinios;
    let categoria_patrocinios = req.body.categoria_patrocinios;
    let taxa;
    let categoria;

    dados_entidade.forEach(async element => { 

        taxa_patrocinios.forEach(item => {
            console.log('No array da taxa:' + item)
            if(item.id === element.id) taxa = item.value
        })

        categoria_patrocinios.forEach(item => {
            console.log('No array do patrocinio:' + item)
            if(item.id === element.id) categoria = item.value
        })

        const query = "INSERT INTO patrocina (evento_id, evento_nome, entidade_id, entidade_nome, taxa, categoria) VALUES ('" + id_evento + "', '" + nome_evento + "', '" + element.id + "', '" + element.nome + "', '" + taxa + "', '" + categoria + "')";
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