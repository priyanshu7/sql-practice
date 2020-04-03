insert into employees
(
 emp_no,
 birth_date,
 first_name,
 last_name,
 gender,
 hire_date
) values
(
 999901,
 '1986-04-21',
 'John',
 'Smith',
 'M',
 '2011-01-01'
);


UPDATE employees 
SET 
    first_name = 'Stella',
    gender = 'F'
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    

COMMIT;

DELETE FROM employees 
WHERE
    emp_no = 999901;
    
rollback;
commit;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;

