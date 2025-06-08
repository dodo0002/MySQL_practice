--2025/06/06
--創建一個名為books的表格
-- CREATE TABLE books(
--     id int PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(100),
--     author VARCHAR(50)
-- )


--新增三筆資料，因為主key是AUTO_INCREMENT所以第一個小括號不需要填，values也只要兩個值對應即可
-- INSERT INTO books(title, author)
-- VALUES("Harry Potter", "J.K. Rowling"),
-- (1984, "Grorge Orwell"),
-- ("The Hobbit", "J.R.R. Tolkien");


--新增欄位，先下指令要新增在哪個table，然後加上名稱跟資料類型
-- ALTER TABLE books
-- ADD COLUMN published_year INT;


--更新書籍年份資料
-- UPDATE books
-- SET published_year = 1937
-- WHERE id = 3;
--更新書籍作者資料
-- UPDATE books
-- SET author = "Orwell"
-- WHERE title = "1984";


--查詢所有表格內資料
-- SELECT * FROM books;
--將查詢的資料按照出版年份降冪排序
-- SELECT * FROM books
-- ORDER BY published_year DESC;


--刪除指定資料
-- DELETE FROM books
-- WHERE title = "The Hobbit";


--檢視books表格欄位狀態
-- DESCRIBE  books;


--RUN快捷鍵 ctrl + enter

--第二個GEMINI出的練習
-- CREATE TABLE Authors(
--     author_id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(30),
--     last_name VARCHAR(30),
--     birth_year INT
-- )

--修改欄位名稱，不是改值
-- ALTER TABLE books CHANGE COLUMN id book_id INT;
--調整欄位狀態
--ALTER TABLE books MODIFY COLUMN book_id INT AUTO_INCREMENT;
-- ALTER TABLE books
-- ADD COLUMN (author_id INT, 這個是錯的，要新增欄位再增加外鍵，刪除的話則是先刪除外鍵再刪除欄位
-- FOREIGN KEY (author_id) REFERENCES Authors(author_id));

-- CREATE TABLE Members(
--     member_id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(20),
--     last_name VARCHAR(20),
--     email VARCHAR(50) UNIQUE
-- )

-- CREATE TABLE Loans(
--     loan_id INT PRIMARY KEY AUTO_INCREMENT,
--     book_id INT,
--     member_id INT,
--     loan_date DATE,
--     return_date DATE,
--     FOREIGN KEY (book_id) REFERENCES books(book_id),
--     FOREIGN KEY (member_id) REFERENCES Members(member_id)
-- );

-- INSERT INTO Authors (first_name, last_name, birth_year)
-- VALUES("Stephen", "King", 1947),
-- ("Jane", "Austen", 1775),
-- ("George", "Orwell", 1903),
-- ("Agatha", "Christie", 1890),
-- ("Isaac", "Asimov", 1920),
-- ("Lewis", "Carroll", 1832);

--CONSTRAINT_TYPE還沒有學到
-- SELECT CONSTRAINT_NAME FROM information_schema.TABLE_CONSTRAINTS
-- WHERE TABLE_SCHEMA = "library" AND TABLE_NAME = "books" AND CONSTRAINT_TYPE = "FOREIGN KEY";

--刪除外鍵
-- ALTER TABLE Loans DROP FOREIGN KEY loans_ibfk_1;
--刪除欄位
-- ALTER TABLE Loans
-- DROP COLUMN book_id;

--還沒學到 添加外鍵 
-- ALTER TABLE books
-- ADD CONSTRAINT fk_author_id
-- FOREIGN KEY (author_id)
-- REFERENCES Authors(author_id);

--這邊也是錯的，不能這樣添加外鍵，要分步驟
-- ADD COLUMN (book_id INT,FOREIGN KEY (book_id) REFERENCES books(book_id));


-- INSERT INTO books(title, published_year, genre)
-- VALUES("The Shining", 1977, "Horror"),
-- ("Pride and prejudice", 1813, "Romance"),
-- ("Animal Farm", 1945, "Dystopian"),
-- ("Muder on the Orient Express", 1934, "Mystery"),
-- ("I, Robot", 1950, "Science Fiction"),
-- ("Alice's Adventures in Wonderland", 1865, "Fantasy"),
-- ("It", 1986, "Horror"),
-- ("Emma", 1815, "Romance"),
-- ("Foundation", 1951, "Science Fiction"),
-- ("The Hitchhiker's Guide to the Galaxy", 1979, "Science Fiction");

--不能添加沒有的ID
-- UPDATE books
-- SET author_id = 5
-- WHERE book_id IN(7);

