import React, { Component } from 'react';
import {BrowserRouter as Router, Route} from 'react-router-dom';
import './App.css';
import Header from './components/layouts/Header';
import Eventos from './pages/Eventos';
import Patrocinadores from './pages/Patrocinadores'
import FormularioEvento from './pages/FormularioEvento'
import FormularioPatrocinadores from './pages/FormularioPatrocinadores'
import EditaEventos from './pages/EditaEventos'


class App extends Component {

  render() {
    return (
      <Router>
        <div className="App">
          <div className="container">
            <Header />
            <Route exact path="/" component={Eventos} />
            <Route path="/patrocinadores" component={Patrocinadores} />
            <Route path="/formEvento" component={FormularioEvento} />
            <Route path="/formPatrocinadores" component={FormularioPatrocinadores} />
            <Route path="/editEvento/:id" component={EditaEventos} />
          </div>

        </div>
      </Router>
      
    );
  }
}

export default App;
