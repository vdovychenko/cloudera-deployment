cloudera-daemon:
    pkg.installed:
        - name: {{ pillar['pkgs']['cloudera-daemon'] }}
        - order: 2

cloudera-agent:
    pkg.installed:
      - name: {{ pillar['pkgs']['cloudera-agent'] }}
      - order: 2
    service.running:
      - name: cloudera-scm-agent
      - enable: True
      - require:
        - pkg: {{ pillar['pkgs']['cloudera-agent'] }}
      - order: 4

cloudera-agent.ini:
    file.blockreplace:
        - name: /etc/cloudera-scm-agent/config.ini
        - marker_start: "[server_host]"
        - marker_end: "server_port=7182"
        - content: {{ pillar['paths']['cloudera_manager-hostname'] }}
        - append_if_not_found: True
        - backup: '.bak'
        - show_changes: True
        - order: 3
