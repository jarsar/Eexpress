var mongoose_evaluation=require('mongoose');

var EvaluationSchema = new mongoose_evaluation.Schema({
  merchandise:String,
  name:String,
  stunum:String,
  anotherstunum:String,
  level:String
});

module.exports=mongoose_evaluation.model("Evaluation",EvaluationSchema);
