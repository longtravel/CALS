import React from 'react';
import ReactDOM from 'react-dom';
import App from './App.js';
import Facilities from './facilities_main.jsx';

import { Router, Route, browserHistory } from 'react-router';

ReactDOM.render(
    <Router history={browserHistory}>
        <Route path="/facilities" component={App} />
        <Route path="/facility/:fac_nbr" component={Facilities} />
    </Router>,
    document.getElementById('root'),
);
