const mongoose = require("mongoose");
var transactionSchema = new mongoose.Schema({
    FarmerId: String,
    BuyerId: String,
    Status:String,
});
 

module.exports = new mongoose.model('Transaction', transactionSchema);