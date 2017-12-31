var express = require('express');
var user_router = express.Router();
var User = require('../models/User');

user_router.post('/',function(req,res,next){
  User.create({name:req.body.name,stunum:req.body.stunum,sex:req.body.sex,
    QQnum:req.body.QQnum,dormitory:req.body.dormitory,doornum:req.body.doornum,level:req.body.level},function(err,users){
    if (err) {
        return res.status(400).send("err in post /users");
    } else {
        return res.status(200).json(users);
    }
  });
});

user_router.get('/', function(req, res, next) {
  User.find({}, function(err, users){
        if(err){
            return res.status(400).send("err in get /users");
        }else{
            return res.status(200).json(users);
        }
    })
});

user_router.put('/address',function(req,res,next){
    User.update({stunum:req.body.stunum},{dormitory:req.body.dormitory,doornum:req.body.doornum},{multi: true},function(err,address){
      if(err){
        return res.status(400).send("err in put /address");
      }else{
        return res.status(200).json(address);
      }
    });
});

user_router.put('/setperinformation',function(req,res,next){
    User.update({stunum:req.body.stunum},{name:req.body.name,sex:req.body.sex,QQnum:req.body.QQnum},{multi: true},function(err,setperinformation){
      if(err){
        return res.status(400).send("err in put /setperinformation");
      }else{
        return res.status(200).json(setperinformation);
      }
    });
});

user_router.put('/level',function(req,res,next){
    User.update({stunum:req.body.stunum},{level:req.body.level},{multi: true},function(err,level){
      if(err){
        return res.status(400).send("err in put /level");
      }else{
        return res.status(200).json(level);
      }
    });
});

user_router.delete('/',function(req,res,next) {
  User.remove({},function(err,user){
    if(err){
      return res.status(400).send("err in post /user");
    }else{
      return res.status(200).json(user);
    }
  });
});
module.exports = user_router;
