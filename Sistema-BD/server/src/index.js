const express = require('express');
const app = express();
const cors = require('cors');

//Middlewars
app.use(cors());

// app.use((req, res, next) => {
//     res.header("Access-Control-Allow-Origin", "*");
//     res.header("Access-Control-Allow-Methods", ['GET', 'PUT', 'POST', 'DELETE']);
//     res.header('Access-Control-Allow-Headers', 'Content-Type');
//     next();
// });
app.use(express.json()); //permite receber dados do cliente em fortato json
app.use(express.urlencoded({ extended: false })); //recebe dados por fomularios

//Rotas
app.use(require('./routes'));

const port = process.env.PORT || 3001;

app.listen(port, () => {
    console.log("Rodando na porta 3001");
})