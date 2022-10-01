const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const PORT = 3000;
const app = express();
const DB = "mongodb+srv://krina:krina@cluster0.gwdfoty.mongodb.net/?retryWrites=true&w=majority"
//middleware
app.use(express.json())
app.use(authRouter);
//CONNECTIONS
mongoose.connect(DB).then(()=>{
    console.log("Connection Succesful");
})
.catch((e)=>{
    console.log(e);
})
app.listen(PORT,"0.0.0.0",() => {
    console.log(`connected at port ${PORT}`);
});