/* sql-formatter-disable */
-- noqa: disable=all
.mode column

.print '---BEGINNER---';
/* sql-formatter-enable */
-- noqa: enable=all
SELECT
  paymenttier,
  COUNT(*) AS employee_count
FROM employee_information
GROUP BY paymenttier;

SELECT
  gender,
  ROUND(AVG(age), 2) AS average_age
FROM employee_information
GROUP BY gender;

/* sql-formatter-disable */
-- noqa: disable=all
.mode column
.print '---INTERMEDIATE---';
-- noqa: enable=all
/* sql-formatter-enable */
SELECT
  city,
  ROUND(
    100.0 * TOTAL(
      CASE
        WHEN everbenched = 'Yes' THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS benchedpercentage
FROM employee_information
GROUP BY city
ORDER BY benchedpercentage DESC
LIMIT 3;

SELECT
  education,
  ROUND(
    AVG(
      CASE
        WHEN joiningyear < 2015 THEN experienceincurrentdomain
      END
    ),
    2
  ) AS avgexpbefore2015,
  ROUND(
    AVG(
      CASE
        WHEN joiningyear >= 2015 THEN experienceincurrentdomain
      END
    ),
    2
  ) AS avgexpafter2015
FROM employee_information
GROUP BY education;

/* sql-formatter-disable */
-- noqa: disable=all
.mode column
.print '---ADVANCED---';
-- noqa: enable=all
/* sql-formatter-enable */
WITH
  cityleaverates AS (
    SELECT
      city,
      ROUND(AVG(1.0 * leaveornot), 2) AS cityleaverate
    FROM employee_information
    GROUP BY city
  )
SELECT
  paymenttier,
  CASE
    WHEN experienceincurrentdomain <= 3 THEN 'Low'
    WHEN experienceincurrentdomain BETWEEN 4 AND 7 THEN 'Medium'
    ELSE 'High'
  END AS experiencelevel,
  ei.city AS city,
  clr.cityleaverate,
  ROUND(SUM(1.0 * leaveornot) / COUNT(*), 2) AS groupleaverate
FROM
  employee_information AS ei
  JOIN cityleaverates AS clr USING (city)
GROUP BY paymenttier, experiencelevel, city, cityleaverate
ORDER BY paymenttier, experiencelevel, city;
