## Cloud Computing:
Cloud computing refers to the delivery of various services over the internet, including storage, computing power, and applications. Instead of owning physical hardware, businesses can rent computing resources from cloud service providers like Amazon Web Services (AWS), Microsoft Azure, or Google Cloud Platform (GCP). This model offers scalability, flexibility, and cost-efficiency, enabling organizations to quickly adapt to changing demands and scale their operations seamlessly.

Key benefits of cloud computing include:

>>Scalability: Easily scale resources up or down based on demand.

>>Cost Efficiency: Pay only for the resources you use, reducing capital expenditure.

>>Flexibility: Access services and resources from anywhere with an internet connection.

>>Disaster Recovery: Enhance business continuity with robust backup and recovery solutions.

## DevOps:
DevOps is a set of practices that combines software development (Dev) and IT operations (Ops). The goal of DevOps is to shorten the development lifecycle and deliver high-quality software continuously. DevOps fosters a culture of collaboration and communication between development and operations teams, breaking down silos and automating processes to improve efficiency and reliability.

![d14](https://github.com/pankajsao11/cloud/assets/81400644/5aa1dfc3-8cf6-4988-bcb7-c655ee21d6ba)

```
#Continuous Integration (CI): CI is the practice of frequently merging code changes into a central repository, where automated tests run to ensure the code integrates smoothly.
Example: A developer pushes a bug fix to the repository, and CI tools automatically run tests to ensure the fix integrates correctly with the existing code.

#Continuous Delivery (CD): CD automates the delivery of code to testing and production environments, ensuring that changes are always ready for deployment at any time.
Example: After CI tests pass, the code will automatically be pushed to a staging environment and can be deployed to production without manual intervention.
```

Key principles of DevOps include:
```
Continuous Integration (CI): Automating the integration of code changes from multiple contributors into a shared repository.
Continuous Delivery (CD): Automating the release process to ensure that software can be reliably released at any time.
Infrastructure as Code (IaC): Managing and provisioning computing infrastructure using machine-readable definition files.
Monitoring and Logging: Continuously monitoring applications and infrastructure to detect and respond to issues in real-time.
Collaboration: Encouraging a culture of shared responsibility, transparency, and collaboration across all stages of the software development lifecycle.
Together, Cloud and DevOps empower organizations to innovate faster, deliver software more efficiently, and respond swiftly to market changes.
```

![d30](https://github.com/pankajsao11/cloud/assets/81400644/5282ade5-e405-4c8f-9299-a6a93ba4ceed)

![cloud-comparison](https://github.com/user-attachments/assets/18d55d3f-3e17-4a6f-98da-55a66336aced)

![image](https://github.com/user-attachments/assets/cac584fa-0cfe-476a-874b-da6e5d31ee55)

![image](https://github.com/user-attachments/assets/9237fe2a-917d-4228-9edf-605acf73137c)

## DevOps RoadMap
![image](https://github.com/user-attachments/assets/5e93d97a-6c48-4a13-8d02-3b3a9f676440)

## Terraform Project Structure
![image](https://github.com/user-attachments/assets/c0996524-040a-46ef-bd44-9c412879e78c)

Terraform module folder structure:
```
terraform-project/
├── modules/
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
├── backend.tf
└── provider.tf
```
>> environments/dev/main.tf
```
module "ec2_instance" {
  source        = "../../modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  name          = "dev-instance"
}
```
The source = "../../modules/ec2" line in the parent module tells Terraform to use the child module located in the modules/ec2 directory. 
../../modules/ec2 means: go up two directories and into modules/ec2. This is the most common setup for reusable modules in the same repo.

![image](https://github.com/user-attachments/assets/d0e4d3e9-c249-463a-bcd5-9af4305a16b7)

## Linux File paths
![image](https://github.com/user-attachments/assets/400fc320-b78e-4e34-8700-695e791887a6)


<img width="558" height="528" alt="image" src="https://github.com/user-attachments/assets/7c79becc-596f-4973-86e9-91f5e213fd0a" />

<img width="717" height="466" alt="image" src="https://github.com/user-attachments/assets/4ef77a45-f0ed-4a7a-a42a-1a42100e1321" />


AWS Hands-on tutorial: https://aws.amazon.com/getting-started/hands-on/?getting-started-all.sort-by=item.additionalFields.content-latest-publish-date&getting-started-all.sort-order=desc&awsf.getting-started-category=*all

Jenkins: https://www.jenkins.io/doc/tutorials/

