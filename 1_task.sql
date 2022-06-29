/* Пусть задан некоторый пользователь (21). Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).*/

SELECT 
	from_user_id,
	CONCAT(
		(SELECT firstname FROM users WHERE id = m.from_user_id), ' ',
		(SELECT lastname FROM users WHERE id = m.from_user_id)
		) AS name_of_user, 
		COUNT(*) cnt
FROM messages m 
WHERE to_user_id = 21
GROUP BY from_user_id
ORDER BY cnt DESC
LIMIT 1;
