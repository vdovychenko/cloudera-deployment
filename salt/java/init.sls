java-openjdk:
    pkg.installed:
        - name: {{ pillar['pkgs']['java-openjdk'] }}
        - name: {{ pillar['pkgs']['java-openjdk-devel'] }}
        - order: 1
