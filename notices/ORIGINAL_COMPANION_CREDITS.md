# Créditos y procedencia

- Adaptador, lector, modelo de catálogo y composición de interfaz: implementados para Imperial Galactic Map, reutilizando versiones anteriores del proyecto.
- MinHook 1.3.4, Tsuda Kageyu y colaboradores: detours integrados. Código y licencia BSD de dos cláusulas en FUENTE/minhook. https://github.com/TsudaKageyu/minhook
- NMS.py, monkeyman192: referencia para firmas NanoVG y tipos; no es dependencia de ejecución. Licencia MIT incluida en INVESTIGACION/NMS.py-LICENSE.txt. https://github.com/monkeyman192/NMS.py
- Nozavolochen: referencia conceptual previa del proxy XInput; no se integra ni redistribuye su framework. https://github.com/Nozavolochen/framework
- Glifos de portal: formas derivadas de NMS Glyphs, copyright Hello Games y Stephan van der Feest (2017), según los metadatos de la fuente. Fuente de referencia: https://nmsportals.github.io/fonts/NMS-Glyphs-Mono.ttf . Se incluyen contornos triangulados, no el archivo TTF. No se ha localizado una licencia explícita: no se presentan como arte original del proyecto ni se afirma licencia OFL. Considerar estos derechos antes de una publicación pública.
- La propuesta visual generada anteriormente sirve como referencia de composición. No se usa como recurso en ejecución ni como evidencia de funcionamiento.

No se distribuyen NMS.exe, PAK originales ni guardados personales. No se han usado recursos de otro mod de Nexus en este catálogo. Se conserva material de investigación y licencias de las dependencias referenciadas.

V0.43: normalización de las cajas visibles de los contornos de glifos, observador de mensajes de ventana y modelo de cursor relativo propios del proyecto.

V0.44: el punto BeginInput se identificó mediante la firma y nombre de NMS.py y se contrastaron disposición de datos y llamadas con los ejecutables aportados. El adaptador nativo y pruebas son del proyecto. No se usa el observador Win32 de v0.43.

V0.45: observación de entorno, nombres y clasificación de piratas, almacén de exploración, atajo de favoritos y calavera geométrica implementados para este proyecto. La firma/nombre de IsOnPlanet procede de la referencia NMS.py; offsets y llamadas se contrastaron con los ejecutables aportados. Los esquemas de metadatos se contrastaron con MBINCompiler y la reflexión del EXE. No se integra MBINCompiler en la DLL.

Companion v0.10: aplicacion Windows Forms/C#, lector LZ4, importacion por GUID, exportacion por fusion y editor/conversor de iconos implementados para este proyecto. No integra editores ni recursos de otros mods. Usa bibliotecas del sistema .NET Framework. El atlas de glifos procede de los mismos contornos indicados arriba; no se afirma licencia de redistribucion libre. DLL v0.46: lector local de iconos y adaptador de dibujado propio; conserva MinHook y sus licencias.
