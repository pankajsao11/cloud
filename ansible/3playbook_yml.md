Note: ```yaml is used for formatting yaml file in this md file else it will appear in bullet points etc
Create a playbook.yml file and then write the code for the playbook
#ping and message print using yml
![image](https://github.com/user-attachments/assets/6e2239ee-c137-40e7-bc82-54792be0f768)

## Playbook: ping, pckg update and debug message
```yaml
- name: My first play
  hosts: workers
  become: yes
  tasks:
  - name: Ping my hosts
    ansible.builtin.ping:

  - name: Print message
    ansible.builtin.debug:
      msg: Har Har Mahadev

  - name: Update apt package index
    apt:
      update_cache: yes
```
    
cmd: ansible-playbook playbook.yml (make sure to be in the same directory where all the required files is present)
![image](https://github.com/user-attachments/assets/95ef2b33-87dc-4ff5-a2e7-55431222667d)

## check mode (for checking what's changed)
Note: to clear/delete all the lines in vi file use (insert>esc>:%d then enter)

ansible-playbook playbook.yml --check
![image](https://github.com/user-attachments/assets/68ef0496-7ba2-4a31-81af-712976b773db)

## Installing git and docker
```yaml
- name: Installing Git and Docker
  hosts: workers
  become: yes
  tasks:
  - name: Ping my hosts
    ansible.builtin.ping:

  - name: Git install
    apt:
      name: git
      state: present

  - name: Docker install
    apt:
      name: docker.io
      state: present
  
  - name: Installing Git and Docker
    ansible.builtin.debug:
      msg: Git and Docker installed successfully in hosts servers
```
![image](https://github.com/user-attachments/assets/a79c7816-cf75-4ef2-9677-ed2ded76e226)

![image](https://github.com/user-attachments/assets/394fc6eb-847a-4652-814a-74dc121baf04)

## Removing git and docker
```yaml
- name: Removing Git and Docker
  hosts: workers
  become: yes
  tasks:
  - name: Ping my hosts
    ansible.builtin.ping:

  - name: Git remove
    apt:
      name: git
      state: absent

  - name: Docker remove
    apt:
      name: docker.io
      state: absent

  - name: removing Git and Docker
    ansible.builtin.debug:
      msg: Git and Docker removed successfully from hosts servers
```    
![image](https://github.com/user-attachments/assets/49d8de7a-8064-4c94-b494-97f7ab31bc79)

![image](https://github.com/user-attachments/assets/341bedce-fd7c-4df0-b058-22f3748673d0)
