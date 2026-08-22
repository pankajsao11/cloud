# Azure Cloud Concepts — Professional Cheat Sheet

> A practical, GitHub-ready reference covering the most important Azure cloud concepts for **Cloud Engineers, DevOps Engineers, System Administrators, and AZ-900/AZ-104 preparation**.

Microsoft's current Azure Fundamentals learning path organizes the fundamentals around cloud concepts, Azure architecture and services, and Azure management/governance. The topics below expand those areas into a practical DevOps-oriented reference. citeturn0search4turn0search13turn0search19

---

## 📚 Table of Contents

- [1. Cloud Computing Fundamentals](#1-cloud-computing-fundamentals)
- [2. Azure Global Infrastructure](#2-azure-global-infrastructure)
- [3. Azure Resource Hierarchy](#3-azure-resource-hierarchy)
- [4. Azure Resource Management](#4-azure-resource-management)
- [5. Azure Compute](#5-azure-compute)
- [6. Azure Networking](#6-azure-networking)
- [7. Azure Storage](#7-azure-storage)
- [8. Azure Databases](#8-azure-databases)
- [9. Identity and Access Management](#9-identity-and-access-management)
- [10. Azure Security](#10-azure-security)
- [11. Governance and Compliance](#11-governance-and-compliance)
- [12. Monitoring and Observability](#12-monitoring-and-observability)
- [13. Backup and Disaster Recovery](#13-backup-and-disaster-recovery)
- [14. Azure Application Services](#14-azure-application-services)
- [15. Containers and Kubernetes](#15-containers-and-kubernetes)
- [16. Serverless](#16-serverless)
- [17. Integration and Messaging](#17-integration-and-messaging)
- [18. DevOps and CI/CD](#18-devops-and-cicd)
- [19. Infrastructure as Code](#19-infrastructure-as-code)
- [20. Azure Automation](#20-azure-automation)
- [21. Cost Management](#21-cost-management)
- [22. High Availability and Scalability](#22-high-availability-and-scalability)
- [23. Azure Architecture Patterns](#23-azure-architecture-patterns)
- [24. Azure Well-Architected Framework](#24-azure-well-architected-framework)
- [25. Important Azure Comparisons](#25-important-azure-comparisons)
- [26. Azure Services Quick Reference](#26-azure-services-quick-reference)
- [27. DevOps Engineer Priority List](#27-devops-engineer-priority-list)
- [28. Recommended Hands-On Projects](#28-recommended-hands-on-projects)
- [29. Useful Azure CLI Commands](#29-useful-azure-cli-commands)
- [30. Official Microsoft Learn Resources](#30-official-microsoft-learn-resources)

---

# 1. Cloud Computing Fundamentals

## What is Cloud Computing?

Cloud computing is the delivery of computing resources such as:

- Compute
- Storage
- Networking
- Databases
- Security
- Application platforms

over the internet, generally using a consumption-based model.

### Key characteristics

- On-demand resources
- Elastic scaling
- High availability
- Global reach
- Automation
- Pay-as-you-go pricing
- Managed services

---

## Cloud Service Models

| Model | You manage | Azure example |
|---|---|---|
| IaaS | OS, applications, configuration | Azure Virtual Machines |
| PaaS | Application and data | Azure App Service |
| SaaS | Mostly configuration/data | Microsoft 365 |
| Serverless | Application logic/data | Azure Functions |

### IaaS

You manage:

```text
Application
Runtime
Operating System
Configuration
```

Azure manages:

```text
Physical hardware
Datacenter
Networking infrastructure
Hypervisor
```

### PaaS

Azure manages more of the platform:

```text
Application
Data
```

while Azure manages:

```text
Runtime
OS
Infrastructure
Scaling mechanisms
```

### SaaS

The provider manages almost the entire application stack.

---

## Cloud Deployment Models

### Public Cloud

Infrastructure is operated by a cloud provider.

Examples:

- Microsoft Azure
- AWS
- Google Cloud

### Private Cloud

Cloud infrastructure is dedicated to an organization.

### Hybrid Cloud

Combination of:

```text
On-Premises
     +
Azure
```

Common for:

- Gradual cloud migration
- Regulatory requirements
- Legacy applications
- Disaster recovery

### Multi-Cloud

Using multiple cloud providers.

```text
Azure + AWS + GCP
```

---

# 2. Azure Global Infrastructure

Azure infrastructure is organized into geographic and physical constructs.

## Geography

A broad geographic area containing one or more Azure regions.

Examples:

```text
United States
Europe
Asia Pacific
```

---

## Region

A geographic location containing Azure datacenters.

Example:

```text
East US
West Europe
Central India
```

---

## Availability Zone

Physically separate datacenter locations within a supported Azure region.

Conceptually:

```text
Region
├── Availability Zone 1
├── Availability Zone 2
└── Availability Zone 3
```

Used to improve:

- Availability
- Fault isolation
- Resilience

---

## Region Pairs

Some Azure regions are paired for certain platform-level resiliency and disaster-recovery considerations.

Do not assume that every Azure service automatically replicates between region pairs; replication behavior depends on the specific service and configuration.

---

## Azure Edge / Global Services

Examples:

- Azure Front Door
- Azure Traffic Manager
- Azure CDN capabilities
- Azure DNS

---

# 3. Azure Resource Hierarchy

A fundamental Azure hierarchy is:

```text
Microsoft Entra Tenant
        │
        └── Management Groups
                │
                └── Subscriptions
                        │
                        └── Resource Groups
                                │
                                └── Resources
```

Management groups help organize and govern subscriptions at scale. Microsoft recommends keeping management-group hierarchies reasonably flat to reduce complexity. citeturn0search15

---

## Microsoft Entra Tenant

Represents an organization's identity boundary.

Contains identities such as:

- Users
- Groups
- Applications
- Service principals
- Managed identities

---

## Management Group

Used to organize multiple Azure subscriptions.

Useful for:

- Governance
- Azure Policy
- RBAC
- Enterprise organization

---

## Subscription

A billing and management boundary.

A subscription can contain:

```text
Resource Groups
Resources
RBAC assignments
Policies
Budgets
```

---

## Resource Group

Logical container for Azure resources.

Example:

```text
rg-prod-web
├── VM
├── NIC
├── Public IP
├── NSG
└── Storage Account
```

---

## Azure Resource

An individual Azure service instance.

Examples:

- VM
- VNet
- Storage Account
- SQL Database
- Key Vault
- Function App

---

# 4. Azure Resource Management

## Azure Resource Manager — ARM

ARM is Azure's management layer for deploying and managing resources.

Common capabilities:

- Resource deployment
- RBAC
- Tags
- Policies
- Locks
- Templates
- Resource organization

---

## Resource Providers

Azure resources are exposed through resource providers.

Examples:

```text
Microsoft.Compute
Microsoft.Network
Microsoft.Storage
Microsoft.Web
Microsoft.KeyVault
```

---

## Azure Resource Manager Templates

ARM templates define infrastructure declaratively using JSON.

Example concept:

```json
{
  "resources": [
    {
      "type": "Microsoft.Storage/storageAccounts"
    }
  ]
}
```

For modern infrastructure automation, many teams also use:

- Terraform
- Bicep
- Azure CLI
- Azure PowerShell

---

## Tags

Tags are key-value metadata.

```text
Environment = Production
Project     = PaymentApp
Owner       = DevOps
CostCenter  = CC1001
```

Used for:

- Cost allocation
- Resource organization
- Automation
- Reporting

---

## Resource Locks

Protect resources from accidental changes.

Types:

```text
CanNotDelete
ReadOnly
```

---

# 5. Azure Compute

## Azure Virtual Machines

IaaS compute service.

You control:

- OS
- Packages
- Applications
- Configuration
- Network interfaces

Typical architecture:

```text
Internet
   │
Public IP / Load Balancer
   │
Azure VM
   │
Managed Disk
```

---

## VM Scale Sets — VMSS

Deploy and manage a group of VMs.

Useful for:

- Horizontal scaling
- High availability
- Stateless workloads
- Web applications

Concept:

```text
Load Balancer
      │
 ┌────┼────┐
 VM   VM   VM
```

---

## Availability Sets

Logical grouping of VMs for improved availability using fault and update domains.

Availability Zones are generally the stronger isolation mechanism when supported by the workload and region.

---

## Azure App Service

Managed PaaS platform for:

- Web applications
- REST APIs
- Backend applications

Supports:

- Deployment slots
- Autoscaling
- Custom domains
- TLS
- CI/CD integration

---

## Azure Container Apps

Managed platform for containerized applications without requiring direct Kubernetes cluster management.

Useful for:

- APIs
- Microservices
- Event-driven applications
- Background workers

---

## Azure Batch

Managed service for large-scale parallel and batch computing.

---

# 6. Azure Networking

## Virtual Network — VNet

The fundamental private networking service in Azure.

Equivalent conceptually to:

```text
AWS VPC
    ≈
Azure VNet
```

A VNet contains:

```text
VNet
├── Subnet
├── Subnet
└── Subnet
```

---

## Subnet

Logical IP range inside a VNet.

Example:

```text
VNet: 10.0.0.0/16

Web:    10.0.1.0/24
App:    10.0.2.0/24
Data:   10.0.3.0/24
```

---

## Network Security Group — NSG

Controls inbound and outbound network traffic.

Rules contain:

- Source
- Destination
- Port
- Protocol
- Direction
- Priority
- Allow/Deny

Example:

```text
Allow TCP 443
Source: Internet
Destination: Web subnet
```

---

## Application Security Group — ASG

Allows NSG rules to reference groups of application workloads rather than relying only on IP addresses.

---

## Azure Load Balancer

Layer 4 load balancing.

Supports:

- TCP
- UDP

Use cases:

- VM workloads
- High availability
- Internal applications

---

## Application Gateway

Layer 7 web traffic load balancer.

Features can include:

- HTTP/HTTPS routing
- TLS termination
- Path-based routing
- Host-based routing
- Web Application Firewall

---

## Azure Front Door

Global application delivery service.

Useful for:

- Global HTTP/HTTPS applications
- Global routing
- Application acceleration
- Web Application Firewall
- Failover

---

## VPN Gateway

Provides encrypted connectivity between:

```text
On-Premises ↔ Azure
```

or:

```text
VNet ↔ VNet
```

---

## ExpressRoute

Private connectivity between an on-premises environment and Azure.

Concept:

```text
Enterprise Network
       │
   ExpressRoute
       │
      Azure
```

Unlike a normal site-to-site VPN, ExpressRoute uses a private connectivity model through supported connectivity providers.

---

## VNet Peering

Connects VNets privately.

Types:

- Regional VNet peering
- Global VNet peering

---

## Azure Virtual WAN

Managed networking service for large-scale branch, site, and global connectivity architectures.

---

## Azure Private Link

Provides private connectivity to supported Azure services and private-link-enabled services.

Important concepts:

```text
Private Endpoint
Private IP
Private Link
```

---

## Private Endpoint

Creates a private network interface with a private IP for connecting to a supported service.

Example:

```text
VM
 │
Private IP
 │
Private Endpoint
 │
Azure Storage
```

---

## Azure DNS

Provides DNS hosting and DNS resolution capabilities.

Services include:

- Azure DNS
- Azure Private DNS

---

# 7. Azure Storage

## Storage Account

Core Azure storage resource.

Common services:

```text
Blob Storage
File Shares
Queue Storage
Table Storage
```

---

## Blob Storage

Object storage for:

- Images
- Videos
- Backups
- Logs
- Static websites
- Data files

---

## Blob Access Tiers

Common access tiers include:

```text
Hot
Cool
Cold
Archive
```

Choose based on access frequency and retention requirements.

---

## Storage Redundancy

Common redundancy models include:

```text
LRS
ZRS
GRS
GZRS
RA-GRS
RA-GZRS
```

Conceptually:

| Type | Concept |
|---|---|
| LRS | Locally redundant |
| ZRS | Zone redundant |
| GRS | Geo redundant |
| GZRS | Geo + zone redundancy |
| RA-GRS | Read-access geo redundancy |
| RA-GZRS | Read-access geo + zone redundancy |

Always verify service-specific availability and supported redundancy options.

---

## Azure Files

Managed SMB/NFS file shares depending on the selected configuration.

Useful for:

- Shared application files
- Lift-and-shift workloads
- File-based workloads

---

## Queue Storage

Simple message queue storage.

Useful for decoupling applications.

---

## Table Storage

NoSQL key-value storage.

---

## Shared Access Signature — SAS

Provides delegated access to Azure Storage resources.

SAS can restrict:

- Resource
- Permissions
- Start/end time
- Protocol
- IP range

---

# 8. Azure Databases

## Azure SQL Database

Fully managed relational database service based on SQL Server.

---

## Azure SQL Managed Instance

Managed SQL Server-compatible platform offering broader SQL Server compatibility than Azure SQL Database.

---

## SQL Server on Azure VM

IaaS approach.

You manage more of:

```text
VM
OS
SQL Server
Configuration
```

---

## Azure Database for PostgreSQL

Managed PostgreSQL service.

---

## Azure Database for MySQL

Managed MySQL service where supported by the current Azure service offering.

---

## Azure Cosmos DB

Globally distributed NoSQL database service.

Important concepts:

- Global distribution
- Partitioning
- Low-latency access
- Multiple APIs
- Consistency models

---

## Azure Cache for Redis

Managed in-memory caching service.

Useful for:

- Session data
- Application caching
- Frequently accessed data
- Reducing database load

---

# 9. Identity and Access Management

Microsoft Entra ID is Azure's core cloud identity and access management service. It supports authentication, policy enforcement, and protection for users, devices, applications, and resources. citeturn0search16

---

## Microsoft Entra ID

Formerly known as Azure Active Directory.

Used for:

- User authentication
- Application authentication
- SSO
- MFA
- Conditional Access
- Identity governance

---

## Authentication vs Authorization

### Authentication

Answers:

> Who are you?

### Authorization

Answers:

> What are you allowed to do?

---

## Users

Human identities.

---

## Groups

Collections of users or other supported identity objects.

Useful for:

```text
Group
  ↓
RBAC Assignment
  ↓
Azure Resource
```

---

## Service Principal

Identity used by an application or automation process.

Example:

```text
GitHub Actions
      ↓
Service Principal
      ↓
Azure
```

---

## Managed Identity

Azure-managed identity for workloads.

Two common types:

```text
System-assigned
User-assigned
```

Preferred over storing long-lived credentials in applications when the target Azure service supports the scenario.

---

## Microsoft Entra ID vs Active Directory Domain Services

| Feature | Entra ID | AD DS |
|---|---|---|
| Cloud identity | Yes | Not primarily |
| LDAP | Not traditional LDAP | Yes |
| Kerberos/NTLM | Not traditional AD DS | Yes |
| Cloud SSO | Yes | Limited |
| Domain join | Cloud-oriented | Traditional domain |
| IAM | Strong | Strong |

---

## RBAC

Role-Based Access Control determines what an identity can do.

Common roles:

```text
Owner
Contributor
Reader
User Access Administrator
```

Concept:

```text
Who
 ↓
Can perform what action
 ↓
On which scope
```

---

## RBAC Scope

Can be assigned at:

```text
Management Group
Subscription
Resource Group
Resource
```

---

## Principle of Least Privilege

Give only the permissions required.

```text
Required permissions
        ↓
Not excessive permissions
```

---

## MFA

Multi-factor authentication adds additional verification.

---

## Conditional Access

Controls access based on conditions such as:

- User
- Location
- Device
- Application
- Risk
- Authentication strength

---

## Managed Identity Architecture

```text
Azure VM
   │
Managed Identity
   │
Microsoft Entra ID
   │
Azure Key Vault
```

No application-stored password is required for the identity authentication flow.

---

# 10. Azure Security

Azure security guidance covers identity, network security, data protection, threat protection, and operational security. citeturn0search20

---

## Microsoft Defender for Cloud

Cloud security posture management and workload protection capabilities.

Used for:

- Security recommendations
- Threat protection
- Security posture
- Workload security

---

## Microsoft Sentinel

Cloud-native SIEM and security analytics platform.

Used for:

- Log collection
- Threat detection
- Security analytics
- Incident response
- Automation

---

## Azure Key Vault

Secure storage for:

- Secrets
- Keys
- Certificates

Typical architecture:

```text
Application
    │
Managed Identity
    │
Key Vault
    │
Secret / Certificate
```

---

## Azure Firewall

Managed network security service providing centralized traffic control.

---

## Web Application Firewall — WAF

Protects web applications from common web attacks.

Can be integrated with services such as:

- Application Gateway
- Azure Front Door

---

## DDoS Protection

Provides protection against distributed denial-of-service attacks.

---

## Encryption

### Encryption at Rest

Protects stored data.

### Encryption in Transit

Protects data moving between systems.

Typical technologies:

```text
TLS / HTTPS
```

---

# 11. Governance and Compliance

## Azure Policy

Enforces organizational rules.

Example:

```text
Allowed Locations:
Central India
East US
West Europe
```

Policy can prevent or audit non-compliant resources.

---

## Policy Effect Examples

Common effects include:

```text
Audit
Deny
Modify
Append
DeployIfNotExists
AuditIfNotExists
```

---

## Policy Initiative

Collection of related policies.

```text
Initiative
├── Policy 1
├── Policy 2
└── Policy 3
```

---

## Azure Blueprints

Historically used for repeatable governance packages. For current implementations, Microsoft recommends using Azure Policy, infrastructure-as-code, and related deployment/governance mechanisms rather than treating Blueprints as the primary modern approach.

---

## Resource Locks

Protect resources from deletion or modification.

```text
CanNotDelete
ReadOnly
```

---

## Azure Advisor

Provides recommendations across areas such as:

- Cost
- Security
- Reliability
- Performance
- Operational considerations

Azure Advisor recommendations align with the Well-Architected pillars. citeturn0search1

---

## Microsoft Purview

Data governance and data management platform for discovering, classifying, and governing data across supported sources.

---

# 12. Monitoring and Observability

## Azure Monitor

Core Azure monitoring platform.

Collects and analyzes:

- Metrics
- Logs
- Activity data
- Alerts

---

## Log Analytics Workspace

Central workspace for querying logs.

Uses:

```text
KQL
```

Example:

```kusto
AzureActivity
| where ActivityStatusValue == "Succeeded"
| project TimeGenerated, OperationNameValue, Caller
```

---

## Application Insights

Application performance monitoring.

Can monitor:

- Requests
- Dependencies
- Exceptions
- Availability
- Performance
- Distributed tracing

---

## Azure Alerts

Can trigger actions based on:

```text
Metrics
Logs
Activity Log
Smart detection / service signals
```

---

## Action Groups

Define what happens when an alert fires.

Examples:

- Email
- SMS
- Webhook
- Azure Function
- Logic App
- Automation-related actions

---

## Activity Log

Tracks subscription-level management operations.

Examples:

```text
VM created
NSG changed
Resource deleted
Role assignment changed
```

---

## Diagnostic Settings

Route platform logs and metrics to destinations such as:

```text
Log Analytics
Storage Account
Event Hubs
```

---

# 13. Backup and Disaster Recovery

## Azure Backup

Managed backup service for supported workloads.

---

## Azure Site Recovery

Disaster recovery and replication service for supported workloads.

Concept:

```text
Primary
   │
Replication
   ↓
Secondary
```

---

## RPO

Recovery Point Objective.

> How much data loss is acceptable?

Example:

```text
RPO = 15 minutes
```

means the recovery strategy targets no more than approximately 15 minutes of data loss under the defined conditions.

---

## RTO

Recovery Time Objective.

> How quickly must the service recover?

Example:

```text
RTO = 1 hour
```

---

## Backup vs Disaster Recovery

| Backup | Disaster Recovery |
|---|---|
| Protects data | Restores service |
| Point-in-time recovery | Business continuity |
| Usually periodic | Often replication/failover |
| Restore data | Recover workload |

---

# 14. Azure Application Services

## App Service

PaaS web application hosting.

---

## App Service Plan

Defines compute resources used by App Service apps.

Important concepts:

- Pricing tier
- Instance count
- Scaling
- OS/platform

---

## Deployment Slots

Useful for:

```text
Production
Staging
Testing
```

Example:

```text
Production
    ↑
Slot Swap
    ↑
Staging
```

---

## Azure API Management — APIM

Managed API gateway and API management platform.

Features include:

- API publishing
- Authentication
- Authorization
- Rate limiting
- Policies
- Developer portal
- Analytics

---

## Azure Functions

Serverless compute platform.

Triggers include:

- HTTP
- Timer
- Queue
- Event Grid
- Service Bus
- Blob events

---

# 15. Containers and Kubernetes

## Azure Container Registry — ACR

Private container image registry.

```text
Docker Build
     ↓
ACR
     ↓
Container Platform
```

---

## Azure Kubernetes Service — AKS

Managed Kubernetes service.

Key concepts:

```text
Cluster
├── Control Plane
└── Node Pools
      ├── Node
      ├── Node
      └── Node
```

---

## Kubernetes Core Concepts

### Pod

Smallest deployable unit.

### Deployment

Manages replicated Pods.

### Service

Provides network access to Pods.

### Ingress

Manages external HTTP/HTTPS routing.

### ConfigMap

Stores non-sensitive configuration.

### Secret

Stores sensitive configuration data.

### Namespace

Logical isolation within a Kubernetes cluster.

---

## AKS Networking

Important concepts:

- Azure CNI
- Kubenet
- Network policies
- Load balancers
- Ingress
- Private clusters

---

# 16. Serverless

## Azure Functions

Event-driven compute.

Example:

```text
HTTP Request
     ↓
Azure Function
     ↓
Database
```

---

## Function Triggers

Common triggers:

```text
HTTP
Timer
Queue
Blob
Event Grid
Service Bus
```

---

## Consumption-Based Architecture

Concept:

```text
Event
 ↓
Function
 ↓
Execute
 ↓
Scale based on workload
```

Benefits:

- Reduced infrastructure management
- Automatic scaling
- Event-driven design
- Consumption-oriented pricing options

---

# 17. Integration and Messaging

## Azure Service Bus

Enterprise messaging service.

Concepts:

```text
Queue
Topic
Subscription
```

---

## Queue

One message is generally processed by one consumer in a competing-consumer model.

```text
Producer
   ↓
Queue
   ↓
Consumer
```

---

## Topic

One message can be delivered to multiple subscriptions.

```text
             ┌── Subscription A
Producer → Topic
             └── Subscription B
```

---

## Azure Event Grid

Event routing service.

Useful for:

```text
Event-driven architectures
Resource events
Blob events
Application events
```

---

## Azure Event Hubs

High-throughput event ingestion platform.

Useful for:

- Telemetry
- Logs
- Streaming
- IoT
- Large-scale event ingestion

---

## Logic Apps

Workflow automation platform.

Useful for integrating:

```text
Azure
SaaS
APIs
Enterprise systems
```

---

# 18. DevOps and CI/CD

## Azure DevOps

Platform containing tools for software delivery.

Major services include:

```text
Azure Repos
Azure Pipelines
Azure Boards
Azure Test Plans
Azure Artifacts
```

---

## Azure Repos

Git repositories.

---

## Azure Pipelines

CI/CD automation.

Concept:

```text
Git Push
   ↓
Build
   ↓
Test
   ↓
Security Scan
   ↓
Artifact
   ↓
Deploy
```

---

## CI

Continuous Integration.

Typical workflow:

```text
Code
 ↓
Build
 ↓
Test
 ↓
Artifact
```

---

## CD

Continuous Delivery / Deployment.

```text
Artifact
   ↓
Dev
   ↓
Stage
   ↓
Production
```

---

## Deployment Strategies

### Blue-Green

```text
Blue  → Current
Green → New
```

Switch traffic after validation.

### Canary

Send a small percentage of traffic to the new version.

```text
95% → Old
5%  → New
```

### Rolling

Gradually replace old instances.

---

## GitHub Actions + Azure

Common architecture:

```text
GitHub
   ↓
GitHub Actions
   ↓
OIDC / Federated Identity
   ↓
Azure
   ↓
Terraform / Application Deployment
```

Prefer short-lived federated authentication such as OIDC where supported instead of storing long-lived Azure client secrets in CI/CD.

---

# 19. Infrastructure as Code

## Terraform

Popular multi-cloud IaC tool.

Example:

```hcl
resource "azurerm_resource_group" "main" {
  name     = "rg-dev"
  location = "Central India"
}
```

---

## Terraform Workflow

```text
terraform init
      ↓
terraform fmt
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply
```

---

## Terraform State

Stores the mapping between configuration and deployed infrastructure.

Common remote-backend considerations:

- State locking
- Encryption
- Access control
- Versioning
- Backup

---

## AzureRM Provider

Terraform provider for Azure resources.

Example:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

> Provider versions evolve. Pin and test the version appropriate for your repository rather than blindly copying an old version constraint.

---

## Bicep

Azure-native infrastructure-as-code language.

Example:

```bicep
resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'mystorageaccount'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
```

---

# 20. Azure Automation

## Azure Automation

Provides automation capabilities for supported Azure and hybrid-management scenarios.

Common concepts:

- Runbooks
- Schedules
- Automation accounts
- Hybrid Runbook Worker

---

## Azure CLI

Command-line tool for Azure.

Example:

```bash
az login
```

```bash
az group create \
  --name rg-dev \
  --location centralindia
```

---

## Azure PowerShell

PowerShell-based Azure management.

Example:

```powershell
Connect-AzAccount
```

```powershell
New-AzResourceGroup `
  -Name rg-dev `
  -Location CentralIndia
```

---

# 21. Cost Management

## Azure Cost Management

Used to:

- Analyze spending
- Create budgets
- Track costs
- Identify cost trends

---

## Azure Pricing

Pricing can depend on:

- Region
- Service
- SKU
- Usage
- Reserved capacity
- Licensing
- Data transfer

---

## Cost Optimization Techniques

### Right-sizing

Use appropriate resource sizes.

### Autoscaling

Scale according to demand.

### Shutdown Scheduling

Stop non-production resources outside working hours.

### Reserved Capacity / Reservations

Commit to eligible usage for potential discounts.

### Savings Plan

Commit to eligible compute spend for potential savings.

### Storage Lifecycle Management

Move older data to lower-cost tiers.

---

## Cost Allocation

Use tags such as:

```text
Environment
Application
Owner
Department
CostCenter
```

---

# 22. High Availability and Scalability

## High Availability

Design systems to remain operational despite failures.

Common techniques:

```text
Availability Zones
Load Balancers
Multiple VM instances
Zone-redundant services
Geo-redundancy
Autoscaling
```

---

## Scalability

### Vertical Scaling

Increase resource size.

```text
Small VM
  ↓
Large VM
```

### Horizontal Scaling

Increase instance count.

```text
VM
 ↓
VM + VM + VM
```

Horizontal scaling is often preferred for distributed/stateless workloads.

---

## Autoscaling

Automatically adjusts capacity based on demand or configured rules.

---

## Stateless Architecture

Application instances don't depend on local instance state.

```text
Load Balancer
      │
 ┌────┼────┐
 VM   VM   VM
      │
 Shared Storage / Database
```

This makes horizontal scaling easier.

---

# 23. Azure Architecture Patterns

## 3-Tier Architecture

```text
             Internet
                │
          Load Balancer
                │
        ┌───────┴───────┐
        │ Presentation   │
        │    Tier        │
        └───────┬───────┘
                │
        ┌───────┴───────┐
        │ Application    │
        │     Tier       │
        └───────┬───────┘
                │
        ┌───────┴───────┐
        │ Data Tier      │
        └───────────────┘
```

---

## Microservices

Application split into independently deployable services.

```text
API Gateway
    │
 ┌──┼──────┬─────┐
 │  │      │     │
Svc1 Svc2 Svc3 Svc4
 │    │      │
 └────┴──────┴───
      Data
```

Azure technologies can include:

- AKS
- Container Apps
- Functions
- API Management
- Service Bus
- Event Grid
- Cosmos DB

---

## Event-Driven Architecture

```text
Producer
   ↓
Event
   ↓
Event Grid / Service Bus
   ↓
Consumer
   ↓
Database
```

---

## Serverless Architecture

```text
Client
  ↓
API Management / HTTP
  ↓
Azure Functions
  ↓
Cosmos DB / Storage
```

---

## Hub-and-Spoke Networking

```text
               Hub VNet
              /        \
             /          \
        Spoke 1        Spoke 2
           │              │
         App            App
```

Hub commonly contains shared services such as:

- Firewall
- VPN Gateway
- ExpressRoute Gateway
- DNS
- Network management components

---

# 24. Azure Well-Architected Framework

Microsoft's Azure Well-Architected Framework uses five core pillars: **Reliability, Security, Cost Optimization, Operational Excellence, and Performance Efficiency**. citeturn0search0turn0search1

## 1. Reliability

Focus on:

- Resilience
- Availability
- Recovery
- Redundancy
- Fault tolerance
- Disaster recovery

---

## 2. Security

Focus on:

- Identity
- Least privilege
- Encryption
- Threat protection
- Network security
- Data protection

---

## 3. Cost Optimization

Focus on:

- Right-sizing
- Eliminating waste
- Budgets
- Autoscaling
- Storage lifecycle
- Pricing optimization

---

## 4. Operational Excellence

Focus on:

- Monitoring
- Automation
- DevOps
- Safe deployments
- Incident management
- Operational processes

---

## 5. Performance Efficiency

Focus on:

- Scaling
- Load testing
- Caching
- Performance monitoring
- Efficient architecture

---

# 25. Important Azure Comparisons

## VNet vs Subnet

| VNet | Subnet |
|---|---|
| Larger network boundary | Network segment inside VNet |
| Contains subnets | Exists inside VNet |
| Defines address space | Uses a portion of address space |

---

## NSG vs Azure Firewall

| NSG | Azure Firewall |
|---|---|
| Distributed network filtering | Centralized managed firewall |
| Subnet/NIC association | Centralized architecture |
| L3/L4-oriented filtering | Advanced network security capabilities |
| Lower-level access control | Enterprise firewall use cases |

---

## Load Balancer vs Application Gateway vs Front Door

| Service | Typical Layer | Scope / Use |
|---|---|---|
| Load Balancer | L4 | Regional TCP/UDP load balancing |
| Application Gateway | L7 | Regional HTTP/HTTPS application routing |
| Front Door | Global HTTP/HTTPS | Global application delivery and routing |

---

## Azure SQL Database vs SQL Managed Instance vs SQL VM

| Service | Management |
|---|---|
| Azure SQL Database | Highest PaaS level |
| SQL Managed Instance | More SQL Server compatibility |
| SQL VM | More IaaS control |

---

## Azure Functions vs App Service

| Functions | App Service |
|---|---|
| Serverless/event-driven | Managed web/app hosting |
| Trigger-based | Web/API/application hosting |
| Great for short event-driven workloads | Great for continuously hosted applications |

---

## Service Bus vs Event Grid vs Event Hubs

| Service | Best for |
|---|---|
| Service Bus | Enterprise messaging |
| Event Grid | Event routing |
| Event Hubs | High-throughput streaming |

---

## Managed Identity vs Service Principal

| Managed Identity | Service Principal |
|---|---|
| Azure-managed identity | Application identity |
| Reduces credential management | Can use credentials/certificates/federation |
| Best for supported Azure-hosted workloads | Common for automation and external CI/CD |
| System/User assigned | App registration/service principal model |

---

## Azure Policy vs RBAC

| Azure Policy | Azure RBAC |
|---|---|
| What configurations/actions are allowed or compliant | Who can perform actions |
| Governance | Authorization |
| Audit/Deny/Modify/etc. | Roles and permissions |

---

# 26. Azure Services Quick Reference

| Area | Important Azure Services |
|---|---|
| Identity | Microsoft Entra ID, Managed Identity |
| Governance | Azure Policy, Management Groups, Resource Locks |
| Compute | VM, VMSS, App Service, Container Apps, Batch |
| Containers | ACR, AKS |
| Serverless | Azure Functions |
| Networking | VNet, NSG, Load Balancer, Application Gateway |
| Global Networking | Front Door, Traffic Manager, Virtual WAN |
| Connectivity | VPN Gateway, ExpressRoute, VNet Peering |
| Private Access | Private Link, Private Endpoint, Private DNS |
| Storage | Blob, Files, Queue, Table |
| Databases | Azure SQL, SQL MI, PostgreSQL, Cosmos DB |
| Cache | Azure Cache for Redis |
| Security | Key Vault, Defender for Cloud, Sentinel, Firewall, WAF |
| Monitoring | Azure Monitor, Log Analytics, Application Insights |
| Messaging | Service Bus, Event Grid, Event Hubs |
| Integration | Logic Apps, API Management |
| DevOps | Azure DevOps, Azure Pipelines, Azure Repos |
| IaC | Terraform, Bicep, ARM |
| Backup | Azure Backup, Site Recovery |
| Cost | Cost Management, Advisor |
| Data Governance | Microsoft Purview |

---

# 27. DevOps Engineer Priority List

If your goal is **Azure Cloud / DevOps Engineering**, prioritize the following.

## ⭐⭐⭐⭐⭐ Must Know

### Azure Fundamentals

- Regions
- Availability Zones
- Subscriptions
- Resource Groups
- Resource Manager
- Tags

### Networking

- VNet
- Subnets
- NSG
- Route tables
- VNet Peering
- Private Endpoint
- Private DNS
- Load Balancer
- Application Gateway
- VPN Gateway
- ExpressRoute

### Identity

- Microsoft Entra ID
- RBAC
- Managed Identity
- Service Principal
- MFA
- Conditional Access
- Least privilege

### Compute

- VM
- VMSS
- App Service
- Functions
- Containers
- AKS

### Storage

- Blob
- Files
- Storage redundancy
- SAS
- Lifecycle management

### Monitoring

- Azure Monitor
- Log Analytics
- KQL
- Application Insights
- Alerts
- Activity Log

### Security

- Key Vault
- Defender for Cloud
- Sentinel
- Azure Firewall
- WAF

### IaC

- Terraform
- Bicep
- ARM
- Terraform state
- Modules
- Remote backend

### CI/CD

- Azure Pipelines
- GitHub Actions
- OIDC/federated authentication
- Deployment strategies
- Artifacts

---

# 28. Recommended Hands-On Projects

## Project 1 — Azure 3-Tier Application

Build:

```text
Internet
   ↓
Application Gateway
   ↓
Web Tier
   ↓
App Tier
   ↓
Azure SQL
```

Learn:

- VNet
- Subnets
- NSG
- Application Gateway
- VMSS
- Azure SQL
- Monitoring

---

## Project 2 — Serverless API

Build:

```text
Client
  ↓
API Management
  ↓
Azure Functions
  ↓
Cosmos DB
```

Learn:

- API Management
- Functions
- Managed Identity
- Cosmos DB
- Key Vault
- Application Insights

---

## Project 3 — Azure Terraform Infrastructure

Provision:

```text
Resource Group
     ↓
VNet
 ┌───┼────┐
Web App App Data
Subnet Subnet Subnet
```

Automate with:

```text
GitHub
   ↓
GitHub Actions
   ↓
Terraform
   ↓
Azure
```

---

## Project 4 — Hub-and-Spoke Network

Build:

```text
                 Hub
            ┌─────┼─────┐
            │ Firewall  │
            │ VPN       │
            └─────┬─────┘
              /       \
          Spoke 1    Spoke 2
```

Learn:

- VNet Peering
- Azure Firewall
- Route Tables
- Private DNS
- VPN Gateway
- Terraform

---

## Project 5 — AKS CI/CD Platform

Build:

```text
Developer
   ↓
GitHub
   ↓
GitHub Actions
   ↓
ACR
   ↓
AKS
   ↓
Application
```

Add:

- Key Vault
- Managed Identity
- Ingress
- Monitoring
- Autoscaling

---

## Project 6 — Azure Cost Optimization

Implement:

```text
Azure Resources
      ↓
Cost Management
      ↓
Budget Alerts
      ↓
Automation
      ↓
Shutdown / Scale / Optimize
```

---

# 29. Useful Azure CLI Commands

## Login

```bash
az login
```

---

## List subscriptions

```bash
az account list --output table
```

---

## Select subscription

```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

---

## Create resource group

```bash
az group create \
  --name rg-dev \
  --location centralindia
```

---

## List resource groups

```bash
az group list --output table
```

---

## List resources

```bash
az resource list --output table
```

---

## List VNets

```bash
az network vnet list --output table
```

---

## List VMs

```bash
az vm list --output table
```

---

## Show VM

```bash
az vm show \
  --resource-group rg-dev \
  --name vm-web
```

---

## Start VM

```bash
az vm start \
  --resource-group rg-dev \
  --name vm-web
```

---

## Stop VM

```bash
az vm stop \
  --resource-group rg-dev \
  --name vm-web
```

---

## Delete resource group

```bash
az group delete \
  --name rg-dev
```

> Use destructive commands carefully, especially in production subscriptions.

---

# 30. Official Microsoft Learn Resources

- [Azure Fundamentals Certification](https://learn.microsoft.com/en-us/credentials/certifications/azure-fundamentals/) — AZ-900 fundamentals and current exam scope. citeturn0search4
- [Azure Cloud Concepts](https://learn.microsoft.com/en-in/training/paths/microsoft-azure-fundamentals-describe-cloud-concepts/) — cloud computing fundamentals. citeturn0search13
- [Azure Architecture and Services](https://learn.microsoft.com/en-us/training/paths/azure-fundamentals-describe-azure-architecture-services/) — Azure architecture and core services. citeturn0search19
- [Azure Identity Architecture](https://learn.microsoft.com/en-in/azure/architecture/identity/identity-start-here) — identity architecture and Microsoft Entra concepts. citeturn0search16
- [Azure Security Fundamentals](https://learn.microsoft.com/en-us/azure/security/fundamentals/) — Azure security concepts and best practices. citeturn0search20
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/) — architecture principles and workload guidance. citeturn0search2
- [Azure Well-Architected Pillars](https://learn.microsoft.com/en-us/azure/well-architected/pillars) — Reliability, Security, Cost Optimization, Operational Excellence, and Performance Efficiency. citeturn0search1
- [Azure Management Groups](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-management-groups) — subscription organization and governance. citeturn0search15

---

# 🎯 Recommended Azure Learning Path

```text
Cloud Fundamentals
        ↓
Azure Architecture
        ↓
Subscriptions / Resource Groups
        ↓
Identity + RBAC
        ↓
Networking
        ↓
Compute
        ↓
Storage
        ↓
Databases
        ↓
Security
        ↓
Monitoring
        ↓
Backup + DR
        ↓
Terraform / Bicep
        ↓
CI/CD
        ↓
Containers + AKS
        ↓
Serverless
        ↓
Well-Architected Architecture
        ↓
Real-World Azure Projects
```

---

# 🧠 Azure Interview Checklist

Before an Azure Cloud/DevOps interview, make sure you can explain:

- [ ] Azure Region vs Availability Zone
- [ ] Subscription vs Resource Group
- [ ] Management Group hierarchy
- [ ] Azure Resource Manager
- [ ] VNet and Subnet
- [ ] NSG vs Azure Firewall
- [ ] Route Table
- [ ] VNet Peering
- [ ] Private Endpoint and Private Link
- [ ] VPN Gateway vs ExpressRoute
- [ ] Load Balancer vs Application Gateway vs Front Door
- [ ] VM vs VMSS
- [ ] App Service vs Functions
- [ ] ACR vs AKS
- [ ] Blob Storage and access tiers
- [ ] LRS vs ZRS vs GRS vs GZRS
- [ ] Azure SQL vs SQL Managed Instance
- [ ] Cosmos DB
- [ ] Entra ID
- [ ] RBAC
- [ ] Managed Identity
- [ ] Service Principal
- [ ] Key Vault
- [ ] Azure Policy
- [ ] Azure Monitor
- [ ] Log Analytics and KQL
- [ ] Application Insights
- [ ] Defender for Cloud
- [ ] Sentinel
- [ ] Azure Backup
- [ ] Site Recovery
- [ ] RPO vs RTO
- [ ] Terraform vs Bicep
- [ ] Azure DevOps
- [ ] GitHub Actions + Azure
- [ ] CI/CD
- [ ] Blue-Green vs Canary vs Rolling deployments
- [ ] Autoscaling
- [ ] Hub-and-Spoke
- [ ] 3-Tier architecture
- [ ] Microservices
- [ ] Event-driven architecture
- [ ] Serverless
- [ ] Well-Architected Framework

---

## ⭐ Final Takeaway

For a Cloud DevOps Engineer, Azure knowledge should not stop at memorizing service names.

Focus on understanding how the services work **together**:

```text
                    GitHub
                       │
                 GitHub Actions
                       │
                  Terraform
                       │
                Azure Resource
                   Manager
                       │
       ┌───────────────┼────────────────┐
       │               │                │
   Entra ID         Networking       Security
       │               │                │
   RBAC / MI       VNet / NSG       Key Vault
                       │             Defender
                       │
                ┌──────┴──────┐
                │             │
             Compute        Storage
                │             │
          VM / VMSS /      Blob / Files
          App Service
          Functions
                │
          ┌─────┴─────┐
          │           │
       Database    Monitoring
          │           │
      SQL/Cosmos   Monitor/KQL
          │
          └─────┬─────┘
                │
             CI/CD
                │
           Production
```

The strongest Azure engineers understand **architecture + networking + identity + security + automation + observability + cost**, rather than learning each Azure service in isolation.
