--Create the retirement titles table


select e.emp_no, e.first_name, e.last_name,


t.title, t.from_date, t.to_date INTO retirement_titles


from employees as e


LEFT JOIN titles as t


ON e.emp_no = t.emp_no


where (e.birth_date BETWEEN '1952-01-01' and '1955-12-31')


ORDER BY e.emp_no


-- Use Dictinct with Orderby to remove duplicate rows to create the unique titles


SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name,


rt.last_name,


rt.title


INTO unique_titles


FROM retirement_titles as rt


WHERE rt.to_date = '9999-01-01'


ORDER BY rt.emp_no, rt.to_date DESC







select count (title) count, title INTO retiring_titles from unique_titles GROUP BY title ORDER BY count DESC


select * from retiring_titles







--create the mentorship eligibility


select DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,


de.from_date, de.to_date,t.title INTO mentorship_eligibility 


from employees as e


LEFT JOIN dept_emp as de ON (e.emp_no = de.emp_no)


LEFT JOIN titles as t ON (e.emp_no = t.emp_no)


WHERE de.to_date = '9999-01-01' AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'


ORDER BY e.emp_no


select * from mentorship_eligibility

