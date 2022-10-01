const mongoose = require("mongoose");
var cropSchema = new mongoose.Schema({
    Name: String,
    Price: String,
    Stock:String,
     
});
 

module.exports = new mongoose.model('Crops', cropSchema);