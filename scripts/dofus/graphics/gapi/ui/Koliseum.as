#initclip 53
this.api = _global.API;
_global.dofus["\r\x14"].gapi.ui.Koliseum = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.Koliseum.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.Koliseum.prototype;
_loc1.__set__Data = function(sData)
{
   this._nTiempo = Number(sData.split(";")[1]);
   this._nInscritos = sData.split(";")[2];
   this._nInscritoss = sData.split(";")[3];
   this._nInscritosss = sData.split(";")[0];
   this._nValue1 = sData.split(";")[4];
   this._nPuntos = sData.split(";")[5];
   this._nRango = sData.split(";")[6];
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.Koliseum.CLASS_NAME);
};
_loc1.__set__Inscritoss = function(sData)
{
   this._nInscritoss = sData;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.refrescarReboot = function()
{
   this._nTiempo -= 1;
   var _loc3_;
   var _loc4_;
   var _loc5_;
   var _loc6_;
   if(this._nTiempo <= 0)
   {
      this._nTiempo = 0;
      this._txtTiempo.text = "00:00";
      _global.clearInterval(this._nIntervalo);
   }
   else
   {
      _loc3_ = Math.floor(this._nTiempo / 60);
      _loc4_ = this._nTiempo - _loc3_ * 60;
      _loc5_ = _loc3_ < 10 ? "0" + _loc3_ : _loc3_ + "";
      _loc6_ = _loc4_ < 10 ? "0" + _loc4_ : _loc4_ + "";
      this._txtTiempo.text = _loc5_ + ":" + _loc6_;
   }
};
_loc1.initData = function()
{
   this._nEtape = 1;
   this._svPersonaje.zoom = 300;
   this._svPersonaje.spriteAnims = ["StaticR","StaticS","StaticL","StaticF"];
   this._svPersonaje.refreshDelay = 50;
   this._svPersonaje.spriteData = this.api.datacenter.Player.data;
   var _loc3_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svPersonaje.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc5_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc5_ + ".swf",undefined,5);
   _loc4_.accessories = _loc3_.accessories;
   this._svPersonaje.enableBlur = true;
   this._svPersonaje.refreshAccessories = !var2;
   this._svPersonaje.sourceSpriteData = _loc3_;
   this._svPersonaje.spriteData = _loc4_;
   this._svPersonaje.setColors(this._oColors);
   _loc4_.mount = _loc3_.mount;
   this._txtInscritos.text = this._nInscritos;
   this._txtInscritoss.text = this._nInscritoss;
   this._txtInscritosss.text = this._nInscritosss;
   this._nIntervalo = _global.setInterval(this,"refrescarReboot",990);
   this.refrescarReboot();
   this._ldrIcono.contentPath = "rango_" + this._nRango;
};
_loc1.addListeners = function()
{
   this._btnRegister.addEventListener("click",this);
   this._btnLeave1.addEventListener("click",this);
   this._btnRegister1.addEventListener("click",this);
   this._btnLeave2.addEventListener("click",this);
   this._btnRegister2.addEventListener("click",this);
   this._btnLeave3.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this.api.network._oDataProcessor.addEventListener("modelChanged",this);
};
_loc1.initTexts = function()
{
   this._inicioEn.text = this.api.lang.getText("INICIO_EN");
   this._inscritos.text = this.api.lang.getText("INSCRITOS_1");
   this._inscritos2.text = this.api.lang.getText("INSCRITOS_2");
   this._inscritos3.text = this.api.lang.getText("INSCRITOS_3");
   this._txtKoliseo.text = this.api.lang.getText("REGLAS_KOLISEO");
   this._txtInscritos.text = this._nInscritos;
   this._txtInscritoss.text = this._nInscritoss;
   this._txtInscritosss.text = this._nInscritosss;
   this._winBg.title = this.api.lang.getText("DETAILS");
   this._winBG2.title = this.api.lang.getText("RULES");
   this._winBg3.title = this.api.lang.getText("TU_PJ");
   this._lblBonusVictorias2.text = this._nValue1.split(",")[0] != undefined ? this._nValue1.split(",")[0] : "0";
   this._lblBonusDerrotas2.text = this._nValue1.split(",")[1] != undefined ? this._nValue1.split(",")[1] : "0";
   this._lblTitle.text = this.api.lang.getText("RANGO") + " : " + this.api.lang.getText("RANGO_" + this._nRango);
   this._ldrIcono.contentPath = "rango_" + this._nRango;
   this._taDesc.text = this.api.lang.getText("REGLAS_KOLISEO");
   this._txtPuntos2.text = this._nPuntos + "/100";
   this._lblInformations.text = this.api.lang.getText("K_INFORMATION");
   this.titleKolo.text = "1 versus 1";
   this.titleKolo1.text = "2 versus 2";
   this.titleKolo2.text = "3 versus 3";
   this._btnLeave1.label = "Abandonar";
   this._btnRegister.label = "Registrarme";
   this._btnLeave2.label = "Abandonar";
   this._btnRegister1.label = "Registrarme";
   this._btnLeave3.label = "Abandonar";
   this._btnRegister2.label = "Registrarme";
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnRegister:
         this.api.network.send("ky");
         this.api.ui.unloadUIComponent("Koliseum");
         break;
      case this._btnRegister1:
         this.api.network.send("BM*|.koli2|");
         this.api.ui.unloadUIComponent("Koliseum");
         break;
      case this._btnRegister2:
         this.api.network.send("kY");
         this.api.ui.unloadUIComponent("Koliseum");
         break;
      case this._btnLeave1:
         this.api.network.send("kZ");
         this.api.ui.unloadUIComponent("Koliseum");
         break;
      case this._btnLeave2:
         this.api.network.send("kZ");
         this.api.ui.unloadUIComponent("Koliseum");
         break;
      case this._btnLeave3:
         this.api.network.send("kZ");
         this.api.ui.unloadUIComponent("Koliseum");
         break;
      case this._btnCancel:
         this.api.ui.unloadUIComponent("Koliseum");
         _global.clearInterval(this._nIntervalID);
   }
};
_loc1.updateTimer = function()
{
   if(this._nEtape == 3)
   {
      this._nValue4 -= 1000;
      this._lblEtape.text = "Esperando validación ... (" + this._nValue4 / 1000 + "s)";
   }
   else
   {
      _global.clearInterval(this._nIntervalID);
   }
   if(this._nValue4 <= 0)
   {
      _global.clearInterval(this._nIntervalID);
   }
};
_loc1.modelChanged = function(oEvent)
{
   this.updateEtape();
   this.initTexts();
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
_loc1._nPuntos = 0;
_loc1._nRango = 1;
_loc1._nInscritos = 0;
_loc1._nInscritoss = 0;
_loc1._nInscritosss = 0;
_loc1._nTiempo = 1800;
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.Koliseum.CLASS_NAME = "Koliseum";
#endinitclip