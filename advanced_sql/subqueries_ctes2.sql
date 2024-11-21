WITH january_jobs AS ( -- CTE definition starts here
    SELECT *
    from job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date) = 1
    ) -- CTE definition ends here

SELECT *
FROM january_jobs;