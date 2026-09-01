# 🚀 Azure DevOps — Complete Concepts & Commands Cheat Sheet

> GitHub-ready reference for Cloud Engineers, DevOps Engineers, SREs and Azure Administrators.  
> Covers Azure DevOps from **Basic → Intermediate → Advanced**, with practical examples, YAML, Git, Azure CLI, PowerShell, Terraform, security, Docker, ACR, AKS, Helm, GitOps, monitoring and troubleshooting.

## 📚 Table of Contents

- [1. Azure DevOps Fundamentals](#1-azure-devops-fundamentals)
- [2. Core Terminology](#2-core-terminology)
- [3. Organizations, Projects & Teams](#3-organizations-projects--teams)
- [4. Azure Boards](#4-azure-boards)
- [5. Agile, Scrum & Kanban](#5-agile-scrum--kanban)
- [6. Azure Repos](#6-azure-repos)
- [7. Git Fundamentals](#7-git-fundamentals)
- [8. Branching Strategies](#8-branching-strategies)
- [9. Pull Requests & Branch Policies](#9-pull-requests--branch-policies)
- [10. Azure Pipelines](#10-azure-pipelines)
- [11. CI/CD](#11-cicd)
- [12. YAML Pipelines](#12-yaml-pipelines)
- [13. Triggers](#13-triggers)
- [14. Variables, Parameters & Expressions](#14-variables-parameters--expressions)
- [15. Templates](#15-templates)
- [16. Agents & Agent Pools](#16-agents--agent-pools)
- [17. Artifacts](#17-artifacts)
- [18. Azure Artifacts](#18-azure-artifacts)
- [19. Environments](#19-environments)
- [20. Approvals & Checks](#20-approvals--checks)
- [21. Deployment Strategies](#21-deployment-strategies)
- [22. Service Connections](#22-service-connections)
- [23. Identity, RBAC & Permissions](#23-identity-rbac--permissions)
- [24. Secrets Management](#24-secrets-management)
- [25. Azure Key Vault](#25-azure-key-vault)
- [26. Infrastructure as Code](#26-infrastructure-as-code)
- [27. Terraform + Azure DevOps](#27-terraform--azure-devops)
- [28. Bicep & ARM](#28-bicep--arm)
- [29. Azure CLI & PowerShell](#29-azure-cli--powershell)
- [30. Docker & Container CI/CD](#30-docker--container-cicd)
- [31. Azure Container Registry](#31-azure-container-registry)
- [32. Kubernetes & AKS](#32-kubernetes--aks)
- [33. Helm](#33-helm)
- [34. GitOps](#34-gitops)
- [35. DevSecOps](#35-devsecops)
- [36. Testing](#36-testing)
- [37. Monitoring & Observability](#37-monitoring--observability)
- [38. Networking](#38-networking)
- [39. Multi-Environment Architecture](#39-multi-environment-architecture)
- [40. Advanced Pipeline Concepts](#40-advanced-pipeline-concepts)
- [41. Reliability & Performance](#41-reliability--performance)
- [42. Troubleshooting](#42-troubleshooting)
- [43. Useful Commands](#43-useful-commands)
- [44. Production CI/CD Architecture](#44-production-cicd-architecture)
- [45. Interview Checklist](#45-interview-checklist)
- [46. Learning Roadmap](#46-learning-roadmap)

---

# 1. Azure DevOps Fundamentals

Azure DevOps is Microsoft's platform for planning, source control, CI/CD, testing and package management.

```text
PLAN → CODE → BUILD → TEST → PACKAGE → DEPLOY → MONITOR → FEEDBACK
```

Core services:

| Service | Purpose |
|---|---|
| Azure Boards | Work tracking |
| Azure Repos | Git/TFVC source control |
| Azure Pipelines | CI/CD |
| Azure Test Plans | Testing |
| Azure Artifacts | Package management |

---

# 2. Core Terminology

| Term | Meaning |
|---|---|
| Organization | Top-level Azure DevOps boundary |
| Project | Container for DevOps resources |
| Team | Group working on project work |
| Repository | Source-code repository |
| Work Item | Trackable unit of work |
| Pipeline | Automated workflow |
| Stage | Major pipeline phase |
| Job | Collection of steps executed by an agent |
| Step | Individual operation |
| Task | Reusable pipeline action |
| Agent | Machine executing pipeline work |
| Agent Pool | Collection of agents |
| Artifact | Build/package output |
| Environment | Deployment target/context |
| Service Connection | Authenticated external-service connection |
| Variable | Configuration/runtime value |
| Parameter | Pipeline/template input |
| Template | Reusable YAML |
| Approval | Manual authorization |
| Check | Deployment condition |
| Feed | Package repository |
| PR | Pull Request |

---

# 3. Organizations, Projects & Teams

```text
Azure DevOps Organization
├── Project A
│   ├── Boards
│   ├── Repos
│   ├── Pipelines
│   ├── Test Plans
│   └── Artifacts
└── Project B
```

**Organization:** users, projects, policies and billing boundary.

**Project:** logical workspace containing boards, repos, pipelines, tests and artifacts.

**Team:** group with its own work/backlog views.

---

# 4. Azure Boards

Common work items:

```text
Epic
  ↓
Feature
  ↓
User Story
  ↓
Task
```

Common types:

- Epic
- Feature
- User Story
- Task
- Bug
- Issue

### User Story

```text
As a <user>
I want <capability>
So that <business value>
```

### Acceptance Criteria

Defines what must be true for the story to be considered complete.

### Backlog

Prioritized work waiting to be implemented.

### Sprint

Time-boxed iteration.

### Queries

Filter work items, for example:

```text
State = Active
Assigned To = Me
Work Item Type = Bug
Priority = 1
```

### Dashboards

Can display sprint progress, queries, build status and delivery metrics.

---

# 5. Agile, Scrum & Kanban

## Scrum

```text
Product Backlog
      ↓
Sprint Planning
      ↓
Sprint
      ↓
Daily Scrum
      ↓
Review
      ↓
Retrospective
```

## Kanban

```text
To Do → Doing → Review → Done
```

Important terms:

- WIP — Work In Progress
- Velocity
- Burndown
- Sprint
- Backlog
- Definition of Done
- Acceptance Criteria

---

# 6. Azure Repos

Azure Repos provides source control.

```text
Git
TFVC
```

Modern DevOps projects generally use Git.

Repository concepts:

```text
Repository
├── Branches
├── Commits
├── Tags
├── Pull Requests
└── History
```

---

# 7. Git Fundamentals

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

git clone <repo-url>
git status

git switch -c feature/login
git add .
git commit -m "Add login feature"
git push -u origin feature/login

git fetch --all
git pull
git log --oneline --graph --all
```

### Merge

```bash
git switch main
git merge feature/login
```

### Rebase

```bash
git switch feature/login
git rebase main
```

### Stash

```bash
git stash
git stash list
git stash pop
```

### Revert

```bash
git revert <commit>
```

### Reset

```bash
git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1
```

> Use `reset --hard` carefully because it can discard local changes.

### Tag

```bash
git tag v1.0.0
git push origin v1.0.0
```

---

# 8. Branching Strategies

## Feature Branching

```text
main
├── feature/login
├── feature/payment
└── feature/profile
```

## GitFlow

```text
main
develop
feature/*
release/*
hotfix/*
```

## Trunk-Based Development

```text
main
├── short-lived branch
├── short-lived branch
└── short-lived branch
```

For many modern CI/CD teams, short-lived branches and frequent integration reduce merge complexity.

---

# 9. Pull Requests & Branch Policies

Typical flow:

```text
Feature Branch
      ↓
Pull Request
      ↓
Build Validation
      ↓
Code Review
      ↓
Branch Policies
      ↓
Merge
```

Branch policies can require:

- Minimum reviewers
- Build validation
- Linked work items
- Comment resolution
- Required status checks
- Approved merge strategy

Best practices:

- Keep PRs small.
- Link work items.
- Require CI validation.
- Never commit secrets.
- Protect production branches.

---

# 10. Azure Pipelines

Azure Pipelines automates:

```text
Build
Test
Package
Deploy
```

Pipeline styles:

```text
YAML
Classic
```

For modern projects, YAML is usually preferred because pipeline definitions live with the source code.

---

# 11. CI/CD

## Continuous Integration

```text
Commit
 ↓
Build
 ↓
Unit Test
 ↓
Package
```

## Continuous Delivery

Validated changes are continuously kept ready for controlled deployment.

## Continuous Deployment

Validated changes automatically reach production.

```text
Commit → Build → Test → Deploy
```

---

# 12. YAML Pipelines

Basic:

```yaml
trigger:
  - main

pool:
  vmImage: ubuntu-latest

steps:
  - script: echo "Hello Azure DevOps"
    displayName: "Hello"
```

## Stages

```yaml
stages:
  - stage: Build
    jobs:
      - job: BuildJob
        steps:
          - script: echo "Building"

  - stage: Deploy
    dependsOn: Build
    jobs:
      - job: DeployJob
        steps:
          - script: echo "Deploying"
```

## Jobs

```yaml
jobs:
  - job: Build
    steps:
      - script: echo "Build"
```

## Tasks

```yaml
steps:
  - task: Bash@3
    inputs:
      targetType: inline
      script: |
        echo "Hello"
```

---

# 13. Triggers

## CI

```yaml
trigger:
  branches:
    include:
      - main
      - develop
```

## PR

```yaml
pr:
  branches:
    include:
      - main
```

## Disable CI

```yaml
trigger: none
```

## Scheduled

```yaml
schedules:
  - cron: "0 0 * * *"
    displayName: Nightly
    branches:
      include:
        - main
    always: true
```

Azure Pipelines schedule cron expressions are evaluated in UTC.

---

# 14. Variables, Parameters & Expressions

## Variables

```yaml
variables:
  environment: dev
  region: eastus
```

Use:

```yaml
steps:
  - script: echo "$(environment)"
```

## Parameters

Parameters are evaluated during template expansion.

```yaml
parameters:
  - name: environment
    type: string
    default: dev
```

Use:

```yaml
${{ parameters.environment }}
```

## Expressions

```text
${{ }}   Template/compile-time
$[ ]     Runtime expression
$( )     Macro variable expansion
```

## Conditions

```yaml
condition: succeeded()
```

```yaml
condition: failed()
```

```yaml
condition: always()
```

Branch example:

```yaml
condition: and(
  succeeded(),
  eq(variables['Build.SourceBranch'], 'refs/heads/main')
)
```

## Common predefined variables

```text
$(Build.BuildId)
$(Build.BuildNumber)
$(Build.SourceBranch)
$(Build.SourceVersion)
$(Build.Repository.Name)
$(Build.ArtifactStagingDirectory)
$(System.TeamProject)
$(Agent.OS)
```

---

# 15. Templates

Recommended structure:

```text
azure-pipelines.yml
templates/
├── build.yml
├── test.yml
└── deploy.yml
```

Example:

```yaml
# templates/build.yml

parameters:
  - name: configuration
    type: string
    default: Release

steps:
  - script: echo "Configuration: ${{ parameters.configuration }}"
```

Use:

```yaml
steps:
  - template: templates/build.yml
    parameters:
      configuration: Release
```

Benefits:

- Reusability
- Standardization
- DRY pipelines
- Easier maintenance

---

# 16. Agents & Agent Pools

## Microsoft-hosted

```yaml
pool:
  vmImage: ubuntu-latest
```

Common images:

```text
ubuntu-latest
windows-latest
macos-latest
```

## Self-hosted

You manage:

```text
OS
Network
Software
Security
Updates
Capacity
```

Useful when pipelines need access to private networks or custom tooling.

## Agent Pool

```text
Agent Pool
├── Agent 1
├── Agent 2
└── Agent 3
```

---

# 17. Artifacts

Pipeline artifacts transfer build outputs between stages/jobs.

Publish:

```yaml
- task: PublishPipelineArtifact@1
  inputs:
    targetPath: '$(Build.ArtifactStagingDirectory)'
    artifact: 'drop'
```

Download:

```yaml
- task: DownloadPipelineArtifact@2
  inputs:
    artifact: drop
```

Recommended delivery principle:

```text
Build Once
   ↓
Immutable Artifact
   ↓
Deploy Same Artifact
   ↓
Promote
```

---

# 18. Azure Artifacts

Azure Artifacts provides package feeds.

Common ecosystems:

```text
NuGet
npm
Maven
Python
Universal Packages
```

Architecture:

```text
Project
  ↓
Feed
  ↓
Package
  ↓
Version
```

Typical flow:

```text
Build → Package → Publish Feed → Consume Package
```

---

# 19. Environments

Typical environments:

```text
dev
qa
staging
production
```

Deployment:

```text
Build
 ↓
Dev
 ↓
QA
 ↓
Staging
 ↓
Production
```

Environments provide deployment history, resource tracking and controls such as approvals/checks.

---

# 20. Approvals & Checks

Used to protect deployments.

Common controls:

- Manual approvals
- Branch control
- Business hours
- REST/API checks
- Azure Function checks
- Required templates
- Exclusive locks
- Artifact checks

Example:

```text
Build
 ↓
Test
 ↓
Production Environment
 ↓
Approval
 ↓
Deploy
```

---

# 21. Deployment Strategies

## Rolling

```text
Old Old Old
 ↓
New Old Old
 ↓
New New Old
 ↓
New New New
```

## Blue/Green

```text
Blue  = Current
Green = New

Traffic → Blue

Validate Green

Traffic → Green
```

Rollback:

```text
Traffic → Blue
```

## Canary

```text
1% → 10% → 25% → 50% → 100%
```

## Recreate

```text
Stop old
 ↓
Deploy new
```

Can cause downtime.

---

# 22. Service Connections

Service connections authenticate pipelines to external resources.

Examples:

```text
Azure Resource Manager
Docker Registry
Kubernetes
GitHub
```

Preferred modern Azure authentication where supported:

```text
Azure DevOps
   ↓
Workload Identity Federation / OIDC
   ↓
Microsoft Entra ID
   ↓
Azure Resource
```

Avoid unnecessary long-lived client secrets.

---

# 23. Identity, RBAC & Permissions

## Authentication

```text
Who are you?
```

## Authorization

```text
What are you allowed to do?
```

## Azure RBAC

Common roles:

```text
Reader
Contributor
Owner
```

Follow least privilege.

Azure DevOps permissions apply to resources such as:

- Projects
- Repositories
- Branches
- Pipelines
- Environments
- Service connections
- Variable groups
- Artifacts

---

# 24. Secrets Management

Never hardcode:

```text
Passwords
API Keys
Tokens
Private Keys
Connection Strings
Client Secrets
```

Bad:

```yaml
password: "MyPassword123!"
```

Better:

```text
Pipeline
 ↓
Key Vault / secure variable
 ↓
Application
```

Preferred options:

- Azure Key Vault
- Secret variables
- Variable groups
- Managed identities
- Workload identity federation

---

# 25. Azure Key Vault

Stores:

```text
Secrets
Keys
Certificates
```

Typical integration:

```text
Azure DevOps
      ↓
Identity / Service Connection
      ↓
Key Vault
      ↓
Secret
```

Best practices:

- Least privilege
- Secret rotation
- Logging
- Monitoring
- Managed identity where appropriate
- Production separation

---

# 26. Infrastructure as Code

IaC defines infrastructure using version-controlled code.

Benefits:

```text
Repeatability
Consistency
Automation
Auditability
Version Control
```

Common Azure IaC:

```text
Terraform
Bicep
ARM Templates
Azure CLI
PowerShell
```

---

# 27. Terraform + Azure DevOps

Recommended repository:

```text
terraform/
├── modules/
│   ├── vnet/
│   ├── vm/
│   └── storage/
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
└── azure-pipelines.yml
```

Pipeline:

```text
Git Push
 ↓
terraform fmt
 ↓
terraform init
 ↓
terraform validate
 ↓
terraform plan
 ↓
Approval
 ↓
terraform apply
```

Example:

```yaml
steps:
  - script: terraform fmt -check
    displayName: Terraform Format

  - script: terraform init
    displayName: Terraform Init

  - script: terraform validate
    displayName: Terraform Validate

  - script: terraform plan
    displayName: Terraform Plan
```

Production principle:

```text
Plan → Review → Apply
```

---

# 28. Bicep & ARM

## ARM

JSON-based Azure Resource Manager templates.

## Bicep

Azure-native declarative IaC language.

Example:

```bicep
param location string = resourceGroup().location

resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'examplestorage12345'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
```

Deployment workflow:

```text
Validate
 ↓
What-if
 ↓
Approval
 ↓
Deploy
```

---

# 29. Azure CLI & PowerShell

## Azure CLI

```bash
az login
az account show
az account list
az account set --subscription "<subscription>"
```

Resource groups:

```bash
az group list
az group create --name rg-dev --location eastus
```

Resources:

```bash
az resource list
az resource show --ids <resource-id>
```

VM:

```bash
az vm list -o table
az vm start --resource-group rg-dev --name vm01
az vm stop --resource-group rg-dev --name vm01
```

AKS:

```bash
az aks list -o table
az aks get-credentials   --resource-group rg-aks   --name aks-prod
```

## PowerShell

```powershell
Connect-AzAccount
Get-AzContext
Set-AzContext -Subscription "<subscription>"
Get-AzResourceGroup
Get-AzResource
Get-AzVM
Get-AzKeyVault
```

---

# 30. Docker & Container CI/CD

Workflow:

```text
Git
 ↓
Build
 ↓
Test
 ↓
Docker Build
 ↓
Security Scan
 ↓
Push Image
 ↓
Deploy
```

Dockerfile:

```dockerfile
FROM nginx:alpine

COPY ./app /usr/share/nginx/html

EXPOSE 80
```

Commands:

```bash
docker build -t myapp:1.0 .
docker run -d -p 8080:80 myapp:1.0

docker tag myapp:1.0 myregistry.azurecr.io/myapp:1.0
docker push myregistry.azurecr.io/myapp:1.0
```

---

# 31. Azure Container Registry

ACR stores container images.

```text
Azure DevOps
      ↓
Docker Build
      ↓
Security Scan
      ↓
ACR
      ↓
AKS / App Service / Container Apps
```

Commands:

```bash
az acr login --name myregistry

az acr repository list   --name myregistry

az acr repository show-tags   --name myregistry   --repository myapp
```

Best practices:

- Version images.
- Avoid relying only on `latest`.
- Scan images.
- Use least privilege.
- Configure retention/cleanup.

---

# 32. Kubernetes & AKS

CI/CD:

```text
Git
 ↓
Build
 ↓
Test
 ↓
Docker Image
 ↓
ACR
 ↓
AKS
```

Important objects:

```text
Pod
Deployment
ReplicaSet
Service
Ingress
ConfigMap
Secret
Namespace
DaemonSet
StatefulSet
Job
CronJob
HPA
NetworkPolicy
```

Commands:

```bash
kubectl get nodes
kubectl get pods
kubectl get pods -A
kubectl get svc
kubectl get deployments

kubectl describe pod <pod>
kubectl logs <pod>
kubectl logs -f <pod>

kubectl exec -it <pod> -- /bin/sh

kubectl apply -f deployment.yaml
kubectl delete -f deployment.yaml

kubectl get events --sort-by=.lastTimestamp
```

AKS credentials:

```bash
az aks get-credentials   --resource-group rg-aks   --name aks-prod
```

---

# 33. Helm

Typical chart:

```text
mychart/
├── Chart.yaml
├── values.yaml
└── templates/
```

Commands:

```bash
helm install myapp ./mychart
helm upgrade myapp ./mychart
helm rollback myapp 1
helm list
helm uninstall myapp
```

Example values:

```yaml
image:
  repository: myregistry.azurecr.io/myapp
  tag: "1.0.0"

replicaCount: 3
```

---

# 34. GitOps

Git becomes the desired-state source of truth.

```text
Developer
 ↓
Git
 ↓
GitOps Controller
 ↓
Kubernetes
```

Common tools:

```text
Flux
Argo CD
```

Core model:

```text
Git = Desired State
Cluster = Actual State
Controller = Reconciliation
```

---

# 35. DevSecOps

Security throughout SDLC:

```text
Plan
 ↓
Code Security
 ↓
Build
 ↓
Dependency Scan
 ↓
Container Scan
 ↓
IaC Scan
 ↓
Deploy
 ↓
Runtime Monitoring
```

Important terms:

| Term | Purpose |
|---|---|
| SAST | Static source-code analysis |
| DAST | Dynamic application testing |
| SCA | Dependency/security analysis |
| IaC Scan | Infrastructure security analysis |
| Container Scan | Image vulnerability analysis |
| Secret Scan | Detect exposed credentials |
| SBOM | Software Bill of Materials |
| Supply Chain Security | Protect dependencies/build artifacts |

---

# 36. Testing

Testing pyramid:

```text
        UI
       /     Integration
     /          Unit Tests
```

Types:

- Unit
- Integration
- API
- UI
- Smoke
- Regression
- Performance
- Security
- Acceptance

Azure Test Plans provides test plans, suites, test cases, manual testing and exploratory testing.

---

# 37. Monitoring & Observability

Three pillars:

```text
Logs
Metrics
Traces
```

## Azure Monitor

Platform monitoring.

## Log Analytics

KQL-based log analysis.

Example:

```kusto
AzureActivity
| where TimeGenerated > ago(1h)
| summarize count() by OperationNameValue
```

## Application Insights

Application telemetry:

```text
Requests
Dependencies
Exceptions
Availability
Performance
Distributed Tracing
```

## SLI / SLO / SLA

```text
SLI = Measurement
SLO = Target
SLA = Contract
```

Example:

```text
SLI → availability
SLO → 99.9%
SLA → contractual commitment
```

---

# 38. Networking

Important networking concepts for Azure DevOps:

```text
VNet
Subnet
NSG
Azure Firewall
Private Endpoint
Private DNS
VPN
ExpressRoute
Proxy
DNS
Routing
NAT
Load Balancer
Application Gateway
```

Private-resource architecture:

```text
Azure DevOps
      ↓
Self-hosted Agent
      ↓
VNet
 ┌────┼──────────┐
 ↓    ↓          ↓
AKS  Key Vault   ACR
```

Self-hosted agent considerations:

- DNS
- Routing
- NSGs
- Firewall
- Proxy
- Outbound connectivity
- Private endpoints
- Patch management
- Scaling

---

# 39. Multi-Environment Architecture

Recommended:

```text
                    ┌── Dev
                    │
Git → Build → Test ─┼── QA
                    │
                    ├── Staging
                    │
                    └── Production
```

Example:

```yaml
stages:

- stage: Build
  jobs:
  - job: Build
    steps:
    - script: echo "Build"

- stage: Dev
  dependsOn: Build
  jobs:
  - job: Deploy
    steps:
    - script: echo "Deploy Dev"

- stage: Production
  dependsOn: Dev
  condition: succeeded()
  jobs:
  - deployment: DeployProd
    environment: production
    strategy:
      runOnce:
        deploy:
          steps:
          - script: echo "Deploy Production"
```

---

# 40. Advanced Pipeline Concepts

## Matrix

```yaml
strategy:
  matrix:
    linux:
      imageName: ubuntu-latest
    windows:
      imageName: windows-latest
```

## Deployment Job

```yaml
jobs:
- deployment: Deploy
  environment: production
  strategy:
    runOnce:
      deploy:
        steps:
        - script: echo "Deploy"
```

## Output Variables

Used to pass values between jobs/stages with the appropriate output-variable syntax and scope.

## Pipeline Resources

Allow pipelines to consume or trigger from other pipeline/resource definitions.

## Multi-Repository Checkout

```yaml
resources:
  repositories:
  - repository: templates
    type: git
    name: Shared/pipeline-templates
```

## Conditions

```yaml
condition: succeeded()
```

```yaml
condition: and(
  succeeded(),
  eq(variables['Build.SourceBranch'], 'refs/heads/main')
)
```

---

# 41. Reliability & Performance

Pipeline optimization:

```text
Caching
Parallel Jobs
Incremental Builds
Artifact Reuse
Dependency Caching
Efficient Docker Layers
```

Example cache:

```yaml
- task: Cache@2
  inputs:
    key: 'npm | "$(Agent.OS)" | package-lock.json'
    restoreKeys: |
      npm | "$(Agent.OS)"
    path: $(Pipeline.Workspace)/.npm
```

Reliability patterns:

```text
Timeouts
Retries
Health Checks
Rollback
Canary
Blue/Green
Monitoring
Alerts
```

Retries should be bounded and use appropriate backoff; do not blindly retry non-idempotent operations.

---

# 42. Troubleshooting

## Pipeline does not start

Check:

```text
YAML
Trigger
Agent Pool
Agent Availability
Permissions
Pipeline Authorization
```

## Authentication failure

Check:

```text
Service Connection
Tenant
Subscription
Identity
RBAC
Federated Credential
```

## Terraform failure

```bash
terraform fmt -check
terraform init
terraform validate
terraform plan
```

Check:

```text
Backend
Provider
Credentials
State
Locking
Permissions
Variables
```

## Docker push failure

Check:

```text
ACR Login
RBAC
Repository
Image Tag
Registry URL
Network
```

## AKS deployment failure

```bash
kubectl get nodes
kubectl get pods -A
kubectl describe pod <pod>
kubectl logs <pod>
kubectl get events --sort-by=.lastTimestamp
```

## Secret unavailable

Check:

```text
Variable Group Authorization
Key Vault Access
Identity
Service Connection
Secret Name
Variable Scope
```

## Dev works, Prod fails

Compare:

```text
Variables
Secrets
RBAC
Network
DNS
Configuration
Service Connections
Environment Checks
Infrastructure
```

---

# 43. Useful Commands

## Git

```bash
git status
git branch -a
git log --oneline --graph --all
git fetch --all --prune
git diff
git diff --staged
git remote -v
git show <commit>
git blame <file>
```

## Azure CLI

```bash
az version
az account show
az account list
az group list
az resource list
az resource show --ids <resource-id>
```

Bicep what-if:

```bash
az deployment group what-if   --resource-group rg-dev   --template-file main.bicep
```

## Azure DevOps CLI

Install extension:

```bash
az extension add --name azure-devops
```

Configure:

```bash
az devops configure   --defaults   organization=https://dev.azure.com/ORG   project=PROJECT
```

Examples:

```bash
az repos list
az pipelines list
az pipelines run --name "My Pipeline"
```

## PowerShell

```powershell
Get-AzContext
Get-AzResourceGroup
Get-AzResource
Get-AzVM
Get-AzStorageAccount
Get-AzKeyVault
```

---

# 44. Production CI/CD Architecture

```text
                         Azure Boards
                              │
                              ▼
Developer → PR → Azure Repos → CI Pipeline
                              │
              ┌───────────────┼───────────────┐
              ▼               ▼               ▼
          Unit Tests        SAST/SCA       IaC Scan
              │               │               │
              └───────────────┼───────────────┘
                              ▼
                         Build Artifact
                              │
                              ▼
                        Docker Build
                              │
                              ▼
                             ACR
                              │
                              ▼
                         Dev Deploy
                              │
                         Automated Tests
                              │
                              ▼
                       Staging Deploy
                              │
                       Approval / Checks
                              │
                              ▼
                      Canary Production
                              │
                              ▼
                 Azure Monitor / App Insights
                              │
                              ▼
                           Feedback
```

---

# 45. Interview Checklist

## ⭐ Beginner

- [ ] What is Azure DevOps?
- [ ] Organization vs Project
- [ ] Boards
- [ ] Repos
- [ ] Pipelines
- [ ] Artifacts
- [ ] Test Plans
- [ ] Git
- [ ] Branch
- [ ] Commit
- [ ] Pull Request
- [ ] CI/CD

## ⭐ Intermediate

- [ ] YAML
- [ ] Stages
- [ ] Jobs
- [ ] Steps
- [ ] Tasks
- [ ] Variables
- [ ] Variable Groups
- [ ] Parameters
- [ ] Templates
- [ ] Expressions
- [ ] Conditions
- [ ] Agent Pools
- [ ] Self-hosted Agents
- [ ] Service Connections
- [ ] Environments
- [ ] Approvals
- [ ] Checks
- [ ] Artifacts
- [ ] Terraform
- [ ] Key Vault
- [ ] Docker
- [ ] ACR

## ⭐ Advanced

- [ ] Multi-stage pipelines
- [ ] Multi-environment deployment
- [ ] Reusable templates
- [ ] Workload Identity Federation
- [ ] Managed Identity
- [ ] RBAC
- [ ] Private Endpoints
- [ ] Self-hosted agents in private networks
- [ ] AKS
- [ ] Helm
- [ ] GitOps
- [ ] Canary
- [ ] Blue/Green
- [ ] DevSecOps
- [ ] SAST
- [ ] DAST
- [ ] SCA
- [ ] IaC scanning
- [ ] Container scanning
- [ ] Secret scanning
- [ ] SBOM
- [ ] Azure Monitor
- [ ] Application Insights
- [ ] KQL
- [ ] Pipeline caching
- [ ] Artifact promotion
- [ ] Rollback
- [ ] Supply-chain security

---

# 46. Learning Roadmap

```text
Azure Fundamentals
        ↓
Azure DevOps Fundamentals
        ↓
Git + Azure Repos
        ↓
Azure Boards
        ↓
Azure Pipelines
        ↓
YAML
        ↓
CI/CD
        ↓
Variables + Parameters
        ↓
Templates
        ↓
Agents + Pools
        ↓
Artifacts
        ↓
Service Connections
        ↓
Identity + Key Vault
        ↓
Azure CLI + PowerShell
        ↓
Terraform
        ↓
Docker + ACR
        ↓
AKS + Kubernetes
        ↓
Helm
        ↓
DevSecOps
        ↓
Monitoring
        ↓
GitOps
        ↓
Production CI/CD
```

---

# 🏆 Hands-On Projects

## Project 1 — Basic CI

```text
Azure Repos
 ↓
Pipeline
 ↓
Build
 ↓
Unit Test
 ↓
Artifact
```

## Project 2 — Multi-Environment CI/CD

```text
Git
 ↓
Build
 ↓
Dev
 ↓
QA
 ↓
Staging
 ↓
Production
```

Add:

```text
Variables
Templates
Environments
Approvals
Checks
Canary
```

## Project 3 — Terraform + Azure DevOps

```text
Git
 ↓
Terraform Validate
 ↓
Terraform Plan
 ↓
Approval
 ↓
Terraform Apply
 ↓
Azure Infrastructure
```

Include:

```text
VNet
Subnet
NSG
VM/App Service
Storage
Key Vault
```

## Project 4 — Docker + ACR + AKS

```text
Git
 ↓
Pipeline
 ↓
Docker Build
 ↓
Security Scan
 ↓
ACR
 ↓
AKS
 ↓
Monitoring
```

## Project 5 — Production DevSecOps

```text
PR
 ↓
Branch Policies
 ↓
CI
 ├── Unit Test
 ├── SAST
 ├── SCA
 ├── Secret Scan
 └── IaC Scan
 ↓
Artifact
 ↓
Dev
 ↓
Automated Tests
 ↓
Staging
 ↓
Approval
 ↓
Canary Production
 ↓
Monitoring
 ↓
Full Production
```

---

# 🔥 Azure DevOps Golden Rules

```text
1. Everything as Code
2. Build Once, Deploy Many
3. Keep pipeline definitions in Git
4. Use reusable templates
5. Protect production branches
6. Follow least privilege
7. Prefer federated identity over long-lived secrets
8. Never hardcode credentials
9. Use Key Vault for secrets
10. Scan code, dependencies, IaC and containers
11. Separate environments
12. Protect production with approvals/checks
13. Make deployments observable
14. Have a rollback strategy
15. Automate testing
16. Keep artifacts versioned and reproducible
17. Prefer short-lived branches
18. Treat infrastructure as code
19. Monitor pipelines and applications
20. Design for failure and recovery
```

---

# 📌 Final Mental Model

```text
                    AZURE DEVOPS
                         │
       ┌─────────────────┼─────────────────┐
       │                 │                 │
      PLAN              CODE             DELIVER
       │                 │                 │
    Boards             Repos           Pipelines
                                           │
                              ┌────────────┼────────────┐
                              │            │            │
                            Build         Test        Deploy
                              │            │            │
                              └────────────┼────────────┘
                                           │
                                       Artifacts
                                           │
                              ┌────────────┼────────────┐
                              │            │            │
                             Dev         Staging       Prod
                                           │
                                    Approvals/Checks
                                           │
                                        Monitor
                                           │
                                        Feedback
```

> **Core principle:** A strong Azure DevOps engineer understands the complete delivery lifecycle — **Plan → Code → Build → Test → Secure → Package → Deploy → Observe → Improve**.
