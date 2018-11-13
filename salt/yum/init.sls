cloudera-manager-repo:
    pkgrepo.managed:
        - name: cloudera-manager
        - humanname: Cloudera Manager
        - baseurl:  https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/5.15.1/
        - gpgcheck: 0
        - gpgkey: http://archive.cloudera.com/cm5/redhat/7/x86_64/cm/RPM-GPG-KEY-cloudera
        - enabled: True
        - order: 1

