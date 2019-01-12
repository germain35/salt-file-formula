{%- from "file/map.jinja" import file with context %}

{%- set managed = file.get('managed', {}) %}

{% if managed is mapping %}
  {%- for key, params in managed.items() %}
{{key}}:
  file.managed: 
    {%- for param, value in params.items() %}
      {%- if param == 'contents' and value is not list %}
    - {{param}}: |
        {{value|indent(8)}}
      {%- else %}
    - {{param}}: {{value}}
      {%- endif %}
    {%- endfor %}
  {%- endfor %}
{%- elif managed is list %}
  {%- for params in managed %}
file_managed_{{loop.index}}:
  file.managed: 
    {%- for param, value in params.items() %}
      {%- if param == 'contents' and value is not list %}
    - {{param}}: |
        {{value|indent(8)}}
      {%- else %}
    - {{param}}: {{value}}
      {%- endif %}
    {%- endfor %}
  {%- endfor %}
{%- endif %}