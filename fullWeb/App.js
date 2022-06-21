
const express = require('express');
const app = express();

const PORT = 5000;

//set url encodee 

app.use(express.urlencoded({extended : false}));
app.use(express.json());



app.use('/src', express.static('public'));
app.use('/src', express.static(__dirname +'/public'));


app.set('view engine', 'ejs');
const bcryptjs = require('bcryptjs'); 

const session = require('express-session');

app.use(session( {
    secret : 'secret',
    resave : true,
    saveUninitialized : true
}));


app.get('/', (req, res) => {
    res.render('Home');
}); 

app.get('/view/:name', (req, res) => {
    console.log("Getting data of: "+req.params.name);
    var name = req.params.name;
    res.render(name);
}); 
app.listen(PORT, (req, res) => {
     console.log('Starting server... now listen on port'+PORT);

});

app.post('/Register#', async (req, res) =>{
    const user = req.body.user;
    const name = req.body.name;
    const surname = req.body.surname;
    const email = req.body.email;
    const pass = req.body.pass;
    const birth = req.body.birth;
    console.log(`Show data User: ${user} name: ${name} surname: ${surname} email: ${email }pass:${pass} birth: ${birth}`);
}); 