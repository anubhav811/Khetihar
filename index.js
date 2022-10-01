import Vonage from "@vonage/server-sdk";
const vonage = new Vonage({
    applicationId: 'a53e7228-54b6-47b9-8bf0-d9d8c94d36d0',
    privateKey: './private.key',

});
const textMessage = "Welcome to Khetihar please enter your name, mobile number, account number and pincode to register yourself";
const toNumber = '918320594656';

vonage.channel.send(
    {type: 'sms', number: toNumber},
    {type: 'sms', number: 'Vonage'},
    {
        content: {
            type: 'text',
            text: textMessage,
        },
    },
    (err, responseData) => {
        if(err){
            console.log("Message failed with error:",err);
        }
        else{
            console.log("Message sent. ")
        }
    }
);