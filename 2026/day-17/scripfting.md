# Day 17 – Shell Scripting: Loops, Arguments & Error Handling

## Objective

- Learn `for` and `while` loops.
- Work with command-line arguments.
- Install packages using a script.
- Handle errors in shell scripts.

---

# Bash Syntax Quick Reference

| Syntax   | Meaning                                  | Example                  |
| -------- | ---------------------------------------- | ------------------------ |
| `$( )`   | Runs a command and gets its output       | `today=$(date)`          |
| `$(( ))` | Performs math                            | `sum=$((5 + 3))`         |
| `[ ]`    | Basic condition checking                 | `[ "$EUID" -eq 0 ]`      |
| `[[ ]]`  | Advanced Bash condition checking         | `[[ $name == Jackson ]]` |
| `{1..5}` | Creates a number range                   | `for i in {1..5}`        |
| `$VAR`   | Gets the value stored in a variable      | `echo $name`             |
| `${VAR}` | Clearly marks where a variable name ends | `echo ${name}_backup`    |

## `[[ ]]` Common Uses

Variables can be used inside `[[ ]]` to check conditions.

```bash
[[ $name == Jackson ]]    # equal
[[ $name != Jackson ]]    # not equal
[[ $age -eq 23 ]]         # number is equal
[[ $age -gt 18 ]]         # greater than
[[ $age -lt 18 ]]         # less than
[[ -z $name ]]             # empty
[[ -n $name ]]             # not empty
[[ $a && $b ]]             # AND
[[ $a || $b ]]             # OR
```

### Quick Memory

* `$( )` → command output
* `$(( ))` → math
* `[ ]` → basic condition
* `[[ ]]` → advanced condition
* `{1..5}` → range
* `$VAR` → variable value
* `${VAR}` → variable boundary

## Why `${VAR}`?

Use `${VAR}` when text comes directly after a variable name.

```bash
name="Jackson"
echo "${name}_backup"
```

Output:

```text
Jackson_backup
```

`${name}` tells Bash that **`name` is the variable** and `_backup` is normal text.


## Task 1 – For Loop

**for loop** → repeats a set of commands once for each item in a list or range.

### 1. Loop through fruits

Created `for_loop.sh` to loop through 5 fruits and print each one.

```bash
#!/bin/bash

for fruit in apple banana mango orange grape
do
    echo "$fruit"
done
```

**Output:**
```text
apple
banana
mango
orange
grape
```

### 2. Count 1 to 10 (with a step)

Created `count.sh` to print numbers using a for loop with a step value.

```bash
#!/bin/bash

for i in {1..10..3}
do
    echo "$i"
done
```

`{1..10..3}` → start at 1, go up to 10, step by 3 each time.

**Output:**
```text
1
4
7
10
```

Save: `Esc` → `:wq` → `Enter`

<img width="557" height="350" alt="bat-1" src="https://github.com/user-attachments/assets/4b1146d5-3a3e-40f8-881b-298b36a05ec2" />

---

## Task 2 – While Loop

**while loop** → keeps repeating as long as a condition stays true.

### Countdown

Created `countdown.sh` to take a number from the user and count down to `0`.

```bash
#!/bin/bash

read -p "Enter a number: " num

while [ "$num" -ge 0 ]
do
    echo "$num"
    num=$((num - 1))
done

echo "Done!"
```

**Output:**
```text
Enter a number: 5
5
4
3
2
1
0
Done!
```

<img width="466" height="315" alt="bat-2" src="https://github.com/user-attachments/assets/490d8800-d9c2-49ba-baa0-12d3786dfba3" />

---

## Task 3 – Command-Line Arguments

**Command-line argument** → a value passed to the script when running it, e.g. `./script.sh value`.

### 1. Greeting with an argument

Created `greet.sh` to accept a name using `$1` (the first argument).

```bash
#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./greet.sh <name>"
    exit 1
fi

echo "Hello, $1!"
```

`-z "$1"` → checks if the first argument is empty (not provided).

**Output:**
```text
$ ./greet.sh Jackson
Hello, Jackson!
```

