-- Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT p.gender AS gender, COUNT(*) AS likes_number
FROM likes l
	JOIN profiles p ON (l.user_id = p.user_id)
GROUP BY gender
ORDER BY likes_number DESC
LIMIT 1;
