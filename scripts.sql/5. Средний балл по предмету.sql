SELECT subject.id, subject.title,
       AVG(statement.total_grade) as avg_total_grade
FROM subject
         INNER JOIN statement ON subject.id = statement.subject_id
GROUP BY subject.id;