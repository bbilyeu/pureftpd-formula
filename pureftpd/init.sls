{% from "pureftpd/map.jinja" import pureftpd with context %}

pureftpd_install:
  pkg.installed:
    - name: {{ pureftpd.pkg }}
  service.running:
    - name: {{ pureftpd.service }}
    - enable: True
    - reload: True
{% for value, items in salt['pillar.get']('pureftpd:config', {}).iteritems() %}
  pureftpd_config_{{value}}:
    file.managed:
    - name: /etc/pure-ftpd/conf/{{ value }}
    - source: salt://pureftpd/templates/tmp.tmpl
    - template: jinja
    - context:
        data: "{{items}}"
{% endfor %}
