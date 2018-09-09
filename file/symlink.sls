{%- from "file/map.jinja" import file with context %}

{%- for symlink in file.get('symlink', []) %}
{{symlink.name}}:
  file.symlink:
    - target: {{symlink.target}}
    {%- if symlink.user is defined %}
    - user: {{symlink.user}}
    {%- endif %}
    {%- if symlink.group is defined %}
    - group: {{symlink.group}}
    {%- endif %}
    {%- if symlink.mode is defined %}
    - mode: {{symlink.mode}}
    {%- endif %}
    {%- if symlink.makedirs is defined %}
    - makedirs: {{symlink.makedirs}}
    {%- endif %}
    {%- if symlink.force is defined %}
    - force: {{symlink.force}}
    {%- endif %}
{%- endfor %}
