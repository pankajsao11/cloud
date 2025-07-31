Configure log_path = playbooks.log in ansible.cfg

```
- name: Manage cron jobs
  hosts: workers
  become: yes
  var:
    blog: "linux handbook"
  tasks:
    - name: demo task
      debug:
        msg: "This is troubleshooting content {{ blog }}"
```

<img width="1016" height="638" alt="image" src="https://github.com/user-attachments/assets/b6086783-bdba-4a65-9f66-5720a30c100c" />
