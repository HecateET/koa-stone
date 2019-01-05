const router = require('koa-router')();
const userinfoController = require("../controllers/userinfoController")

router.prefix('/users')

router.get('/', function (ctx, next) {
  ctx.body = 'this is a users response!'
});

router.get('/bar', function (ctx, next) {
  ctx.body = 'this is a users/bar response'
});
//查询指定用户
router.get('/:userId', async (ctx, next) => {
    await userinfoController.getOneUser(ctx, next);
});

module.exports = router;
