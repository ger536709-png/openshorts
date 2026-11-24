@echo off
chcp 65001 >nul
title CaelumClip - actualizar
cd /d "%~dp0"
where git >nul 2>&1
if errorlevel 1 (
  echo  [!] Para actualizar necesitas Git: https://git-scm.com/download/win
  pause
  exit /b 1
)
echo  Bajando la version mas nueva de CaelumClip...
git pull
docker compose up -d --build
echo  Listo. Abre http://localhost:5175
pause
