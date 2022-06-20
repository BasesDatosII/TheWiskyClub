import React from "react";

//version 1.0

import ReactDOM from 'react-dom/client';
import {BrowserRouter} from 'react-router-dom';

import MapAPI from "./MapAPI";

const root = ReactDOM.createRoot(document.getElementById('root'));


export function App(){
    return (root.render(
    <React.StrictMode>
        <BrowserRouter>
          <React.Fragment>
            <MapAPI></MapAPI>
          </React.Fragment>
        </BrowserRouter>
    </React.StrictMode>)
    );
}