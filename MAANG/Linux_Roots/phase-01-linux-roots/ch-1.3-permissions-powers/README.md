# 🔑 Chapter 1.3 — Permissions & Powers

> **Phase 1: Linux Roots** · Chapter 3 of 10 · ✅ Completed: **\_**

---

## 📊 Chapter Stats

| Field              | Details                                                                            |
| ------------------ | ---------------------------------------------------------------------------------- |
| **Status**         | ✅ Done                                                                            |
| **Date Started**   | 2026-03-23                                                                         |
| **Date Completed** | 2026-03-23                                                                         |
| **Time Spent**     | ~55 minutes                                                                        |
| **Self Score**     | 9 / 10                                                                             |
| **XP Earned**      | 150 ⭐                                                                             |
| **Lesson File**    | [View Interactive Lesson](../../lessons/phase1_chapter1.3_permissions_powers.html) |

---

## 🎯 What This Chapter Covers

- The three questions Linux asks on every file access: WHO, WHAT, ALLOWED?
- Reading the 10-character permission string — file type + owner + group + others
- What **r, w, x** mean on files vs directories (they are different!)
- **Octal notation** — converting permission strings to numbers (chmod 755, 644, 600)
- **chmod, chown, chgrp** — changing permissions and ownership
- **sudo** — how it works internally, the audit trail it leaves, and why you never work as root
- **Special bits** — setuid (SUID), setgid (SGID), sticky bit — what they do and when to use them
- **ACLs** — per-user, per-group fine-grained permissions beyond the standard three classes
- **Principle of Least Privilege (PoLP)** — the master security principle behind every MAANG system

---

## 🔑 Key Concepts

### The 10-Character Permission String

```
-  r w x  r - x  r - -
│  │       │       │
│  └─ OWNER (u)    │
│          └─ GROUP (g)
│                  └─ OTHERS (o)
└─ File type: - (regular) d (dir) l (symlink) b (block) c (char)
```

**Example decoded:**

```
-rwxr-xr-- 1 alice devteam 4096 Mar 21 deploy.sh
│           │ │     │
│           │ │     └─ group owner = devteam
│           │ └─ user owner = alice
│           └─ link count
└─ -rwxr-xr-- :
     rwx = owner: read + write + execute  (4+2+1 = 7)
     r-x = group: read + execute          (4+0+1 = 5)
     r-- = others: read only              (4+0+0 = 4)
     → octal: 754
```

---

### r, w, x: Files vs Directories

| Bit     | On a FILE           | On a DIRECTORY                              |
| ------- | ------------------- | ------------------------------------------- |
| `r` (4) | Read file content   | List directory contents (`ls`)              |
| `w` (2) | Modify file content | Create/delete/rename files INSIDE dir       |
| `x` (1) | Execute as program  | Enter the directory (`cd`), access contents |

> ⚠️ **Critical gotcha:** `w` on a **directory** lets you delete ANY file inside it, even files you have zero permissions on. This is why `/tmp` needs the sticky bit.

---

### Octal Notation Cheat Sheet

```
r = 4    w = 2    x = 1    - = 0

rwx = 4+2+1 = 7      (full access)
rw- = 4+2+0 = 6      (read + write)
r-x = 4+0+1 = 5      (read + execute)
r-- = 4+0+0 = 4      (read only)
--- = 0+0+0 = 0      (no access)
```

**Most common permissions to memorise:**

| Octal | Symbolic    | Use case                                           |
| ----- | ----------- | -------------------------------------------------- |
| `755` | `rwxr-xr-x` | Directories, public executables                    |
| `644` | `rw-r--r--` | Regular files, public configs                      |
| `600` | `rw-------` | **SSH private keys, .env files, secrets**          |
| `700` | `rwx------` | Private scripts, private directories (`~/.ssh/`)   |
| `640` | `rw-r-----` | App configs readable by group, not world           |
| `750` | `rwxr-x---` | Scripts for owner + group only                     |
| `400` | `r--------` | Read-only certificates, write-protected files      |
| `777` | `rwxrwxrwx` | **NEVER USE — world-writable = security disaster** |

---

### sudo — The Full Flow

