SELECT 
  employees.name AS employees_name,
  employees.role AS employees_role,
  departments.name AS departments_name
FROM
  `circular-beacon-445120-u0.employee_data.employees` AS employees
<-- Add the JOIN clause here -->
FULL OUTER JOIN
  `circular-beacon-445120-u0.employee_data.departments` AS departments
  ON employees.department_id = departments.department_id