{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {%- if env_var('DBT_ENVIRONMENT') == 'dev' -%} 
       {{ custom_schema_name | trim }}_{{ default_schema }}
    {%- else -%}
        {{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}