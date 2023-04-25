DROP DATABASE homework_3;

CREATE DATABASE homework_3;

USE homework_3;

CREATE TABLE salespeople (
snum INT NOT NULL,
sname VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
comm FLOAT(24,2) NOT NULL
);

INSERT INTO salespeople (snum, sname, city, comm)
VALUES
(1001, "Peel", "London", 0.12),
(1002, "Serres", "San Jose", 0.13),
(1004, "Motika", "London", 0.11),
(1007, "Rifkin", "Barcelona", 0.15),
(1003, "Axelrod", "New York", 0.10);

CREATE TABLE customers (
cnum INT NOT NULL,
cname VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
rating INT NOT NULL,
snum INT NOT NULL
);

INSERT INTO customers (cnum, cname, city, rating, snum)
VALUES
(2001, "Hoffman", "London", 100, 1001),
(2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "San Jose", 200, 1002),
(2004, "Grass", "Berlin", 300, 1002),
(2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "San Jose", 300, 1007),
(2007, "Pereira", "Rome", 100, 1004);

CREATE TABLE orders (
onum INT NOT NULL,
amt DECIMAL(24,2) NOT NULL,
odate DATE NOT NULL,
cnum INT NOT NULL,
snum INT NOT NULL
);

INSERT INTO orders (onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, "2021-01-01", 2008, 1007),
(3003, 767.19, "2021-01-01", 2001, 1001),
(3002, 1900.10, "2016-01-01", 2007, 1004),
(3005, 5160.45, "2017-01-01", 2003, 1002),
(3006, 1098.16, "2018-01-01", 2008, 1007),
(3009, 1713.23, "2018-01-01", 2002, 1003),
(3007, 75.75, "2019-01-01", 2004, 1002),
(3008, 4723.00, "2016-01-01", 2006, 1001),
(3010, 1309.95, "2017-01-01", 2004, 1002),
(3011, 9891.88, "2016-01-01", 2006, 1001);

-- 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года (Платформа GB).

SELECT odate, SUM(amt) AS sum_amt
FROM orders
WHERE odate = "2016-01-01";

-- 1.Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. 
-- (к первой или второй таблице, используя SELECT) (Презентация)

SELECT city, sname, snum, comm
FROM salespeople;

-- 2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков. (Платформа)

SELECT COUNT(DISTINCT city) AS unique_cities
FROM customers;

-- 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
-- (Презентация)

SELECT cname, rating
FROM customers
WHERE city LIKE "San Jose";


-- 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика. (Платформа)

SELECT cnum, MIN(amt) AS min_amt
FROM orders
GROUP BY cnum;

-- 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. 
-- (уникальные значения в  “snum“ “Продавцы”) (Презентация)

SELECT DISTINCT snum AS unique_snum
FROM orders;

-- 4*. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы G. Используется оператор "LIKE" (Платформа и Презентация сходятся)

SELECT cname
FROM customers
WHERE cname LIKE "G%";


-- 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе. (Платформа)

SELECT city, MAX(rating) AS max_rating
FROM customers
GROUP BY city;

-- 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма) (Презентация)

SELECT *
FROM orders
WHERE amt > 1000;


-- 6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
-- (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение) (Презентация)

SELECT MIN(amt) AS min_amt
FROM orders;

-- 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
-- (Презентация)

SELECT *
FROM customers
WHERE rating > 100 AND city != "Rome"


