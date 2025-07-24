# RDP

Remote Desktop Protocol, is a proprietary protocol developed by Microsoft that allows users to connect to and control a remote computer over a network connection. It provides a graphical interface for users to interact with a remote desktop environment as if they were sitting in front of the computer. RDP is widely used for remote access and administration of computers, especially within Windows environments. 

## Prerequisites:

* EC2 instance running Windows
* Instance's public DNS name or IP address
* Security group with port 3389 open
* RDP client (built-in on Windows, Microsoft Remote Desktop on Mac)
  
## Steps:

1. Open the Amazon EC2 console
2. Select your Windows instance
3. Click "Connect" and choose "RDP client" tab
4. Click "Get password"
5. Upload your .pem key file to decrypt the administrator password

<img width="1363" height="555" alt="image" src="https://github.com/user-attachments/assets/8407eb2d-df7c-4429-bc97-d91095a28157" />

<img width="1339" height="409" alt="image" src="https://github.com/user-attachments/assets/562fd973-bc5d-4862-a9ba-2be7b46c9692" />

6. Copy the decrypted password

<img width="1358" height="643" alt="image" src="https://github.com/user-attachments/assets/cbd9b1ce-4902-4be1-b268-86b9f933c71d" />

7. Click "Download remote desktop file"

<img width="1365" height="643" alt="image" src="https://github.com/user-attachments/assets/b62345d0-14b8-4dd5-90cf-bb15d409ed82" />

8. Open the RDP file with your RDP client
9. When prompted, enter the administrator credentials

