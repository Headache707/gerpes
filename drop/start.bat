@echo off
setlocal
title Proxy Tunnel Controller

:: Очистка старых логов
if exist autossh.log del /f /q autossh.log
if exist 3proxy.log del /f /q 3proxy.log

:: Проверка наличия файлов
if not exist 3proxy.exe echo  3proxy.exe not found & pause & exit
if not exist autossh.exe echo  autossh.exe not found & pause & exit
if not exist id_rsa echo  id_rsa (SSH key) not found & pause & exit
if not exist config.ini echo  config.ini not found & pause & exit

echo Запуск 3proxy...
start "" /MIN 3proxy.exe config.ini

echo Установка SSH-туннеля...
start "" /MIN autossh.exe -M 0 -N ^
  -o "StrictHostKeyChecking=no" ^
  -o "UserKnownHostsFile=NUL" ^
  -R 9001:127.0.0.1:1080 tunnel@your-vps.com -p 2222 ^
  -i id_rsa > autossh.log 2>&1

echo Всё готово. Сверни окно, но не закрывай.
pause
