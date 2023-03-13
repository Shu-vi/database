SELECT student.id, student.surname, student.name, student.patronymic,
       AVG(statement.total_grade) as avg_total_grade
FROM student
         INNER JOIN statement ON student.id = statement.student_id
GROUP BY student.id;