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

### Basic `chgrp` Operations

Create the file:

`touch team-notes.txt`

Check the current group:

`ls -l team-notes.txt`

<img width="484" height="43" alt="Pokemon-five" src="https://github.com/user-attachments/assets/60004b38-f5d4-4f4c-b7df-9fb1e3e4df20" />

Create the group:

`sudo groupadd heist-team`

Change the group:

`sudo chgrp heist-team team-notes.txt`

Verify:

`ls -l team-notes.txt`

<img width="512" height="57" alt="Pokemon-six" src="https://github.com/user-attachments/assets/d242f259-bf77-41e2-a14e-fabaf9482893" />

## 👥 Ownership Changes

### Combined Owner & Group Change

Create the file:

`touch project-config.yaml`

Create the user:

`sudo useradd professor`

Change owner and group together:

`sudo chown professor:heist-team project-config.yaml`

Verify:

`ls -l project-config.yaml`

<img width="625" height="76" alt="Pokemon-seven" src="https://github.com/user-attachments/assets/fcfcf8f1-5e83-47cd-b8ee-10d225996261" />

Create directory:

`mkdir app-logs`

Change owner and group:

`sudo chown berlin:heist-team app-logs`

Verify:

`ls -ld app-logs`

<img width="518" height="60" alt="pokemon-eight" src="https://github.com/user-attachments/assets/9512fa68-9d93-470d-91b9-c0eb5f6bb6ee" />




