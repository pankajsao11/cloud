## Exception handling

In Ansible, exception handling is done using a combination of features that help you gracefully handle errors and control task execution flow.

## Grouping tasks with Blocks
>> Blocks can be used to group similar/related tasks together.

```
- name: Install and start apache
  hosts: workers
  become: yes
  tasks:
    - name: Install and start apache
      block:
        - name: Install apache2
          apt:
            name: apache2
            state: latest

        - name: start and enable apache2
          service:
            name: apache2
            state: started
            enabled: yes

    - name: Outside block
      debug: 
        msg: "Outside the block now..."
```
![image](https://github.com/user-attachments/assets/a105d436-03d1-4078-9056-af6dabf6233f)

## Hadnling failure with Blocks (Rescue and ignore_errors)
>> It can handle task error By using Rescue and always sections

```
- name: Error Handling
  hosts: workers
  become: yes
  tasks:
    - name: Error handle
      block:
        - name: run a command
          command: uptime

        - name: wrong command
          command: bubu

        - name: This will now work
          debug: 
            msg: "This task didn't run because above task failed..."

      rescue:
        - name: Runs when block failed
          debug:
            msg: "Block failed!!"
```
![image](https://github.com/user-attachments/assets/8d276102-ab23-4e21-bfda-dfe4ac35eba9)

>> Using ignore_errors 

```
- name: Error Handling
  hosts: workers
  become: yes
  tasks:
    - name: Error handle
      block:
        - name: run a command
          command: uptime

        - name: wrong command
          command: bubu
          ignore_errors: yes

        - name: This will work
          debug: 
            msg: "This task run because above task failed but ignored..."

      rescue:
        - name: This will not run 
          debug:
            msg: "Error was ignored; so it won't run!!"
```
![image](https://github.com/user-attachments/assets/7071b035-b617-4e9e-a1d2-b62ee79fa730)

>> Using Always

```
- name: Error Handling
  hosts: workers
  become: yes
  tasks:
    - name: Error handle
      block:
        - name: run a command
          command: uptime

        - name: wrong command
          command: bubu
          ignore_errors: yes

        - name: This will work
          debug:
            msg: "This task run because above task failed but ignored..."

      rescue:
        - name: This will not run
          debug:
            msg: "Error was ignored; so it won't run!!"

      always:
        - name: This will always run
          debug:
            msg: 'Whether the block has failed or not.. it will always run'
```

![image](https://github.com/user-attachments/assets/5a7264d7-ef0b-4127-af6b-03c9ad0c9f95)
