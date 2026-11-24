@echo off
chcp 65001 >nul
title CaelumClip
cd /d "%~dp0"

echo.
echo  ==========================================
echo              C A E L U M C L I P
echo   Convierte videos largos en clips verticales
echo  ==========================================
echo.

REM --- 1. Docker Desktop tiene que estar instalado y abierto ---
where docker >nul 2>&1
if errorlevel 1 (
  echo  [!] No encontre Docker Desktop.
  echo      Instalalo gratis desde: https://www.docker.com/products/docker-desktop/
  echo      Luego vuelve a abrir este archivo.
  start "" "https://www.docker.com/products/docker-desktop/"
  pause
  exit /b 1
)

docker info >nul 2>&1
if not errorlevel 1 goto docker_listo
echo  Abriendo Docker Desktop, espera un momento...
if exist "%ProgramFiles%\Docker\Docker\Docker Desktop.exe" start "" "%ProgramFiles%\Docker\Docker\Docker Desktop.exe"
set /a intentos=0
:esperar_docker
timeout /t 5 /nobreak >nul
docker info >nul 2>&1
if not errorlevel 1 goto docker_listo
set /a intentos+=1
if %intentos% lss 36 goto esperar_docker
echo  [!] Docker no arranco. Abre Docker Desktop a mano y vuelve a intentar.
pause
exit /b 1
:docker_listo

REM --- 2. La clave gratis de Gemini (solo la primera vez) ---
if exist ".env" goto clave_lista
echo  Primera vez: necesito tu clave GRATIS de Google Gemini.
echo  Te abro la pagina. Inicia sesion, pulsa "Create API key" y copiala.
start "" "https://aistudio.google.com/app/apikey"
echo.
set /p GEMINI_KEY= Pega aqui tu clave y pulsa Enter: 
call :guardar_clave
:clave_lista

REM --- 3. Arrancar la app ---
echo.
echo  Arrancando CaelumClip... La primera vez tarda bastante (10-20 min)
echo  porque descarga todo lo necesario. Las siguientes veces es rapido.
echo.
docker compose up -d --build
if errorlevel 1 (
  echo  [!] Algo fallo al arrancar. Revisa los mensajes de arriba.
  pause
  exit /b 1
)

echo  Esperando a que la app este lista...
set /a intentos=0
:esperar_app
timeout /t 3 /nobreak >nul
curl -s -o nul http://localhost:5175 >nul 2>&1
if not errorlevel 1 goto app_lista
set /a intentos+=1
if %intentos% lss 100 goto esperar_app
:app_lista

start "" "http://localhost:5175"
echo.
echo  Listo! CaelumClip esta abierto en tu navegador: http://localhost:5175
echo  Para apagarla, abre DETENER.bat
echo.
pause
exit /b 0

:guardar_clave
> ".env" echo GEMINI_API_KEY=%GEMINI_KEY%
>> ".env" echo # Clave de Upload-Post (opcional, solo para publicar en redes)
>> ".env" echo # UPLOAD_POST_API_KEY=
exit /b 0
