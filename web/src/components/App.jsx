import React from "react";
import {
    GoogleMap,
    useLoadScript,
    Marker,
    InfoWindow,
} from '@react-google-maps/api';
import { formatRelative } from 'date-fns';

import '@reach/combobox/styles.css';
import mapStyles from "./mapStyles";


const KEY = "AIzaSyC1ZKXrbb__T-dBzt85y1dORbCkhNJ7Y0Q";
const libraries = ["places"];
const mapContainerStyle={
    with : "100vm",
    height : "100vh", 
};
const center={ //chage this to center by user location
    lat : 9.93759,
    lng : -84.10118,
};
const options = {
    styles : mapStyles,
    disableDefaultUI: true,
    zoomControl : true,
};

export function App(){
    const {isLoaded, loadError} = useLoadScript({
        googleMapsApiKey: KEY,
        libraries, 
    });

    if (loadError) return "Error loading maps";
    if (!isLoaded) return "Loading map"
    return (<div>
        <GoogleMap
        mapContainerStyle={mapContainerStyle} 
        zoom={8}
        center={center}
        options ={options}
        onClick ={(event) => {
            console.log(event);
        }}
        ></GoogleMap>
    </div>);
}