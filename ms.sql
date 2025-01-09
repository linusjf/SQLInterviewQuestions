DROP TABLE IF EXISTS ms_emp_projects;

DROP TABLE IF EXISTS ms_projects;

CREATE TABLE ms_projects (id INT, title VARCHAR(15), budget INT);

INSERT INTO
  ms_projects
VALUES
  (1, 'Project1', 29498),
  (2, 'Project2', 32487),
  (3, 'Project3', 43909),
  (4, 'Project4', 15776),
  (5, 'Project5', 36268),
  (6, 'Project6', 41611),
  (7, 'Project7', 34003),
  (8, 'Project8', 49284),
  (9, 'Project9', 32341),
  (10, 'Project10', 47587),
  (11, 'Project11', 11705),
  (12, 'Project12', 10468),
  (13, 'Project13', 43238),
  (14, 'Project14', 30014),
  (15, 'Project15', 48116),
  (16, 'Project16', 19922),
  (17, 'Project17', 19061),
  (18, 'Project18', 10302),
  (19, 'Project19', 44986),
  (20, 'Project20', 19497);

CREATE TABLE ms_emp_projects (emp_id INT, project_id INT);

INSERT INTO
  ms_emp_projects
VALUES
  (10592, 1),
  (10593, 2),
  (10594, 3),
  (10595, 4),
  (10596, 5),
  (10597, 6),
  (10598, 7),
  (10599, 8),
  (10600, 9),
  (10601, 10),
  (10602, 11),
  (10603, 12),
  (10604, 13),
  (10605, 14),
  (10606, 15),
  (10607, 16),
  (10608, 17),
  (10609, 18),
  (10610, 19),
  (10611, 20);

INSERT INTO
  ms_emp_projects
VALUES
  (10612, 1),
  (10613, 1),
  (10614, 3),
  (10615, 4),
  (10616, 4),
  (10617, 6),
  (10618, 7),
  (10619, 7),
  (10620, 9),
  (10621, 10),
  (10622, 11),
  (10623, 12),
  (10624, 15),
  (10625, 14),
  (10626, 15),
  (10627, 16),
  (10628, 17),
  (10629, 18),
  (10620, 19),
  (10621, 6);
