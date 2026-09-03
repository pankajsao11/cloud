# 🌐 Networking --- Complete Concepts & Commands Cheat Sheet

> GitHub-ready reference for **Cloud/DevOps Engineers, SREs, System
> Administrators and Network Engineers**. Covers networking from **basic
> → advanced**, including DNS, routing, NAT, throttling, security, cloud
> networking, troubleshooting, and Linux/Windows commands.

## Table of Contents

-   [1. Fundamentals](#1-fundamentals)
-   [2. OSI & TCP/IP](#2-osi--tcpip)
-   [3. Ethernet, MAC & Switching](#3-ethernet-mac--switching)
-   [4. IP Addressing](#4-ip-addressing)
-   [5. Subnetting & CIDR](#5-subnetting--cidr)
-   [6. TCP, UDP & ICMP](#6-tcp-udp--icmp)
-   [7. DNS](#7-dns)
-   [8. DHCP](#8-dhcp)
-   [9. ARP & IPv6 Neighbor Discovery](#9-arp--ipv6-neighbor-discovery)
-   [10. Routing](#10-routing)
-   [11. NAT & PAT](#11-nat--pat)
-   [12. VLAN, Trunking & STP](#12-vlan-trunking--stp)
-   [13. MTU, MSS & PMTUD](#13-mtu-mss--pmtud)
-   [14. Performance, QoS & Throttling](#14-performance-qos--throttling)
-   [15. Firewalls, ACLs & Proxies](#15-firewalls-acls--proxies)
-   [16. Load Balancing](#16-load-balancing)
-   [17. TLS, HTTPS & PKI](#17-tls-https--pki)
-   [18. VPN & Zero Trust](#18-vpn--zero-trust)
-   [19. Security & DDoS](#19-security--ddos)
-   [20. Protocols & Important Ports](#20-protocols--important-ports)
-   [21. Cloud Networking](#21-cloud-networking)
-   [22. Kubernetes & Container
    Networking](#22-kubernetes--container-networking)
-   [23. Troubleshooting Methodology](#23-troubleshooting-methodology)
-   [24. Linux Commands](#24-linux-commands)
-   [25. Windows CMD Commands](#25-windows-cmd-commands)
-   [26. Windows PowerShell Commands](#26-windows-powershell-commands)
-   [27. Packet Capture](#27-packet-capture)
-   [28. Firewall Commands](#28-firewall-commands)
-   [29. Advanced Networking](#29-advanced-networking)
-   [30. Interview Checklist](#30-interview-checklist)

------------------------------------------------------------------------

# 1. Fundamentals

## Network

A collection of connected devices that exchange data.

``` text
Client → Switch → Router → Internet
```

### Common network types

  Type   Meaning
  ------ ---------------------------
  PAN    Personal Area Network
  LAN    Local Area Network
  MAN    Metropolitan Area Network
  WAN    Wide Area Network
  WLAN   Wireless LAN
  VPN    Virtual Private Network

### Key terms

-   **Host** --- any network-connected endpoint.
-   **Client** --- initiates communication.
-   **Server** --- provides a service.
-   **Peer** --- endpoint participating directly in communication.
-   **Gateway** --- connects networks/protocol domains.
-   **Default gateway** --- next-hop router used when no more-specific
    route exists.
-   **Ingress** --- traffic entering a system/network.
-   **Egress** --- traffic leaving a system/network.
-   **East-West** --- internal workload-to-workload traffic.
-   **North-South** --- traffic entering/leaving an environment.
-   **Dataplane** --- forwards/processes traffic.
-   **Control plane** --- makes/distributes network decisions.

------------------------------------------------------------------------

# 2. OSI & TCP/IP

## OSI Model

``` text
7 Application
6 Presentation
5 Session
4 Transport
3 Network
2 Data Link
1 Physical
```

  Layer   Examples
  ------- -------------------------------
  7       HTTP, DNS, SMTP, SSH
  6       Encoding, encryption concepts
  5       Sessions
  4       TCP, UDP, ports
  3       IPv4, IPv6, ICMP, routing
  2       Ethernet, MAC, VLAN
  1       Cable, fiber, radio, signals

## TCP/IP Model

``` text
Application
Transport
Internet
Link
```

Typical mapping:

``` text
Application → OSI 5-7
Transport   → OSI 4
Internet    → OSI 3
Link        → OSI 1-2
```

## Encapsulation

``` text
Application Data
      ↓
TCP Segment / UDP Datagram
      ↓
IP Packet
      ↓
Ethernet Frame
      ↓
Bits
```

------------------------------------------------------------------------

# 3. Ethernet, MAC & Switching

## MAC Address

Layer-2 hardware/interface address.

Example:

``` text
00:1A:2B:3C:4D:5E
```

Broadcast:

``` text
FF:FF:FF:FF:FF:FF
```

## Switch

Learns source MAC addresses and forwards frames based on its MAC table.

## Collision Domain

Area where Ethernet collisions can occur. Modern full-duplex switched
Ethernet largely eliminates traditional shared-medium collisions.

## Broadcast Domain

Set of hosts receiving a Layer-2 broadcast. Routers and VLAN boundaries
can separate broadcast domains.

## VLAN

Logical Layer-2 segmentation.

``` text
VLAN 10 → Web
VLAN 20 → App
VLAN 30 → Database
```

## Access Port

Normally carries one VLAN.

## Trunk

Carries multiple VLANs, commonly using **802.1Q** tags.

## STP

Spanning Tree Protocol prevents Layer-2 loops.

Important terms:

-   Root bridge
-   BPDU
-   Path cost
-   Port role
-   RSTP
-   MSTP

## LACP

Link Aggregation Control Protocol combines physical links into a logical
bundle for capacity/redundancy.

------------------------------------------------------------------------

# 4. IP Addressing

## IPv4

32-bit address.

``` text
192.168.1.10
```

## IPv6

128-bit address.

``` text
2001:db8:1234::10
```

## Private IPv4

RFC 1918 ranges:

``` text
10.0.0.0/8 => 10.0.0.0 - 10.255.255.255
172.16.0.0/12 => 172.16.0.0 - 172.31.255.255
192.168.0.0/16 => 192.168.0.0 - 192.168.255.255
```

## Special addresses

``` text
127.0.0.1       IPv4 loopback
127.0.0.0/8     IPv4 loopback range
169.254.0.0/16  IPv4 link-local/APIPA
0.0.0.0/0       IPv4 default route
::1             IPv6 loopback
::/0            IPv6 default route
FE80::/10       IPv6 link-local
FC00::/7        IPv6 unique local
FF00::/8        IPv6 multicast
```

## Address delivery types

-   **Unicast** --- one sender to one receiver.
-   **Broadcast** --- one sender to all hosts in a broadcast domain;
    IPv6 does not use broadcast.
-   **Multicast** --- one sender to subscribed receivers.
-   **Anycast** --- same address advertised from multiple locations;
    routing selects an appropriate instance.

------------------------------------------------------------------------

# 5. Subnetting & CIDR

## CIDR

Classless Inter-Domain Routing.

``` text
10.0.0.0/16
```

`/16` means 16 network-prefix bits.

## Common IPv4 CIDRs

  CIDR   Mask                 Addresses
  ------ ----------------- ------------
  /8     255.0.0.0           16,777,216
  /16    255.255.0.0             65,536
  /24    255.255.255.0              256
  /25    255.255.255.128            128
  /26    255.255.255.192             64
  /27    255.255.255.224             32
  /28    255.255.255.240             16
  /29    255.255.255.248              8
  /30    255.255.255.252              4
  /31    255.255.255.254              2
  /32    255.255.255.255              1

Traditional usable-host calculation for normal subnets:

``` text
Usable hosts = 2^(host bits) - 2
```

Special cases such as `/31` and `/32` have different semantics.

## Subnet example

``` text
192.168.1.0/24
```

Split into `/26`:

``` text
192.168.1.0/26
192.168.1.64/26
192.168.1.128/26
192.168.1.192/26
```

## Route summarization

Multiple contiguous prefixes can sometimes be aggregated:

``` text
10.0.0.0/24
10.0.1.0/24
10.0.2.0/24
10.0.3.0/24
        ↓
10.0.0.0/22
```

------------------------------------------------------------------------

# 6. TCP, UDP & ICMP

## TCP

Reliable, ordered, connection-oriented byte stream.

Features:

-   Three-way handshake
-   Sequence numbers
-   ACKs
-   Retransmission
-   Flow control
-   Congestion control
-   Connection termination

### TCP handshake

``` text
Client                  Server
  | ---- SYN ----------> |
  | <--- SYN-ACK --------|
  | ---- ACK -----------> |
```

### TCP flags

``` text
SYN ACK FIN RST PSH URG ECE CWR
```

-   `SYN` --- establish connection.
-   `ACK` --- acknowledgment.
-   `FIN` --- graceful close.
-   `RST` --- reset.
-   `PSH` --- push data indication.
-   `URG` --- urgent pointer indication.

## UDP

Connectionless datagram transport.

Advantages:

-   Low overhead
-   No handshake
-   Useful for real-time/event-driven traffic

## TCP vs UDP

  TCP                       UDP
  ------------------------- ----------------------------
  Connection-oriented       Connectionless
  Reliable                  Best-effort
  Ordered                   No ordering guarantee
  Retransmission            No built-in retransmission
  Flow/congestion control   No TCP-style mechanisms
  Higher overhead           Lower overhead

## ICMP

Used for IP diagnostics and error reporting.

Examples:

``` text
ping
traceroute
tracert
```

------------------------------------------------------------------------

# 7. DNS

**Domain Name System** translates names into IP/service information.

``` text
app.example.com
       ↓
DNS Resolver
       ↓
203.0.113.10
```

## DNS hierarchy

``` text
Root
 ↓
TLD
 ↓
Authoritative DNS
 ↓
Zone
```

## Record types

  Record      Purpose
  ----------- -------------------------------------
  A           IPv4 address
  AAAA        IPv6 address
  CNAME       Alias
  MX          Mail exchanger
  NS          Name server
  SOA         Zone authority
  TXT         Text/verification/policy
  PTR         Reverse DNS
  SRV         Service location
  CAA         Certificate authority authorization
  DS/DNSKEY   DNSSEC

## Resolver vs Authoritative Server

**Recursive resolver:** finds answers for clients and caches them.

**Authoritative server:** provides authoritative answers for zones it
serves.

## DNS resolution

``` text
Client
 ↓
Recursive Resolver
 ↓
Root
 ↓
TLD
 ↓
Authoritative Server
 ↓
Answer
```

Caching may skip most of the hierarchy.

## TTL

Time To Live controls DNS caching duration.

``` text
TTL = 300 seconds
```

## Reverse DNS

``` text
IP → hostname
```

IPv4 uses `in-addr.arpa`; IPv6 uses `ip6.arpa`.

## Split-horizon DNS

Different answers for different clients/networks.

``` text
Internal → 10.0.1.10
External → Public IP
```

## DNSSEC

Adds cryptographic authentication/integrity to DNS data. It does not
encrypt ordinary DNS queries.

------------------------------------------------------------------------

# 8. DHCP

Automatically provides:

``` text
IP address
Subnet mask/prefix
Default gateway
DNS servers
Lease
```

## DORA

``` text
Discover
Offer
Request
ACK
```

Typical ports:

``` text
UDP 67 Server
UDP 68 Client
```

## DHCP Relay

Forwards DHCP traffic between clients and servers across routed
networks.

------------------------------------------------------------------------

# 9. ARP & IPv6 Neighbor Discovery

## ARP

Maps IPv4 address to MAC address on the local link.

``` text
Who has 192.168.1.20?
        ↓
192.168.1.20 is at AA:BB:CC:DD:EE:FF
```

## IPv6 Neighbor Discovery

Uses ICMPv6 instead of ARP.

Important messages:

-   Neighbor Solicitation
-   Neighbor Advertisement
-   Router Solicitation
-   Router Advertisement

------------------------------------------------------------------------

# 10. Routing

Routing determines the next hop/path for packets.

## Route entry

``` text
Destination
Prefix
Next Hop
Interface
Metric
Protocol
```

## Default route

``` text
IPv4: 0.0.0.0/0
IPv6: ::/0
```

## Longest Prefix Match

The most-specific matching prefix wins.

``` text
10.0.0.0/8
10.1.0.0/16
10.1.10.0/24
```

For `10.1.10.50`, `/24` wins.

## Static routing

Manually configured.

## Dynamic routing

Learned through routing protocols.

### OSPF

Link-state IGP.

Terms:

-   Area
-   LSA
-   SPF
-   Cost
-   Area 0

### BGP

Inter-domain routing protocol.

Terms:

-   Autonomous System
-   AS number
-   Prefix
-   Peering
-   Path attributes
-   Route policy

### RIP

Distance-vector protocol using hop count; maximum usable hop count is
15.

### IS-IS

Link-state routing protocol common in large/service-provider networks.

### ECMP

**Equal-Cost Multi-Path** allows multiple equal-cost routes to be used.

------------------------------------------------------------------------

# 11. NAT & PAT

## NAT

Translates IP addresses.

### SNAT

Changes source address.

``` text
Private → Public
```

### DNAT

Changes destination address.

``` text
Public:443 → Private:443
```

### PAT

Maps multiple private connections through a public IP using ports.

``` text
10.0.0.10:50000 → PublicIP:40001
10.0.0.11:50000 → PublicIP:40002
```

Also called NAT overload.

------------------------------------------------------------------------

# 12. VLAN, Trunking & STP

``` text
VLAN 10 → Web
VLAN 20 → App
VLAN 30 → DB
```

### Inter-VLAN routing

A Layer-3 device routes between VLANs.

``` text
VLAN 10 ─┐
         ├─ L3 Router/Switch
VLAN 20 ─┘
```

### 802.1Q

VLAN tagging standard used on Ethernet trunks.

### STP

Prevents Layer-2 loops.

### RSTP

Rapid Spanning Tree Protocol.

### MSTP

Multiple Spanning Tree Protocol.

------------------------------------------------------------------------

# 13. MTU, MSS & PMTUD

## MTU

Maximum Transmission Unit.

Common Ethernet IP MTU:

``` text
1500 bytes
```

## Jumbo frames

Often around:

``` text
9000-byte MTU
```

End-to-end support is required.

## MSS

Maximum TCP payload segment size.

Typical IPv4 example:

``` text
MTU 1500
- IPv4 header 20
- TCP header 20
= MSS 1460
```

Options can reduce the actual MSS.

## PMTUD

Path MTU Discovery finds a packet size that can traverse the path.

Important troubleshooting symptom:

> Small packets work but large packets fail.

Possible cause:

``` text
MTU / PMTUD / ICMP filtering
```

------------------------------------------------------------------------

# 14. Performance, QoS & Throttling

## Bandwidth

Theoretical/provisioned capacity.

## Throughput

Actual transfer rate.

## Goodput

Useful application data after accounting for protocol
overhead/retransmissions.

## Latency

Delay.

## RTT

Round Trip Time.

## Jitter

Variation in delay.

## Packet loss

Packets not successfully delivered.

## QoS

Quality of Service.

Mechanisms:

-   Classification
-   Marking
-   Queuing
-   Scheduling
-   Policing
-   Shaping
-   Congestion avoidance

## Throttling

Intentionally limits resource/traffic usage.

Example:

``` text
Maximum = 100 Mbps
```

## Rate limiting

Restricts traffic/request rate.

Example:

``` text
100 requests/second
```

Common algorithms:

-   Token bucket
-   Leaky bucket
-   Fixed window
-   Sliding window

## Traffic shaping

Buffers/delays traffic to conform to a target rate.

## Traffic policing

Drops/marks traffic exceeding a configured rate rather than buffering it
like shaping.

## Flow control

Protects the receiver from being overwhelmed.

## Congestion control

Controls sender behavior based on network congestion.

TCP concepts:

``` text
Slow Start
Congestion Avoidance
Fast Retransmit
Fast Recovery
Congestion Window
```

------------------------------------------------------------------------

# 15. Firewalls, ACLs & Proxies

## Firewall types

-   Stateless
-   Stateful
-   Layer 3/4
-   Layer 7 / application-aware

## ACL

Controls traffic using rules:

``` text
Source
Destination
Protocol
Port
Direction
Action
Priority
```

Example:

``` text
ALLOW TCP 443 from 10.0.1.0/24
DENY  TCP 22  from Internet
```

## Forward proxy

``` text
Client → Proxy → Internet
```

Used for:

-   Egress control
-   Caching
-   Filtering
-   Identity

## Reverse proxy

``` text
Client → Reverse Proxy → Backend
```

Used for:

-   TLS termination
-   Routing
-   Load balancing
-   Caching
-   Security

## Security Group / NSG concept

Cloud workload-level network filtering.

------------------------------------------------------------------------

# 16. Load Balancing

## L4

Uses:

``` text
IP + TCP/UDP + Port
```

## L7

Can inspect:

``` text
Host
Path
Headers
Cookies
HTTP method
```

## Algorithms

-   Round Robin
-   Weighted Round Robin
-   Least Connections
-   IP Hash
-   Consistent Hashing

## Health check

``` text
GET /health
200 → Healthy
```

## Common architecture

``` text
Client
  ↓
Load Balancer
  ├── App 1
  ├── App 2
  └── App 3
```

------------------------------------------------------------------------

# 17. TLS, HTTPS & PKI

## TLS provides

-   Confidentiality
-   Integrity
-   Authentication

## HTTPS

``` text
HTTP + TLS
```

Default:

``` text
TCP 443
```

## TLS concepts

-   ClientHello
-   ServerHello
-   Certificate
-   Key exchange
-   Session keys
-   Encrypted application data

## PKI

Public Key Infrastructure.

Terms:

-   Public/private key
-   Certificate
-   CA
-   Root CA
-   Intermediate CA
-   Certificate chain
-   SAN
-   CRL
-   OCSP

## mTLS

Mutual TLS:

``` text
Client certificate ↔ Server certificate
```

Both sides authenticate.

------------------------------------------------------------------------

# 18. VPN & Zero Trust

## VPN types

### Site-to-Site

``` text
Office ↔ VPN ↔ Cloud
```

### Remote Access

``` text
User ↔ VPN ↔ Corporate Network
```

## IPsec

VPN/security protocol suite.

Common IKE/NAT-T ports:

``` text
UDP 500
UDP 4500
```

## WireGuard

Modern VPN protocol.

## Zero Trust

Core principles:

``` text
Verify explicitly
Least privilege
Assume breach
Continuous evaluation
```

------------------------------------------------------------------------

# 19. Security & DDoS

## CIA Triad

``` text
Confidentiality
Integrity
Availability
```

## IDS

Detects suspicious activity.

## IPS

Detects and can block suspicious traffic.

## WAF

Protects web applications.

## SIEM

Collects/correlates security events.

## DDoS

Distributed Denial of Service.

Types:

-   Volumetric
-   Protocol
-   Application-layer

Mitigation:

-   Rate limiting
-   WAF
-   DDoS protection
-   CDN
-   Anycast
-   Filtering
-   Autoscaling
-   Capacity planning

------------------------------------------------------------------------

# 20. Protocols & Important Ports

  Protocol          Purpose                       Common port
  ----------------- ----------------------------- --------------
  FTP               File transfer                 21/TCP
  SSH/SFTP          Secure remote/file transfer   22/TCP
  Telnet            Remote terminal               23/TCP
  SMTP              Mail transfer                 25/TCP
  DNS               Name resolution               53/UDP,TCP
  DHCP              IP configuration              67/68 UDP
  TFTP              Simple file transfer          69/UDP
  HTTP              Web                           80/TCP
  Kerberos          Authentication                88/TCP,UDP
  POP3              Mail retrieval                110/TCP
  NTP               Time                          123/UDP
  IMAP              Mail retrieval                143/TCP
  SNMP              Monitoring                    161/UDP
  BGP               Routing                       179/TCP
  LDAP              Directory                     389/TCP,UDP
  HTTPS             Secure web                    443/TCP
  SMB               Windows file sharing          445/TCP
  SMTPS             SMTP TLS                      465/TCP
  Syslog            Logging                       514
  SMTP Submission   Mail submission               587/TCP
  LDAPS             LDAP TLS                      636/TCP
  IMAPS             IMAP TLS                      993/TCP
  POP3S             POP3 TLS                      995/TCP
  MS SQL            Database                      1433/TCP
  NFS               File sharing                  2049
  RDP               Remote Desktop                3389/TCP,UDP
  MySQL             Database                      3306/TCP
  PostgreSQL        Database                      5432/TCP
  Redis             Cache                         6379/TCP
  Kubernetes API    Kubernetes API                6443/TCP

> Ports are defaults/common assignments; services can be configured
> differently.

------------------------------------------------------------------------

# 21. Cloud Networking

Core concepts:

``` text
VPC/VNet
Subnets
Route Tables
Security Groups / NSGs
Network ACLs
NAT Gateway
Internet Gateway
Load Balancer
Private Endpoint
DNS
VPN
Direct/Private Connectivity
Transit Networking
Flow Logs
Firewall
```

## Public subnet

A subnet with routing/security configuration that permits
public-internet connectivity for appropriate resources.

## Private subnet

Common architecture term for a subnet without direct public-internet
routing.

## Transit networking

Central connectivity:

``` text
VPC1 ─┐
VPC2 ─┼─ Transit Hub ── On-Prem
VPC3 ─┘
```

## AWS mapping

  Concept                  AWS
  ------------------------ ---------------------------
  Virtual network          VPC
  Network filtering        Security Group
  Subnet ACL               Network ACL
  Internet access          Internet Gateway
  Managed outbound NAT     NAT Gateway
  DNS                      Route 53
  L4 load balancer         Network Load Balancer
  L7 load balancer         Application Load Balancer
  Private service access   PrivateLink/VPC Endpoint
  VPC connectivity         VPC Peering
  Transit                  Transit Gateway
  Private connectivity     Direct Connect
  VPN                      Site-to-Site VPN
  Traffic metadata         VPC Flow Logs

## Azure mapping

  Concept                  Azure
  ------------------------ ---------------------------------------------
  Virtual network          VNet
  Network filtering        NSG
  Managed firewall         Azure Firewall
  L4 load balancer         Azure Load Balancer
  L7 gateway               Application Gateway
  Global HTTP routing      Front Door
  DNS                      Azure DNS
  Private service access   Private Endpoint/Private Link
  VNet connectivity        VNet Peering
  Transit                  Virtual WAN / Hub-Spoke
  Private connectivity     ExpressRoute
  VPN                      VPN Gateway
  Traffic metadata         Network Watcher / flow logging capabilities

------------------------------------------------------------------------

# 22. Kubernetes & Container Networking

## Kubernetes

Common model:

``` text
Pod → Pod
Pod → Service → Pod
Internet → Ingress/Gateway → Service → Pod
```

### Service types

-   ClusterIP
-   NodePort
-   LoadBalancer
-   ExternalName

### NetworkPolicy

Controls Pod traffic.

``` text
Frontend → Backend = Allow
Frontend → DB      = Deny
Backend  → DB      = Allow
```

## Docker

Bridge:

``` text
Container → Docker Bridge → Host
```

Port publishing:

``` bash
docker run -p 8080:80 nginx
```

Means:

``` text
Host:8080 → Container:80
```

------------------------------------------------------------------------

# 23. Troubleshooting Methodology

Use a layered approach:

``` text
Physical
 ↓
Link
 ↓
IP
 ↓
Routing
 ↓
DNS
 ↓
Port
 ↓
Firewall
 ↓
TLS
 ↓
Application
```

## Scenario: IP works, hostname fails

``` bash
ping 8.8.8.8
dig example.com
```

Likely DNS issue.

## Scenario: DNS works, HTTPS fails

``` bash
nc -vz example.com 443
curl -v https://example.com
```

Check:

-   Firewall
-   Routing
-   Proxy
-   TLS
-   Load balancer
-   Backend

## Connection refused

Usually destination is reachable but no service accepts the connection,
or a device actively rejects it.

``` bash
ss -lntup
sudo lsof -i :443
```

## Connection timeout

Investigate:

-   Routing
-   Firewall drops
-   Security group/NSG
-   Service health
-   Wrong IP
-   ACL
-   Load balancer

## HTTP 429

``` text
Too Many Requests
```

Usually indicates rate limiting/quota/throttling.

Check:

-   API gateway
-   Application limiter
-   Cloud quota
-   `Retry-After`
-   Client retry/backoff

## HTTP 502

Often proxy/gateway cannot obtain a valid upstream response.

## HTTP 504

Often gateway/proxy timed out waiting for upstream.

------------------------------------------------------------------------

# 24. Linux Commands

> Prefer modern `ip`, `ss`, `nft`, and NetworkManager tools on current
> Linux systems. Legacy commands remain useful on older systems.

## Interfaces / IP

``` bash
ip addr
ip a
ip link
ip link show dev eth0
ip -br addr
ip -s link
```

Add/remove address:

``` bash
sudo ip addr add 10.0.1.10/24 dev eth0
sudo ip addr del 10.0.1.10/24 dev eth0
```

Bring interface up/down:

``` bash
sudo ip link set eth0 up
sudo ip link set eth0 down
```

## Routes

``` bash
ip route
ip route show
ip route get 8.8.8.8
sudo ip route add 10.0.2.0/24 via 10.0.1.1
sudo ip route del 10.0.2.0/24
```

## ARP/Neighbors

``` bash
ip neigh
sudo ip neigh flush dev eth0
```

Legacy:

``` bash
arp -n
```

## Sockets

``` bash
ss -lnt
ss -lntu
sudo ss -lntup
ss -nt
```

Legacy:

``` bash
netstat -tulpn
```

## Processes using ports

``` bash
sudo lsof -i :443
sudo lsof -iTCP:443 -sTCP:LISTEN
```

## Ping

``` bash
ping 8.8.8.8
ping -c 4 example.com
```

## Traceroute

``` bash
traceroute example.com
```

If unavailable:

``` bash
tracepath example.com
```

## DNS

``` bash
dig example.com
dig A example.com
dig AAAA example.com
dig MX example.com
dig TXT example.com
dig NS example.com
dig SOA example.com
dig -x 8.8.8.8
dig @1.1.1.1 example.com
dig +short example.com
dig +trace example.com
host example.com
nslookup example.com
```

systemd-resolved:

``` bash
resolvectl status
resolvectl query example.com
```

## HTTP/TLS

``` bash
curl -I https://example.com
curl -v https://example.com
curl -vk https://example.com
```

TLS:

``` bash
openssl s_client -connect example.com:443 -servername example.com
```

## Port testing

``` bash
nc -vz example.com 443
nc -vz 10.0.1.10 22
```

## Interface statistics

``` bash
ip -s link
```

## NetworkManager

``` bash
nmcli connection show
nmcli device status
nmcli connection show --active
nmcli device show eth0
```

## Hostname

``` bash
hostname
hostnamectl
```

## Local name resolution

``` bash
cat /etc/hosts
cat /etc/resolv.conf
getent hosts example.com
```

> On many modern Linux systems, `/etc/resolv.conf` may be generated or
> symlinked by NetworkManager/systemd-resolved.

------------------------------------------------------------------------

# 25. Windows CMD Commands

## IP configuration

``` cmd
ipconfig
ipconfig /all
ipconfig /release
ipconfig /renew
ipconfig /flushdns
ipconfig /displaydns
ipconfig /registerdns
```

## Connectivity

``` cmd
ping 8.8.8.8
ping -t 8.8.8.8
```

## Route

``` cmd
route print
route add 10.0.2.0 mask 255.255.255.0 10.0.1.1
route -p add 10.0.2.0 mask 255.255.255.0 10.0.1.1
route delete 10.0.2.0
```

## DNS

``` cmd
nslookup example.com
nslookup example.com 8.8.8.8
```

## ARP

``` cmd
arp -a
arp -d *
```

## Trace

``` cmd
tracert example.com
pathping example.com
```

## Ports

``` cmd
netstat -ano
netstat -ano | findstr LISTENING
netstat -ano | findstr :443
```

Find process by PID:

``` cmd
tasklist /FI "PID eq 1234"
```

## Windows network reset

``` cmd
netsh winsock show catalog
netsh interface ip show config
```

Use reset commands carefully and only when appropriate.

------------------------------------------------------------------------

# 26. Windows PowerShell Commands

## Configuration

``` powershell
Get-NetIPConfiguration
Get-NetIPAddress
Get-NetAdapter
Get-NetAdapterStatistics
```

## Routes

``` powershell
Get-NetRoute
Get-NetRoute -AddressFamily IPv4
Find-NetRoute -RemoteIPAddress 8.8.8.8
```

## DNS

``` powershell
Get-DnsClientServerAddress
Resolve-DnsName example.com
Clear-DnsClientCache
```

## Connectivity

``` powershell
Test-Connection 8.8.8.8
Test-NetConnection example.com
Test-NetConnection example.com -Port 443
Test-NetConnection example.com -Port 443 -InformationLevel Detailed
```

## TCP connections

``` powershell
Get-NetTCPConnection
Get-NetTCPConnection -State Listen
Get-NetTCPConnection -LocalPort 443
```

## UDP endpoints

``` powershell
Get-NetUDPEndpoint
```

## Firewall

``` powershell
Get-NetFirewallProfile
Get-NetFirewallRule
Get-NetFirewallRule | Where-Object Enabled -eq True
```

Create rule:

``` powershell
New-NetFirewallRule `
  -DisplayName "Allow HTTPS" `
  -Direction Inbound `
  -Protocol TCP `
  -LocalPort 443 `
  -Action Allow
```

Remove:

``` powershell
Remove-NetFirewallRule -DisplayName "Allow HTTPS"
```

## DNS server configuration

``` powershell
Set-DnsClientServerAddress `
  -InterfaceAlias "Ethernet" `
  -ServerAddresses 1.1.1.1,8.8.8.8
```

## Adapter

``` powershell
Disable-NetAdapter -Name "Ethernet" -Confirm:$false
Enable-NetAdapter -Name "Ethernet" -Confirm:$false
Restart-NetAdapter -Name "Ethernet"
```

------------------------------------------------------------------------

# 27. Packet Capture

## tcpdump

Capture:

``` bash
sudo tcpdump -ni any
```

Host:

``` bash
sudo tcpdump -ni any host 10.0.1.10
```

Port:

``` bash
sudo tcpdump -ni any port 443
```

TCP:

``` bash
sudo tcpdump -ni any tcp
```

UDP:

``` bash
sudo tcpdump -ni any udp
```

DNS:

``` bash
sudo tcpdump -ni any port 53
```

Write PCAP:

``` bash
sudo tcpdump -ni any -w capture.pcap
```

Read:

``` bash
tcpdump -r capture.pcap
```

Useful filters:

``` text
host 10.0.1.10
src host 10.0.1.10
dst host 10.0.1.10
port 443
tcp port 22
net 10.0.0.0/16
```

## Wireshark filters

``` text
dns
tcp
udp
icmp
tls
http
ip.addr == 10.0.1.10
tcp.port == 443
dns.qry.name == "example.com"
tcp.flags.syn == 1
tcp.flags.reset == 1
```

## tshark

``` bash
tshark -i eth0
tshark -r capture.pcap
```

## Windows pktmon

``` cmd
pktmon list
pktmon start --etw -p 0
pktmon stop
pktmon etl2txt PktMon.etl
```

For GUI analysis, Wireshark is commonly used.

------------------------------------------------------------------------

# 28. Firewall Commands

## UFW

``` bash
sudo ufw status
sudo ufw status verbose
sudo ufw allow 22/tcp
sudo ufw allow 443/tcp
sudo ufw deny 23/tcp
sudo ufw delete deny 23/tcp
```

## nftables

``` bash
sudo nft list ruleset
sudo nft list tables
```

## iptables

``` bash
sudo iptables -L -n -v
sudo iptables -t nat -L -n -v
```

> Modern distributions increasingly use nftables; `iptables` may be a
> compatibility layer.

## Windows

``` powershell
Get-NetFirewallProfile
Get-NetFirewallRule
```

Create:

``` powershell
New-NetFirewallRule `
  -DisplayName "Allow HTTPS" `
  -Direction Inbound `
  -Protocol TCP `
  -LocalPort 443 `
  -Action Allow
```

------------------------------------------------------------------------

# 29. Advanced Networking

## BGP

Internet-scale routing.

Key concepts:

``` text
AS
ASN
Prefix
Peering
eBGP
iBGP
Route Advertisement
Local Preference
AS_PATH
MED
Communities
Next Hop
Route Filtering
```

## OSPF

``` text
Router ID
Area
LSA
LSDB
SPF
DR/BDR
Cost
```

## VXLAN

Overlay networking technology that encapsulates Layer-2 frames over
Layer-3 networks.

Often associated with data-center overlays.

## EVPN

Control-plane technology commonly used with VXLAN overlays to distribute
endpoint/MAC/IP reachability.

## SDN

Software-Defined Networking separates/abstracts control and forwarding
functions and enables centralized/policy-driven network management.

## Overlay Network

Logical network built over an underlying network.

``` text
Application/Overlay
        ↓
Underlay IP Network
```

## Service Mesh

Provides service-to-service networking capabilities such as:

-   mTLS
-   Traffic routing
-   Retries
-   Timeouts
-   Observability
-   Policy

## Anycast

Same IP prefix/address advertised from multiple locations.

## Multicast

One-to-many delivery to subscribed receivers.

## ECMP

Uses multiple equal-cost paths.

## Reverse Path Filtering

Checks whether traffic arriving on an interface has a plausible return
route; commonly used as an anti-spoofing mechanism on Linux.

## Asymmetric Routing

Forward and return paths differ.

``` text
Client → Router A → Server
Server → Router B → Client
```

Can break stateful firewalls/load balancers.

## Hairpin NAT

Internal client accesses a service through the service's public/NAT
address and traffic is translated back internally.

## Split DNS

Internal and external DNS views provide different answers.

## Connection Pooling

Applications reuse TCP/TLS connections to reduce handshake overhead.

## Keep-Alive

Reuses persistent connections.

## Backpressure

Downstream capacity signals upstream components to slow down.

## Circuit Breaker

Stops repeated calls to an unhealthy dependency and allows recovery.

## Retry with Exponential Backoff + Jitter

Useful for transient failures and throttling:

``` text
Attempt 1 → wait
Attempt 2 → longer wait + random jitter
Attempt 3 → longer wait + random jitter
```

Do not blindly retry non-idempotent operations.

------------------------------------------------------------------------

# 30. Interview Checklist

## ⭐ Fundamentals

-   [ ] OSI model
-   [ ] TCP/IP model
-   [ ] MAC vs IP
-   [ ] IPv4 vs IPv6
-   [ ] Private/public IP
-   [ ] Subnetting
-   [ ] CIDR
-   [ ] Default gateway
-   [ ] Ports
-   [ ] DNS
-   [ ] DHCP
-   [ ] ARP

## ⭐ Intermediate

-   [ ] TCP handshake
-   [ ] TCP flags
-   [ ] TCP vs UDP
-   [ ] Flow control
-   [ ] Congestion control
-   [ ] Routing table
-   [ ] Longest prefix match
-   [ ] NAT/PAT
-   [ ] SNAT/DNAT
-   [ ] VLAN
-   [ ] Trunk
-   [ ] STP
-   [ ] LACP
-   [ ] Firewall
-   [ ] ACL
-   [ ] Proxy/reverse proxy
-   [ ] Load balancing
-   [ ] TLS/HTTPS
-   [ ] VPN

## ⭐ Advanced

-   [ ] BGP
-   [ ] OSPF
-   [ ] ECMP
-   [ ] Anycast
-   [ ] Multicast
-   [ ] VXLAN
-   [ ] EVPN
-   [ ] SDN
-   [ ] Overlay/underlay
-   [ ] MTU/MSS/PMTUD
-   [ ] QoS
-   [ ] Traffic shaping
-   [ ] Traffic policing
-   [ ] Rate limiting
-   [ ] Throttling
-   [ ] DDoS
-   [ ] Zero Trust
-   [ ] Microsegmentation
-   [ ] mTLS
-   [ ] DNSSEC
-   [ ] Service mesh
-   [ ] Asymmetric routing

------------------------------------------------------------------------

# 🚀 Cloud/DevOps Networking Learning Path

``` text
Networking Fundamentals
        ↓
OSI + TCP/IP
        ↓
Ethernet + MAC
        ↓
IPv4 + IPv6
        ↓
Subnetting + CIDR
        ↓
ARP + Neighbor Discovery
        ↓
DNS + DHCP
        ↓
TCP + UDP
        ↓
Ports + Sockets
        ↓
Routing
        ↓
VLAN + Switching
        ↓
NAT
        ↓
Firewall + ACL
        ↓
Load Balancing
        ↓
Proxy + Reverse Proxy
        ↓
TLS + HTTPS
        ↓
VPN
        ↓
Network Monitoring
        ↓
Packet Capture
        ↓
QoS + Throttling
        ↓
BGP + OSPF
        ↓
AWS VPC / Azure VNet
        ↓
Kubernetes Networking
        ↓
Advanced Architecture
```

## The packet-flow mental model

``` text
DNS
 ↓
Public/Private IP
 ↓
Route Table
 ↓
Gateway
 ↓
Firewall / ACL / Security Group
 ↓
NAT (if applicable)
 ↓
Load Balancer / Reverse Proxy
 ↓
Target Port
 ↓
Application
 ↓
Database / Dependency
```

## Golden troubleshooting sequence

``` text
1. Interface up?
2. IP configured?
3. Correct subnet?
4. Correct default gateway?
5. Route exists?
6. DNS resolves?
7. Destination IP reachable?
8. Destination port reachable?
9. Firewall/ACL allows it?
10. Service listening?
11. TLS handshake succeeds?
12. Application returns expected response?
13. Are latency/loss/throttling/congestion involved?
14. Is the return path correct?
```

> **Core principle:** learn networking as a packet journey, not as a
> list of commands. Once IP addressing, subnetting, routing, DNS,
> TCP/UDP, NAT, firewalls, TLS and load balancing are clear, AWS VPC,
> Azure VNet, Kubernetes networking and cloud troubleshooting become
> much easier.
