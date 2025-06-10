# Ansible Config
The ansible.cfg file is the main configuration file for Ansible, a powerful automation tool used for configuration management, application deployment, and task automation.
This file controls how Ansible behaves when it runs. You can customize settings like:
Where to find your inventory (list of servers)
Which SSH user to use
Whether to use sudo (privilege escalation)
Where to store logs
How to handle timeouts, retries, and host key checking
## ansible installation:

sudo yum update (RHL/CentOS) or sudo apt update (Ubuntu/Debian)

![image](https://github.com/user-attachments/assets/eb712f02-4f23-4b6b-9118-59d922b574ad)

sudo yum install ansible -y or sudo apt install ansible -y

![image](https://github.com/user-attachments/assets/2703eeb6-7ee1-4518-88f1-f0ccbafb1bd1)
![image](https://github.com/user-attachments/assets/b6b3d87a-7aa2-465e-8f13-dc2efea94529)

https://docs.ansible.com/ansible/latest/installation_guide/index.html

## Ansible Config:

1. before creating ansible config file:

![image](https://github.com/user-attachments/assets/699bd7a3-cf8f-4345-8a85-f5a0d1416c04)

2. To find the path of ansible installation:
   
ubuntu@ip-172-31-13-7:/$ which ansible
/usr/bin/ansible

3. after creating config file and pinging worker (here is was giving error as the node was in stopped state)

![image](https://github.com/user-attachments/assets/4c806600-8744-4a53-9a2c-07be17337d37)
