{% macro trimmer(col) %}
    upper(trim({{ col }}))
{%- endmacro %}
