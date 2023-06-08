/*Вывести список сотрудников, получающих максимальную заработную плату в своём отделе */

SELECT employee.*
FROM employee
JOIN (
  SELECT depatament_id, MAX(salary) AS max_salary
  FROM employee
  GROUP BY depatament_id
) max_salaries
ON employee.depatament_id = max_salaries.depatament_id
AND employee.salary = max_salaries.max_salary;
