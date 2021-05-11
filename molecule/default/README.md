# Please run molecule step by step (not molecule test):
* Because all images don't contain all environments those Ansible needs, you must set up something (Read below messeges).
# Before you run molecule converge:
* To run molecule converge in RedHet OS family, If you don't want to use IPv6, delete ::1 in /etc/hosts.

* To run molecule converge in RHEL OS, please register a subscription before run.