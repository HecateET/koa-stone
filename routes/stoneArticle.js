const router = require('koa-router')();
const stoneController = require("../controllers/stoneController");

router.prefix('/stoneArticle')

router.get('/', function (ctx, next) {
    ctx.body = 'this is a users response!'
});

router.get('/bar', function (ctx, next) {
    ctx.body = 'this is a users/bar response'
});
router.get('/cityList',async (ctx,next) =>{
   await stoneController.getALLProvince(ctx,next);
});
router.get('/stoneLists',async (ctx,next) =>{
    await stoneController.getAllStone(ctx,next);
});
router.get('/stoneInfo/:stoneId',async(ctx,next)=>{
    await stoneController.getStoneById(ctx,next);
})
router.post('/stoneTypeLists',async(ctx,next)=>{
    await stoneController.getStoneType(ctx,next);
});

module.exports = router;
