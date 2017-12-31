var mongoose_login=require('mongoose');

var LoginSchema = new mongoose_login.Schema({
  stunum: String,
  password:String
});

module.exports=mongoose_login.model("Login",LoginSchema);
