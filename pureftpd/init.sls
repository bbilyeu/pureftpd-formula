{% from "pureftpd/map.jinja" import pureftpd with context %}

pureftpd_install:
  pkg.installed:
    - name: {{ pureftpd.lookup.pkg }}
  service.running:
    - name: {{ pureftpd.lookup.service }}
    - enable: True
    - reload: True
