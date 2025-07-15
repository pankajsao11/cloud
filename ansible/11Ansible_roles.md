## Ansible Roles:
A role is a structured way to organize playbooks and reusable automation components. Roles help you break down complex configurations into manageable, reusable parts.

## Ansible Galaxy:
Ansible Galaxy is a community hub where you can find, share, and reuse Ansible roles, collections, and content. It helps you avoid reinventing the wheel by using pre-built automation for common tasks like installing software, configuring services, or managing infrastructure.

>>A typical role has the following directory structure:
```
roles/
└── webserver/
    ├── tasks/
    │   └── main.yml
    ├── handlers/
    │   └── main.yml
    ├── templates/
    │   └── index.j2
    ├── files/
    │   └── sample.conf
    ├── vars/
    │   └── main.yml
    ├── defaults/
    │   └── main.yml
    ├── meta/
    │   └── main.yml
```

## Installing and using roles

<img width="939" height="178" alt="image" src="https://github.com/user-attachments/assets/65b060c5-f43e-4cad-9140-1606004c5a52" />

<img width="946" height="330" alt="image" src="https://github.com/user-attachments/assets/0e1d5241-cb1e-470c-bc2c-ae2d7c246eb0" />

```
ubuntu@ip-172-31-13-7:~/ansible$ tree roles/geerlingguy.mysql/    
roles/geerlingguy.mysql/
├── LICENSE
├── README.md
├── defaults
│   └── main.yml
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── molecule
│   └── default
│       ├── converge.yml
│       └── molecule.yml
├── tasks
│   ├── configure.yml
│   ├── databases.yml
│   ├── main.yml
│   ├── replication.yml
│   ├── secure-installation.yml
│   ├── setup-Archlinux.yml
│   ├── setup-Debian.yml
│   ├── setup-RedHat.yml
│   ├── users.yml
│   └── variables.yml
├── templates
│   ├── my.cnf.j2
│   ├── root-my.cnf.j2
│   └── user-my.cnf.j2
└── vars
    ├── Archlinux.yml
    ├── Debian-10.yml
    ├── Debian-11.yml
    ├── Debian-12.yml
    ├── Debian.yml
    ├── RedHat-7.yml
    ├── RedHat-8.yml
    ├── RedHat-9.yml
    └── Ubuntu.yml

9 directories, 29 files
```
>> creating playbook for using the role
```
- name: Applying Geerlingguy mysql role
  hosts: workers
  become: yes
  roles:
    - geerlingguy.mysql
```
<img width="1295" height="607" alt="image" src="https://github.com/user-attachments/assets/f422707a-e16b-48a8-ae9f-2d4d6c4563c1" />

<img width="1201" height="600" alt="image" src="https://github.com/user-attachments/assets/7b8adcbe-316e-4bc1-ba07-17beaad4d073" />

<img width="983" height="362" alt="image" src="https://github.com/user-attachments/assets/94af8459-5770-43cd-9b57-f27df8d56d44" />

## Removing the role

```
ubuntu@ip-172-31-13-7:~/ansible$ ansible-galaxy remove geerlingguy.mysql -p ./roles
- successfully removed geerlingguy.mysql
```

## Using Requirements file to install multiple roles

>> Ansible galaxy can install multiple roles at once using a requirements file

>> requirements.yml
```
# From Ansible Galaxy
- src: geerlingguy.haproxy

# From GitHub
- src: https://github.com/bennojoy/nginx
  name: nginx_role
  version: master

# From Ansible Galaxy
- src: geerlingguy.jenkins
  name: jenkins_role
```

<img width="1121" height="352" alt="image" src="https://github.com/user-attachments/assets/f0eb3991-e0df-41ee-b7f0-02af7c6a68b0" />

```
 ubuntu@ip-172-31-13-7:~/ansible$ ansible-galaxy list -p ./roles
# /home/ubuntu/ansible/roles
- geerlingguy.haproxy, 1.3.2
- nginx_role, master
- jenkins_role, 5.3.0
[WARNING]: - the configured path /home/ubuntu/.ansible/roles does not exist.
[WARNING]: - the configured path /usr/share/ansible/roles does not exist.
[WARNING]: - the configured path /etc/ansible/roles does not exist.
```

## Creating Custom roles

>> use ansible-galaxy init for this

<img width="904" height="487" alt="image" src="https://github.com/user-attachments/assets/20b2eb73-0922-488d-b5c5-6f3551ab79a4" />

>> tasks/main.yml
```
- name: Install apache2
  apt:
    name: apache2
    state: latest

- name: Start and enable apache2
  service:
    name: apache2
    state: started
    enabled: true

- name: Create index.html using jinja2
  template:
    src: index.j2
    dest: /var/www/html/index.html
```

<img width="813" height="413" alt="image" src="https://github.com/user-attachments/assets/c2808def-dbdc-48d3-89f4-a94fe1cd2e94" />


>> templates/index.j2

<img width="873" height="154" alt="image" src="https://github.com/user-attachments/assets/3eb3403e-6561-4cd1-ae1f-2e04e51fc7e8" />


>> defaults/main.yml
```
ubuntu@ip-172-31-13-7:~/ansible/roles/apache2-role$ cat defaults/main.yml 
---
# defaults file for apache2-role
sysadmin: pankajsao11@gmail.com
```

>> apache-role.yml

```
- name: Using apache2
  hosts: workers
  become: yes
  roles:
    - role: apache2-role
```

<img width="1228" height="565" alt="image" src="https://github.com/user-attachments/assets/957c33f2-4e1d-4ee1-89a4-a6c0243acffb" />

## Task Execution order

>> task-order.yml
```
- name: Task order execution
  hosts: workers
  become: yes
  tasks:
    - name: A normal task
      debug:
        msg: "I'm a normal task"


  post_tasks:
  - name: Last task
    debug:
      msg: "I'm a last task to be executed"
  
  pre_tasks:
  - name: first task
    debug:
      msg: "I'm a first task to be executed"

  roles:
    - role: myrole
```

>> roles/myrole/tasks/main.yml

```
- name: 
    debug:
      msg: "I'm a first task to be executed"

- name: 
    debug:
      msg: "I'm a last task to be executed"
```

