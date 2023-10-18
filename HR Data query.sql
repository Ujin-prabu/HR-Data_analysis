/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Attrition]
      ,[Business Travel]
      ,[CF_age band]
      ,[CF_attrition label]
      ,[Department]
      ,[Education Field]
      ,[emp no]
      ,[Employee Number]
      ,[Gender]
      ,[Job Role]
      ,[Marital Status]
      ,[Over Time]
      ,[Over18]
      ,[Training Times Last Year]
      ,[Age]
      ,[CF_current Employee]
      ,[Daily Rate]
      ,[Distance From Home]
      ,[Education]
      ,[Employee Count]
      ,[Environment Satisfaction]
      ,[Hourly Rate]
      ,[Job Involvement]
      ,[Job Level]
      ,[Job Satisfaction]
      ,[Monthly Income]
      ,[Monthly Rate]
      ,[Num Companies Worked]
      ,[Percent Salary Hike]
      ,[Performance Rating]
      ,[Relationship Satisfaction]
      ,[Standard Hours]
      ,[Stock Option Level]
      ,[Total Working Years]
      ,[Work Life Balance]
      ,[Years At Company]
      ,[Years In Current Role]
      ,[Years Since Last Promotion]
      ,[Years With Curr Manager]
  FROM [HR Data].[dbo].[Hr_data]


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

