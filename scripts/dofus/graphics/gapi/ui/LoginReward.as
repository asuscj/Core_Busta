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
_global.dofus["\r\x14"].gapi.ui.LoginReward = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.LoginReward.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.LoginReward.prototype;
_loc1.init = function()
{
   super.init(false,"LoginReward");
};
_loc1.__set__datos = function(nValue)
{
   this._datos = nValue;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.item1 = 0;
_loc1.item2 = 0;
_loc1.item3 = 0;
_loc1.item4 = 0;
_loc1.item5 = 0;
_loc1.item6 = 0;
_loc1.item7 = 0;
_loc1.item8 = 0;
_loc1.item9 = 0;
_loc1.item10 = 0;
_loc1.item11 = 0;
_loc1.item12 = 0;
_loc1.item13 = 0;
_loc1.item14 = 0;
_loc1.item15 = 0;
_loc1.item16 = 0;
_loc1.item17 = 0;
_loc1.item18 = 0;
_loc1.item20 = 0;
_loc1.item21 = 0;
_loc1.item22 = 0;
_loc1.item23 = 0;
_loc1.item24 = 0;
_loc1.item25 = 0;
_loc1.item26 = 0;
_loc1.item27 = 0;
_loc1.item28 = 0;
_loc1.item29 = 0;
_loc1.item30 = 0;
_loc1.item31 = 0;
_loc1.item1nombre = "";
_loc1.item2nombre = "";
_loc1.item3nombre = "";
_loc1.item4nombre = "";
_loc1.item5nombre = "";
_loc1.item6nombre = "";
_loc1.item7nombre = "";
_loc1.item8nombre = "";
_loc1.item9nombre = "";
_loc1.item10nombre = "";
_loc1.item11nombre = "";
_loc1.item12nombre = "";
_loc1.item13nombre = "";
_loc1.item14nombre = "";
_loc1.item15nombre = "";
_loc1.item16nombre = "";
_loc1.item17nombre = "";
_loc1.item18nombre = "";
_loc1.item19nombre = "";
_loc1.item20nombre = "";
_loc1.item21nombre = "";
_loc1.item22nombre = "";
_loc1.item23nombre = "";
_loc1.item24nombre = "";
_loc1.item25nombre = "";
_loc1.item26nombre = "";
_loc1.item27nombre = "";
_loc1.item28nombre = "";
_loc1.item29nombre = "";
_loc1.item30nombre = "";
_loc1.item31nombre = "";
_loc1.desliza = 0;
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
_loc1.mispts = 0;
_loc1.cargaTodo = function(contenido, elvalxx)
{
   this.todoOff();
   this._datos = contenido;
   var _loc3_ = this._datos.split("~");
   var _loc11_ = 0;
   var _loc2_;
   var _loc5_;
   var _loc7_;
   var _loc10_;
   var _loc9_;
   var _loc8_;
   var _loc4_;
   var _loc6_;
   for(_loc11_ in _loc3_)
   {
      _loc2_ = _loc3_[_loc11_].split(";")[0];
      _loc5_ = _loc3_[_loc11_].split(";")[1];
      this["item" + _loc2_] = _loc5_;
      _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc10_ = _loc3_[_loc5_];
      _loc9_ = _loc10_.split("^").join(",");
      _loc8_ = new dofus.datacenter["\f\f"](_loc5_,_loc5_,1,_loc9_.stats,_loc9_);
      _loc7_.push(_loc8_);
      this["item" + _loc2_ + "nombre"] = this.descriItem(_loc8_);
      this["infoitem" + _loc2_]._visible = true;
      this["objeto" + _loc2_].dataProvider = _loc7_;
      this["objeto" + _loc2_]._visible = true;
      _loc4_ = _loc3_[_loc11_].split(";")[2];
      _loc6_ = _loc3_[_loc11_].split(";")[3];
      if(_loc4_ == 1)
      {
         this["candado" + _loc2_]._visible = false;
      }
      else
      {
         this["candado" + _loc2_]._visible = true;
      }
      if(_loc4_ == 0 || _loc4_ == 1 && _loc6_ == 1)
      {
         this["reclama" + _loc2_]._visible = false;
      }
      if(_loc6_ == 1)
      {
         this["chek" + _loc2_]._visible = true;
         this["candado" + _loc2_]._visible = false;
      }
      if(_loc4_ == 1 && _loc6_ == 0)
      {
         this["reclama" + _loc2_]._visible = true;
      }
   }
};
_loc1.todoOff = function()
{
   var _loc2_ = 1;
   while(_loc2_ < 32)
   {
      this["objeto" + _loc2_]._visible = false;
      this["chek" + _loc2_]._visible = false;
      this["reclama" + _loc2_]._visible = false;
      this["infoitem" + _loc2_]._visible = false;
      _loc2_ += 1;
   }
};
_loc1.initData = function()
{
   this.cargaTodo(this._datos,true);
};
_loc1.addListeners = function()
{
   var _loc2_ = 1;
   while(_loc2_ < 32)
   {
      this["reclama" + _loc2_].addEventListener("click",this);
      this["infoitem" + _loc2_].addEventListener("over",this);
      this["infoitem" + _loc2_].addEventListener("out",this);
      _loc2_ += 1;
   }
   this.cerrar.addEventListener("click",this);
};
_loc1.out = function(oEvent)
{
   this.api.ui.hideTooltip();
};
_loc1.initTexts = function()
{
   var _loc2_ = 1;
   while(_loc2_ < 32)
   {
      this["reclama" + _loc2_].label = this.api.lang.getText("RECLAMAR");
      this["day" + _loc2_].text = "Day " + _loc2_;
      _loc2_ += 1;
   }
   this._lblDescription.text = this.api.lang.getText("LOGIN_REWARD_DESC");
   this._lblInfos.text = this.api.lang.getText("INFORMATIONS");
   this._txtInfos.text = this.api.lang.getText("PASEBATALLA");
   this._txtInfos2.text = this.api.lang.getText("PASEBATALLA2");
   this.infoventana.title = this.api.lang.getText("LOGINREARDS");
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this.reclama1:
         this.reclama1._visible = false;
         this.chek1._visible = true;
         _global.API.network.send("n" + this.item1 + ";" + 1);
         break;
      case this.reclama2:
         this.reclama2._visible = false;
         this.chek2._visible = true;
         _global.API.network.send("n" + this.item2 + ";" + 2);
         break;
      case this.reclama3:
         this.reclama3._visible = false;
         this.chek3._visible = true;
         _global.API.network.send("n" + this.item3 + ";" + 3);
         break;
      case this.reclama4:
         this.reclama4._visible = false;
         this.chek4._visible = true;
         _global.API.network.send("n" + this.item4 + ";" + 4);
         break;
      case this.reclama5:
         this.reclama5._visible = false;
         this.chek5._visible = true;
         _global.API.network.send("n" + this.item5 + ";" + 5);
         break;
      case this.reclama6:
         this.reclama6._visible = false;
         this.chek6._visible = true;
         _global.API.network.send("n" + this.item6 + ";" + 6);
         break;
      case this.reclama7:
         this.reclama7._visible = false;
         this.chek7._visible = true;
         _global.API.network.send("n" + this.item7 + ";" + 7);
         break;
      case this.reclama8:
         this.reclama8._visible = false;
         this.chek8._visible = true;
         _global.API.network.send("n" + this.item8 + ";" + 8);
         break;
      case this.reclama9:
         this.reclama9._visible = false;
         this.chek9._visible = true;
         _global.API.network.send("n" + this.item9 + ";" + 9);
         break;
      case this.reclama10:
         this.reclama10._visible = false;
         this.chek10._visible = true;
         _global.API.network.send("n" + this.item10 + ";" + 10);
         break;
      case this.reclama11:
         this.reclama11._visible = false;
         this.chek11._visible = true;
         _global.API.network.send("n" + this.item11 + ";" + 11);
         break;
      case this.reclama12:
         this.reclama12._visible = false;
         this.chek12._visible = true;
         _global.API.network.send("n" + this.item12 + ";" + 12);
         break;
      case this.reclama13:
         this.reclama13._visible = false;
         this.chek12._visible = true;
         _global.API.network.send("n" + this.item13 + ";" + 13);
         break;
      case this.reclama14:
         this.reclama14._visible = false;
         this.chek14._visible = true;
         _global.API.network.send("n" + this.item14 + ";" + 14);
         break;
      case this.reclama15:
         this.reclama15._visible = false;
         this.chek15._visible = true;
         _global.API.network.send("n" + this.item15 + ";" + 15);
         break;
      case this.reclama16:
         this.reclama16._visible = false;
         this.chek16._visible = true;
         _global.API.network.send("n" + this.item16 + ";" + 16);
         break;
      case this.reclama17:
         this.reclama17._visible = false;
         this.chek17._visible = true;
         _global.API.network.send("n" + this.item17 + ";" + 17);
         break;
      case this.reclama18:
         this.reclama18._visible = false;
         this.chek18._visible = true;
         _global.API.network.send("n" + this.item18 + ";" + 18);
         break;
      case this.reclama19:
         this.reclama19._visible = false;
         this.chek19._visible = true;
         _global.API.network.send("n" + this.item19 + ";" + 19);
         break;
      case this.reclama20:
         this.reclama20._visible = false;
         this.chek20._visible = true;
         _global.API.network.send("n" + this.item20 + ";" + 20);
         break;
      case this.reclama21:
         this.reclama21._visible = false;
         this.chek21._visible = true;
         _global.API.network.send("n" + this.item21 + ";" + 21);
         break;
      case this.reclama22:
         this.reclama22._visible = false;
         this.chek22._visible = true;
         _global.API.network.send("n" + this.item22 + ";" + 22);
         break;
      case this.reclama23:
         this.reclama23._visible = false;
         this.chek23._visible = true;
         _global.API.network.send("n" + this.item23 + ";" + 23);
         break;
      case this.reclama24:
         this.reclama24._visible = false;
         this.chek24._visible = true;
         _global.API.network.send("n" + this.item24 + ";" + 24);
         break;
      case this.reclama25:
         this.reclama25._visible = false;
         this.chek25._visible = true;
         _global.API.network.send("n" + this.item25 + ";" + 25);
         break;
      case this.reclama26:
         this.reclama26._visible = false;
         this.chek26._visible = true;
         _global.API.network.send("n" + this.item26 + ";" + 26);
         break;
      case this.reclama27:
         this.reclama27._visible = false;
         this.chek27._visible = true;
         _global.API.network.send("n" + this.item27 + ";" + 27);
         break;
      case this.reclama28:
         this.reclama28._visible = false;
         this.chek28._visible = true;
         _global.API.network.send("n" + this.item28 + ";" + 28);
         break;
      case this.reclama29:
         this.reclama29._visible = false;
         this.chek29._visible = true;
         _global.API.network.send("n" + this.item29 + ";" + 29);
         break;
      case this.reclama30:
         this.reclama30._visible = false;
         this.chek30._visible = true;
         _global.API.network.send("n" + this.item30 + ";" + 30);
         break;
      case this.reclama31:
         this.reclama31._visible = false;
         this.chek31._visible = true;
         _global.API.network.send("n" + this.item31 + ";" + 31);
         break;
      case this.cerrar:
         _global.API.ui.unloadUIComponent("LoginReward");
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this.infoitem1:
         this.gapi.showTooltip(this.item1nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem2:
         this.gapi.showTooltip(this.item2nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem3:
         this.gapi.showTooltip(this.item3nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem4:
         this.gapi.showTooltip(this.item4nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem5:
         this.gapi.showTooltip(this.item5nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem6:
         this.gapi.showTooltip(this.item6nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem7:
         this.gapi.showTooltip(this.item7nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem8:
         this.gapi.showTooltip(this.item8nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem9:
         this.gapi.showTooltip(this.item9nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem10:
         this.gapi.showTooltip(this.item10nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem11:
         this.gapi.showTooltip(this.item11nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem12:
         this.gapi.showTooltip(this.item12nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem13:
         this.gapi.showTooltip(this.item13nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem14:
         this.gapi.showTooltip(this.item14nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem15:
         this.gapi.showTooltip(this.item15nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem16:
         this.gapi.showTooltip(this.item16nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem17:
         this.gapi.showTooltip(this.item17nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem18:
         this.gapi.showTooltip(this.item18nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem19:
         this.gapi.showTooltip(this.item19nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem20:
         this.gapi.showTooltip(this.item20nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem21:
         this.gapi.showTooltip(this.item21nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem22:
         this.gapi.showTooltip(this.item22nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem23:
         this.gapi.showTooltip(this.item23nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem24:
         this.gapi.showTooltip(this.item24nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem25:
         this.gapi.showTooltip(this.item25nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem26:
         this.gapi.showTooltip(this.item26nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem27:
         this.gapi.showTooltip(this.item27nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem28:
         this.gapi.showTooltip(this.item28nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem29:
         this.gapi.showTooltip(this.item29nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem30:
         this.gapi.showTooltip(this.item30nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
         break;
      case this.infoitem31:
         this.gapi.showTooltip(this.item31nombre,_root._xmouse,_root._ymouse - 65,{bXLimit:true,bYLimit:false});
   }
};
_loc1.addProperty("datos",function()
{
}
,_loc1.__set__datos);
_loc1._datos = "";
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.LoginReward.CLASS_NAME = "LoginReward";
