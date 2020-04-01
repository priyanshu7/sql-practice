SELECT 
    first_name, last_name
FROM
    employees;

SELECT 
    *
FROM
    employees;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';
        
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F'); 
-- and > or in precednece 

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
SELECT

   dept_name

FROM

   departments

WHERE

   dept_no BETWEEN 'd003' AND 'd006';
   
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >='2000-01-01';
        
SELECT DISTINCT
    hire_date
FROM
    employees;
    
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary > 100000;
    
SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary >= 80000
GROUP BY salary
ORDER BY salary;

-- wrong query 
SELECT

   *, AVG(salary)

FROM

   salaries

WHERE

   salary > 120000

GROUP BY emp_no
ORDER BY emp_no; 
-- dept_empwrong

select *, AVG(salary)

FROM

   salaries

GROUP BY emp_no

HAVING AVG(salary) > 120000;

SELECT
   *
FROM
   dept_emp
LIMIT 100;
        

    

