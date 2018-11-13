{% for usr in ['scm', 'amon', 'rman', 'hive', 'sentry', 'oozie', 'nav', 'navms', 'hue'] %}
{{ usr }}:
  postgres_user.present:
    - name: {{ usr }}
    - password: {{ usr }}
    - db_user: postgres
    - db_password: postgres
    - db_host: {{ pillar['hosts']['postgres-hostname'] }}
    - order: 6
  postgres_database.present:
    - name: {{ usr }}
    - owner: {{ usr }}
    - user: postgres
    - db_user: postgres
    - db_password: postgres
    - db_host: {{ pillar['hosts']['postgres-hostname'] }}
    - order: 7
{% endfor %}
