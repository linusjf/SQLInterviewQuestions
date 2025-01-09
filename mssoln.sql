SELECT
  msp.title,
  ROUND(budget * 1.0 / COUNT(emp_projs.emp_id), 2) AS budget_per_employee
FROM
  ms_projects AS msp
  INNER JOIN ms_emp_projects AS emp_projs ON msp.id = emp_projs.project_id
GROUP BY
  msp.id
ORDER BY
  budget_per_employee DESC;
