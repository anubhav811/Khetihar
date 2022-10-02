const express = require("express");
const farmer = require("../models/farmerModels");
const bycryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const authRouter = express.Router();
//sign up farmer
authRouter.post("/api/farmersignup", async (req, res) => {
  const { Name, AccNo, Pin, Phone, password } = req.body;
  const hashedPassword = await bycryptjs.hash(password, 8);
  let farmers = new farmer({
    Name,
    AccNo,
    Pin,
    Phone,
    password: hashedPassword,
  });
  farmers = await farmers.save();
  res.json(farmer);
});
//SIGN IN route for farmer
authRouter.post("/api/farmersignin", async (req, res) => {
  try {
    const { Phone, password } = req.body;
    const user = await farmer.findOne({ Phone });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this phone no doesn not exist" });
    }
    const isMatch = await bycryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password" });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
//sign up for buyers
authRouter.post("/api/buyersignup", async (req, res) => {
  const { Name, AccNo, Pin, Phone, password } = req.body;
  const hashedPassword = await bycryptjs.hash(password, 8);
  let farmers = new farmer({
    Name,
    Pincode,
    Phone,
    password: hashedPassword,
  });
  farmers = await farmers.save();
  res.json(farmer);
});
//sign in for buyers
authRouter.post("/api/buyersignin", async (req, res) => {
  try {
    const { Phone, password } = req.body;
    const user = await farmer.findOne({ Phone });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this phone no doesn not exist" });
    }
    const isMatch = await bycryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password" });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
authRouter.post("/api/addCrops", async (req, res) => {
  const data = req.body;
  var newItem = new itemModel(data);
  try {
    await newItem.save();
    console.log("Crop added");
    console.log(newItem);
    res.status(201).send("Crop Successfully added");
  } catch (error) {
    res.status(400).send(error);
  }
});
module.exports = authRouter;
