----Question: From the Employees table below, PER department compare the salaries
--   of employees who were hired first with ones who were hired last and show the 
--   difference.

CREATE TABLE dbo.Employees2 (
    employee_id int,
    first_name varchar(50),
    last_name varchar(50),
    department_id int,
    salary decimal(10, 2),
    hire_date date
)

INSERT INTO dbo.Employees2 (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES
    (1, 'Alice', 'Johnson', 101, 75000.00, '2020-02-15'),
    (2, 'Bob', 'Smith', 102, 64000.00, '2019-07-22'),
    (3, 'Charlie', 'Brown', 103, 82000.00, '2021-03-18'),
    (4, 'Diana', 'Evans', 101, 92000.00, '2018-11-05'),
    (5, 'Eve', 'Campbell', 104, 56000.00, '2022-01-10'),
    (6, 'Frank', 'Harris', 102, 72000.00, '2020-05-29'),
    (7, 'Grace', 'Lee', 103, 81000.00, '2019-09-17'),
    (8, 'Henry', 'Green', 104, 59000.00, '2021-06-01'),
    (9, 'Isabella', 'Garcia', 101, 66000.00, '2020-12-08'),
    (10, 'Jack', 'White', 102, 87000.00, '2017-08-25'),
  (11, 'Joe', 'Smith', 101, 75000.00, '2017-08-25'),
  (12, 'Lily', 'Pete', 102, 72000.00, '2017-08-25')

 

  select * from dbo.Employees2
select A.*,E1.salary as max_date_salary, E2.salary as min_date_salary, E2.salary - E1.salary as differencew from (
select department_id, max(hire_date) as max_date ,min(hire_date) as min_date from dbo.Employees2
group by department_id) as A
inner join dbo.Employees2 E1 on A.department_id = E1.department_id and A.max_date = E1.hire_date
inner join dbo.Employees2 E2 on A.department_id = E2.department_id and A.min_date = E2.hire_date


