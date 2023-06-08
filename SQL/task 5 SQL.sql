/* Найти список ID отделов с максимальной суммарной зарплатой сотрудников */

SELECT department_id FROM(
SELECT department_id,SUM(salary) AS 'salary_sum' FROM employee
GROUP BY department_id
HAVING salary_sum =
(SELECT MAX(sum_salary) FROM
(SELECT department_id, SUM(salary) AS 'sum_salary' FROM employee
GROUP BY department_id)))

