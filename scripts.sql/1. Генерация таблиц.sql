CREATE TABLE department(
                           id SERIAL PRIMARY KEY NOT NULL,
                           title VARCHAR(255) NOT NULL
);
CREATE TABLE subject(
                        id SERIAL PRIMARY KEY NOT NULL,
                        title VARCHAR(255) NOT NULL
);
CREATE TABLE direction(
                          id SERIAL PRIMARY KEY NOT NULL,
                          title VARCHAR(255) NOT NULL,
                          number VARCHAR(20) NOT NULL
);

CREATE TABLE city(
                     id SERIAL PRIMARY KEY NOT NULL,
                     title VARCHAR(100) NOT NULL
);
CREATE TABLE teacher(
                        id SERIAL PRIMARY KEY NOT NULL,
                        surname VARCHAR(50) NOT NULL,
                        name VARCHAR(50) NOT NULL,
                        patronymic VARCHAR(50) NOT NULL,
                        department_id INTEGER NOT NULL REFERENCES department(id)
);
CREATE TABLE student(
                        id SERIAL PRIMARY KEY NOT NULL,
                        surname VARCHAR(50) NOT NULL,
                        name VARCHAR(50) NOT NULL,
                        patronymic VARCHAR(50) NOT NULL,
                        SNILS VARCHAR(14) NOT NULL,
                        INN VARCHAR(12) NOT NULL,
                        group_number VARCHAR(10) NOT NULL,
                        direction_id INTEGER NOT NULL REFERENCES direction(id),
                        city_id INTEGER NOT NULL REFERENCES city(id)
);

CREATE TABLE statement(
                          id SERIAL PRIMARY KEY NOT NULL,
                          student_id INTEGER NOT NULL REFERENCES student(id),
                          semester_grade SMALLINT NOT NULL,
                          exam_grade SMALLINT NOT NULL,
                          rate SMALLINT NOT NULL,
                          total_grade SMALLINT NOT NULL,
                          teacher_id INTEGER NOT NULL REFERENCES teacher(id),
                          subject_id INTEGER NOT NULL REFERENCES subject(id)
);