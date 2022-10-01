const mongoose = require("mongoose");
var buyersSchema = new mongoose.Schema({
    Name: String,
    Phone: String,
    Pincode:String,
  
});
 

module.exports = new mongoose.model('Buyers', buyersSchema);