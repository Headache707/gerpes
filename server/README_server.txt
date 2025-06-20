Отлично. Ниже — **README для сервера**, рассчитанный на полный **ноль инфраструктуры**, кроме предоставленных мной файлов. Подходит для чистого VPS или только что поднятой машины.

---

# 📘 `README_server.txt` — Полное руководство для настройки сервера

> **Цель:** поднять серверную часть мобильного прокси, чтобы принимать туннель от дропа и отдавать выход в интернет через 3proxy.

---

## 📦 Состав предоставленных файлов

- `3proxy` — бинарный прокси-сервер
- `3proxy.cfg` — конфигурация
- `3proxy.service` — systemd-юнит
- `3proxy.logrotate` — лог-ротация
- `ddrop_id_rsa.pub` — публичный ключ дропа
- `README_server.txt` — это ты читаешь

---

## 🖥️ Шаг 1: Установка SSH-сервера (если его нет)

```bash
apt update && apt install openssh-server -y
systemctl enable ssh
systemctl start ssh
```

---

## 👤 Шаг 2: Создать пользователя `tunnel`

```bash
adduser tunnel
usermod -s /usr/sbin/nologin tunnel
mkdir -p /home/tunnel/.ssh
cp ddrop_id_rsa.pub /home/tunnel/.ssh/authorized_keys
chmod 600 /home/tunnel/.ssh/authorized_keys
chown -R tunnel:tunnel /home/tunnel/.ssh
```

---

## 🔐 Шаг 3: Настроить `sshd_config`

Открыть конфиг:

```bash
nano /etc/ssh/sshd_config
```

Добавить в самый конец:

```conf
Match User tunnel
    PermitOpen 127.0.0.1:9001
    AllowTcpForwarding yes
    X11Forwarding no
    ForceCommand echo 'This account is for tunnels only.'
```

Сохранить и перезапустить SSH:

```bash
systemctl restart ssh
```

---

## 🧱 Шаг 4: Установка 3proxy

```bash
apt install git make gcc -y
git clone https://github.com/z3APA3A/3proxy.git
cd 3proxy
make -f Makefile.Linux
cp src/3proxy /usr/local/bin/
```

---

## ⚙️ Шаг 5: Скопировать конфиги

```bash
mkdir -p /etc/3proxy
cp /root/3proxy.cfg /etc/3proxy/3proxy.cfg
cp /root/3proxy.service /etc/systemd/system/3proxy.service
cp /root/3proxy.logrotate /etc/logrotate.d/3proxy
```

---

## 🚀 Шаг 6: Запуск 3proxy

```bash
systemctl daemon-reexec
systemctl enable 3proxy
systemctl start 3proxy
systemctl status 3proxy
```

---

## 🔁 Шаг 7: Проверка туннеля от дропа

После запуска `start.bat` у дропа:

```bash
netstat -tnlp | grep 9001
```

Если видишь `127.0.0.1:9001` — туннель активен.

---

## 🌐 Шаг 8: Проверка прокси

```bash
curl -x http://admin:supersecure@127.0.0.1:9001 http://ipinfo.io
```

Если IP = мобильной сети дропа — всё работает.

---

## 🧹 Шаг 9: Лог-ротация

```bash
logrotate --debug /etc/logrotate.d/3proxy
```

---

## ✅ Готово

Серверная часть настроена. Ты можешь подключаться через прокси:
```text
http://admin:supersecure@your-vps.com:9001
```
