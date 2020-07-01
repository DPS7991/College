CREATE TABLE Department(
	dept_id INT PRIMARY KEY,
	dept_name VARCHAR(100) NOT NULL,
	dept_head_id INT
)

CREATE TABLE Instructor(
	instructor_id INT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	dept_id INT,
	FOREIGN KEY(dept_id) REFERENCES department(dept_id)
	ON DELETE SET NULL
)

ALTER TABLE department
ADD FOREIGN KEY(dept_head_id)
REFERENCES instructor(instructor_id)
ON DELETE SET NULL

CREATE TABLE courses(
	course_id INT PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	dept_id INT,
	instructor_id INT,
	FOREIGN KEY(dept_id) REFERENCES department(dept_id)
	ON DELETE SET NULL,
	FOREIGN KEY(instructor_id) REFERENCES instructor(instructor_id)
	ON DELETE SET NULL
)

CREATE TABLE students(
	student_id INT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL
)

CREATE TABLE enrolled_courses(
	student_id INT,
	course_id INT,
	PRIMARY KEY(student_id,course_id),
	FOREIGN KEY(student_id) REFERENCES students(student_id)
	ON DELETE CASCADE,
	FOREIGN KEY(course_id) REFERENCES courses(course_id)
	ON DELETE CASCADE
)