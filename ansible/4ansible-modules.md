# Ansible Modules
Modules (also referred to as “task plugins” or “library plugins”) are which are pieces of code that extend core Ansible functionality and can be used from the command line or in a playbook task. Ansible executes each module, usually on the remote managed node, and collects return values. 

## Modules
Executing modules from CLI:
>>ansible all -m ping
here "-m ping" is the ping module, which checks if Ansible can connect to the host via SSH and run Python. 
