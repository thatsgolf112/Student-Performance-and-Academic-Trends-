SELECT *
from students


-- Student who passed and percentage--
SELECT 
    CASE
    when uses_ai = 1 then "USE_AI"
    WHEN uses_ai = 0 then "NOT_USE_AI"
    END as uses_ai,
    count(*) as students_,
    sum(passed) as total_passed,
    round(avg(passed)*100,2) as percentage_pass_rate
FROM students
GROUP BY uses_ai;



-- Performance rank by final score--
SELECT 
    uses_ai,
    CASE
    WHEN final_score >= 70 then "High 70+"
    WHEN final_score >= 40 then "Medium 60-69"
    ELSE "Low 0-39"
    END AS performance,
    count(*) as students_
from students
GROUP BY uses_ai, performance
ORDER BY performance, uses_ai DESC;
-- For uses_ai = 1 is use--
-- For uses_ai = 0 is not use--



-- AI tools --
SELECT
    ai_tools_used as tool,
    count(*) as students_
FROM students
where ai_tools_used is not NULL
GROUP BY ai_tools_used



-- Purpose of using AI and improvement--
SELECT
    ai_usage_purpose,
    count(*) as total_user,
    round(avg(improvement_rate), 2) as improvement_rate,
    round(avg(final_score), 2) as final_score
FROM students
where uses_ai = 1 and ai_usage_purpose is not NULL
GROUP BY ai_usage_purpose 
ORDER BY ai_usage_purpose DESC;

-- Dependency on AI--
SELECT
    CASE
    when ai_dependency_score >= 8 Then "High Dependency 8+"
    when ai_dependency_score >= 4 Then "Moderate Dependency 4-7"
    ELSE "Low 0-3"
    End AS dependency_level,
    count(*) as total_user,
    round(avg(concept_understanding_score), 2) as avg_understanding_score,
    round(avg(final_score), 2) as avg_final_score
FROM students
where uses_ai = 1 
GROUP BY dependency_level
ORDER BY dependency_level;