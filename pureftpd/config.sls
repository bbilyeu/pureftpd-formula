# vim: sts=2 ts=2 sw=2 et ai
{% from "pureftpd/map.jinja" import pureftpd with context %}

include:
  - pureftpd

{% for value, items in salt['pillar.get']('pureftpd:config', {}).iteritems() %}
pureftpd_config_{{value}}:
  file.managed:
    - name: {{ value }}
    - source: salt://pureftpd/templates/tmp.tmpl
    - template: jinja
    - context:
	      data: {{items}}
{% endfor %}

