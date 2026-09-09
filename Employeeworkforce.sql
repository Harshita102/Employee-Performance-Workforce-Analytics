USE EmployeeWorkforceAnalytics;

CREATE TABLE employees (
    EmployeeID VARCHAR(10) PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    JobRole VARCHAR(100) NOT NULL,
    Gender VARCHAR(20),
    HireDate DATE NOT NULL,
    Salary DECIMAL(12,2),
    EmploymentStatus VARCHAR(20) NOT NULL,
    ExitDate DATE
);
CREATE TABLE performance (
    PerformanceID VARCHAR(10) PRIMARY KEY,
    EmployeeID VARCHAR(10) NOT NULL,
    ReviewDate DATE NOT NULL,
    PerformanceScore DECIMAL(5,2),
    ProductivityScore DECIMAL(5,2),
    TrainingHours DECIMAL(6,2),
    ManagerRating DECIMAL(3,2),
    FOREIGN KEY (EmployeeID)
    REFERENCES employees(EmployeeID)
);
CREATE TABLE attendance (
    AttendanceID VARCHAR(10) PRIMARY KEY,
    EmployeeID VARCHAR(10) NOT NULL,
    AttendanceMonth DATE NOT NULL,
    WorkingDays INT NOT NULL,
    DaysPresent INT NOT NULL,
    DaysAbsent INT NOT NULL,
    OvertimeHours DECIMAL(6,2),
	FOREIGN KEY (EmployeeID)
        REFERENCES employees(EmployeeID)
);
INSERT INTO employees
(EmployeeID, EmployeeName, Department, JobRole, Gender, HireDate, Salary, EmploymentStatus, ExitDate)
VALUES
('EMP001','Harshita Gautam','IT','Generative AI','Male','2026-04-15',650000,'Active',NULL),
('EMP002','Ananya Verma','HR','HR Analyst','Female','2021-07-20',580000,'Active',NULL),
('EMP003','Rohan Mehta','Finance','Financial Analyst','Male','2023-01-10',620000,'Active',NULL),
('EMP004','Priya Singh','Sales','Sales Executive','Female','2022-09-05',500000,'Active',NULL),
('EMP005','Aditya Kumar','Marketing','SEO Specialist','Male','2020-11-18',720000,'Resigned','2025-08-12'),
('EMP006','Sneha Gupta','Operations','Operations Analyst','Female','2021-03-22',610000,'Active',NULL),
('EMP007','Kabir Malhotra','IT','Data Analyst','Male','2023-06-12',680000,'Active',NULL),
('EMP008','Ishita Rao','Customer Support','Support Executive','Female','2022-02-14',450000,'Active',NULL),
('EMP009','Arjun Patel','IT','Software Engineer','Male','2020-08-25',850000,'Active',NULL),
('EMP010','Meera Joshi','HR','Recruiter','Female','2023-03-17',520000,'Resigned','2025-12-01'),
('EMP011','Vikram Shah','Finance','Accountant','Male','2021-10-11',560000,'Active',NULL),
('EMP012','Kavya Nair','Sales','Business Development Executive','Female','2022-05-09',590000,'Active',NULL),
('EMP013','Rahul Kapoor','Marketing','Content Strategist','Male','2023-08-01',540000,'Active',NULL),
('EMP014','Simran Kaur','Operations','Operations Executive','Female','2021-12-13',510000,'Active',NULL),
('EMP015','Devansh Gupta','IT','QA Engineer','Male','2022-01-24',630000,'Resigned','2025-10-15'),
('EMP016','Neha Sharma','Customer Support','Customer Success Associate','Female','2020-06-19',570000,'Active',NULL),
('EMP017','Yash Agarwal','IT','Back-End Developer','Male','2023-02-06',700000,'Active',NULL),
('EMP018','Pooja Mishra','Finance','Finance Executive','Female','2022-11-30',550000,'Active',NULL),
('EMP019','Manav Bansal','Sales','Sales Representative','Male','2021-05-16',480000,'Active',NULL),
('EMP020','Riya Chawla','Marketing','Digital Marketing Executive','Female','2023-09-21',530000,'Active',NULL);

