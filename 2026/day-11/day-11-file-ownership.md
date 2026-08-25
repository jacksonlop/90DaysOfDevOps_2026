# 🚀 Day 11: File Ownership (chown & chgrp)

## 👤 Understanding Ownership

Run `ls -l` to view file ownership.

`-rw-r--r-- 1 owner group size date filename`

- **Owner** → User who owns the file.
- **Group** → Group associated with the file.

<img width="476" height="98" alt="Day11-git-one" src="https://github.com/user-attachments/assets/07eee54b-21eb-41ac-aa86-d2a852747144" />

## 📁 Files & Directories Created

### Basic `chown` Operations

Create the file:

`touch devops-file.txt`

Check the current owner:

`ls -l devops-file.txt`

<img width="686" height="67" alt="Pokemon-two" src="https://github.com/user-attachments/assets/ed1eca37-4e77-4442-8638-4440b51fad70" />

Change owner to `tokyo`:

`sudo chown tokyo devops-file.txt`

Verify:

`ls -l devops-file.txt`

<img width="663" height="85" alt="Pokemon-three" src="https://github.com/user-attachments/assets/9288e770-0466-42a0-a900-0b79e5cd3a97" />

Change owner to `berlin`:

`sudo useradd berlin`

`sudo chown berlin devops-file.txt`

Verify:

`ls -l devops-file.txt`

<img width="670" height="55" alt="Pokemon-four" src="https://github.com/user-attachments/assets/a3497301-5a7d-4ff3-b1fd-4f476c3a5490" />

---



