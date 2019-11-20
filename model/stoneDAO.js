const DAO = require("../model/DAO");

class DB {
//    查询所有省份列表
    getProvince(){
        let sql = "SELECT * FROM province";
        return DAO(sql);
    }
//   根据省份Id查询石头种类
    getStoneTypesByProId(provinceId){
        let sql = "SELECT stoneTypeId,stoneTypeName,stonePY,stonePinYin FROM stoneclassify WHERE stoneOriginId = ?";
        return DAO(sql,[provinceId]);
    }
//   根据省份名称来查询石头种类
    getStoneTypesByProName(provinceName){
        let sql = "SELECT stoneTypeId,stoneTypeName,stonePY,stonePinYin FROM stoneclassify WHERE originProvince = ?";
        return DAO(sql,[provinceName]);
    }
//    插入一个石头种类
    insertStoneType(typeName,stonePY,stonePinYin,stoneOriginId,originProvince){
        let sql = "INSERT INTO stoneclassify (stoneTypeName,stonePY,stonePinYin,stoneOriginId,originProvince) VALUES(?,?,?,?,?);";
        return DAO(sql,[typeName,stonePY,stonePinYin,stoneOriginId,originProvince]);
    }

//   查询所有省份
    getAllProvince(){
        let sql = "SELECT * FROM province";
        return DAO(sql);
    }
//    根据省份Id查询石头品种
    getStoneTypeByProvinceId(provinceId){
        let sql = "SELECT stoneTypeId,stoneTypeName,stonePY,stonePinYin FROM stoneclassify WHERE stoneOriginId = ?";
        return DAO(sql,[provinceId]);
    }
//    查询所有奇石
    getAllStone(){
        let sql = "SELECT * FROM stone";
        return DAO(sql);
    }
    getStoneById(id){
        let sql = "SELECT * FROM stone WHERE stoneId = ?";
        return DAO(sql,[id]);
    }
}

module.exports = new DB();