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


## 1. Identity – Find IP

### Command

    hostname -I

**Observation:** Shows the private IP address of the EC2 instance.

<img width="308" height="33" alt="Rat-one" src="https://github.com/user-attachments/assets/4e8a535f-4232-4ed5-8e3f-04046b3f2b2a" />

## 2. Reachability – Ping

Command: `ping -c 4 google.com`

**Observation:** Checks connectivity and shows packet loss and response time.

<img width="695" height="150" alt="rat-two" src="https://github.com/user-attachments/assets/151b404c-5273-4132-96a5-ed4f51127c93" />

## 3. Path – Tracepath

Command: `tracepath 1.1.1.1`

**Observation:** Shows the network path to the target and the hops between the EC2 instance and the destination.

<img width="605" height="185" alt="rat-3" src="https://github.com/user-attachments/assets/d5419bfc-663b-4cab-a2f8-cdf009760c9e" />

## 4. Ports – Listening Services

Command: `ss -tulpn`

**Observation:** Shows the services listening on network ports. Port 22 is used by SSH and port 80 is used by Nginx.

<img width="905" height="217" alt="rat-4" src="https://github.com/user-attachments/assets/16c4d413-621e-4006-9d51-1669219e0748" />

## 5. DNS – Name Resolution

Command: `dig google.com`

**Observation:** Resolves the domain name to its IP address and confirms DNS is working.

<img width="556" height="304" alt="rat-5" src="https://github.com/user-attachments/assets/f368792d-48e5-4371-912c-cdec53bd0a06" />

## 6. HTTP – Check Nginx

Command: `curl -I http://localhost`

**Observation:** Checks the HTTP response from the Nginx web server running on the EC2 instance.

<img width="455" height="156" alt="rat-6" src="https://github.com/user-attachments/assets/02e2e16f-dfac-48c7-82a2-0f5f47f4326c" />

## 7. Connections Snapshot

Command: `netstat -an | head`

**Observation:** Shows a quick snapshot of listening and active network connections.

<img width="629" height="166" alt="rat-10" src="https://github.com/user-attachments/assets/5d6b9d19-ba8d-448b-8e7a-9792a54a045a" />

## 8. Port Probe

Command: `nc -zv localhost 80`

**Meaning:**
- `nc` → Netcat, a network connection testing tool.
- `-z` → Check the port without sending data.
- `-v` → Show detailed connection information.

**Observation:** Tests whether port 80 is reachable on the local EC2 instance.

<img width="517" height="31" alt="rat8" src="https://github.com/user-attachments/assets/845cf207-c9ac-4460-a1cb-de2187fd7123" />

## 📝 Reflection

### Which command gives the fastest signal when something is broken?

**`ping -c 4 google.com`**

It quickly checks reachability, latency, and packet loss.

---

### What layer would you inspect next?

**If DNS fails:**

- OSI → Layer 7 (Application)
- TCP/IP → Application Layer
- Command → `dig google.com`

**If HTTP 500 appears:**

- OSI → Layer 7 (Application)
- TCP/IP → Application Layer
- Check Nginx status → `systemctl status nginx`
- Check configuration → `sudo nginx -t`
- Check error logs → `sudo tail -n 50 /var/log/nginx/error.log`

---

### Two follow-up checks in a real incident

**1. Check service status**

`systemctl status nginx`

**2. Check listening ports**

`ss -tulpn`

## 🔧 Commands Used on Day 14

| Command | Purpose |
|---|---|
| `hostname -I` | Find private IP |
| `curl -4 ifconfig.me` | Find public IP |
| `ping -c 4 google.com` | Check network reachability |
| `tracepath 1.1.1.1` | Check network path |
| `ss -tulpn` | Check listening ports |
| `dig google.com` | Check DNS resolution |
| `curl -I http://localhost` | Check Nginx HTTP response |
| `netstat -an \| head` | View network connections |
| `nc -zv localhost 80` | Test port 80 |
| `systemctl status nginx` | Check Nginx status |
| `sudo nginx -t` | Check Nginx configuration |
| `sudo tail -n 50 /var/log/nginx/error.log` | Check Nginx error logs |

---

## 🔗 TCP Three-Way Handshake

**TCP** works at the **Transport Layer (Layer 4)**.

Before TCP communication starts, the client and server establish a connection.

1. **SYN** → Client requests a connection.
2. **SYN-ACK** → Server accepts the request.
3. **ACK** → Client confirms the connection.

```text
Client                         Server

   | -------- SYN ------------> |
   | <------ SYN-ACK ---------- |
   | -------- ACK ------------> |
   |                            |
   |    Connection established  |


