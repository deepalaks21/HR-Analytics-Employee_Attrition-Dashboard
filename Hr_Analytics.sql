create database hr_analytics;
use hr_analytics;
show tables;

select count(*) as total_employees from employees;

describe employees;

-- Total employees
select count(*) as total_employees
from employees;

-- Employees by Department

select department,count(*) as employee_count
from employees
group by (department);

-- Attrition count

select attrition,count(*) as employee_count
from employees
group by attrition;

 -- Overall Attrition Rate
SELECT
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS attrition_rate
FROM employees;

-- Attrition by Department
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY Department;

-- Attrition by Job Role
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY JobRole
ORDER BY attrition_count DESC;

-- Average Monthly Income
SELECT ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income
FROM employees;

--  Average Income by Department
SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS average_income
FROM employees
GROUP BY Department
ORDER BY average_income DESC;

--  Overtime vs Attrition
SELECT
    OverTime,
    Attrition,
    COUNT(*) AS employee_count
FROM employees
GROUP BY OverTime, Attrition
ORDER BY OverTime, Attrition;

--  Job Satisfaction vs Attrition
SELECT
    JobSatisfaction,
    Attrition,
    COUNT(*) AS employee_count
FROM employees
GROUP BY JobSatisfaction, Attrition
ORDER BY JobSatisfaction;

-- Average Age by Attrition
SELECT
    Attrition,
    ROUND(AVG(Age), 2) AS average_age
FROM employees
GROUP BY Attrition;

-- Experience vs Attrition
SELECT
    Attrition,
    ROUND(AVG(TotalWorkingYears), 2) AS avg_total_working_years,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years_at_company
FROM employees
GROUP BY Attrition;

-- Gender-wise Attrition
SELECT
    Gender,
    Attrition,
    COUNT(*) AS employee_count
FROM employees
GROUP BY Gender, Attrition;

-- Marital Status vs Attrition
SELECT
    MaritalStatus,
    Attrition,
    COUNT(*) AS employee_count
FROM employees
GROUP BY MaritalStatus, Attrition;

-- Business Travel vs Attrition
SELECT
    BusinessTravel,
    Attrition,
    COUNT(*) AS employee_count
FROM employees
GROUP BY BusinessTravel, Attrition;