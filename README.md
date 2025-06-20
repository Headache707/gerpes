
````markdown
# 🧬 Gerpes

**Gerpes** is a modular system for deploying mobile proxy endpoints using a dual-sided architecture:  
**drop** → connects to the internet and forwards traffic  
**server** → receives the tunnel and exposes a SOCKS5 proxy

No external dependencies, no installation, no bullshit — just pure ops-focused design.

---

## 🧭 Project Structure

```plaintext
gerpes/
├── drop/       ← Windows capsule that creates the tunnel and local proxy
└── server/     ← Linux server accepting reverse SSH and serving proxy outside
````

---

## ⚙️ What Gerpes Does

| Role     | Environment | Purpose                                 |
| -------- | ----------- | --------------------------------------- |
| `drop`   | Windows     | Starts 3proxy and autossh, connects out |
| `server` | Linux (VPS) | Receives reverse tunnel, runs 3proxy    |

It turns **a cheap SIM box + Windows device** into a **remote mobile proxy**, usable from any part of the internet with authentication.

---

## 🧱 Drop Capsule (Windows)

Inside `/drop/` you’ll find everything needed to run the client side:

### Includes:

* `3proxy.exe` — tiny SOCKS5 proxy server
* `autossh.exe` — stable reverse SSH tunnel
* `id_rsa` — private key to connect to server
* `start.bat` / `stop.bat` — run and terminate the tunnel
* `config.ini` — proxy config (login/password, port 1080)
* `README_drop.txt` — full user guide for zero-prep deployment

📌 Run `start.bat` once → your mobile IP becomes accessible from the server.

---

## 🖥 Server Side (Linux)

Inside `/server/` are all configs and guides to install 3proxy as a service, configure SSH daemon, and accept tunnels from the dropper.

### Includes:

* `3proxy.cfg` — logs, auth, port binding (`9001`)
* `3proxy.service` — systemd unit
* `3proxy.logrotate` — log rotation policy
* `README_server.txt` — step-by-step setup for clean VPS

The server listens only on `localhost:9001`. The tunnel binds this port from remote.

---

## 🔐 Default Access Credentials

```text
Username: admin
Password: supersecure
```

You can change them in both `config.ini` (drop) and `3proxy.cfg` (server).

---

## 🌐 Usage Example

After setup:

```bash
curl -x http://admin:supersecure@your-vps.com:9001 http://ipinfo.io
```

If the IP matches the drop's mobile network — success.

---

## 🔧 Requirements

### Drop (client):

* Windows 10+
* Mobile connection (via SIM, USB modem, or tethering)
* Nothing installed, no admin rights needed

### Server (host):

* Ubuntu/Debian-based VPS
* `openssh-server`, `gcc`, `make`, `git`
* One SSH port open (e.g. 2222)

---

## 🤖 Who It's For

* Automation engineers who need real mobile IPs
* OSINT or ad verification teams
* Builders of high-resilience proxy farms
* People who want stealth with control

---

## 📂 Files Overview

| File                    | Description                       |
| ----------------------- | --------------------------------- |
| `drop/start.bat`        | Launches local proxy + tunnel     |
| `drop/stop.bat`         | Kills both processes              |
| `server/3proxy.cfg`     | Proxy config on the VPS           |
| `server/3proxy.service` | Makes proxy autostart via systemd |
| `*.log`                 | Runtime logs (created at launch)  |

---

## 📜 License

GPL3 LICENSE SYNOPSIS
TL;DR* Here's what the license entails:

1. Anyone can copy, modify and distribute this software.
2. You have to include the license and copyright notice with each and every distribution.
3. You can use this software privately.
4. You can use this software for commercial purposes.
5. If you dare build your business solely from this code, you risk open-sourcing the whole code base.
6. If you modify it, you have to indicate changes made to the code.
7. Any modifications of this code base MUST be distributed with the same license, GPLv3.
8. This software is provided without warranty.
9. The software author or license can not be held liable for any damages inflicted by the software.

---

## 👤 Author

Architect of behavioral digital systems. Infrastructure optimizer for multi-account ecosystems. Specialist in trusted digital structures within high-risk environments.

````

---

# Resume (English draft)

```markdown
## 📄 Resume

Dmitri Yukhno 
Age: 27  
Location: Samar, Ukraine
Contacts: +380677709167 • dokkodo707@gmail.com • Telegram: @Headache707

---

### 🧍‍♂️ About Me

Resilient. Self-made. Systemic. From digging trenches to architecting complex systems — I didn’t just study it, I lived it.  
I’ve been through 20+ lives, official and unofficial. I don’t seek stability — I create momentum.  
I don’t just write code — I build living, breathing systems.

Practicing Zen Buddhism for 8+ years. Not for status. Because silence in the storm is my standard.

I don’t break. I don’t twitch. I create. And I don’t stop.

---

### 🛠 Core Competencies

* System Architecture — end-to-end solutions, automation, backends  
* JavaScript Development — full stack: browser, server, automation  
* Anti-detect & Masking — Dolphin Anty, multi-profiles, fingerprint management  
* Sales & Leadership — fieldwork, team growth, deal closing  
* Physical Labor & Construction — solid foundation: concrete, tools, people  
* Automation & Intelligence — autonomous agents and bots building  
* Adaptability — 20+ jobs, zero burnout. I don’t look for roles — I become indispensable.

---

### 🧱 Selected Experience

#### 🔧 Laborer → Foreman

*Construction Sites | 2012–2017*  
- Started at 16 with a shovel  
- By 19, seasoned workers listened to me.

#### 💼 Salesperson → Export Department Manager

*Retail, B2B | 2017–2019*  
- From cold calls to revenue records  
- Led sales teams, trained and coached warriors.

#### 👨‍💻 Freelance Developer, System Architect

*Automation, gray/white projects | 2019–present*  
- Built anti-detect bots and capsules in JavaScript  
- Created autoclick systems with time logic and behavior masking  
- Used Dolphin Anty, Puppeteer, Node.js, SQLite

#### ⚙️ Creator, Entrepreneur

*Microprojects, SaaS, Consulting | ongoing*  
- Solo operator: code, test, deploy, monetize  
- No investors. No noise. Only results.

---

### 🌐 Skills & Tools

* Languages: JavaScript, Node.js, HTML, CSS, Bash  
* Tools: Dolphin Anty, Puppeteer, SQLite, Express, REST API  
* DevOps: Scraping, bot farms, profile orchestration, cron scripts  
* Mindset: cold logic, Zen rhythm, calm under pressure

---

### 📚 Education

Lyceum graduate — with respect and warmth.  
Translator diploma. But deeply trained by life, labor, and silence.

---

### 🧘 Noteworthy Facts

* 8+ years practicing Zen Buddhism — not for show, but foundation  
* Repelled a pack of stray dogs by staring down the alpha — walked away unharmed  
* Worked in white, gray, and dark zones — always with balance  
* This resume might not be sterile. But my character is steel.

---

### 🚪 Closing

I’m not here to impress.  
I’m here to work.  
If you need a cold executor, a steady mind, and systems that don’t break —  
I’m ready.
