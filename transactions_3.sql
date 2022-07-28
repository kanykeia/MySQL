/* по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые 
*календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
*Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле 
*значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.*/

DROP TABLE IF EXISTS days;
CREATE TABLE IF NOT EXISTS days(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
created_at DATE NOT NULL
);

INSERT INTO days VALUES
(NULL, 'first_day', '2018-08-01'),
(NULL, 'second_day', '2018-08-04'),
(NULL, 'third_day', '2018-08-16'),
(NULL, 'fourth_day', '2018-08-17');

SELECT * FROM days;
DROP TABLE IF EXISTS all_days;
CREATE TEMPORARY TABLE all_days(
`day` INT
);

INSERT INTO all_days VALUES 
(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20), 
(21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

SELECT DATE(DATE('2018-08-31') - INTERVAL a.`day` DAY) AS `day` FROM all_days AS a ORDER BY `day`;


SELECT DATE(DATE('2018-08-31') - INTERVAL a.`day` DAY) AS `day`, 
NOT ISNULL(days.name) AS days_exists 
FROM all_days AS a
LEFT JOIN 
days
ON 
DATE(DATE('2018-08-31') - INTERVAL a.`day` DAY) = days.created_at 
ORDER BY 
`day`;
