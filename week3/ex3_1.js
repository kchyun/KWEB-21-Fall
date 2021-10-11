const express = require('express');

const app = express();
const port = 3000;


app.use(express.urlencoded({ extended: true }));


app.get('/', (req, res) => {
    res.send(Object.keys(req.query).map(k => `${k}: ${req.query[k]}`).join('\n'));
});

app.post('/', (req, res) => {
    res.send(Object.keys(req.query).map(k => `${k}: ${req.query[k]}`).join('\n'));
});

app.put('/', (req, res) => {
    res.send(Object.keys(req.query).map(k => `${k}: ${req.query[k]}`).join('\n'));
});

app.delete('/', (req, res) => {
    res.send(Object.keys(req.query).map(k => `${k}: ${req.query[k]}`).join('\n'));
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));