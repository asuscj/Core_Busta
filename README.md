# Core Dofus Busta 6.3.7 - Reconstrucción Open Source

![Logo del Proyecto](https://i.imgur.com/example.png) Un proyecto comunitario para reconstruir y limpiar el cliente (Core) de Dofus 1.29, proporcionando un archivo `.fla` limpio y funcional para facilitar el desarrollo y la personalización.



## 📖 Introducción

Este repositorio nace de la necesidad de tener una base de trabajo sólida para la comunidad de desarrolladores de Dofus. El proceso de descompilar el  `core.swf` original con herramientas como JPEXS a menudo resulta en un archivo `.fla` con errores, código ofuscado y una librería desorganizada.

El objetivo de este proyecto es hacer todo ese trabajo pesado una sola vez, ofreciendo un **`.fla` de Adobe Flash CS6 estable y fácil de editar** para que cualquiera pueda empezar a modificar el cliente sin los dolores de cabeza iniciales.

---

## ✨ Características Principales

* **Base Limpia:** Archivo `.fla` reconstruido a partir de la descompilación, con correcciones iniciales aplicadas.
* **ActionScript 2.0:** Todo el código fuente está en AS2, listo para ser editado y compilado.
* **Librería Organizada:** Trabajo en proceso para limpiar y nombrar correctamente los símbolos y MovieClips.
* **Correcciones Clave:** Incluye arreglos para bugs conocidos que surgen post-descompilación (ver Estado del Proyecto).
* **Comunitario:** ¡Cualquier ayuda o contribución es bienvenida!

---

## ⚙️ Tecnologías Utilizadas

* **Adobe Flash CS6:** El entorno de desarrollo principal para editar el archivo `.fla`.
* **ActionScript 2.0:** El lenguaje de programación del cliente.
* **JPEXS Free Flash Decompiler:** La herramienta utilizada para la descompilación del script.
* * **sothink swf decompiler:** La herramienta utilizada para la descompilación del .fla.

---

## 🚀 Cómo Empezar

Para compilar y usar este core, necesitarás tener instalado Adobe Flash CS6.

### Pasos para la Configuración

1.  **Clona el repositorio:**
    ```sh
    git clone [https://github.com/(TU](https://github.com/(TU) USUARIO)/(LINK-AL-REPOSITORIO).git
    ```

4.  **Compila el Core:**
    * En Flash CS6, ve a **Control -> Probar Película** (o presiona `Ctrl + Enter`).
    * Esto generará el archivo `core.swf` (o el nombre que tenga configurado) en la carpeta de destino.

5.  **¡Listo!** Ya puedes usar el `core.swf` generado con tu emulador.

---

## 📊 Estado Actual y Hoja de Ruta

Este es el estado actual de la reconstrucción. Las tareas marcadas con ✅ están completadas.

* [x] Descompilación base del SWF original a `.fla`.
* [x] Corrección de errores críticos en bucles de `MapHandler.as` (Soluciona el dibujo de las celdas de posicionamiento de combate).
* [ ] Reparación completa y optimización del **Modo Táctico**.
* [ ] Limpieza y renombrado de la librería de símbolos para una navegación más fácil.
* [x] Refactorización de código ofuscado a un formato más legible.
* [ ] Documentación interna del código para explicar funciones clave.
* [ ] Optimización general del rendimiento.

---

## 🤝 Cómo Contribuir

¡Las contribuciones hacen que la comunidad de código abierto sea un lugar increíble para aprender, inspirar y crear! Cualquier aporte que hagas será **muy apreciado**.

Si quieres contribuir, por favor sigue estos pasos:

1.  **Haz un Fork** del proyecto.
2.  Crea tu propia rama de características (`git checkout -b feature/MiCaracteristicaIncreible`).
3.  **Haz Commit** de tus cambios (`git commit -m 'Añade una característica increíble'`).
4.  **Haz Push** a tu rama (`git push origin feature/MiCaracteristicaIncreible`).
5.  Abre una **Pull Request**.

---

## 📜 Licencia

Distribuido bajo la Licencia MIT. Ver `LICENSE.txt` para más información.

**Aviso Legal:** Este proyecto se realiza con fines educativos y de aprendizaje. No incluye activos gráficos, de sonido ni de ninguna otra índole propiedad de **Ankama Games**. Se recomienda usarlo junto con los archivos legítimos del juego.

---

## ✉️ Contacto

cjec#7809  -  Discord

Link del Proyecto: https://github.com/asuscj/Core_Busta
