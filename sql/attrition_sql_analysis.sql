--- To make sure the join is correct

SELECT COUNT(*)
FROM general_data AS g
LEFT JOIN employee_survey_data AS es ON g.employeeid = es.employeeid;

SELECT COUNT(*)
FROM general_data AS g
LEFT JOIN manager_survey_data AS ms ON g.employeeid = ms.employeeid;

SELECT COUNT(*)
FROM general_data AS g
LEFT JOIN attendance_summary AS a ON g.employeeid = a.employeeid;


--- 1 Calculate attrition rate by department
SELECT 
    department,
    COUNT(*) AS employee_count,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM general_data
GROUP BY department
ORDER BY attrition_rate_pct DESC;


--- 2 Bucket employees into tenure bands and calculate attrition rate per band

SELECT
    CASE 
        WHEN yearsatcompany <= 1 THEN '0-1 yr'
        WHEN yearsatcompany <= 3 THEN '1-3 yr'
        WHEN yearsatcompany <= 5 THEN '3-5 yr'
        ELSE '5+ yr'
    END AS tenure_band,
    COUNT(*) AS employee_count,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM general_data
GROUP BY tenure_band
ORDER BY tenure_band;

--- 3 Rank departments by attrition rate using a window function

WITH dept_attrition AS (
    SELECT
        department,
        COUNT(*) AS employee_count,
        ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
    FROM general_data
    GROUP BY department
)
SELECT
    department,
    employee_count,
    attrition_rate_pct,
    RANK() OVER (ORDER BY attrition_rate_pct DESC) AS attrition_rank
FROM dept_attrition;

--- 4 Flag job roles whose attrition rate sits meaningfully above the company average

SELECT jobrole,
	COUNT(*) AS employee_count,
	ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM general_data
GROUP BY jobrole
HAVING 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) >
	(SELECT 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) FROM general_data)
ORDER BY attrition_rate_pct DESC;


--- 5 Compare overtime vs. non-overtime employees across multiple metrics at once

SELECT a.overtimeflag,
	COUNT(*) AS employee_count,
	ROUND(100.0 * SUM(CASE WHEN g.attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct,
	ROUND(AVG(es.jobsatisfaction), 2) AS avg_job_satisfaction,
	ROUND(AVG(g.yearsatcompany), 2) AS avg_tenure
FROM general_data AS g
LEFT JOIN employee_survey_data AS es ON g.employeeid = es.employeeid
LEFT JOIN attendance_summary AS a ON g.employeeid = a.employeeid
GROUP BY a.overtimeflag;


--- 6 To check if there are correlation between satisfactions and attrition rate

SELECT
	ROUND(CORR(g.yearssincelastpromotion, CASE WHEN g.attrition = 'Yes' THEN 1 ELSE 0 END)::numeric, 3) AS corr_promotion,
	ROUND(CORR(es.environmentsatisfaction, CASE WHEN g.attrition = 'Yes' THEN 1 ELSE 0 END)::numeric, 3) AS corr_envirosat,
	ROUND(CORR(es.jobsatisfaction, CASE WHEN g.attrition = 'Yes' THEN 1 ELSE 0 END)::numeric, 3) AS corr_jobsat,
	ROUND(CORR(es.worklifebalance, CASE WHEN g.attrition = 'Yes' THEN 1 ELSE 0 END)::numeric, 3) AS corr_wlb
FROM general_data AS g
LEFT JOIN employee_survey_data AS es ON g.employeeid = es.employeeid;

--- 7 to check the correlation between satisfactions and attrition rate
--- jobsatisfaction
SELECT es.jobsatisfaction,
    COUNT(*) AS employee_count,
    ROUND(100.0 * SUM(CASE WHEN g.attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM general_data g
LEFT JOIN employee_survey_data es ON g.employeeid = es.employeeid
GROUP BY es.jobsatisfaction
ORDER BY es.jobsatisfaction;

--- worklifebalance
SELECT es.worklifebalance,
    COUNT(*) AS employee_count,
    ROUND(100.0 * SUM(CASE WHEN g.attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM general_data g
LEFT JOIN employee_survey_data es ON g.employeeid = es.employeeid
GROUP BY es.worklifebalance
ORDER BY es.worklifebalance;

--- environmentasatisfaction
SELECT es.environmentsatisfaction,
    COUNT(*) AS employee_count,
    ROUND(100.0 * SUM(CASE WHEN g.attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM general_data g
LEFT JOIN employee_survey_data es ON g.employeeid = es.employeeid
GROUP BY es.environmentsatisfaction
ORDER BY es.environmentsatisfaction;

--- 8 Measure how strongly perfomance rating and job involvement scores actually correlate with attrition

SELECT
	ROUND(CORR(ms.performancerating, CASE WHEN g.attrition = 'Yes' THEN 1 ELSE 0 END)::numeric, 3) AS corr_performance,
	ROUND(CORR(ms.jobinvolvement, CASE WHEN g.attrition = 'Yes' THEN 1 ELSE 0 END)::numeric, 3) AS corr_involvement
FROM general_data AS g
LEFT JOIN manager_survey_data AS ms ON g.employeeid = ms.employeeid;

