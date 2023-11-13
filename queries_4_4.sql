SELECT *
FROM animal a
WHERE EXISTS (
    SELECT 1
    FROM placement p
    WHERE p.id = a.placement_id
    AND p.heating = TRUE
);
-----------------------------
SELECT id, kind_id, age,
  CASE
    WHEN age < 1 THEN 'Baby'
    WHEN age >= 1 AND age < 5 THEN 'Young'
    WHEN age >= 5 AND age < 10 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group
FROM
  animal
ORDER BY age;
-----------------------------
EXPLAIN SELECT firstname, lastname FROM employee;
-----------------------------
EXPLAIN SELECT * FROM animal WHERE age < 10;