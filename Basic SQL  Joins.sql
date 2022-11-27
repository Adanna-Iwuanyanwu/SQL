---Select the tables
SELECT*
FROM employee_name;

SELECT*
FROM employee_age;

SELECT*
FROM employee_pay;

---Inner join
---Join the employee's name table and age table
SELECT *
FROM employee_name AS name
INNER JOIN employee_age AS age
ON name.id = age.employee_id;

---Joining the employee's name table and pay table with USING
SELECT *
FROM employee_name AS name
INNER JOIN employee_pay AS pay
USING (id);

---Joining multiple tables
SELECT *
FROM employee_name AS name
INNER JOIN employee_age AS age
ON name.id = age.employee_id
INNER JOIN employee_pay AS pay
USING (id); ---Use USING when two or more tables have similar column names and matching records to join the tables

---Self Join first table
SELECT *
FROM employee_name AS name_1
INNER JOIN employee_name AS name_2
USING(id);

---Self Join second table
SELECT *
FROM employee_age AS age_1
INNER JOIN employee_age AS age_2
USING(employee_id);

---Left Join
SELECT *
FROM employee_name AS name
LEFT JOIN employee_pay AS pay
USING (id);

---Right Join
SELECT *
FROM employee_name AS name
INNER JOIN employee_age AS age
ON name.id = age.employee_id;

---Full Join
SELECT *
FROM employee_name AS name
Full JOIN pgd_result AS result
USING(id);

---Cross Join
SELECT *
FROM employee_name AS name
CROSS JOIN employee_age AS age;