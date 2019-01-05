const DAO = require("../model/DAO");

class DB {
//    个人设置部分
    getOneUser(userId){
        return DAO("SELECT * FROM userinfo WHERE userId = ?",[userId]);
    }
    //users == 用户关注数
    countAttentionNum(userId){
        return DAO("SELECT COUNT(attentionName) AS attentionNum FROM attention WHERE attentionFan = ?",[userId]);
    }
    //users == 用户粉丝数
    countFansNum(userId){
        return DAO("SELECT COUNT(attentionFan) AS fanNum FROM attention WHERE attentionName = ?",[userId]);
    }
    //users == 查询用户发帖量
    countUserPorts(userId){
        return DAO("SELECT COUNT(portId) AS portNum FROM `port` WHERE portUserId = ?",[userId]);
    }
    //users == 查询用户投稿文章数量
    countUserArticle(userId){
        return DAO("SELECT COUNT(stoneArticleId) AS articleNum FROM stonearticle WHERE articleAuthor = ?",[userId])
    }

}

module.exports = new DB();