SELECT city.id, city.title,
       AVG(statement.total_grade) as avg_total_grade
FROM city
         INNER JOIN student ON city.id = student.city_id
         INNER JOIN statement ON student.id = statement.student_id
GROUP BY city.id;