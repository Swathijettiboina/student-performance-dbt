{{ config(materialized='table') }}

WITH students_performance AS (
    SELECT
         d.STUDENT_ID,
         d.DEPARTMENT_ID,
         d.STUDENT_NAME,
         d.DEPARTMENT_NAME,
         m.SUBJECT,
         SUM(m.MARKS) AS TOTAL_MARKS
    FROM 
        {{ ref("int_students_join_departments") }} d
    LEFT JOIN {{ ref("int_students_join_marks") }} m
    ON d.STUDENT_ID = m.STUDENT_ID
    GROUP BY d.STUDENT_ID, d.DEPARTMENT_ID, d.STUDENT_NAME, d.DEPARTMENT_NAME, m.SUBJECT
),
student_ranking AS (
    SELECT 
        *,
        RANK() OVER (PARTITION BY d.DEPARTMENT_ID ORDER BY TOTAL_MARKS DESC) AS RANKING
    FROM students_performance d
)

SELECT * FROM student_ranking
ORDER BY RANKING
