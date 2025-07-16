## Ansible Vault

Ansible Vault encrypts variables and files so you can protect sensitive content such as passwords or keys rather than leaving it visible as plaintext in playbooks or roles. To use Ansible Vault you need one or more passwords to encrypt and decrypt content. If you store your vault passwords in a third-party tool such as a secret manager, you need a script to access them.

## Creating Encrypted files and storing secrets in a separate file

>> When you want to view the file using cat it will be encrypted
>> When you use ansible-vault view file, it will ask for pw
>> To skip pw, we can store it in a separate file and use it

<img width="1061" height="498" alt="image" src="https://github.com/user-attachments/assets/a87fc862-cbe8-4531-b5ad-e81d3122c9e8" />

## Decrypting file

<img width="928" height="367" alt="image" src="https://github.com/user-attachments/assets/baf68c12-03cd-4dbc-acc2-629b522bb06e" />

## Decrypting content at run time

<img width="826" height="316" alt="image" src="https://github.com/user-attachments/assets/5734c8bf-3ef9-4034-a9cb-6e3c4c988e9e" />

we can see that it's giving an error; now we'll use --ask-vault-pass or --vault-password-file
```
- name: Task order execution
  hosts: workers
  become: yes
  vars_files: pw.yml
  tasks:
    - name: Show secret1 value
      debug:
        msg: "{{ secret1 }}"
```

<img width="1226" height="600" alt="image" src="https://github.com/user-attachments/assets/2230292c-eec6-45c8-ac18-8df14ded5d9d" />