INSERT INTO performance
(PerformanceID, EmployeeID, ReviewDate, PerformanceScore, ProductivityScore, TrainingHours, ManagerRating)
VALUES
('P001','EMP001','2025-03-31',88,91,18,4.5),
('P002','EMP002','2025-03-31',82,84,22,4.2),
('P003','EMP003','2025-03-31',79,81,15,4.0),
('P004','EMP004','2025-03-31',74,76,10,3.8),
('P005','EMP005','2025-03-31',91,89,25,4.7),
('P006','EMP006','2025-03-31',85,87,20,4.4),
('P007','EMP007','2025-03-31',94,96,30,4.9),
('P008','EMP008','2025-03-31',71,73,12,3.6),
('P009','EMP009','2025-03-31',89,92,24,4.6),
('P010','EMP010','2025-03-31',68,70,8,3.4),
('P011','EMP011','2025-03-31',81,83,16,4.1),
('P012','EMP012','2025-03-31',77,79,14,3.9),
('P013','EMP013','2025-03-31',86,88,21,4.3),
('P014','EMP014','2025-03-31',80,82,17,4.0),
('P015','EMP015','2025-03-31',63,66,7,3.2),
('P016','EMP016','2025-03-31',84,86,19,4.2),
('P017','EMP017','2025-03-31',92,94,28,4.8),
('P018','EMP018','2025-03-31',78,80,13,3.9),
('P019','EMP019','2025-03-31',73,75,11,3.7),
('P020','EMP020','2025-03-31',87,89,23,4.4);

SELECT COUNT(*) AS TotalEmployees
FROM employees;

SELECT COUNT(*) AS TotalPerformanceRecords
FROM performance;

SELECT COUNT(*) AS TotalAttendanceRecords
FROM attendance;


SELECT
    Department,
    COUNT(*) AS EmployeeCount
FROM employees
GROUP BY Department
ORDER BY EmployeeCount DESC;


SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    p.PerformanceScore,
    CASE
        WHEN p.PerformanceScore >= 85 THEN 'High Performer'
        WHEN p.PerformanceScore >= 70 THEN 'Medium Performer'
        ELSE 'Low Performer'
    END AS PerformanceCategory
FROM employees e
JOIN performance p
    ON e.EmployeeID = p.EmployeeID
ORDER BY p.PerformanceScore DESC;

SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    p.PerformanceScore,
    RANK() OVER (
        ORDER BY p.PerformanceScore DESC
    ) AS PerformanceRank
FROM employees e
JOIN performance p
    ON e.EmployeeID = p.EmployeeID
ORDER BY PerformanceRank;


SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    p.PerformanceScore,
    RANK() OVER (
        PARTITION BY e.Department
        ORDER BY p.PerformanceScore DESC
    ) AS DepartmentRank
FROM employees e
JOIN performance p
    ON e.EmployeeID = p.EmployeeID
ORDER BY e.Department, DepartmentRank;


SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    SUM(a.WorkingDays) AS TotalWorkingDays,
    SUM(a.DaysPresent) AS TotalDaysPresent,
    SUM(a.DaysAbsent) AS TotalDaysAbsent,
    ROUND(
        SUM(a.DaysPresent) * 100.0 / SUM(a.WorkingDays),
        2
    ) AS AttendancePercentage
FROM employees e
JOIN attendance a
    ON e.EmployeeID = a.EmployeeID
GROUP BY
    e.EmployeeID,
    e.EmployeeName,
    e.Department
ORDER BY AttendancePercentage DESC;


SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    SUM(a.DaysAbsent) AS TotalDaysAbsent,
    SUM(a.WorkingDays) AS TotalWorkingDays,
    ROUND(
        SUM(a.DaysAbsent) * 100.0 / SUM(a.WorkingDays),
        2
    ) AS AbsenteeismRate
FROM employees e
JOIN attendance a
    ON e.EmployeeID = a.EmployeeID
GROUP BY
    e.EmployeeID,
    e.EmployeeName,
    e.Department
