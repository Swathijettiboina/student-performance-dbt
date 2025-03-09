{{ config(materialized='table') }}

WITH students_join_marks AS (
    SELECT
         s.STUDENT_ID,
         s.STUDENT_NAME,
         m.SUBJECT,
         m.MARKS
    FROM 
        {{ ref("stg_students") }} s
    LEFT JOIN {{ ref("stg_marks") }} m
    ON s.STUDENT_ID = m.STUDENT_ID
)

SELECT * FROM students_join_marks
