const { Router } = require('express');
const router = Router(); // objeto que permite definir as rotas

const { getEventos, addEventos, removeEventos, updateEventos, getEventoEspecifico, getLastEventoId } = require('./controllers/eventoControllers')
const { getPatrocinadores, addPatrocinador, removePatrocinador, updatePatrocinador, getPatrocinadorEspecifico, getLastPatrocinadorId } = require('./controllers/patrocinadoresControllers')
const { getPatrocinio, getPatrocinioPelaEntidade, addPatrocinio, addPatrocinioPelaEntidade, removePatrocinio, updatePatrocinio } = require('./controllers/patrocinioControllers')

router.get('/', (request, response) => response.json({ message: "Bem vinda(o) à API do trabalho" }))

router.get('/Eventos', getEventos);
router.get('/adicionaEventos', addEventos);
router.get('/eventoLastId', getLastEventoId);
router.get('/removeEventos/:id', removeEventos);
router.get('/updateEventos', updateEventos);
router.get('/eventoEspecifico/:id', getEventoEspecifico);

router.get('/Patrocinadores', getPatrocinadores);
router.get('/adicionaPatrocinador', addPatrocinador);
router.get('/patrocinadorLastId', getLastPatrocinadorId);
router.get('/removePatrocinador/:id', removePatrocinador);
router.get('/updatePatrocinador', updatePatrocinador);
router.get('/patrocinadorEspecifico/:id', getPatrocinadorEspecifico);

router.get('/Patrocinio/:id', getPatrocinio);
router.get('/PatrocinioPelaEntidade/:id', getPatrocinioPelaEntidade);
router.get('/adicionaPatrocinio', addPatrocinio);
router.get('/adicionaPatrocinioPelaEntidade', addPatrocinioPelaEntidade);
router.get('/removePatrocinio/:evento/:entidade', removePatrocinio);
router.get('/updatePatrocinio', updatePatrocinio);

module.exports = router;