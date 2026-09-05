# Day 17 – Shell Scripting: Loops, Arguments & Error Handling

## 🎯 Objective

- Learn `for` and `while` loops.
- Work with command-line arguments.
- Install packages using a script.
- Handle errors in shell scripts.

- ## 📝 Task 1 – For Loop

### 1. Loop Through Fruits

I created `for_loop.sh` to loop through 5 fruits and print each fruit.

```bash
#!/bin/bash

for fruit in apple banana mango orange grape
do
    echo "$fruit"
done

Task 1: For Loop

Add this to day-17-scripting.md:

## 📝 Task 1 – For Loop

### 1. Loop Through Fruits

I created `for_loop.sh` to loop through 5 fruits and print each fruit.

```bash
#!/bin/bash

for fruit in apple banana mango orange grape
do
    echo "$fruit"
done
Output
apple
banana
mango
orange
grape
2. Count 1 to 10

I created count.sh to print numbers from 1 to 10 using a for loop.

#!/bin/bash

for i in {1..10}
do
    echo "$i"
done
Output
1
2
3
4
5
6
7
8
9
10

Then save it:

```text
Esc
:wq
Enter
📸 Screenshot

## 📝 Task 2 – While Loop

### Countdown

I created `countdown.sh` to take a number from the user and count down to `0`.

```bash
#!/bin/bash

read -p "Enter a number: " num

while [ "$num" -ge 0 ]
do
    echo "$num"
    num=$((num - 1))
done

echo "Done!"

Output
Enter a number: 5
5
4
3
2
1
0
Done!

📸 Screenshot

## 📝 Task 3 – Command-Line Arguments

### 1. Greeting with an Argument

I created `greet.sh` to accept a name using `$1`.

```bash
#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./greet.sh <name>"
    exit 1
fi

echo "Hello, $1!"

Output
$ ./greet.sh Jackson
Hello, Jackson!

It asks:

Is $1 empty?

If no name is provided:

$ ./greet.sh
Usage: ./greet.sh <name>
2. Arguments Demo

I created args_demo.sh to display the script name, total number of arguments, and all arguments.

#!/bin/bash

echo "Script name: $0"
echo "Total arguments: $#"
echo "All arguments: $@"
Output
$ ./args_demo.sh one two three
Script name: ./args_demo.sh
Total arguments: 3
All arguments: one two three

📸 Screenshots


## 📝 Task 4 – Install Packages via Script

I created `install_packages.sh` to check whether packages are installed and install them if they are missing.

### Script

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

## 📝 Task 4 – Install Packages via Script

I created `install_packages.sh` to check whether packages are installed and install them if they are missing.

### Script

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
### How it works

- The script stores `nginx`, `curl`, and `wget` in a list.
- The `for` loop checks each package one by one.
- `dpkg -s` checks whether the package is installed.
dpkg -s → checks the package status.
&> → sends both normal output and error output somewhere else.
/dev/null → throws that output away.
- If the package is installed, the script skips it.
- If the package is missing, the script installs it using `apt`.

📸 Screenshot

Task 5: Error Handling

Now document safe_script.sh.

Open:

vim day-17-scripting.md

Go to the bottom and add:

## 📝 Task 5 – Error Handling

### 1. Safe Script

I created `safe_script.sh` to practice basic error handling using `set -e` and `||`.

### Script

```bash
#!/bin/bash

set -e

mkdir /tmp/devops-test || echo "File already exists"
cd /tmp/devops-test || echo "Failed to enter directory"
touch test.txt || echo "Failed to create file"

echo "Script completed successfully"
How it works
set -e → stops the script when an unhandled command fails.
|| → allows us to handle a specific command failure.
mkdir → creates the test directory.
cd → moves into the directory.
touch → creates a file inside it.
Output

When the directory already exists:

mkdir: cannot create directory '/tmp/devops-test': File exists
File already exists
Script completed successfully

📸 screenshot

Task 5, Step 2: Root check in demo-root.sh

### 2. Check for Root User

I created `demo-root.sh` to check whether the script is being run as root.

```bash
#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Run as root"
    exit 1
fi

echo "Running as root"
How it works
$EUID → contains the current user's effective ID.
0 → the ID of the root user.
-ne → means "not equal".
If $EUID is not 0, the script prints Run as root.
exit 1 → stops the script and returns a failure status.
If the user is root, the script continues.
Output

When run as a normal user:

$ ./demo-root.sh
Run as root

When run as root:

# ./demo-root.sh
Running as root

📸 Take the screenshot

## 🧠 What I Learned

1. **Loops** can repeat commands automatically, which makes scripts shorter and easier to manage.
2. **Command-line arguments** allow a script to receive information directly when it is executed.
3. **Error handling** helps scripts deal with failures instead of blindly continuing.

## 💡 Hints

- Use `for` when you want to go through a list or a known range.
- Use `while` when a loop should continue while a condition is true.
- `$1`, `$2`, etc. represent positional arguments.
- `$#` gives the number of arguments, while `$@` gives all arguments.
- `set -e` stops the script when an unhandled command fails.
- `||` can be used to handle a specific command failure.
- `$EUID` can be used to check whether the script is running as root.
