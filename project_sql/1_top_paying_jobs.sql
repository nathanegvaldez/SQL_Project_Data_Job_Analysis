/*
Question: What are the top-paying data analyst jobs?
- identify the top 10 highest paying data analyst roles that are available remotely
- focus on job postings with specified salaries (remove nulls)
- Do this in order to highlight the top paying opportunities for data analysts, offering insights into employment
*/
SELECT  
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title LIKE '%Data%Analyst%' AND
    salary_year_avg IS NOT NULL AND
    (job_location = 'Anywhere' OR job_location = 'Singapore' OR job_location = 'Switzerland')
ORDER BY   
    salary_year_avg DESC
LIMIT 10;