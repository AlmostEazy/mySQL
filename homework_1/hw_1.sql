-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
-- Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ

SELECT * FROM phone_store.phone;

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductCount > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT ProductName
FROM phone
WHERE Manufacturer = "Samsung";

-- 4.*** С помощью регулярных выражений найти:

-- 4.1. Товары, в которых есть упоминание "Iphone"

SELECT ProductName
FROM phone
WHERE ProductName REGEXP "iPhone";

-- или:

SELECT ProductName
FROM phone
WHERE ProductName LIKE "%iPhone%";

-- 4.2. "Samsung"

SELECT ProductName
FROM phone
WHERE Manufacturer REGEXP "Samsung";

-- или:

SELECT ProductName
FROM phone
WHERE Manufacturer LIKE "%Samsung%";

-- 4.3.  Товары, в которых есть ЦИФРА "8"  

SELECT ProductName
FROM phone
WHERE ProductName REGEXP "8";

-- или:

SELECT ProductName
FROM phone
WHERE ProductName LIKE "%8%";