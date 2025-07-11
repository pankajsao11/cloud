## Running Tasks upon change with Handler

In Ansible, a handler is a special type of task that runs only when notified by another task. Handlers are typically used for actions like restarting services after configuration changes.

## Running first handler

```
- name: Handler Playbook
  hosts: workers
  become: yes
  tasks:
    - name: Create Engineer group
      group:
        name: engineers
      notify: add jake

    - name: Another task in the Play
      debug:
        msg: 'I am another task'

  handlers:
    - name: add jake
      user:
        name: jake
        groups: engineers
        append: yes
```
<img width="1108" height="453" alt="image" src="https://github.com/user-attachments/assets/9b9df4e8-b8a4-4d2a-8f2b-2db2f842fa2f" />

## Controlling when to report change

```
- name: Handler Playbook
  hosts: workers
  become: yes
  tasks:
    - name: Run the date command
      command: date
      notify: handler1

    - name: Run the uptime command
      command: uptime

  handlers:
    - name: handler1
      debug:
        msg: "I can handle dates"
```
<img width="1116" height="456" alt="image" src="https://github.com/user-attachments/assets/b90ae588-0702-4733-ad51-d3a1c15cc568" />

```
- name: Handler Playbook
  hosts: workers
  become: yes
  tasks:
    - name: Run the date command
      command: date
      notify: handler1
      changed_when: false

    - name: Run the uptime command
      command: uptime

  handlers:
    - name: handler1
      debug:
        msg: "I can handle dates"
```
>> In Ansible, changed_when is used to override the default behavior of a task's change status. It lets you manually define when a task should be considered as having made changes.Handler1 won't be triggered this time as it doesn't report any changes.
>>
>> 
