const mysql = require("mysql");
const config = require("../model/dbconfig");
const pool = mysql.createPool(config);
function query(sql, values) {
    return new Promise((resolve, reject) => {
        pool.getConnection(function (err, connection) {
            if (err) {
                reject(err);
            } else {
                connection.query(sql, values, (err, rows) => {
                    if (err) {
                        reject(err);
                    } else {
                        resolve(rows);
                        console.log("数据库链接成功");
                    }
                    connection.release();
                })
            }
        })
    })
}
module.exports = query;