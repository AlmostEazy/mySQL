-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.

DROP DATABASE homework_2;

CREATE DATABASE homework_2;

USE homework_2;

CREATE TABLE sales (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_date DATE NOT NULL,
bucket VARCHAR(30) NOT NULL
);

INSERT INTO sales (order_date, bucket)
VALUES
("2021-01-01", "101 to 300"),
("2021-01-02", "101 to 300"),
("2021-01-03", "less than equal to 100"),
("2021-01-04", "101 to 300"),
("2021-01-05", "greater than 300");

-- 2. Разделите  значения поля “bucket” на 3 сегмента: меньше 100(“Маленький заказ”), 100-300(“Средний заказ”) и больше 300 (“Большой заказ”).

/* Без занесения в память (после применения CASE создает временную таблицу с выборкой. После последующего запуска SELECT * FROM sales
выборка и созданный с помощью CASE столбец исчезают):*/
SELECT id, order_date, bucket,
CASE bucket
WHEN "less than equal to 100" THEN "Small order"
WHEN "101 to 300" THEN "Average order"
WHEN "greater than 300" THEN "Big order"
ELSE "Fail"
END AS order_size
FROM sales;

SELECT * 
FROM sales;

/* С занесением в память (выборка и новый столбец не исчезают, но при данном методе требуется отключение
Safe Updates в настройках программы):*/
ALTER TABLE sales
ADD order_size VARCHAR(50) NOT NULL;

UPDATE sales SET order_size = "Small order" WHERE bucket = "less than equal to 100";
UPDATE sales SET order_size = "Average order" WHERE bucket = "101 to 300";
UPDATE sales SET order_size = "Big order" WHERE bucket = "greater than 300";

SELECT *
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE.

CREATE TABLE orders (
orderid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
employeeid VARCHAR(30) NOT NULL,
amount DECIMAL(24,2) NOT NULL,
orderstatus VARCHAR(30) NOT NULL
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED"),
("e04", 99.99, "OPEN");

SELECT orderid, orderstatus,
CASE orderstatus
WHEN "OPEN" THEN "Order is in open state."
WHEN "CLOSED" THEN "Order is closed."
WHEN "CANCELLED" THEN "Order is cancelled."
ELSE "Fail"
END AS order_summary
FROM orders;

SELECT *
FROM orders;

-- 4. Чем 0 отличается от NULL?

/* NULL это отсутсвие данных (неизвестное, неуказанное значение), а 0 - уникальная известная величина, которая имеет значение в арифметике 
и другой математике, т.е. значение, с которым можно производить математические вычисления.*/
