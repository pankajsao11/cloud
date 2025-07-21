# EC2 Serial Console
The EC2 Serial Console is a powerful AWS feature that lets you access your EC2 instance's low-level terminal — even if SSH is broken or the instance has no public IP. It's especially useful for troubleshooting boot issues, firewall misconfigurations, or network isolation.

## Prerequisites:

* Nitro-based EC2 instance
* Serial console access enabled at the account level
* Proper IAM permissions
* Instance password-based authentication configured
  
>> Nitro: The Nitro System is a collection of hardware and software components built by AWS that enable high performance, high availability, and high security.
The Nitro System provides bare metal capabilities that eliminate virtualization overhead and support workloads that require full access to host hardware. Bare metal instances are well suited for the following:
Workloads that require access to low-level hardware features (for example, Intel VT) that are not available or fully supported in virtualized environments
https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html

## Steps to enable Serial Console access:

Open the EC2 console > In the navigation pane, choose "EC2 Dashboard" > Under Account attributes, choose "Serial Console" > Choose "Manage" > Select "Allow" to enable serial console access > Choose "Update"

<img width="1365" height="642" alt="image" src="https://github.com/user-attachments/assets/092dfa1b-c76e-4f88-a8b4-53ae565d562f" />

<img width="1352" height="340" alt="image" src="https://github.com/user-attachments/assets/070d269a-4962-4c20-b8f3-f6940b6e1a7f" />

## Steps to connect:

Open the EC2 console
Select your instance

<img width="1365" height="646" alt="image" src="https://github.com/user-attachments/assets/1edbe0b6-f97b-4bdf-a98f-fa14cec328e9" />

Click "Connect" > Choose "EC2 Serial Console" tab > Click "Connect" to open the serial console > Log in with OS-level credentials

<img width="1363" height="384" alt="image" src="https://github.com/user-attachments/assets/74f1609d-b99d-4c85-9aac-880fa78ba277" />

You can connect to the serial console without a password. However, to use the serial console for troubleshooting a Linux instance, the instance must have a password-based OS user.
You can set the password for any OS user, including the root user. Note that the root user can modify all files, while each OS user might have limited permissions.
You must set a user password for every instance for which you will use the serial console. This is a one-time requirement for each instance.

#Note: To set an OS user password on a Linux instance
Connect to your instance. You can use any method for connecting to your instance, except the EC2 Serial Console connection method.
To set the password for a user, use the passwd command. In the following example, the user is root.

>> [ec2-user ~]$ sudo passwd root

The following is example output.

>> Changing password for user root.

New password:

At the New password prompt, enter the new password.
At the prompt, re-enter the password.

<img width="1192" height="493" alt="image" src="https://github.com/user-attachments/assets/ef663819-e1c9-472d-a623-21b2af6ade63" />

#Note: We are using public ip here so login can be done using public internet but when we're using private ip/subnet (like 172.31.x.x), make sure you're connecting from within the same VPC or via a bastion host.

<img width="1365" height="646" alt="image" src="https://github.com/user-attachments/assets/0427a5b7-c410-4030-9262-d31bbea1d52e" />


```
## Prerequisites
IAM Permissions:
Your IAM user or role must have the following permissions:

# Supported Instance Types and AMIs:
Instance must be Nitro-based (e.g., t3.micro is supported).
AMI must support serial console (RHEL, Amazon Linux, Ubuntu, etc.).

# Steps to Log In via Serial Console
1. Set a Password for a System User
Since SSH key authentication doesn’t work with the serial console, you need a username and password.
Use EC2 Serial Console or cloud-init to set a password:

2. Access the Serial Console
Go to EC2 > Instances.
Select your instance.
Click Actions > Monitor and troubleshoot > Connect via serial console.

3. Login Prompt
You’ll see a terminal-like interface.
Enter the username (e.g., ec2-user, ubuntu, root) and the password you set.
```
