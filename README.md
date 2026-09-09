# Employee Performance & Workforce Analytics

## Project Overview

Employee Performance & Workforce Analytics is a data analytics project developed to analyze employee performance, productivity, attendance, workforce structure, and attrition-related patterns.

The project uses MySQL and SQL for database management and analytical queries, while Power BI is used to create interactive dashboards and visual insights.

## Project Objectives

- Analyze employee performance and productivity
- Evaluate attendance and absenteeism patterns
- Identify high, medium, and low performers
- Compare employee performance across departments
- Analyze employee rankings and department rankings
- Examine workforce distribution
- Analyze employee attrition and employment status
- Study employee tenure patterns
- Identify HR-related performance and attendance patterns
- Present workforce insights through interactive Power BI dashboards

## Tools & Technologies

- MySQL
- SQL
- Power BI
- Data Visualization
- Microsoft Excel

## Database Structure

The project database contains three main tables:

### 1. Employees

Stores employee information including:

- Employee ID
- Employee Name
- Department
- Job Role
- Gender
- Hire Date
- Salary
- Employment Status
- Exit Date

### 2. Performance

Stores employee performance information including:

- Performance ID
- Employee ID
- Review Date
- Performance Score
- Productivity Score
- Training Hours
- Manager Rating

### 3. Attendance

Stores employee attendance information including:

- Attendance ID
- Employee ID
- Attendance Month
- Working Days
- Days Present
- Days Absent
- Overtime Hours

## SQL Analysis

SQL was used for workforce data analysis and reporting.

The project includes:

- Department-wise employee count
- Employee performance categorization
- Overall performance ranking
- Department-wise performance ranking
- Attendance percentage calculation
- Absenteeism rate calculation
- Performance and attendance comparison
- Performance change analysis using `LAG()`
- Top performer identification using `RANK()`
- Department-level performance analysis
- Attrition rate by department
- Employee tenure analysis
- HR pattern identification
- Creation of an employee workforce summary view

## Advanced SQL Concepts

The project demonstrates the use of:

- `JOIN`
- `GROUP BY`
- `ORDER BY`
- `CASE`
- Aggregate functions
- `RANK()`
- `LAG()`
- `PARTITION BY`
- Common Table Expressions (CTEs)
- SQL Views
- Conditional analysis

## Power BI Dashboard

An interactive Power BI dashboard was developed to visualize workforce and HR-related insights.

The dashboard covers:

- Employee KPIs
- Workforce distribution
- Department-wise analysis
- Job role analysis
- Performance analysis
- Productivity analysis
- Attendance analysis
- Absenteeism analysis
- Attrition analysis
- Performance rankings
- Training hours
- Manager ratings
- Workforce trends
- Employee performance categories

Interactive filters and visualizations allow users to explore the workforce data from different perspectives.

## Key Analysis Areas

### Employee Performance

Employee performance scores are analyzed and categorized into:

- High Performer
- Medium Performer
- Low Performer

### Productivity

Productivity scores are analyzed alongside employee performance to understand workforce productivity patterns.

### Attendance & Absenteeism

Attendance percentage, total days present, total days absent, and absenteeism rates are calculated to understand employee attendance patterns.

### Attrition

Employee employment status and exit information are analyzed to calculate department-level attrition rates.

### Employee Ranking

SQL window functions are used to rank employees based on performance scores and to generate department-wise rankings.

### Performance Trends

Performance records from different review periods are compared using SQL window functions to identify performance changes.

### Training & Manager Ratings

Training hours and manager ratings are analyzed alongside performance and productivity scores.

### Employee Tenure

Employees are grouped according to their tenure, including:

- Less than 2 Years
- 2–4 Years
- 5+ Years

## HR Pattern Analysis

The project combines performance and attendance information to identify different HR patterns, including:

- High-Risk Pattern
- Watch Pattern
- Normal Pattern

This analysis helps demonstrate how multiple workforce indicators can be evaluated together.

## Project Workflow

1. Created the EmployeeWorkforceAnalytics database
2. Created employee, performance, and attendance tables
3. Added workforce data
4. Performed SQL-based analysis
5. Applied advanced SQL queries and window functions
6. Created a workforce summary view
7. Connected the data with Power BI
8. Developed interactive dashboards
9. Created KPIs and visual reports
10. Analyzed workforce trends and HR-related insights

## Skills Demonstrated

- SQL
- MySQL
- Database Management
- Data Analysis
- Power BI
- Data Visualization
- Dashboard Development
- HR Analytics
- Analytical Thinking
- Problem Solving
- Data-Driven Decision Making

## Project Outcome

This project demonstrates practical skills in database management, SQL analysis, workforce analytics, and Power BI dashboard development.
It combines structured workforce data with SQL-based analysis and interactive visual reporting to provide a comprehensive view of employee performance, attendance, productivity, and workforce trends.
