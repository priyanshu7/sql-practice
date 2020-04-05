SELECT 
    COUNT(salary)
FROM
    salaries;
    
SELECT 
    COUNT(distinct from_date)
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
SELECT 
    MAX(salary), MIN(salary)
FROM
    salaries;
    
SELECT 
    AVG(salary)
FROM
    salaries;
    
SELECT 
    ROUND(AVG(salary))
FROM
    salaries;
    
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    
CREATE TABLE dept_dup (
    deptno varchar(50),
    deptname VARCHAR(255)
);

drop table dept_dup;

insert into dept_dup
select * from departments;
    
insert into dept_dup(deptno) values ('d010'), ('d011');

SELECT 
    *
FROM
    dept_dup;
    
alter table employees.dept_dup 
add column dept_manager varchar(255) NULL after deptname;

commit;

SELECT 
    deptno, IFNULL(deptname, 'Department name not provided') as deptname
FROM
    dept_dup;
    
SELECT 
    deptno, deptname, COALESCE(dept_manager, deptname, 'N/A')
FROM
    dept_dup;
    
SELECT 
    deptno, deptname, COALESCE('MANAGER') as fake_col
FROM
    dept_dup;
    

