-- JOB ADVERTS DATA ANALYSIS

USE job_adverts;

SELECT job_id, job_title, salary_estimate_min, salary_estimate_max
FROM jobs;

 -- Did Some Data cleaning and Formatting

SELECT job_id, job_title, REPLACE(salary_estimate_min, "K", "000") AS SALARY_MIN, REPLACE(salary_estimate_max, "K", "000") AS SALARY_MAX
FROM jobs
--WHERE REPLACE(salary_estimate_max, "K", "000") < 105000;

SELECT company_name, company_rank, company_size_min, company_size_max
FROM jobs
WHERE company_size_min > 60 AND 
	  company_size_max <120;
 
 -- Again Some Data Formatting
 
SELECT job_id, UPPER(job_title), LOWER(company_name)
FROM jobs;

SELECT job_id, company_name,headquarters_of_company, LEFT(company_name, 1), LEFT(headquarters_of_company, 1)
FROM jobs;

SELECT job_id, company_name, headquarters_of_company, CONCAT(LEFT(company_name, 1), LEFT(headquarters_of_company, 1)) AS company_code
FROM jobs;

SELECT job_id, company_name, headquarters_of_company, LOWER(CONCAT(LEFT(company_name, 1), LEFT(headquarters_of_company, 1))) AS company_code
FROM jobs;

SELECT *
FROM jobs
WHERE LENGTH(JOB_TITLE) >29;


SELECT company_name, company_rank, company_market_value, ROUND(company_market_value, 2), FLOOR(company_market_value), CEIL(company_market_value)
FROM jobs;


-- Filtered data for specific publishing year
SELECT job_id, job_title, published_date, removed_date
FROM jobs
WHERE YEAR(published_date) = 2016;

-- Filtered data betweeb specific Dates for published date

SELECT job_id, job_title, published_date, removed_date
FROM jobs
WHERE published_date BETWEEN "2017-01-01" AND "2017-01-31";

-- All the Job postings that were removed very next day.

SELECT job_id, job_title, published_date, removed_date
FROM jobs
WHERE TIMESTAMPDIFF(DAY, published_date, removed_date) = 1;

SELECT job_id, job_title, published_date, removed_date
FROM jobs
WHERE DAY(published_date) = DAY(CURDATE()) AND MONTH(published_date) = MONTH(CURDATE());

SELECT job_id, job_title, published_date, removed_date
FROM jobs
WHERE removed_date < published_date;

SELECT *
FROM jobs
WHERE removed_date IS NULL OR
company_name IS NULL OR
headquarters_of_company IS NULL;

SELECT job_id, job_title, published_date, IFNULL(removed_date, CURDATE()),IFNULL(headquarters_of_company, state_of_company), IFNULL(company_name, "N/A")
FROM jobs;

-- Some Case Statement for summarizig data according to company_market_value in different ranges.


SELECT company_name, company_market_value,
CASE
	WHEN company_market_value BETWEEN 0 AND 300		THEN "Low Range"
    WHEN company_market_value BETWEEN 301 AND 600 	THEN "Mid Range"
    WHEN company_market_value BETWEEN 601 AND 900 	THEN "High Range"
	ELSE "Other Range"
END AS "company_market_value_rank"
FROM jobs;

-- Some Case Statement for summarizig data according to company size in different ranges.

SELECT job_title, company_name, company_size_min, company_size_max, 
CASE
	WHEN company_size_max BETWEEN 0 AND 60		THEN "Small Company"
    WHEN company_size_max BETWEEN 61 AND 120 	THEN "Medium Company"
    WHEN company_size_max BETWEEN 121 AND 180 	THEN "Large Company"
    ELSE "Unknown"
END AS "company_size"
FROM jobs;
