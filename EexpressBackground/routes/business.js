var express = require('express');
var business_router = express.Router();
var Business = require('../models/Business');
business_router.post('/',function(req,res,next){
  Business.create({merchandise:req.body.merchandise,
  oname:req.body.oname,ostunum:req.body.ostunum,oQQnum:req.body.oQQnum,
  odormitory:req.body.odormitory,odoornum:req.body.odoornum,olevel:req.body.olevel,
  rname:req.body.rname,rstunum:req.body.rstunum,rQQnum:req.body.rQQnum,
  rdormitory:req.body.rdormitory,rdoornum:req.body.rdoornum,rlevel:req.body.rlevel},
  function(err,business){
    if (err) {
        return res.status(400).send("err in post /business");
    } else {
        return res.status(200).json(business);
    }
  });
});

business_router.post('/delete',function(req,res,next){
  Business.remove({ostunum:req.body.ostunum,rstunum:req.body.rstunum,merchandise:req.body.merchandise},function(err,business){
    if(err){
      return res.status(400).send("err in delete /business");
    }else{
      return res.status(200).json(business);
    }
  });
});

business_router.get('/', function(req, res, next) {
  var _stunum="stunum";
  _stunum=req.query.stunum;
  var my_stunum=_stunum.substring(_stunum.indexOf("(")+2,_stunum.indexOf(")")-1);
  Business.find({rstunum:my_stunum},function(err, business){
        if(err){
            return res.status(400).send("err in get /business");
        }else{
            return res.status(200).json(business);
        }
    })
});

business_router.get('/test', function(req, res, next) {
  Business.find({}, function(err, business){
        if(err){
            return res.status(400).send("err in get /business");
        }else{
            return res.status(200).json(business);
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
business_router.delete('/test',function(req,res,next) {
  Business.remove({},function(err,business){
    if(err){
      return res.status(400).send("err in post /business");
    }else{
      return res.status(200).json(business);
    }
  });
});
module.exports = business_router;
