


const express = require('express'); //Import the express dependency
const app = express();              //Instantiate an express app, the main work horse of this server
const port = 5000;                  //Save the port number where your server will be listening

//Idiomatic expression in express to route and respond to a client request
app.get('/', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('Home.html', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/map.html', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('apimap.html', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/locations', (req, res) => {        //get requests to the root ("/") will route here
    res.json({
        lat: 9.97669,
        lng: -84.07931,
    })
});
/**
 *
 * To log in code
 *
 */

app.get('/Resource/:dir/:name', async function(req, res){
   let resource = (req.params.dir).concat('/').concat(req.params.name);
   res.sendFile(resource,{root: __dirname})
});

app.get('/Resource/:name', async function(req, res){
    let resource = (req.params.name);
    res.sendFile(resource,{root: __dirname})
});

app.listen(port, () => {            //server starts listening for any attempts from a client to connect at port: {port}
    console.log(`Now listening on port ${port}`);
});