ORDER BY AbsenteeismRate DESC;


SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    p.PerformanceScore,
    ROUND(
        SUM(a.DaysPresent) * 100.0 / SUM(a.WorkingDays),
        2
    ) AS AttendancePercentage,
    SUM(a.DaysAbsent) AS TotalDaysAbsent
FROM employees e
JOIN performance p
    ON e.EmployeeID = p.EmployeeID
JOIN attendance a
    ON e.EmployeeID = a.EmployeeID
GROUP BY
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    p.PerformanceScore
ORDER BY p.PerformanceScore DESC;


INSERT INTO performance
(PerformanceID, EmployeeID, ReviewDate, PerformanceScore, ProductivityScore, TrainingHours, ManagerRating)
VALUES
('P021','EMP001','2024-12-31',82,85,15,4.1),
('P022','EMP002','2024-12-31',78,80,18,4.0),
('P023','EMP003','2024-12-31',75,78,12,3.8),
('P024','EMP004','2024-12-31',71,73,9,3.6),
('P025','EMP005','2024-12-31',88,86,20,4.5),
('P026','EMP006','2024-12-31',81,84,17,4.2),
('P027','EMP007','2024-12-31',89,92,25,4.6),
('P028','EMP008','2024-12-31',69,71,10,3.4),
('P029','EMP009','2024-12-31',85,89,21,4.4),
('P030','EMP010','2024-12-31',72,74,11,3.6),
('P031','EMP011','2024-12-31',78,81,14,4.0),
('P032','EMP012','2024-12-31',74,77,12,3.7),
('P033','EMP013','2024-12-31',82,85,18,4.1),
('P034','EMP014','2024-12-31',77,80,15,3.9),
('P035','EMP015','2024-12-31',67,69,8,3.3),
('P036','EMP016','2024-12-31',80,83,16,4.0),
('P037','EMP017','2024-12-31',87,90,24,4.5),
('P038','EMP018','2024-12-31',75,78,11,3.7),
('P039','EMP019','2024-12-31',70,72,10,3.5),
('P040','EMP020','2024-12-31',83,86,19,4.2);


SELECT COUNT(*) AS TotalPerformanceRecords
FROM performance;


SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    p.ReviewDate,
    p.PerformanceScore,

    LAG(p.PerformanceScore) OVER (
        PARTITION BY p.EmployeeID
        ORDER BY p.ReviewDate
    ) AS PreviousPerformanceScore,

    p.PerformanceScore -
    LAG(p.PerformanceScore) OVER (
        PARTITION BY p.EmployeeID
        ORDER BY p.ReviewDate
    ) AS PerformanceChange

FROM employees e
JOIN performance p
    ON e.EmployeeID = p.EmployeeID

ORDER BY e.EmployeeID, p.ReviewDate;


WITH RankedEmployees AS (
    SELECT
        e.EmployeeID,
        e.EmployeeName,
        e.Department,
        p.PerformanceScore,
        RANK() OVER (
            ORDER BY p.PerformanceScore DESC
        ) AS PerformanceRank
    FROM employees e
    JOIN performance p
        ON e.EmployeeID = p.EmployeeID
    WHERE p.ReviewDate = '2025-03-31'
)

SELECT
    EmployeeID,
    EmployeeName,
    Department,
    PerformanceScore,
    PerformanceRank
FROM RankedEmployees
WHERE PerformanceRank <= 5
ORDER BY PerformanceRank;


SELECT
    e.Department,
    COUNT(DISTINCT e.EmployeeID) AS EmployeeCount,
    ROUND(AVG(p.PerformanceScore), 2) AS AveragePerformanceScore,
    ROUND(AVG(p.ProductivityScore), 2) AS AverageProductivityScore,
    ROUND(AVG(p.ManagerRating), 2) AS AverageManagerRating
FROM employees e
JOIN performance p
    ON e.EmployeeID = p.EmployeeID
WHERE p.ReviewDate = '2025-03-31'
GROUP BY e.Department
ORDER BY AveragePerformanceScore DESC;


SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(
        CASE
            WHEN EmploymentStatus = 'Resigned' THEN 1
            ELSE 0
        END
    ) AS ResignedEmployees,
    ROUND(
        SUM(
            CASE
                WHEN EmploymentStatus = 'Resigned' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY Department
ORDER BY AttritionRate DESC;


SELECT
    EmployeeID,
    EmployeeName,
    Department,
    HireDate,
    EmploymentStatus,
    TIMESTAMPDIFF(YEAR, HireDate, '2025-12-31') AS TenureYears,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, HireDate, '2025-12-31') < 2
            THEN 'Less than 2 Years'
        WHEN TIMESTAMPDIFF(YEAR, HireDate, '2025-12-31') BETWEEN 2 AND 4
            THEN '2-4 Years'
        ELSE '5+ Years'
    END AS TenureGroup
FROM employees
ORDER BY TenureYears DESC;


SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    p.PerformanceScore,
    ROUND(
        SUM(a.DaysPresent) * 100.0 / SUM(a.WorkingDays),
        2
    ) AS AttendancePercentage,
    SUM(a.DaysAbsent) AS TotalDaysAbsent,

    CASE
        WHEN p.PerformanceScore < 70
             AND (SUM(a.DaysPresent) * 100.0 / SUM(a.WorkingDays)) < 90
            THEN 'High-Risk Pattern'

        WHEN p.PerformanceScore < 75
             OR (SUM(a.DaysPresent) * 100.0 / SUM(a.WorkingDays)) < 92
            THEN 'Watch Pattern'

        ELSE 'Normal Pattern'
    END AS HRPattern

FROM employees e
JOIN performance p
    ON e.EmployeeID = p.EmployeeID
JOIN attendance a
    ON e.EmployeeID = a.EmployeeID

WHERE p.ReviewDate = '2025-03-31'

GROUP BY
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    p.PerformanceScore

ORDER BY
    CASE
        WHEN p.PerformanceScore < 70
             AND (SUM(a.DaysPresent) * 100.0 / SUM(a.WorkingDays)) < 90
            THEN 1
        WHEN p.PerformanceScore < 75
             OR (SUM(a.DaysPresent) * 100.0 / SUM(a.WorkingDays)) < 92
            THEN 2
        ELSE 3
    END;
    
    
CREATE OR REPLACE VIEW employee_workforce_summary AS
SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    e.JobRole,
    e.Gender,
    e.HireDate,
    e.Salary,
    e.EmploymentStatus,
    e.ExitDate,

    p.ReviewDate,
    p.PerformanceScore,
    p.ProductivityScore,
    p.TrainingHours,
    p.ManagerRating,

    SUM(a.WorkingDays) AS TotalWorkingDays,
    SUM(a.DaysPresent) AS TotalDaysPresent,
    SUM(a.DaysAbsent) AS TotalDaysAbsent,
    SUM(a.OvertimeHours) AS TotalOvertimeHours,

    ROUND(
        SUM(a.DaysPresent) * 100.0 / SUM(a.WorkingDays),
        2
    ) AS AttendancePercentage,

    ROUND(
        SUM(a.DaysAbsent) * 100.0 / SUM(a.WorkingDays),
        2
    ) AS AbsenteeismRate,

    CASE
        WHEN p.PerformanceScore >= 85 THEN 'High Performer'
        WHEN p.PerformanceScore >= 70 THEN 'Medium Performer'
        ELSE 'Low Performer'
    END AS PerformanceCategory

FROM employees e
JOIN performance p
    ON e.EmployeeID = p.EmployeeID
JOIN attendance a
    ON e.EmployeeID = a.EmployeeID

WHERE p.ReviewDate = '2025-03-31'

GROUP BY
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    e.JobRole,
    e.Gender,
    e.HireDate,
    e.Salary,
    e.EmploymentStatus,
    e.ExitDate,
    p.ReviewDate,
    p.PerformanceScore,
    p.ProductivityScore,
    p.TrainingHours,
    p.ManagerRating;
    
    
    SELECT *
FROM employee_workforce_summary;


