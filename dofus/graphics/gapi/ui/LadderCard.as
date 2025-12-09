if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].gapi)
{
   _global.dofus["\r\x14"].gapi = new Object();
}
if(!dofus["\r\x14"].gapi.ui)
{
   _global.dofus["\r\x14"].gapi.ui = new Object();
}
_global.dofus["\r\x14"].gapi.ui.LadderCard = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.LadderCard.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.LadderCard.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.LadderCard.CLASS_NAME);
};
_loc1.__set__Retrato = function(nValue)
{
   this._nRetrato = nValue;
};
_loc1.__set__Alineacion = function(nValue)
{
   this._nAlineacion = nValue;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initRetrato});
};
_loc1.initRetrato = function()
{
   switch(_global.parseInt(this._nRetrato,10))
   {
      case 10:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9248.swf";
         return;
      case 11:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9249.swf";
         return;
      case 20:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9250.swf";
         return;
      case 21:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9251.swf";
         return;
      case 30:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9252.swf";
         return;
      case 31:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9253.swf";
         return;
      case 40:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9254.swf";
         return;
      case 41:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9255.swf";
         return;
      case 50:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9256.swf";
         return;
      case 51:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9257.swf";
         return;
      case 60:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9258.swf";
         return;
      case 61:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9259.swf";
         return;
      case 70:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9260.swf";
         return;
      case 71:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9261.swf";
         return;
      case 80:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9262.swf";
         return;
      case 81:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9263.swf";
         return;
      case 90:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9264.swf";
         return;
      case 91:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9265.swf";
         return;
      case 100:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9266.swf";
         return;
      case 101:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9267.swf";
         return;
      case 110:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9268.swf";
         return;
      case 111:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9269.swf";
         return;
      case 120:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9270.swf";
         return;
      case 121:
         this._ldrRetrato.contentPath = "clips/artworks/faces/9271.swf";
         return;
      default:
         this._ldrRetrato.contentPath = "clips/artworks/faces/8004.swf";
         return;
   }
};
_loc1.initData = function()
{
   switch(_global.parseInt(this._nAlineacion,10))
   {
      case 0:
         this._ldrAlineacion.contentPath = "alineacion_0";
         return;
      case 1:
         this._ldrAlineacion.contentPath = "alineacion_1";
         return;
      case 2:
         this._ldrAlineacion.contentPath = "alineacion_2";
         return;
      case 3:
         this._ldrAlineacion.contentPath = "alineacion_3";
         return;
      default:
         this._ldrAlineacion.contentPath = "";
         return;
   }
};
_loc1.addListeners = function()
{
   this._btnPrivateMessage.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._btnClose2.addEventListener("click",this);
   this._ldrSprite.addEventListener("initialization",this);
};
_loc1.initTexts = function()
{
   this._winBg.title = "Classement";
   this._btnClose2.label = this.api.lang.getText("CLOSE");
   this._btnPrivateMessage.label = this.api.lang.getText("WISPER_MESSAGE");
   this._lblName.text = this.api.lang.getText("NAME_BIG") + ":";
   this._lblExp.text = this.api.lang.getText("EXPERIMENT") + ":";
   this._lblNivel.text = this.api.lang.getText("LEVEL") + ":";
   this._lblAccesorios.text = "Informations:";
   this._lblTitulo.text = "Titre:";
   this._lblPrestigio.text = "Prestige:";
   this._lblInformaciones.text = this.api.lang.getText("INFORMATIONS") + ":";
   this._lblEstado.text = this.api.lang.getText("STATE") + ":";
   this._lblAlineacion.text = "Alignement:";
   this._lblAbono.text = "VIP:";
   this._lblLogros.text = "Points de succès:";
   this._lblNameValue.text = this._sNombre;
   this._lblExpValue.text = this._sExp;
   this._lblNivelValue.text = this._nNivel;
   this._lblTituloValue.text = this._sTitulo;
   this._lblPrestigioValue.text = this._sPrestigio;
   this._lblAccionValue.text = this._sAccion;
   this._lblAlineacionValue.text = this._sAlineacion;
   this._lblEstadoValue.text = this._sEstado;
   this._lblAbonoValue.text = this._sAbono;
   this._lblLogrosValue.text = this._nLogros;
   this._lblExpValue.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this._lblExpValue.text).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._lblLogrosValue.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this._lblLogrosValue.text).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.actualizarInfo = function(sNombre, sExp, nNivel, sTitulo, sPrestigio, sAlineacion, sEstado, sAbono, nAli, nRetrato, nLogros)
{
   this._sNombre = String(sNombre);
   this._lblNameValue.text = this._sNombre;
   this._sExp = String(sExp);
   this._lblExpValue.text = this._sExp;
   this._nNivel = Number(nNivel);
   this._lblNivelValue.text = this._nNivel;
   this._sTitulo = String(sTitulo);
   this._lblTituloValue.text = this._sTitulo;
   this._sPrestigio = String(sPrestigio);
   this._lblPrestigioValue.text = this._sPrestigio;
   this._sAlineacion = String(sAlineacion);
   this._lblAlineacionValue.text = this._sAlineacion;
   this._sEstado = String(sEstado);
   this._lblEstadoValue.text = this._sEstado;
   this._sAbono = String(sAbono);
   this._lblAbonoValue.text = this._sAbono;
   this._nAlineacion = Number(nAli);
   this._nRetrato = Number(nRetrato);
   this._nLogros = Number(nLogros);
   this._lblLogrosValue.text = this._nLogros;
   this._lblExpValue.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this._lblExpValue.text).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
   this._lblLogrosValue.text = new ank["\x1e\n\x07"]["\x0e\x1c"](this._lblLogrosValue.text).addMiddleChar(this.api.lang.getConfigText("THOUSAND_SEPARATOR"),3);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnClose2:
      case this._btnClose:
         this.api.ui.loadUIComponent("LadderCard").actualizarInfo(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
         break;
      case this._btnPrivateMessage:
         this.api.kernel.GameManager.askPrivateMessage(this._sNombre);
      default:
         return;
   }
};
_loc1.addProperty("retrato",function()
{
}
,_loc1.__set__Retrato);
_loc1.addProperty("alineacion",function()
{
}
,_loc1.__set__Alineacion);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_loc1._sNombre = "-";
_loc1._sExp = "-";
_loc1._nNivel = "-";
_loc1._sTitulo = "";
_loc1._sPrestigio = "-";
_loc1._sAbono = "-";
_loc1._sAlineacion = "";
_loc1._sEstado = "-";
_loc1._nRetrato = 8004;
_loc1._nAlineacion = 1;
_loc1._nLogros = 0;
_global.dofus["\r\x14"].gapi.ui.LadderCard.CLASS_NAME = "LadderCard";
