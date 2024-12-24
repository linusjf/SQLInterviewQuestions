/* sql-formatter-disable */
.mode column

.print '---BEGINNER---';
/* sql-formatter-enable */
SELECT
  PaymentTier,
  COUNT(*) AS employee_count
FROM
  employee_information
GROUP BY
  PaymentTier;

SELECT
  Gender,
  ROUND(AVG(age), 2) AS Average_Age
FROM
  employee_information
GROUP BY
  Gender;

/* sql-formatter-disable */
.mode column
.print '---INTERMEDIATE---';
/* sql-formatter-enable */
SELECT
  City,
  ROUND(
    100.0 * TOTAL(
      CASE
        WHEN EverBenched = 'Yes' THEN 1
        ELSE 0
      END
    ) / COUNT(*),
    2
  ) AS BenchedPercentage
FROM
  employee_information
GROUP BY
  City
ORDER BY
  BenchedPercentage DESC
LIMIT
  3;

SELECT
  Education,
  ROUND(
    AVG(
      CASE
        WHEN JoiningYear < 2015 THEN ExperienceInCurrentDomain
      END
    ),
    2
  ) AS AvgExpBefore2015,
  ROUND(
    AVG(
      CASE
        WHEN JoiningYear >= 2015 THEN ExperienceInCurrentDomain
      END
    ),
    2
  ) AS AvgExpAfter2015
FROM
  employee_information
GROUP BY
  Education;

/* sql-formatter-disable */
.mode column
.print '---ADVANCED---';
/* sql-formatter-enable */
WITH
  CityLeaveRates AS (
    SELECT
      City,
      ROUND(AVG(1.0 * LeaveOrNot), 2) AS CityLeaveRate
    FROM
      employee_information
    GROUP BY
      City
  )
SELECT
  PaymentTier,
  CASE
    WHEN ExperienceInCurrentDomain <= 3 THEN 'Low'
    WHEN ExperienceInCurrentDomain BETWEEN 4 AND 7  THEN 'Medium'
    ELSE 'High'
  END AS ExperienceLevel,
  ei.City AS City,
  clr.CityLeaveRate,
  ROUND(SUM(1.0 * LeaveOrNot) / COUNT(*), 2) AS GroupLeaveRate
FROM
  employee_information ei
  JOIN CityLeaveRates clr USING (City)
GROUP BY
  PaymentTier,
  ExperienceLevel,
  City,
  CityLeaveRate
ORDER BY
  PaymentTier,
  ExperienceLevel,
  City;
