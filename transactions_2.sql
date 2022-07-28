-- Создайте представление, которое выводит название name товарной позиции 
-- из таблицы products и соответствующее название каталога name из таблицы catalogs.

CREATE VIEW named_catalogs AS 
SELECT products.name AS products, catalogs.name AS catalogs FROM products JOIN catalogs ON products.catalog_id = catalogs.id;

SELECT * FROM named_catalogs;
