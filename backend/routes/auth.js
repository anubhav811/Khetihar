const express = require("express");
const farmer = require("../models/farmerModels");
const bycryptjs = require('bcryptjs');
const jwt = require("jsonwebtoken");
const authRouter = express.Router();
authRouter.post("/api/farmersignup",async (req,res) => {
    const {Name, AccNo, Pin, Phone, password} = req.body;
    const hashedPassword = await bycryptjs.hash(password,8);
    let farmers = new farmer({
        Name,
        AccNo,
        Pin,
        Phone,
        password: hashedPassword,
    })
    farmers = await farmers.save();
    res.json(farmer);
});
//SIGN IN route
authRouter.post('/api/farmersignin', async(req, res) => {
    try{
        const {Phone, password} = req.body;
        const user = await farmer.findOne({ Phone});
        if(!user){
            return res.status(400).json({msg : "User with this phone no doesn not exist"});
        }
        const isMatch = await bycryptjs.compare(password, user.password);
        if(!isMatch){
            return res.status(400).json({msg : "Incorrect password"});

        }
        const token = jwt.sign({id: user._id}, "passwordKey");
        res.json({token,...user._doc});
    }catch(e){
        res.status(500).json({error: e.message});

    }
});
module.exports = authRouter;