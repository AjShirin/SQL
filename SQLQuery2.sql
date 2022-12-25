USE my_Schooldb;

SET STATISTICS TIME,IO ON;

---- department table ----
CREATE TABLE department(
dep_id INT PRIMARY KEY,
dep_name VARCHAR(20),
dep_location VARCHAR(15)
);

---- salary_grade ----
CREATE TABLE salary_grade(
grade INT PRIMARY KEY,
min_salary INT,
max_salary INT,
);

---- employees ----
CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(15),
job_name VARCHAR(10),
manager_id INT,
hire_date DATE,
salary DECIMAL(10, 2),
commission DECIMAL(7,2),
dep_id INT REFERENCES department(dep_id)
);

INSERT INTO employees(emp_id ,emp_name,job_name,manager_id,hire_date,salary,commission,dep_id)
VALUES(68319,'KAYLING','PRESIDENT', NULL ,'1991-11-18',6000.00, NULL, 1001),
(66928,'BLAZE','MANAGER',68319,'1991-05-01',2750.00, NULL,3001),
(67832 ,'CLARE','MANAGER',68319,'1991-06-09',2550.00, NULL,1001),
(65646,'JONAS','MANAGER',68319 ,'1991-04-02', 2957.00, NULL,2001),
(67858,'SCARLET','ANALYST',65646 ,'1997-04-19',3100.00, NULL,2001),
(69062,'FRANK','ANALYST',65646,'1991-12-03',3100.00, NULL,2001),
(63679,'SANDRINE','CLERK',69062,'1990-12-18',900.00, NULL,2001),
(64989,'ADELYN','SALESMAN',66928 ,'1991-02-20',1700.00,400.00,3001),
(65271,'WADE','SALESMAN',66928,'1991-02-22',1350.00,600.00,3001),
(66564,'MADDEN','SALESMAN',66928,'1991-09-28 ',1350.00,1500.00,3001),
(68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600.00, 0.00,3001),
(68736,'ADNRES','CLERK', 67858,'1997-05-23',1200.00, NULL,2001),
(69000,'JULIUS','CLERK', 66928,'1991-12-03',1050.00, NULL,3001),
(69324,'MARKER','CLERK', 67832 ,'1992-01-23',1400.00, NULL, 1001);

INSERT INTO salary_grade(grade,min_salary,max_salary)
VALUES(1,800,1300),
(2,1301,1500),
(3,1501,2100),
(4,2101,3100),
(5,3101,9999);

INSERT INTO department(dep_id,dep_name,dep_location)
VALUES(1001,'FINANCE','SYDNEY'),
(2001,'AUDIT','MELBOURNE'),
(3001,'MARKETING','PERTH'),
(4001,'PRODUCTION','BRISBANE');

SELECT * FROM department;
SELECT * FROM salary_grade;
1. SELECT * FROM employees;
2. SELECT salary FROM employees;
3. SELECT DISTINCT job_name FROM employees;
4. SELECT emp_name, (salary*15) AS Increased_Salary_By_15_percent FROM employees;
5. SELECT CONCAT(emp_name,' ', job_name) AS employee_and_Job FROM employees;
6. SELECT emp_id, emp_name,salary , hire_date,FORMAT(hire_date,'MMM dd yyyy' ) AS New_hire_date FROM employees;
7. SELECT Count (*) AS Employee_Salary_More_than_2200 FROM employees  WHERE salary>2200;
8. SELECT DISTINCT job_name AS Unique_Jobs, dep_id FROM employees;
9. SELECT * FROM employees WHERE dep_id NOT IN (2001);
10. SELECT * FROM employees WHERE hire_date<('1991-1-1');
11. SELECT AVG(salary) AS Average_Salary_OF_ANALYST FROM employees WHERE job_name='ANALYST';
12. SELECT * From employees Where emp_name LIKE 'B%' OR emp_name LIKE '%E';
13. SELECT * From department Where dep_name LIKE 'B%' OR dep_name LIKE '%E';
14. SELECT * FROM department WHERE dep_location LIKE 'F%' OR dep_location LIKE '%N';
15. SELECT employees.emp_id, employees.emp_name, employees.manager_id,employees.hire_date,employees.salary,employees.commission,employees.dep_id,department.dep_location,department.dep_name FROM employees,department WHERE employees.commission > employees.salary;
16. SELECT *FROM employees WHERE (25*salary) > 3000;
17. SELECT *FROM employees WHERE MONTH(hire_date) = 1;
18. SELECT CONCAT(emp_name, ' works for ', manager_id) AS 'Employee_and_Manager' FROM employees ;
19. SELECT * FROM employees WHERE job_name = 'CLERK';
20. SELECT emp_id, hire_date FROM employees WHERE hire_date <= DATEADD(year, -27, GETDATE());
21. SELECT * FROM employees WHERE salary <3500;
22. SELECT emp_name, job_name, salary FROM employees WHERE job_name = 'ANALYST';
23. SELECT * FROM employees WHERE FORMAT (hire_date,'YYY') IN ('1991');
24. SELECT * FROM employees WHERE FORMAT(hire_date,'YYYY') NOT IN ('1991');
25. SELECT emp_id,emp_name, hire_date,salary FROM employees WHERE hire_date<('1991-4-1');
26. SELECT e.emp_name, e.job_name FROM employees e WHERE manager_id IS NULL;
27. SELECT * FROM employees WHERE hire_date = '1991-05-01';
28. SELECT * FROM employees WHERE manager_id IN (68319);
29. 
30. 
31. 
32.
33. SELECT * FROM employees WHERE FORMAT(hire_date,'MON') LIKE 'APR%';
34.
35.
36.
37.
38.
39.
40.
41.
42.
43.
44.
45.
46.
47.
48.
49.
50. SELECT e.emp_name, e.job_name, (12*e.salary)"Annual Salary", e.dep_id, d.dep_name, s.grade
FROM employees e, department d, salary_grade s
WHERE e.dep_id = d.dep_id AND e.salary BETWEEN s.min_salary AND s.max_salary
  AND (((12*e.salary)>= 60000) OR (e.job_name != 'ANALYST'))
