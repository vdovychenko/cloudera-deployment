postgresql-server:
  pkg.installed:
    - name: {{ pillar['pkgs']['postgresql-server'] }}
    - order: 2

  postgres_initdb.present:
    - name: /var/lib/pgsql/data
    - auth: password
    - user: postgres
    - password: postgres
    - encoding: UTF8
    - locale: C
    - runas: postgres
    - order: 3

/var/lib/pgsql/data/pg_hba.conf:
  file.managed:
    - name: /var/lib/pgsql/data/pg_hba.conf
    - source: salt://postgresql-server/pg_hba.conf
    - order: 4

/var/lib/pgsql/data/postgresql.conf:
  file.append:
    - name: /var/lib/pgsql/data/postgresql.conf
    - text: listen_addresses = '*'
    - order: 4

postgres-start:
  service.running:
    - name: postgresql
    - enable: True
    - require:
      - pkg: {{ pillar['pkgs']['postgresql-server'] }}
    - order: 5
