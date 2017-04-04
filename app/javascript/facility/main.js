import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Route, browserHistory } from 'react-router';
import App from './App';
import Facilities from './facilities_main.jsx';


ReactDOM.render(
  <Router history={browserHistory}>
    <Route path="/facilities" component={App} />
    <Route path="/facility/:fac_nbr" component={Facilities} />
  </Router>,
  document.getElementById('root'),
);