51. SELECT * FROM employees e1, employees e2m
WHERE e1.manager_id = e2m.emp_id AND e1.salary> e2m.salary;
52. SELECT e.emp_name, e.dep_id, e.salary, e.commission
FROM employees e, department d
WHERE e.dep_id = d.dep_id AND d.dep_location = 'PERTH' AND e.salary BETWEEN 2000 AND 5000;
53. SELECT s.grade, e.emp_name FROM employees e, salary_grade s
WHERE e.dep_id IN (1001,3001) AND hire_date < ('1992-12-31')
AND (e.salary BETWEEN s.min_salary AND s.max_salary AND s.grade NOT IN (4));
54. SELECT w.emp_id, w.emp_name, w.job_name, w.manager_id, w.hire_date, w.salary, w.dep_id, m.emp_name
FROM employees w, employees m WHERE w.manager_id = m.emp_id AND m.emp_name = 'JONAS';
55. SELECT e.emp_name, e.salary FROM employees e, salary_grade s
WHERE e.emp_name = 'FRANK' AND e.salary BETWEEN s.min_salary AND s.max_salary AND e.salary = s.max_salary ;
56. SELECT * FROM employees WHERE job_name IN ('MANAGER','ANALYST') AND salary BETWEEN 2000 AND 5000
 AND commission IS NULL;
57. SELECT * FROM employees WHERE job_name IN ('MANAGER','ANALYST')
AND salary BETWEEN 2000 AND 5000AND commission IS NULL;
58.  
59.
60. SELECT * FROM employees w, employees m WHERE w.manager_id = m.emp_id AND w.hire_date < m.hire_date;
61. SELECT * FROM employees e, salary_grade s WHERE e.salary BETWEEN s.min_salary AND s.max_salary
  AND s.grade = 4;
62.
63. SELECT * FROM employees  ORDER BY salary ASC;
64. SELECT * FROM employees ORDER BY dep_id ASC, job_name DESC;
65. SELECT DISTINCT job_name FROM employees ORDER BY job_name DESC;
66. SELECT emp_id, emp_name, salary Monthly_Salary,salary/30 Daily_Salary, 12*salary Anual_Salary
FROM employees ORDER BY Anual_Salary ASC;
67. SELECT * FROM employees
WHERE job_name='CLERK' OR job_name='ANALYST' ORDER BY job_name DESC;
68. SELECT dep_location FROM department d, employees e
WHERE e.emp_name = 'CLARE' AND e.dep_id = d.dep_id ;
69. SELECT * FROM employees WHERE hire_date IN ('1991-5-01','1991-12-03','1990-01-19')
ORDER BY hire_date ASC;
70. SELECT * FROM employees WHERE salary < 1000 ORDER BY salary;
71. 
72. 
73.
74. SELECT * FROM employees WHERE job_name NOT IN ('PRESIDENT','MANAGER') ORDER BY salary ASC;
75. SELECT * FROM employees WHERE (12*salary) < 25000 ORDER BY salary ASC;
76. SELECT e.emp_id, e.emp_name, 12*salary "Annual Salary",(12*salary)/365 "Daily Salary"
FROM employees e WHERE e.job_name = 'SALESMAN' ORDER BY "Annual Salary" ASC;
77.
78.
79.
80.
81.
82.
83.
84.
85.
86.
87.
88.
89.
90.
91.
92.
93.
94.
95.
96.
97.
98.
99.
100.
101.
102.
103.
104.
105.
106.
107.
108.
109.
110.
111.
112.