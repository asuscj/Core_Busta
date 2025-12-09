# Chat Oscuro (Dark Mode) para Electron

## Descripción

Se agregó una nueva opción en la UI de Opciones llamada "Chat Oscuro" (`chatOscuro`) que permite aplicar un tema oscuro al chat de Electron, proporcionando una experiencia visual más cómoda en ambientes con poca luz.

## Implementación en Flash (ActionScript)

### 1. Opción agregada en `OptionsManager.as`:

```actionscript
// DEFAULT_VALUES (línea 2)
chatOscuro: false

// applyOption() (después de línea 82)
case "chatOscuro":
   this.api.electron.setChatDarkMode(_loc3_);
   break;
```

### 2. Función en `dofus/utils/Aks.as`:

```actionscript
// Después de línea 722
_loc1.setChatDarkMode = function(bDarkMode)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   flash.external.ExternalInterface.call("setChatDarkMode", bDarkMode);
};
```

### 3. UI en `Options.as`:

```actionscript
// Label (después de línea 55)
this._mcTabViewer._lblChatOscuro.text = this.api.lang.getText("OPTION_CHAT_OSCURO");

// Listener (después de línea 115)
this._mcTabViewer._btnChatOscuro.addEventListener("click", this);

// Estado inicial (después de línea 185)
this._mcTabViewer._btnChatOscuro.selected = _loc3_.getOption("chatOscuro");

// Click handler (después de línea 250)
case "_btnChatOscuro":
   this.api.kernel.OptionsManager.setOption("chatOscuro", _loc2_.target.selected);
   break;
```

## Implementación en Electron (JavaScript/TypeScript)

El lado de Electron debe implementar la función `setChatDarkMode` para aplicar estilos CSS oscuros al contenedor del chat.

### Opción 1: Aplicación directa de estilos

```javascript
// En el archivo principal de Electron o en el preload script

window.setChatDarkMode = function(isDarkMode) {
    const chatContainer = document.querySelector('#retro-chat-container');
    
    if (isDarkMode) {
        // Aplicar estilos oscuros
        chatContainer.style.backgroundColor = '#1a1a1a';
        chatContainer.style.color = '#e0e0e0';
        
        // Aplicar estilos a los mensajes del chat
        const chatMessages = chatContainer.querySelectorAll('.chat-message');
        chatMessages.forEach(msg => {
            msg.style.backgroundColor = '#2a2a2a';
            msg.style.color = '#e0e0e0';
            msg.style.borderColor = '#3a3a3a';
        });
        
        // Aplicar estilos al input
        const chatInput = chatContainer.querySelector('.chat-input');
        if (chatInput) {
            chatInput.style.backgroundColor = '#2a2a2a';
            chatInput.style.color = '#e0e0e0';
            chatInput.style.borderColor = '#3a3a3a';
        }
    } else {
        // Restaurar estilos normales (claros)
        chatContainer.style.backgroundColor = '#ffffff';
        chatContainer.style.color = '#000000';
        
        const chatMessages = chatContainer.querySelectorAll('.chat-message');
        chatMessages.forEach(msg => {
            msg.style.backgroundColor = '#f5f5f5';
            msg.style.color = '#000000';
            msg.style.borderColor = '#cccccc';
        });
        
        const chatInput = chatContainer.querySelector('.chat-input');
        if (chatInput) {
            chatInput.style.backgroundColor = '#ffffff';
            chatInput.style.color = '#000000';
            chatInput.style.borderColor = '#cccccc';
        }
    }
};
```

### Opción 2: Usando clases CSS (Recomendado)

```javascript
window.setChatDarkMode = function(isDarkMode) {
    const chatContainer = document.querySelector('#retro-chat-container');
    
    if (isDarkMode) {
        chatContainer.classList.add('dark-mode');
    } else {
        chatContainer.classList.remove('dark-mode');
    }
};
```

Y en el CSS:

```css
/* Estilos normales */
#retro-chat-container {
    background-color: #ffffff;
    color: #000000;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.chat-message {
    background-color: #f5f5f5;
    color: #000000;
    border: 1px solid #cccccc;
}

.chat-input {
    background-color: #ffffff;
    color: #000000;
    border: 1px solid #cccccc;
}

/* Estilos oscuros */
#retro-chat-container.dark-mode {
    background-color: #0d1117;
    color: #c9d1d9;
}

#retro-chat-container.dark-mode .chat-message {
    background-color: #161b22;
    color: #c9d1d9;
    border-color: #30363d;
}

#retro-chat-container.dark-mode .chat-message a {
    color: #58a6ff;
}

#retro-chat-container.dark-mode .chat-input {
    background-color: #161b22;
    color: #c9d1d9;
    border-color: #30363d;
}

#retro-chat-container.dark-mode .chat-timestamp {
    color: #8b949e;
}

#retro-chat-container.dark-mode .chat-system {
    color: #39d353;
}
```

## Colores Recomendados para Chat Oscuro

Basados en la imagen de referencia y GitHub Dark Theme:

- **Fondo principal:** `#0d1117`
- **Fondo mensajes:** `#161b22`
- **Texto principal:** `#c9d1d9`
- **Bordes:** `#30363d`
- **Enlaces:** `#58a6ff`
- **Texto verde (sistema):** `#39d353`
- **Timestamp:** `#8b949e`

### Alternativas de colores (más suaves):

- **Fondo principal:** `#1a1a1a`
- **Fondo mensajes:** `#2a2a2a`
- **Texto:** `#e0e0e0`
- **Bordes:** `#3a3a3a`

## Persistencia de la Opción

La opción `chatOscuro` se guarda automáticamente en el SharedObject del juego (como todas las opciones en OptionsManager) y se restaura al iniciar sesión.

## Sincronización al Iniciar

Para que el chat oscuro se aplique automáticamente al iniciar sesión si la opción está activada, el lado de Electron debe:

1. Guardar el estado de `chatOscuro` en localStorage o en la configuración del cliente
2. Aplicar el tema oscuro al cargar el chat por primera vez
3. Actualizar el estado cuando Flash llame a `setChatDarkMode`

Ejemplo:

```javascript
// Al inicializar el chat
function initializeChat() {
    const isDarkMode = localStorage.getItem('chatOscuro') === 'true';
    if (isDarkMode) {
        document.querySelector('#retro-chat-container').classList.add('dark-mode');
    }
}

// Cuando Flash llama a setChatDarkMode
window.setChatDarkMode = function(isDarkMode) {
    localStorage.setItem('chatOscuro', isDarkMode.toString());
    const chatContainer = document.querySelector('#retro-chat-container');
    
    if (isDarkMode) {
        chatContainer.classList.add('dark-mode');
    } else {
        chatContainer.classList.remove('dark-mode');
    }
};
```

## Archivos Modificados

1. **`dofus/managers/OptionsManager.as`**
   - Agregada opción `chatOscuro: false` en DEFAULT_VALUES
   - Agregado case `"chatOscuro"` en applyOption()

2. **`dofus/utils/Aks.as`**
   - Agregada función `setChatDarkMode()`
   - Agregada opción `chatOscuro: false` en DEFAULT_VALUES

3. **`dofus/graphics/gapi/ui/Options.as`**
   - Agregado label `_lblChatOscuro`
   - Agregado botón `_btnChatOscuro`
   - Agregado listener y handler de click

## Texto de Idioma Requerido

Agregar en el archivo de idioma correspondiente:

```
OPTION_CHAT_OSCURO = "Chat Oscuro"
```

O en inglés:

```
OPTION_CHAT_OSCURO = "Dark Chat"
```
