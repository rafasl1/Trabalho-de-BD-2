const { Router } = require('express');
const router = Router(); // objeto que permite definir as rotas

const { getEventos, addEventos, removeEventos, updateEventos } = require('./controllers/eventoControllers')
const { getPatrocinadores} = require('./controllers/patrocinadoresControllers')

router.get('/Eventos', getEventos);
router.post('/adicionaEventos', addEventos);
router.delete('/removeEventos/:id', removeEventos);
router.put('/updateEventos:id', updateEventos);

router.get('/Patrocinadores', getPatrocinadores);
/*router.post('/adicionaPatrocinadores', addPatrocinadores);
router.delete('/removePatrocinadores:id', removePatrocinadores);
router.put('/updatePatrocinadores:id', updatePatrocinadores); */

module.exports = router;