------------------------task 7(2.DOMAINS)--------------------------------------------
--1.create three domain salary_type only accept positive numbers.
create domain salary_type as numeric(10)
check(value >= 0);

--2.create domain emp_code_type only accept fixed length alphanumeric(e.g. 'EMP123').
create domain emp_code_type as text check (value ~ '^[A-Z]{3}[0-9]{3}$');

--3.create domain gender_type and that limit set of values.
create domain gender_type as text check (value in('male','female','others'));

---------------------------------------------------------------------------------
--1.create a table using gender_type domain.
CREATE TABLE employee_details1 (
    emp_id SERIAL PRIMARY KEY,
    emp_code emp_code_type UNIQUE,
    emp_name TEXT NOT NULL,
    gender gender_type,        -----gender_type
    salary salary_type         -----salary_type
);

--2.insert sample data in employee_details1 table for checking domains.
insert into employee_details1 (emp_code, emp_name, gender, salary) 
values                        ('EMP001', 'Anita Sharma', 'Female', 55000.00),
						      ('EMP002', 'Raj Verma', 'Male', 67000.50),
							  ('EMP003', 'Ravi Kumar', 'male', 45000.00)
							  ;
							  
--3.using alter for add new column using bonus_type domain.

-- First, create a domain for bonus
create domain bonus_type as numeric
check (value >= 0 and value <= 100000);

-- Then, add to table
alter table employee_details1
add column bonus bonus_type default 0;

-------------------------end task-2------------------------------------------












