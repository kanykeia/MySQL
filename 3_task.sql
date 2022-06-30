/* (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.*/

USE test2;
DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
`label` VARCHAR (255),
`name` VARCHAR (255),
INDEX `flights_ibfk_1` (`label`)
);

DROP TABLE IF EXISTS flights;
CREATE TABLE flights(
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`from` VARCHAR(255),
	`to` VARCHAR (255)
);

ALTER TABLE flights 
ADD FOREIGN KEY (`to`)
REFERENCES cities(`label`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE flights 
ADD FOREIGN KEY (`from`)
REFERENCES cities(`label`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

INSERT INTO cities VALUES 
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск')
;

INSERT INTO flights (`to`, `from`) VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan')
;

SELECT id,
(SELECT name FROM cities WHERE label=`to`) AS `to`,
(SELECT name FROM cities WHERE label=`from`) AS `from`
FROM flights;

