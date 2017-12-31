var express = require('express');
var order_router = express.Router();
var Order = require('../models/Order');
order_router.post('/',function(req,res,next){
  Order.create({name:req.body.name,
  stunum:req.body.stunum,QQnum:req.body.QQnum,dormitory:req.body.dormitory,
  doornum:req.body.doornum,level:req.body.level,merchandise:req.body.merchandise,
  expressname:req.body.expressname,shelves:req.body.shelves,expressnum:req.body.expressnum,
  reward:req.body.reward,freetimestart:req.body.freetimestart,freetimeend:req.body.freetimeend},
  function(err,order){
    if (err) {
        return res.status(400).send("err in post /order");
    } else {
        return res.status(200).json(order);
    }
  });
});

order_router.post('/delete',function(req,res,next){
  Order.remove({stunum:req.body.stunum,merchandise:req.body.merchandise},function(err,order){
    if(err){
      return res.status(400).send("err in post /order");
    }else{
      return res.status(200).json(order);
    }
  });
});

order_router.get('/', function(req, res, next) {
  var _stunum="stunum";
  _stunum=req.query.stunum;
  var my_stunum=_stunum.substring(_stunum.indexOf("(")+2,_stunum.indexOf(")")-1);
  Order.find({stunum:my_stunum},function(err, order){
        if(err){
            return res.status(400).send("err in get /order");
        }else{
            return res.status(200).json(order);
        }
    })
});

order_router.get('/all', function(req, res, next) {
  var _dormitory="dormitory";
  var _expressname="expressname"
  _dormitory=req.query.dormitory;
  _expressname=req.query.expressname;
  _dormitory=_dormitory.substring(_dormitory.indexOf("(")+2,_dormitory.indexOf(")")-1);
  _expressname=_expressname.substring(_expressname.indexOf("(")+2,_expressname.indexOf(")")-1);
  Order.find({dormitory:_dormitory,expressname:_expressname},function(err, allorder){
        if(err){
            return res.status(400).send("err in get /allorder");
        }else{
            return res.status(200).json(allorder);
        }
    })
});

order_router.get('/test', function(req, res, next) {
  Order.find({},function(err, order){
        if(err){
            return res.status(400).send("err in get /order");
        }else{
            return res.status(200).json(order);
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
order_router.delete('/test',function(req,res,next) {
  Order.remove({},function(err,order){
    if(err){
      return res.status(400).send("err in post /order");
    }else{
      return res.status(200).json(order);
    }
  });
});
module.exports = order_router;
