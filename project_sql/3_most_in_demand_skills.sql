/*
What are the most in demand skills for data analysis?
- join job postings to inner join table similar to query 2
- identify the top 5 in-demand skills for data analysts
- focus on all job postings
- do this to provide insight into most valuable skills for job seekers
*/

WITH skills_demanded AS (
SELECT
    *
FROM
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND job_location = 'Anywhere'
)

SELECT
    skills_demanded.skills,
    COUNT(*) AS skills_in_demand
FROM
    skills_demanded
GROUP BY skills
ORDER BY skills_in_demand DESC
LIMIT 5 