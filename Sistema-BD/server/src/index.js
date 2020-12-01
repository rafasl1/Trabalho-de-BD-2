const express = require('express');
const app = express();
const cors = require('cors');
const { urlencoded } = require('express');

//Middlewars
app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", 'GET,PUT,POST,DELETE');
    app.use(cors());
    next();
});


app.use(express.json()); //permite receber dados do cliente em fortato json
//Rotas
app.use(require('./routes'));
app.use(express.urlencoded({ extended: false }));

const port = process.env.PORT || 3001;

app.listen(port, () => {
    console.log("Rodando na porta 3001");
})