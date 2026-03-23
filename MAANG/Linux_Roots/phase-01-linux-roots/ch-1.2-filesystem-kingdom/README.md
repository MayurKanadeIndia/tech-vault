# 🏰 Chapter 1.2 — The Filesystem Kingdom

> **Phase 1: Linux Roots** · Chapter 2 of 10 · ✅ Completed: 2026-03-23

---

## 📊 Chapter Stats

| Field              | Details                                                                            |
| ------------------ | ---------------------------------------------------------------------------------- |
| **Status**         | ✅ Done                                                                            |
| **Date Started**   | 2026-03-23                                                                         |
| **Date Completed** | 2026-03-23                                                                         |
| **Time Spent**     | ~50 minutes                                                                        |
| **Self Score**     | — / 10                                                                             |
| **XP Earned**      | 150 ⭐                                                                             |
| **Lesson File**    | [View Interactive Lesson](../../lessons/phase1_chapter1.2_filesystem_kingdom.html) |

---

## 🎯 What This Chapter Covers

- The single most important idea in Linux: **everything is a file** (hardware, processes, network connections — all exposed as files)
- Every top-level directory in the Linux filesystem and exactly what lives there
- **Inodes** — the hidden index card system that actually stores file metadata (not the filename!)
- The difference between **hard links** and **soft links** — and when each one survives deletion
- **Absolute vs relative paths** — the confusion that caused a $4M+ production incident
- The senior SRE's **3am disk-full response protocol**
- The MAANG mental model for thinking about data flow through a filesystem

---

## 🔑 Key Concepts

### The #1 Idea: Everything is a File

```
Your hard drive?         → /dev/sda          (a file)
Your keyboard?           → /dev/input/event0  (a file)
A running process?       → /proc/1234/        (a directory of files)
Your RAM usage?          → /proc/meminfo      (a file)
A network interface?     → /sys/class/net/eth0/ (files)
A terminal window?       → /dev/pts/0         (a file)
```

This is the **Unix philosophy** — represent everything as a file so you can use the same tools (read, write, cat, less, grep) to inspect anything in the system.

---

### The Linux Filesystem Map

```
/                   ← Root. The top of everything. One slash rules them all.
├── /etc            ← Config files. All app configs live here. BACK THIS UP.
├── /var            ← Variable data. Logs, databases, caches. MONITOR DISK HERE.
│   └── /var/log    ← All logs. #1 place disks fill up in production.
├── /proc           ← Virtual. Kernel's live window. Generated in RAM. No backup needed.
├── /sys            ← Virtual. Hardware & kernel parameters. Writable (!!).
├── /dev            ← Device files. /dev/sda = your disk. /dev/null = black hole.
├── /home           ← User home directories. /home/alice, /home/bob.
├── /root           ← Superuser's home. Separate from /home on purpose.
├── /tmp            ← Temp files. World-writable. Cleared on reboot. NEVER rely on it.
├── /usr            ← Binaries & libraries. /usr/bin has all your commands.
├── /bin → /usr/bin ← Symlink on modern Ubuntu (UsrMerge). Essential commands.
├── /lib            ← Shared libraries (like Windows DLLs). glibc lives here.
├── /opt            ← Self-contained third-party software. /opt/google, /opt/datadog.
├── /mnt            ← Manual mount points. Extra disks go here.
├── /boot           ← Bootloader (GRUB) + kernel image. ⚠️ DON'T TOUCH.
└── /run            ← Runtime state (PIDs, sockets). RAM-based. Lost on reboot.
```

#### The MAANG Data Flow Mental Model

| Directory | Backup?                   | Monitor Disk?        | Lost on Reboot?      |
| --------- | ------------------------- | -------------------- | -------------------- |
| `/etc`    | ✅ YES — critical configs | No (tiny)            | No                   |
| `/var`    | ✅ YES — application data | ✅ YES — grows fast  | No                   |
| `/proc`   | ❌ No — virtual           | ❌ No — no real disk | ✅ Yes (regenerated) |
| `/run`    | ❌ No — runtime only      | ❌ No                | ✅ Yes               |
| `/usr`    | ❌ No — reinstallable     | ❌ No                | No                   |
| `/tmp`    | ❌ Never                  | No                   | ✅ Yes               |

---

### Inodes — The Hidden Index Card System

A **filename is NOT the file**. It's just a label. The real file is an **inode**.

