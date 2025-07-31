# Managing process and tasks
```
- name: Manage cron jobs
  hosts: workers
  become: yes
  tasks:
    - name:  Run this cron job every two mins
      cron:
        name: "two-mins"
        user: elliot
        job: logger 'Two minutes have passed!!'
        minute: '*/2'

    - name: wait for 5 minutes
      pause:
        minutes: 5

    - name: Remove the 2 mins cron job
      cron:
        name: "two-mins"
        user: elliot
        state: absent
```

<img width="1279" height="492" alt="image" src="https://github.com/user-attachments/assets/cb486e77-3994-4f4a-a263-5e48476defa0" />


