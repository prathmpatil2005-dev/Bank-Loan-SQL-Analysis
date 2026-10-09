
use bankloandb;
SELECT COUNT(*) FROM bank_loan_dataset;
select count(*) as total_records
from bank_loan_dataset;


-- Display All Records
select * from bank_loan_dataset;

-- Why do we use this?
-- Displays all rows and columns.
-- Helps verify that the data was imported correctly.
-- Gives a quick overview of the dataset.



-- Display the First 10 Records
select * from bank_loan_dataset
limit 10;	
-- Instead of loading all records, we preview only the first few rows. This is faster and is a common practice when exploring data

-- Count Total Records
select count(*) as total_records
from bank_loan_dataset;
-- This confirms the total number of records imported into the table.

-- ====================================================================================================================================================================
-- Step 1: Exploring the Dataset
-- Display all records
-- Preview first 10 records
-- Count total number of records
-- ===================================================================================================================================================================

-- View the Table Structure

describe bank_loan_dataset;

-- Count the Number of Columns
select count(*) as total_columns
from INFORMATION_SCHEMA.columns
where TABLE_SCHEMA = 'bankloandb'
and table_name = 'bank_loan_dataset';

-- Display Only Required Columns

select Loan_ID,Gender,ApplicantIncome,LoanAmount,loan_Status from bank_loan_dataset limit 10;

-- ==================================================================================================================================
-- Step 2: Understanding the Dataset
-- 1. View table structure
-- 2. Count total columns
-- 3. Display selected columns
-- ==================================================================================================================================

-- Finding Missing Values (NULL Values)

-- Count Missing Gender

select count(*) Missing_Gender
from bank_loan_dataset
where Gender is NUll;

-- Count Missing Married
select count(*) Missing_Married
from bank_loan_dataset
where Married is NUll;

-- Count Missing Dependents
select count(*) Missing_Dependents
from bank_loan_dataset
where Dependents is NUll;

-- Count Missing LoanAmount
select count(*) Missing_LoanAmount
from bank_loan_dataset
where LoanAmount is NUll;

-- Count Missing Credit_History
select count(*) Missing_Credit_History
from bank_loan_dataset
where Credit_History is NUll;

-- View All Rows with Missing Values
select * from bank_loan_dataset
where Gender is null
and Married is null
and Dependents is null
and Credit_History is null
and loanAmount is null;

-- =============================================================================================================
-- Step 3: Finding Missing Values
-- IS NULL is used to identify missing values.
-- This helps in data cleaning before analysis.
-- ==============================================================================================================


-- Finding Duplicate Records

-- Find Duplicate Loan IDs
 select Loan_ID,
 count(*) as total_count
 from bank_loan_dataset
 group by Loan_ID
 having count(*) > 1;
 
 -- Count Total Duplicate Loan IDs
 
 select count(*) as Duplicate_LoanIDs
 from (
     select Loan_ID
     from bank_loan_dataset
      group by Loan_ID
      having count(*) > 1 
 ) as duplicates;


-- Display All Duplicate Records

select * from bank_loan_dataset
where Loan_ID in ( 
select Loan_ID
from bank_loan_dataset
group by Loan_ID
having count(*) > 1
);


-- ============================================================================================================================
-- Step 4: Finding Duplicate Records
-- GROUP BY and HAVING are used to identify
-- duplicate Loan IDs in the dataset.
-- =============================================================================================================================



-- Step 5: Finding Missing Values
-- COUNT(*) counts all records
-- COUNT(column) ignores NULL values

SELECT
    COUNT(*) AS Total_Records,
    COUNT(Gender) AS Gender_Not_Null,
    COUNT(Married) AS Married_Not_Null,
    COUNT(Dependents) AS Dependents_Not_Null,
    COUNT(Education) AS Education_Not_Null,
    COUNT(Self_Employed) AS Self_Employed_Not_Null,
    COUNT(ApplicantIncome) AS ApplicantIncome_Not_Null,
    COUNT(CoapplicantIncome) AS CoapplicantIncome_Not_Null,
    COUNT(LoanAmount) AS LoanAmount_Not_Null,
    COUNT(Loan_Amount_Term) AS Loan_Term_Not_Null,
    COUNT(Credit_History) AS Credit_History_Not_Null,
    COUNT(Property_Area) AS Property_Area_Not_Null,
    COUNT(Loan_Status) AS Loan_Status_Not_Null
FROM bank_loan_dataset;


select count(*) - count(LoanAmount) as Missing_LoanAmount
from bank_loan_dataset;

-- there are no missing values


-- ======================================================================================================================
-- Step 6: Loan Approval Status

select Loan_Status,
count(*) Total_Loans
from bank_loan_dataset
group by Loan_Status;

-- there is slightly more rejected loans than approved loans.

