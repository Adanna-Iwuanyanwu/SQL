---Select the entire data
SELECT*
FROM pgd_result;

---select few columns
SELECT id, course_title, score, grade
FROM pgd_result;

---using alias
SELECT id, course_title AS course_names, score
FROM pgd_result;

---selecting distinct records
SELECT DISTINCT grade, score
FROM pgd_result;

---view (a virtual table)
CREATE VIEW pub_health AS
SELECT id, course_title, score, grade
FROM pgd_result;

---using view
SELECT id, course_title
FROM pub_health
LIMIT 5;

---Count
SELECT COUNT(score) AS score_num
FROM pgd_result;

---count mulptiple columns
SELECT COUNT(score) AS score_num, COUNT(grade)AS grade_num
FROM pgd_result;

SELECT COUNT(*) AS table_num
FROM pgd_result;

---using duplicate
SELECT DISTINCT grade
FROM pgd_result;

---using count and distinct
SELECT COUNT(DISTINCT grade) AS grade_score
FROM pgd_result;

---Order of execution
SELECT course_title
FROM pgd_result
LIMIT 5;

---filtering words
---Select the course with score 85.48.
SELECT course_title, score, grade
FROM pgd_result
WHERE score = 85.48;

---what scores are less than 70.05?
SELECT course_title, score, grade
FROM pgd_result
WHERE score < 70.05;

---selecting the highest scores
SELECT course_title, score, grade
FROM pgd_result
WHERE score = 85.48 OR score = 82.6;

---scores greater than and equal to 78.76 and less than and equal to 85.48
SELECT course_title, score, grade
FROM pgd_result
WHERE score >= 78.76 AND score <= 85.48;

---scores greater than 70.05 and less than and equal to 79.8
SELECT course_title, score, grade
FROM pgd_result
WHERE score > 70.05 AND score <= 79.8;

---filter scores between 82.6 or 85.48, and 65.8 or 52.6
SELECT course_title, score, grade
FROM pgd_result
WHERE score = 85.48 OR score = 82.6 AND score = 65.8 OR score = 52.6;

---scores between 52.6 and 85.48
SELECT course_title, score, grade
FROM pgd_result
WHERE score BETWEEN 70.05 AND 79.8;

---Wildcard position
---course_titles that starts with H
SELECT course_title, score, grade
FROM pgd_result
WHERE course_title LIKE 'Health%';

---All course_titles that have H in them
SELECT course_title, score, grade
FROM pgd_result
WHERE course_title LIKE '%Health%';

SELECT course_title, score, grade
FROM pgd_result
WHERE course_title LIKE 'Health%';

---course_titles that start with H
SELECT course_title, score, grade
FROM pgd_result
WHERE course_title LIKE 'H%'

---course_titles that have H in them
SELECT course_title, score, grade
FROM pgd_result
WHERE course_title LIKE '%H%'

---Using IN instead of many LIKE to find words
SELECT course_title, score, grade
FROM pgd_result
WHERE course_title IN ('Human Ecology', 'Public Health Methods', 'Healthcare In Nigeria');

---Aggregate function
SELECT AVG(score)
FROM pgd_result;

SELECT SUM(score)
FROM pgd_result;

SELECT MAX(score)
FROM pgd_result;

SELECT MIN(score)
FROM pgd_result;

---Using WHERE with aggregate function
---Select average score where gpa is greater than 20
SELECT pgd_result.course_title, pgd_result.grade, AVG(score) AS avg_score
FROM pgd_result
WHERE gpa >= 20
GROUP BY pgd_result.course_title, pgd_result.grade
ORDER BY avg_score DESC;

---Select the average score where gpa is less than 10
SELECT pgd_result.course_title, pgd_result.grade, AVG(score) AS avg_score
FROM pgd_result
WHERE gpa <= 10
GROUP BY pgd_result.course_title, pgd_result.grade
ORDER BY avg_score DESC;

---Select the maximum score where gpa is equal to 10
SELECT pgd_result.course_title, pgd_result.grade, MAX(score) AS max_score, pgd_result.gpa
FROM pgd_result
WHERE gpa = 10
GROUP BY pgd_result.course_title, pgd_result.grade, pgd_result.gpa
ORDER BY max_score;

---Select the Minimum score where gpa is equal to 8
SELECT pgd_result.course_title, pgd_result.grade, MIN(score) AS min_score, pgd_result.gpa
FROM pgd_result
WHERE gpa = 8
GROUP BY pgd_result.course_title, pgd_result.grade, pgd_result.gpa
ORDER BY min_score;

---Round Number
---Select the maximum score where gpa is equal to 10pgd_result.grade
SELECT pgd_result.course_title, pgd_result.grade, ROUND(AVG(score)) AS avg_score
FROM pgd_result
WHERE gpa >= 20
GROUP BY pgd_result.course_title, pgd_result.grade;


