{{config(MATERIALIZED='table')}}

with marks_clean
AS(
    SELECT
        * 
    FROM
        {{source('student_trans_project','marks')}}
)
SELECT * FROM marks_clean