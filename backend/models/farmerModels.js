const mongoose = require("mongoose");
var farmersSchema = new mongoose.Schema({
    Name: String,
    AccNo: String,
    Pin:String,
    Phone:String,
    Crops: ({
        name:String,
        price:String,
        stock:String,
    })
});
 

module.exports = new mongoose.model('Farmers', farmersSchema);