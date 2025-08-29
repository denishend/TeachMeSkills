-- 📄 Примеры команд SQL (подсказки):
-- ===========================
-- Как создать таблицу:
-- CREATE TABLE table_name (
--     column1 datatype,
--     column2 datatype,
--     ...
-- );

-- Как вставить данные:
-- INSERT INTO table_name (column1, column2) VALUES ('value1', 'value2');

-- Как обновить данные:
-- UPDATE table_name SET column1 = 'new_value' WHERE some_condition;

-- Как добавить новый столбец:
-- ALTER TABLE table_name ADD COLUMN column_name datatype;

-- Как удалить таблицу:
-- DROP TABLE table_name;

-- ===========================
-- 📋 Задания (выполняйте TODO):
-- ===========================


-- ✅ TODO 1: Создайте таблицу "Employees" с полями:
-- Name (TEXT), Position (TEXT), Department (TEXT), Salary (NUMERIC)

-- 📝 Напишите здесь CREATE TABLE
-- CREATE TABLE Employees (
--     Name TEXT,
--     Position TEXT,
--     Department TEXT,
--     Salary NUMERIC
-- );


-- ✅ TODO 2: Вставьте несколько записей в таблицу "Employees"

-- 📝 Напишите здесь INSERT INTO
-- INSERT INTO Employees (Name, Position, Department, Salary) VALUES
-- ('Алексеев Алексей', 'Analyst', 'Business', 1000),
-- ('Васильев Вася', 'Manager', 'Sales', 500),
-- ('Петрова Света', 'Developer', 'IT', 10000);



-- ✅ TODO 3: Измените должность одного из сотрудников на более высокую

-- 📝 Напишите здесь UPDATE
-- UPDATE Employees
-- SET Position = 'Senior Developer'
-- WHERE Name = 'Петрова Света';



-- ✅ TODO 4: Добавьте новое поле "HireDate" (DATE) в таблицу "Employees"

-- 📝 Напишите здесь ALTER TABLE
-- ALTER TABLE Employees ADD COLUMN HireDate DATE;


-- ✅ TODO 5: Добавьте дату приема на работу для всех сотрудников

-- 📝 Напишите здесь UPDATE для каждого сотрудника
-- UPDATE Employees SET HireDate = '1067-01-01' WHERE Name = 'Алексеев Алексей';
-- UPDATE Employees SET HireDate = '862-01-01' WHERE Name = 'Васильев Вася';
-- UPDATE Employees SET HireDate = '1128-01-01' WHERE Name = 'Петрова Света';


-- ✅ TODO 6: Найдите всех сотрудников с должностью "Manager"

-- 📝 Напишите здесь SELECT
-- SELECT * FROM Employees WHERE Position = 'Manager';


-- ✅ TODO 7: Найдите всех сотрудников с зарплатой больше 5000

-- 📝 Напишите здесь SELECT
-- SELECT * FROM Employees WHERE Salary > 5000;


-- ✅ TODO 8: Найдите всех сотрудников, которые работают в отделе "Sales"

-- 📝 Напишите здесь SELECT
-- SELECT * FROM Employees WHERE Department = 'Sales';


-- ✅ TODO 9: Найдите среднюю зарплату всех сотрудников

-- 📝 Напишите здесь SELECT AVG(...)
-- SELECT AVG(Salary) AS AverageSalary FROM Employees;


-- ✅ TODO 10: Удалите таблицу "Employees"

-- ⚠️ ВНИМАНИЕ: Эта команда удалит таблицу и все данные!
-- Выполняйте её только после того, как закончите все задания выше.

-- 📝 Напишите здесь DROP TABLE
-- DROP TABLE Employees;


-- 🎯 *Задание с повышенным уровнем сложности:*
-- Реализуйте задачи 6–9 в виде ХРАНИМЫХ ФУНКЦИЙ или ПРОЦЕДУР.

-- Подсказка:
-- CREATE FUNCTION или CREATE PROCEDURE
-- BEGIN ... END

-- Пример вызова:
-- CALL имя_процедуры();

-- 📝 Напишите здесь свои CREATE FUNCTION / PROCEDURE

-- 6
-- CREATE PROCEDURE GetManagers()
-- BEGIN
--     SELECT * FROM Employees WHERE Position = 'Manager';
-- END;

-- 7
-- CREATE PROCEDURE GetHighSalaryEmployees()
-- BEGIN
--     SELECT * FROM Employees WHERE Salary > 5000;
-- END;

-- 8
-- CREATE PROCEDURE GetSalaryEmployees()
-- BEGIN
--     SELECT * FROM Employees WHERE Department = 'Sales';
-- END;

-- 9
-- CREATE PROCEDURE GetAverageSalary()
-- BEGIN
--     SELECT AVG(Salary) AS AvgSalary FROM Employees;
-- END;

-- Вызов
-- CALL GetManagers();
-- CALL GetHighSalaryEmployees();
-- CALL GetSalesEmployees();
-- CALL GetAverageSalary();