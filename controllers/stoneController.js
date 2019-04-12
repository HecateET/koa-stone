const stoneDAO = require("../model/stoneDAO");

module.exports = {

//    查询省份
    getALLProvince:async(ctx,next)=>{
        try {
            let provinceLists = await stoneDAO.getAllProvince();
            console.log(provinceLists);
            ctx.body = {"code":200,"message":"ok",data:provinceLists};
        }catch (e) {
            ctx.body = {"code": 500, "message": e.toString(), data:[]};
        }
    },
//    查询 省份分类奇石
    getStoneType:async(ctx,next)=>{
        try{
            let provinceId = ctx.request.body.provinceId,
                provinceName = ctx.request.body.provinceName,
                stoneTypeList = "";
            if(provinceId!=""&&provinceName==undefined){
                stoneTypeList = await stoneDAO.getStoneTypesByProId(provinceId);
            }else if(provinceId==undefined && provinceName!=""){
                stoneTypeList = await stoneDAO.getStoneTypesByProName(provinceName);
            }
            ctx.body = {"code":200,"message":"ok",data:stoneTypeList};

        }catch (e) {
            ctx.body = {"code": 500, "message": e.toString(), data:[]};
        }
    }

};