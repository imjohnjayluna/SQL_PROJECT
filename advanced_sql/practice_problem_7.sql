/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of job postings requiring the skill
*/

WITH remote_jobs_skills AS (
SELECT
    skill_id,
    COUNT(*) AS skill_count
    
FROM
    skills_job_dim as skills_to_job 
INNER JOIN job_postings_fact as job_postings ON job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = TRUE AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM
    remote_jobs_skills
INNER JOIN skills_dim AS skills on skills.skill_id = remote_jobs_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT (5);