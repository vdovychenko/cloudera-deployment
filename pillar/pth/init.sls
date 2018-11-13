paths:
    {% if grains['os_family'] == 'RedHat' %}
    java_home-openjdk: /usr/lib/jvm/jre-openjdk
    # make sure you use long hostname here!
    salt_host-hostname: daboss.training.cap
    cloudera_manager-hostname: 'server_host=name-node.test'
    cloudera_manager-config: '/srv/salt/cloudera/cloudera-config.json'
    cloudera_manager-user-password: 'admin:admin'

    {% elif grains['os_family'] == 'Debian' %}
    java_home-openjdk: /usr/lib/jvm/jre-1.7.0-openjdk.x86_64
    # make sure you use long hostname here!
    salt_host-hostname: daboss.training.cap
    ambari-cluster-name: mamba

    {% endif %}
