
-- Employee_Database_challenge
--Retirement employees with titles 

SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Retirement employees with unique titles
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

--Unique retirement employees title count
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Mentorship Eligibility
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no =de.emp_no
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

--Additional query and table
-- Employee count by department name
--SELECT dept_name, COUNT(emp_no) AS retiring_count
--INTO dept_retiring_count
--FROM dept_info
--GROUP BY dept_name
--ORDER BY retiring_count DESC;

-- Mentorship Eligible retiring employees by titles
--SELECT title, COUNT(emp_no) AS title_count
--INTO title_mentorship_count
--FROM mentorship_eligibilty
--GROUP BY title
--ORDER BY title_count DESC;
