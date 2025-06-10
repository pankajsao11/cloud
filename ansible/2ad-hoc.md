# Ansible ad-hoc command:
An Ansible ad-hoc command is a one-liner used to perform quick tasks on remote hosts without writing a full playbook, ad hoc commands are great for tasks you repeat rarely and uses the /usr/bin/ansible command-line tool to automate a single task on one or more managed nodes. ad hoc commands are quick and easy, but they are not reusable.
## for copying a file: 
ansible workers -m ansible.builtin.copy -a "src=/home/ubuntu/ansible/hosts.yml dest=/home/ubuntu"

## for removing the file from host:
ansible workers -m file -a "path=/home/ubuntu/hosts.yml state=absent"

![image](https://github.com/user-attachments/assets/5898a060-5f99-40fb-a489-ba21bf601599)

## installing pckg:
got below error; the apt command requires root privileges to install packages, and Ansible is trying to run it without sudo.
ansible workers -m ansible.builtin.apt -a "name=nginx state=present" --become

![image](https://github.com/user-attachments/assets/1f0db3bb-a7b7-45a5-806a-43b5d5f106b7)

after adding --become:

![image](https://github.com/user-attachments/assets/2f602c32-24eb-4072-a45f-a20b1153e6bc)
![image](https://github.com/user-attachments/assets/79e7d2bd-c8bd-4951-8090-2b59ec1efda7)
![image](https://github.com/user-attachments/assets/9c68a4c6-ce66-4074-9c77-688db43393dd)

## removing pckg:

just need to change the state=absent
![image](https://github.com/user-attachments/assets/ca92e636-462e-4b95-91b0-a3d79f1018c5)

## Gathering facts:
Facts represent discovered variables about a system. You can use facts to implement conditional execution of tasks but also just to get ad hoc information about your systems. To see all facts:

$ ansible all -m ansible.builtin.setup

![image](https://github.com/user-attachments/assets/0fc4dc58-bc3c-4428-ae61-51e26a7afab2)
