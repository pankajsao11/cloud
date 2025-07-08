## Ansible Jinja2 template
Ansible uses Jinja2 templates to dynamically generate configuration files, scripts, or other text-based files during playbook execution. These templates allow you to insert variables, apply filters, and use control structures like loops and conditionals.

## Installing and Starting Apache service
>> Create a file "index.j2" (j2 is the extension here)
>> Note => inventory_hostname is another built-in variable that reference the current host being iterated over in the play.
```
A message from {{ inventory_hostname }}
{{ webserver_message }}
```

>> Apache playbook
```
- name: Apache playbook
  hosts: workers
  become: yes

  vars:
    webserver_message: "I am running to the finish line"

  tasks:
    - name: Install Apache
      apt:
        name: apache2
        state: present
        update_cache: yes
      service:
        name: apache2
        state: started
        enabled: yes

    - name: Create index.html using jinja2
      template:
        src: index.j2
        dest: /var/www/html/index.html

```
#Error: ERROR! conflicting action statements: apt, service => two modules (apt and service) in a single task, which is not allowed in Ansible. Each task should use only one module.

![image](https://github.com/user-attachments/assets/ed3e3c76-5317-4667-b42f-c32693d3cef6)

Corrected playbook:
```
- name: Apache playbook
  hosts: workers
  become: yes
  vars:
    webserver_message: " I am running to the finish line"
  tasks:
    - name: Install Apache
      apt:
        name: apache2
        state: present

    - name: Apache state
      service:
        name: apache2
        state: started
        enabled: yes
      
    - name: Create index.html using jinja2
      template:
        src: index.j2
        dest: /var/www/html/index.html
```
![image](https://github.com/user-attachments/assets/ff3bf34d-02b7-4943-a565-f7e71bcebd6f)

![image](https://github.com/user-attachments/assets/95d17284-1c74-456e-aa1b-814aaafc6c78)

![image](https://github.com/user-attachments/assets/f457a3d7-ad22-4b60-bcb3-b91839a6f604)

## Accessing facts using Jinja2

>> create info.j2
```
hostname={{ ansible_facts['hostname'] }}
fqdn={{ ansible_facts['fqdn'] }}                                  
ipaddr={{ ansible_facts['default_ipv4']['address'] }}
distro={{ ansible_facts['distribution'] }}                        
distro_version={{ ansible_facts['distribution_version'] }}
nameservers={{ ansible_facts['dns'] ['nameservers'] }}            
totalmem={{ ansible_facts['memtotal_mb'] }}
freemem={{ ansible_facts['memfree_mb'] }} 
```

facts-playbook.yml
```
- name: Server Information
  hosts: workers
  become: yes
  tasks:
    - name: Create server info.txt using Jinja2
      template:
        src: info.j2
        dest: /tmp/info.txt                       
```
![image](https://github.com/user-attachments/assets/5b8ebf7b-834b-4082-abad-2a1e051cff59)

![image](https://github.com/user-attachments/assets/43e7b946-13ec-4f7f-a38f-e4ffa08d2f48)

## Looping in Jinja2

>> create info.j2 or any other filename
```
{% for host in groups['all'] %}
{{ hostvars[host].ansible_facts.default_ipv4.address }} {{ hostvars[host].ansible_facts.fqdn }}
{{ hostvars[host].ansible_facts.hostname }}
{% endfor %}

```

>> hosts_play.yml
```
- name: Dynamically update host file
  hosts: workers
  become: yes
  tasks:
    - name: Update hosts using jinja2
      template:
        src: info.j2
        dest: /etc/hosts
```

![image](https://github.com/user-attachments/assets/32ac5f7c-84ca-4c74-a2a5-d08e42d3c4fe)

![image](https://github.com/user-attachments/assets/55395e0a-a4ab-4da8-85f1-8bfda7ee5817)
