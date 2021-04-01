
```shell
# Usage: ansible <host-pattern>  [-f forks] [-m module_name] [-a args]
ansible ambari -i hosts -m ping
ansible test -i hosts -m shell -a "date"

ansible -i hosts test -m copy -a 'src=/usr/lib/python2.6/site-packages/iotop dest=/usr/lib/python2.6/site-packages/iotop'
ansible -i hosts test -m copy -a 'src=/usr/sbin/iotop dest=/usr/sbin/iotop'



ansible ambari -i hosts -m shell -a "service ambari-agent restart"
```