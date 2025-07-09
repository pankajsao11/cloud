## Decision making in Ansible

In Ansible, decision-making is handled using conditionals, when statements, and Jinja2 expressions. These allow you to control whether a task runs based on facts, variables, or the results of previous tasks.

## When to run task

>> Using when conditional statement to run a task only when a certain condition is true.

```
- name: Server Information
  hosts: workers
  become: yes
  tasks:
    - name: Detect ubuntu Server
      debug:
        msg: "This is an Ubuntu server!!"
      when: ansible_facts['distribution'] == 'Ubuntu'
```
![image](https://github.com/user-attachments/assets/ce7bb752-130a-4e9e-acfa-518c5d49c8a0)

## When with Registers 

>> In Ansible, the register keyword is used to capture the output of a task into a variable. This allows you to use the result later in the playbook for decision-making or debugging.

```
- name: Server Information
  hosts: workers
  become: yes
  tasks:
    - name: Save the contents of os-release
      command: cat /etc/os-release
      register: os_release

    - name: Detect ubuntu Server
      debug:
        msg: "Running Ubuntu server..."
      when: os_release.stdout.find('Ubuntu') != -1
```
![image](https://github.com/user-attachments/assets/bbed5607-79cb-4e49-bbce-0e6130f48b98)

## Testing multiple conditions with When

```
- name: Reboot servers
  hosts: workers
  become: yes
  tasks:
    - name: Reboot Ubuntu Server
      reboot:
        msg: "Server is rebooting..."
      when: >
        ansible_facts['distribution'] == "Ubuntu" or
        (ansible_facts['distribution'] == "Debian" and 
        ansible_facts['distribution_major_version'] == '8')
```
#Error: when condition mixes or and and without parentheses, which can lead to unexpected behavior.
#correction :
```
when: >
  ansible_facts['distribution'] == "Ubuntu" or
  (ansible_facts['distribution'] == "Debian" and
  ansible_facts['distribution_major_version'] == "8")
```
![image](https://github.com/user-attachments/assets/269fa14b-d538-46f3-a22f-e2867bfa99ce)

![image](https://github.com/user-attachments/assets/3564f020-5280-48d1-be41-42489ee9b389)

## Using when with Loop
```
- name: Print numbers
  hosts: workers
  become: yes
  tasks:
    - name: Print Event numbers
      debug:
        msg: Number {{ item }} is Even.
      loop: "{{ range(1,11) | list }}"
      when: item % 2 == 0
```
![image](https://github.com/user-attachments/assets/af898de1-28c2-4cc0-be27-b981ebe71f1e)

## Using when with variables
>> here in when condition "bool" filter is used to convert the on_call value to its boolean (no=>false)
```
- name: When with vars
  hosts: workers
  become: yes
  vars:
    weekend: true
    on_call: "no"
  tasks:
    - name: Checking the condition
      debug:
        msg: You are available!
      when: weekend and not on_call | bool
```
![image](https://github.com/user-attachments/assets/4fdedc23-919d-4ddb-8d60-40e1c23b74b0)
