# Phase 1, Lesson 1.2 — CLI Mastery

Everything you do as an SRE — debugging, deploying, monitoring — flows through the command line. This lesson builds the muscle memory.

---

## The Shell — Your Command Interpreter

When you open your terminal, you're talking to **Bash** (Bourne Again Shell). It's a translator between you and the OS.

The prompt breaks down like this:

```
swami@DESKTOP-SD6MAF4:/mnt/c/Users/MAYUR$
│         │              │                │
username  hostname       current dir      $ = normal user
                                          # = root user
```

---

## Part 1: Navigation

The filesystem is a tree starting at `/` (root).

| Command        | Purpose                               |
| -------------- | ------------------------------------- |
| `pwd`          | Print working directory (where am I?) |
| `cd ~` or `cd` | Go to home directory                  |
| `cd /`         | Go to filesystem root                 |
| `cd -`         | Go back to previous directory         |
| `cd ..`        | Go up one level                       |
| `cd ../..`     | Go up two levels                      |

### `ls` — List Contents

```bash
ls           # Basic listing
ls -l        # Long format (perms, owner, size, date)
ls -a        # Include hidden files (start with .)
ls -la       # Long format + hidden
ls -lh       # Human-readable sizes (KB, MB, GB)
ls -lt       # Sort by modification time (newest first)
ls -ltr      # Reverse sort (oldest first)
```

Reading `ls -l` output:

```
-rw-r--r-- 1 swami swami 4096 Jun  5 18:30 myfile.txt
│────┬────│ │  │     │     │      │            │
│  perms   │ owner group  size   date         name
│          │
│          number of hard links
│
file type (- = file, d = directory, l = symlink)
```

### Absolute vs Relative Paths

- **Absolute** starts with `/`: `/home/swami/Documents`
- **Relative** starts from where you ARE: `Documents`

**Production rule:** Always use absolute paths in scripts. Relative paths break when scripts run from different directories.

### `mkdir` — Make Directory

```bash
mkdir projects
mkdir -p projects/linux-labs/lesson-1   # -p creates parents
```

---

## Part 2: Tab Completion

**Press Tab to autocomplete.** Press Tab twice to see all matches.

```bash
cd /e<Tab>           # Completes to /etc/
ls /etc/pa<Tab><Tab> # Shows passwd, pam.conf, pam.d, etc.
```

**Rule:** If you're typing full paths manually, you're doing it wrong. Tab-complete everything — it's faster AND prevents typos.

---

## Part 3: Command History

```bash
history          # Show command history
!!               # Run last command
!cd              # Run last command starting with "cd"
!$               # Last argument of previous command
```

**`Ctrl+R`** is the most useful keyboard shortcut in Linux. Press it, type any part of a past command, press Enter. Build this habit now.

---

## Part 4: Essential Keyboard Shortcuts

| Shortcut | Action                          |
| -------- | ------------------------------- |
| `Ctrl+C` | Kill/cancel current command     |
| `Ctrl+D` | Exit shell                      |
| `Ctrl+L` | Clear screen                    |
| `Ctrl+A` | Jump to beginning of line       |
| `Ctrl+E` | Jump to end of line             |
| `Ctrl+W` | Delete word before cursor       |
| `Ctrl+U` | Delete everything before cursor |
| `Ctrl+K` | Delete everything after cursor  |
| `Ctrl+R` | Reverse search history          |

Focus on these 4 first: `Ctrl+C`, `Ctrl+R`, `Ctrl+A`, `Ctrl+E`.

---

## Part 5: stdin, stdout, stderr

Every command has three data streams:

| Stream | FD  | Purpose        | Default  |
| ------ | --- | -------------- | -------- |
| stdin  | 0   | Input          | Keyboard |
| stdout | 1   | Normal output  | Screen   |
| stderr | 2   | Error messages | Screen   |

**Why are stdout and stderr separate?** So you can save good output to a file and route errors elsewhere without mixing them.

### Redirection

