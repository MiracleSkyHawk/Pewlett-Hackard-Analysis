-- Deliverable 1
-----------------------------------------
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tl.title,
	tl.from_date,
	tl.to_date 
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

------------------------------------------

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

------------------------------------------

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

-- Deliverable 2
--------------------------------------------

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date, 
	tl.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;