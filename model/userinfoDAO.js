const DAO = require("../model/DAO");

class DB {
//    个人设置部分
    getOneUser(userId){
        return DAO("SELECT * FROM userinfo WHERE userId = ?",[userId]);
    }
}

module.exports = new DB();