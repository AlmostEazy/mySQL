-- 1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

CREATE DATABASE homework_6;

USE homework_6;

DELIMITER //
CREATE FUNCTION get_time (seconds INT)
RETURNS VARCHAR (255) DETERMINISTIC
BEGIN
DECLARE days INT DEFAULT 0;
DECLARE hours INT DEFAULT 0;
DECLARE minutes INT DEFAULT 0;
DECLARE convert_time VARCHAR (255) DEFAULT "";

SET days = seconds DIV 86400;
SET convert_time = concat(convert_time, days, " ", "days, ");
SET seconds = seconds - (days * 86400);
SET hours = seconds DIV 3600;
SET convert_time = concat(convert_time, hours, " ", "hours, ");
SET seconds = seconds - (hours * 3600);
SET minutes = seconds DIV 60;
SET convert_time = concat(convert_time, minutes, " ", "minunes, ");
SET seconds = seconds - (minutes * 60);
SET convert_time = concat(convert_time, seconds, " ", "seconds");
RETURN convert_time;
END //

SELECT get_time(90061);

-- 2. Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 (можно сделать через шаг + 2: х = 2, х+=2)

DELIMITER //
CREATE FUNCTION get_even (num INT)
RETURNS TEXT DETERMINISTIC
BEGIN
DECLARE even TEXT DEFAULT "";
DECLARE i INT DEFAULT 1;
WHILE i <= num DO
IF (i % 2 = 0) THEN
SET even = concat(even, i, " ");
END IF;
SET i = i + 1;
END WHILE;
RETURN even;
END //

SELECT get_even(10);