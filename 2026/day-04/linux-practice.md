# Day 4 — Linux Processes, Services and Logs

## 1. Processes

A **process** is a program that is currently running.

Every process has a **PID (Process ID)**, which Linux uses to identify it.

### `ps aux`

```bash
ps aux
```

Shows running processes.

**Important columns:**

* `USER` → User who owns the process
* `PID` → Process ID
* `%CPU` → CPU usage
* `%MEM` → Memory usage
* `COMMAND` → Program that is running

### `pgrep ssh`

```bash
pgrep ssh
```

Searches for a process by name.

If SSH is running, it returns its **PID**.

---

## 2. systemd Services

A **service** is a program that runs in the background.

**systemd** manages many Linux services.

For this practice, we check the **SSH service**.

### `systemctl status ssh`

```bash
systemctl status ssh
```

Checks the current status of SSH.

```text
Active: active (running)
```

**active (running)** → SSH is running right now.

### `systemctl is-enabled ssh`

```bash
systemctl is-enabled ssh
```

Checks whether SSH will automatically start when Linux boots.

```text
enabled  → starts automatically at boot
disabled → does not start automatically at boot
```

### Important Difference

```text
active  → Is it running right now?
enabled → Will it start automatically at boot?
```

### Enable automatic startup

```bash
sudo systemctl enable ssh
```

### Disable automatic startup

```bash
sudo systemctl disable ssh
```

---

## 3. Logs

**Logs are records of events that happen on the system.**

They help us find errors and understand what happened.

### `journalctl -u ssh`

```bash
journalctl -u ssh
```

Shows logs for the SSH service.

### `journalctl -u ssh -n 20`

```bash
journalctl -u ssh -n 20
```

Shows the **latest 20 log entries** for SSH.

---

## 4. Basic Troubleshooting

If SSH is not working:

```text
Check process → Check service → Check logs → Find the issue
```

### Commands

```bash
ps aux
pgrep ssh
systemctl status ssh
systemctl is-enabled ssh
journalctl -u ssh
journalctl -u ssh -n 20
```

---

## Key Things I Learned

* **Process** → A running program
* **PID** → Identifies a process
* **systemd** → Manages services
* **systemctl** → Checks and controls services
* **journalctl** → Reads systemd logs
* **active** → Running now
* **enabled** → Starts automatically at boot
* **Logs** → Help troubleshoot problems
