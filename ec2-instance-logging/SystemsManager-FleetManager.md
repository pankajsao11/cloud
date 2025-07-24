# AWS Systems Manager Fleet Manager

AWS Systems Manager Fleet Manager is a unified user interface within AWS Systems Manager that enables you to remotely manage your server fleet, whether they are running on AWS or on-premises. It provides centralized visibility and control over the health, performance, and operational tasks for all managed nodes from a single console
Fleet Manager is suitable for organizations seeking central operational efficiency, particularly at scale, across AWS, hybrid, and multicloud environments. To use Fleet Manager, you must enable and configure the Systems Manager Agent (SSM Agent) on your instances and assign correct IAM roles/policies for access

## Prerequisites:

* EC2 instance managed by AWS Systems Manager
* SSM Agent installed on the instance
* Proper IAM permissions


## Steps:

1. Open the AWS Systems Manager console
2. In the navigation pane, choose "Fleet Manager"
3. Select your instance from the list

4. For Windows instances:
Choose "Node actions" and then "Connect with Remote Desktop"
Choose your connection preferences and click "Connect"

5. For Linux instances:
Choose "Node actions" and then "Connect with Terminal"
Click "Connect" to start a terminal session

<img width="1920" height="940" alt="image" src="https://github.com/user-attachments/assets/50c2183e-995a-4472-a3f9-7c34b34a1c3f" />

<img width="1480" height="523" alt="image" src="https://github.com/user-attachments/assets/86d8d77d-868b-4660-8e76-a5d5f812b3fa" />

<img width="1920" height="947" alt="image" src="https://github.com/user-attachments/assets/450a527e-056f-4984-a377-5378c663e726" />
