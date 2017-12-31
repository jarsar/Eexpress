var mongoose_receive=require('mongoose');

var ReceiveSchema = new mongoose_receive.Schema({
  merchandise:String,

  oname:String,
  ostunum:String,
  oQQnum:String,
  odormitory:String,
  odoornum:String,
  olevel:String,

  rname:String,
  rstunum:String,
  rQQnum:String,
  rdormitory:String,
  rdoornum:String,
  rlevel:String
});

module.exports=mongoose_receive.model("Receive",ReceiveSchema);
