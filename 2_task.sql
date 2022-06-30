-- Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT name, (SELECT name FROM catalogs c WHERE id = catalog_id) AS 'catalog'
FROM products;
