# 🚀 Day 12 – Breather & Revision (Days 01–11)

## 🎯 Goal

* Revise the Linux fundamentals from **Days 01–11**.
* Practice important commands and improve troubleshooting confidence.

---

## 🧠 Mindset & Learning Plan

* ✅ My goal of becoming **job-ready for a Cloud/DevOps career** is still the same.
* ✅ I will continue focusing on **Linux, AWS, Docker, CI/CD, and Kubernetes**.
* ✅ I will follow: **Learn → Practice → Revise → Document → Share**.
* 🎯 Focus: **Consistency over perfection.**

---

## ⚙️ Processes & Services

### Commands Practiced

```bash
ps aux | head -5
systemctl status nginx
```

### Observations

* Checked currently running processes.
* Checked the Nginx service status.

---

## 📂 File Skills

### Commands Practiced

```bash
echo "Day 12 revision" >> revision.txt
chmod 640 revision.txt
ls -l revision.txt
```

### What I Verified

* Appended text to a file.
* Changed file permissions.
* Verified permissions and ownership.

---

## 📋 Cheat Sheet Refresh

### 5 Commands I Would Use First During an Incident

| **Command**                  | **Use**                       |
| ---------------------------- | ----------------------------- |
| `ps aux`                     | Check processes               |
| `systemctl status <service>` | Check service status          |
| `journalctl -u <service>`    | Check service logs            |
| `df -h`                      | Check disk usage              |
| `ls -l`                      | Check permissions & ownership |

---

## 👥 User & Group Sanity

### Commands Practiced

```bash
id
ls -l revision.txt
```

### What I Verified

* Checked my user and groups.
* Checked file ownership and permissions.

---

# ✅ Mini Self-Check

### 1. Which 3 commands save me the most time?

* `systemctl status` → Service check
* `journalctl -u` → Log check
* `ls -l` → Permission and ownership check

### 2. How do I check if a service is healthy?

```bash
systemctl status nginx
ps aux
journalctl -u nginx
```

* Check service status, process, and logs.

### 3. How do I safely change ownership and permissions?

* Check current access first with `ls -l`.
* Make only the required change.

```bash
chmod 640 revision.txt
```

### 4. What will I focus on improving in the next 3 days?

* Improve Linux troubleshooting.
* Practice permissions and services.
* Continue building DevOps fundamentals.

---

# 💡 Key Takeaways

* Linux fundamentals are important for DevOps.
* Processes, services, logs, and permissions are common troubleshooting areas.
* Regular hands-on revision builds confidence.
* **Practice > memorization.**

---

# 🚀 Progress Summary

* ✅ Revised Days 01–11.
* ✅ Practiced processes and services.
* ✅ Practiced files and permissions.
* ✅ Verified ownership and user information.
* ✅ Refreshed incident commands.
