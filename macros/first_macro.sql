{% macro divide_by_hundred(column_name, precision=1) %}
    ({{ column_name }} / 100)::numeric(16, {{ precision }})
{% endmacro %}