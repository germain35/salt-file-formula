{%- from "file/map.jinja" import file with context %}

{%- for recurse in file.get('recurse', []) %}
{{recurse.name}}:
  file.recurse:
    - source: {{recurse.source}}
    {%- if recurse.template is defined %}
    - template: {{recurse.template}}
    {%- endif %}
    {%- if recurse.user is defined %}
    - user: {{recurse.user}}
    {%- endif %}
    {%- if recurse.group is defined %}
    - group: {{recurse.group}}
    {%- endif %}
    {%- if recurse.dir_mode is defined %}
    - dir_mode: {{recurse.dir_mode}}
    {%- endif %}
    {%- if recurse.file_mode is defined %}
    - file_mode: {{recurse.file_mode}}
    {%- endif %}
    {%- if recurse.makedirs is defined %}
    - makedirs: {{recurse.makedirs}}
    {%- endif %}
    {%- if recurse.clean is defined %}
    - clean: {{recurse.clean}}
    {%- endif %}
    {%- if recurse.replace is defined %}
    - replace: {{recurse.replace}}
    {%- endif %}
{%- endfor %}