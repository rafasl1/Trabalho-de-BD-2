const { Router } = require('express');
const router = Router(); // objeto que permite definir as rotas

const { getEventos, addEventos, removeEventos, updateEventos, getEventoEspecifico, getLastEventoId } = require('./controllers/eventoControllers')
const { getPatrocinadores } = require('./controllers/patrocinadoresControllers')
const { getPatrocinio, addPatrocinio, removePatrocinio, updatePatrocinio } = require('./controllers/patrocinioControllers')

router.get('/', (request, response) => response.json({ message: "Bem vinda(o) à API do trabalho" }))

router.get('/Eventos', getEventos);
router.post('/adicionaEventos', addEventos);
router.get('/eventoLastId', getLastEventoId);
router.delete('/removeEventos/:id', removeEventos);
router.put('/updateEventos', updateEventos);
router.get('/eventoEspecifico/:id', getEventoEspecifico);

router.get('/Patrocinadores', getPatrocinadores);
/*router.post('/adicionaPatrocinadores', addPatrocinadores);
router.delete('/removePatrocinadores:id', removePatrocinadores);
router.put('/updatePatrocinadores:id', updatePatrocinadores); */

router.get('/Patrocinio/:id', getPatrocinio);
router.post('/adicionaPatrocinio', addPatrocinio);
router.delete('/removePatrocinio/:evento/:entidade', removePatrocinio);
router.put('/updatePatrocinio', updatePatrocinio);

module.exports = router;