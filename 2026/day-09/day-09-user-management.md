# Day 09 – Linux User & Group Management

## 📌 Objective

Learn how to create Linux users and groups, manage group membership, set permissions, and create shared directories for team collaboration.

---

## 👤 1. Users Created

### Create users

```bash
sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor
```

**Meaning:** Creates users with their home directories.

### Set passwords

```bash
sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
```

### Verify users

```bash
cat /etc/passwd | tail -n 4
```

**Meaning:** Displays the last entries in the user account file.

### Check home directories

```bash
ls /home/
```

**Expected:**

```text
tokyo
berlin
professor
```

---

## 👥 2. Groups Created

### Create groups

```bash
sudo groupadd developers
sudo groupadd admins
```

**Meaning:** Creates groups to manage users and permissions together.

### Verify groups

```bash
cat /etc/group | tail -n 4
```

---

## 🔐 3. Group Assignments

### Add users using `gpasswd`

```bash
sudo gpasswd -a tokyo developers
sudo gpasswd -a berlin developers
sudo gpasswd -a berlin admins
sudo gpasswd -a professor admins
```

### Verify memberships

```bash
cat /etc/group | tail -n 4
```

**Result:**

```text
tokyo     → developers
berlin    → developers, admins
professor → admins
```

---

## 📂 4. Shared Development Directory

### Create directory

```bash
sudo mkdir /opt/dev-project
```

### Set group ownership

```bash
sudo chgrp developers /opt/dev-project
```

**Meaning:** Makes `developers` the group owner of the directory.

### Set permissions

```bash
sudo chmod 775 /opt/dev-project
```

**Meaning:** Gives the owner and group read, write, and execute permissions.

### Verify

```bash
ls -ld /opt/dev-project
```

---

## 🧪 5. Test Shared Directory Access

### Tokyo creates a file

```bash
sudo -u tokyo touch /opt/dev-project/tokyo.txt
```

### Berlin creates a file

```bash
sudo -u berlin touch /opt/dev-project/berlin.txt
```

### Verify

```bash
ls -l /opt/dev-project/
```

**Result:**

```text
tokyo.txt
berlin.txt
```

---

## 🤝 6. Team Workspace

### Create user

```bash
sudo useradd -m nairobi
sudo passwd nairobi
```

### Create group

```bash
sudo groupadd project-team
```

### Add users to group

```bash
sudo gpasswd -a nairobi project-team
sudo gpasswd -a tokyo project-team
```

### Create shared workspace

```bash
sudo mkdir /opt/team-workspace
```

### Set group ownership

```bash
sudo chgrp project-team /opt/team-workspace
```

### Set permissions

```bash
sudo chmod 775 /opt/team-workspace
```

### Verify

```bash
ls -ld /opt/team-workspace
```

---

## 📝 7. Test File Creation

### Nairobi creates a file

```bash
sudo -u nairobi touch /opt/team-workspace/nairobi.txt
```

### Verify

```bash
ls -l /opt/team-workspace/
```

### Check group membership

```bash
groups nairobi
groups tokyo
```

---

## 🧠 What I Learned Today

- Created and managed **Linux users**
- Created **groups** for team management
- Added users to groups using `gpasswd`
- Used **group ownership** for shared directories
- Used `chmod 775` to manage permissions
- Created **shared workspaces** for multiple users
- Tested whether users could access and create files

> **Linux user & group management helps control who can access resources and enables secure team collaboration.**
