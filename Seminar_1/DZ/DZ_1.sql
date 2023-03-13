-- USE db;
USE seminar_1;

-- Выводим содержимое таблицы mobile_phone
SELECT * FROM seminar_1.mobile_phone;

-- Выводим модель, производителя и цену для товаров, количество которых превышает 2
SELECT model, manufacturer, price
FROM mobile_phone
WHERE quantity > "2";

-- Выводим весь ассортимент товаров марки “Samsung”
SELECT *
FROM mobile_phone
WHERE manufacturer = "samsung";