# Day 13 – Linux Volume Management (LVM)

## 🎯 Goal

* Learn how LVM manages storage using Physical Volumes, Volume Groups, and Logical Volumes.
* Create, mount, and extend a logical volume.

---

## 🔐 Step 1 – Switch to Root

```bash
sudo -i
```
<img width="277" height="40" alt="Switch to root" src="https://github.com/user-attachments/assets/230b24b9-4aab-49a1-b948-28d6fd2a9fb3" />
- Switched to the root user for LVM operations.

---

## 📌 Task 1 – Check Current Storage

```bash
lsblk
```
<img width="712" height="470" alt="lsblk output" src="https://github.com/user-attachments/assets/7774da66-e076-4320-b2c9-ee2f02e75080" />
- Checked the available disks and partitions.

```bash
pvs
```
- Checked existing Physical Volumes.

```bash
vgs
```
- Checked existing Volume Groups.

```bash
lvs
```
- Checked existing Logical Volumes.

```bash
df -h
```
- Checked filesystem usage.

---

## 📌 Task 2 – Create Physical Volumes

```bash
pvcreate /dev/nvme1n1
pvcreate /dev/nvme2n1
pvs
```
<img width="490" height="110" alt="Physical Volumes" src="https://github.com/user-attachments/assets/a16bc255-5308-499e-9dd0-3bbc1de8d1ee" />
- Created Physical Volumes from the 10 GiB and 12 GiB EBS disks.