```
You type: sudo apt install nginx
     │
     ▼
sudo reads /etc/sudoers — are you allowed?
     │
     ▼ (if yes)
sudo asks for YOUR password (not root's)
     │
     ▼
Runs command as root (just this one command)
     │
     ▼
Drops back to your user immediately
     │
     ▼
Logs to /var/log/auth.log — full audit trail
```

**Key rules:**

- `$` prompt = regular user. `#` prompt = root. Never forget this.
- `sudo -l` = see what commands you're allowed to run
- `sudo -u username cmd` = run as a specific user (not just root)
- `sudo -i` = full root shell (use sparingly, exit immediately when done)

---

### Special Bits

| Bit        | Octal Prefix | Symbolic                   | Where        | Effect                                            |
| ---------- | ------------ | -------------------------- | ------------ | ------------------------------------------------- |
| **SUID**   | 4            | `s` in owner `x` position  | Files        | Program runs as file's OWNER                      |
| **SGID**   | 2            | `s` in group `x` position  | Files / Dirs | File: runs as group. Dir: new files inherit group |
| **Sticky** | 1            | `t` in others `x` position | Directories  | Only file owners can delete their own files       |

```bash
# Real examples
-rwsr-xr-x  root root  /usr/bin/passwd     ← SUID: runs as root, not you
drwxrwsrwt  root staff /shared/project/    ← SGID + sticky
drwxrwxrwt  root root  /tmp                ← sticky: protects others' files
```

**Set special bits:**

```bash
chmod u+s file       # set SUID
chmod g+s dir        # set SGID on directory
chmod +t dir         # set sticky bit
chmod 4755 file      # SUID (4) + 755
chmod 2755 dir       # SGID (2) + 755
chmod 1777 dir       # sticky (1) + 777 (like /tmp)
```

---

### ACLs — Fine-Grained Permissions

```bash
getfacl file                       # view ACLs
setfacl -m u:alice:rw file         # give alice read+write
setfacl -m g:devteam:rx dir/       # give devteam read+execute
setfacl -x u:alice file            # remove alice's ACL entry
setfacl -d -m g:devteam:rw dir/   # default ACL (inherited by new files)
```

> When ACLs are set, `ls -la` shows a `+` at the end of the permission string: `-rw-r--r--+`

---

### The Principle of Least Privilege (PoLP)

> **Give every user, process, and service the MINIMUM permissions needed — nothing more.**

Applied in practice:

- Web server (`www-data`) → read `/var/www/`, write `/var/log/app/` → nothing else
- Database process (`postgres`) → owns `/var/lib/postgresql/` → no access to `/var/www/`
- Monitoring agent → read-only access to metrics endpoints → cannot modify anything
- CI/CD pipeline → write to deployment directory → cannot touch secrets

This is the foundation of Kubernetes RBAC, GCP IAM, AWS IAM, and every cloud security model.

---

## 💻 All Commands I Practiced

```bash
# ── READ PERMISSIONS ─────────────────────────────────────────────────
ls -la                               # view permission strings + owner + group
stat file                            # full details including octal
id                                   # your UID, GID, and all groups
groups username                      # all groups a user is in
getfacl file                         # view ACLs

# ── CHANGE PERMISSIONS ───────────────────────────────────────────────
chmod 755 script.sh                  # rwxr-xr-x (standard executable)
chmod 644 config.yaml                # rw-r--r-- (standard file)
chmod 600 ~/.ssh/id_rsa              # rw------- (private key — required by SSH)
chmod 700 ~/.ssh/                    # rwx------ (private directory)
chmod u+x script.sh                  # add execute for owner
chmod g-w file.txt                   # remove write from group
chmod o= file.txt                    # remove ALL from others
chmod -R 755 /var/www/html/          # recursive (use carefully!)

# ── CHANGE OWNERSHIP ─────────────────────────────────────────────────
chown alice file.txt                 # change owner
chown alice:devteam file.txt         # change owner AND group
chown :devteam file.txt              # change group only
chown -R www-data:www-data /var/www/ # recursive ownership

# ── SPECIAL BITS ─────────────────────────────────────────────────────
chmod u+s /usr/bin/myapp             # set SUID
chmod g+s /shared/project/          # set SGID on dir
chmod +t /tmp/shared/                # set sticky bit
chmod 4755 file                      # SUID + 755
chmod 2755 dir                       # SGID + 755
chmod 1777 dir                       # sticky + 777

# ── ACLs ─────────────────────────────────────────────────────────────
setfacl -m u:alice:rw file           # give alice rw
setfacl -m g:devteam:rx dir/         # give devteam rx
setfacl -x u:alice file              # remove alice's entry
setfacl -d -m g:devteam:rw dir/     # default ACL for new files
getfacl file                         # view all ACLs

# ── SUDO ─────────────────────────────────────────────────────────────
sudo apt update                      # run one command as root
sudo -u www-data ls /var/www/        # run as specific user
sudo -l                              # see your allowed sudo commands
sudo -i                              # root shell (exit immediately when done!)
sudo grep sudo /var/log/auth.log     # audit trail of all sudo usage

# ── SECURITY AUDITING ────────────────────────────────────────────────
find / -perm -4000 -type f 2>/dev/null   # all SUID files
find / -perm -2000 -type f 2>/dev/null   # all SGID files
find / -perm -0002 -type f 2>/dev/null   # world-writable files (security risk!)
find /etc -name "*.conf" -perm -o+w      # world-writable configs
```

