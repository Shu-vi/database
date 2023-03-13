INSERT INTO department (id, title)
VALUES (1, 'Кафедра технологий программирования'), (2, 'Кафедра анализа данных'), (3, 'Кафедра системного анализа');

INSERT INTO subject (id, title)
VALUES (1, 'ЭВМ'), (2, 'БД и СУБД'), (3, 'История');

INSERT INTO direction (id, title, number)
VALUES (1, 'Прикладная информатика', '09.03.03'), (2, 'Прикладная математика', '09.03.01'), (3, 'Прикладная математика и информатика', '09.02.02');

INSERT INTO city (id, title)
VALUES (1, 'Кошки'), (2, 'Казань'), (3, 'Набережные Челны');

INSERT INTO teacher (id, surname, name, patronymic, department_id)
VALUES (1, 'Иванов', 'Иван', 'Иванович', 1),
       (2, 'Петров', 'Пётр', 'Петрович', 2),
       (3, 'Николаев', 'Николай', 'Николаевич', 3);

INSERT INTO student (id, surname, name, patronymic, SNILS, INN, group_number, direction_id, city_id)
VALUES (1, 'Кузнецов', 'Алексей', 'Иваннович', '269-409-396 20', '801473164601', '09-951', 1, 1),
       (2, 'Смирнов', 'Иван', 'Петрович', '676-493-078 53', '7729370838', '09-051', 2, 2),
       (3, 'Попов', 'Пётр', 'Викторович', '235-842-430 70', '3671457295', '09-151', 3, 3);

INSERT INTO statement (id, student_id, semester_grade, exam_grade, rate, total_grade, teacher_id, subject_id)
VALUES (1, 1, 50, 50, 1, 100, 1, 1),
       (2, 1, 25, 45, 3, 70, 2, 2),
       (3, 2, 15, 50, 5, 65, 3, 3),
       (4, 2, 28, 39, 4, 67, 1, 1),
       (5, 3, 50, 42, 3, 92, 2, 2),
       (6, 3, 50, 50, 5, 100, 3, 3);