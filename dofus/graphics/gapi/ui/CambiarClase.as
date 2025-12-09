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
_global.dofus["\r\x14"].gapi.ui.CambiarClase = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.CambiarClase.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.CambiarClase.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.CambiarClase.CLASS_NAME);
};
_loc1.__set__Data = function(sValue)
{
   this._sData = sValue;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   this._txtPrecio.text = this._sData;
   this._svCharacter.zoom = 250;
   this._svCharacter.spriteAnims = ["StaticF"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.spriteData = this.api.datacenter.Player.data;
   var _loc3_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svCharacter.useSingleLoader = true;
   this._csColors.breed = this.api.datacenter.Player.Guild;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc5_ = this.api.datacenter.Player.Guild + "" + this.api.datacenter.Player.Sex;
   var _loc4_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc5_ + ".swf",undefined,5);
   _loc4_.accessories = _loc3_.accessories;
   this._svCharacter.enableBlur = true;
   this._svCharacter.refreshAccessories = !var2;
   this._svCharacter.sourceSpriteData = _loc3_;
   this._svCharacter.spriteData = _loc4_;
   this._svCharacter.setColors(this._oColors);
};
_loc1.setClass = function(nClassID, nSex)
{
   this._csColores.breed = nClassID;
   this._csColores.sex = this.api.datacenter.Player.Sex;
   this._ldrClassIcon.contentPath = dofus.Constants.BREEDS_SYMBOL_PATH + nClassID + ".swf";
   var _loc10_ = 0;
   if(dofus.Constants.GUILD_ORDER[_loc10_] == nClassID)
   {
      this._csBreedSelection.currentIndex = nClassID;
   }
   var _loc5_ = new Array();
   var _loc3_ = 0;
   while(true)
   {
      _loc3_ = _loc3_ + 1;
      if(_loc3_ >= dofus.Constants.GUILD_ORDER.length)
      {
         break;
      }
      _loc5_[_loc3_] = dofus.Constants.BREEDS_SLIDER_PATH + dofus.Constants.GUILD_ORDER[nClassID] + this.api.datacenter.Player.Sex + ".swf";
   }
   this._csBreedSelection.clipsList = _loc5_;
   this._csBreedSelection.updateColor(1,this._oColors.color1);
   this._csBreedSelection.updateColor(2,this._oColors.color2);
   this._csBreedSelection.updateColor(3,this._oColors.color3);
   var _loc6_ = this.api.lang.getClassText(nClassID);
   this._lblClassName.text = _loc6_.ln;
   this._txtClassDescription.text = "<font color=\'#514A3C\'>" + _loc6_.d + "</font>";
   this._txtShortClassDescription.text = "<font color=\'#514A3C\' size=\'14\'><b>" + _loc6_.sd + "</b></font>";
   this._svCharacter.setColors(this._oColors);
   this._btnValidate.label = "Aceptar";
   this._nBreed = nClassID;
   this._nSex = this.api.datacenter.Player.Sex;
   this._svCharacter.zoom = 250;
   this._svCharacter.spriteAnims = ["StaticF"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.spriteData = this.api.datacenter.Player.data;
   var _loc9_ = this.api.datacenter.Player.data;
   this._oColors = {color1:this.api.datacenter.Player.color1,color2:this.api.datacenter.Player.color2,color3:this.api.datacenter.Player.color3};
   this._svCharacter.useSingleLoader = true;
   this._csColors.breed = nClassID;
   this._csColors.sex = this.api.datacenter.Player.Sex;
   this._csColors.colors = [this.api.datacenter.Player.color1,this.api.datacenter.Player.color2,this.api.datacenter.Player.color3];
   var _loc7_ = nClassID + "" + this.api.datacenter.Player.Sex;
   var _loc8_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],_global.palmad.dofus.Constants.CLIPS_PERSOS_PATH + _loc7_ + ".swf",undefined,5);
   _loc3.accessories = _loc5_.accessories;
   this._svCharacter.enableBlur = true;
   this._svCharacter.refreshAccessories = !var2;
   this._svCharacter.sourceSpriteData = _loc9_;
   this._svCharacter.spriteData = _loc8_;
   this._svCharacter.setColors(this._oColors);
};
_loc1.addListeners = function()
{
   var ref = this;
   this._mcSpellButton.onPress = function()
   {
      ref.click({target:this});
   };
   this._mcSpellButton.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcSpellButton.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._mcSpellButton2.onPress = function()
   {
      ref.click({target:this});
   };
   this._mcSpellButton2.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcSpellButton2.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._mcHistoryButton.onPress = function()
   {
      ref.click({target:this});
   };
   this._mcHistoryButton.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcHistoryButton.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._btnValidate.addEventListener("click",this);
   this._btnBack.addEventListener("click",this);
   this._csColores.addEventListener("over",this);
   this._csColores.addEventListener("out",this);
   this._csColores.addEventListener("change",this);
   this._csBreedSelection.addEventListener("change",this);
   this._btnXelor.addEventListener("over",this);
   this._btnXelor.addEventListener("out",this);
   this._btnXelor.addEventListener("change",this);
   var _loc2_ = -1;
   while(true)
   {
      _loc2_++;
      if(_loc2_ > 12)
      {
         break;
      }
      this["_btn" + _loc2_].addEventListener("click",this);
      this["_btn" + _loc2_].addEventListener("over",this);
      this["_btn" + _loc2_].addEventListener("out",this);
   }
};
_loc1.initTexts = function()
{
   this._lblTitle.text = this.api.lang.getText("CAMBIAR_CLASE");
   this._btnValidate.label = this.api.lang.getText("ACCEPT");
   this._lblCharacterName.text = this.api.lang.getText("CREATE_CHARACTER_NAME");
   this._lblCharacterColors.text = this.api.lang.getText("SPRITE_COLORS");
   this._lblNombrePersonaje.text = this.api.datacenter.Player.data.name;
   this._lblSpellButton.text = this.api.lang.getText("SPELLS_SHORTCUT");
   this._lblHistoryButton.text = this.api.lang.getText("HISTORY_CLASS_WORD");
};
_loc1.mostrarColor = function(nIndex)
{
   var bWhite = true;
   this._nSavedColor = this._svCharacter.getColor(nIndex);
   this.onEnterFrame = function()
   {
      bWhite = !bWhite;
      this._svCharacter.setColor(nIndex,!bWhite ? 16746632 : 16733525);
   };
};
_loc1.esconderColor = function(nIndex)
{
   delete this.onEnterFrame;
   this._svCharacter.setColor(nIndex,this._nSavedColor);
};
_loc1.cambiarColor = function(oColors)
{
   this._oColors = oColors;
   this._svCharacter.setColors(this._oColors);
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._csColores:
         this.mostrarColor(oEvent.index);
         break;
      case this._mcSpellButton:
         this.gapi.showTooltip(this.api.lang.getText("CLASS_SPELLS"),_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn1:
         this.gapi.showTooltip(this.api.lang.getClassText(1).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn2:
         this.gapi.showTooltip(this.api.lang.getClassText(2).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn3:
         this.gapi.showTooltip(this.api.lang.getClassText(3).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn4:
         this.gapi.showTooltip(this.api.lang.getClassText(4).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn5:
         this.gapi.showTooltip(this.api.lang.getClassText(5).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn6:
         this.gapi.showTooltip(this.api.lang.getClassText(6).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn7:
         this.gapi.showTooltip(this.api.lang.getClassText(7).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn8:
         this.gapi.showTooltip(this.api.lang.getClassText(8).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn9:
         this.gapi.showTooltip(this.api.lang.getClassText(9).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn10:
         this.gapi.showTooltip(this.api.lang.getClassText(10).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn11:
         this.gapi.showTooltip(this.api.lang.getClassText(11).sn,_root._xmouse,_root._ymouse - 20);
         break;
      case this._btn12:
         this.gapi.showTooltip(this.api.lang.getClassText(12).sn,_root._xmouse,_root._ymouse - 20);
      default:
         return;
   }
};
_loc1.out = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) !== this._csColores)
   {
      this.gapi.hideTooltip();
   }
   else
   {
      this.esconderColor(oEvent.index);
   }
};
_loc1.change = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target) === this._csColores)
   {
      this.cambiarColor(oEvent.value);
   }
};
_loc1.Feca = function()
{
   this._nClaseID = 1;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Anutrof = function()
{
   this._nClaseID = 3;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Osamoda = function()
{
   this._nClaseID = 2;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Sram = function()
{
   this._nClaseID = 4;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Xelor = function()
{
   this._nClaseID = 5;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Zurcarak = function()
{
   this._nClaseID = 6;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Aniripsa = function()
{
   this._nClaseID = 7;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Yopuka = function()
{
   this._nClaseID = 8;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Ocra = function()
{
   this._nClaseID = 9;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Sadida = function()
{
   this._nClaseID = 10;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Sacrogrito = function()
{
   this._nClaseID = 11;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.Pandawa = function()
{
   this._nClaseID = 12;
   this.setClass(this._nClaseID,this.api.datacenter.Player.Sex);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnBack:
         this.api.ui.unloadUIComponent("CambiarClase");
         break;
      case this._btnValidate:
         this.api.network.send("!cC" + this._nClaseID + "," + this._sData);
         break;
      case this._btn1:
         this.Feca();
         break;
      case this._btn2:
         this.Osamoda();
         break;
      case this._btn3:
         this.Anutrof();
         break;
      case this._btn4:
         this.Sram();
         break;
      case this._btn5:
         this.Xelor();
         break;
      case this._btn6:
         this.Zurcarak();
         break;
      case this._btn7:
         this.Aniripsa();
         break;
      case this._btn8:
         this.Yopuka();
         break;
      case this._btn9:
         this.Ocra();
         break;
      case this._btn10:
         this.Sadida();
         break;
      case this._btn11:
         this.Sacrogrito();
         break;
      case this._btn12:
         this.Pandawa();
         break;
      case this._mcSpellButton2:
      case this._mcSpellButton:
         this.api.ui.loadUIComponent("SpellViewerOnCreate","SpellViewerOnCreate",{breed:this._nClaseID});
         break;
      case this._mcHistoryButton:
         this.api.ui.loadUIComponent("HistoryViewerOnCreate","HistoryViewerOnCreate",{breed:this._nClaseID});
      default:
         return;
   }
};
_loc1.addProperty("data",function()
{
}
,_loc1.__set__Data);
_loc1._nClaseID = 0;
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.CambiarClase.CLASS_NAME = "CambiarClase";
