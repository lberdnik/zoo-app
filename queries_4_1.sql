SELECT *
FROM animal
WHERE (age BETWEEN 5 AND 7) AND arrival_date > '2020-01-01';

SELECT *
FROM animal INNER JOIN kind 
	ON animal.kind_id = kind.id
WHERE (kind.class_name_id = 2 OR kind.kind LIKE 'А%' OR kind.kind LIKE 'Б%') -- Птицы (class_name_id = 2)
	AND animal.arrival_date < '2021-01-01';
-----------------------------
SELECT age, arrival_date
FROM animal
WHERE arrival_date = (
        SELECT MIN (arrival_date)
		FROM animal
      );

SELECT *
FROM animal
WHERE kind_id IN (
    SELECT id
    FROM kind
    WHERE class_name_id = 2  -- Птицы
) AND country_id = 8;  -- Беларусь
-----------------------------
SELECT kind_id
FROM animal
WHERE arrival_date < '2023-01-01' AND placement_id IN (
    SELECT id
    FROM placement
    WHERE reservoir = FALSE  -- Размещение в вольерах
);

SELECT age, gender
FROM 
	animal JOIN 
		(
        SELECT kind_id, AVG(age) as avg_age
        FROM animal
        GROUP BY kind_id
		HAVING AVG(age) >= 7
    	) AS query_in
	ON animal.kind_id = query_in.kind_id;

-- Животные, у которых возраст меньше, чем у всех остальных животных того же вида
SELECT a1.id, a1.age, a1.gender, a1.arrival_date, a1.placement_id, a1.country_id, a1.kind_id
FROM animal a1
WHERE a1.age < ALL (
    SELECT age
    FROM animal a2
    WHERE a1.kind_id = a2.kind_id AND a1.id <> a2.id
);