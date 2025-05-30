# web-eggfallcode
Página web de muestra de archivos y documentos referenciados en el proyecto "EGGFALL"
# **Instrucciones de Despliegue:** #
⚙Requisitos del Sistema
Godot Engine versión 3.x

Sistema operativo: Windows, Linux o macOS para desarrollo

Android SDK + OpenJDK para exportar a Android (opcional)

Dispositivo Android (opcional, para pruebas móviles)

### **🚀 Configuración Inicial** ##
Clona o descarga el repositorio:
```
git clone https://github.com/usuario/nombre-del-proyecto.git
cd nEGGFALL
````

## **Ejecución en Escritorio** ##
Descarge el .zip y abralo desde Godot Engine.
Desde el editor de Godot, presiona F5 o haz clic en “Play” para ejecutar el juego.

Puedes interactuar con el menú principal, probar las escenas de juego y tienda.

## **📱 Despliegue en Android** ##
Si lo haces desde un dispositivo movil simplemente descarga EGGFALL.apk. (el cual no se encuentra en github porque pesa demasiado, estará adjuntado en la tarea) 
espera a que se descargue y pulse instalar, tras eso, toque el icono del juego y se ejecutará.

Si lo desea hacer desde un emulador o editor y luego instalarlo en el movil:
Configura la exportación a Android:

Ve a Project > Install Android Build Template.

Luego ve a Project > Export y añade el preset Android.

Configura el debug.keystore (o uno personalizado).

Asegúrate de que el campo Package/Unique Name tenga formato válido (org.tunombre.juego).

Exporta el APK:

En Project > Export, selecciona Android y pulsa Export Project.

Guarda el archivo .apk y transfiérelo al dispositivo Android.

Instala y prueba en el móvil:

Habilita la instalación de apps externas.

Instala el .apk y ejecuta el juego en el dispositivo.
