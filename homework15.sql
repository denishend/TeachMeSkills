-- 📘 TeachMeSkills: Домашнее задание по SQL
-- Тема: Создание таблиц, связи и JOIN
--
-- 📌 Примеры:
-- Создать таблицу:
-- CREATE TABLE example (
--     id INT PRIMARY KEY,
--     name VARCHAR(255)
-- );
--
-- Вставить данные:
-- INSERT INTO example (id, name) VALUES (1, 'Пример');
--
-- Пример INNER JOIN:
-- SELECT a.id, b.name FROM table_a a
-- INNER JOIN table_b b ON a.id = b.a_id;
--
-- Пример агрегатной функции:
-- SELECT author_id, SUM(quantity) FROM sales
-- JOIN books ON sales.book_id = books.id
-- GROUP BY author_id;
--
-- 💡 Вопросы для самоконтроля:
-- 1. Чем отличается INNER JOIN от LEFT JOIN?
-- 2. Почему внешний ключ важен для целостности данных?
-- 3. Для чего нужен GROUP BY?

-- 📋 Задача 1: Создание и заполнение таблиц
-- TODO: Создайте таблицу authors с полями id, first_name, last_name
--       (используйте PRIMARY KEY для поля id)
CREATE TABLE  authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

-- TODO: Создайте таблицу books с полями id, title, author_id, publication_year
--       (PRIMARY KEY — id, FOREIGN KEY — author_id, ссылается на authors)
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200),
    author_id INT,
    publication_year INT,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- TODO: Создайте таблицу sales с полями id, book_id, quantity
--       (PRIMARY KEY — id, FOREIGN KEY — book_id, ссылается на books)
CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- TODO: Добавьте нескольких авторов в таблицу authors
--       (INSERT INTO authors ...)
INSERT INTO authors (first_name, last_name)
VALUE
('Agatha', 'Christie'),
('Isaac', 'Asimov');

-- TODO: Добавьте несколько книг в таблицу books, указывая авторов из authors
INSERT INTO books (title, author_id, publication_year)
VALUE
('Murder on the Orient Express', 4, 1934),
('Foundation', 5, 1951);

-- TODO: Добавьте записи о продажах книг в таблицу sales
INSERT INTO sales (book_id, quantity)
VALUE
(1, 100),
(2, 2000);

-- 📋 Задача 2: Использование JOIN
-- TODO: Используйте INNER JOIN, чтобы получить список всех книг и их авторов
SELECT books.title, authors.first_name, authors.last_name
FROM books
INNER JOIN authors ON books.author_id = authors.id;

-- TODO: Используйте LEFT JOIN, чтобы получить список всех авторов и их книг
--       (включая авторов без книг)
SELECT authors.first_name, authors.last_name, books.title
FROM authors
LEFT JOIN books ON books.author_id = authors.id;

-- TODO: Используйте RIGHT JOIN, чтобы получить список всех книг и их авторов
--       (включая книги без автора)
SELECT books.title, authors.first_name, authors.last_name
FROM books
RIGHT JOIN authors ON books.author_id = authors.id;


-- 📋 Задача 3: Множественные JOIN
-- TODO: Используйте INNER JOIN, чтобы связать authors, books и sales и получить
--       список всех книг, их авторов и продаж
SELECT authors.first_name, authors.last_name, books.title, sales.quantity
FROM sales
INNER JOIN books ON sales.book_id = books.id
INNER JOIN authors ON books.author_id = authors.id;

-- TODO: Используйте LEFT JOIN, чтобы связать authors, books и sales и получить
--       список всех авторов, их книг и продаж (включая авторов без книг и книги без продаж)
SELECT authors.first_name, authors.last_name, books.title, sales.quantity
FROM authors
LEFT JOIN books ON books.author_id = authors.id
LEFT JOIN sales ON sales.book_id = books.id;


-- 📋 Задача 4: Агрегация данных с использованием JOIN
-- TODO: Используйте INNER JOIN и агрегатные функции, чтобы определить общее
--       количество проданных книг каждого автора
SELECT authors.first_name, authors.last_name, SUM(sales.quantity) AS total_sales
FROM sales
INNER JOIN books ON sales.book_id = books.id
INNER JOIN authors ON books.author_id = authors.id
GROUP BY authors.id;

-- TODO: Используйте LEFT JOIN и агрегатные функции, чтобы определить общее
--       количество проданных книг каждого автора, включая авторов без продаж
SELECT authors.first_name, authors.last_name, COALESCE(SUM(sales.quantity),0) AS total_sales
FROM authors
LEFT JOIN books ON books.author_id = authors.id
LEFT JOIN sales ON sales.book_id = books.id
GROUP BY authors.id;

-- 🚀 Удачи! Не бойтесь пробовать разные JOIN и GROUP BY, чтобы лучше понять, как они работают!