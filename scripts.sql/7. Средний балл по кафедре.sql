SELECT department.id, department.title,
       AVG(statement.semester_grade) as avg_semester_grade,
       AVG(statement.exam_grade) as avg_exam_grade,
       AVG(statement.rate) as avg_rate,
       AVG(statement.total_grade) as avg_total_grade
FROM department
         INNER JOIN teacher ON department.id = teacher.department_id
         INNER JOIN statement ON teacher.id = statement.teacher_id
GROUP BY statement.total_grade;