#initclip 154
if(!dofus) { _global.dofus = new Object(); }
if(!dofus["\r\x14"]) { _global.dofus["\r\x14"] = new Object(); }
if(!dofus["\r\x14"].gapi) { _global.dofus["\r\x14"].gapi = new Object(); }
if(!dofus["\r\x14"].gapi.ui) { _global.dofus["\r\x14"].gapi.ui = new Object(); }

_global.dofus["\r\x14"].gapi.ui.Triggers = function()
{
	super();
};
dofus["\r\x14"].gapi.ui.Triggers.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Triggers.prototype;

_loc1.init = function()
{
	super.init(false,dofus["\r\x14"].gapi.ui.Triggers.CLASS_NAME);
};

// **CORREGIDO** - Se añade la limpieza de listeners para prevenir fugas de memoria.
_loc1.callClose = function()
{
	// 1. Limpieza de Listeners y Eventos
	this._btnClose.removeEventListener("click",this);
	this._btnTactico.removeEventListener("click",this);
	this._btnStart.removeEventListener("click",this);
	this._btnEnd.removeEventListener("click",this);
	this._btnBorrar.removeEventListener("click",this);
	this._btnOK.removeEventListener("click",this);
	this._btnTeleport.removeEventListener("click",this);
	this._txtMapaFin.onChanged = null;
	this._txtMapaInicio.onChanged = null;
	this._txtCeldaFin.onChanged = null;

	// 2. Lógica de cierre original
	this.api.gfx.clearPointer();
	this.api.gfx.unSelectAllButOne("startPosition");
	this.api.ui.removeCursor();
	this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT);
	this.api.datacenter.Game.setInteractionType("move");
	this.api.network.send("BAHIDE_TRIGGERS");
	if(_global.CELDA_START)
	{
		this.api.gfx.clearZone(_global.CELDA_START,0,5);
	}
	if(_global.CELDA_END)
	{
		this.api.gfx.clearZone(_global.CELDA_END,0,4);
	}
	_global.MAPA_START = _global.MAPA_END = _global.CELDA_START = _global.CELDA_END = _global.COLOR_TRIGGER = undefined;
	ank.battlefield.mc.Zone.ALPHA = 30;
	this.unloadThis();
	return true;
};

_loc1.createChildren = function()
{
	this.addToQueue({object:this,method:this.initTexts});
	this.addToQueue({object:this,method:this.addListeners});
	this.addToQueue({object:this,method:this.activar});
};

_loc1.initTexts = function()
{
	this._txtCondicion.text = "";
	this._txtMapaInicio.restrict = "0-9";
	this._txtCeldaInicio.restrict = "0-9";
	this._txtMapaFin.restrict = "0-9";
	this._txtCeldaFin.restrict = "0-9";
	this._txtTeleport.restrict = "0-9";
	this.change();
};

_loc1.addListeners = function()
{
	this._btnClose.addEventListener("click",this);
	this._btnTactico.addEventListener("click",this);
	this._btnStart.addEventListener("click",this);
	this._btnEnd.addEventListener("click",this);
	this._btnBorrar.addEventListener("click",this);
	this._btnOK.addEventListener("click",this);
	this._btnTeleport.addEventListener("click",this);
	var ref = this;
	this._txtMapaFin.onChanged = function() { ref.change({target:this}); };
	this._txtMapaInicio.onChanged = function() { ref.change({target:this}); };
	this._txtCeldaInicio.onChanged = function() { ref.change({target:this}); }; // Corregido para apuntar a CeldaInicio
	this._txtCeldaFin.onChanged = function() { ref.change({target:this}); };
};

