------------------------task 7(3.FUNCTION)--------------------------------------------
--Create user define function with  multi if statement,check.
--1.create a get_salary_grade function that return employee grade based on salary range using multi if condition.
create or replace function get_salary_grade(salary numeric)
returns text as $$
declare
    grade text;
begin
    if salary >= 100000 then
        grade := 'A+';
    end if;

    if salary < 100000 and salary >= 75000 then
        grade := 'A';
    end if;

    if salary < 75000 and salary >= 50000 then
        grade := 'B';
    end if;

    if salary < 50000 and salary >= 30000 then
        grade := 'C';
    end if;

    if salary < 30000 then
        grade := 'D';
    end if;

    return grade;
end;
$$ language plpgsql;

--check that function
select get_salary_grade(50000);------output(B)
select get_salary_grade(15000);------output(D)
-----------------------------------------------------------------------------
--2.create a is_even_or_odd function check number(odd or even).

create or replace function is_even_or_odd(numeric_input numeric)
returns text as $$
begin
  if mod(numeric_input,2)=0 then
     return 'EVEN' ;
  else 
     return 'ODD';
  end if ;	 
end;
$$ language plpgsql;

--check that function.
select is_even_or_odd(21);------EVEN
select is_even_or_odd(10);------EVEN
-----------------------------------------------------------------------------
--3.create a age_group function for age group classifiaction.

create or replace function age_group(age int)
returns text as $$
begin
 return case
   when age < 13 then 'child'
   when age < 20 then 'teen' 
   when age < 60 then 'adult'
   else 'senior citizen'
 end;
end;
$$ language plpgsql;


--check that function.
select age_group(17);----teen
select age_group(12);----child
select age_group(61);----senior citizen
---------------------------------------------------------------------------------
--create day_type function to show (weekday or weekend).

create or replace function day_type(day_name text)
returns text as $$
begin 
    return case lower(day_name)
	when 'saturday' then 'weekend'
	when 'sunday'   then 'weekend'
	when 'monday' then 'weekday'
	when 'tuesday' then 'weekday'
	when 'wednesday' then 'weekday'
	when 'thursday' then 'weekday'
    when 'friday' then 'weekday'
	else
	     'invalid day'
	end;
end;
$$ language plpgsql;

--check that function.
select day_type('sunday');----weekend
select day_type('monday');----weekday

---------------------TASK-7 COMPLETED--------------------------
 


















