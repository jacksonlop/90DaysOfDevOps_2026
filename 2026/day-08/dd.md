Part 2: Install Docker & Nginx
Step 1: Update System
sudo apt update
sudo apt upgrade -y
Step 2: Install Docker
sudo apt install docker.io -y
docker --version
sudo systemctl status docker

Docker was installed and running.

Step 3: Install Nginx
sudo apt install nginx -y
sudo systemctl status nginx

Nginx was installed and running.

Test Nginx:

curl http://localhost
Part 3: Security Group Configuration
Allowed SSH Port 22 for server access.
Allowed HTTP Port 80 for web access.
SSH  → TCP 22 → My IP
HTTP → TCP 80 → Anywhere
Test Web Access

Opened:

http://PUBLIC_IP

Nginx welcome page was displayed successfully.

Part 4: Extract Nginx Logs
Step 1: View Nginx Logs
journalctl -u nginx

Shows Nginx service logs.

sudo tail -n 20 /var/log/nginx/access.log

Shows the latest Nginx access logs.

Step 2: Save Logs to File
sudo cp /var/log/nginx/access.log ~/nginx-logs.txt

Copies Nginx logs to a file.

sudo chown ubuntu:ubuntu nginx-logs.txt

Changes the file owner to ubuntu.

cat nginx-logs.txt

Displays the saved logs.

Step 3: Download Log File

From local WSL:

scp -i devops-ai-powered-key.pem ubuntu@PUBLIC_IP:~/nginx-logs.txt .

Downloads the log file from EC2 to the local machine.

ls

Verified that nginx-logs.txt was downloaded.

Commands Used
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
