SELECT gender, 
	MIN(age) AS Минимальный_возраст, 
	MAX(age) AS Максимальный_возраст
FROM animal
GROUP BY gender;
-----------------------------
SELECT country_id, AVG(age)
FROM animal
GROUP BY country_id
HAVING AVG(age) > 5 
ORDER BY country_id;
-----------------------------
SELECT kind_id, age, country_id,
	AVG(age) OVER (PARTITION BY country_id) AS Среднее_значение_по_стране
FROM animal