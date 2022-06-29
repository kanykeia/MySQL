/*Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
 */

SELECT COUNT(*)
FROM likes
WHERE media_id IN 
	(SELECT id 
	FROM media WHERE user_id IN (
		SELECT user_id FROM profiles AS p WHERE (TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10)))
;
