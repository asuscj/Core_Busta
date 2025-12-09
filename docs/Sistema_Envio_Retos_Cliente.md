# Sistema de Envío de Retos del Servidor al Cliente

## Descripción General

El sistema de retos en el servidor Dofus permite mostrar desafíos especiales durante las peleas PvM (Jugador vs Monstruo), proporcionando bonificaciones de experiencia y drop adicionales si se completan exitosamente.

## Arquitectura del Sistema

### Archivos Principales

- **`ServidorSocket.java`**: Maneja la comunicación cliente-servidor y procesamiento de paquetes
- **`GestorSalida.java`**: Gestiona el envío de paquetes específicos al cliente
- **`Reto.java`**: Define la estructura y estados de un reto
- **`Pelea.java`**: Controla la lógica de peleas y gestión de retos
- **`Constantes.java`**: Define los tipos de retos y sus configuraciones

## Flujo de Envío de Retos

### 1. Inicialización de Retos

```java
// En Pelea.java - método crearRetos()
if (_tipo == Constantes.PELEA_TIPO_PVM || _tipo == Constantes.PELEA_TIPO_PVM_NO_ESPADA) {
    _retos = new ConcurrentHashMap<>();
    
    // Selección aleatoria de retos
    byte retoID = retosAlAzar[Formulas.getRandomInt(0, retosAlAzar.length - 1)];
    _retos.put(retoID, Constantes.getReto(retoID, this));
}
```

### 2. Envío al Cliente

#### A. Cuando un jugador se une a la pelea
```java
// En Pelea.java - método enviarRetosPersonaje()
private void enviarRetosPersonaje(Personaje perso) {
    if (_retos == null) return;
    
    if (_tipo == Constantes.PELEA_TIPO_PVM || _tipo == Constantes.PELEA_TIPO_PVM_NO_ESPADA) {
        for (Reto reto : _retos.values()) {
            GestorSalida.ENVIAR_Gd_RETO_A_PERSONAJE(perso, reto.infoReto());
        }
    }
}
```

#### B. A todos los luchadores durante la pelea
```java
// En Pelea.java - método finalizarPos()
for (final Entry<Byte, Reto> entry : _retos.entrySet()) {
    final Reto reto = entry.getValue();
    GestorSalida.ENVIAR_Gd_RETO_A_LOS_LUCHADORES(this, reto.infoReto());
}
```

## Paquetes de Red

### Paquetes Enviados al Cliente

#### 1. Mostrar Reto Inicial
- **Función**: `ENVIAR_Gd_RETO_A_PERSONAJE()` / `ENVIAR_Gd_RETO_A_LOS_LUCHADORES()`
- **Formato**: `Gd` + información del reto
- **Contenido**: 
  ```
  id;esLupa;mobObjetivo;bonusXPFijo;bonusXPGrupo;bonusPPFijo;bonusPPGrupo;estado
  ```

#### 2. Reto Completado Exitosamente
- **Función**: `ENVIAR_GdaK_RETO_REALIZADO()`
- **Formato**: `GdaK` + ID del reto
- **Cuándo**: Cuando el reto se completa con éxito

#### 3. Reto Fallado
- **Función**: `ENVIAR_GdaO_RETO_FALLADO()`
- **Formato**: `GdaO` + ID del reto
- **Cuándo**: Cuando no se cumple la condición del reto

#### 4. Mostrar Objetivo de Reto (Lupa)
- **Función**: `ENVIAR_Gf_MOSTRAR_CELDA()`
- **Formato**: `Gf` + ID luchador + ID celda
- **Cuándo**: Para retos que requieren eliminar un monstruo específico

### Paquetes Recibidos del Cliente

#### Consultar Objetivo de Reto
- **Formato**: `Gdi` + ID del reto
- **Procesado en**: `ServidorSocket.juego_Retos()`
- **Acción**: Muestra la celda del objetivo del reto

## Estados de los Retos

