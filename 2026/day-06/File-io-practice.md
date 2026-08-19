# *Day 06 – Linux File Commands*

| *Command*                         | *Meaning*        |
| --------------------------------- | ---------------- |
| `touch notes.txt`                 | Create file      |
| `echo "text" > notes.txt`         | Write            |
| `echo "text" >> notes.txt`        | Append           |
| `echo "text" \| tee -a notes.txt` | Display + append |
| `cat notes.txt`                   | Read all         |
| `head -n 2 notes.txt`             | First 2 lines    |
| `tail -n 2 notes.txt`             | Last 2 lines     |

## *Quick Remember*

`>` → *Overwrite*
`>>` → *Append*
`cat` → *Read all*
`head` → *Beginning*
`tail` → *End*
`tee` → *Display + write*
