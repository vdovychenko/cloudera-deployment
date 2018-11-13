hosts:
    {% if grains['os_family'] == 'RedHat' %}
    # make sure you use long hostname here!
    salt_host-hostname: daboss.training.cap
    postgres-hostname: name-node.test
    cloudera-manager-hostname: ip-172-31-62-170.ec2.internal

    {% elif grains['os_family'] == 'Debian' %}
    # make sure you use long hostname here!
    salt_host-hostname: daboss.training.cap
    postgres-hostname: name-node.test
    
    {% endif %}