---

## ⚡ War Story

**E-commerce company. Developer ran `chmod -R 777 /var/www/uploads/` to "quickly fix" a permission error.**

Three weeks later: attacker found a file upload vulnerability, uploaded a PHP web shell, executed it. The `777` uploads directory gave the shell everything it needed to exfiltrate the database.

**Result: 2.4 million customer records stolen. €4.2M GDPR fine.**

**The correct 2-minute fix:**

```bash
chown -R www-data:www-data /var/www/uploads/
chmod 755 /var/www/uploads/
```

Lesson: **Never chmod 777.** Diagnose the actual permission problem. `chown` to give the right user ownership is almost always the correct answer.

---

## 🎯 Interview Questions This Chapter Prepares Me For

1. **"Your web server is getting Permission Denied on its log directory. How do you fix it without using chmod 777?"**
   - Identify the user the web server runs as (`ps aux | grep nginx`), then `chown -R www-data:www-data /var/log/app/ && chmod 755 /var/log/app/`

2. **"Explain what the 's' in `-rwsr-xr-x` on `/usr/bin/passwd` means and why it's needed."**
   - SUID bit. passwd runs as root (the file's owner) regardless of who calls it, so it can write the new password hash to `/etc/shadow` — which only root can modify.

3. **"What is the Principle of Least Privilege and how does it apply to a microservices architecture?"**
   - Each service gets only the permissions it needs: read where it reads, write where it writes, no access to everything else. Maps directly to Kubernetes RBAC ServiceAccounts and GCP IAM roles.

4. **"You find a file with permissions 777 in /etc/. What do you do?"**
   - Immediately investigate: `stat file` to see owner. `ls -la` to confirm. Check git history if config-managed. Fix: `chmod 644 /etc/thefile`. Investigate why it was 777 — potential indicator of compromise or misconfiguration. Add to security audit checklist.

---

## ✅ Boss Challenge — Completed

- [ ] Decoded permission strings for `/etc/passwd`, `/etc/shadow`, `/bin/bash`, `/tmp`, `/usr/bin/passwd`
- [ ] Created `secret.txt` with `600`, verified with `stat`, changed to `644` and compared
- [ ] Created `team-share/` with SGID, created file inside, confirmed group inheritance
- [ ] Found all SUID files with `find / -perm -4000 -type f 2>/dev/null` and audited them
- [ ] Set an ACL entry with `setfacl`, verified with `getfacl`, confirmed `+` in `ls -la`
- [ ] Checked `/var/log/auth.log` for sudo audit trail
- [ ] ⭐ BONUS: Found world-writable files outside `/tmp` and investigated each one

---

## 💬 My Reflection

_(Write your own reflection here after completing the chapter)_

---

_← [Back to Phase 1](../README.md) · [← Ch 1.2](../ch-1.2-filesystem-kingdom/README.md) · [Ch 1.4 →](../ch-1.4-process-playground/README.md)_
