# Day 13 – Linux Volume Management (LVM)

## 🎯 Goal

* Learn how LVM manages storage using Physical Volumes, Volume Groups, and Logical Volumes.
* Create, mount, and extend a logical volume.

---

## 🔐 Step 1 – Switch to Root

```bash
sudo -i

## 📌 Task 1 – Check Current Storage

```bash

```
<img width="490" height="110" alt="red-3" src="https://github.com/user-attachments/assets/a16bc255-5308-499e-9dd0-3bbc1de8d1ee" />

lsblk
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

  <img width="712" height="470" alt="red-2" src="https://github.com/user-attachments/assets/7774da66-e076-4320-b2c9-ee2f02e75080" />

## 📌 Task 2 – Create Physical Volumes

Use the two spare AWS EBS disks:

```bash
pvcreate /dev/nvme1n1
pvcreate /dev/nvme2n1
pvs
```
<img width="490" height="110" alt="red-3" src="https://github.com/user-attachments/assets/a16bc255-5308-499e-9dd0-3bbc1de8d1ee" />

- Created Physical Volumes from the 10 GiB and 12 GiB EBS disks.


