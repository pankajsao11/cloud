# Ansible Modules
Modules (also referred to as “task plugins” or “library plugins”) are which are pieces of code that extend core Ansible functionality and can be used from the command line or in a playbook task. Ansible executes each module, usually on the remote managed node, and collects return values. 

## Modules
Executing modules from CLI:
>>ansible all -m ping
here "-m ping" is the ping module, which checks if Ansible can connect to the host via SSH and run Python. 

## Creating Directory, getting uptime and OS-release version through modules

```
- name: Create a directory
  hosts: all
  become: true
  tasks:
    - name: create host dir
      file:
        path: /home/ubuntu/host
        state: directory

    - name: Get system uptime
      command: uptime
      register: uptime_op
      changed_when: false

    - name: show uptime
      debug:
        msg: "{{ uptime_op.stdout }}"

    - name: OS release version
      command: cat /etc/os-release
      register: os_op
      changed_when: false

    - name: get os-release
      debug:
        msg: "{{ os_op.stdout }}"
```
>> After executing the play we were not getting the desired o/p in terminal
![image](https://github.com/user-attachments/assets/4c86bdbc-786a-4fe0-8f74-4405ee490715)

because it was running the commands in the host in background. Ansible runs the command but does not automatically print the output (stdout) unless you explicitly tell it to.
So we modified and added few lines to print the output in the terminal:
>>Got this error because we had mistake in chang_when (changed_when)
![image](https://github.com/user-attachments/assets/7faba442-d768-4905-875d-49c969a5f69a)

>>final output after execution
![image](https://github.com/user-attachments/assets/57875f4c-9f0a-412c-9640-443d1689bfcf)


