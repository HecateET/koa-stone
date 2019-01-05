const userDAO = require("../model/userinfoDAO");

module.exports = {
    //users === 查询指定用户
    getOneUser: async (ctx, next) => {
        try {

            let userId = ctx.params.userId,
                jsondata = await userDAO.getOneUser(userId),
                fansNum = await  userDAO.countFansNum(userId),
                attentionNum = await userDAO.countAttentionNum(userId),
                portNum = await userDAO.countUserPorts(userId),
                articleNum = await  userDAO.countUserArticle(userId),
                data = {
                    userinfo:jsondata,
                    fansNum:fansNum[0],
                    attentionNum:attentionNum[0],
                    portNum:portNum[0],
                    articleNum:articleNum[0],
                };
            ctx.body = {"code": 200, "message": "ok", data:data};
        } catch(e) {
            ctx.body = {"code": 500, "message": e.toString(), data:[]};
        }
    },

};