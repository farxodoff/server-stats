# 🖥️ Server Stats

A lightweight Bash script to analyze basic server performance statistics on any Linux system. This tool provides a quick overview of system resources, helping system administrators and DevOps engineers debug and monitor server performance.

> **Project from [roadmap.sh DevOps projects](https://roadmap.sh/projects/server-stats)**

---

## ✨ Features

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

## 📸 Sample Output

```
=======================================
        SERVER PERFORMANCE STATS
=======================================

--- CPU yuklamasi ---
 CPU band: 4.8 %

--- RAM ishlashi ---
 Umumiy:      4917 Mb
 Ishlatilgan: 463 Mb
 Bo'sh:       3835 Mb
 Foiz:        9.42 %

--- Disk ishlashi ---
 Umumiy:      79G
 Ishlatilgan: 6.8G
 Bo'sh:       68G
 Foiz:        10%

--- Top 5 CPU jarayonlari ---
USER       PID      %CPU   COMMAND
root       12013    0.4    [kworker/1:2-events]
root       12638    0.1    [kworker/0:2-events]
...

--- Top 5 RAM jarayonlari ---
USER       PID      %MEM   COMMAND
root       1257     0.8    /usr/libexec/fwupd/fwupd
root       368      0.5    /sbin/multipathd
...

=======================================
            System information
=======================================

 OS:                Ubuntu 24.04.4 LTS
 Ishlash vaqti:     up 3 days, 16 hours, 12 minutes
 O'rtacha yuklama:  0.00, 0.00, 0.00
 Kirgan userlar:    1
 Failed login:      7
```

---

## 📋 Requirements

- Linux operating system (tested on Ubuntu 24.04 LTS)
- Bash 4.0 or higher
- Standard Linux utilities: `top`, `free`, `df`, `ps`, `awk`, `sed`, `grep`, `uptime`
- `sudo` privileges (optional, only required for reading failed login attempts from `/var/log/auth.log`)

> All required utilities come pre-installed on most Linux distributions.

---

## 🚀 Installation & Usage

### 1. Clone the repository

```bash
git clone https://github.com/farxodoff/server-stats.git
cd server-stats
```

### 2. Make the script executable

```bash
chmod +x server-stats.sh
```

### 3. Run the script

```bash
./server-stats.sh
```

To include failed login statistics, run with `sudo`:

```bash
sudo ./server-stats.sh
```

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

---

## 📁 Project Structure

```
server-stats/
├── server-stats.sh    # Main script
└── README.md          # Project documentation
```

---

## 💡 Use Cases

- **Quick health check** — Get a snapshot of server performance in seconds
- **Debugging slow servers** — Identify resource-hungry processes instantly
- **Monitoring** — Schedule the script via cron for periodic reports
- **Learning Linux** — Great example of Bash scripting and system commands
- **Security audits** — Track failed login attempts

---

## 🔮 Future Improvements

- [ ] Color-coded output for better readability
- [ ] Network usage statistics
- [ ] Logging output to a file with timestamps
- [ ] Email/Slack alerts when thresholds are exceeded
- [ ] Configurable thresholds via config file

---

## 👤 Author

**Farxod**
- GitHub: [@farxodoff](https://github.com/farxodoff)

---

## 🔗 Project Reference

This project is part of the [roadmap.sh DevOps Projects](https://roadmap.sh/projects/server-stats) collection — a curated list of practical projects to build real-world DevOps skills.

---

⭐ If you found this project useful, please consider giving it a star!
