# 🛠️ Linux Troubleshooting Runbook

> **Target Service:** SSH (`ssh.service`)  
> **Goal:** Check system health, network, service status, and logs.

---

## 1. 🖥️ Environment Basics

### Check system information

```bash
uname -a
```

**Meaning:** Shows Linux kernel, hostname, architecture, and system information.

**What we got:** Confirmed the Linux kernel and system architecture.

### Check Linux distribution

```bash
cat /etc/os-release
```

**Meaning:** Shows the Linux distribution and version.

**What we got:** Confirmed the system is running Ubuntu.

---

## 2. 📁 Filesystem Sanity

### Create a test folder

```bash
mkdir /tmp/runbook-demo
```

**Meaning:** Creates a temporary folder for testing.

**What we got:** Folder was created successfully.

### Copy and verify a file

```bash
cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo
```

**Meaning:** Copies `/etc/hosts` and checks that the copy exists.

**What we got:** File was copied successfully.

---

## 3. ⚙️ CPU & Memory

### Check processes

```bash
ps -o pid,pcpu,pmem,comm
```

**Meaning:** Shows process ID, CPU usage, memory usage, and process name.

**What we got:** Checked running processes and their resource usage.

### Check memory

```bash
free -h
```

**Meaning:** Shows RAM and swap usage.

**What we got:** Checked available, used, and cached memory.

---

## 4. 💾 Disk

### Check disk space

```bash
df -h
```

**Meaning:** Shows used and available disk space.

**What we got:** Checked whether enough disk space is available.

### Check log directory size

```bash
du -sh /var/log
```

**Meaning:** Shows the total size of `/var/log`.

**What we got:** Checked whether logs are consuming too much disk space.

---

## 5. 🌐 Network

### Check listening ports

```bash
ss -tulpn
```

**Meaning:** Shows ports currently listening for network connections.

**What we got:** Checked whether SSH is listening on port `22`.

### Test SSH port

```bash
curl -v telnet://localhost:22
```

**Meaning:** Tests whether port `22` is reachable locally.

**What we got:** Verified SSH port connectivity.

---

## 6. 📋 SSH Service

### Check SSH status

```bash
sudo systemctl status ssh
```

**Meaning:** Shows the current status of the SSH service.

**What we got:** Confirmed whether SSH is running.

### Check whether SSH is active

```bash
systemctl is-active ssh
```

**Meaning:** Checks whether SSH is currently running.

**Expected output:**

```text
active
```

### Check whether SSH is enabled

```bash
systemctl is-enabled ssh
```

**Meaning:** Checks whether SSH is configured to start automatically when Linux boots.

**Expected output:**

```text
enabled
```

---

## 7. 📜 SSH Logs

### View recent SSH logs

```bash
sudo journalctl -u ssh -n 50
```

**Meaning:** Shows the latest 50 log entries for the SSH service.

**What we got:** Logs showed SSH starting successfully and listening on port `22`.

### Follow SSH logs in real time

```bash
sudo journalctl -u ssh -f
```

**Meaning:** Continuously displays new SSH log entries as they happen.

**Use:** Helpful when troubleshooting a service while reproducing a problem.

Press `Ctrl + C` to stop following the logs.

---

## 🚨 If This Worsens

If SSH starts failing or behaving unexpectedly:

### 1. Check service status

```bash
sudo systemctl status ssh
```

Look for errors or a `failed` state.

### 2. Restart SSH

```bash
sudo systemctl restart ssh
```

Restart the service if it is stuck or not responding.

### 3. Check detailed logs and port

```bash
sudo journalctl -u ssh -n 100
ss -tulpn | grep :22
```

Use the logs to find the cause and check whether SSH is listening on port `22`.

---

## 🔄 Troubleshooting Flow

```text
System Check
     ↓
CPU & Memory
     ↓
Disk
     ↓
Network
     ↓
Service Status
     ↓
Logs
     ↓
Take Action
     ↓
Verify Again
```

> **Key idea:** Troubleshoot step-by-step instead of randomly running commands.
