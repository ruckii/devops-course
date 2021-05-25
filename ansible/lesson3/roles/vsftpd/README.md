vsftpd Ansible role
=========

Installs vsftpd server with passwordless anonymous access, open ports, provide SElinux rights.


Role Variables
--------------
|Variable|Default Value|Defined in|Description|
|--|--|--|--|
|**practice_task:**|*3.2*|vsftpd/vars/main.yml|defines practice task number in /var/ftp/pub/readme.txt |
|**anonymous_enable:**|*YES*|vsftpd/defaults/main.yml|defines anonymous access in vsftpd/templates/vsftpd.conf.j2 |
|**write_enable:**|*YES*|vsftpd/defaults/main.yml|defines write rights in vsftpd/templates/vsftpd.conf.j2|
|**anon_upload_enable:**|*YES*|vsftpd/defaults/main.yml|defines anonymous upload rights in vsftpd/templates/vsftpd.conf.j2|

Example Playbook
----------------

An example of how to use this role:

    - hosts: node2.example.com
      roles:
      - vsftpd

License
-------

Unlicense

Author Information
------------------

Yaroslav Rutsky [mail@example.com]
