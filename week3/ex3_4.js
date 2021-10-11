const express = require('express');
const router = require('./ex3_4_router');

const app = express();

const port = 3000;

app.use(express.urlencoded({ extended : true}));
app.use('/', router);

app.listen(port, () => console.log(`Server listening on port ${port}!`));