If no name is given:
```text
$ ./greet.sh
Usage: ./greet.sh <name>
```

### 2. Arguments demo

Created `args_demo.sh` to display the script name, total number of arguments, and all arguments.

```bash
#!/bin/bash

echo "Script name: $0"
echo "Total arguments: $#"
echo "All arguments: $@"
```

- `$0` → the script's own name
- `$#` → count of arguments passed
- `$@` → all arguments, listed out

**Output:**
```text
$ ./args_demo.sh one two three
Script name: ./args_demo.sh
Total arguments: 3
All arguments: one two three
```

<img width="465" height="184" alt="bat-3" src="https://github.com/user-attachments/assets/95468d9b-adc6-47ed-95e0-f30582214b60" />

---

## Task 4 – Install Packages via Script

Created `install_packages.sh` to check whether packages are installed, and install any that are missing.

```bash
#!/bin/bash

packages="nginx curl wget"

for package in $packages
do
    if dpkg -s "$package" &> /dev/null
    then
        echo "$package is already installed"
    else
        echo "$package is not installed. Installing..."
        apt install -y "$package"
    fi
done
```

**How it works:**
- The script stores `nginx`, `curl`, and `wget` in a list.
- The `for` loop checks each package one by one.
- `dpkg -s` → checks the package's install status.
- `&>` → sends both normal output and error output to the same place.
- `/dev/null` → throws that output away (so it doesn't clutter the screen).
- If installed, the script skips it. If missing, it installs it using `apt`.

<img width="476" height="268" alt="bat-4" src="https://github.com/user-attachments/assets/cee63086-7249-4245-8c2c-99f1dae7ceb1" />

---

## Task 5 – Error Handling

### 1. Safe script

Created `safe_script.sh` to practice basic error handling using `set -e` and `||`.

```bash
#!/bin/bash

set -e

mkdir /tmp/devops-test || echo "File already exists"
cd /tmp/devops-test || echo "Failed to enter directory"
touch test.txt || echo "Failed to create file"

echo "Script completed successfully"
```

**How it works:**
- `set -e` → stops the script immediately if any unhandled command fails.
- `||` → runs the command on the right ONLY if the command on the left fails (lets you handle that specific failure instead of stopping).
- `mkdir` → creates the test directory.
- `cd` → moves into the directory.
- `touch` → creates a file inside it.

**Output** (when the directory already exists):
```text
mkdir: cannot create directory '/tmp/devops-test': File exists
File already exists
Script completed successfully
```

<img width="512" height="221" alt="bat-5" src="https://github.com/user-attachments/assets/ca6ee119-4f8e-41fa-9eb3-6a872b52a2ee" />

### 2. Check for root user

Created `demo-root.sh` to check whether the script is being run as root.

```bash
#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Run as root"
    exit 1
fi

echo "Running as root"
```

**How it works:**
- `$EUID` → the current user's effective user ID.
- `0` → the ID reserved for the root user.
- `-ne` → means "not equal".
- If `$EUID` is not `0`, the script prints "Run as root" and exits.
- If the user is root, the script continues normally.

**Output** (normal user):
```text
$ ./demo-root.sh
Run as root
```

**Output** (root user):
```text
# ./demo-root.sh
Running as root
```

<img width="751" height="192" alt="bat-6" src="https://github.com/user-attachments/assets/3d75ef33-bcf3-48d0-b552-4522ce66ef7a" />

---

## What I Learned

1. **Loops** repeat commands automatically, making scripts shorter and easier to manage.
2. **Command-line arguments** let a script receive information directly when it's run.
3. **Error handling** helps scripts deal with failures instead of blindly continuing.

## Key Takeaways

- `for` → loop through a list or a known range
- `while` → loop while a condition stays true
- `$1`, `$2`, etc. → positional arguments passed to the script
- `$#` → number of arguments, `$@` → all arguments
- `set -e` → stop the script on any unhandled failure
- `||` → handle one specific command's failure
- `$EUID` → check whether the script is running as root
