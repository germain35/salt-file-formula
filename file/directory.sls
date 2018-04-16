{%- from "file/map.jinja" import file with context %}

{%- for directory in file.get('directory', []) %}
{{directory.name}}:
  file.directory:
    {%- if directory.user is defined %}
    - user: {{directory.user}}
    {%- endif %}
    {%- if directory.group is defined %}
    - group: {{directory.group}}
    {%- endif %}
    {%- if directory.dir_mode is defined %}
    - dir_mode: {{directory.dir_mode}}
    {%- endif %}
    {%- if directory.file_mode is defined %}
    - file_mode: {{directory.file_mode}}
    {%- endif %}
    {%- if directory.recurse is defined %}
    - recurse: {{directory.recurse}}
    {%- endif %}
    {%- if directory.makedirs is defined %}
    - makedirs: {{directory.makedirs}}
    {%- endif %}
    {%- if directory.clean is defined %}
    - clean: {{directory.clean}}
    {%- endif %}
    {%- if directory.force is defined %}
    - force: {{directory.force}}
    {%- endif %}
{%- endfor %}