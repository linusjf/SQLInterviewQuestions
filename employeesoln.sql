.print '---BEGINNER---';

SELECT PaymentTier, COUNT(*) as employee_count from employee_information
group by PaymentTier;

SELECT Gender, ROUND(AVG(age), 2) as Average_Age from employee_information group by Gender;

.print '---INTERMEDIATE---';



.print '---ADVANCED---';
