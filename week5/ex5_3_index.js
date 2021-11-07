const {runQuery} = require('./runQuery');
const express = require('express');

const app = express();
const port = 3000;


app.get('/fare', async (req, res) => {
    try{
        const { uid } = req.query;
        console.log(`uid = ${uid}`);
        const {name, fare} = (await runQuery(`select users.name, round(types.fare_rate * trains.distance / 1000, -2) as fare 
        from users 
            inner join tickets on users.id = tickets.user and users.id = ${uid} 
            inner join trains on tickets.train = trains.id 
            inner join types on types.id = trains.type;`))[0];
        return res.send(`Total fare for ${name} is ${fare} KRW.`);
    } catch(err){
        console.error(err);
        return res.sendStatus(500);
    }
});

app.get('/train/status', async (req, res) => {
    try{
        const { tid } = req.query;
        const {occupied, maximum} = (await runQuery(`select count(tickets.id) as occupied, types.max_seats as maximum
        from trains
            inner join stations as src on trains.source = src.id
            inner join stations as dst on trains.destination = dst.id
            join types on trains.type = types.id
            join tickets on tickets.train = trains.id
        where trains.id = ${tid}
        group by trains.id;`))[0];
        if(occupied < maximum){
            return res.send(`Train ${tid} is not sold out`);
        }
        else{
            return res.send(`Train ${tid} is sold out`);
        }
    } catch(err){
        console.error(err);
        return res.sendStatus(500);
    }
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));