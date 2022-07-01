-- Пусть задан некоторый пользователь. 
-- Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
-- user_id = 1

SELECT messages.from_user_id , CONCAT(users.firstname, ' ', users.lastname) AS name, COUNT(*) AS cnt
	FROM users
		JOIN messages ON users.id = messages.from_user_id 
	WHERE messages.to_user_id = 1
	GROUP BY messages.from_user_id 
	ORDER BY cnt DESC
	LIMIT 1;
