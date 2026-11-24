@echo off
chcp 65001 >nul
title CaelumClip - apagar
cd /d "%~dp0"
echo  Apagando CaelumClip...
docker compose down
echo  Listo, CaelumClip esta apagada.
pause
