--Deliv 1

--Step 1-6
SELECT emp.emp_no, 
emp.first_name, 
emp.last_name, 
tit.title, 
tit.from_date, 
tit.to_date
INTO retirement_titles
FROM employees as emp
JOIN titles as tit
ON(emp.emp_no = tit.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no;


--Step 8-13
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles 
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC


--Step 16-19
SELECT count(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;


--Deliv 2

SELECT DISTINCT ON (emp_no) e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date, 
de.from_date, 
de.to_date, 
t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
