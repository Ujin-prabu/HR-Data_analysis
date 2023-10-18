# HR Data Analysis


### Project Overview 

I used a dummy HR data, the data contained various employee information and i analyzed the data using Excel and sql. The data visualization of data was done in Tableau.
[Dashboard](Dashboard.png)



![Screenshot (74)](https://github.com/Ujin-prabu/HR-Data_analysis/assets/116655082/8af5da6b-ed19-4c2a-b2ce-5ae8246ff8c4)

### Data Source 

HR data : The primary data set used is HR Data. xlsx [HR Data link](https://docs.google.com/spreadsheets/d/1-1Ldoe-DwZTL77tdMtRgZAIzeAzs0jh3/edit#gid=2089618187)

### Tools Used 

1) Excel for intitial analysis
2) Sql Server (Data Analysis)
3) Tableau (creating a report) [Tableau Dashboard link](https://public.tableau.com/views/HRANALYTICSDASHBOARD_16952019494360/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)

### EDA (Exploratory Data Analysis

1) checked employee count , total attrition , attrition rate
2) Analyzed Department wise attrition
3) Analyzed Avg hike incerease according to performance rating
4) Analyzed number of employees by their age group and analyzed there avg_income too.
5) Analyzed job satisfication compared to job roles

### Data Analysis 

The Below Sql Query is what I used for the Analysis 

~~~sql




  Select *
  from [HR Data].[dbo].[Hr_data]

  ---- Total Employee
Select Sum([Employee count]) as Total_employee
FROM [HR Data].[dbo].[Hr_data]

--- Total Male and Female Employee

Select Gender,
       Sum([Employee count]) as Total_employee
FROM [HR Data].[dbo].[Hr_data]
group by Gender


--- Total Attrition 
Select sum(case when Attrition = 'Yes' then 1 else 0 end) As Total_attrition
FROM [HR Data].[dbo].[Hr_data]

---- Total active employee
Select (Sum([Employee count]) - sum(case when Attrition = 'Yes' then 1 else 0 end)) as Total_active_Employee
FROM [HR Data].[dbo].[Hr_data]

---- Attrition Rate 
Select Round(sum(case when Attrition = 'Yes' then 1 else 0 end)/Sum([Employee count])*100,2) As Attrition_rate
FROM [HR Data].[dbo].[Hr_data]

---- Average Age of emplyoee
Select Round(Avg(Age),2) as Average_Age
FROM [HR Data].[dbo].[Hr_data]

--- Attrition Rate by gender 
Select Gender,
       sum(case when Attrition = 'Yes' then 1 else 0 end) As Total_attrition,
       Round(sum(case when Attrition = 'Yes' then 1 else 0 end)/Sum([Employee count])*100,2) As Attrition_rate
FROM [HR Data].[dbo].[Hr_data]
group by Gender

---- Attrition Rate Departmentwise

Select Department,
       sum(case when Attrition = 'Yes' then 1 else 0 end) As Total_attrition,
       Round(sum(case when Attrition = 'Yes' then 1 else 0 end)/Sum([Employee count])*100,2) As Attrition_rate
FROM [HR Data].[dbo].[Hr_data]
group by Department
order by Total_attrition DESC

--- Education Field wise Attrition 
 Select [Education Field],
       sum(case when Attrition = 'Yes' then 1 else 0 end) As Total_attrition,
       Round(sum(case when Attrition = 'Yes' then 1 else 0 end)/Sum([Employee count])*100,2) As Attrition_rate
FROM [HR Data].[dbo].[Hr_data]
group by [Education Field]
order by Total_attrition DESC

--- Total Employees in Different Age group 
Select Age,
      Sum([Employee count]) As employee_count
FROM [HR Data].[dbo].[Hr_data]
group by Age 
order by Age

---- Job Satisfication compared to Job role
select [Job Role], Sum([Job Satisfaction]) as Total_job_satisfaction, [Job Satisfaction]
FROM [HR Data].[dbo].[Hr_data]
group by [Job Role],[Job Satisfaction]
order by Total_job_satisfaction Desc,
         [Job Satisfaction] ASC

----Avg salary Hike according to Performance

Select Round (avg([Percent Salary Hike]),2) as avg_hike , [Performance Rating]
FROM [HR Data].[dbo].[Hr_data]
group by [Performance Rating]
order by avg_hike Desc
 
 ---- Avg income according to there age group 
 Select Round (avg([Monthly Income]),2) as avg_income , Age
FROM [HR Data].[dbo].[Hr_data]
group by Age
order by Age

-- Avg income according to Job Roles 
 Select Round (avg([Monthly Income]),2) as avg_income , [Job Role]
FROM [HR Data].[dbo].[Hr_data]
group by [Job Role]
order by avg_income

---- Total income between two genders 
 Select Round (Sum([Monthly Income]),2) as Total_income , Gender
FROM [HR Data].[dbo].[Hr_data]
group by Gender
order by Total_income
~~~

### Some interesting Findings From Analysis 
 
1) Total count of Employee is 1470 and Total Male employee are 882 and Female employee are 588.
2) Total Attrition is 237 and Male count is 150 and Female is 87 .
3) Total Attrition Rate of the company is 16.12% .
4) Average Age of Total Company is 36.92.
5) Salary Hike according to Performance rating, for rating 4 the avg hike is 21.85% and for rating 3 the avg hike is 14 .
6) Managers make the most avg_income (ie) $17181.68 and Sales representative make the least of $2626


### References

Data Tutorials (youtube channel for working in Tableau)
