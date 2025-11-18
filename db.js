require("dotenv").config();
const mysql = require("mysql2/promise");

// MySQL 연결 풀 생성
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

// 연결 테스트 함수
async function testConnection() {
  try {
    const connection = await pool.getConnection();
    console.log("✅ MySQL 연결 성공!");
    console.log(
      `📍 연결 정보: ${process.env.DB_USER}@${process.env.DB_HOST}:${process.env.DB_PORT}`
    );
    connection.release();
    return true;
  } catch (error) {
    console.error("❌ MySQL 연결 실패:", error.message);
    return false;
  }
}

module.exports = { pool, testConnection };
