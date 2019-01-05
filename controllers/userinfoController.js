const userDAO = require("../model/userinfoDAO");

module.exports = {
    //users === 查询指定用户
    getOneUser: async (ctx, next) => {
        try {
            let jsondata = await userDAO.getOneUser(ctx.params.userId);
            ctx.body = {"code": 200, "message": "ok", data:jsondata[0]};
        } catch(e) {
            ctx.body = {"code": 500, "message": e.toString(), data:[]};
        }
    },
};