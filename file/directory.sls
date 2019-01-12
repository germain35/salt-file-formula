{%- from "file/map.jinja" import file with context %}

{%- set directory = file.get('directory', {}) %}

{% if directory is mapping %}
  {%- for key, params in directory.items() %}
{{key}}:
  file.directory: 
    {%- for param, value in params.items() %}
    - {{param}}: {{value}}
    {%- endfor %}
  {%- endfor %}
{%- elif directory is list %}
  {%- for params in directory %}
file_directory_{{loop.index}}:
  file.directory: 
    {%- for param, value in params.items() %}
    - {{param}}: {{value}}
    {%- endfor %}
  {%- endfor %}
{%- endif %}