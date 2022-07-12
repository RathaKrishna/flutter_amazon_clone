const express = require('express'); // import express
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const auth = require('../middlewares/auth');

const authRouter = express.Router();


// Sign up route
authRouter.post('/api/signup', async (req, res) => {
    try {
        // Get the data from user
        const { name, email, password } = req.body;
        // validate data
        const existingUser = await User.findOne({ email }); // check if email already exists
        if (existingUser) {
            return res
                .status(400)
                .json({ msg: 'User with same email already exists!' });
        }
        // post the data in database
       const hashedPassword = await bcryptjs.hash(password, 8);
        let user = new User({
            email,
            password: hashedPassword,
            name,
        });
        user = await user.save();
        res.json(user);
        // return status to user
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Sign in route

authRouter.post('/api/login', async (req, res) => { 
    try {
    //Get the data from user
    const {email, password} = req.body
    // check if login details
    const user = await User.findOne({ email });
    if (!user) {
         return res
                .status(400)
                .json({ msg: 'User does not exists!' });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
        return res
                .status(400)
                .json({ msg: 'Wrong password!' });
    }
    //respond to client
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
} catch (e) {
    res.status(500).json({ error: e.message });
    }
});

// validate token
authRouter.post('/tokenIsValid', async (req, res) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) return res.json(false);
        const verified = jwt.verify(token, "passwordKey");
        if (!verified) return res.json(false);

        const user = await User.findById(verified.id);
        if (!user) return res.json(false);
        res.json(true);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// get user data
authRouter.get('/', auth, async (req, res) => {
    const user = await User.findById(req.user);

    res.json({ ...user._doc, token: req.token });

});
module.exports = authRouter;