```java
public enum EstReto {
    EN_ESPERA,  // Reto activo, esperando cumplimiento
    REALIZADO,  // Reto completado exitosamente
    FALLADO     // Reto no cumplido
}
```

## Tipos de Retos Principales

### Retos Estándar
- **RETO_ZOMBI** (1): Usar solo 1 PM por turno
- **RETO_ESTATUA** (2): Terminar turno en misma casilla
- **RETO_AHORRADOR** (5): Cada acción solo una vez
- **RETO_VERSATIL** (6): Cada acción solo una vez por turno
- **RETO_BARBARO** (9): No usar hechizos
- **RETO_INTOCABLE** (17): No perder vida
- **RETO_INCURABLE** (18): No curar

### Retos con Objetivo Específico (Lupa)
- **RETO_ELEGIDO_VOLUNTARIO** (3): Matar monstruo específico primero
- **RETO_APLAZAMIENTO** (4): Matar monstruo específico último
- **RETO_ASESINO_A_SUELDO**: Eliminar objetivo designado
- **RETO_FOCALIZACION**: Concentrarse en un objetivo
- **RETO_IMPREVISIBLE**: Objetivo cambiante

## Configuración de Retos

### Bonificaciones
```java
// En Constantes.getReto()
int bonusXPGrupo = 0, bonusXPFijo = 0;

switch (reto) {
    case RETO_ZOMBI:
        bonusXPFijo = 30;
        bonusXPGrupo = (int) (Math.ceil(pelea.cantLuchDeEquipo(1) / 4f) * 10);
        break;
    // ... más configuraciones
}
```

### Asignación de Objetivos
```java
// Para retos con lupa
if (_esLupa) {
    // Selección aleatoria del monstruo objetivo
    final int azar = Formulas.getRandomValor(0, _pelea.cantLuchDeEquipo(2) - 1);
    _mob = _pelea.luchadoresDeEquipo(2).get(azar);
}
```

## Validación de Retos

### Durante la Pelea
Los retos se validan en diferentes momentos:
- **Al usar hechizos**: En `EfectoHechizo.java`
- **Al realizar acciones**: En métodos específicos de cada reto
- **Al finalizar turno**: Verificación de condiciones continuas

### Ejemplo de Validación
```java
// En EfectoHechizo.java
if (pelea.getRetos() != null && lanzador.esNoIA()) {
    for (final Entry<Byte, Reto> entry : pelea.getRetos().entrySet()) {
        final Reto reto = entry.getValue();
        final byte retoID = entry.getKey();
        EstReto exitoReto = reto.getEstado();
        
        // Validaciones específicas según el tipo de reto
        switch (retoID) {
            case Constantes.RETO_BARBARO:
                if (esHechizo) {
                    exitoReto = EstReto.FALLADO;
                }
                break;
            // ... más validaciones
        }
        
        reto.setEstado(exitoReto);
    }
}
```

## Sincronización Cliente-Servidor

### Proceso de Actualización
1. **Servidor**: Evalúa condiciones del reto
2. **Servidor**: Cambia estado del reto si es necesario
3. **Servidor**: Envía paquete de actualización al cliente
4. **Cliente**: Actualiza interfaz visual del reto
5. **Cliente**: Puede solicitar información adicional (objetivo)

### Manejo de Errores
- Los paquetes malformados son registrados en logs
- Se cierra la conexión si hay exceso de paquetes incorrectos
- Validaciones de seguridad en cada método de análisis

## Notas Técnicas

### Consideraciones de Rendimiento
- Uso de `ConcurrentHashMap` para thread-safety
- Validaciones eficientes durante el combate
- Envío selective de paquetes solo a jugadores relevantes

### Compatibilidad
- Solo disponible en peleas PvM
- Exclusivo para equipos de jugadores (no multiman)
- Integrado con sistema de experiencia y drop

---

*Este documento describe el funcionamiento interno del sistema de retos del servidor Dofus. Para modificaciones, consultar los archivos fuente mencionados.*