## Ansible Loops
Ansible loops are used to repeat tasks over a list of items, making your playbooks more efficient and dynamic.

## Looping over Lists
```
- name: Register Playbook
  hosts: workers
  become: yes
  vars:
    prime: [2, 3, 5, 7, 11]
  tasks:
    - name: Show the first five prime numbers
      debug:
        msg: "{{ item }}"
      loop: "{{ prime }}"
```
![image](https://github.com/user-attachments/assets/76a126e8-16f0-4d76-abb6-07e9401b4035)

>> Installing multiple packages using loop (Note: for RHEL/Centos tc > httpd and for Ubuntu/Debian > apache2)
```
- name: Install multiple packages
  hosts: workers
  become: yes
  vars:
    pckgs: 
    - nginx
    - apache2
    - git
  tasks:
    - name: Install packages
      apt:
        name: "{{ item }}"
        state: present
      loop: "{{ pckgs }}"
```
The ansible playbook threw this error while executing as we're trying to install httpd in Ubuntu, as apache2 is for ubuntu.
![image](https://github.com/user-attachments/assets/75782d17-4344-4f0c-b268-bb555832ba0b)

Results after fixing the error:
![image](https://github.com/user-attachments/assets/c4e03d7e-8635-415e-8c0e-21c90731f6c0)

state: present
![image](https://github.com/user-attachments/assets/69482985-4c0b-4bf3-88e9-6b152e5c6002)

state: absent
![image](https://github.com/user-attachments/assets/14b2e915-f228-49c3-96d7-07bb23cc301d)

## Looping over dictionaries

```
- name: Print Dictionary
  hosts: workers
  become: yes
  vars:
    emp: 
      name: "Elen"
      title: "Engineer"
  
      name: "Jane"
      title: "Developer"
  tasks:
    - name: Print employee Dictionary
      debug:
        msg: "{{ item.name }} is a {{ item.title }}"
      loop: "{{ emp }}"
```
Error: This is not a list of dictionaries — it's trying to define multiple keys with the same name (name, title), which YAML doesn't allow. 
![image](https://github.com/user-attachments/assets/ea2e7d28-b8a5-4178-bf8f-638c7cfae6cc)

>> When You are passing dictionary, but loop needs list (items) to iterate; use > dict2items
```
#Error playbook
- name: Print Dictionary
  hosts: workers
  become: yes
  vars:
    emp: 
      name: "Elen"
      title: "Engineer"

      name: "Jane"
      title: "Developer"
  tasks:
    - name: Print employee Dictionary
      debug:
        msg: "{{ item.name }} is a {{ item.title }}"
      loop: "{{ emp | dict2items }}"
```
Error: YAML dictionaries can't have duplicate keys (name, title).
![image](https://github.com/user-attachments/assets/803d1077-fbf6-458b-8cb4-8a96f85e039a)

```
#correct playbook1
- name: Print Dictionary
  hosts: workers
  become: yes
  vars:
    emp:
      name1: "Elen"
      title1: "Engineer"

      name2: "Jane"
      title2: "Developer"
  tasks:
    - name: Print employee Dictionary
      debug:
        msg: "{{ item }}"
      loop: "{{ emp | dict2items }}"
```
![image](https://github.com/user-attachments/assets/b89ebaaf-67e5-427e-a5fe-d21f2e73db14)

>>In this we'll not get an error bcs of name and title, the reason behind this is that we've already declared it as list of dict and no need to convert it to dict2items as well.
```
playbook2 using list of dictionary (no need to use dict2items here)
- name: Print Dictionary
  hosts: workers
  become: yes
  vars:
    emp: 
      - name: "Elen"
        title: "Engineer"

      - name: "Jane"
        title: "Developer"
  tasks:
    - name: Print employee Dictionary
      debug:
        msg: "{{ item.name }} is a {{ item.title }}"
      loop: "{{ emp }}"
```
![image](https://github.com/user-attachments/assets/a1a6cfcd-63b1-4022-9139-ca3ac441f5d1)

##Looping over range of numbers:
```
- name: Print Range Loop
  hosts: workers
  become: yes
  tasks:
    - name: Range loop
      debug:
        msg: "{{ item }}"
      loop: "{{ range(10) | list }}"

    - name: Range loop2
      debug:
        msg: "{{ item }}"
      loop: "{{ range(5,15) | list }}"

    - name: Range loop3
      debug:
        msg: 192.168.1.{{ item }}
      loop: "{{ range(0,256,25) | list }}"
```
In Range loop2 we've used range(start:5, stop: 15) and Range loop3 range(start:0,stop:256, step:25)
![image](https://github.com/user-attachments/assets/f73d8d5f-5df1-488b-b8d4-efd77a87979f)

![image](https://github.com/user-attachments/assets/0a3bf463-e3b1-49a9-b2d2-0fb800845cde)

![image](https://github.com/user-attachments/assets/0289182e-9158-444c-9354-72ef115ae3c5)

## Puasing within loops
>> Loop_control pause : 1 is used here to pause loop iteration for certain amount of time
```
- name: Happy Birthday playbook
  hosts: workers
  become: yes
  tasks:
    - name: 10 Seconds countdown
      debug:
        msg: "{{ 10 - item }} Seconds remaining...."
      loop: "{{ range(10) | list }}"
      loop_control:
        pause: 1

    - name: Display Happy Birthday
      debug:
        msg: "Happy Birthday!"
```
![image](https://github.com/user-attachments/assets/1f425f9f-7ab9-4910-a1d5-5538212c8c67)
