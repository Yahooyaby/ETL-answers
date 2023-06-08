/* Шестую Задачу я не смог сделать самостоятельно, обратился за помощью к нейросети, ответ CHATGPT я не до конца считаю правильным, так как он не учитывает, сколько столбцов должно быть в таблице, смог только разобрать как сама программа работает*/

CREATE TABLE Table2 (
  Id INT PRIMARY KEY,
  Name VARCHAR(255),
  Parent_Name_1 VARCHAR(255),
  Parent_Name_2 VARCHAR(255),
  Parent_Name_3 VARCHAR(255),
  -- добавляем столбцы для родителей N уровня, если необходимо
);

WITH RECURSIVE cte (Id, Name, Parent_Id, Parent_Name_1) AS (
  SELECT Id, Name, Parent_Id, NULL
  FROM Table1
  WHERE NOT EXISTS (SELECT 1 FROM Table1 WHERE Parent_Id = Table1.Id)
  UNION ALL
  SELECT t.Id, t.Name, t.Parent_Id, c.Name
  FROM Table1 t
  JOIN cte c ON c.Parent_Id = t.Id
)
INSERT INTO Table2 (Id, Name, Parent_Name_1)
SELECT Id, Name, Parent_Name_1 FROM cte;

-- заполняем столбцы для родителей N уровня
DECLARE @level INT = 2;
WHILE EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Table2' AND COLUMN_NAME = 'Parent_Name_' + CAST(@level AS VARCHAR))
BEGIN
  UPDATE Table2 SET [Parent_Name_ + CAST(@level AS VARCHAR)] = c.Parent_Name_1
  FROM Table2 t
  JOIN cte c ON c.Id = t.Parent_Id
  WHERE t.[Parent_Name_ + CAST(@level-1 AS VARCHAR)] = c.Name;
  
  SET @level = @level + 1;
END;