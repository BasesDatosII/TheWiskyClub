import React from "react";
import {
    GoogleMap,
    useLoadScript,
    Marker,
    InfoWindow,
} from "@react-google-maps/api";
import { formatRelative } from "date-fns";

import "@reach/combobox/styles.css";

const libraries = ["places"];

export default function App() {
    const { isLoaded, loadError } = useLoadScript({
        googleMapsApiKey: "AIzaSyC1ZKXrbb__T-dBzt85y1dORbCkhNJ7Y0Q",
        libraries,


    });
    if (loadError) return "Error loading map";
    if (!isLoaded) return "Loading maps";


    return <div>map</div>;
}