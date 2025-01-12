
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25



/*
### 1. **Emerging and Specialized Skills Dominate High Salaries**
   - **Node.js (average salary: $181,862)** and **MongoDB (average salary: $179,403)** are highly paid, highlighting the value of expertise in full-stack development and NoSQL databases. These skills are crucial for real-time, scalable applications that many modern companies need.
   - **Solidity ($166,250)** is a standout, reflecting the demand for blockchain and smart contract development in the growing Web3 and cryptocurrency space.

### 2. **Focus on Big Data and Distributed Systems**
   - **Cassandra ($150,255)** and **Kafka ($143,086)** are key technologies in handling large-scale, distributed systems, essential for real-time data processing and big data analytics. Companies relying on massive data pipelines favor these technologies, explaining their high compensation.
   - **Rust ($147,771)** is known for its performance and safety, making it popular in systems programming and performance-critical applications.

### 3. **Demand for Specialized Libraries and Frameworks**
   - **GGPlot2 ($176,250)** shows the importance of **data visualization** in data analysis roles, particularly in the R programming language.
   - **NumPy ($141,605)** and **OpenCV ($141,250)** are core libraries in data science and computer vision, reflecting the demand for machine learning and AI applications.

### 4. **Cloud and Infrastructure Skills**
   - **Kubernetes ($140,092)** and **IBM Cloud ($140,547)** are key cloud and orchestration tools that dominate the DevOps and data engineering landscape, highlighting the need for scalable, containerized deployments.
   - **Shell scripting ($141,725)** and **Ubuntu ($154,455)** show that knowledge of system administration and automation is still highly valued.

### 5. **Security and Compliance**
   - **GDPR ($142,369)** and **Splunk ($140,156)** indicate that expertise in data governance, privacy regulations, and security monitoring tools remains highly compensated, given the increasing focus on data protection.

### Key Takeaways
- **Specialized skills**, particularly in cloud platforms, real-time data processing, and performance optimization, yield the highest salaries.
- The inclusion of **blockchain-related** technologies (Solidity) hints at the growing need for expertise in decentralized systems.
- **Legacy but powerful scripting and programming languages** like **Perl** ($145,540) and **Clojure** ($153,663) continue to pay well due to their niche demand and limited talent pool.
*/
