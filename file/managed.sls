{%- from "file/map.jinja" import file with context %}

{%- for managed in file.get('managed', []) %}
{{managed.name}}:
  file.managed:
    source: {{managed.source}}
    {%- if managed.source_hash is defined %}
    - source_hash: {{managed.source_hash}}
    {%- else %}
    - skip_verify: True
    {%- endif %}
    {%- if managed.template is defined %}
    - template: {{managed.template}}
    {%- endif %}
    {%- if managed.user is defined %}
    - user: {{managed.user}}
    {%- endif %}
    {%- if managed.group is defined %}
    - group: {{managed.group}}
    {%- endif %}
    {%- if managed.dir_mode is defined %}
    - dir_mode: {{managed.dir_mode}}
    {%- endif %}
    {%- if managed.mode is defined %}
    - mode: {{managed.mode}}
    {%- endif %}
    {%- if managed.context is defined %}
    - context: {{managed.context}}
    {%- endif %}
    {%- if managed.makedirs is defined %}
    - makedirs: {{managed.makedirs}}
    {%- endif %}
    {%- if managed.clean is defined %}
    - clean: {{managed.clean}}
    {%- endif %}
    {%- if managed.replace is defined %}
    - replace: {{managed.replace}}
    {%- endif %}
    {%- if managed.create is defined %}
    - create: {{managed.create}}
    {%- endif %}
    {%- if managed.contents_pillar is defined %}
    - contents_pillar: {{managed.contents_pillar}}
    {%- endif %}
    {%- if managed.contents_grains is defined %}
    - contents_grains: {{managed.contents_grains}}
    {%- endif %}
    {%- if managed.force is defined %}
    - force: {{managed.force}}
    {%- endif %}
{%- endfor %}