/* Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том-же отделе */

SELECT name FROM employee
 WHERE chief_id IS NULL AND department_id IN 
 (SELECT department_id FROM employee
GROUP BY department_id
HAVING COUNT(DISTINCT(chief_if) = 1)

