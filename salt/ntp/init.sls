ntp:
  pkg.installed:
    - name: {{ pillar['pkgs']['ntp'] }}
    - order: 1

  service.running:
    - name: ntpd
    - enable: True
    - require:
      - pkg: ntp
    - order: 1
 
