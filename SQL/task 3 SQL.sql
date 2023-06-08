/* Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек */

SELECT department_id FROM
(SELECT department_id, COUNT(name) AS 'count_employee' FROM employee
GROUP BY department_id
HAVING count_employee <= 3)
