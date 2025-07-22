# AWS Systems Manager Session Manager

AWS Systems Manager Session Manager is a powerful tool that lets you securely connect to your EC2 instances without needing SSH, bastion hosts, or open inbound ports. It uses the AWS Systems Manager (SSM) agent and IAM roles to manage access.

## Benefits of Session Manager
* No need for SSH or public IPs
* Secure and auditable (logs can be sent to CloudWatch or S3)
* Works with private EC2 instances
* Supports Linux and Windows
* No need for open inbound ports
* No need for bastion hosts
* Detailed audit logs in CloudTrail

## Requirements:
SSM Agent installed on instance; IAM role with AmazonSSMManagedInstanceCore policy

## To enable Session Manager on an instance:

1. Create an IAM role with AmazonSSMManagedInstanceCore policy

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeAssociation",
                "ssm:GetDeployablePatchSnapshotForInstance",
                "ssm:GetDocument",
                "ssm:DescribeDocument",
                "ssm:GetManifest",
                "ssm:GetParameter",
                "ssm:GetParameters",
                "ssm:ListAssociations",
                "ssm:ListInstanceAssociations",
                "ssm:PutInventory",
                "ssm:PutComplianceItems",
                "ssm:PutConfigurePackageResult",
                "ssm:UpdateAssociationStatus",
                "ssm:UpdateInstanceAssociationStatus",
                "ssm:UpdateInstanceInformation"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssmmessages:CreateControlChannel",
                "ssmmessages:CreateDataChannel",
                "ssmmessages:OpenControlChannel",
                "ssmmessages:OpenDataChannel"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2messages:AcknowledgeMessage",
                "ec2messages:DeleteMessage",
                "ec2messages:FailMessage",
                "ec2messages:GetEndpoint",
                "ec2messages:GetMessages",
                "ec2messages:SendReply"
            ],
            "Resource": "*"
        }
    ]
}
```

2. Attach the role to your EC2 instance
3. Ensure the SSM Agent is installed and running on your instance

> sudo snap list amazon-ssm-agent

> sudo apt update
>> sudo apt install -y snapd

> sudo snap install amazon-ssm-agent --classic

verify and start ssm agent:

> sudo snap services amazon-ssm-agent

> sudo systemctl enable amazon-ssm-agent

> sudo systemctl start amazon-ssm-agent
>  sudo systemctl status amazon-ssm-agent

4. Verify the instance appears in Systems Manager > Fleet Manager

<img width="1365" height="646" alt="image" src="https://github.com/user-attachments/assets/b280bf92-545d-4971-aa32-98e1653e454e" />

## Steps via Console:

Open the Amazon EC2 console > Select your instance > Click "Connect" > Choose "Session Manager" tab > Click "Connect" to start a browser-based session

<img width="1365" height="647" alt="image" src="https://github.com/user-attachments/assets/95ffd7d4-83b4-43c7-8643-94119b0c9754" />

<img width="1363" height="391" alt="image" src="https://github.com/user-attachments/assets/d18b594f-3bc7-476f-8185-52f26c6cde3d" />

## Steps via AWS CLI:

1. Install the Session Manager plugin for AWS CLI:
2. For macOS: brew install session-manager-plugin
3. For Windows: Download and run the installer from AWS
4. For Linux: Follow AWS documentation for your distribution

Start a session:
aws ssm start-session --target i-1234567890abcdef0

<img width="1362" height="675" alt="image" src="https://github.com/user-attachments/assets/3d5dcf6b-7e85-46cc-9e67-1b196172be73" />

