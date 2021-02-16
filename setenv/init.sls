{%- set vars = salt['config.get']('setenv:variables', {}) %}
{%- set update_minion = salt['config.get']('setenv:update_minion', True)|to_bool %}
{%- set false_unsets = salt['config.get']('setenv:false_unsets', True)|to_bool %}

{%- if vars|length > 0 %}
salt-environment-variables:
  environ.setenv:
    - name: set salt environment variables
    - value:
        {%- for var, value in vars|dictsort %}
        {{ var|yaml_squote }}: {{ value|yaml_squote }}
        {%- endfor %}
    - update_minion: {{ update_minion }}
    - false_unsets: {{ false_unsets }}
{%- endif %}
