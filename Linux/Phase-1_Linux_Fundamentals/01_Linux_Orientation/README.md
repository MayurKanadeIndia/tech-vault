# Phase 1, Lesson 1.1 — Linux Orientation

## What is Linux?

Linux is an **operating system** — the layer between you and the hardware. When you say "open this file" or "run this program," Linux translates that into instructions the CPU, RAM, and disk can understand.

Linux isn't one thing. There's a core (the **kernel**) that everyone shares, but each distribution (**distro**) adds its own package manager, default tools, and configuration choices.

---

## The Three Layers

1. **Hardware** — the physical machine: CPU, RAM, disk, network card.
2. **Kernel** — the core of Linux. Talks directly to hardware. Manages memory, schedules processes, handles I/O, controls devices via drivers and interrupts.
3. **Userspace** — everything above the kernel. Your shell, applications, scripts. This is where you live as an engineer.

**Why it matters in production:** When a server misbehaves, knowing which layer the problem is in (hardware? kernel? userspace app?) is the first triage decision an SRE makes.

---

## Kernel vs Userspace

When you type `ls`, here's what happens:

1. Your **shell** (userspace) reads the command
2. It asks the **kernel** via a **system call** ("give me directory contents")
3. The kernel uses **device drivers** to talk to the disk (hardware)
4. Data flows back: kernel → shell → screen

![alt text](images/command_execution.png)

## Example: The journey of `ls` execution in detail

![alt text](images/ls_journey.png)

**Key correction:** System calls flow from userspace → kernel. The kernel does NOT use system calls to talk to hardware — it uses device drivers and interrupts. System calls are the API that userspace uses to request things from the kernel.

Tools like `strace` let you watch every system call an app makes — this is the exact boundary between userspace and kernel.

---

## Distros That Matter for SRE Work

| Distro                       | Package Manager | Where You'll See It     |
| ---------------------------- | --------------- | ----------------------- |
| Ubuntu / Debian              | `apt`           | Cloud, startups         |
| CentOS / RHEL / Rocky / Alma | `yum` / `dnf`   | Enterprises, banks      |
| Amazon Linux                 | `yum` / `dnf`   | AWS EC2                 |
| Alpine                       | `apk`           | Docker containers (5MB) |

Once you know one well, switching is easy. The kernel is the same — differences are mostly in package management and default configs.

---

## Terminal vs GUI — Why Terminal Wins in Production

Production servers have **no GUI**. Why?

- GUIs consume CPU and RAM that should serve users
- GUIs can't be automated — you can't script a mouse click at 3 AM
- GUIs don't scale — you can't click through 500 servers
- SSH gives you remote terminal access, not a desktop

Every production task happens in the terminal. CLI mastery is non-negotiable.

---

## How Big Tech Uses Linux

At FAANG-scale, almost everything runs on Linux. Google runs a custom internal distro. Meta, Netflix, Amazon — all Linux. Your laptop might run macOS, but every server you'll manage runs Linux. Kubernetes nodes, cloud VMs, CI/CD runners — Linux underneath.

As an SRE, you're expected to SSH into a broken production machine at 2 AM and fix it using only the terminal, under pressure, with customers affected.

---

## Common Beginner Mistakes

- **"I'll just use the GUI."** You won't have one in production.
- **"All distros are the same."** Mostly true for core concepts, but package managers, init systems, and default paths differ. Know at least two families.
- **"I don't need to understand the kernel."** You don't need kernel source code, but understanding what the kernel does is critical for debugging.

---

## Hands-on Lab

Setup options:

- **Option A (recommended):** Ubuntu 22.04/24.04 in VirtualBox or UTM
- **Option B (Windows quick start):** WSL2 + Ubuntu from Microsoft Store
- **Option C:** Native Linux or macOS with a Linux VM

Run these orientation commands:

```bash
# Kernel version
uname -r

# Full system info
uname -a

# Distro details
cat /etc/os-release

# How long the system has been up + load averages
uptime

# Current user
whoami

# Machine name
hostname

# Current shell (note: case-sensitive!)
echo $SHELL
```

---

## Key Takeaway

**Linux is case-sensitive everywhere** — file names, commands, variables, paths. `$SHELL` and `$shell` are different things. This bites even experienced engineers in production.

---

## Mini Tasks

1. Run all 7 commands above and note what each tells you
2. Identify your kernel version and distro version
3. Look at the load averages in `uptime` output (we'll cover these deeply later)
4. In your own words, explain the difference between kernel and userspace
