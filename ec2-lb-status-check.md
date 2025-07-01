## 🖥️ EC2 Status Checks
EC2 instances have two types of status checks to help you monitor their health:

## 1️⃣ System Status Check
What it checks: The underlying hardware and AWS infrastructure.
Examples:
Loss of network connectivity
Hardware issues
Power or software issues on the host machine
If it fails: You may need to stop/start the instance or contact AWS support.

## 2️⃣ Instance Status Check
What it checks: The operating system and software inside your EC2 instance.
Examples:
Failed boot process
OS-level issues (e.g., kernel panic)
Exhausted memory or disk
If it fails: You may need to reboot, fix the OS, or check logs.
🌐 Elastic Load Balancer (ELB) Health Checks
ELBs (Classic, ALB, NLB) use health checks to monitor the status of registered targets (like EC2 instances).

## 🔍 Types of Health Checks
HTTP/HTTPS: ELB sends a request to a specific path (e.g., /health) and expects a 200 OK response.
TCP: ELB checks if it can establish a TCP connection on a specified port.
gRPC (for ALB): Checks gRPC health status.

## 🔄 Health Check States
Healthy: Target responds correctly.
Unhealthy: Target fails health checks repeatedly.
Initial: Target is in the process of being checked.
Draining: Target is being deregistered.

## 🖥️ EC2 Status Checks: 2/2
When you see 2/2 checks passed for an EC2 instance, it means:

✅ Both EC2 health checks have passed:
System Status Check – AWS infrastructure is healthy.
Instance Status Check – The OS inside the instance is healthy.
🔹 If you see 1/2 or 0/2, it means one or both checks have failed, and the instance may not be functioning properly.

## 🌐 ELB Health Checks: 3/3 (or N/N)
For Elastic Load Balancers, the health check status is often shown as X/X, where:

X = Number of consecutive successful health checks required to mark a target as healthy.
For example, 3/3 means the target passed 3 consecutive checks and is now considered healthy.
Example:
If your health check config is:
Healthy threshold = 3
Unhealthy threshold = 2
Then:
3/3 = Healthy
0/3, 1/3, 2/3 = Still checking
0/2 = Unhealthy
