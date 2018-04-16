{%- from "file/map.jinja" import file with context %}

include:
  {%- if file.directory is defined %}
  - file.directory
  {%- endif %}
  {%- if file.recurse is defined %}
  - file.recurse
  {%- endif %}
  {%- if file.managed is defined %}
  - file.managed
  {%- endif %}
  {%- if file.symlink is defined %}
  - file.symlink
  {%- endif %}
