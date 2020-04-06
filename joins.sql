alter table dept_dup
Drop column dept_manager;



CREATE TABLE dept_manager_dup (
 emp_no int(11) NOT NULL,
 dept_no char(4) NULL,
 from_date date NOT NULL,
 to_date date NULL
 );

 

INSERT INTO dept_manager_dup
select * from dept_manager;

 
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES               (999904, '2017-01-01'),
                              (999905, '2017-01-01'),
                             (999906, '2017-01-01'),
                            (999907, '2017-01-01');


DELETE FROM dept_manager_dup
WHERE
   dept_no = 'd001';

   

INSERT INTO dept_dup (deptname)
VALUES              ('Public Relations');

 
 set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

DELETE FROM dept_dup
WHERE
   deptno = 'd002';
   
select * from dept_dup;

select * from dept_manager_dup;

SELECT 
    m.dept_no, d.deptname
FROM
    dept_manager_dup m
       INNER JOIN
    dept_dup d ON m.dept_no = d.deptno;
    
SELECT 
    m.emp_no,  m.dept_no, d.deptname
FROM
    dept_manager_dup m
        INNER JOIN
    dept_dup d ON m.dept_no = d.deptno
GROUP BY m.emp_no
ORDER BY d.deptno;
# always use group by while joining in order to handle duplicate rows/records

SELECT 
    m.emp_no, m.dept_no, d.deptname
FROM
    dept_manager_dup m
        LEFT JOIN
    dept_dup d ON m.dept_no = d.deptno
GROUP BY m.emp_no
ORDER BY d.deptno;

select  * from dept_dup;
select * from dept_manager_dup;

commit;


SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager m ON e.emp_no = m.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY m.dept_no, e.emp_no;


SELECT 
    m.emp_no, m.dept_no, d.deptname
FROM
    dept_manager_dup m
        RIGHT JOIN
    dept_dup d ON m.dept_no = d.deptno
ORDER BY d.deptno;


SELECT 
    *
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
group by e.emp_no
order by e.emp_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE dm.dept_no <> d.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE d.dept_no = 'd009' 
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
GROUP BY e.emp_no
ORDER BY e.emp_no , d.dept_no;

SELECT 
    e.gender, ROUND(AVG(s.salary)) AS AverageSalary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY (gender);


SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no;


SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

SELECT 
    d.dept_name, AVG(salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
    group by d.dept_name
    order by d.dept_no;
 
 # use of alias-name can be done similar to that of a variable
SELECT 
    d.dept_name, AVG(s.salary) as average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
having average_salary > 75000
ORDER BY average_salary desc;

SELECT 
    e.gender, COUNT(e.gender) AS count_of_employees
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
GROUP BY gender; 

SELECT
   e.gender, COUNT(dm.emp_no)
FROM
   employees e
       JOIN
   dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;




    