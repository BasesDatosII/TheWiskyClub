

/*
Created by:
Daniel Araya Sambucci
Ana Guevara
Esteban Leiva Montenegro
*/ 

const viewsDirectory = 'views'; 
const srcDirectory  = '/src';

const express = require('express'); //Import the express dependency
const app = express();              //Instantiate an express app, the main work horse of this server
const port = 5000;                  //Save the port number where your server will be listening


const bodyParser = require('body-parser');
const urlencodeParser = bodyParser.urlencoded({extended: false});

app.set('view engine', 'ejs');


app.get('/', (req, res) => {        //get requests to the root ("/") will route here
    res.sendFile(srcDirectory.concat('/Home.html'), {root: __dirname});      //server responds by sending the index.html file to the client's browser
    //the .sendFile method needs the absolute path to the file, see: https://expressjs.com/en/4x/api.html#res.sendFile
});



app.get('/locations', (req, res) => {        //get requests to the root ("/") will route here
    res.json({
        lat: 9.97669,
        lng: -84.07931,
    })
});


/*-------------------------------------General upload files--------------------------------------------------*/ 

app.get('/Resource/:dir/:name', async function(req, res){
   let resource = (req.params.dir).concat('/').concat(req.params.name);
    
    //res.render('Your-Account.ejs',{people});
    res.sendFile(resource,{root: __dirname})
});
app.get('/Resource/:dirA/:dirB/:name', async function(req, res){
   let resource = (req.params.dirA).concat('/').concat(req.params.dirB).concat('/').concat(req.params.name);
   res.sendFile(resource,{root: __dirname})
});
app.get('/Resource/:dirA/:dirB/:dirC/:name', async function(req, res){
   let resource = (req.params.dirA).concat('/')
   .concat(req.params.dirB).concat('/')
   .concat(req.params.dirC).concat('/')
   .concat(req.params.name);
   res.sendFile(resource,{root: __dirname})
});
app.get('/Resource/:name', async function(req, res){
    let resource = (req.params.name);
    res.sendFile(resource,{root: __dirname})
});

app.listen(port, () => {   //server starts listening for any attempts from a client to connect at port: {port}
    console.log(`Starting...-> Now listening port ${port}`);
});

//-------------------------------------RENDER --------------------------------------------------*/ 


 
//-------------------------------------LOG IN VIEW --------------------------------------------------*/ 
app.post('/dLogIn', urlencodeParser, function(req, res){
    console.log(req.body);
});

//-------------------------------------Collection view --------------------------------------------------*/ 

//-------------------------------------Your-account view --------------------------------------------------*/ 

app.get('/Resource/:dir/:name', urlencodeParser, function(req,res){
    console.log('using ejs');
    if(req.params.name.localeCompare('Your-Account.html')){
        console.log('Render person into acount');
        var people = {idPerson: '', name: 'Esteban' };
        res.render('Your-Account.ejs',{people});
    }
    
});


//-------------------------------------Register view  --------------------------------------------------*/ 

//-------------------------------------Cart view  --------------------------------------------------*/ 
