------------------------task 7(1.ENUM)--------------------------------------------
--create two ENUM using alter cammand and create cammand.

--for this task using student table.
select * from student1;

--1.create student_status enum for checking status of student.
create type student_status as enum('active','inactive','graduate');

--using alter cammand for add enum on that column.
alter table student1
add column student_status1 student_status ;

----insert value in student1 table for checking this enum.
insert into student1 values(1,1,'rohan','shinde','2000-12-12',null,67.00,'rohan@gmail.com','2024-02-02','active');
---------------------------------------------------------------------------------------------------------------------

--2.create employment_status enum for checking employment status.
create type employment_status as enum('full_time','part_time','contract','intern','terminated');

--create the employee1 table using employment_status enum.
CREATE TABLE employee1 (
    emp_id SERIAL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INT CHECK (age > 0),
    department TEXT,
    status employment_status NOT NULL DEFAULT 'full_time', --employment_status enum 
    joining_date DATE
);

------insert value in employee1 table for checking employment_status enum.
INSERT INTO employee1 (emp_name, age, department, status, joining_date)
VALUES                ('mohan shinde', 28, 'HR', 'full_time', '2022-06-15'),
                      ('ravi bishnoi', 22, 'IT', 'intern', '2023-01-10'),
                      ('rohit sharma', 35, 'Finance', 'contract', '2021-11-01')
			          ;

select * from employee1;
-------------------------------end task-1------------------------------------------
					  











