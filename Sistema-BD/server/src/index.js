const express = require('express');
const app = express();
const cors = require('cors');
const { urlencoded } = require('express');



//Middlewars
// app.use((req, res, next) => {
//     res.header("Access-Control-Allow-Origin", "*");
//     res.header("Access-Control-Allow-Methods", ['GET', 'PUT', 'POST', 'DELETE']);
//     res.header('Access-Control-Allow-Headers', 'Content-Type');
//     app.use(cors());
//     next();
// });

// app.use(express.json()); //permite receber dados do cliente em fortato json
// //Rotas
// app.use(require('./routes'));

app.use(cors());
app.use(express.json());
app.use(
    "/files",
    express.static(path.resolve(__dirname, "..", "temp", "uploads"))
);
app.use((req, res, next) => {
    console.log("\nMiddlewere\n");
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", ['Content-Type', 'Authorization']);
    res.header("Access-Control-Allow-Methods", ['GET', 'PUT', 'POST', 'DELETE', 'UPDATE']);
    next();
});
app.use(require('./routes'));

const port = process.env.PORT || 3001;

app.listen(port, () => {
    console.log("Rodando na porta 3001");
})