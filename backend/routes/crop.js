const express = require("express");
const cropRouter = express.Router();
const auth = require("../middleware/auth");
const { crops } = require("../models/cropModel");

productRouter.get("/api/crops/", auth, async (req, res) => {
  try {
    const crops = await crops.find({ category: req.query.category });
    res.json(crops);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = cropRouter;