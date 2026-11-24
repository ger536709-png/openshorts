# CaelumClip

CaelumClip convierte videos largos en clips verticales (9:16) para TikTok, Reels y YouTube Shorts:
la IA elige los mejores momentos, sigue las caras, pone subtítulos y títulos gancho.

Es tu versión personal de [OpenShorts](https://github.com/mutonby/openshorts) (licencia MIT), en español,
y corre **gratis** en tu computadora.

## Qué necesitas (una sola vez)

1. **Docker Desktop** (gratis): https://www.docker.com/products/docker-desktop/
   Instálalo, ábrelo y deja que termine de arrancar.
2. **Tu clave gratis de Google Gemini**: https://aistudio.google.com/app/apikey
   Inicia sesión con tu cuenta de Google y pulsa "Create API key".
3. **Esta carpeta en tu computadora.** En GitHub pulsa el botón verde **Code → Download ZIP**,
   y descomprímelo, por ejemplo en `Documentos\CaelumClip`.
4. Una computadora con al menos **8 GB de RAM**.

## Cómo usarla

- **Abrir:** doble clic en `INICIAR.bat`. La primera vez te pide la clave de Gemini y tarda
  entre 10 y 20 minutos en preparar todo. Después abre en un minuto.
  La app se abre sola en tu navegador en http://localhost:5175
- **Apagar:** doble clic en `DETENER.bat`.
- **Actualizar** (si la descargaste con Git): doble clic en `ACTUALIZAR.bat`.

## Hacer clips

1. Pega el enlace de un video (YouTube, TikTok, Instagram…) o sube un archivo MP4.
2. Deja el formato en 9:16.
3. Marca la casilla de derechos y pulsa **Generar clips**.
4. Cuando terminen, descárgalos uno por uno o todos juntos en un ZIP.

## Costos

- La app: **$0**.
- Gemini: **$0** con la clave gratis (tiene un límite diario de uso; alcanza para varios videos al día).
- Opcionales y de pago aparte: publicar directo en redes (Upload-Post tiene plan gratis),
  doblaje de voz (ElevenLabs) y actores de IA (fal.ai).

## Si algo falla

- *"No encontré Docker Desktop"*: instálalo (paso 1) y vuelve a abrir `INICIAR.bat`.
- *Te equivocaste de clave de Gemini*: borra el archivo `.env` de esta carpeta y vuelve a abrir `INICIAR.bat`.
- *La página no abre*: espera un par de minutos más y entra a http://localhost:5175

## Licencia

El código base es de OpenShorts bajo licencia MIT (ver `LICENSE`). La carpeta `cloud/` tiene su propia
licencia (`cloud/LICENSE`): se permite usarla para uso personal, pero no ofrecerla como servicio a otras personas.
