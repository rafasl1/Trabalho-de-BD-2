const { Router } = require('express');
const router = Router(); // objeto que permite definir as rotas

const { getEventos, addEventos, removeEventos, updateEventos } = require('./controllers/eventoControllers')
const { getPatrocinadores } = require('./controllers/patrocinadoresControllers')
const { getPatrocinio } = require('./controllers/patrocinioControllers')

router.get('/', (request, response) => response.json({ message: "Bem vindo à API do trabalho" }))

router.get('/Eventos', getEventos);
router.post('/adicionaEventos', addEventos);
router.delete('/removeEventos/:id', removeEventos);
router.put('/updateEventos/:id', updateEventos);

router.get('/Patrocinadores', getPatrocinadores);
/*router.post('/adicionaPatrocinadores', addPatrocinadores);
router.delete('/removePatrocinadores:id', removePatrocinadores);
router.put('/updatePatrocinadores:id', updatePatrocinadores); */

router.get('/Patrocinio/:id', getPatrocinio);

module.exports = router;