# Networking & Subnetting Questions and Answers

A practical question-and-answer guide covering networking fundamentals, IPv4, CIDR, subnetting, VLSM, routing, DNS, DHCP, NAT, security, troubleshooting, and AWS networking.

---

## Table of Contents

1. [Networking Fundamentals](#1-networking-fundamentals)
2. [OSI and TCP/IP Models](#2-osi-and-tcpip-models)
3. [IPv4 Addressing](#3-ipv4-addressing)
4. [Binary](#4-binary)
5. [Private and Special IPv4 Addresses](#5-private-and-special-ipv4-addresses)
6. [Subnet Masks](#6-subnet-masks)
7. [CIDR](#7-cidr)
8. [Subnetting](#8-subnetting)
9. [Network, Broadcast, and Host Range](#9-network-broadcast-and-host-range)
10. [VLSM](#10-vlsm)
11. [Supernetting and Route Summarization](#11-supernetting-and-route-summarization)
12. [Routing](#12-routing)
13. [ARP](#13-arp)
14. [TCP vs UDP](#14-tcp-vs-udp)
15. [Common Ports](#15-common-ports)
16. [DNS](#16-dns)
17. [DHCP](#17-dhcp)
18. [NAT](#18-nat)
19. [Switching and VLANs](#19-switching-and-vlans)
20. [STP](#20-stp)
21. [IPv6](#21-ipv6)
22. [Routing Protocols](#22-routing-protocols)
23. [VPN](#23-vpn)
24. [Network Security](#24-network-security)
25. [Network Troubleshooting](#25-network-troubleshooting)
26. [AWS Networking](#26-aws-networking)
27. [Azure Networking](#27-azure-networking)
28. [Advanced AWS Networking](#28-advanced-aws-networking)
28. [Practice Questions](#28-practice-questions)
29. [Quick Reference](#29-quick-reference)

---

# 1. Networking Fundamentals

## Q1. What is a network?

**Answer:**  
A network is a group of interconnected devices that communicate and exchange data using agreed-upon protocols.

## Q2. What is the difference between LAN and WAN?

**Answer:**

- **LAN (Local Area Network):** Covers a relatively small area such as an office, home, or campus.
- **WAN (Wide Area Network):** Connects networks across larger geographic areas.

## Q3. What is a MAC address?

**Answer:**  
A MAC address is a Layer 2 hardware/network-interface address used for communication on a local network.

## Q4. What is an IP address?

**Answer:**  
An IP address is a logical Layer 3 address used to identify and communicate with devices across IP networks.

### Easy way to remember

```text
MAC = Who is the device?
IP  = Where is the device?
```

## Q5. What is bandwidth?

**Answer:**  
Bandwidth is the maximum amount of data a network link can theoretically carry over a given period.

## Q6. What is throughput?

**Answer:**  
Throughput is the actual amount of data successfully transferred over the network.

## Q7. What is latency?

**Answer:**  
Latency is the time it takes for data to travel from one point to another.

## Q8. What is jitter?

**Answer:**  
Jitter is the variation in packet arrival times.

## Q9. What is a packet?

**Answer:**  
A packet is a unit of data associated primarily with Layer 3/network-layer communication.

## Q10. What is a frame?

**Answer:**  
A frame is a Layer 2 data unit used for communication over a local network.

---

# 2. OSI and TCP/IP Models

## Q11. What are the seven OSI layers?

**Answer:**

| Layer | Name | Examples |
|---:|---|---|
| 7 | Application | HTTP, DNS, FTP |
| 6 | Presentation | Encoding, encryption |
| 5 | Session | Session management |
| 4 | Transport | TCP, UDP |
| 3 | Network | IP, routing |
| 2 | Data Link | Ethernet, MAC |
| 1 | Physical | Cable, fiber |

## Q12. At which OSI layer does a router primarily operate?

**Answer:**  
Layer 3 — Network layer.

## Q13. At which OSI layer does a traditional Ethernet switch primarily operate?

**Answer:**  
Layer 2 — Data Link layer.

## Q14. What are the TCP/IP model layers?

**Answer:**

```text
Application
Transport
Internet
Network Access
```

A common mapping is:

```text
OSI                         TCP/IP

Application ─┐
Presentation ├──────────── Application
Session ─────┘

Transport ──────────────── Transport

Network ────────────────── Internet

Data Link ─┐
Physical ──┴────────────── Network Access
```

---

# 3. IPv4 Addressing

## Q15. How many bits are in an IPv4 address?

**Answer:**  
32 bits.

An IPv4 address contains four 8-bit octets:

```text
192.168.10.25

192       168       10        25
8 bits    8 bits    8 bits    8 bits
```

Therefore:

```text
8 × 4 = 32 bits
```

## Q16. What is the range of an IPv4 octet?

**Answer:**

```text
0 - 255
```

## Q17. What are the historical IPv4 address classes?

**Answer:**

| Class | First octet | Default mask |
|---|---:|---|
| A | 1–126 | /8 |
| B | 128–191 | /16 |
| C | 192–223 | /24 |
| D | 224–239 | Multicast |
| E | 240–255 | Experimental |

> Modern IP networks primarily use CIDR rather than classful addressing.

---

# 4. Binary

Binary is important because subnet masks and CIDR operate at the bit level.

## Q18. What are the binary place values in an IPv4 octet?

**Answer:**

```text
128  64  32  16  8  4  2  1
```

## Q19. Convert 192 to binary.

**Solution:**

```text
192 = 128 + 64

192 = 11000000
```

## Q20. Convert 168 to binary.

**Solution:**

```text
168 = 128 + 32 + 8

168 = 10101000
```

Therefore:

```text
192.168

11000000.10101000
```

---

# 5. Private and Special IPv4 Addresses

## Q21. What are the RFC 1918 private IPv4 ranges?

**Answer:**

```text
10.0.0.0/8
172.16.0.0/12
192.168.0.0/16
```

## Q22. Is `10.25.10.50` private?

**Answer:**  
Yes. It belongs to `10.0.0.0/8`.

## Q23. Is `172.20.10.5` private?

**Answer:**  
Yes. It falls within:

```text
172.16.0.0 - 172.31.255.255
```

## Q24. Is `172.40.10.5` private?

**Answer:**  
No. The private 172 range ends at `172.31.255.255`.

## Q25. What is loopback?

**Answer:**  
The IPv4 loopback range is:

```text
127.0.0.0/8
```

The most commonly used loopback address is:

```text
127.0.0.1
```

## Q26. What is APIPA?

**Answer:**  
APIPA uses:

```text
169.254.0.0/16
```

It can be used for link-local addressing when a host cannot obtain an address through normal DHCP.

## Q27. What is `0.0.0.0`?

**Answer:**  
It represents an unspecified address/prefix depending on context and is commonly used to represent a default route when written as:

```text
0.0.0.0/0
```

## Q28. What is the IPv4 limited broadcast address?

**Answer:**

```text
255.255.255.255
```

---

# 6. Subnet Masks

## Q29. What does a subnet mask do?

**Answer:**  
A subnet mask separates the network portion of an IP address from the host portion.

Example:

```text
IP:          192.168.1.10
Subnet mask: 255.255.255.0
CIDR:        /24
```

Binary mask:

```text
11111111.11111111.11111111.00000000
```

Therefore:

```text
24 network bits
8 host bits
```

## Q30. What is the CIDR equivalent of `255.255.255.0`?

**Answer:**

```text
/24
```

## Q31. What is the CIDR equivalent of `255.255.255.192`?

**Answer:**

```text
/26
```

Because:

```text
255 = 8 ones
255 = 8 ones
255 = 8 ones
192 = 2 ones

8 + 8 + 8 + 2 = 26
```

---

# 7. CIDR

CIDR stands for **Classless Inter-Domain Routing**.

## Q32. What does `/24` mean?

**Answer:**  
24 bits are used for the network prefix and 8 bits remain for hosts.

```text
32 - 24 = 8 host bits
```

## Q33. How many total IPv4 addresses are in a `/24`?

**Solution:**

```text
Host bits = 32 - 24 = 8

2^8 = 256
```

**Answer:** 256 total addresses.

For a traditional subnet with network and broadcast addresses:

```text
256 - 2 = 254 usable host addresses
```

## Q34. How many usable hosts are in `/26`?

**Solution:**

```text
Host bits = 32 - 26
          = 6

2^6 = 64 total addresses

64 - 2 = 62 usable hosts
```

**Answer:** 62 usable hosts.

## Q35. How many usable hosts are in `/27`?

**Solution:**

```text
Host bits = 32 - 27 = 5

2^5 = 32

32 - 2 = 30
```

**Answer:** 30 usable hosts.

## Q36. How many usable hosts are in `/28`?

**Solution:**

```text
32 - 28 = 4 host bits

2^4 = 16

16 - 2 = 14 usable hosts
```

**Answer:** 14 usable hosts.

### CIDR quick table

| CIDR | Subnet Mask | Host Bits | Total Addresses | Traditional Usable Hosts |
|---|---|---:|---:|---:|
| /16 | 255.255.0.0 | 16 | 65,536 | 65,534 |
| /20 | 255.255.240.0 | 12 | 4,096 | 4,094 |
| /24 | 255.255.255.0 | 8 | 256 | 254 |
| /25 | 255.255.255.128 | 7 | 128 | 126 |
| /26 | 255.255.255.192 | 6 | 64 | 62 |
| /27 | 255.255.255.224 | 5 | 32 | 30 |
| /28 | 255.255.255.240 | 4 | 16 | 14 |
| /29 | 255.255.255.248 | 3 | 8 | 6 |
| /30 | 255.255.255.252 | 2 | 4 | 2 |

> Note: Cloud providers and special-purpose networks can have different usable-address rules. Do not blindly apply the traditional `-2` rule to every cloud networking question.

---

# 8. Subnetting

## Q37. Divide `192.168.1.0/24` into 4 equal subnets.

### Step 1: Determine how many bits to borrow

We need 4 subnets:

```text
2^2 = 4
```

Borrow 2 host bits.

```text
Original: /24
New:      /26
```

### Step 2: Find block size

`/26` = `255.255.255.192`

```text
256 - 192 = 64
```

### Answer

```text
192.168.1.0/26
192.168.1.64/26
192.168.1.128/26
192.168.1.192/26
```

Each subnet has:

```text
64 total addresses
62 traditional usable host addresses
```

---

# 9. Network, Broadcast, and Host Range

## Q38. Find the network and broadcast addresses for `192.168.10.75/26`.

### Step 1: Determine block size

`/26`:

```text
Mask = 255.255.255.192

Block size = 256 - 192
           = 64
```

Subnets:

```text
0–63
64–127
128–191
192–255
```

75 belongs to:

```text
64–127
```

### Answer

```text
Network:    192.168.10.64
Broadcast:  192.168.10.127
First host: 192.168.10.65
Last host:  192.168.10.126
```

## Q39. Find the network and broadcast addresses for `10.10.10.130/25`.

`/25` has a block size of 128.

Ranges:

```text
0–127
128–255
```

130 belongs to the second subnet.

### Answer

```text
Network:    10.10.10.128
Broadcast:  10.10.10.255
First host: 10.10.10.129
Last host:  10.10.10.254
```

## Q40. Find the network and broadcast addresses for `192.168.1.70/27`.

`/27` = `255.255.255.224`

```text
Block size = 256 - 224
           = 32
```

Ranges:

```text
0–31
32–63
64–95
96–127
...
```

70 belongs to `64–95`.

### Answer

```text
Network:    192.168.1.64
Broadcast:  192.168.1.95
First host: 192.168.1.65
Last host:  192.168.1.94
```

---

# 10. VLSM

VLSM = **Variable Length Subnet Mask**.

VLSM allows different subnets to use different sizes.

## Q41. You have `192.168.1.0/24` and need:

```text
Department A → 100 hosts
Department B → 50 hosts
Department C → 25 hosts
Department D → 10 hosts
```

What subnet sizes should you choose?

### Solution

Start with the largest requirement.

```text
100 hosts → /25 → 126 traditional usable hosts
50 hosts  → /26 → 62
25 hosts  → /27 → 30
10 hosts  → /28 → 14
```

A possible allocation is:

```text
Department A → 192.168.1.0/25
Department B → 192.168.1.128/26
Department C → 192.168.1.192/27
Department D → 192.168.1.224/28
```

Remaining space:

```text
192.168.1.240/28
```

---

# 11. Supernetting and Route Summarization

## Q42. What is route summarization?

**Answer:**  
Route summarization combines multiple contiguous routes into a shorter aggregate prefix, reducing the number of routing-table entries.

Example:

```text
10.0.0.0/24
10.0.1.0/24
10.0.2.0/24
10.0.3.0/24
```

These can be summarized as:

```text
10.0.0.0/22
```

when the address blocks are properly aligned and contiguous.

## Q43. What is longest prefix match?

**Answer:**  
When multiple routes match a destination, the router generally selects the route with the most specific (longest) matching prefix.

Example:

```text
10.0.0.0/8
10.0.1.0/24
```

For destination:

```text
10.0.1.50
```

the `/24` route is more specific than `/8`, so it is selected.

---

# 12. Routing

## Q44. What is a default gateway?

**Answer:**  
A default gateway is the Layer 3 device a host uses to reach destinations outside its local subnet.

Example:

```text
Server:
IP:      10.0.1.10/24
Gateway: 10.0.1.1
```

Destination:

```text
10.0.1.50
```

is local.

Destination:

```text
10.0.2.50
```

is outside the local subnet, so the host sends the traffic toward its gateway:

```text
10.0.1.1
```

## Q45. What is a routing table?

**Answer:**  
A routing table contains destination prefixes and information used to determine where packets should be forwarded.

## Q46. What is a static route?

**Answer:**  
A route manually configured by an administrator.

## Q47. What is a dynamic route?

**Answer:**  
A route learned through a routing protocol or another dynamic routing mechanism.

---

# 13. ARP

## Q48. What does ARP do?

**Answer:**  
ARP (Address Resolution Protocol) is used in IPv4 networks to resolve a local IPv4 address to a MAC address.

Conceptually:

```text
IPv4 address → MAC address
```

## Q49. What is an ARP cache?

**Answer:**  
An ARP cache stores recently learned IP-to-MAC mappings so the host does not have to perform ARP discovery for every packet.

---

# 14. TCP vs UDP

## Q50. What is TCP?

**Answer:**  
TCP is connection-oriented and provides mechanisms for reliable, ordered data delivery.

Common applications include:

```text
HTTPS
SSH
FTP
```

## Q51. What is UDP?

**Answer:**  
UDP is connectionless and has lower protocol overhead, but it does not provide TCP-style delivery guarantees.

Common examples include:

```text
DNS
DHCP
VoIP
```

## Q52. When would you prefer UDP?

**Answer:**  
When low overhead and timely delivery are more important than TCP-style reliability, depending on the application.

---

# 15. Common Ports

| Protocol/Service | Port |
|---|---:|
| HTTP | 80 |
| HTTPS | 443 |
| SSH | 22 |
| DNS | 53 |
| DHCP | 67/68 |
| FTP | 20/21 |
| SMTP | 25 |
| RDP | 3389 |
| NTP | 123 |
| SNMP | 161/162 |

## Q53. An HTTPS application is not reachable. Which port would you check?

**Answer:**

```text
TCP 443
```

Then check the complete path: security controls, routing, firewall rules, load balancer/application configuration, and whether the service is actually listening.

---

# 16. DNS

## Q54. What does DNS do?

**Answer:**  
DNS translates domain names into IP addresses and provides other types of name-related information.

Example:

```text
www.example.com
        ↓
      DNS
        ↓
192.0.2.10
```

## Q55. What is an A record?

**Answer:**  
An A record maps a hostname to an IPv4 address.

## Q56. What is an AAAA record?

**Answer:**  
An AAAA record maps a hostname to an IPv6 address.

## Q57. What is a CNAME record?

**Answer:**  
A CNAME record creates an alias from one DNS name to another DNS name.

## Q58. What is an MX record?

**Answer:**  
An MX record identifies mail servers responsible for receiving email for a domain.

## Q59. What is a reverse DNS lookup?

**Answer:**  
It resolves an IP address back to a hostname, commonly using PTR records.

---

# 17. DHCP

## Q60. What does DORA stand for?

**Answer:**

```text
D = Discover
O = Offer
R = Request
A = Acknowledge
```

It describes the common DHCP address-assignment exchange.

## Q61. What information can DHCP provide?

**Answer:**  
Depending on configuration, DHCP can provide:

- IP address
- Subnet mask/prefix
- Default gateway
- DNS servers
- Lease information
- Other DHCP options

---

# 18. NAT

## Q62. What is NAT?

**Answer:**  
NAT (Network Address Translation) modifies IP addressing information as traffic passes between network boundaries.

## Q63. What is PAT?

**Answer:**  
PAT (Port Address Translation) allows multiple internal connections to share a public IP address by using different transport-layer port mappings.

## Q64. What is SNAT?

**Answer:**  
SNAT changes the source address of traffic.

## Q65. What is DNAT?

**Answer:**  
DNAT changes the destination address of traffic.

---

# 19. Switching and VLANs

## Q66. What is a VLAN?

**Answer:**  
A VLAN logically separates Layer 2 networks/broadcast domains on switching infrastructure.

Example:

```text
VLAN 10 → Developers
VLAN 20 → Finance
```

## Q67. What is an access port?

**Answer:**  
An access port normally carries traffic for one VLAN and is commonly used to connect end devices.

## Q68. What is a trunk port?

**Answer:**  
A trunk carries traffic for multiple VLANs, typically using VLAN tagging such as IEEE 802.1Q.

## Q69. Can two different VLANs communicate directly at Layer 2?

**Answer:**  
No. Communication between different VLANs requires Layer 3 routing.

---

# 20. STP

## Q70. Why is Spanning Tree Protocol needed?

**Answer:**  
STP helps prevent Layer 2 switching loops.

Without loop prevention:

```text
Switch A
  ↙    ↘
Switch B—Switch C
```

can create a Layer 2 loop.

## Q71. What are important STP concepts?

**Answer:**

- Root bridge
- Root port
- Designated port
- Blocking/discarding
- Forwarding
- STP
- RSTP

---

# 21. IPv6

## Q72. How many bits are in an IPv6 address?

**Answer:**

```text
128 bits
```

## Q73. Give an example of an IPv6 address.

**Answer:**

```text
2001:db8:1234:1::10/64
```

## Q74. What is IPv6 link-local addressing?

**Answer:**  
IPv6 link-local addresses are used for communication on the local link and are typically from:

```text
fe80::/10
```

## Q75. What is SLAAC?

**Answer:**  
SLAAC (Stateless Address Autoconfiguration) allows IPv6 hosts to configure addresses using information advertised by routers.

---

# 22. Routing Protocols

## Q76. What is RIP?

**Answer:**  
RIP is a distance-vector routing protocol that uses hop count as a routing metric.

## Q77. What is OSPF?

**Answer:**  
OSPF is a link-state interior gateway protocol.

Important concepts include:

```text
Areas
Area 0
Neighbors
LSAs
Cost
DR/BDR
```

## Q78. What is BGP?

**Answer:**  
BGP is the primary inter-domain routing protocol used to exchange routing information between autonomous systems.

Important concepts:

```text
Autonomous System
eBGP
iBGP
Path selection
Prefix advertisement
```

---

# 23. VPN

## Q79. What is a VPN?

**Answer:**  
A VPN creates a protected logical connection across an underlying network, often using encryption and authentication.

## Q80. What is a site-to-site VPN?

**Answer:**  
A site-to-site VPN connects two networks, such as an on-premises network and a cloud VPC.

Example:

```text
On-Premises
     |
  IPsec VPN
     |
   Cloud
```

## Q81. What is IPsec?

**Answer:**  
IPsec is a suite of protocols and mechanisms used to secure IP communications, including authentication and encryption.

---

# 24. Network Security

## Q82. What is a firewall?

**Answer:**  
A firewall controls network traffic according to defined security rules.

## Q83. What is the difference between stateful and stateless filtering?

**Answer:**

**Stateful filtering** tracks connection state and can make decisions based on the context of an established flow.

**Stateless filtering** evaluates packets independently according to configured rules.

## Q84. What is an IDS?

**Answer:**  
IDS (Intrusion Detection System) monitors traffic/activity and detects potentially malicious behavior.

## Q85. What is an IPS?

**Answer:**  
IPS (Intrusion Prevention System) can detect and actively block/prevent certain malicious traffic.

## Q86. What is a WAF?

**Answer:**  
A Web Application Firewall protects web applications by inspecting HTTP/HTTPS traffic and applying application-layer rules.

---

# 25. Network Troubleshooting

## Q87. What Linux commands are useful for network troubleshooting?

**Answer:**

```bash
ip addr
ip route
ping
traceroute
tracepath
nslookup
dig
ss
netstat
curl
nc
tcpdump
```

## Q88. What Windows commands are useful?

**Answer:**

```powershell
ipconfig
ping
tracert
nslookup
netstat
Test-NetConnection
```

## Q89. A server can communicate using an IP address but not a hostname. What should you investigate?

**Answer:**

The basic connectivity is working, so investigate DNS-related configuration:

```text
DNS server configuration
DNS records
Resolver configuration
Search domains
Private DNS
Route 53/private DNS where applicable
/etc/resolv.conf on Linux
```

## Q90. An application is not reachable over HTTPS. What should you check?

**Answer:**

Use a layered troubleshooting approach:

```text
1. Is the server/application running?
2. Is it listening on TCP 443?
3. Is the local OS firewall allowing traffic?
4. Are security groups/firewalls allowing traffic?
5. Are NACLs/ACLs allowing traffic?
6. Are route tables correct?
7. Is the load balancer configured correctly?
8. Is DNS resolving to the expected endpoint?
9. Is the return path available?
```

---

# 26. AWS Networking

## Q91. What is an AWS VPC?

**Answer:**  
An Amazon VPC is a logically isolated virtual network in AWS where you can deploy resources such as EC2 instances.

## Q92. What is a VPC CIDR?

**Answer:**  
A VPC CIDR defines the IPv4 address range allocated to the VPC.

Example:

```text
10.0.0.0/16
```

## Q93. Design a simple three-tier VPC.

A conceptual design:

```text
VPC: 10.0.0.0/16

Public subnet:
10.0.1.0/24

Private App subnet:
10.0.2.0/24

Private DB subnet:
10.0.3.0/24
```

Architecture:

```text
Internet
    |
    ↓
Internet Gateway
    |
Public Subnet
    |
    ↓
Application Load Balancer
    |
Private App Subnet
    |
    ↓
Database Subnet
    |
    ↓
RDS
```

## Q94. What is an Internet Gateway?

**Answer:**  
An Internet Gateway provides a path between a VPC and the public internet when the relevant routing and addressing configuration allows it.

## Q95. What is a NAT Gateway?

**Answer:**  
A NAT Gateway enables resources in private subnets to initiate connections to supported external destinations, such as the internet, without making those private resources directly reachable from the internet through that NAT path.

Typical architecture:

```text
Private EC2
    |
Private Route Table
    |
NAT Gateway
    |
Internet Gateway
    |
Internet
```

## Q96. What is a route table in AWS?

**Answer:**  
An AWS route table contains routes that determine where subnet traffic is sent.

Example:

```text
Destination       Target
10.0.0.0/16       local
0.0.0.0/0         igw-xxxx
```

## Q97. What is an AWS Security Group?

**Answer:**  
A Security Group acts as a stateful virtual firewall for supported AWS resources such as EC2 network interfaces.

## Q98. What is an AWS Network ACL?

**Answer:**  
A Network ACL is a stateless subnet-level network traffic filter.

## Q99. Security Group vs NACL?

| Feature | Security Group | NACL |
|---|---|---|
| Scope | Resource/network interface level | Subnet level |
| Stateful | Yes | No |
| Rules | Allow rules | Allow and deny rules |
| Return traffic | Automatically allowed when permitted by state | Must be explicitly considered |

## Q100. What is a VPC endpoint?

**Answer:**  
A VPC endpoint provides private connectivity from a VPC to supported AWS services/endpoints without requiring the traffic to traverse the public internet.

Common types include:

```text
Gateway endpoint
Interface endpoint
```

---

# 27. Advanced AWS Networking

## Q101. What is VPC Peering?

**Answer:**  
VPC Peering provides private network connectivity between two VPCs using AWS networking infrastructure.

Important consideration:

```text
VPC CIDRs must not overlap
```

for normal VPC peering connectivity.

## Q102. What is Transit Gateway?

**Answer:**  
AWS Transit Gateway provides a centralized network transit hub for connecting VPCs and other supported networks.

Conceptually:

```text
           VPC A
             |
             |
VPC B ---- Transit Gateway ---- VPC C
             |
             |
          On-Prem
```

This is useful when the number of network connections grows.

## Q103. VPC Peering vs Transit Gateway?

**Answer:**

### VPC Peering

Good for relatively direct VPC-to-VPC connectivity.

```text
VPC A ←→ VPC B
```

### Transit Gateway

Useful for centralized hub-and-spoke connectivity.

```text
        VPC A
          |
VPC B — TGW — VPC C
          |
       On-Prem
```

## Q104. What is AWS PrivateLink?

**Answer:**  
AWS PrivateLink enables private access to supported services/endpoints through private connectivity without requiring the consumer to connect directly to the provider's VPC network.

## Q105. What is Direct Connect?

**Answer:**  
AWS Direct Connect provides a dedicated network connection from an on-premises or colocation environment to AWS.

## Q106. What is Route 53?

**Answer:**  
Amazon Route 53 is AWS's highly available and scalable DNS service. It can also provide domain registration and health-check-based routing functionality.

---

# 28. Practice Questions

These questions are intended to test whether you can apply the concepts rather than simply memorize definitions.

## Q107. Calculate the following for `192.168.50.10/24`.

- Subnet mask
- Network address
- Broadcast address
- First host
- Last host
- Usable hosts

### Answer

```text
Subnet mask: 255.255.255.0
Network:     192.168.50.0
Broadcast:   192.168.50.255
First host:  192.168.50.1
Last host:   192.168.50.254
Usable:      254
```

---

## Q108. Calculate the following for `10.0.5.70/26`.

`/26` gives a block size of:

```text
256 - 192 = 64
```

Ranges:

```text
0–63
64–127
128–191
192–255
```

### Answer

```text
Network:     10.0.5.64
Broadcast:   10.0.5.127
First host:  10.0.5.65
Last host:   10.0.5.126
Usable:      62
```

---

## Q109. Calculate the following for `172.16.20.130/27`.

`/27` block size:

```text
256 - 224 = 32
```

Relevant ranges:

```text
128–159
```

### Answer

```text
Network:     172.16.20.128
Broadcast:   172.16.20.159
First host:  172.16.20.129
Last host:   172.16.20.158
Usable:      30
```

---

## Q110. Calculate the following for `192.168.100.200/28`.

`/28` block size:

```text
256 - 240 = 16
```

Relevant range:

```text
192–207
```

### Answer

```text
Network:     192.168.100.192
Broadcast:   192.168.100.207
First host:  192.168.100.193
Last host:   192.168.100.206
Usable:      14
```

---

## Q111. Calculate the following for `10.20.30.145/25`.

`/25` divides the last octet into:

```text
0–127
128–255
```

### Answer

```text
Network:     10.20.30.128
Broadcast:   10.20.30.255
First host:  10.20.30.129
Last host:   10.20.30.254
Usable:      126
```

---

## Q112. You have `10.0.0.0/16` and need four logical subnets for Web, App, Database, and Management. How could you approach the design?

**Answer:**

If equal-sized subnets are appropriate, `/18` gives four equal subnets:

```text
10.0.0.0/18
10.0.64.0/18
10.0.128.0/18
10.0.192.0/18
```

In a real design, choose subnet sizes based on actual capacity, availability-zone, routing, and growth requirements rather than automatically using equal-sized blocks.

---

## Q113. You have `10.0.0.0/16` and need:

```text
Web → 500 hosts
App → 200 hosts
DB  → 100 hosts
Mgmt → 50 hosts
```

What subnet sizes are appropriate?

### Answer

```text
500 hosts → /23 → 510 traditional usable
200 hosts → /24 → 254
100 hosts → /25 → 126
50 hosts  → /26 → 62
```

Allocate from largest to smallest to simplify VLSM planning.

---

## Q114. An EC2 instance can reach another private EC2 instance by IP but cannot resolve its hostname. What is the most likely area to investigate?

**Answer:**  
DNS/name resolution.

Check:

```text
DNS resolver
Route 53/private hosted zone
VPC DNS settings
Host configuration
/etc/resolv.conf
DNS records
```

---

## Q115. An EC2 instance in a private subnet needs outbound internet access for software updates. What AWS architecture is commonly used?

**Answer:**

```text
Private EC2
    ↓
Private Route Table
    ↓
NAT Gateway
    ↓
Internet Gateway
    ↓
Internet
```

The NAT Gateway is normally placed in a public subnet with a route toward an Internet Gateway.

---

## Q116. Two EC2 instances in different subnets cannot communicate. What should you check?

**Answer:**

Use a layered approach:

```text
1. Are the IPs/subnets correct?
2. Do the route tables have the required routes?
3. Are Security Groups allowing the traffic?
4. Are NACLs allowing both directions as required?
5. Is the OS firewall blocking traffic?
6. Is the application listening on the expected port?
7. Is there any overlapping CIDR?
8. Is the return route available?
```

---

## Q117. You have multiple VPCs and want centralized connectivity rather than creating many individual VPC peering connections. What AWS service should you consider?

**Answer:**  
AWS Transit Gateway.

---

# 29. Quick Reference

## IPv4 formula

```text
Total IPv4 addresses = 2^(32 - prefix length)
```

Traditional subnet host calculation:

```text
Usable hosts = 2^(32 - prefix length) - 2
```

Example:

```text
/26

32 - 26 = 6

2^6 = 64 total

64 - 2 = 62 traditional usable
```

## Common masks

```text
/24 = 255.255.255.0
/25 = 255.255.255.128
/26 = 255.255.255.192
/27 = 255.255.255.224
/28 = 255.255.255.240
/29 = 255.255.255.248
/30 = 255.255.255.252
```

## Private IPv4

```text
10.0.0.0/8

172.16.0.0/12

192.168.0.0/16
```

## Common ports

```text
SSH      → 22
DNS      → 53
HTTP     → 80
HTTPS    → 443
RDP      → 3389
NTP      → 123
SMTP     → 25
```

## Important Linux networking commands

```bash
ip addr
ip route
ping
traceroute
tracepath
dig
nslookup
ss
curl
nc
tcpdump
```

## AWS networking building blocks

```text
VPC
├── CIDR
├── Subnets
├── Route Tables
├── Internet Gateway
├── NAT Gateway
├── Security Groups
├── Network ACLs
├── VPC Endpoints
├── VPC Peering
├── Transit Gateway
├── VPN
├── Direct Connect
└── Route 53
```

---


---

# 27. Azure Networking

## Q118. What is an Azure Virtual Network (VNet)?

**Answer:**  
Azure Virtual Network (VNet) is the fundamental private networking building block in Azure. It allows Azure resources such as virtual machines to communicate with each other, with the internet, and with on-premises networks.

A simple design:

```text
Azure VNet: 10.0.0.0/16

├── Web Subnet
│   └── 10.0.1.0/24
│
├── App Subnet
│   └── 10.0.2.0/24
│
└── DB Subnet
    └── 10.0.3.0/24
```

## Q119. What is an Azure subnet?

**Answer:**  
A subnet is a smaller IP address range carved from a VNet address space.

Example:

```text
VNet:       10.0.0.0/16
Web subnet: 10.0.1.0/24
App subnet: 10.0.2.0/24
```

Subnets help logically organize workloads and apply network controls.

## Q120. How is CIDR used in Azure VNets?

**Answer:**  
CIDR notation is used to define VNet and subnet address ranges.

Example:

```text
VNet:    10.0.0.0/16
Subnet:  10.0.1.0/24
```

The subnet must fit within the VNet's address space.

## Q121. What is an Azure Network Security Group (NSG)?

**Answer:**  
An NSG contains inbound and outbound security rules that allow or deny network traffic to and from Azure resources associated with supported network interfaces and subnets.

Example:

```text
Inbound:
TCP 443 → Allow
TCP 22  → Allow from trusted source
```

## Q122. NSG vs AWS Security Group?

**Answer:**

| Concept | Azure | AWS |
|---|---|---|
| Virtual network | VNet | VPC |
| Subnet | Subnet | Subnet |
| Resource traffic rules | NSG | Security Group |
| Route table | Route Table | Route Table |
| Private service connectivity | Private Endpoint | VPC Endpoint / PrivateLink |

The exact behavior and association model differ between the platforms.

## Q123. What is an Azure route table?

**Answer:**  
An Azure route table contains custom routes that can control how traffic is forwarded from a subnet.

Example:

```text
Destination     Next hop
10.0.0.0/16     Virtual network
0.0.0.0/0       Virtual appliance
```

## Q124. What is a User Defined Route (UDR)?

**Answer:**  
A UDR is a custom route created by an administrator and associated with one or more subnets.

A common use case is forcing traffic through a network virtual appliance:

```text
VM
 |
Subnet
 |
UDR
 |
Firewall / NVA
 |
Destination
```

## Q125. What is an Azure Virtual Network Gateway?

**Answer:**  
A Virtual Network Gateway provides connectivity between an Azure VNet and other networks, including on-premises networks, using supported VPN or ExpressRoute configurations.

## Q126. What is Azure VPN Gateway?

**Answer:**  
Azure VPN Gateway provides encrypted connectivity between Azure VNets and external networks using VPN technologies.

A common hybrid architecture is:

```text
On-Premises Network
        |
    VPN Gateway
        |
     Internet
        |
Azure VPN Gateway
        |
      Azure VNet
```

## Q127. What is Azure ExpressRoute?

**Answer:**  
Azure ExpressRoute provides private connectivity between an organization's network and Microsoft cloud services through an ExpressRoute connectivity provider.

It is commonly used when organizations require private connectivity and predictable network characteristics for hybrid environments.

## Q128. What is Azure VNet Peering?

**Answer:**  
VNet Peering connects two Azure VNets so resources can communicate privately over the Azure backbone.

Conceptually:

```text
VNet A
  |
  +------ VNet Peering ------+
                             |
                           VNet B
```

For a more complex topology, Azure Virtual WAN or other centralized network architectures may be considered.

## Q129. What is Azure Private Endpoint?

**Answer:**  
An Azure Private Endpoint provides a private IP address from a VNet for accessing an Azure service that supports Private Link.

Conceptually:

```text
VM in VNet
    |
Private Endpoint
    |
Azure Service
```

This can allow service access without exposing the service through a public network path.

## Q130. What is Azure Private Link?

**Answer:**  
Azure Private Link provides private connectivity to supported Azure services and privately exposed services through private endpoints.

## Q131. What is Azure Load Balancer?

**Answer:**  
Azure Load Balancer is a Layer 4 load-balancing service that distributes TCP/UDP traffic across backend resources.

## Q132. Azure Load Balancer vs Application Gateway?

**Answer:**

**Azure Load Balancer:**

```text
Layer 4
TCP/UDP
```

**Azure Application Gateway:**

```text
Layer 7
HTTP/HTTPS
Web application routing
```

Application Gateway can also provide capabilities such as TLS termination and Web Application Firewall integration depending on configuration.

## Q133. What is Azure Application Gateway?

**Answer:**  
Azure Application Gateway is a Layer 7 web traffic load balancer that can route HTTP/HTTPS requests based on application-layer information.

Common capabilities include:

```text
URL-based routing
Host-based routing
TLS termination
Health probes
WAF integration
```

## Q134. What is Azure Front Door?

**Answer:**  
Azure Front Door is a global application delivery service for HTTP/HTTPS workloads. It can provide global routing, acceleration, health-based routing, and web application security capabilities depending on the configuration.

## Q135. What is Azure NAT Gateway?

**Answer:**  
Azure NAT Gateway provides outbound internet connectivity for resources in associated subnets while using predictable public IP addressing.

Conceptually:

```text
Private VM
    |
Subnet
    |
NAT Gateway
    |
Internet
```

## Q136. What is Azure DNS?

**Answer:**  
Azure DNS provides DNS hosting for domain names using Azure infrastructure.

Azure also provides private DNS capabilities for name resolution within virtual networks and supported private connectivity scenarios.

## Q137. What is Azure Bastion?

**Answer:**  
Azure Bastion provides browser-based secure access to Azure virtual machines over RDP and SSH without requiring public IP addresses on those VMs.

Conceptually:

```text
Administrator
      |
   HTTPS
      |
Azure Bastion
      |
Private VM
```

## Q138. What is Azure DDoS Protection?

**Answer:**  
Azure DDoS Protection helps protect Azure resources against distributed denial-of-service attacks.

## Q139. What is Azure Firewall?

**Answer:**  
Azure Firewall is a managed, stateful network security service that can centrally control and inspect network traffic.

A common architecture:

```text
Internet
   |
Azure Firewall
   |
Hub VNet
   |
Spoke VNets
```

## Q140. What is hub-and-spoke networking in Azure?

**Answer:**  
Hub-and-spoke is a network architecture where a central hub VNet provides shared network services while application VNets are connected as spokes.

Example:

```text
                 Spoke VNet
                     |
                     |
Spoke VNet ---- Hub VNet ---- Spoke VNet
                     |
                     |
               On-Premises
```

The hub may contain shared services such as:

```text
Azure Firewall
VPN Gateway
ExpressRoute Gateway
DNS services
Management/network appliances
```

## Q141. What is Azure Virtual WAN?

**Answer:**  
Azure Virtual WAN is a managed networking service designed to simplify large-scale branch, VNet, VPN, and hybrid connectivity through a Microsoft-managed global network architecture.

---

# 28. Azure Networking Troubleshooting

## Q142. An Azure VM cannot reach another VM. What should you check?

**Answer:**

Use a layered approach:

```text
1. Check IP addresses and subnet configuration.
2. Check effective routes.
3. Check NSG inbound/outbound rules.
4. Check any Azure Firewall or NVA rules.
5. Check the VM's operating-system firewall.
6. Check whether the application is listening on the expected port.
7. Check the return path.
8. Check DNS if the connection uses a hostname.
```

## Q143. An Azure VM has no outbound internet access. What should you check?

**Answer:**

```text
1. Subnet configuration
2. Effective routes
3. NAT Gateway configuration if used
4. NSG outbound rules
5. Azure Firewall/NVA rules
6. Public IP or supported outbound configuration
7. DNS resolution
8. Operating-system firewall
```

## Q144. A VM can reach an IP address but not a hostname. What should you investigate?

**Answer:**  
Investigate DNS:

```text
DNS server/resolver
Azure Private DNS
DNS records
VNet DNS configuration
Private Endpoint DNS configuration
OS DNS configuration
```

## Q145. How can you investigate Azure VM network connectivity?

**Answer:**  
Use Azure networking diagnostics and tools such as:

```text
Network Watcher
IP flow verify
Next hop
Connection troubleshoot
Effective security rules
Effective routes
```

These help identify whether the problem is related to routing, NSGs, connectivity, or the destination.

---

# 29. AWS vs Azure Networking Mapping

| Networking Requirement | AWS | Azure |
|---|---|---|
| Virtual network | VPC | VNet |
| Subnet | Subnet | Subnet |
| Private routing | Route Table | Route Table / UDR |
| Resource-level security | Security Group | NSG |
| Subnet-level filtering | NACL | NSG/other network controls depending on design |
| Internet connectivity | Internet Gateway | Azure platform networking / public IP architecture |
| Outbound NAT | NAT Gateway | NAT Gateway |
| Site-to-site VPN | AWS Site-to-Site VPN | Azure VPN Gateway |
| Dedicated hybrid connectivity | Direct Connect | ExpressRoute |
| VPC/VNet private connectivity | VPC Peering / Transit Gateway | VNet Peering / Virtual WAN |
| Private service access | VPC Endpoint / PrivateLink | Private Endpoint / Private Link |
| L4 load balancing | Network Load Balancer | Azure Load Balancer |
| L7 web load balancing | Application Load Balancer | Application Gateway |
| Global web delivery | CloudFront | Azure Front Door |
| DNS | Route 53 | Azure DNS |
| Managed firewall | AWS Network Firewall | Azure Firewall |
| DDoS protection | AWS Shield | Azure DDoS Protection |
| VM private access | Systems Manager / bastion solutions | Azure Bastion |

---

# 30. Azure Networking Practice Questions

## Q146. You have an Azure VNet `10.0.0.0/16`. You need Web, App, and DB subnets. Propose a simple design.

**Answer:**

```text
VNet: 10.0.0.0/16

Web:
10.0.1.0/24

App:
10.0.2.0/24

DB:
10.0.3.0/24
```

The exact sizes should be determined from workload requirements and future growth.

## Q147. A VM in `10.0.1.0/24` needs to communicate with a VM in `10.0.2.0/24`. What should you verify?

**Answer:**

```text
VNet/subnet configuration
        ↓
Effective routes
        ↓
NSG rules
        ↓
Azure Firewall/NVA
        ↓
OS firewall
        ↓
Application port
```

## Q148. Your organization has multiple Azure VNets and on-premises networks. You want a scalable centralized networking architecture. What concepts/services could you evaluate?

**Answer:**

Depending on requirements:

```text
Hub-and-spoke architecture
VNet Peering
Azure Virtual WAN
Azure Firewall
VPN Gateway
ExpressRoute
Private Link
Private DNS
```

The final choice depends on scale, routing requirements, security architecture, connectivity requirements, and operational model.

## Q149. An application hosted on Azure needs private access to an Azure PaaS service. What should you consider?

**Answer:**  
Consider **Azure Private Endpoint / Private Link** and the associated DNS configuration.

## Q150. An administrator needs SSH/RDP access to private Azure VMs without assigning public IPs to each VM. What Azure service should be considered?

**Answer:**  
Azure Bastion.

---

# 31. Cross-Cloud Networking Interview Questions

## Q151. Explain VPC vs VNet.

**Answer:**

Both provide isolated virtual networking environments:

```text
AWS → VPC
Azure → VNet
```

Both support concepts such as:

```text
CIDR ranges
Subnets
Routing
Network security
Private connectivity
Hybrid connectivity
```

The implementation details and individual services differ.

## Q152. Compare AWS Security Groups and Azure NSGs.

**Answer:**

Both are used to control network traffic, but they are not identical.

```text
AWS → Security Group
Azure → Network Security Group
```

When answering an interview question, explain the actual behavior and association model rather than saying they are exact equivalents.

## Q153. Compare AWS Transit Gateway and Azure hub-and-spoke/Virtual WAN.

**Answer:**  
AWS Transit Gateway is a centralized network transit service.

Azure commonly uses architectures involving:

```text
Hub-and-spoke
VNet Peering
Azure Virtual WAN
```

The appropriate Azure design depends on the scale and connectivity requirements.

## Q154. How would you troubleshoot a cloud networking issue regardless of cloud provider?

**Answer:**

Use the same general troubleshooting sequence:

```text
1. Identify source and destination.
2. Verify source/destination IPs.
3. Verify subnet/prefix.
4. Check routing.
5. Check security rules.
6. Check firewalls/NACLs/NSGs.
7. Check DNS.
8. Check the destination port.
9. Check the application.
10. Check the return path.
11. Use packet/network-flow diagnostics where available.
```

This approach works well across AWS, Azure, and traditional on-premises networks.

---

# 32. Extended AWS + Azure Study Order

After learning the common networking fundamentals, study the cloud networking concepts separately:

```text
                 Networking Fundamentals
                          |
             +------------+------------+
             |                         |
          AWS Path                 Azure Path
             |                         |
           VPC                       VNet
             |                         |
          Subnets                   Subnets
             |                         |
        Route Tables              Route Tables
             |                         |
      Security Groups                NSGs
             |                         |
       NACLs / Firewall          Firewall / NVA
             |                         |
       IGW / NAT GW              NAT Gateway
             |                         |
    VPC Endpoints / PL          Private Endpoint
             |                         |
       VPC Peering             VNet Peering
             |                         |
      Transit Gateway           Hub-Spoke / vWAN
             |                         |
    VPN / Direct Connect       VPN / ExpressRoute
             |                         |
       Route 53 / DNS             Azure DNS
             |                         |
     ALB / NLB / CloudFront   App Gateway / LB / Front Door
```

---

# 33. Final Certification-Level Checklist

Before considering your networking foundation strong, make sure you can explain and solve questions involving:

### Fundamentals

- [ ] OSI model
- [ ] TCP/IP model
- [ ] MAC vs IP
- [ ] Bandwidth
- [ ] Throughput
- [ ] Latency
- [ ] Jitter
- [ ] Packets vs frames

### IPv4

- [ ] IPv4 structure
- [ ] Binary conversion
- [ ] Private ranges
- [ ] Loopback
- [ ] APIPA/link-local
- [ ] Broadcast
- [ ] Network address
- [ ] Host address

### Subnetting

- [ ] Subnet masks
- [ ] CIDR
- [ ] Block size
- [ ] Network address
- [ ] Broadcast address
- [ ] Host range
- [ ] Number of subnets
- [ ] Number of hosts
- [ ] VLSM
- [ ] Route summarization
- [ ] Longest-prefix match

### Protocols

- [ ] TCP
- [ ] UDP
- [ ] ARP
- [ ] DNS
- [ ] DHCP
- [ ] NAT
- [ ] HTTP/HTTPS
- [ ] SSH
- [ ] RDP

### Switching/Routing

- [ ] VLAN
- [ ] Access port
- [ ] Trunk
- [ ] STP
- [ ] Static routing
- [ ] Dynamic routing
- [ ] OSPF
- [ ] BGP

### Security

- [ ] Firewall
- [ ] Stateful vs stateless
- [ ] IDS/IPS
- [ ] WAF
- [ ] VPN
- [ ] IPsec

### AWS

- [ ] VPC
- [ ] Subnets
- [ ] Route tables
- [ ] Internet Gateway
- [ ] NAT Gateway
- [ ] Security Groups
- [ ] NACLs
- [ ] VPC Endpoints
- [ ] VPC Peering
- [ ] Transit Gateway
- [ ] Site-to-Site VPN
- [ ] Direct Connect
- [ ] Route 53
- [ ] ALB/NLB
- [ ] CloudFront
- [ ] Network Firewall

### Azure

- [ ] VNet
- [ ] Subnets
- [ ] Route tables
- [ ] UDR
- [ ] NSGs
- [ ] Azure Firewall
- [ ] NAT Gateway
- [ ] VNet Peering
- [ ] Hub-and-spoke
- [ ] Virtual WAN
- [ ] VPN Gateway
- [ ] ExpressRoute
- [ ] Private Endpoint
- [ ] Private Link
- [ ] Azure DNS
- [ ] Load Balancer
- [ ] Application Gateway
- [ ] Front Door
- [ ] Azure Bastion
- [ ] DDoS Protection
- [ ] Network Watcher


# Recommended Study Order

For certification preparation, follow this order:

```text
1. Networking Fundamentals
        ↓
2. OSI + TCP/IP
        ↓
3. IPv4
        ↓
4. Binary
        ↓
5. Subnet Masks
        ↓
6. CIDR
        ↓
7. Subnetting
        ↓
8. VLSM
        ↓
9. Route Summarization
        ↓
10. Routing
        ↓
11. Switching + VLANs
        ↓
12. TCP/UDP + Ports
        ↓
13. ARP
        ↓
14. DNS + DHCP
        ↓
15. NAT
        ↓
16. IPv6
        ↓
17. Routing Protocols
        ↓
18. VPN
        ↓
19. Network Security
        ↓
20. Troubleshooting
        ↓
21. AWS VPC Networking
        ↓
22. Advanced AWS Networking
```

## Goal

By the end of this guide, you should be able to:

- Convert between subnet masks and CIDR.
- Calculate network and broadcast addresses.
- Calculate host ranges and address capacity.
- Divide networks using subnetting.
- Design VLSM-based networks.
- Understand routing and longest-prefix matching.
- Troubleshoot common DNS/network connectivity problems.
- Design basic AWS VPC architectures.
- Explain AWS route tables, IGW, NAT Gateway, Security Groups, NACLs, VPC endpoints, VPC Peering, and Transit Gateway.
- Solve certification-style networking questions.
