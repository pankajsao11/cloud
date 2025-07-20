## SSH 

SSH (Secure Shell) is a cryptographic network protocol that enables secure communication, remote login, command execution, and file transfer between computers over an unsecured network. Its main purposes and characteristics include:

>> Strong encryption: SSH encrypts all data transferred between clients and servers, protecting sensitive information such as passwords and commands from interception.

>> Authentication: SSH supports both strong password and public key authentication. Public-key authentication uses a pair of cryptographic keys (public and private) to verify identity, often allowing for passwordless login if configured.

>> Client-server architecture: The protocol connects an SSH client (where the session is initiated) with an SSH server (where the session runs).

>> Remote management: SSH is widely used by system administrators to remotely access, configure, and manage servers and network devices securely.

>> File transfer and tunneling: SSH enables secure file transfers (e.g., via scp or sftp), and can create secure tunnels (port forwarding) to protect other network communications.

>> Replacement for insecure protocols: SSH replaces protocols like Telnet, rlogin, rsh, and FTP, all of which transmit data, including credentials, in unencrypted form.

## How SSH works:

Connection is established by the SSH client to port 22 (by default) on the remote host, where the SSH server listens.
The server identifies itself using its public key, which the client can store and recognize in subsequent connections.
The client and server negotiate keys for encrypting the session.
Users authenticate using passwords or their private keys.
Once authenticated, users can run commands, manage files, or set up additional secure network tunnels—all within an encrypted session

## Prerequisites:

EC2 instance running Linux/Unix
Instance's public DNS name or IP address
Private key file (.pem) associated with the instance
SSH client (built-in on Mac/Linux, or PuTTY on Windows)

## Steps for Mac/Linux:

Open Terminal
Set proper permissions for your key file:
chmod 400 /path/to/your-key.pem
Connect using SSH:
ssh -i /path/to/your-key.pem ec2-user@your-instance-public-dns

>> Note: Replace "ec2-user" with the appropriate username for your AMI:

```
Amazon Linux: ec2-user
Ubuntu: ubuntu
Debian: admin
CentOS: centos
RHEL: ec2-user or root
```

<img width="1920" height="885" alt="image" src="https://github.com/user-attachments/assets/73abccab-8dd8-44cb-920b-3a82e6470a36" />

<img width="1912" height="780" alt="image" src="https://github.com/user-attachments/assets/4c5aba53-847d-43ee-9291-c8c05988c106" />

<img width="1503" height="856" alt="image" src="https://github.com/user-attachments/assets/29c7df17-ce04-4eb8-ab34-5b874e520129" />

<img width="893" height="122" alt="image" src="https://github.com/user-attachments/assets/9dc3361e-d1a4-486e-a671-b9b98b3e72e2" />

## Steps for Windows using PuTTY:

Download and install PuTTY and PuTTYgen
Convert your .pem file to .ppk using PuTTYgen:
Launch PuTTYgen
Click "Load" and select your .pem file
Click "Save private key" to create a .ppk file
Launch PuTTY
Enter your instance's public DNS or IP in the "Host Name" field
Navigate to Connection > SSH > Auth > Credentials
Browse and select your .ppk file
Click "Open" to connect
Enter the username when prompted
