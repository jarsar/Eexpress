var mongoose_order=require('mongoose');

var OrderSchema = new mongoose_order.Schema({
  name:String,
  stunum:String,
  QQnum:String,
  dormitory:String,
  doornum:String,
  level:String,
  merchandise:String,
  expressname:String,
  shelves:String,
  expressnum:String,
  reward:String,
  freetimestart:String,
  freetimeend:String
});

module.exports=mongoose_order.model("Order",OrderSchema);
