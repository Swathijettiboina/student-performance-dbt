{{ config(materialized='table') }}

with students_clean 
as (
    SELECT 
        STUDENT_ID ,
        NAME        AS STUDENT_NAME,
        DEPARTMENT_ID 
    FROM
        {{source("student_trans_project","students")}}
)
SELECT 
    * 
FROM
    students_clean