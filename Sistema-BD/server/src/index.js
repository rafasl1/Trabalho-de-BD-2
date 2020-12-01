const express = require('express');
const app = express();
const cors = require('cors');
const { urlencoded } = require('express');

//Middlewars

var corsConfig = {
    origin: '*',
    methods: 'GET,PUT,POST,DELETE',
    optionsSuccessStatus: 200
}
app.use(cors(corsConfig))
app.use(express.json()); //permite receber dados do cliente em fortato json
//Rotas
app.use(require('./routes'));

const port = process.env.PORT || 3001;

app.listen(port, () => {
    console.log("Rodando na porta 3001");
})