base:
  '*.test':
    - sysctl
    - yum
    - java
    - ntp
    - cloudera/agent
    #- hosts
  'name*.test':
    - postgresql-server/server
    - postgresql-server/users
    - cloudera/manager
    - cloudera/deploy
