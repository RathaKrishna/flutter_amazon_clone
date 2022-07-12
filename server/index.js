// IMPORT from packages
const express = require('express'); // import express
const mongoose = require('mongoose');
const addressRouter = require('./routes/address');
const adminRouter = require('./routes/admin');

// IMPORT from other files
const authRouter = require('./routes/auth');
const productRouter = require('./routes/products');
const userRouter = require('./routes/user');
 

// INIT
const PORT = process.env.PORT || 3000 // specify port number
const app = express(); // initialize express
const DB = "mongodb+srv://***" // Please Enter your MongoDB URL
// Middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
app.use(addressRouter);

// Connections
mongoose.connect(DB)
    .then(() => {
    console.log("Connection MongoDb Successful");
}).catch((e) => { 
    console.log(e)
 });



app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
}); // listen for connections, 0.0.0.0 => connect from anywhere

