# CloudShell

AWS CloudShell is a browser-based, pre-authenticated shell environment available directly within the AWS Management Console. It allows you to manage, interact with, and automate AWS resources without installing or configuring the AWS CLI, SDKs, or other tools on your local machine.

## Prerequisites:

* AWS account with CloudShell access
* IAM permissions for CloudShell
* SSH key pair for the instance

## Steps:

1. Open the AWS Management Console
2. Click the CloudShell icon in the navigation bar
3. Once CloudShell loads, use SSH to connect to your instance:
>> ssh -i /path/to/your-key.pem ec2-user@your-instance-public-dns

If your key isn't in CloudShell yet, you can create a new one or upload an existing one

<img width="1920" height="942" alt="image" src="https://github.com/user-attachments/assets/37333eef-3c2f-4062-95ec-156e50be4acb" />

<img width="1913" height="929" alt="image" src="https://github.com/user-attachments/assets/a8230485-b987-438c-9cde-52449f2866d6" />
