SELECT teacher.id, teacher.surname, teacher.name, teacher.patronymic,
       AVG(statement.total_grade) as avg_total_grade
FROM teacher
         INNER JOIN statement ON teacher.id = statement.teacher_id
GROUP BY teacher.id;