_loc1.activar = function()
{
	ank.battlefield.mc.Zone.ALPHA = 100;
	this.api.gfx.clearPointer();
	this.api.datacenter.Game.setInteractionType("trigger");
	this.api.gfx.setInteraction(ank.battlefield.Constants.INTERACTION_CELL_RELEASE_OVER_OUT);
	this.api.ui.removeCursor();
	this.api.datacenter.Basics.gfx_canLaunch = false;
	dofus["\x10\x15"].getInstance().forceMouseOver();
	if(!_global.COLOR_TRIGGER)
	{
		_global.COLOR_TRIGGER = 5;
	}
	switch(_global.COLOR_TRIGGER)
	{
		case 5:
			this._btnStart.selected = true;
			this.api.gfx.addPointerShape("C",0,65280,this.api.datacenter.Player.data.cellNum);
			break;
		case 4:
			this._btnEnd.selected = true;
			this.api.gfx.addPointerShape("C",0,16711680,this.api.datacenter.Player.data.cellNum);
			break;
		case 3:
			this._btnBorrar.selected = true;
			this.api.gfx.addPointerShape("C",0,16777215,this.api.datacenter.Player.data.cellNum);
			break; // Buena práctica
	}
	this.api.network.send("BASHOW_TRIGGERS");
};

_loc1.actualizar = function()
{
	if(_global.MAPA_START && _global.CELDA_START)
	{
		this._txtMapaInicio.text = _global.MAPA_START;
		this._txtCeldaInicio.text = _global.CELDA_START;
	}
	if(_global.MAPA_END && _global.CELDA_END)
	{
		this._txtMapaFin.text = _global.MAPA_END;
		this._txtCeldaFin.text = _global.CELDA_END;
	}
	this.change();
};

_loc1.change = function(oEvent)
{
	if(this._txtMapaInicio.text != "" && this._txtCeldaInicio.text != "" && this._txtMapaFin.text != "" && this._txtCeldaFin.text != "")
	{
		this._btnOK._visible = true;
	}
	else
	{
		this._btnOK._visible = false;
	}
};

// **CORREGIDO** - Lógica de click limpia y funcional.
_loc1.click = function(oEvent)
{
	switch(oEvent.target._name)
	{
		case "_btnOK":
			if(this._txtMapaInicio.text != "" && this._txtCeldaInicio.text != "" && this._txtMapaFin.text != "" && this._txtCeldaFin.text != "")
			{
				// 1. Enviar el comando para crear el Trigger.
				this.api.kernel.DebugConsole.process("ADD_TRIGGER 0 " + this._txtMapaFin.text + "," + this._txtCeldaFin.text + " " + this._txtMapaInicio.text + "," + this._txtCeldaInicio.text + " " + this._txtCondicion.text);
				// 2. Cerrar la ventana.
				this.callClose();
			}
			break;

		case "_btnTeleport":
			this.api.kernel.DebugConsole.process("TELEPORT " + this._txtTeleport.text);
			break;

		case "_btnTactico":
			this.api.gfx.activateTacticMode(this._btnTactico.selected);
			break;

		case "_btnClose":
		case "_btnCancel":
			this.callClose();
			break;

		case "_btnStart":
		case "_btnEnd":
		case "_btnBorrar":
			this._btnStart.selected = false;
			this._btnEnd.selected = false;
			this._btnBorrar.selected = false;
			oEvent.target.selected = true;
			
			// Switch anidado para cambiar el puntero
			switch(oEvent.target)
			{
				case this._btnStart:
					_global.COLOR_TRIGGER = 5;
					this.api.gfx.addPointerShape("C",0,65280,this.api.datacenter.Player.data.cellNum);
					break;
				
				case this._btnEnd:
					_global.COLOR_TRIGGER = 4;
					this.api.gfx.addPointerShape("C",0,16711680,this.api.datacenter.Player.data.cellNum);
					break;
				
				case this._btnBorrar:
					_global.COLOR_TRIGGER = 3;
					this.api.gfx.addPointerShape("C",0,16777215,this.api.datacenter.Player.data.cellNum);
					break;
			}
			break;
	}
};

_global.dofus["\r\x14"].gapi.ui.Triggers.CLASS_NAME = "Triggers";
#endinitclip