--添加Members資料
-- INSERT INTO Members(first_name, last_name, email)
-- VALUES("Alice", "Chen", "alice.chen@example.com"),
-- ("Bob", "Lin", "bob.lin@expamle.com"),
-- ("Carol", "Wang", "carol.wang@example.com");

--添加Loans資料
-- INSERT INTO Loans(book_id, member_id, loan_date, return_date)
-- VALUES(1, 1, '2025-05-01', '2025-05-15'),
-- (3, 2, '2025-05-10', NULL),
-- (5, 1, '2025-05-20', NULL),
-- (2, 3, '2025-05-25', '2025-06-03'),
-- (7, 2, '2025-06-01', NULL);


--2025/06/07
-- 新增欄位
-- ALTER TABLE books
-- ADD COLUMN (pages INT,
-- rating DECIMAL(3, 2));

-- MODIFY只有改資料型態 CHANGE是改欄位名稱
-- ALTER TABLE Members 
-- MODIFY COLUMN email VARCHAR(150);

-- 一次新增多筆資料，SET 欄位要等於甚麼 CASE condition欄位
--     WHEN condition THEN 要新增的資料
-- UPDATE books
-- SET pages = CASE book_id 
--     WHEN 1 THEN 320
--     WHEN 2 THEN 328
--     WHEN 3 THEN 447
--     WHEN 4 THEN 279
--     WHEN 5 THEN 112
--     WHEN 6 THEN 256
--     WHEN 7 THEN 253
--     WHEN 8 THEN 192
--     WHEN 9 THEN 1138
--     WHEN 10 THEN 474
--     WHEN 11 THEN 255
--     WHEN 12 THEN 193
-- END,  --要加END跟逗號
--      rating = CASE book_id
--     WHEN 1 THEN 4.85
--     WHEN 2 THEN 4.78
--     WHEN 3 THEN 4.55
--     WHEN 4 THEN 4.60
--     WHEN 5 THEN 4.70
--     WHEN 6 THEN 4.30
--     WHEN 7 THEN 4.45
--     WHEN 8 THEN 4.75
--     WHEN 9 THEN 4.65
--     WHEN 10 THEN 4.20
--     WHEN 11 THEN 4.35
--     WHEN 12 THEN 4.90
-- END;

-- LIKE加% 是不指定字串的意思 只要包含即可 放在前面就是前面不指定 後面就是後面不指定
-- SELECT * FROM books
-- WHERE genre LIKE "%Fiction%" AND published_year >= 2000
-- ORDER BY title ASC;

-- 查詢 然後排序
-- SELECT * FROM Authors
-- WHERE birth_year < 1950
-- ORDER BY birth_year DESC;

-- JOIN + CONCAT使用 注意括號內非加號 是逗號
-- SELECT  b.title AS title, CONCAT(m.last_name , " " , m.first_name ) AS full_name, l.loan_date FROM Loans l
-- JOIN books b
-- ON l.book_id = b.book_id
-- JOIN Members m
-- ON l.member_id = m.member_id
-- WHERE return_date IS NULL OR return_date > '2025-06-07';

-- 之後可以練習用看看BETWEEN
-- SELECT title, published_year FROM books
-- WHERE  published_year >= 1980 AND published_year <= 2000 ;

-- INSERT INTO Authors(first_name, last_name)
-- VALUES("J.K.", "Rowling");

-- UPDATE books
-- SET author_id = 7
-- WHERE book_id = 1;


-- SELECT CONCAT(a.first_name," ", a.last_name) AS author_full_name, COUNT(b.author_id) AS total FROM books b
-- JOIN Authors a
-- ON b.author_id = a.author_id 
-- GROUP BY CONCAT(a.first_name," ", a.last_name)
-- ORDER BY COUNT(author_id) DESC;

UPDATE books
SET published_year = 2020
WHERE genre LIKE "%Science Fiction%";

UPDATE Authors
SET birth_year = birth_year - 5
WHERE first_name = 'George' OR last_name = 'George';

UPDATE Loans
SET loan_date = CURRENT_DATE(),
    return_date = DATE_ADD(CURRENT_DATE(), INTERVAL 30 DAY)
WHERE return_date IS NULL OR DATEDIFF(CURRENT_DATE(), loan_date) > 30; --下錯了 這邊是AND不是OR

DELETE FROM books
WHERE genre = "Fantasy";

DELETE FROM Loans
WHERE loan_date < '2024-12-31' AND return_date IS NOT NULL;

SELECT * FROM books;

-- DESCRIBE Authors;
-- DESCRIBE Members;
-- DESCRIBE Loans;