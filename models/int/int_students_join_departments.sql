{{ config(materialized='table') }}

WITH students_join_departments AS (
    SELECT
         s.STUDENT_ID,
         s.STUDENT_NAME,
         d.DEPARTMENT_ID,
         d.DEPARTMENT_NAME
    FROM 
        {{ ref("stg_students") }} s
    LEFT JOIN {{ ref("stg_departments") }} d
    ON s.DEPARTMENT_ID = d.DEPARTMENT_ID
)

SELECT * FROM students_join_departments
