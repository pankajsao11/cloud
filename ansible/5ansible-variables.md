## Variables
Ansible variables are a powerful way to make playbooks dynamic, reusable, and flexible. Variables in Ansible allow you to store values (like usernames, paths, package names, etc.) and reuse them throughout your playbooks, roles, and templates

## creating directory using vars

```
- name: Creating directory using vars
  hosts: workers
  become: yes
  vars:
    dir_name: hosts
  tasks:
    - name: Creating hosts directory
      file:
        path: "/home/ubuntu/{{ dir_name }}"
        state: directory
```
![var1](https://github.com/user-attachments/assets/54fcb6ba-1470-49ab-ba49-f2bd0b8abd84)

![a1](https://github.com/user-attachments/assets/89888b3b-99e3-4d52-9d2b-c684eb45e2c0)

## Installing package using vars file

Create separate vars.yml file:
>>package_name: nginx
>>service_name: nginx

![a2](https://github.com/user-attachments/assets/8b4b485c-b8ac-4506-9110-ed286e1760ff)

```
- name: Install and start service
  hosts: workers
  become: yes
  vars_files:
    - vars.yml
  tasks:
    - name: Install package
      apt:
        name: "{{ package_name }}"
        state: present
    - name: start service
      service:
        name: "{{ service_name }}"
        state: started
```
![a3](https://github.com/user-attachments/assets/3e060f0c-f4b8-4afb-a82f-44655d78adfe)
