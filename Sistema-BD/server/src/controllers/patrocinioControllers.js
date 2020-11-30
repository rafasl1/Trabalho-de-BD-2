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

    const query = "SELECT * FROM patrocina WHERE evento_id = '" + id + "'";
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
            if(item.id === element.id) taxa = item.value
        })

        categoria_patrocinios.forEach(item => {
            if(item.id === element.id) categoria = item.value
        })

        console.log(taxa)
        console.log(categoria)

        const query = "INSERT INTO patrocina (evento_id, evento_nome, entidade_id, entidade_nome, taxa, categoria) VALUES ('" + id_evento + "', '" + nome_evento + "', '" + element.id + "', '" + element.nome + "', '" + taxa + "', '" + categoria + "')";
        const response = await pool.query(query, async(err, result) => {
        if(err) {
            console.log(err)
        } 
    });  
      });  
}

const addPatrocinioPelaEntidade = async (req, res) => {

    let id_entidade = req.body.id_entidade; 
    let nome_entidade = req.body.nome_entidade;
    let dados_evento = req.body.dados_evento;
    let taxa_patrocinios = req.body.taxa_patrocinios;
    let categoria_patrocinios = req.body.categoria_patrocinios;
    let taxa;
    let categoria;

    dados_evento.forEach(async element => { 

        taxa_patrocinios.forEach(item => {
            if(item.id === element.id) taxa = item.value
        })

        categoria_patrocinios.forEach(item => {
            if(item.id === element.id) categoria = item.value
        })

        const query = "INSERT INTO patrocina (evento_id, evento_nome, entidade_id, entidade_nome, taxa, categoria) VALUES ('" + element.id+ "', '" + element.nome + "', '" + id_entidade  + "', '" + nome_entidade + "', '" + taxa + "', '" + categoria + "')";
        const response = await pool.query(query, async(err, result) => {
        if(err) {
            console.log(err)
        } 
    });  
      });  
}

const removePatrocinio = async (req, res) => {
    let evento_id = req.params.evento;
    let entidade_id = req.params.entidade;

    const query = "DELETE FROM patrocina WHERE evento_id = '" + evento_id + "' AND entidade_id = '" + entidade_id + "'";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } 
    });
}

const updatePatrocinio = async (req, res) => {
    let id_evento = req.body.id_evento;
    let id_patrocinador = req.body.id_patrocinador;
    let taxa = req.body.taxa;
    let categoria = req.body.categoria;

    const query = "UPDATE patrocina SET taxa = '" + taxa + "', categoria = '" + categoria + "' WHERE evento_id = '" + id_evento + "' AND entidade_id = '" + id_patrocinador + "'";
    const response = await pool.query(query, (err, result) => {
        if(err) {
            console.log(err)
        } 
    });
}

module.exports = {
    getPatrocinio,
    addPatrocinio,
    addPatrocinioPelaEntidade,
    removePatrocinio,
    updatePatrocinio
}