```
Directory Entry:              Inode #2847391:
┌──────────────────────┐      ┌──────────────────────────────────────┐
│ name: config.yaml    │      │ file type:    regular file            │
│ inode: → 2847391     │ ──▶  │ permissions:  rw-r--r-- (0644)       │
└──────────────────────┘      │ owner uid:    1000                    │
                              │ size:         4,096 bytes             │
                              │ link count:   1                       │
                              │ atime:        2026-03-21 09:14        │
                              │ mtime:        2026-03-20 17:32        │
                              │ ctime:        2026-03-20 17:32        │
                              │ data blocks:  → [4821, 4822, ...]     │
                              └──────────────────────────────────────┘
```

> **Critical:** The inode does NOT store the filename. The filename lives in the directory. This is why you can have multiple filenames pointing to the same inode — hard links!

#### The 3 Timestamps (know all 3 for interviews!)

| Timestamp | What it means                        | Changed by                    |
| --------- | ------------------------------------ | ----------------------------- |
| `atime`   | Last **access** (read) time          | Reading the file              |
| `mtime`   | Last **modification** (content) time | Writing to the file           |
| `ctime`   | Last **change** (metadata) time      | chmod, chown, rename, writing |

---

### Hard Links vs Soft Links

| Property           | Hard Link                           | Soft Link (Symlink)                     |
| ------------------ | ----------------------------------- | --------------------------------------- |
| Points to          | Same **inode**                      | A **path string** (another file's name) |
| Own inode?         | ❌ No — shares original's inode     | ✅ Yes — has its own inode              |
| Cross filesystems? | ❌ No                               | ✅ Yes                                  |
| Link to directory? | ❌ No                               | ✅ Yes                                  |
| Original deleted?  | ✅ **Still works** (inode survives) | ❌ **Breaks** (dangling symlink)        |
| Create command     | `ln original newname`               | `ln -s original newname`                |
| `ls -l` indicator  | Same as regular file                | `l` prefix + `->` arrow                 |

```bash
# Hard link — same inode, file survives deletion of original
ln original.txt hard-link.txt
ls -li  # shows SAME inode number for both

# Soft link — different inode, breaks if original is deleted
ln -s original.txt soft-link.txt
ls -li  # shows DIFFERENT inode, with lrwxrwxrwx and -> arrow
```

---

### Absolute vs Relative Paths

```
Absolute: always starts with /   → works from ANYWHERE
  /home/user/scripts/backup.sh
  /etc/nginx/nginx.conf
  /var/log/syslog

Relative: does NOT start with /  → depends on where you ARE
  scripts/backup.sh         (only if you're in /home/user/)
  ../configs/               (one level up, then into configs)
  ./run.sh                  (current directory)

Special shortcuts:
  ~     → your home directory   (/home/yourname)
  .     → current directory
  ..    → parent directory
  -     → previous directory (cd - to jump back)
```

---

## 💻 All Commands I Practiced

```bash
# ── EXPLORING THE FILESYSTEM ─────────────────────────────────────────

ls -lahF                              # list with details, hidden files, human sizes, type indicators
ls -li                                # list with inode numbers
tree -L 2 /etc                        # visual tree, 2 levels deep
find /var/log -name "*.log" -mtime -1 # logs modified in last 24 hours
find /tmp -size +100M                 # files bigger than 100MB in /tmp
find /etc -type l                     # find all symlinks in /etc

# ── DISK USAGE (the 3am incident diagnostic toolkit) ─────────────────

df -h                                        # disk space per filesystem (human readable)
df -i                                        # inode usage — check when "disk full" but df -h shows free space!
du -sh /var/*                                # size of each item in /var
du -sh /* 2>/dev/null | sort -rh | head -15  # top disk consumers system-wide
du -sh /var/log/* | sort -rh | head -10      # find the runaway log file

# ── INODE INSPECTION ─────────────────────────────────────────────────

stat filename                    # full inode info: size, permissions, all 3 timestamps, inode number
stat /etc/hosts                  # try it on a real file
ls -li                           # show inode numbers in directory listing

# ── LINKS ────────────────────────────────────────────────────────────

ln original.txt hardlink.txt             # create hard link (same inode)
ln -s /etc/nginx/nginx.conf ~/nginx.conf # create symlink (for convenience)
readlink -f symlink                      # resolve full real path of a symlink chain
ls -la                                   # symlinks show with -> and lrwxrwxrwx

# ── NAVIGATION ───────────────────────────────────────────────────────

pwd                    # where am I?
cd /var/log            # absolute path navigation (always safe)
cd ../lib              # relative: go up, then into lib
cd ~                   # jump home
cd -                   # jump back to previous directory

# ── VIEWING FILES ─────────────────────────────────────────────────────

cat /etc/hosts                  # view entire file (fine for small files)
less /var/log/syslog            # paginated view (q=quit, /=search, G=end, g=start)
tail -f /var/log/syslog         # follow log in real-time (Ctrl+C to stop)
tail -100 /var/log/app.log      # last 100 lines
head -20 /etc/passwd            # first 20 lines

# ── THE SAFETY CHECK (always add this before destructive commands) ────

BUILD_DIR=""
[[ -z "$BUILD_DIR" ]] && echo "ABORT: BUILD_DIR is empty!" || rm -rf "$BUILD_DIR"/*
# This one-liner saved a production system. Use it EVERYWHERE.

# ── THE /proc MAGIC ──────────────────────────────────────────────────

cat /proc/meminfo              # live RAM stats from the kernel
cat /proc/cpuinfo              # CPU details
ls /proc/$$                    # $$ = your shell's PID — spy on it!
cat /proc/$$/cmdline           # what command this process is running
ls /proc/1/fd                  # all open file descriptors of PID 1 (systemd)
```

---

## 💡 The Analogy That Clicked

The **city analogy**:

- `/` = City Hall (top of everything)
- `/etc` = Government building (rules and configs)
- `/var` = Warehouse (growing data — monitor it!)
- `/tmp` = Public rubbish bin (anyone can use it, gets cleaned)
- `/proc` = Magic neighbourhood that doesn't exist on disk — generated live by the kernel
- `/home` = Residential area (where normal users live)
- `/root` = Mayor's private residence (superuser only)
- `/usr` = The tool shops (where programs live)
- `/dev` = The utilities district (hardware represented as files)

---

## ⚡ War Story

**A senior engineer, 10 years experience, major cloud company.**

Cleanup script: `rm -rf $BUILD_DIR/*`

An env file had a typo: `BUILD_DIR=` (empty string instead of `/build/old-artifacts`)

Result: the command became `rm -rf /*` — delete everything under root.

**14 production servers started deleting themselves. 6-hour incident. Major customer impact.**

**The fix — always validate before destroying:**

```bash
if [[ -z "$BUILD_DIR" ]]; then
    echo "ERROR: BUILD_DIR is empty. Aborting." >&2
    exit 1
fi
rm -rf "$BUILD_DIR"/*
```

**Lesson:** Use absolute paths in scripts. Validate variables before destructive operations. Test with `echo` first. Always.

---

## 🎯 Interview Questions This Chapter Prepares Me For

1. **"A server is throwing 'no space left on device' but df -h shows 40% free. What's wrong and how do you diagnose it?"**
   - Answer: Inode exhaustion. Run `df -i` to check inode usage. Find the directory with millions of tiny files with `for dir in /*; do echo "$dir: $(find $dir -maxdepth 2 | wc -l)"; done`

2. **"What is the difference between mtime and ctime on a Linux file?"**
   - `mtime` = last content modification (writing data). `ctime` = last metadata change (chmod, chown, rename, any write). `atime` = last read. `ctime` always updates when `mtime` updates, but NOT vice versa.

3. **"Explain what happens to a file when you delete it with rm."**
   - `rm` removes the directory entry (the filename → inode mapping). The inode's link count decrements by 1. If link count hits 0 AND no processes have the file open, the kernel marks those data blocks as free. If a process still has the file open, it can keep reading/writing even after `rm` — the inode survives until the file descriptor is closed.

4. **"What is a dangling symlink and how would you find all of them on a server?"**
   - A symlink whose target no longer exists. Find them: `find / -type l ! -exec test -e {} \; -print 2>/dev/null`

---

## ✅ Boss Challenge — Completed

- [ ] Recited every top-level directory from memory without notes
- [ ] Found top 3 disk consumers using `du -sh /* | sort -rh`
- [ ] Created file + hard link + symlink, deleted original, verified hard link survives
- [ ] Ran `stat /etc/hosts` and identified every field including all 3 timestamps
- [ ] Found log files > 1MB in /var/log and checked the biggest one
- [ ] Ran `df -i` and assessed inode health
- [ ] ⭐ BONUS: Explored `/proc/1/fd` — open file descriptors of systemd (PID 1)

> _(Update checkboxes as you complete each task)_

---

## 💬 My Reflection

_(Write your own reflection here after completing the chapter)_

---

_← [Back to Phase 1 Overview](../README.md) · [Ch 1.1 ←](../ch-1.1-linux-universe/README.md) · [Next: Ch 1.3 →](../ch-1.3-permissions-powers/README.md)_
