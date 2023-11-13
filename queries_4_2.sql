SELECT animal.id, animal.age, animal.gender, kind.kind, class.class_name AS class
FROM animal 
	INNER JOIN kind 
	ON animal.kind_id = kind.id
	INNER JOIN class 
	ON kind.class_name_id = class.id;
-----------------------------
SELECT country.country, animal.id 
FROM country LEFT JOIN animal
	ON country.id = animal.country_id;
-----------------------------
SELECT country.country, animal.id 
FROM country RIGHT JOIN animal
	ON country.id = animal.country_id;
-----------------------------
SELECT class.class_name, kind.kind
FROM class FULL JOIN kind 
	ON class.id = kind.class_name_id;
-----------------------------
SELECT class.class_name, kind.kind
FROM class
CROSS JOIN kind;
-----------------------------
SELECT a1.*, a2.id AS relative_id
FROM animal a1 JOIN animal a2 -- Найти животных одного вида
	ON a1.kind_id = a2.kind_id AND a1.id <> a2.id;
-- Self-Join
SELECT kind.kind, class.class_name
FROM kind JOIN class
	ON kind.class_name_id = class.id;