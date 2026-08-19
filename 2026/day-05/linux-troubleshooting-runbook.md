1. Environment Check
uname -a
uname -a

Purpose: Shows Linux kernel and system information.

What we learned:

Our server is running Linux on AWS with an x86_64 architecture.

Step 2 — Check the Filesystem
Command
mkdir /tmp/runbook-demo

Does: Creates a temporary directory.

We learn: Whether we can create directories successfully.

Command
cp /etc/hosts /tmp/runbook-demo/hosts-copy
ls -l /tmp/runbook-demo

Does: Copies a file and then lists the directory.

We learn: Whether file copying and basic filesystem access are working.

Step 3 — Check CPU and Memory
Command
top

Does: Shows running processes and their CPU/memory usage.

We learn: If any process is using too much CPU or memory.

Command
free -h

Does: Shows RAM usage.

We learn: How much memory is used and how much is available.

Step 4 — Check Disk
Command
df -h

Does: Shows disk space usage.

We learn: If the filesystem is running out of space.

Command
sudo du -sh /var/log

Does: Shows how much space the log directory uses.

We learn: Whether logs are consuming too much disk space.

Step 5 — Check Network
Command
ping -c 4 google.com

Does: Sends 4 network packets to Google.

We learn: Whether the server has network connectivity and DNS is working.

Command
ss -tulpn

Does: Shows network ports that are listening.

We learn: Which services are accepting network connections.

Example:

:22

Port 22 is commonly used by SSH.

Step 6 — Check the Target Service
Target: SSH
Command
systemctl status ssh

Does: Shows the current SSH service status.

We learn: Whether SSH is running, stopped, failed, etc.

Step 7 — Check Service Logs
Command
journalctl -u ssh -n 50

Does: Shows the latest 50 logs for SSH.

We learn: What happened to SSH recently and whether there are errors or useful events.

Command
sudo tail -n 50 /var/log/auth.log

Does: Shows the latest 50 authentication log entries.

We learn: Recent login and authentication activity.

Step 8 — Decide What To Do

After checking everything, summarize what you found.

Example:

CPU       → Normal
Memory    → Enough available
Disk      → Enough free space
Network   → Working
SSH       → Port 22 listening
Logs      → Successful login found

Then decide whether the service needs action.

If the Problem Gets Worse
1. Check the service
systemctl status ssh
2. Restart if necessary
sudo systemctl restart ssh
3. Check logs again
journalctl -u ssh -n 100
Simple Troubleshooting Flow
Check
  ↓
Observe
  ↓
Understand the problem
  ↓
Verify
  ↓
Take action
  ↓
Check again
Main Lesson

A runbook is not just commands.

For every command, know:

What am I checking? → What did I find? → What does it mean? → What should I do next?
