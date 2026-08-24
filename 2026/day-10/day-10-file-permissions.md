# Day 10 – File Permissions & File Operations

## 📁 Files Created

- Create empty file

  `touch devops.txt`

- Create file with content

  `echo "I am learning Linux file permissions" > notes.txt`

- Create script

  `vim script.sh`

  `echo "Hello DevOps"`

- Verify files

  `ls -l`

## 📖 Read Files

- Read file

  `cat notes.txt`

- Open script read-only

  `vim -R script.sh`

- First 5 lines

  `head -n 5 /etc/passwd`

- Last 5 lines

  `tail -n 5 /etc/passwd`

## 🔐 Permissions

- Format: `rwxrwxrwx` → owner, group, others

- Check permissions

  `ls -l devops.txt notes.txt script.sh`

- Make script executable

  `chmod +x script.sh`

  `./script.sh`

- Make file read-only

  `chmod -w devops.txt`

- Set `640`

  `chmod 640 notes.txt`

- Create directory with `755`

  `mkdir project`

  `chmod 755 project`

## 🧪 Permission Testing

- Try writing to read-only file

  `echo "test" > devops.txt`

  Error: `Permission denied`

- Remove execute permission

  `chmod -x script.sh`

- Try running script

  `./script.sh`

  Error: `Permission denied`

## 📌 What I Learned

- `r` = read
- `w` = write
- `x` = execute
- `chmod` = change permissions
- `640` = owner `rw`, group `r`, others none
- `755` = owner `rwx`, group `rx`, others `rx`

  | Number | Binary | Permission | Meaning                |
| -----: | :----: | :--------: | ---------------------- |
|  **0** |  `000` |    `---`   | No permission          |
|  **1** |  `001` |    `--x`   | Execute                |
|  **2** |  `010` |    `-w-`   | Write                  |
|  **3** |  `011` |    `-wx`   | Write + Execute        |
|  **4** |  `100` |    `r--`   | Read                   |
|  **5** |  `101` |    `r-x`   | Read + Execute         |
|  **6** |  `110` |    `rw-`   | Read + Write           |
|  **7** |  `111` |    `rwx`   | Read + Write + Execute |

