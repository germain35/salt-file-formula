{%- from "file/map.jinja" import file with context %}

{%- set recurse = file.get('recurse', {}) %}

{% if recurse is mapping %}
  {%- for key, params in recurse.items() %}
{{key}}:
  file.recurse: 
    {%- for param, value in params.items() %}
    - {{param}}: {{value}}
    {%- endfor %}
  {%- endfor %}
{%- elif recurse is list %}
  {%- for params in recurse %}
file_recurse_{{loop.index}}:
  file.recurse: 
    {%- for param, value in params.items() %}
    - {{param}}: {{value}}
    {%- endfor %}
  {%- endfor %}
{%- endif %}