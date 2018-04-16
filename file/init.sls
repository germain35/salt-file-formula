{%- from "file/map.jinja" import file with context %}

include:
  {%- if file.directory %}
  - file.directory
  {%- endif %}
  {%- if file.recurse %}
  - file.recurse
  {%- endif %}
  {%- if file.managed %}
  - file.managed
  {%- endif %}
  {%- if file.symlink %}
  - file.symlink
  {%- endif %}
