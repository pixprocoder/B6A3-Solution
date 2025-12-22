-- Active: 1766398632656@@127.0.0.1@5432@school

EXPLAIN
ANALYZE
SELECT *
FROM employees as e
    INNER JOIN departments as d using (department_id)