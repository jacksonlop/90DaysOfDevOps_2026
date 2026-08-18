#day4 - Process, System Services, Logs
1. Processes
A process is a program that is currently running.
Every process has a PID (Process ID), which Linux uses to identify it.
ps aux
ps aux
Shows running processes.
Important columns:
USER → user who owns the process
PID → Process ID
%CPU → CPU usage
%MEM → memory usage
COMMAND → program that is running
pgrep ssh
pgrep ssh
Searches for a process by name.
If SSH is running, it returns its PID.

2. systemd Services
A service is a program that runs in the background.
systemd manages many Linux services.
For this practice, we check the SSH service.
systemctl status ssh
systemctl status ssh
Checks the current status of SSH.
Active: active (running)
Means SSH is running right now.
systemctl is-enabled ssh
systemctl is-enabled ssh
Checks whether SSH will automatically start when Linux boots.
enabled  → starts automatically at boot
disabled → does not start automatically at boot
Important difference
active   → Is it running right now?
enabled  → Will it start automatically at boot?
Enable automatic startup
sudo systemctl enable ssh
Disable automatic startup
sudo systemctl disable ssh

3. Logs
Logs are records of events that happen on the system.
They help us find errors and understand what happened.
journalctl -u ssh
journalctl -u ssh
Shows logs for the SSH service.
journalctl -u ssh -n 20
journalctl -u ssh -n 20
Shows the latest 20 log entries for SSH.

4. Basic Troubleshooting
If SSH is not working:
Check process → Check service → Check logs → Find the issue
Commands
ps aux
pgrep ssh
systemctl status ssh
systemctl is-enabled ssh
journalctl -u ssh
journalctl -u ssh -n 20
Key Things I Learned
Process → a running program
PID → identifies a process
systemd → manages services
systemctl → checks and controls services
journalctl → reads systemd logs
active → running now
enabled → starts automatically at boot
Logs → help troubleshoot problems
