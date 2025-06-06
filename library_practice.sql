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

INSERT INTO Members(first_name, last_name, email)
VALUES("Alice", "Chen", "alice.chen@example.com"),
("Bob", "Lin", "bob.lin@expamle.com"),
("Carol", "Wang", "carol.wang@example.com");

INSERT INTO Loans(book_id, member_id, loan_date, return_date)
VALUES(1, 1, '2025-05-01', '2025-05-15'),
(3, 2, '2025-05-10', NULL),
(5, 1, '2025-05-20', NULL),
(2, 3, '2025-05-25', '2025-06-03'),
(7, 2, '2025-06-01', NULL);

-- DESCRIBE Authors;
-- DESCRIBE Members;
-- DESCRIBE Loans;