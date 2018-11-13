wait-ambari-server:
    cmd.run:
      - name: 'sleep 30'
      - order: 12

copy-cm-config:
  file.managed:
    - name: /tmp/cloudera-config.json
    - source: salt://cloudera/cloudera-config.json
    - order: 13

update-cm-config:
  file.replace:
    - name: /tmp/cloudera-config.json
    - pattern: 'master-node-hostname'
    - repl: '{{ pillar['hosts']['cloudera-manager-hostname'] }}'
    - order: 14

cm-deploy:
    cmd.run:
      - name: 'curl -X POST -H "Content-Type: application/json" -d @/tmp/cloudera-config.json http://{{ pillar['paths']['cloudera_manager-user-password'] }}@{{ pillar['hosts']['cloudera-manager-hostname'] }}:7180/api/v12/cm/importClusterTemplate?addRepositories=true'
      - order: 15
