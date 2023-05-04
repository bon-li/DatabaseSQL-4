--Assign2.sql
--Bonita Li
--s10_libon

--1) Write a PL/SQL code to display employee details along with region and country name of 5 lowest paid employees.

select e.*, r.region_name, c.country_name
from hr.employees e
inner join hr.departments d on e.department_id = d.department_id
inner join hr.locations l on d.location_id = l.location_id
inner join hr.countries c on l.country_id = c.country_id
inner join hr.regions r on c.region_id = r.region_id
where 5 > (select count(*) from hr.employees where e.salary > salary);



--2) Write a PL/SQL block of code to generate Fibonacci series between 1 to 100.
set serveroutput on
declare
    num1 number := 0;
    num2 number := 1;
    temp number;
    n number := 11;
    i number;
begin
    dbms_output.put_line(num1);
    dbms_output.put_line(num2);
    
    for i in 2..n
    loop
        temp := num1+num2;
        num1 := num2;
        num2 := temp;
        dbms_output.put_line(temp);
    end loop;
end;

--3) Create PL/SQL block of code to display all records of employee table using explicit cursors.
set serveroutput on
declare
    v_employees hr.employees%rowtype;
    cursor c_employees IS
    select * from hr.employees;
begin
    open c_employees;
    loop
        fetch c_employees into v_employees;
        exit when c_employees%notfound;
        dbms_output.put_line('Employee ID: '|| v_employees.employee_id ||' Name: ' ||v_employees.first_name || ' ' || v_employees.last_name ||' Email: ' || v_employees.email || ' Phone number: ' || v_employees.phone_number || ' Hire date: ' || v_employees.hire_date || ' Job ID: ' || v_employees.job_id || ' Salary: ' || v_employees.salary || ' Commission %: ' || v_employees.commission_pct || ' Manager ID: ' || v_employees.manager_id || ' Department ID: ' || v_employees.department_id);
    end loop;
    close c_employees;
end;
