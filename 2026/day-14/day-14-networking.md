# Day 14 – Networking Fundamentals & Hands-on Checks

## 🎯 Goal

Understand basic networking concepts and practice common commands used for troubleshooting.

## 🧠 OSI vs TCP/IP Models

| OSI Layer | OSI Layer Name | TCP/IP Layer | Main Purpose | Examples |
|---:|---|---|---|---|
| **7** | Application | Application | Provides network services to applications | HTTP, HTTPS, DNS, SSH |
| **6** | Presentation | Application | Data format, encryption, compression | SSL/TLS, JSON, JPEG |
| **5** | Session | Application | Establishes and manages communication sessions | Session management |
| **4** | Transport | Transport | End-to-end communication and reliability | TCP, UDP |
| **3** | Network | Internet | IP addressing and routing | IP, ICMP |
| **2** | Data Link | Link | Local network communication and MAC addressing | Ethernet, ARP |
| **1** | Physical | Link | Transmits raw bits over physical media | Cables, Wi-Fi signals |

### 🔗 Simple Mapping

**OSI**

`7 → 6 → 5 → 4 → 3 → 2 → 1`

**TCP/IP**

`Application → Transport → Internet → Link`

### 📌 Protocol Placement

| Protocol | Layer | Purpose |
|---|---|---|
| **HTTP/HTTPS** | Application | Web communication |
| **DNS** | Application | Domain name → IP address |
| **SSH** | Application | Remote server access |
| **TCP/UDP** | Transport | Data delivery |
| **IP** | Network / Internet | Addressing and routing |
| **ICMP** | Network / Internet | Network diagnostics |
| **Ethernet** | Data Link / Link | Local network communication |
