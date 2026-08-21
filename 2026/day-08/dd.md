# Day 08 – Cloud Server Setup: Docker, Nginx & Web Deployment

## Part 1: Launch Cloud Instance & SSH Access

### Step 1: Created Ubuntu EC2 Instance

* Created an Ubuntu EC2 instance in AWS.
* Configured Security Group for SSH connection **Port 22**.

### Step 2: Connect via SSH

```bash
ssh -i "devops-ai-powered-key.pem" ubuntu@PUBLIC_IP
```

*Connected to the AWS EC2 instance using SSH.*

---

## Part 2: Install Docker & Nginx

### Step 1: Update System

```bash
sudo apt update
sudo apt upgrade -y
```

### Step 2: Install Docker

```bash
sudo apt install docker.io -y
docker --version
sudo systemctl status docker
```

*Docker was installed and running.*

### Step 3: Install Nginx

```bash
sudo apt install nginx -y
sudo systemctl status nginx
```

*Nginx was installed and running.*

Test Nginx:

```bash
curl http://localhost
```

---

## Part 3: Security Group Configuration

* Allowed **SSH Port 22** for server access.
* Allowed **HTTP Port 80** for web access.

```text
SSH  → TCP 22 → My IP
HTTP → TCP 80 → Anywhere
```

### Test Web Access

Opened:

```text
http://PUBLIC_IP
```

*Nginx welcome page was displayed successfully.*

---

## Part 4: Extract Nginx Logs

### Step 1: View Nginx Logs

```bash
journalctl -u nginx
```

*Shows Nginx service logs.*

```bash
sudo tail -n 20 /var/log/nginx/access.log
```

*Shows the latest Nginx access logs.*

### Step 2: Save Logs to File

```bash
sudo cp /var/log/nginx/access.log ~/nginx-logs.txt
```

*Copies Nginx logs to a file.*

```bash
sudo chown ubuntu:ubuntu nginx-logs.txt
```

*Changes the file owner to ubuntu.*

```bash
cat nginx-logs.txt
```

*Displays the saved logs.*

### Step 3: Download Log File

From local WSL:

```bash
scp -i devops-ai-powered-key.pem ubuntu@PUBLIC_IP:~/nginx-logs.txt .
```

*Downloads the log file from EC2 to the local machine.*

```bash
ls
```

*Verified that `nginx-logs.txt` was downloaded.*

---

## Commands Used

```bash
ssh -i "devops-ai-powered-key.pem" ubuntu@PUBLIC_IP

sudo apt update
sudo apt upgrade -y

sudo apt install docker.io -y
docker --version
sudo systemctl status docker

sudo apt install nginx -y
sudo systemctl status nginx
curl http://localhost

journalctl -u nginx
sudo tail -n 20 /var/log/nginx/access.log

sudo cp /var/log/nginx/access.log ~/nginx-logs.txt
sudo chown ubuntu:ubuntu nginx-logs.txt
cat nginx-logs.txt

scp -i devops-ai-powered-key.pem ubuntu@PUBLIC_IP:~/nginx-logs.txt .
```

## What I Learned

* AWS EC2
* SSH and Port 22
* Docker
* Nginx
* HTTP Port 80
* Security Groups
* Nginx Logs
* SCP File Transfer

## Day 08 Flow

```text
Local Machine
     ↓
SSH Port 22
     ↓
AWS EC2
     ↓
Security Group
     ↓
Nginx
     ↓
HTTP Port 80
     ↓
Web Browser
     ↓
Nginx Logs
     ↓
nginx-logs.txt
     ↓
SCP
     ↓
Local Machine
```
