CREATE DATABASE IF NOT EXISTS seminar_3;

USE seminar_3;

CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `firstname` VARCHAR(45),
    `lastname` VARCHAR(45),
    `post` VARCHAR(45),
    `seniority` INT,
	`salary` INT,
    `age` INT
);
TRUNCATE staff;
INSERT `staff` (`firstname`, `lastname`,  `post`, `seniority`, `salary`,`age`)
VALUES
	("Вася", "Петров", "Начальник", 40, 100000, 60),
    ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
	('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT *
FROM staff
ORDER BY salary DESC;
    
SELECT *
FROM staff
ORDER BY salary;

SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

SELECT
	post,
    SUM(salary)
FROM staff
GROUP BY post;

SELECT 
	post,
    COUNT(post) AS "Количество сотрудников от 24 до 49 лет"
FROM (SELECT *
FROM staff
WHERE post = 'Рабочий') staff_new
WHERE age BETWEEN 24 AND 49;

SELECT
	post,
    COUNT(post) AS "Количество специальностей"
FROM staff
GROUP BY post;

SELECT
	COUNT(post) AS "Количество специальностей"
FROM (SELECT DISTINCT post
FROM staff) staff_new;

SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) < 31;