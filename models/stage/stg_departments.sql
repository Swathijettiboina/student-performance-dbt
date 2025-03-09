{{config(MATERIALIZED='table')}}

with departments_clean
AS(
    SELECT
        * 
    FROM
        {{source('student_trans_project','departments')}}
)
SELECT * FROM departments_clean