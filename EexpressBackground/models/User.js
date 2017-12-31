var mongoose_user = require('mongoose');
var UserSchema=new mongoose_user.Schema({
  name:String,
  stunum:String,
  sex:String,
  QQnum:String,
  dormitory:String,
  doornum:String,
  level:String
});
module.exports=mongoose_user.model("User",UserSchema);
