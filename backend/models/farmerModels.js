const mongoose = require("mongoose");
var farmersSchema = new mongoose.Schema({
    Name: String,
    AccNo: String,
    Pin:String,
    Phone:String,
    Password: String,
});
 

module.exports = new mongoose.model('Farmers', farmersSchema);