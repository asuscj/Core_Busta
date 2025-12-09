# Modo Héroes ? Checklist de QA y pruebas manuales

Usa esta lista para validar extremo a extremo.

## Preparación
- Cuenta con ?2 héroes en BD y líder definido.
- Cliente conectado a servidor con soporte de prefijo.

## Casos felices
1) Listado de héroes
- [ ] Al conectar/abrir panel, se muestran todos los héroes con nombre, nivel, aspecto.
- [ ] Sin duplicados ni huecos erróneos.

2) Abrir inventario por héroe
- [ ] Desde panel, abrir inventario de cada héroe.
- [ ] Cambiar cantidad/equipo refleja solo el héroe destino.

3) Cambio de líder
- [ ] Solicito cambio al héroe B; banner y atajos ahora aplican a B.
- [ ] `HhL` recibido con el id correcto.

4) Actualización en caliente del panel
- [ ] Alta/baja de héroe en servidor dispara `HhA` y el panel se repuebla sin reiniciar.

## Bordes/errores
- [ ] Mensaje `V*` con `heroId` inexistente no rompe el cliente; servidor responde `He1`.
- [ ] Respuesta de inventario sin `heroId` no se aplica (o se descarta con log).
- [ ] Prefijo con héroe de otra cuenta es rechazado.

## Rendimiento/UX
- [ ] Repoblado `HhA` es fluido (<200 ms percibido en cliente típico).
- [ ] No hay parpadeos notables del panel al refrescar.

## Criterios de aceptación
- Todos los checks de Casos felices pasan.
- No hay errores JS/Flash ni trazas rojas en logs de cliente/servidor.
