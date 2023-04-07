CREATE DATABASE seminar_5;
USE seminar_5;
 
CREATE TABLE IF NOT EXISTS cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

CREATE TABLE IF NOT EXISTS schedule
(
	train_id INT NOT NULL,
    station VARCHAR(20),
    station_time TIME
);

INSERT schedule
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00"),
    (110, "San Jose", "12:35:00"),
    (120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00"),
    (120, "San Jose", "13:30:00");
    
SELECT *
FROM schedule;

-- Task_1
CREATE OR REPLACE VIEW cars_view_cost AS
SELECT *
FROM cars
WHERE cost <= 25000
ORDER BY cost DESC;

SELECT *
FROM cars_view_cost;

-- Task_2
ALTER VIEW cars_view_cost AS
SELECT *
FROM cars
WHERE cost <= 30000
ORDER BY cost DESC;

SELECT *
FROM cars_view_cost;

-- Task_3
CREATE OR REPLACE VIEW cars_view_mark AS
SELECT *
FROM cars
WHERE name = "Skoda" OR name = "Audi"
ORDER BY cost DESC;

SELECT *
FROM cars_view_mark;

-- Task_4
SELECT *,
SUBTIME(LEAD (station_time) 
OVER (PARTITION BY train_id 
ORDER BY train_id), station_time) AS "time_to_next_station"
FROM schedule;