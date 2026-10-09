# Bank Loan Data Analysis using SQL

## Project Overview

This project analyzes a bank loan dataset using **MySQL** to understand loan applications, applicant characteristics, loan amounts, income, credit history, property areas, and loan approval rates.

The project focuses on practicing SQL data analysis concepts such as `SELECT`, `COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING`, `ORDER BY`, `CASE`, and `WHERE`.

## Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- CSV Dataset

## Dataset

Dataset: `Bank_Loan_Dataset.csv`

Main columns:

- `Loan_ID`
- `Gender`
- `Married`
- `Dependents`
- `Education`
- `Self_Employed`
- `ApplicantIncome`
- `CoapplicantIncome`
- `LoanAmount`
- `Loan_Amount_Term`
- `Credit_History`
- `Property_Area`
- `Loan_Status`

## Project Objectives

1. Explore the bank loan dataset.
2. Understand the table structure and data.
3. Check for missing values.
4. Identify duplicate Loan IDs.
5. Analyze loan approval and rejection status.
6. Analyze applicant and coapplicant income.
7. Analyze loan amounts.
8. Analyze loans by applicant characteristics.
9. Calculate loan approval rates.
10. Generate useful business insights from the data.

## Analysis Performed

### Dataset Exploration
- Total record count
- Sample records
- Table structure
- Total column count
- Selected-column analysis

### Data Quality Analysis
- Missing-value checks using `IS NULL`
- Non-NULL value checks using `COUNT()`
- Duplicate `Loan_ID` checks using `GROUP BY` and `HAVING`

### Loan Approval Analysis
- Approved vs. rejected loans
- Approval percentage
- Approval rate by gender
- Approval rate by property area

### Income Analysis
- Average, minimum, and maximum applicant income
- Average, minimum, and maximum coapplicant income

### Loan Amount Analysis
- Average, minimum, and maximum loan amount
- Average loan amount by education
- Average loan amount by gender
- Average loan amount by property area

### Applicant Analysis
Loan applications were analyzed by:

- Gender
- Education
- Property Area
- Marital Status
- Dependents
- Self-Employed Status
- Credit History

## SQL Concepts Used

```text
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
COUNT()
AVG()
MIN()
MAX()
ROUND()
CASE
IS NULL
```

## Project Structure

```text
Bank-Loan-SQL-Data-Analysis/
│
├── bankloan_cleaned.sql
├── Bank_Loan_Dataset.csv
└── README.md
```

## Example Query

### Loan Approval Rate by Property Area

```sql
SELECT
    Property_Area,
    ROUND(
        SUM(CASE WHEN Loan_Status = 'Y' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS Approval_Rate
FROM bank_loan_dataset
GROUP BY Property_Area
ORDER BY Approval_Rate DESC;
```

This query calculates the percentage of approved loans for each property area.

## Skills Demonstrated

- SQL data analysis
- Data exploration
- Data quality checking
- Aggregation and grouping
- Conditional analysis
- Business-oriented analysis
- MySQL Workbench
- CSV data handling

## Conclusion

This project demonstrates how SQL can be used to explore and analyze bank loan application data. The analysis covers applicant characteristics, income, loan amounts, credit history, property areas, and loan approval rates.

This is a beginner-level **SQL Data Analyst portfolio project** demonstrating practical SQL skills with a bank loan dataset.

## Author

**Prathmesh Patil**

Aspiring Data Analyst
