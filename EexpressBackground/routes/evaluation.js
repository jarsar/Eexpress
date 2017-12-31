var express = require('express');
var evaluation_router = express.Router();
var Evaluation = require('../models/Evaluation');
evaluation_router.post('/',function(req,res,next){
  Evaluation.create({merchandise:req.body.merchandise,
  name:req.body.name,stunum:req.body.stunum,anotherstunum:req.body.anotherstunum,level:req.body.level},
  function(err,evaluation){
    if (err) {
        return res.status(400).send("err in post /evaluation");
    } else {
        return res.status(200).json(evaluation);
    }
  });
});

evaluation_router.post('/delete',function(req,res,next){
  Evaluation.remove({merchandise:req.body.merchandise,stunum:req.body.stunum,anotherstunum:req.body.anotherstunum},
    function(err,evaluation){
    if(err){
      return res.status(400).send("err in post /evaluation");
    }else{
      return res.status(200).json(evaluation);
    }
  });
});

evaluation_router.get('/', function(req, res, next) {
  var _stunum="stunum";
  _stunum=req.query.stunum;
  var my_stunum=_stunum.substring(_stunum.indexOf("(")+2,_stunum.indexOf(")")-1);
  Evaluation.find({stunum:my_stunum},function(err, evaluation){
        if(err){
            return res.status(400).send("err in get /evaluation");
        }else{
            return res.status(200).json(evaluation);
        }
    })
});

evaluation_router.get('/test', function(req, res, next) {
  Evaluation.find({}, function(err, evaluation){
        if(err){
            return res.status(400).send("err in get /evaluation");
        }else{
            return res.status(200).json(evaluation);
        }
    })
});


// login_router.put('/resetpassword',function(req,res,next){
//     User.update({stunum:req.body.stunum},{password:req.body.password},{multi: true},function(err,resetpassword){
//       if(err){
//         return res.status(400).send("err in put /resetpassword");
//       }else{
//         return res.status(200).json(resetpassword);
//       }
//     });
// });
//
evaluation_router.delete('/test',function(req,res,next) {
  Evaluation.remove({},function(err,evaluation){
    if(err){
      return res.status(400).send("err in delete /evaluation");
    }else{
      return res.status(200).json(evaluation);
    }
  });
});
module.exports = evaluation_router;
