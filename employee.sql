-- Drop table if exists
DROP TABLE IF EXISTS employee_information;

-- Create table
CREATE TABLE IF NOT EXISTS "employee_information" (
  "Education" TEXT,
  "JoiningYear" INT,
  "City" TEXT,
  "PaymentTier" INT,
  "Age" INT,
  "Gender" TEXT,
  "EverBenched" TEXT,
  "ExperienceInCurrentDomain" INT,
  "LeaveOrNot" INT
);

/* sql-formatter-disable */
.mode csv --noqa
--noqa: disable=all
.import --skip 1 employee.csv employee_information
;
