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

## Using Vars in List

```
- name: Demo vars using List
  hosts: workers
  become: yes
  vars:
    port_nums:
    - 22
    - 443
    - 25
    - 3389
    - 80
  tasks:
    - name: Ports
      debug:
        msg: All the Ports are {{ port_nums }}
```
![image](https://github.com/user-attachments/assets/c094de54-0e1d-435b-ac41-98b8a06947b4)

## Getting USER input (Prompt)
```
- name: Demo vars using List
  hosts: workers
  become: yes
  vars:
    port_nums:
    - 22
    - 80
  vars_prompt:
  - name: username
    prompt: What's your name?
    private: no
  tasks:
    - name: Ports
      debug:
        msg: Hey {{ username }} All the Ports are {{ port_nums }}
```
![image](https://github.com/user-attachments/assets/9a8a611d-a13e-4ea5-8dde-becbb5c8af11)


## Capturing Output with register
```
- name: Register Playbook
  hosts: workers
  become: yes
  tasks:
    - name: Run a command
      command: uptime
      register: server_uptime

    - name: Inspect the server uptime variable
      debug:
        var: server_uptime

    - name: Show the server uptime
      debug:
        msg: "{{ server_uptime.stdout }}"
```

![image](https://github.com/user-attachments/assets/acded385-c1f9-481b-8147-7948635fff77)
![image](https://github.com/user-attachments/assets/33022bbb-6b8b-44d7-8567-0460c656db89)
