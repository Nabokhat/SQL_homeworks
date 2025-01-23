

-- Homework 1: Use a Temporary Table
-- Create a temporary table to store employees hired in the last year and their department names.
-- Then return the contents of the temporary table.
---------------------------------------------------------------------------------------------
-- Homework 2: Advanced Stored Procedure
-- Create a stored procedure that assigns an employee to a project.
-- Input: EmployeeID, ProjectID, HoursWorked
-- Output: Success/Failure Message
----------------------------------------------------------------------------------------------
-- Homework 3: Create a View for Analysis
-- Create a view that lists all active projects (projects that have not ended yet)
-- and the number of employees assigned to each project
----------------------------------------------------------------------------------------------------------------
--Homework 4:
--- write a query to check number is perfect or not

---1

create temporary table Employees as
select e.EmployeeID, e.Name, d.DepartmentName
      from Employees e
      join Departments d ON e.DepartmentID = d.DepartmentID
      where e.HireDate >= dateadd(year, -1, getdate());

select * from Employees;

--2
--Bajarolmaganman so'rash kerak

---3
	create view 
	ActiveProjects as
select
    p.ProjectID, 
    p.ProjectName, 
    count(pa.EmployeeID) as EmployeeCount
   from
    [dbo].[Projects] p
left join 
    [dbo].[Projects]Assignments pa 
	on p.ProjectID = pa.ProjectID
where 
    p.EndDate > getdate() or p.EndDate is null
group by
    p.ProjectID, p.ProjectName;


---4
declare @Number int = 32;  

select 
    case 
        when sum (divideby)  = @Number then 'Perfect Number' 
        else 'Not a Perfect Number' 
    end as Result
    from
    (select n as divideby 
    from  
    (select @Number as n) as a 
     full join
     (select top (@Number - 1) row_number() over (order by (select null)) as num 
          from master..spt_values) as b 
     on b.num < n 
     where n % b.num = 0) as divisors;




 


