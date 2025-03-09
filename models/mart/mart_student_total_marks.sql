{{ config(materialized='table') }}

WITH students_total_marks AS (
    SELECT
         d.STUDENT_ID,
         d.DEPARTMENT_ID,
         d.STUDENT_NAME,
         d.DEPARTMENT_NAME,
         m.SUBJECT,
         {{ calculate_total_marks("m", "marks") }}

    FROM 
        {{ ref("int_students_join_departments") }} d
    LEFT JOIN {{ ref("int_students_join_marks") }} m
    ON d.STUDENT_ID = m.STUDENT_ID
    GROUP BY d.STUDENT_ID, d.DEPARTMENT_ID, d.STUDENT_NAME, d.DEPARTMENT_NAME, m.SUBJECT
),
student_ranking AS (
    SELECT 
        *,
        RANK() OVER (PARTITION BY DEPARTMENT_ID ORDER BY cal_total DESC) AS RANKING
    FROM students_total_marks
)

SELECT * FROM student_ranking
ORDER BY RANKING
