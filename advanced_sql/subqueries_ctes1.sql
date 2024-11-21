SELECT *
FROM ( -- Subquery starts here
    SELECT* 
    from job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date) = 1
    ) AS january_jobs;
    -- Subquery ends here