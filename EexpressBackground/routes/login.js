var express = require('express');
var login_router = express.Router();
var Login = require('../models/Login');
login_router.post('/',function(req,res,next){
  Login.create({stunum:req.body.stunum,password:req.body.password},function(err,login){
    if (err) {
        return res.status(400).send("err in post /login");
    } else {
        return res.status(200).json(login);
    }
  });
});

login_router.get('/', function(req, res, next) {
  Login.find({}, function(err, login){
        if(err){
            return res.status(400).send("err in get /login");
        }else{
            return res.status(200).json(login);
        }
    })
});

login_router.put('/resetpassword',function(req,res,next){
  console.log(req.body.stunum);
  console.log(req.body.password);
  Login.update({stunum:req.body.stunum},{password:req.body.password},{multi: true},function(err,resetpassword){
    if(err){
      return res.status(400).send("err in put /resetpassword");
    }else{
      return res.status(200).json(resetpassword);
    }
  });
});

login_router.delete('/',function(req,res,next) {
  var stunum = req.params.stunum;

  Login.remove({},function(err,stunum){
    if(err){
      return res.status(400).send("err in post /stunum");
    }else{
      return res.status(200).json(stunum);
    }
  });
});
module.exports = login_router;
