-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.--
SELECT name
FROM users u 
WHERE id IN (SELECT user_id FROM orders o);
