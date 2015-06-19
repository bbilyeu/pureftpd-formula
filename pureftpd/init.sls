{% from "pureftpd/map.jinja" import pureftpd with context %}

pureftpd_install:
  pkg.installed:
    - name: {{ pureftpd.pkg }}
  service.running:
    - name: {{ pureftpd.service }}
    - enable: True
    - reload: True
