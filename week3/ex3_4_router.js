const { Router } = require('express');
const express = require('express');
const router = Router();

router.use(express.urlencoded({ extended: true }));

router.get('/', (req, res) => res.send(`
    <form method="post" action="/login">
        <div>
            <label>Username:</label>
            <input id="username-input" name="username" type="text">
        </div>
        <div>
            <label>Password:</label>
            <input id="password-input" name="password" type="password">
        </div>
        <button type="submit">Submit</button>
    </form>
`));

router.post('/login', (req, res) => {
    console.log(req.body)
    res.send(`username: ${req.body.username}, password: ${req.body.password}`);
});

module.exports = router;