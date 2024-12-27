SELECT
  p.title AS title,
  ROUND(budget * 1.0 / count(e.emp_id), 2) AS budget_per_employee
FROM
  ms_projects p
  JOIN ms_emp_projects e ON p.id = e.project_id
GROUP BY
  p.id
ORDER BY
  budget_per_employee DESC;
