import React from "react";
import {
    GoogleMap,
    useLoadScript,
    Marker,
    InfoWindow,
} from '@react-google-maps/api';
import { formatRelative } from 'date-fns';
import './index.css';
import {Route,Link} from 'react-router-dom';

import usePlacesAutocomplete, {
    getGeocode,
    getLatlng,
} from "use-places-autocomplete";

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


export default function MapAPI(){
    const {isLoaded, loadError} = useLoadScript({
        googleMapsApiKey: KEY,
        libraries, 
    });

const onMapClick = React.useCallback((event) => {
            
            console.log(event);
            setMarkers((current)=>[
                ...current,
                {
                lat: event.latLng.lat(),
                lng: event.latLng.lng(),
                time : new Date(),
                },
            ]);
        }, []);

const mapRef = React.useRef();
const onMapLoad = React.useCallback((map)=>{
    mapRef.current = map;
}, []);
const panTo = React.useCallback(({lat, lng}) => {
    mapRef.current.panTo({lat, lng});
    mapRef.current.setZoom(14);
}, []);
    
const [selected, setSelected] = React.useState(null);


const [markers, setMarkers] = React.useState([]);


    if (loadError) return "Error loading maps";
    if (!isLoaded) return "Loading map"
    return (<div>
        <GoogleMap
        mapContainerStyle={mapContainerStyle} 
        zoom={8}
        center={center}
        options ={options}
        onClick ={onMapClick}
        onLoad = {onMapLoad}
        >
            {markers.map(marker => <Marker 
            key={marker.time.toISOString()} 
            position ={{lat :marker.lat, lng: marker.lng}}
            icon = {{
                url : '/people.svg',
                scaledSize : new window.google.maps.Size(30,30),
                origin : new window.google.maps.Point(0,0),
                anchor : new window.google.maps.Point(15,15),
            }}
            onClick={()=>{setSelected(marker)}}
            onCloseClick ={() => setSelected(null)}
            /> )}
            {selected ? (<InfoWindow 
            position={{ lat : selected.lat, lng:selected.lng}} 
            onCloseClick ={() => setSelected(null)}
                >
                <div>
                    <h2>Information</h2>
                </div>
            </InfoWindow>) : null}
        </GoogleMap>
    
    </div>);
}

