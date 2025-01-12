WITH top_paying_jobs AS (
    SELECT  
        job_id,
        job_title,
        salary_year_avg,
        job_location,
        company_dim.name AS company_name  
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Engineer' AND 
        job_location = 'United Kingdom' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT
        10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills  
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC; -- Explicit reference to the CTE column



/*
Here's a bar graph visualizing the most required skills for top-paying data engineering roles in the UK. 
The frequency of each skill indicates how often it appears across different job postings. 
This visualization highlights key technologies that you might want to prioritize when preparing for roles 
in data engineering.
*/
