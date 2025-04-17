{% test switzerland(model, column_name) %}
    select *
    from {{ model }}
    where {{ column_name }} = 'Switzerland'
{% endtest %} 