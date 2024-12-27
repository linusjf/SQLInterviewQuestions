select p.title as title,
       ROUND(budget * 1.0 / count(e.emp_id),2) as budget_per_employee
       from ms_projects p
       join ms_emp_projects e on p.id = e.project_id
       group by p.id
       order by budget_per_employee desc;
