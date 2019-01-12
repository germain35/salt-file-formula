{%- from "file/map.jinja" import file with context %}

{%- set symlink = file.get('symlink', {}) %}

{% if symlink is mapping %}
  {%- for key, params in symlink.items() %}
{{key}}:
  file.symlink: 
    {%- for param, value in params.items() %}
    - {{param}}: {{value}}
    {%- endfor %}
  {%- endfor %}
{%- elif symlink is list %}
  {%- for params in symlink %}
file_symlink_{{loop.index}}:
  file.symlink: 
    {%- for param, value in params.items() %}
    - {{param}}: {{value}}
    {%- endfor %}
  {%- endfor %}
{%- endif %}