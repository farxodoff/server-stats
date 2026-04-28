# 🖥️ Server Stats

A lightweight Bash script to analyze basic server performance statistics on any Linux system. This tool provides a quick overview of system resources, helping system administrators and DevOps engineers debug and monitor server performance.

> **Project from [roadmap.sh DevOps projects](https://roadmap.sh/projects/server-stats)**

---

### 📊 Core Statistics
- **CPU Usage** — Total CPU utilization percentage
- **Memory Usage** — RAM usage with free, used, and percentage details
- **Disk Usage** — Storage usage with free, used, and percentage details
- **Top 5 Processes by CPU** — Most CPU-intensive processes
- **Top 5 Processes by Memory** — Most memory-intensive processes

### 🔧 Additional System Info
- Operating System version
- System uptime
- Load average (1, 5, 15 minutes)
- Currently logged-in users
- Failed login attempts (security monitoring)

---

## 📋 Requirements

- Linux operating system (tested on Ubuntu 24.04 LTS)
- Bash 4.0 or higher
- Standard Linux utilities: `top`, `free`, `df`, `ps`, `awk`, `sed`, `grep`, `uptime`
- `sudo` privileges (optional, only required for reading failed login attempts from `/var/log/auth.log`)

> All required utilities come pre-installed on most Linux distributions.

---

## 🛠️ Technologies & Concepts Used

| Tool/Concept | Purpose |
|--------------|---------|
| **Bash** | Scripting language |
| `top` | Real-time CPU statistics |
| `free` | Memory information |
| `df` | Disk space information |
| `ps` | Process list and sorting |
| `awk` | Text processing and column extraction |
| `sed` | Text substitution |
| `grep` | Pattern matching |
| `cut`, `xargs` | String manipulation |
