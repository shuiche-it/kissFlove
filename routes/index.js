var express = require('express');
var router = express.Router();
var data = new Date();
console.log(data.getTime());
/* GET home page. */
router.get('/', function(req, res) {
  res.render('index', { title: 'Express' });
});

router.get('/about' , function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/about');
});

router.get('/evaluation', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/evaluation');
});

router.get('/list', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/list');
});

router.get('/orderList', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/orderList');
});
router.get('/order', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/order');
});
router.get('/myCare', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/myCare');
});
router.get('/follow', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/follow');
});
router.get('/orderInfo', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/orderInfo');
});
router.get('/test', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/test');
});

router.get('/careBuy', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/careBuy');
});
router.get('/userRegist', function(req, res) {
  res.render('./WEB-INF/pageroot/reserve/userRegist');
});

router.get('/self', function(req, res) {
    res.render('./WEB-INF/pageroot/self/self');
});

router.get('/feedback', function(req, res) {
    res.render('./WEB-INF/pageroot/self/feedback');
});
router.get('/coupon', function(req, res) {
    res.render('./WEB-INF/pageroot/self/coupon');
});
router.get('/changePhone', function(req, res) {
    res.render('./WEB-INF/pageroot/self/changePhone');
});
router.get('/score', function(req, res) {
    res.render('./WEB-INF/pageroot/self/score');
});
router.get('/invite', function(req, res) {
    res.render('./WEB-INF/pageroot/self/invite');
});
module.exports = router;
