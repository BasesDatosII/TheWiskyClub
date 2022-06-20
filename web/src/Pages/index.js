const express = require('express'); //Import the express dependency
const app = express();              //Instantiate an express app, the main work horse of this server
const port = 5000;                  //Save the port number where your server will be listening

//Idiomatic expression in express to route and respond to a client request
app.get('/', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('Home.html', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/map.html', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('map.html', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/locations', (req, res) => {        //get requests to the root ("/") will route here
    res.json({
        lat: 9.97669,
        lng: -84.07931,
    })
});


app.get('/Collection.html', (req, resp) =>{
    resp.sendFile('Collection.html',{root: __dirname});
});

app.listen(port, () => {            //server starts listening for any attempts from a client to connect at port: {port}
    console.log(`Now listening on port ${port}`);
});

app.get('/images/image9.png', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('/images/image9.png', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});
app.get('/images/image7.png', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('/images/image7.png', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/images/person1.jpeg', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('/images/person1.jpeg', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/homecss', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('Home.css', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/nicepagecss', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('nicepage.css', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/jqueryjs', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('jquery.js', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/nicepagejs', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile('nicepage.js', {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});

app.get('/MapApi.jsx', (req, res) => {
    res.sendFile('components/MapApi')
});


/*document.getElementById("submitButton").addEventListener("click", function(){
    console.log(`Selecten item!`);

    var json = JSON.stringify({
        id: parseInt(this.typeId),
        subject: this.datatype,
        points: parseInt(this.points),
        user: "H. Pauwelyn"
    });
    console.log(`Selecten item!` + json);
});*/
