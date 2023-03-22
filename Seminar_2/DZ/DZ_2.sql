CREATE DATABASE IF NOT EXISTS seminar_2;

USE seminar_2;

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT sales(order_date, count_product)
VALUES 
	('2022-01-01', '156'),
	('2022-01-02', '180'),
    ('2022-01-03', '21'),
	('2022-01-04', '124'),
    ('2022-01-05', '341');
 
SELECT 
	id AS "Номер заказа",
    order_date AS "Дата заказа",
    count_product AS "Количество товара",
	IF (count_product < 100, "Маленький заказ",
		IF(count_product BETWEEN 100 AND 300, "Средний заказ", "Большой заказ"))
	AS "Тип заказа"
FROM sales;

CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(3) UNIQUE NOT NULL,
    amount DECIMAL NOT NULL,
    order_status VARCHAR(9)
);

INSERT orders(employee_id, amount, order_status)
VALUES 
	('e03', '15.00', 'OPEN'),
	('e01', '25.50', 'OPEN'),
    ('e05', '100.70', 'CLOSED'),
	('e02', '22.18', 'OPEN'),
    ('e04', '9.50', 'CANCELLED');
    
SELECT 
	id AS "Номер заказа",
    employee_id AS "Номер сотрудника",
    amount AS "Количество" ,
    order_status AS "Статус заказа",
CASE
	WHEN order_status = 'OPEN' THEN "Order is in open state"
    WHEN order_status = 'CLOSED' THEN "Order is closed"
    WHEN order_status = 'CANCELLED' THEN "Order is cancelled"
    ELSE "Error"
END AS "Подробное описание статуса заказа"
FROM orders;
