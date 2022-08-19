# Pewlett_Hackard_Analysis

Analysis on Employee Database using PostgreSQL 

## Overview of the analysis

The purpose of this project is to help Pewlett Hackard, a large company with several thousand employees identify soon-to-retire employees based on department, salary, and title. This will aid the company in deciding which positions needs to be filled in near future and to form retirement packages for them. We will also have a closer look at employees nearing retirement with senior positions so that they can be offered mentorship roles to train new employees. 

The raw data is available in 6 csv files providing different information in each of them. We shall be using ERD (Entity Relationship Diagram) for initial mapping. For deeper analysis, with PostgreSQL we will setup tables for csv files, run queries and formulate insightful tables to help Pewlett Hackerd make a concise list of near-retirement employees with their employee no, title, salary, and department and thereby make informed decisions. 

## Results

### ERD (Entity Relationship Diagram)
The ERD Schema used to map relationship between databases for this project is as follows. It shows the Department table and Employees table are connected to almost all tables giving us insights that they are vital tables for this analysis.
![image](https://user-images.githubusercontent.com/108366412/185514340-90e9f8bc-4990-4757-88e3-9e35ce281964.png)
 
### Deliverables and Analysis

**1. Retirement employees by Titles**

The employees retiring in the coming years with their Birthdate falling between 01-01-1952 and 12-31-1955, has positions across organisation. Below screenshot shows a list of all those employees with their positions over the period. Note that many employees can be seen holding different positions at different point in time. This can be attributed to the fact that Pewlett Hackard is a huge company, and many employees join at a young age at junior level positions and work their way up over time. The total list with 133776 entries can be viewed in retirement_titles.csv in Data folder.

![image](https://user-images.githubusercontent.com/108366412/185514351-a1c78bad-a8d0-4445-b673-e19738f8de3d.png)
 
**2. Unique List of Employees by title**

Filtering out data with just one title per employees keeping their latest positions and keeping only current employees gives us the following table. In this table we are down to 72458 entries. The full list can be found in unique_emp.csv in Data folder.

![unique_titles](https://user-images.githubusercontent.com/108366412/185515393-fa933ce8-ca9f-4c5c-8e42-a2c49a0ae524.png)

**3. Total retirement count per title**

To summarize the data by positions we summed up the total number of employees retiring in each position. Following image shows there will be 25,916 Senior Engineers and 24,926 Senior Staff retiring which is a huge chunk. On the other hand, Engineer (9285), Staff (7636), Technique Leader (3603) and Assistant Engineer (1090) are having fewer number of retiring employees. Only 2 Managers are retiring as per the data. This suggests that at senior level there will be more vacancies in near future. Hence, a mentorship program keeping experienced senior staff with mentor profile supporting new hires will be beneficial. 

![image](https://user-images.githubusercontent.com/108366412/185514402-13f7e42c-084e-4ec7-a10f-c93f8b394ac4.png)

**4. Mentorship eligibile retiring employees**

Mentorship program to retain experienced employees rather than letting them go was important and hence, we got a list of all retiring employees eligible for the mentor roles. We got a total of 1549 current employees who fulfill all conditions (Birthdate within '1965-01-01' and '1965-12-31'). The following table shows a screenshot of all employees eligible for mentorship program with their date of birth, start date, and title. Full list can be viewed in the mentorship_eligibility.csv in Data folder.

![image](https://user-images.githubusercontent.com/108366412/185514431-c337287e-2cae-4890-a3ea-35fb5dc9fc6a.png)

### Vital Observations:

**How many roles will need to be filled as the "silver tsunami" begins to make an impact?**

To combat “silver tsunami”, Pewlett Hackart needs to fill in a total of 72458 roles employees considering their Birthdate falling between January 1, 1952, to December 12, 1955. However, as the company is considering mentorship program, 1,549 retiring employees meet the criteria to retain them as mentors. Thus, PH may hire just 70,909 employees (72458 minus the mentorship employees 1549). 

**Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?**

The total number of retiring employees over the period of 4 years (since birthdates ranges in 4 years from January 1952 to December 1955) is 70909(72458 – 1549 mentorship employees). The total number of eligible employees for mentorship is 1549 for 1 year. Thus, on an average if 17728 new employees (70909 / 4years = 17728) need mentors each year, then we are considering 17728 :1549 which comes to roughly 12:1. This ratio seems too much skewed. Ideally it should be 5:1. For each 5 new employees hired, there should be 1 experienced employee who can mentor new hires. Over the years with the number of mentors increasing as more employees will be eligible, the ratio of 12:1 will come down.

### Additional Queries and Tables

### ***Total number of current retiring employees by department*** 

With the below query, we can determine number of employees retiring in each department with set birthdate and hiredate. From the table we can infer that the Development department will have the highest number of retiring employees at 9281 followed by Production (8174), Sales (5860). Rest of the departments – Customer Service, Research, Quality Management, Marketing, Human Resources and Finance range between 1900 and 2600 employees. 

**Query for counting retiring employees by department**

![dept_emp_count_query](https://user-images.githubusercontent.com/108366412/185519032-397bb6eb-cecd-4406-954b-4edaf4e92e9c.png)

**Output**

![image](https://user-images.githubusercontent.com/108366412/185514468-91a3c301-b0ed-4670-b3c5-c43d356a0a65.png)

 
### ***Mentorship Eligible employees count by title***

The following query provides a summary of all the mentorship employees by their title. This gives PH about the number positions to be filled in each title. Again employees are filtered by their Birthdate. The table below shows Senior Staff has the most number of eligible retiring employees for mentorship – 444 employees. Followed by Engineer (409), Staff (280), Senior Engineer (280), Technique Leader (77) and Assistant Engineer (59). 

**Query for counting retiring employees by title** 

![eligible_emp_count_query](https://user-images.githubusercontent.com/108366412/185519148-662bba94-5365-4dca-9da3-9b071c6e9574.png)

**Output**

![image](https://user-images.githubusercontent.com/108366412/185514495-1aab2495-a9e6-46e0-864a-c9892d75d8b2.png)

 
One important observation we can see here is if we compare the Mentorship Eligible by Title table with the Retiring Employees by Title (and dividing the numbers by 4 since total retiring employees are for coming 4 years), Senior Staff which has the most number of eligible employees - 444 has 6231 (24926/4) number of retiring employees for the first year. This comes to a ratio of 14:1. For every mentor there are roughly 14 new employees. Ratio of Senior Engineer is even worse- 23:1. Ratio of Assistant Engineer is at an ideal rate – 5:1. 

 ![image](https://user-images.githubusercontent.com/108366412/185514508-dde785a7-dbc3-4c07-ac7f-5bf8dd349804.png)

