var express = require('express');
var router = express.Router();

var myLogger = function (req, res, next) {
  console.log('LOGGED');
  next();
};

router.use(myLogger);

var Task = require('../models/Task');

router.get('/', function(req, res, next) {
  Task.find({}, function(err, tasks){
        if(err){
            return res.status(400).send("err in get /task");
        }else{
            // console.log(tasks);
            return res.status(200).json(tasks);
        }
    })
});

router.post('/', function(req, res, next) {
  var task = req.params.task;
  //res.json({message: 'Task is ' + task});
  Task.create({task: 'tom'}, function(err, task){
        if (err) {
            return res.status(400).send("err in post /task");
        } else {
            return res.status(200).json(task);
        }
    });
});

router.delete('/',function(req,res,next) {
  var task = req.params.task;

  Task.remove({},function(err,task){
    if(err){
      return res.status(400).send("err in post /task");
    }else{
      return res.status(200).json(task);
    }
  });
});

router.put('/',function(req,res,next){
    var task=req.params.task;
    Task.update({task:'tom'},{task:'jar'},{},function(err,task){
      if(err){
        return res.status(400).send("err in put /task");
      }else{
        return res.status(200).json(task);
      }
    });
});
module.exports = router;
