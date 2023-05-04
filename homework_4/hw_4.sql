DROP DATABASE homework_4;

CREATE DATABASE homework_4;

USE homework_4;

CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM)
VALUES
(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA

SELECT MARK, COLOR, COUNT(COLOR) as AUTO_COUNT
FROM AUTO
WHERE MARK IN ('BMW', 'LADA')
GROUP BY MARK, COLOR;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки

SELECT MARK, COUNT(MARK) as AUTO_COUNT, ALL_MARK - COUNT(MARK) AS ANOTHER_MARK
FROM AUTO
JOIN (
SELECT COUNT(*) AS ALL_MARK
FROM AUTO
) AS TEMP
GROUP BY MARK, ALL_MARK;

-- Задание №3.
-- Даны 2 таблицы.
-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.

create table test_a (id int, data varchar(1));

insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

create table test_b (id int);

insert into test_b(id) values
(10),
(30),
(50);

SELECT test_a.id
FROM test_a 
LEFT JOIN test_b ON test_a.id = test_b.id
WHERE test_b.id IS NULL;


