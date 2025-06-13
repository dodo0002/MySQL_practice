import mysql from "mysql2/promise";
import dotenv from "dotenv";

dotenv.config();

const connection = await mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

try {
  console.log("已成功連接到資料庫!");

  //   const [results, fields] = await connection.query(
  //     " SELECT * FROM `employees` WHERE  `age` > 25"
  //   );

  //   connection.query("CREATE DATABASE test_db"),
  //     function (err, result) {
  //       if (err) throw err;
  //       console.log("資料庫建立成功!");
  //     };

  //   const [table] = await connection.query(
  //     "CREATE TABLE users(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), age INT, email VARCHAR(150))"
  //   );
  //   console.log("TABLE建立成功!");

  // const [results, field] = await connection.query(
  //   "INSERT INTO users VALUES(1, 'Jim', 27, 'travel123456@gmail.com')"
  // );
  // console.log(results);
  // console.log("資料新增成功! 恭喜");

  // const id = 1;

  //  = await connection.query(
  //   "UPDATE users SET email = 'new@email.com' WHERE id = '1'"
  // );

  // console.log("已更新email");

  const [mei] = await connection.query(
    "INSERT INTO users(name, age, email) VALUES('tony', 29, 'does not exist')"
  );

  const [results, fields] = await connection.query(
    "SELECT * FROM users WHERE id = '2'"
  );
  const sql = [results, fields];
  // console.log(sql);
  // const sql = [results, fields];

  if (sql[0].length != 0) {
    const [doom] = await connection.query("DELETE FROM users WHERE id = '2'");
    console.log("刪除完成");
    console.log(sql[0]);
  } else {
    console.log("查無此筆資料，請重新操作!");
  }

  // console.log(id);
  // if (Object.keys(result).length == 0) {
  //   console.log("使用者不存在");
  // }
  // console.log(Object.keys(id));

  //   console.log(results);
  //   console.log(fields);
} catch (err) {
  console.log(err);
}
