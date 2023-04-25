-- Задание 2.

DROP DATABASE homework_3_2;

CREATE DATABASE homework_3_2;

USE homework_3_2;

CREATE TABLE workers(
	id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    specialty VARCHAR(30) NOT NULL,
    seniority INT NOT NULL,
    salary INT NOT NULL,
    age INT NOT NULL
    );


INSERT INTO workers(name, surname, specialty, seniority, salary, age)
VALUES
("Вася", "Васькин", "начальник", 40, 100000, 60),
("Петя", "Петькин", "начальник", 8, 70000, 30),
("Катя", "Каткина", "инженер", 2, 70000, 25),
("Саша", "Сашкин", "инженер", 12, 50000, 35),
("Иван", "Иванов", "рабочий", 40, 30000, 59),
("Петр", "Петров", "рабочий", 20, 25000, 40),
("Сидр", "Сидоров", "рабочий", 10, 20000, 35),
("Антон", "Антонов", "рабочий", 8, 19000, 28),
("Юра", "Юркин", "рабочий", 5, 15000, 25),
("Максим", "Воронин", "рабочий", 2, 11000, 22),
("Юра", "Галкин", "рабочий", 3, 12000, 24),
("Люся", "Люськина", "уборщик", 10, 10000, 49);

-- 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания

SELECT salary
FROM workers
ORDER BY salary DESC;

SELECT salary
FROM workers
ORDER BY salary;

-- 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой

SELECT salary 
FROM (
SELECT salary
FROM workers
ORDER BY salary DESC
LIMIT 5
) AS max_salaries_table
ORDER BY salary;

-- 3. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

SELECT specialty
FROM workers
GROUP BY specialty
HAVING SUM(salary) > 100000;




