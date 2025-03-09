SELECT
    STUDENT_ID,
    TOTAL_MARKS
FROM 
    {{ref("mart_students_performance")}}
WHERE
    TOTAL_MARKS<80
