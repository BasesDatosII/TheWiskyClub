

//version 1.0 before merge the pages with api

import React from 'react';
import ReactDOM from 'react-dom/client';

import 'bootstrap/dist/css/bootstrap.css';
import {BrowserRouter} from 'react-router-dom';


import {App} from './components/App'

const root = ReactDOM.createRoot(document.getElementById("root"));

root.render(<React.StrictMode>
        <BrowserRouter>
         <App />
        </BrowserRouter>
    </React.StrictMode>);

