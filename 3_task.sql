-- Определить кто больше поставил лайков (всего): мужчины или женщины --
SELECT gender, COUNT(*) AS likes
FROM (SELECT user_id AS user, 
	(SELECT gender FROM profiles p WHERE user_id = user) AS gender
	FROM likes) AS dummy
GROUP BY gender
ORDER BY likes DESC
LIMIT 1;
