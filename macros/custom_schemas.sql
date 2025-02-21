{% macro generate_schema_name(custom_schema_name, node) %}
    {% if target.name != 'prod' %}
        {% set prefix = target.name ~ '_' %}
    {% else %}
        {% set prefix = '' %}
    {% endif %}

    {% if custom_schema_name is none %}
        {{ prefix ~ default_schema }}
    {% else %}
        {{ prefix ~ custom_schema_name }}
    {% endif %}
{% endmacro %}