```bash
ls /etc > files.txt          # stdout to file (overwrite)
ls /etc >> files.txt         # stdout to file (append)
ls /nonexistent 2> errors.txt # stderr to file
ls /etc /nope &> all.txt     # both stdout and stderr to file
ls /etc > /dev/null          # discard stdout
ls /nope 2>/dev/null         # discard stderr
```

**`/dev/null`** is a special file that swallows everything sent to it — a trash can with no bottom.

**Real-world example — cron job redirection:**

```bash
/opt/scripts/healthcheck.sh >> /var/log/healthcheck.log 2>> /var/log/healthcheck_errors.log
```

This prevents cron from emailing you 288 times a day while preserving logs.

---

## Part 6: Pipes — Chaining Commands

A pipe (`|`) takes **stdout** of one command and feeds it as **stdin** to the next. This is the philosophy of Linux: small tools that do one thing well, chained together.

```bash
ls /etc | wc -l                       # Count files in /etc
cat /var/log/syslog | grep "error"    # Find error lines
ls -lS /etc | head -10                # 10 largest files in /etc
```

**Real-world example — top 5 IPs hitting a web server:**

```bash
cat access.log | cut -d' ' -f1 | sort | uniq -c | sort -rn | head -5
```

Breakdown:

1. `cat access.log` — read the log
2. `cut -d' ' -f1` — extract first field (IP)
3. `sort` — sort IPs (required before uniq)
4. `uniq -c` — count consecutive duplicates
5. `sort -rn` — sort numerically, reverse (highest first)
6. `head -5` — top 5

**Mental model:** Pipes are an assembly line. Raw material in one end, each station transforms it, finished product out the other end.

---

## Part 7: Aliases

Shortcuts for commands you type often:

```bash
alias ll='ls -la'
alias ..='cd ..'
alias ...='cd ../..'

alias              # See all aliases
unalias ll         # Remove an alias
```

To make aliases permanent, add them to `~/.bashrc` (covered in lesson 1.7).

---

## Hands-on Lab

```bash
# 1. Create lab directory
mkdir -p ~/linux-labs/lesson-1.2
cd ~/linux-labs/lesson-1.2

# 2. Verify location
pwd

# 3. Create test files
echo "Hello from file 1" > file1.txt
echo "Error: something broke" > file2.txt
echo "Hello from file 3" > file3.txt
echo "Error: disk full" >> file2.txt
echo "All good here" >> file3.txt

# 4. List in long format
ls -la

# 5. View contents
cat file1.txt
cat file2.txt

# 6. Find lines with "Error"
grep "Error" file2.txt

# 7. Search across all files
grep "Hello" *.txt

# 8. Combine files
cat file1.txt file2.txt file3.txt > combined.txt

# 9. Count error lines
cat combined.txt | grep "Error" | wc -l

# 10. Count config files in /etc
ls /etc | grep conf | wc -l

# 11. Capture stderr
ls /fakepath 2> errors.txt
cat errors.txt
```

---

## Mini Tasks

1. **Navigate without looking:** From `~`, `cd` to `/var/log`, then `/etc`, then back to `~` using only absolute paths. Repeat with relative paths and `cd -`.

2. **Pipeline challenge:** Run and explain each piece:

   ```bash
   ls -la /etc | grep "^d" | wc -l
   ```

3. **Redirection challenge:** List `/etc` and `/nonexistent` simultaneously, sending successful output to `good.txt` and errors to `bad.txt`.

4. **History power:** Use `Ctrl+R` to find and re-run your `grep "Error"` command without typing it.

5. **Speed test:** `cd` to `/usr/share/doc` using tab completion. Count keystrokes typed vs path length.

---

## Check Your Understanding

1. What's the difference between `>` and `>>`?
2. What does `2>` do, and why is stderr separate from stdout?
3. Run the pipeline challenge — what number did you get and what does it represent?
4. You're writing a cron script. How do you redirect output so nothing gets emailed but you can still check logs later?

---

## Key Takeaways

- **Tab-complete everything** — speed and accuracy
- **Ctrl+R** is your time machine — use it constantly
- **Pipes** turn small tools into powerful pipelines
- **Absolute paths in scripts**, always
- **stdout and stderr are separate** — control them independently
