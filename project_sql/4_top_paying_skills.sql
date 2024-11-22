/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focus on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary level for Data Analyst and help identify the most financially rewarding skills to acquire or improve 
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg is NOT NULL AND
    job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Here's a breakdown of the results for top paying skills 

- Big Data and Distributed Processing Tools: Skills in handling large datasets and distributed data processing frameworks, like PySpark ($208,172) and Databricks ($141,907), command top salaries. This trend reflects the growing need for data analysts to process massive volumes of data quickly and efficiently.

- Cloud and DevOps Integration: High salaries for Bitbucket ($189,155), GitLab ($154,500), Kubernetes ($132,500), and Jenkins ($125,436) suggest that companies value data analysts who can integrate DevOps and version control tools into their workflows. These skills enable data analysts to collaborate better on code and manage deployment processes, which are crucial for scaling data solutions.

- AI and Machine Learning Frameworks: Tools like DataRobot ($155,486), Watson ($160,515), and scikit-learn ($125,781) support machine learning and AI, signaling that expertise in ML tools is well-compensated. This trend indicates that data analysts skilled in these areas are often involved in predictive modeling and advanced analytics, adding significant value to businesses.

- Programming Languages and Libraries: Languages and libraries tailored to data manipulation and analysis, such as Pandas ($151,821), NumPy ($143,513), and Scala ($124,903), are highly valued. This suggests that companies continue to invest in Python-based skills, as they are versatile and widely used in data science.

- Visualization and BI Tools: There is a trend towards paying well for skills in visualization and BI, like Jupyter ($152,777) and MicroStrategy ($121,619). These tools help analysts turn complex data into actionable insights, which is critical for decision-making in organizations.

- Data Management and NoSQL Databases: Knowledge of Couchbase ($160,515) and PostgreSQL ($123,879) is rewarded well. This aligns with a shift towards using NoSQL and scalable databases to handle unstructured data and support faster data retrieval and storage in real-time analytics applications.

- Multi-Cloud Competency: GCP ($122,500) demonstrates that cloud-specific skills are highly valued, especially as more organizations adopt multi-cloud strategies for data storage, processing, and analytics.

The top-paying skills emphasize a blend of big data processing, machine learning, cloud platforms, and DevOps, which reflects a shift towards scalable, real-time data solutions that empower businesses with actionable insights.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/