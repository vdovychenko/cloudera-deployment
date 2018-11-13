pkgs:
    {% if grains['os_family'] == 'RedHat' %}
    apache: httpd
    cloudera-agent: cloudera-manager-agent
    cloudera-daemon: cloudera-manager-daemons
    cloudera-manager: cloudera-manager-server
    vim: vim-enhanced
    java-openjdk: java-1.8.0-openjdk
    java-openjdk-devel: java-1.8.0-openjdk-devel
    ntp: ntp
    postgresql-server: postgresql-server
    postgresql-jdbc: postgresql-9.3-1101-jdbc4.jar
    java-cloudera: oracle-j2sdk1.8

    {% elif grains['os_family'] == 'Debian' %}
    apache: apache2
    ambari-agent: ambari-agent
    ambari-server: ambari-server
    vim: vim
    java-openjdk: java-1.7.0-openjdk
    java-openjdk-devel: java-1.7.0-openjdk-devel
    ntp: ntp
    postgresql-server: postgresql-server
    postgresql-jdbc: postgresql-9.3-1101-jdbc4.jar
    java-cloudera: oracle-j2sdk1.7

    {% endif %}
