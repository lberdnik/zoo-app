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

select * from employee
order by lastname;

select * from employee
order by lastname DESC;