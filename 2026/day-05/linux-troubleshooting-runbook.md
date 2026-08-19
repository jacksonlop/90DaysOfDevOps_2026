Check Ubuntu version
cat /etc/os-release

Shows Linux distribution and version.

2. Filesystem
Create a temporary folder
mkdir /tmp/runbook-demo

Checks whether we can create a directory.

Copy and verify a file
cp /etc/hosts /tmp/runbook-demo/hosts-copy
ls -l /tmp/runbook-demo

Checks file copying and verifies the file exists.

3. CPU & Memory
Check running processes
top

Shows running processes and CPU/memory usage.

Check RAM
free -h

Shows total, used and available memory.

Result:

Total RAM: ~908 MiB
Available: ~602 MiB
No swap configured

Observation: No obvious memory pressure.

4. Disk
Check disk space
df -h

Shows filesystem disk usage.

Result:

Root disk: 6.7G
Used: 2.1G
Available: 4.6G
Usage: 31%

Observation: Plenty of disk space is available.

Check log size
sudo du -sh /var/log

Shows how much disk space logs use.

Result:

17M

Observation: Logs are not using significant disk space.

5. Network
Test connectivity
ping -c 4 google.com

Checks network connectivity and DNS.

Result:

4 packets received
0% packet loss
~12 ms average response

Observation: Network connectivity is working.

Check listening ports
ss -tulpn

Shows listening network ports and services.

SSH was listening on:

0.0.0.0:22
[::]:22

Observation: SSH is listening on TCP port 22.

6. SSH Logs
Check SSH logs
journalctl -u ssh -n 50

Shows the latest 50 SSH service log entries.

Observation:

SSH started successfully.
Successful SSH login was recorded.
Some external connections were closed.
SSH later received SIGTERM and stopped.
Check authentication logs
sudo tail -n 50 /var/log/auth.log

Shows recent authentication-related events.

Observation: Used to check recent SSH login/authentication activity.

Quick Findings
CPU: No obvious high CPU usage.
Memory: ~602 MiB available.
Disk: 31% used.
Logs: Only ~17 MB.
Network: 0% packet loss.
SSH: Port 22 was listening.
SSH logs showed successful login activity.
SSH service later stopped with SIGTERM.
If This Worsens
Check SSH status:
systemctl status ssh
Restart SSH if required:
sudo systemctl restart ssh
Investigate logs:
sudo journalctl -u ssh -n 100

If the problem is still unclear, collect deeper process-level information such as strace.
