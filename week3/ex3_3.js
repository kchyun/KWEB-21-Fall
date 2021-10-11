const express = require('express');
const app = express();
const port = 3000;

app.get('/factorial', (req, res) => {
    const num = req.query['number'];
    res.redirect(`/factorial/${num}`);
});

app.get('/factorial/:number', (req, res) => {
    const number = req.params.number;
    res.send(`${number}! = ${fact(number)}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));

const fact = (n) => {
    try{
        let res = 1;
        for(i=n;i>1;i--){
            res *= i;
        }
        return res;
    } catch(err){
        console.log(err);
    }
}