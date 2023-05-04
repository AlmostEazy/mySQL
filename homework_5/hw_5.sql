DROP DATABASE homework_5;

CREATE DATABASE homework_5;

USE homework_5;

CREATE TABLE  cars 
(       
	Id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	Name VARCHAR(10), 
	Cost INT NOT NULL
);

INSERT INTO cars(Name, Cost)
VALUES
("Audi", 52642),
("Mercedes", 57127),
("Scoda", 9000),
("Volvo", 29000),
("Bentley", 350000),
("Citroen", 21000),
("Hummer", 41400),
("Volkswagen", 21600);

-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE VIEW cars_view AS
SELECT Name
FROM cars
WHERE Cost < 25000;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

ALTER VIEW cars_view AS
SELECT Name
FROM cars
WHERE Cost < 30000;

-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW skoda_and_audi AS
SELECT Name, Cost
FROM cars
WHERE Name = "Scoda" OR Name = "Audi";


-- 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

CREATE TABLE  analysis
(       
	an_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	an_name VARCHAR(10), 
	an_cost INT NOT NULL,
    an_price INT NOT NULL,
    an_group VARCHAR(10)
);

INSERT INTO analysis(an_name, an_cost, an_price, an_group)
VALUES
("A", 100, 300, "AA"),
("B", 150, 350, "BB"),
("C", 50, 250, "CC"),
("D", 200, 400, "DD");

CREATE TABLE  an_group
(       
	gr_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	gr_name VARCHAR(10), 
	gr_temp INT NOT NULL
);

INSERT INTO an_group(gr_name, gr_temp)
VALUES
("AA", 20),
("BB", 25),
("CC", 10),
("DD", 8);

CREATE TABLE  orders
(       
	ord_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
	ord_datetime DATETIME, 
	ord_an INT NOT NULL
);

INSERT INTO orders(ord_datetime, ord_an)
VALUES
("2020-02-05 11:30:20", 3),
("2020-06-16 16:35:25", 1),
("2020-02-07 17:37:27", 2),
("2020-03-10 13:33:23", 4);

CREATE VIEW analysis_order AS
SELECT *
FROM analysis
JOIN orders ON analysis.an_id = orders.ord_an;

SELECT an_name, an_price, ord_datetime
FROM analysis_order
WHERE ord_datetime BETWEEN "20-02-05" AND date_add("20-02-05", interval 1 week);


