# Day 16 – Shell Scripting Basics

## What is Shell Scripting?

A **shell** is a program that takes commands and passes them to the operating system to run (e.g. Bash).

A **shell script** is just a text file containing a list of shell commands, saved together so they can all run at once instead of typing them one by one.

> Shell script = a file containing commands that the shell executes, in order, automatically.

---

## Comments in Shell Scripts

- **Single-line comment** → starts with `#`. Everything after it on that line is ignored.
```bash
  # this line is ignored by bash
  echo "this line runs"   # this part is also ignored
```
- **Multi-line comment** → bash has no true multi-line comment syntax. The common workaround is a `: '...'` block:
```bash
  : '
  This entire block
  is treated as a comment
  and will not run
  '
```
  In practice, most people just stack multiple `#` lines instead — it's simpler and more common.

---

## Task 1 – First Shell Script

### Notes

- **Shebang** (`#!/bin/bash`) → the first line of a script, tells the system which interpreter to use to run it.
- `.sh` → common file extension for shell scripts (not required, just a convention).

### Steps

Create the file:
```bash
vim hello.sh
```

Add:
```bash
#!/bin/bash

echo "Hello, DevOps!"
```

Save and exit vim:
```text
Esc
:wq
Enter
```

Make it executable:
```bash
chmod +x hello.sh
```

Run it:
```bash
./hello.sh
```

Expected output:
```text
Hello, DevOps!
```

<img width="554" height="196" alt="dagger-1" src="https://github.com/user-attachments/assets/c512ddd7-2b8b-4330-9ee6-3cc098d7dd6b" />

### Without a shebang

If `#!/bin/bash` is missing, running the script directly can fail or use the wrong shell by default. It can still be forced to run with:
```bash
bash hello.sh
```

---

## Task 2 – Variables

Create the file:
```bash
vim variables.sh
```

Add:
```bash
#!/bin/bash

NAME="Jackson"
ROLE="DevOps Engineer"

echo "Hello, I am $NAME and I am a $ROLE"
```

Save, make executable, and run:
```bash
chmod +x variables.sh
./variables.sh
```

Expected output:
```text
Hello, I am Jackson and I am a DevOps Engineer
```

<img width="551" height="76" alt="Dagger-2" src="https://github.com/user-attachments/assets/2d499b30-a0b1-4e2f-917c-5304d663d423" />

### Single vs double quotes

- **Double quotes `" "`** → variables get replaced with their actual value.
```bash
  echo "Hello $NAME"
  # NAME="Jackson" → Hello Jackson
```
- **Single quotes `' '`** → everything is treated as literal text, variables are NOT replaced.
```bash
  echo 'Hello $NAME'
  # Output → Hello $NAME
```

**Easy way to remember:** double quotes let `$NAME` become its value; single quotes keep `$NAME` exactly as typed.

---

## Task 3 – User Input with `read`

### Notes

- `read` → takes input from the user and stores it in a variable.
- `read -p` → shows a prompt message while waiting for input.

Create the file:
```bash
vim greet.sh
```

Add:
```bash
#!/bin/bash

read -p "Enter your name: " NAME
read -p "Enter your favourite tool: " TOOL

echo "Hello $NAME, your favourite tool is $TOOL"
```

Make executable and run:
```bash
chmod +x greet.sh
./greet.sh
```

Example output:
```text
Enter your name: Jackson
Enter your favourite tool: Docker
Hello Jackson, your favourite tool is Docker
```

<img width="542" height="212" alt="Dagger-3" src="https://github.com/user-attachments/assets/93624f08-7c0d-4d98-a0b5-af683e956458" />

---

## Task 4 – If-Else Conditions

`if-elif-else` is used to make decisions based on a condition.

### 4.1 Check positive, negative, or zero

Create the file:
```bash
vim check_number.sh
```

Add:
```bash
#!/bin/bash

read -p "Enter a number: " NUM

if [ "$NUM" -gt 0 ]; then
    echo "Positive"
elif [ "$NUM" -lt 0 ]; then
    echo "Negative"
else
    echo "Zero"
fi
```

Make executable and run:
```bash
chmod +x check_number.sh
./check_number.sh
```

Test with a positive number, a negative number, and zero.

Example:
```text
Enter a number: 5
Positive
```

<img width="613" height="266" alt="Dagger-4" src="https://github.com/user-attachments/assets/fef5266c-682d-46ea-b31a-d77a1c5d4ae4" />

### 4.2 Check if a file or directory exists

Create the file:
```bash
vim file_check.sh
```

Add:
```bash
#!/bin/bash

read -p "Enter path: " PATH_INPUT

if [ -f "$PATH_INPUT" ]; then
    echo "It's a regular file"
elif [ -d "$PATH_INPUT" ]; then
    echo "It's a directory"
else
    echo "Path does not exist"
fi
```

Make executable and run:
```bash
chmod +x file_check.sh
./file_check.sh
```

Test it with a file that exists, a directory that exists, and a path that doesn't exist.

**Flag reference:**
- `-f` → checks whether the given path is a regular file.
- `-d` → checks whether the given path is a directory.

<img width="556" height="212" alt="dagger-5" src="https://github.com/user-attachments/assets/c966e53a-356f-4088-808c-55bdfda0c71b" />

---

## Task 5 – Combine It All

Combines variables, `read`, if-else, and `systemctl`.

### Notes

- Store the service name in a variable.
- Ask the user whether to check the service.
- `systemctl is-active` checks whether a service is currently active.

Create the file:
```bash
vim server_check.sh
```

Add:
```bash
#!/bin/bash

SERVICE="nginx"

read -p "Do you want to check the status? (y/n): " CHOICE

if [ "$CHOICE" = "y" ]; then
    if systemctl is-active --quiet "$SERVICE"; then
        echo "$SERVICE is active"
    else
        echo "$SERVICE is not active"
    fi
elif [ "$CHOICE" = "n" ]; then
    echo "Skipped."
else
    echo "Invalid choice."
fi
```

Make executable and run:
```bash
chmod +x server_check.sh
./server_check.sh
```

Test it twice — once entering `y`, once entering `n`.

<img width="670" height="407" alt="dagger-6" src="https://github.com/user-attachments/assets/5fa52304-1fe2-40b5-bba7-4b12f5f00fbd" />

---

## 💡 Hints

* Use `#!/bin/bash` as the first line of a Bash script.
* Use `chmod +x script.sh` to make a script executable.
* Use `$VARIABLE` to access a variable's value.
* Use `read -p` to take input from the user.
* Use `if`, `elif`, and `else` for conditions.
* Use `-f` to check whether a regular file exists.
* Use `systemctl is-active` to check whether a service is active.

---

## 🧠 What I Learned

* Created and executed Bash scripts using `vim`.
* Learned how **shebangs, variables, and `echo`** work.
* Learned how to take user input using **`read`**.
* Learned how **single and double quotes** behave with variables.
* Used **if-else conditions** to check numbers and files.
* Combined shell scripting with `systemctl` to check a service.
