/*
Questions: What are the top-paying Data Analyst jobs?
- Identify the top 10 highest paying data analyst role that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top paying opportunities for Data Analyst 
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM
    job_postings_fact 
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg is not NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10