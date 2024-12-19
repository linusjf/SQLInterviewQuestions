.print '---BEGINNER---';

SELECT PaymentTier, COUNT(*) as employee_count from employee_information
group by PaymentTier;

SELECT Gender, ROUND(AVG(age), 2) as Average_Age from employee_information group by Gender;

.print '---INTERMEDIATE---';

SELECT City,
       ROUND(100.0 *  TOTAL(CASE WHEN EverBenched = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2)  as BenchedPercentage
   FROM employee_information
  GROUP by City
  Order By BenchedPercentage desc
  Limit 3;

SELECT Education,
    ROUND(AVG(CASE WHEN JoiningYear < 2015 THEN ExperienceInCurrentDomain END), 2) as AvgExpBefore2015,
    ROUND(AVG(CASE WHEN JoiningYear >= 2015 THEN ExperienceInCurrentDomain END),2) as AvgExpAfter2015
   FROM employee_information
   GROUP BY Education;

.print '---ADVANCED---';
