var express = require('express');
var receive_router = express.Router();
var Receive = require('../models/Receive');
receive_router.post('/',function(req,res,next){
  Receive.create({merchandise:req.body.merchandise,
  oname:req.body.oname,ostunum:req.body.ostunum,oQQnum:req.body.oQQnum,
  odormitory:req.body.odormitory,odoornum:req.body.odoornum,olevel:req.body.olevel,
  rname:req.body.rname,rstunum:req.body.rstunum,rQQnum:req.body.rQQnum,
  rdormitory:req.body.rdormitory,rdoornum:req.body.rdoornum,rlevel:req.body.rlevel},
  function(err,receive){
    if (err) {
        return res.status(400).send("err in post /receive");
    } else {
        return res.status(200).json(receive);
    }
  });
});

receive_router.post('/delete',function(req,res,next){
  Receive.remove({ostunum:req.body.ostunum,rstunum:req.body.rstunum,merchandise:req.body.merchandise},function(err,receive){
    if(err){
      return res.status(400).send("err in delete /receive");
    }else{
      return res.status(200).json(receive);
    }
  });
});

receive_router.get('/', function(req, res, next) {
  var _stunum="stunum";
  _stunum=req.query.stunum;
  var my_stunum=_stunum.substring(_stunum.indexOf("(")+2,_stunum.indexOf(")")-1);
  Receive.find({ostunum:my_stunum},function(err, receive){
        if(err){
            return res.status(400).send("err in get /receive");
        }else{
            return res.status(200).json(receive);
        }
    })
});

receive_router.get('/test', function(req, res, next) {
  Receive.find({}, function(err, receive){
        if(err){
            return res.status(400).send("err in get /receive");
        }else{
            return res.status(200).json(receive);
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
receive_router.delete('/test',function(req,res,next) {
  Receive.remove({},function(err,receive){
    if(err){
      return res.status(400).send("err in post /receive");
    }else{
      return res.status(200).json(receive);
    }
  });
});
module.exports = receive_router;
