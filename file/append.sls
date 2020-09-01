{%- from "file/map.jinja" import file with context %}

{%- set append = file.get('append', {}) %}

{% if append is mapping %}
  {%- for key, params in append.items() %}
{{key}}:
  file.append:
    {%- for param, value in params.items() %}
      {%- if param == 'text' %}
    - {{param}}: |
        {{value|indent(8)}}
      {%- else %}
    - {{param}}: {{value}}
      {%- endif %}
    {%- endfor %}
  {%- endfor %}
{%- elif append is list %}
  {%- for params in append %}
file_append_{{loop.index}}:
  file.append:
    {%- for param, value in params.items() %}
      {%- if param == 'text' %}
    - {{param}}: |
        {{value|indent(8)}}
      {%- else %}
    - {{param}}: {{value}}
      {%- endif %}
    {%- endfor %}
  {%- endfor %}
{%- endif %}
