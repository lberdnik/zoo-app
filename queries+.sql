SELECT *
FROM animal;

UPDATE animal
SET age='13' WHERE ID=3;

SELECT * FROM animal
WHERE gender='M';

SELECT country_id FROM animal
WHERE kind_id = 3;

SELECT COUNT(*) FROM employee
WHERE firstname='Елена';

SELECT * FROM employee
order by lastname;

SELECT * FROM employee
order by lastname DESC;

SELECT lastname, firstname
FROM employee
order by lastname ASC, firstname DESC;

SELECT DISTINCT reservoir, heating
FROM placement;

SELECT COUNT(DISTINCT firstname)
FROM employee;

SELECT *
FROM animal
WHERE age >= 10;

SELECT COUNT(*)
FROM placement
WHERE heating = 'true';

SELECT COUNT(*)
FROM placement
WHERE reservoir <> 'false';

SELECT COUNT(*)
FROM animal
WHERE arrival_date > '2021-01-01';

SELECT *
FROM animal
WHERE arrival_date >= '2021-01-01';

SELECT *
FROM animal
WHERE arrival_date < '2021-01-01' AND gender = 'F';

SELECT *
FROM placement
WHERE heating = 'true' OR reservoir = 'true';

SELECT *
FROM placement
WHERE number > 5 AND (heating = 'true' OR reservoir = 'true');

SELECT *
FROM animal
WHERE age BETWEEN 5 AND 10;

SELECT *
FROM animal
WHERE country_id IN (2, 9, 13, 16);

SELECT *
FROM animal
WHERE country_id NOT IN (2, 6);

SELECT MIN (arrival_date)
FROM animal;

SELECT MAX (arrival_date)
FROM animal;

SELECT AVG(age)
FROM animal;

SELECT *
FROM employee
WHERE firstname LIKE 'А%';

SELECT *
FROM employee
WHERE firstname LIKE '%а%';

SELECT *
FROM employee
WHERE firstname LIKE 'А%а';

SELECT *
FROM employee
WHERE firstname LIKE '_в%';

SELECT *
FROM employee
WHERE firstname LIKE '_а%'
LIMIT 2;

SELECT gender, COUNT(*)
FROM animal
WHERE age > 3
GROUP BY gender
ORDER BY COUNT(*) DESC;

SELECT gender, MIN(age)
FROM animal
WHERE arrival_date > '2020-01-01'
GROUP BY gender
HAVING gender = 'F'
ORDER BY MIN(age);