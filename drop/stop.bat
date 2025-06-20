@echo off
title Остановка туннеля
echo  Остановка 3proxy и SSH-туннеля...
taskkill /IM 3proxy.exe /F >nul 2>&1
taskkill /IM autossh.exe /F >nul 2>&1
echo  Остановлено.
pause