select Loan_Status,
count(*) as Total_Loans,
round(
count(*) * 100.0 /
(select count(*) from bank_loan_dataset),
2
) as Percantage
from bank_loan_dataset
group by Loan_Status;

-- =============================================================================================================================
-- Step 7: Applicant Income Analysis

SELECT
    ROUND(AVG(ApplicantIncome), 2) AS Average_Income,
    MIN(ApplicantIncome) AS Minimum_Income,
    MAX(ApplicantIncome) AS Maximum_Income
FROM bank_loan_dataset;

-- ===============================================================================================================================

-- Step 8: loan amount analysis

select
ROUND(AVG(LoanAmount), 2) AS Average_Loan_Amount,
MIN(LoanAmount) AS Minimum_Loan_Amount,
MAX(LoanAmount) AS Maximum_loan_Amount
from bank_loan_dataset;

-- ================================================================================================================================
-- Step 9 loan analysis by gender

-- Query 1: Number of loans by gender
select
gender,
count(*) as Total_Loans
From bank_loan_dataset
group by Gender;

-- Query 2: Approval status by gender
select
Gender,
Loan_Status,
Count(*) AS Total_Loans
from bank_loan_dataset
group by Gender, Loan_Status
order by Gender, Loan_Status;
-- =====================================================================================================================================
-- Step 10: Loan Analysis by Education

-- Query 1: Total loans by education
select Education,
count(*) AS Total_Loans 
from bank_loan_dataset
group by Education;

-- Query 2: Approval and rejection by education

select Education,
Loan_Status,
count(*) as Total_Loans
from bank_loan_dataset
group by Education, Loan_Status
order by Education, Loan_Status;
-- ==========================================================================================================================================

-- Step 11: Loan Analysis by Property Area

-- Query 1: Total loans by property area
select Property_Area, count(*) Total_Loans
from bank_loan_dataset
group by Property_Area
order by Total_loans DESC;

-- Query 2: Approval vs rejection by property area
select Property_Area, Loan_Status, count(*) Total_Loans
from bank_loan_dataset
group by Property_Area, Loan_Status
order by  Property_Area, Loan_Status;

-- ========================================================================================================================================

-- Step 12 — Total Loans by Marital Status

select Married, count(*) as total_loans
from bank_loan_dataset
group by Married;

-- querry 2: Approval vs Rejection by Marital Status.
select Married, Loan_Status
as total_loans
from bank_loan_dataset
group by Married, Loan_Status
order by Married, Loan_Status;

-- Married → Approved / Rejected loans
-- Not Married → Approved / Rejected loans
-- ======================================================================================================================================
 -- Step 13 — Loan Analysis by Dependents
 
 select Dependents, count(*) as total_loans
 from bank_loan_dataset
 group by Dependents
 order by Dependents;
 
 
 -- Query 2: Approval vs Rejection by Dependents
 select Dependents, Loan_Status
as total_loans
from bank_loan_dataset
group by Dependents, Loan_Status
order by Dependents, Loan_Status;

-- =====================================================================================================================================
-- Step 14 — Loan Analysis by Self-Employed Status
select Self_Employed,
count(*) as total_loans
from bank_loan_dataset
group by Self_Employed;

-- ====================================================================================================================================

-- Step 15 — Loan Analysis by Credit History

select Credit_History, count(*) as total_loans
from bank_loan_dataset
group by Credit_History;

-- =====================================================================================================================================

-- Step 16 — Coapplicant Income Analysis
select 
round(AVG(coapplicantIncome),2) as Average_coapplicant_Income,
min(CoapplicantIncome) as minimum_Coapplicant_Income,
max(CoapplicantIncome) as maximum_Coapplicant_Income
from bank_loan_dataset;

-- =======================================================================================================================================

-- Step 17 — Loan Amount by Education
select 
Education,
round(AVG(LoanAmount), 2) as average_Loan_Amount
from bank_loan_dataset
group by Education;

-- ========================================================================================================================================

--  Step 18 — Loan Amount by Gender

select Gender,
round(AVg(LoanAmount),2) as Average_Loan_Amount
from bank_loan_dataset
group by Gender;

-- ======================================================================================================================================

-- Step 19 — Loan Amount by Property Area
select Property_Area,
round(AVg(LoanAmount),2) as Average_Loan_Amount
from bank_loan_dataset
group by Property_Area;

-- =======================================================================================================================================

-- Step 20 — Loan Approval Rate by Gender

select Gender, round(
sum(case when Loan_Status = 'Y' then 1 else 0 end) * 100.0
/ count(*),
2)
as Approval_rate
from bank_loan_dataset
group by Gender;

-- ======================================================================================================================================

-- Step 21 — Final Business Insight

select Property_Area, round(
sum(case when Loan_Status = 'Y' then 1 else 0 end) * 100.0
/ count(*),
2)
as Approval_rate
from bank_loan_dataset
group by  Property_Area
order by Approval_rate desc;

-- ======================================================================================================================================

