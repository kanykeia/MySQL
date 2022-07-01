-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
SELECT COUNT(*) AS likes_number
FROM likes l
	JOIN media m ON (l.media_id = m.id)
	JOIN profiles p ON (m.user_id = p.user_id)
WHERE (TIMESTAMPDIFF(YEAR,p.birthday, NOW()) < 10); 
