const { Router } = require('express');
const router = Router(); // objeto que permite definir as rotas

const { getEventos, addEventos, removeEventos, updateEventos, getEventoEspecifico, getLastEventoId } = require('./controllers/eventoControllers')
const { getPatrocinadores, addPatrocinador, removePatrocinador, updatePatrocinador, getPatrocinadorEspecifico, getLastPatrocinadorId } = require('./controllers/patrocinadoresControllers')
const { getPatrocinio, getPatrocinioPelaEntidade, addPatrocinio, addPatrocinioPelaEntidade, removePatrocinio, updatePatrocinio } = require('./controllers/patrocinioControllers')

router.get('/', (request, response) => response.json({ message: "Bem vinda(o) à API do trabalho" }))

router.get('/Eventos', getEventos);
router.post('/adicionaEventos', addEventos);
router.get('/eventoLastId', getLastEventoId);
router.delete('/removeEventos/:id', removeEventos);
router.put('/updateEventos', updateEventos);
router.get('/eventoEspecifico/:id', getEventoEspecifico);

router.get('/Patrocinadores', getPatrocinadores);
router.post('/adicionaPatrocinador', addPatrocinador);
router.get('/patrocinadorLastId', getLastPatrocinadorId);
router.delete('/removePatrocinador/:id', removePatrocinador);
router.put('/updatePatrocinador', updatePatrocinador);
router.get('/patrocinadorEspecifico/:id', getPatrocinadorEspecifico);

router.get('/Patrocinio/:id', getPatrocinio);
router.get('/PatrocinioPelaEntidade/:id', getPatrocinioPelaEntidade);
router.post('/adicionaPatrocinio', addPatrocinio);
router.post('/adicionaPatrocinioPelaEntidade', addPatrocinioPelaEntidade);
router.delete('/removePatrocinio/:evento/:entidade', removePatrocinio);
router.put('/updatePatrocinio', updatePatrocinio);

module.exports = router;