# Apache web server on Amazon EC2 instance

![image](https://github.com/user-attachments/assets/3f6b6356-a168-4747-a4ed-a779d0fdb122)

AWS (Amazon Web Services)
AWS is a cloud computing service by Amazon that provides dozens of cloud services that allow customers to easily deploy applications without the need for expensive on-premises server infrastructure and maintenance. Find out more about AWS here.

EC2 (Elastic Compute Cloud)
Amazon EC2 (is a cost-effective web service that provides users with compute capacity to build and launch applications quickly. It’s one of AWS’ foundational compute services that allows you to rent and manage virtual servers in the cloud.

VPC (Virtual Private Cloud)
A vpc is a foundational service that allows you to create a secure private network in the AWS cloud where you launch your resources. Think of it as your own private slice of the Amazon cloud. An EC2 instance is launched Inside this VPC, along with a public (or private) subnet and internet gateway to allow traffic to and from the internet. Find more info on VPCs here.

Apache
Apache is a free, open-source service that allows users to create HTTP servers and deliver websites and web applications.

![ec2](https://github.com/user-attachments/assets/cd476024-2287-4367-acd4-3a63091de1eb)

![sg](https://github.com/user-attachments/assets/72161b05-062d-446f-9484-da42aefa27cc)

## Method-1 Using User Data
![image](https://github.com/user-attachments/assets/c9727a99-3bd6-4a47-8dd5-9775632cbb43)
After successful launching of ec2, ssh into the server and check apache status.

## Methor-2 SSH-ing into the server and installing using step-by-step commands

1. SSH into the Server using key-pair
![ssh](https://github.com/user-attachments/assets/f9dbc1d6-a16b-442c-953d-d6a19cf1e676)

2. Update the system using below cmd
![update](https://github.com/user-attachments/assets/ed545b4e-a048-4a10-94d1-18a0fc83f00e)

3. Install Apache
![install](https://github.com/user-attachments/assets/178d3e82-7bf0-4b7a-b775-6c842d988ebc)

4. Start and enable apache then check the status
![enable-status](https://github.com/user-attachments/assets/841eabfc-02f3-41ad-9c1d-35f939f5d84d)

5. use echo and type basic html message
![echo](https://github.com/user-attachments/assets/66c4945d-a643-427c-8d4b-a5ca09448005)

6. Goto public ip/dns and you can see the final Apache webpage 
![apache-webpg](https://github.com/user-attachments/assets/0150e44b-7436-46d3-9f71-fd9797165f2e)

7. Removing Apache from the instance
![remv-service](https://github.com/user-attachments/assets/bba4a593-db2a-4469-8ddc-01f088cb617f)
