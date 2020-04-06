CREATE TABLE employees_dup (
    emp_no INT,
    birth_date DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender ENUM('M', 'F'),
    hire_date DATE
);

insert into employees_dup
select e.* 
from 
employees e 
limit 20;

select * from employees_dup;

insert into employees_dup values ( 10001, '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

-- Union vs Union All

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;
    
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no = 10001 
UNION SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;
    
    
/* Union all includes the duplicates whereas union doesn't, 
also union is computationally more demanding and takes more time in execution*/

SELECT
   *
FROM
   (SELECT
       e.emp_no,
           e.first_name,
           e.last_name,
           NULL AS dept_no,
           NULL AS from_date
   FROM
       employees e
   WHERE
       last_name = 'Denis' UNION SELECT
       NULL AS emp_no,
           NULL AS first_name,
           NULL AS last_name,
           dm.dept_no,
           dm.from_date
   FROM
       dept_manager dm) as a
ORDER BY -a.emp_no DESC;