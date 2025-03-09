{% macro calculate_total_marks(my_table,marks_col) %}
    SUM({{my_table}}.{{marks_col}}) as cal_total
{% endmacro %}