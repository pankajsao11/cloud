# EC2 Instance Connect
Amazon EC2 Instance Connect provides a secure way to connect to your Linux instances over Secure Shell (SSH). With EC2 Instance Connect, you use AWS Identity and Access Management (IAM) policies and principals to control SSH access to your instances, removing the need to share and manage SSH keys. All connection requests using EC2 Instance Connect are logged to AWS CloudTrail so that you can audit connection requests.
You can use EC2 Instance Connect to connect to your instances using the Amazon EC2 console or the SSH client of your choice.

## Using Public IP

Prerequisites:

* EC2 instance running a supported Linux distribution (Amazon Linux 2, Amazon Linux 2023, Ubuntu 16.04 or later)
* Instance must have the EC2 Instance Connect package installed
* Proper IAM permissions
* Internet connectivity to AWS APIs

Steps:

1. Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/ 
2. In the navigation pane, choose "Instances"
3. Select your instance
4. Click the "Connect" button
5. Choose "EC2 Instance Connect" tab
6. Verify or modify the username
7. Click "Connect" to open a browser-based terminal session

<img width="1365" height="647" alt="image" src="https://github.com/user-attachments/assets/6476eb84-e406-4652-8487-0ef50caf846f" />

<img width="1357" height="562" alt="image" src="https://github.com/user-attachments/assets/e3279401-4556-43f5-b2a9-ca32465d2d21" />


To enable EC2 Instance Connect on an unsupported AMI:
```
Connect to your instance using SSH
Install the EC2 Instance Connect package:
For Amazon Linux: sudo yum install ec2-instance-connect
For Ubuntu: sudo apt-get install ec2-instance-connect
Ensure port 22 is open in your security group
```

## Accessing EC2 Instances Using Private Endpoints
Private endpoints allow you to access your EC2 instances without exposing them to the public internet, enhancing security. 

## Setup Steps:

* Open the EC2 console
* In the navigation pane, choose "EC2 Instance Connect Endpoints"
* Click "Create EC2 Instance Connect Endpoint"

<img width="1365" height="648" alt="image" src="https://github.com/user-attachments/assets/f9f06b05-c00b-4155-b4b7-3266328dfd6c" />

* Select your VPC
* Choose a subnet where you want to create the endpoint
* Configure security groups > Create a new security group or select an existing one > Ensure it allows outbound traffic to your instances' security groups

<img width="1364" height="645" alt="image" src="https://github.com/user-attachments/assets/018eb656-3715-4705-bddc-74ac45d3b4f7" />

* Click "Create EC2 Instance Connect Endpoint"

## Connection Steps:

1. Open the EC2 console
2. Select your instance
3. Click "Connect"
4. Choose "EC2 Instance Connect" tab
5. Under "Connection type," select your EC2 Instance Connect Endpoint > Click "Connect"

<img width="1363" height="639" alt="image" src="https://github.com/user-attachments/assets/b6cf5e65-d049-45f2-b690-5aa37432543e" />

<img width="1365" height="567" alt="image" src="https://github.com/user-attachments/assets/061789de-dcec-4254-9867-be2a4d9c4202" />

