# ⚙️ Chapter 1.4 — Process Playground

> **Phase 1: Linux Roots** · Chapter 4 of 10 · ✅ Completed: **\_**

---

## 📊 Chapter Stats

| Field              | Details                                                                            |
| ------------------ | ---------------------------------------------------------------------------------- |
| **Status**         | ✅ Done                                                                            |
| **Date Started**   | 2026-03-25                                                                         |
| **Date Completed** | 2026-03-25                                                                         |
| **Time Spent**     | ~55 minutes                                                                        |
| **Self Score**     | — / 10                                                                             |
| **XP Earned**      | 150 ⭐                                                                             |
| **Lesson File**    | [View Interactive Lesson](../../lessons/phase1_chapter1.4_process_playground.html) |

---

## 🎯 What This Chapter Covers

- What a **process** is — program on disk vs program in memory (the recipe vs the chef cooking)
- **PID, PPID** — every process has a unique ID and a parent; PID 1 is always systemd
- The **process family tree** — tracing any process all the way back to systemd
- **fork() and exec()** — the two-step mechanism behind every command you run in the shell
- **ps, top, htop** — observing all running processes and reading load average
- **Signals** — SIGTERM, SIGKILL, SIGHUP, SIGINT, SIGSTOP, SIGCONT: how to talk to processes
- The **correct signal escalation ladder** — always SIGTERM first, SIGKILL as last resort
- **nice and renice** — controlling CPU priority (-20 highest → +19 lowest)
- **Process states** — R, S, D (unkillable!), Z (zombie), T (stopped)
- **/proc/PID** — the kernel's live directory for every running process

---

## 🔑 Key Concepts

### What is a Process?

```
Program (on disk)  →  Process (in memory, actively running)
recipe on paper    →  chef actively cooking
/usr/bin/nginx     →  nginx master (PID 502) + workers (PID 503, 504)
```

The kernel gives each process:

- A **PID** (unique number)
- A **PPID** (parent's PID)
- Memory space
- CPU time (in slices)
- File descriptors

---

### The Process Family Tree

```
PID 1  systemd             ← THE KING — first process ever started
  ├── PID 412  sshd        ← SSH daemon (child of systemd)
  │     └── PID 891  sshd  ← your SSH session (child of 412)
  │           └── PID 892  bash   ← your shell (child of 891)
  │                 └── PID 1043  ls  ← command you just ran (child of 892)
  ├── PID 502  nginx       ← web server
  │     ├── PID 503  nginx: worker
  │     └── PID 504  nginx: worker
  └── PID 700  prometheus  ← monitoring agent
```

**Key rule:** Every process has a parent. Orphaned processes get adopted by PID 1 (systemd).

---

### fork() and exec() — How Every Command is Born

```
You type: ls -la

Step 1 — fork()
  bash (PID 892) → calls fork()
  kernel creates exact COPY of bash → gets new PID 1043
  Now two processes exist: bash (892) and a bash-copy (1043)

Step 2 — exec()
  The copy (PID 1043) calls exec("/bin/ls", ["-la"])
  Kernel REPLACES the copy's memory with the ls program
  PID stays 1043 but it's now ls, not bash

Step 3 — wait()
  Original bash (892) waits for child (1043) to finish
  ls runs, prints output, exits
  bash gets notified → shows a new prompt
```

---

### Signals — The Language Between Processes

| Signal      | Number | Can be caught? | What it means                   | When to use              |
| ----------- | ------ | -------------- | ------------------------------- | ------------------------ |
| **SIGTERM** | 15     | ✅ Yes         | Polite "please stop gracefully" | **Always try first**     |
| **SIGKILL** | 9      | ❌ No          | Immediate forced death          | Last resort only         |
| **SIGHUP**  | 1      | ✅ Yes         | Reload config (for daemons)     | nginx/sshd config reload |
| **SIGINT**  | 2      | ✅ Yes         | Ctrl+C from keyboard            | Interactive interrupt    |
| **SIGSTOP** | 19     | ❌ No          | Freeze/pause the process        | Pause background work    |
| **SIGCONT** | 18     | ✅ Yes         | Resume a stopped process        | After SIGSTOP/Ctrl+Z     |

**The escalation ladder (always follow this order):**

```
1. kill -HUP PID    → try graceful reload first (if applicable)
2. kill -15 PID     → polite shutdown (wait 5-10 seconds)
3. kill -9 PID      → nuclear option if SIGTERM didn't work
```

---

### Process States

| State               | Symbol | Meaning                               | Action if many seen      |
| ------------------- | ------ | ------------------------------------- | ------------------------ |
| Running             | `R`    | Actively using CPU                    | Check load vs core count |
| Sleeping            | `S`    | Waiting for input/event               | Normal — no action       |
| **Uninterruptible** | `D`    | **Blocked on I/O — CANNOT be killed** | Check disk/NFS issues    |
| Zombie              | `Z`    | Exited but parent hasn't collected    | Kill parent to clear     |
| Stopped             | `T`    | Paused (Ctrl+Z or SIGSTOP)            | Send SIGCONT to resume   |

> ⚠️ **State D is the most dangerous** — SIGKILL doesn't work. You must fix the underlying I/O issue (disk full, failing disk, hung NFS mount).

---

### nice Values — CPU Priority

```
-20 ────────────── 0 ──────────────────── +19
 ↑                  ↑                       ↑
Most selfish    Default (normal)        Most polite
Highest priority   Most processes      Lowest priority
(requires root      start here         Background jobs
 for negative)                         Batch processing
```

**Rule of thumb:**

- Production services → nice 0 (default) or negative
- Batch jobs, backups, ML training → nice +15 to +19
- Never use negative nice values without a good reason

---

## 💻 All Commands I Practiced

```bash
# ── OBSERVE PROCESSES ────────────────────────────────────────────────
ps aux                              # all processes, every detail
ps aux --sort=-%cpu | head -10      # top CPU consumers
ps aux --sort=-%mem | head -10      # top memory consumers
ps auxf                             # with ASCII tree (forest view)
pstree -p                           # beautiful process tree with PIDs
top                                 # live — P=cpu, M=mem, q=quit
htop                                # better live view

# ── FIND PROCESSES ───────────────────────────────────────────────────
pgrep -a nginx                      # PID + command of all nginx processes
pidof nginx                         # just the PIDs
ps aux | grep [n]ginx               # grep trick (avoids matching grep itself)

# ── YOUR OWN PROCESS INFO ────────────────────────────────────────────
echo "PID: $$ PPID: $PPID"          # your shell's PID and parent PID
pstree -p $$                        # trace your shell back to systemd

# ── SIGNALS ──────────────────────────────────────────────────────────
kill -15 PID                        # SIGTERM — polite shutdown (always first)
kill -9 PID                         # SIGKILL — nuclear, last resort
kill -HUP PID                       # SIGHUP — reload config
kill -l                             # list ALL signal names + numbers
pkill -15 python                    # SIGTERM all processes named python
killall nginx                       # same as pkill nginx

# ── PRIORITY ─────────────────────────────────────────────────────────
nice -n 19 ./backup.sh              # start at lowest priority
nice -n 10 python batch-job.py      # start with reduced priority
sudo renice -n 18 -p PID            # lower running process priority
ps -o pid,ni,comm                   # see nice values

# ── /proc INSPECTION ─────────────────────────────────────────────────
cat /proc/PID/status                # state, memory, threads, PID, PPID
cat /proc/PID/cmdline | tr '\0' ' ' # exact command line
ls -la /proc/PID/fd | wc -l        # count open file descriptors
cat /proc/PID/environ | tr '\0' '\n'# environment variables
ls -la /proc/PID/cwd               # current working directory of process
cat /proc/PID/maps                 # memory map (what libraries are loaded)

# ── BACKGROUND JOBS ──────────────────────────────────────────────────
./long-script.sh &                  # run in background
jobs                                # list background jobs
fg %1                               # bring job 1 to foreground
nohup ./script.sh &                 # immune to terminal hangup
disown %1                           # detach from shell (survives logout)

# ── FIND ZOMBIES (production health check) ───────────────────────────
ps aux | awk '$8=="Z"'              # find zombie processes
```

---

## ⚡ War Story

**2am alert: "Server unreachable." 60,000+ zombie processes had filled the process table.**

A web app forked children for each request but never called `wait()` to collect their exit status. Each dead child became a zombie. After 48 hours of traffic, the process table was completely full — the kernel couldn't create new processes. Even `ls` failed.

**Diagnosis:**

```bash
# Find which parent is creating zombies
ps -el | awk '$2=="Z"{print $5}' | sort | uniq -c | sort -rn
```

**Fix:** Kill the parent process (kernel automatically collects all its zombie children), then fix the code to call `wait()`.

**Lesson:** Monitor zombie count as a production health metric. A few = normal. Dozens = investigate. Thousands = your server will crash.

---

## 🎯 Interview Questions This Chapter Prepares Me For

1. **"Explain the fork-exec model. What happens when you type 'ls' in bash?"**
   - bash calls fork() → exact copy created. Copy calls exec("/bin/ls") → transforms into ls. bash waits. ls runs, exits. bash resumes.

2. **"What is the difference between SIGTERM and SIGKILL? Which should you use first and why?"**
   - SIGTERM (15): polite request, process can catch it and clean up. SIGKILL (9): immediate kernel-level death, cannot be caught, no cleanup. Always SIGTERM first — gives the process a chance to save state, flush buffers, close connections. SIGKILL only if SIGTERM doesn't work after waiting.

3. **"A process is in state D and won't respond to kill -9. What's happening and how do you fix it?"**
   - State D = uninterruptible sleep = blocked on I/O. SIGKILL cannot work because the process is inside a kernel syscall waiting for hardware. Fix the I/O issue: check `iostat -x 1`, `df -h`, `dmesg | tail`. Process will exit D state once I/O resolves.

4. **"You have a long-running ML training job and a production API on the same server. How do you ensure the API always gets priority?"**
   - `nice -n 19` on the training job (lowest priority), API runs at default nice 0. Training job uses only leftover CPU. Monitoring: check load average vs core count.

---

## ✅ Boss Challenge — Completed

- [ ] Traced shell PID → PPID → PID 1 (systemd) using `pstree -p $$`
- [ ] Started `sleep 300 &`, found PID, checked /proc state, terminated with SIGTERM, verified gone
- [ ] Used SIGSTOP to pause a process, verified state T, resumed with SIGCONT
- [ ] Found top 5 CPU consumers and checked their nice values
- [ ] Started process with `nice -n 15`, then changed to `nice -n 19` with renice
- [ ] Explored `/proc/$$/fd` and identified stdin/stdout/stderr targets
- [ ] ⭐ BONUS: Checked for zombie processes and investigated any found

---

## 💬 My Reflection

_(Write your own reflection here after completing the chapter)_

---

_← [Back to Phase 1](../README.md) · [← Ch 1.3](../ch-1.3-permissions-powers/README.md) · [Ch 1.5 →](../ch-1.5-package-wizardry/README.md)_
