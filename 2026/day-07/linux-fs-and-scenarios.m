# Day 07 – Linux File System Hierarchy & Scenario-Based Practice

# Part 1: Linux File System Hierarchy

| Directory  | Simple Meaning                      | Example                       |
| ---------- | ----------------------------------- | ----------------------------- |
| `/`        | Starting point of Linux file system | `/home`, `/etc`, `/var`       |
| `/home`    | Stores normal users' files          | `/home/jacksonlop`            |
| `/root`    | Home directory of root user         | `.bashrc`, `.ssh`             |
| `/etc`     | Stores configuration files          | `hostname`, `passwd`, `hosts` |
| `/var/log` | Stores system and service logs      | `auth.log`, `syslog`          |
| `/tmp`     | Stores temporary files              | Temporary files               |
| `/bin`     | Essential Linux commands            | `ls`, `cp`, `mv`, `cat`       |
| `/usr/bin` | User commands and programs          | `python3`, `mkdir`, `vim`     |
| `/opt`     | Third-party or optional software    | Custom applications           |

---

# Hands-on Practice

### Find large log files

```bash
du -sh /var/log/* 2>/dev/null | sort -h | tail -5
```

*Finds the 5 largest files/directories in `/var/log`.*

### Check hostname

```bash
cat /etc/hostname
```

*Shows the system hostname.*

### Check home directory

```bash
ls -la ~
```

*Shows all files and directories, including hidden files.*

---

# Part 2: Scenario-Based Practice

## Scenario 1 – Service Not Starting

*Problem: A service failed to start.*

### Step 1 – Check status

```bash
systemctl status myapp
```

*Checks if the service is running, stopped, or failed.*

### Step 2 – Check logs

```bash
journalctl -u myapp -n 50
```

*Shows the last 50 log entries.*

### Step 3 – Check boot setting

```bash
systemctl is-enabled myapp
```

*Checks if the service starts automatically after reboot.*

### Step 4 – Restart service

```bash
systemctl restart myapp
```

*Restarts the service after fixing the problem.*

### What I learned

*Check status → check logs → check if enabled → restart after fixing.*

---

# Scenario 2 – High CPU Usage

*Problem: The server is slow because a process may be using high CPU.*

### Step 1 – Check CPU

```bash
top
```

*Shows CPU usage and processes live.*

### Step 2 – Find high CPU process

```bash
ps aux --sort=-%cpu | head -10
```

*Shows processes using the most CPU.*

### Step 3 – Find PID

```bash
pgrep <process_name>
```

*Finds the PID of a process.*

### Step 4 – Stop process

```bash
kill -15 <PID>
```

*Gracefully stops the process if required.*

### If it does not stop

```bash
kill -9 <PID>
```

*Forcefully stops the process.*

### What I learned

*Find the high CPU process first, then investigate before stopping it.*

---

# Scenario 3 – Finding Service Logs

*Problem: Find the logs of a systemd service.*

### Step 1 – Check service

```bash
systemctl status docker
```

*Checks Docker service status.*

### Step 2 – View recent logs

```bash
journalctl -u docker -n 50
```

*Shows the last 50 Docker log entries.*

### Step 3 – Follow logs

```bash
journalctl -u docker -f
```

*Shows new logs in real time.*

*Press `Ctrl+C` to stop.*

### What I learned

*`journalctl -u <service>` is used to view logs of a systemd service.*

---

# Scenario 4 – File Permission Issue

*Problem: A script gives `Permission denied`.*

### Step 1 – Check permissions

```bash
ls -l backup.sh
```

*Checks the file permissions.*

### Step 2 – Try to run

```bash
./backup.sh
```

*Runs the script from the current directory.*

*If there is no `x` permission, it can give `Permission denied`.*

### Step 3 – Add execute permission

```bash
chmod +x backup.sh
```

*Adds execute permission.*

### Step 4 – Verify

```bash
ls -l backup.sh
```

*Checks if `x` permission was added.*

### Step 5 – Run again

```bash
./backup.sh
```

*Runs the script.*

### Important

```text
x = execute permission
./ = current directory
```

### What I learned

*Check permissions → add `x` permission → verify → run the script.*

---

# Quick Revision

| Command                               | Meaning                               |
| ------------------------------------- | ------------------------------------- |
| `ls -l`                               | Check file permissions                |
| `ls -la`                              | List all files including hidden files |
| `systemctl status`                    | Check service status                  |
| `systemctl is-enabled`                | Check if service starts at boot       |
| `systemctl list-units --type=service` | List loaded services                  |
| `journalctl -u`                       | View service logs                     |
| `top`                                 | Monitor CPU/processes                 |
| `ps aux --sort=-%cpu`                 | Find high CPU processes               |
| `pgrep`                               | Find process PID                      |
| `kill -15`                            | Gracefully stop process               |
| `kill -9`                             | Force stop process                    |
| `chmod +x`                            | Add execute permission                |
| `./script.sh`                         | Run a script                          |

---

# Summary

* Learned the Linux File System Hierarchy.
* Learned where configuration files, logs, commands, and user files are stored.
* Practiced service troubleshooting.
* Practiced finding high CPU processes.
* Practiced checking service logs.
* Practiced fixing file permission problems.
* Learned `pgrep`, `kill -15`, `chmod +x`, and `./script.sh`.

**✅ Day 07 Completed**
