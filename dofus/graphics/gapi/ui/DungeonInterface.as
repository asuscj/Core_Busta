#initclip 45
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
_global.dofus["\r\x14"].gapi.ui.DungeonInterface = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.DungeonInterface.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.DungeonInterface.prototype;
_loc1.__set__data = function(sData)
{
   this._sData = sData;
};
_loc1.__set__infoDungeon = function(sData)
{
   this._sInfoDungeon = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.DungeonInterface.CLASS_NAME);
};
_loc1.recompensas = function(nValue)
{
   this._nRetrato = Number(nValue.split(";")[0]);
   this._sMazmorra = nValue.split(";")[1];
   this._nNivel = Number(nValue.split(";")[2]);
   this._nCantidadF = Number(nValue.split(";")[3]);
   this._nItemID1 = Number(nValue.split(";")[4]);
   this._nItemID2 = Number(nValue.split(";")[5]);
   this._nItemID3 = Number(nValue.split(";")[6]);
   this._nItemID4 = Number(nValue.split(";")[7]);
   this._nItemID5 = Number(nValue.split(";")[8]);
   this._nItemID6 = Number(nValue.split(";")[9]);
   this._nItemID7 = Number(nValue.split(";")[10]);
   this._nItemID8 = Number(nValue.split(";")[11]);
   this._nItemFichaID = Number(nValue.split(";")[12]);
   this._sStatID1 = String(nValue.split(";")[13]);
   this._sStatID2 = String(nValue.split(";")[14]);
   this._sStatID3 = String(nValue.split(";")[15]);
   this._sStatID4 = String(nValue.split(";")[16]);
   this._sStatID5 = String(nValue.split(";")[17]);
   this._sStatID6 = String(nValue.split(";")[18]);
   this._sStatID7 = String(nValue.split(";")[19]);
   this._sStatID8 = String(nValue.split(";")[20]);
   this._nPrecioID1 = Number(nValue.split(";")[21]);
   this._nPrecioID2 = Number(nValue.split(";")[22]);
   this._nPrecioID3 = Number(nValue.split(";")[23]);
   this._nPrecioID4 = Number(nValue.split(";")[24]);
   this._nPrecioID5 = Number(nValue.split(";")[25]);
   this._nPrecioID6 = Number(nValue.split(";")[26]);
   this._nPrecioID7 = Number(nValue.split(";")[27]);
   this._nPrecioID8 = Number(nValue.split(";")[28]);
   this._nCantidadID1 = Number(nValue.split(";")[29]);
   this._nCantidadID2 = Number(nValue.split(";")[30]);
   this._nCantidadID3 = Number(nValue.split(";")[31]);
   this._nCantidadID4 = Number(nValue.split(";")[32]);
   this._nCantidadID5 = Number(nValue.split(";")[33]);
   this._nCantidadID6 = Number(nValue.split(";")[34]);
   this._nCantidadID7 = Number(nValue.split(";")[35]);
   this._nCantidadID8 = Number(nValue.split(";")[36]);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnJoinKey.addEventListener("click",this);
   this._btnTienda.addEventListener("click",this);
   this._btnTienda.addEventListener("over",this);
   this._btnTienda.addEventListener("out",this);
   this._btnJoinLlavero.addEventListener("click",this);
   this._btnResetKeyChain.addEventListener("click",this);
   this._btnBack.addEventListener("click",this);
   this._cgLocal.addEventListener("overItem",this);
   this._cgLocal.addEventListener("outItem",this);
   this._cgLocal.dataProvider = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 1;
   while(_loc2_ < 9)
   {
      this["_btnReclamar" + _loc2_].addEventListener("click",this);
      this["_btnReclamar" + _loc2_].addEventListener("over",this);
      this["_btnReclamar" + _loc2_].addEventListener("out",this);
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("DUNGEONS_INFOS");
   this._btnJoinKey.label = this.api.lang.getText("JOIN_KEY");
   this._btnJoinLlavero.label = this.api.lang.getText("JOIN_LLAVERO");
   this._btnBack.label = this.api.lang.getText("BACK_DUNGEON");
   this._lblRewards.text = this.api.lang.getText("REWARDS");
   this._btnTienda.label = this.api.lang.getText("TIENDA");
   this._lblRanking.text = this.api.lang.getText("LADDER_TIME");
   this._lblInfoDungeon.text = this.api.lang.getText("DUNG_JOIN");
   this._lstRanking.columnsNames = ["",""];
   this._btnResetKeyChain.label = this.api.lang.getText("RESUME_DUNG");
   this._lblKey.text = this.api.lang.getText("KEYS");
   this._lblKeyChain.text = this.api.lang.getText("KEYS_CHAIN");
   this._lblRewardsInfo.text = this.api.lang.getText("REWARDS_INFO");
   this._lblTienda.text = this.api.lang.getText("TIENDA");
   this._txtMisF.text = this.api.lang.getText("MIS_FICHAS");
   this._txtMazmorra.text = this._sMazmorra;
   this._txtNombreF.text = this._sNombreF;
   this._txtCantidadF.text = this._nCantidadF;
   this._lblPrecio1.text = this._nPrecioID1;
   this._lblPrecio2.text = this._nPrecioID2;
   this._lblPrecio3.text = this._nPrecioID3;
   this._lblPrecio4.text = this._nPrecioID4;
   this._lblPrecio5.text = this._nPrecioID5;
   this._lblPrecio6.text = this._nPrecioID6;
   this._lblPrecio7.text = this._nPrecioID7;
   this._lblPrecio8.text = this._nPrecioID8;
   this._lblCantidad1.text = this._nCantidadID1;
   this._lblCantidad2.text = this._nCantidadID2;
   this._lblCantidad3.text = this._nCantidadID3;
   this._lblCantidad4.text = this._nCantidadID4;
   this._lblCantidad5.text = this._nCantidadID5;
   this._lblCantidad6.text = this._nCantidadID6;
   this._lblCantidad7.text = this._nCantidadID7;
   this._lblCantidad8.text = this._nCantidadID8;
};
_loc1.initData = function()
{
   this.api.ui.getUIComponent("DungeonInterface").actualizarFichas(this._nItemFichaID);
   this.api.ui.getUIComponent("DungeonInterface").actualizarObjetos();
   var _loc3_ = 1;
   var _loc7_;
   while(_loc3_ < 9)
   {
      _loc7_ = new dofus.datacenter["\f\f"](undefined,this["_nItemID" + _loc3_],1,-1,this["_sStatID" + _loc3_]);
      this["item" + _loc3_ + "nombre"] = this.descriItem(_loc7_);
      _loc3_ = _loc3_ + 1;
   }
   this._lblName.text = this._sInfoDungeon.split("@")[0];
   this._lblLevel.text = this.api.lang.getText("LEVEL") + " " + this._sInfoDungeon.split("@")[1];
   this._ldr.contentPath = dofus.Constants.DUNGEON_GFX + this._sData.split("|")[0] + ".png";
   this._lblKeyCant.text = this.api.lang.getText("KEYS") + this._sData.split("|")[3] + "/" + this._sData.split("|")[2];
   this._lblKeyChainCant.text = this.api.lang.getText("KEY_CHAIN") + this._sData.split("|")[4] + "/" + this._sData.split("|")[2];
   var _loc11_ = new _global.palmad.dofus.datacenter.Items(0,this._sData.split("|")[3].split(",")[0],1,-1,-1);
   this._ctr0.contentData = _loc11_;
   var _loc12_ = new _global.palmad.dofus.datacenter.Items(0,this._sData.split("|")[4].split(",")[0],1,-1,-1);
   this._ctr1.contentData = _loc12_;
   var _loc10_ = 0;
   var _loc8_ = this._sData.split("|")[1].split(",");
   var _loc9_;
   var _loc4_;
   var _loc6_;
   var _loc5_;
   if(_loc8_.length > 0)
   {
      _loc9_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      for(_loc10_ in _loc8_)
      {
         _loc4_ = _loc8_[_loc10_];
         _loc6_ = this.api.lang.getItemStats(_loc4_);
         _loc5_ = new _global.palmad.dofus.datacenter.Items(0,_loc4_,1,-1,_loc6_.split("^").join(","));
         _loc9_.push(_loc5_);
      }
      this._cgLocal.dataProvider = _loc9_;
   }
   if(this._sData.split("|")[5] != "")
   {
      this.prepareRanking(this._sData.split("|")[5]);
   }
   this.api.network.send("xt" + this._sData.split("|")[0]);
};
_loc1.prepareRanking = function(oEvent)
{
   var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc7_ = 0;
   var _loc4_ = oEvent.split("#");
   var _loc5_ = 1;
   var _loc3_;
   var _loc2_;
   for(_loc7_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc7_];
      _loc2_ = new Object();
      _loc2_.id = _loc5_;
      _loc2_.name = _loc3_.split(";")[2];
      _loc2_.time = _loc3_.split(";")[5];
      this.api.kernel.debugConsole(_loc2_.name + " " + _loc2_.tiempo);
      _loc6_.push(_loc2_);
      _loc5_ = _loc5_ + 1;
   }
   _loc6_.reverse();
   this._lstRanking.dataProvider = _loc6_;
};
_loc1.descriItem = function(oEvent)
{
   var _loc4_ = oEvent;
   var _loc2_ = -20;
   var _loc1_ = _loc4_.name;
   var _loc5_ = true;
   var _loc3_;
   for(var _loc6_ in _loc4_.effects)
   {
      _loc3_ = _loc4_.effects[_loc6_];
      if(_loc3_.description.length > 0)
      {
         if(_loc5_)
         {
            _loc1_ += "\n";
            _loc2_ -= 10;
            _loc5_ = false;
         }
         _loc1_ = _loc1_ + "\n" + _loc3_.description;
         _loc2_ -= 12;
      }
   }
   return _loc1_;
};
_loc1.outItem = function()
{
   this.api.ui.hideTooltip();
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnReclamar1:
         this.gapi.showTooltip(this.item1nombre,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btnReclamar2:
         this.gapi.showTooltip(this.item2nombre,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btnReclamar3:
         this.gapi.showTooltip(this.item3nombre,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btnReclamar4:
         this.gapi.showTooltip(this.item4nombre,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btnReclamar5:
         this.gapi.showTooltip(this.item5nombre,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btnReclamar6:
         this.gapi.showTooltip(this.item6nombre,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btnReclamar7:
         this.gapi.showTooltip(this.item7nombre,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btnReclamar8:
         this.gapi.showTooltip(this.item8nombre,_root._xmouse,_root._ymouse - 20);
      default:
         return;
   }
};
_loc1.actualizarFichas = function(nValue)
{
   var _loc5_ = this.api.lang.getItemUnicText(nValue);
   var _loc6_ = _loc5_.n;
   var _loc4_ = _loc5_.g;
   var _loc3_ = _loc5_.t;
   var _loc2_ = 0;
   while(_loc2_ < 9)
   {
      this["_ldrFicha" + _loc2_].contentPath = "clips/items/" + _loc3_ + "/" + _loc4_ + ".swf";
      _loc2_ = _loc2_ + 1;
   }
   this._txtNombreF.text = _loc6_;
   this._txtCantidadF.text = this._nCantidadF;
};
_loc1.out = function(oEvent)
{
   this.api.ui.hideTooltip();
};
_loc1.actualizarObjetos = function()
{
   var _loc2_ = 1;
   var _loc5_;
   var _loc3_;
   var _loc6_;
   var _loc4_;
   while(_loc2_ <= 8)
   {
      _loc5_ = this["_nItemID" + _loc2_];
      _loc3_ = this.api.lang.getItemUnicText(_loc5_);
      _loc6_ = _loc3_.g;
      _loc4_ = _loc3_.t;
      this["_ldrObjeto" + _loc2_].contentPath = "clips/items/" + _loc4_ + "/" + _loc6_ + ".swf";
      _loc2_ = _loc2_ + 1;
   }
};
_loc1.overItem = function(_loc2_)
{
   var _loc3_ = _loc2_.target.contentData;
   _loc3_.showStatsTooltip(_loc2_.target,_loc2_.target.contentData.style);
};
_loc1.click = function(oEvent)
{
   this.api.ui.unloadUIComponent("TiendaDung");
   switch(oEvent.target)
   {
      case this._btnReclamar1:
         this._oEvent = oEvent;
         this.valid(false,1);
         break;
      case this._btnReclamar2:
         this._oEvent = oEvent;
         this.valid(false,2);
         break;
      case this._btnReclamar3:
         this._oEvent = oEvent;
         this.valid(false,3);
         break;
      case this._btnReclamar4:
         this._oEvent = oEvent;
         this.valid(false,4);
         break;
      case this._btnReclamar5:
         this._oEvent = oEvent;
         this.valid(false,5);
         break;
      case this._btnReclamar6:
         this._oEvent = oEvent;
         this.valid(false,6);
         break;
      case this._btnReclamar7:
         this._oEvent = oEvent;
         this.valid(false,7);
         break;
      case this._btnReclamar8:
         this._oEvent = oEvent;
         this.valid(false,8);
         break;
      case this._btnBack:
         this.api.network.send("xA");
         break;
      case this._btnClose:
         this.api.ui.unloadUIComponent("DungeonInterface");
         break;
      case this._btnTienda:
         this.api.network.send("xT" + this._sData.split("|")[0]);
         break;
      case this._btnJoinKey:
         this.api.network.send("xC" + this._sData.split("|")[0]);
         break;
      case this._btnJoinLlavero:
         this.api.network.send("xD" + this._sData.split("|")[0]);
      default:
         return;
   }
};
_loc1.valid = function(noConfirm, id)
{
   this._nEscogerID = id;
   if(!noConfirm)
   {
      this.api.kernel.showMessage("ATTENTION","¿Se descontarán x" + this["_nPrecioID" + id] + " (" + this.api.lang.getItemUnicText(this._nItemFichaID).n + ") para reclamar x" + this["_nCantidadID" + id] + " (" + this.api.lang.getItemUnicText(this["_nItemID" + id]).n + ") ¿Desea continuar?","CAUTION_YESNO",{name:"Confirm",listener:this});
      return undefined;
   }
   var _loc0_;
   if((_loc0_ = this._oEvent.target) === this["_btnReclamar" + id])
   {
      this.api.network.send("MR" + this._nItemFichaID + "|" + this["_nPrecioID" + id] + "|" + this["_nItemID" + id] + "|" + this["_nCantidadID" + id]);
   }
};
_loc1.yes = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) === "AskYesNoConfirm")
   {
      this.valid(true,this._nEscogerID);
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__data);
_loc1.addProperty("infoDungeon",function()
{
}
,_loc1.__set__infoDungeon);
_loc1._aDungs = new Array();
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.DungeonInterface.CLASS_NAME = "DungeonInterface";
#endinitclip
