SELECT
  p.title,
  round(budget * 1.0 / count(e.emp_id), 2) AS budget_per_employee
FROM
  ms_projects AS p
  INNER JOIN ms_emp_projects AS e ON p.id = e.project_id
GROUP BY
  p.id
ORDER BY
  budget_per_employee DESC;
