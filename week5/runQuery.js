const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: 'localhost',
    port: 3307,
    user: 'kwebuser',
    password: 'kwebpw',
    database: 'kweb_db1'
});

const runQuery = async sql => {
    const conn = await pool.getConnection();
    try{
        const [result] = await conn.query(sql);
        return result;
    } finally{
        conn.release();
    }
};

module.exports = { runQuery };