cloudera-manager:
  pkg.installed:
    - name: {{ pillar['pkgs']['cloudera-manager'] }}
    - order: 3
  service.running:
    - name: cloudera-scm-server
    - enable: True
    - require:
      - pkg: {{ pillar['pkgs']['cloudera-manager'] }}
    - order: 9


  cmd.run:
    - name: /usr/share/cmf/schema/scm_prepare_database.sh postgresql scm scm scm
    - user: root
    - order: 8

wait-CM-start:
  cmd.run:
    - name: sleep 30
    - order: 10

