#initclip 13
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
_global.dofus["\r\x14"].gapi.ui.ShopInfo = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.ShopInfo.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.ShopInfo.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.ShopInfo.CLASS_NAME);
};
_loc1.__set__item = function(sData)
{
   this.sItems = sData;
};
_loc1.__set__tipo = function(sData)
{
   this.tipo = sData;
};
_loc1.__set__lista = function(sData)
{
   this.lista = sData;
};
_loc1.__set__prix = function(sData)
{
   this.prix = sData;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.addListeners = function()
{
   this._btnCancel.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._btnUp.addEventListener("click",this);
   this._btnDown.addEventListener("click",this);
   this._cgLocal.addEventListener("overItem",this);
   this._cgLocal.addEventListener("outItem",this);
   this._cgLocal.addEventListener("selectItem",this);
   this._btnBuy.addEventListener("click",this);
   this.itemContianer.addEventListener("over",this);
   this.itemContianer.addEventListener("out",this);
   var _loc2_ = this._btnAdd;
   var ref = this;
   _loc2_.onRelease = function()
   {
      ref.click({target:this});
   };
};
_loc1.__set__statsItem = function(_loc2_)
{
   this.statsItem = _loc2_;
};
_loc1.overItem = function(_loc2_)
{
   var _loc3_ = _loc2_.target.contentData;
   if(_loc3_ != undefined)
   {
      this.api.ui.showTooltip(_loc3_.name,_loc2_.target,-20);
   }
   this._oOverItem = _loc3_;
};
_loc1.outItem = function(_loc2_)
{
   this.gapi.hideTooltip();
   this._oOverItem = undefined;
};
_loc1.initTexts = function()
{
   this._winBg.title = this.api.lang.getText("PS_WINDOW");
   this._btnCancel.label = this.api.lang.getText("BACK");
   this._btnBuy.label = this.api.lang.getText("BUY");
   this.contenidoTxt.text = this.api.lang.getText("CONTENT");
   this.addItemTxt.text = this.api.lang.getText("ADD_ITEM");
   this._txtCant.text = 1;
};
_loc1.initData = function()
{
   var _loc10_ = vipobj.split("^").join(",");
   var _loc9_ = new dofus.datacenter["\f\f"](0,Number(this.sItems),1,-1,this.statsItem);
   this.itemContianer.contentData = _loc9_;
   this._txtDescription.text = _loc9_.description;
   this.price.text = this.prix;
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc7_;
   var _loc2_;
   var _loc3_;
   var _loc6_;
   var _loc5_;
   var _loc4_;
   if(this.lista != undefined && this.lista != "")
   {
      _loc7_ = this.lista.split("|");
      _loc2_ = 0;
      while(_loc2_ < _loc7_.length)
      {
         _loc3_ = _loc7_[_loc2_];
         _loc6_ = _loc3_.split(";")[0];
         _loc5_ = Number(_loc3_.split(";")[1]);
         _loc4_ = new dofus.datacenter["\f\f"](0,Number(_loc6_),_loc5_);
         _loc8_.push(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   this.showMyself();
   this._cgLocal.dataProvider = _loc8_;
};
_loc1.getTypeByObjevivan = function(_loc2)
{
   switch(Number(_loc2))
   {
      case 9233:
         return 17;
      case 9234:
         return 16;
      case 9257:
         return 16;
      case 9258:
         return 17;
      case 18894:
         return 17;
      case 19628:
         return 17;
      case 19629:
         return 16;
      case 19630:
         return 82;
      case 19756:
         return 82;
      case 19990:
         return 17;
      case 20000:
         return 16;
      case 30025:
         return 16;
      case 30026:
         return 17;
      case 30027:
         return 16;
      case 30028:
         return 17;
      case 30029:
         return 16;
      case 30030:
         return 17;
      case 30031:
         return 82;
      default:
         return;
   }
};
_loc1.selectItem = function(_loc2_)
{
   var _loc2_;
   var _loc3_;
   if(_loc2_.target.contentData != undefined)
   {
      _loc2_ = _loc2_.target.contentData;
      _loc3_ = 0;
      if(_loc2_.type == 113)
      {
         _loc3_ = this.getTypeByObjevivan(_loc2_.unicID);
      }
      this.showMyselfContent(_loc2_.unicID,_loc2_.type,_loc3_);
   }
};
_loc1.askBuy = function()
{
   var _loc3_;
   if(_global.parseInt(this.prix * this._txtCant.text) > this.api.datacenter.Player.Ogrine)
   {
      this.gapi.loadUIComponent("AskOk","AskOkNotRich",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("NOT_ENOUGH_RICH_OGRINAS")});
   }
   else
   {
      _loc3_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:this.api.lang.getText("BIGSTORE"),text:this.api.lang.getText("DO_U_BUY_ITEM_BIGSTORE_OGRINAS",[this.prix * this._txtCant.text + " Ogrine",_loc2_]),params:{id:this.sItems,precio:this.prix * this._txtCant.text,promo:false,cantidad:this._txtCant.text}});
      _loc3_.addEventListener("yes",this);
   }
};
_loc1.yes = function(_loc2_)
{
   // Actualizar ogrinas localmente antes de enviar la compra
   var _loc3_ = _loc2_.target.params.precio;
   this.api.datacenter.Player.Ogrine -= _loc3_;
   this.api.network.send("kbB" + _loc2_.target.params.id + ";" + _loc2_.target.params.cantidad);
   this.gapi.unloadUIComponent("ShopInfo");
};
_loc1.click = function(var2)
{
   switch(var2.target)
   {
      case this._btnBuy:
         this.askBuy();
         break;
      case this._btnUp:
         this._txtCant.text++;
         if(this._txtCant.text >= 100)
         {
            this._txtCant.text = 100;
         }
         this._txtCant.enabled = false;
         this.price.text = this.prix * this._txtCant.text;
         break;
      case this._btnDown:
         this._txtCant.text--;
         if(this._txtCant.text <= 1)
         {
            this._txtCant.text = 1;
         }
         this._txtCant.enabled = false;
         this.price.text = this.prix * this._txtCant.text;
         break;
      case this._btnAdd:
         this.api.ui.getUIComponent("ShopFull").addItemsToCart(Number(this.sItems),this._txtCant.text,Number(this.price.text));
         break;
      case this._btnClose:
      case this._btnCancel:
         break;
      default:
         return;
   }
   this.gapi.unloadUIComponent("ShopInfo");
};
_loc1.showMyselfContent = function(sItem, sType, sTypeReal)
{
   var _loc19_ = false;
   var _loc22_ = false;
   var _loc7_ = this.api.datacenter.Player.data;
   if(_loc7_ == undefined)
   {
      this._svCharacter._visible = false;
      this._csColors._visible = false;
      return undefined;
   }
   var _loc10_;
   var _loc11_;
   var _loc12_;
   if(this._svCharacter.spriteData == undefined)
   {
      _loc10_ = _loc7_.color1;
      _loc11_ = _loc7_.color2;
      _loc12_ = _loc7_.color3;
   }
   else
   {
      _loc10_ = this._svCharacter.getColor(1);
      _loc11_ = this._svCharacter.getColor(2);
      _loc12_ = this._svCharacter.getColor(3);
   }
   this._oColors = {color1:_loc10_,color2:_loc11_,color3:_loc12_};
   this._svCharacter.zoom = 200;
   this._svCharacter.spriteAnims = ["StaticF","StaticR","StaticL","WalkF","RunF","Anim2R","Anim2L"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.useSingleLoader = true;
   var _loc15_ = this.api.datacenter.Player.Guild;
   var _loc13_ = this.api.datacenter.Player.Sex;
   this._csColors.breed = _loc15_;
   this._csColors.sex = _loc13_;
   this._csColors.colors = [_loc10_,_loc11_,_loc12_];
   var _loc17_ = _loc15_ + "" + _loc13_;
   var _loc16_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc17_ + ".swf",undefined,5);
   var _loc14_ = sExtraData.split("|");
   var _loc18_ = _loc14_[0];
   var _loc20_ = _loc14_[1].split(",");
   var _loc6_ = new Array();
   var _loc2_ = 0;
   var _loc4_;
   var _loc3_;
   while(_loc2_ < 5)
   {
      _loc4_ = Number(sItem);
      _loc3_ = new dofus.datacenter["\x11"](undefined,undefined,undefined);
      switch(Number(sType))
      {
         case 16:
            if(_loc2_ == 1)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 17:
            if(_loc2_ == 2)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 18:
            if(_loc2_ == 3)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 82:
            if(_loc2_ == 4)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 113:
            if(_loc2_ == 1 && sTypeReal == 16)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,sTypeReal,0);
            }
            if(_loc2_ == 2 && sTypeReal == 17)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,sTypeReal,0);
            }
            if(_loc2_ == 3 && sTypeReal == 18)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,sTypeReal,0);
            }
            if(_loc2_ == 4 && sTypeReal == 82)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,sTypeReal,0);
            }
      }
      _loc6_[_loc2_] = _loc3_;
      _loc2_ = _loc2_ + 1;
   }
   var _loc21_ = this.api.datacenter.Sprites.getItemAt(_loc18_);
   _loc16_.accessories = _loc6_;
   this._svCharacter.enableBlur = true;
   this._svCharacter.refreshAccessories = !_loc19_;
   this._svCharacter.sourceSpriteData = _loc7_;
   this._svCharacter.spriteData = _loc16_;
   this._svCharacter.setColors(this._oColors);
};
_loc1.showMyself = function()
{
   var _loc17_ = false;
   var _loc23_ = false;
   var _loc7_ = this.api.datacenter.Player.data;
   if(_loc7_ == undefined)
   {
      this._svCharacter._visible = false;
      this._csColors._visible = false;
      return undefined;
   }
   var _loc8_;
   var _loc9_;
   var _loc10_;
   if(this._svCharacter.spriteData == undefined)
   {
      _loc8_ = _loc7_.color1;
      _loc9_ = _loc7_.color2;
      _loc10_ = _loc7_.color3;
   }
   else
   {
      _loc8_ = this._svCharacter.getColor(1);
      _loc9_ = this._svCharacter.getColor(2);
      _loc10_ = this._svCharacter.getColor(3);
   }
   this._oColors = {color1:_loc8_,color2:_loc9_,color3:_loc10_};
   this._svCharacter.zoom = 200;
   this._svCharacter.spriteAnims = ["StaticF","StaticR","StaticL","WalkF","RunF","Anim2R","Anim2L"];
   this._svCharacter.refreshDelay = 50;
   this._svCharacter.useSingleLoader = true;
   var _loc11_ = this.api.datacenter.Player.Guild;
   var _loc13_ = this.api.datacenter.Player.Sex;
   this._csColors.breed = _loc11_;
   this._csColors.sex = _loc13_;
   this._csColors.colors = [_loc8_,_loc9_,_loc10_];
   var _loc15_ = _loc11_ + "" + _loc13_;
   var _loc12_ = new ank.battlefield.datacenter["\x1e\x0e\x10"](undefined,ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc15_ + ".swf",undefined,5);
   var _loc14_ = sExtraData.split("|");
   var _loc16_ = _loc14_[0];
   var _loc18_ = _loc14_[1].split(",");
   var _loc6_ = new Array();
   var _loc2_ = 0;
   var _loc5_ = this.tipo;
   if(this.tipo == 113)
   {
      _loc5_ = this.getTypeByObjevivan(this.sItems);
   }
   var _loc4_;
   var _loc3_;
   while(_loc2_ < 5)
   {
      _loc4_ = Number(this.sItems);
      _loc3_ = new dofus.datacenter["\x11"](undefined,undefined,undefined);
      switch(Number(this.tipo))
      {
         case 16:
            if(_loc2_ == 1)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 17:
            if(_loc2_ == 2)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 18:
            if(_loc2_ == 3)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 82:
            if(_loc2_ == 4)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,undefined,undefined);
            }
            break;
         case 113:
            if(_loc2_ == 1 && _loc5_ == 16)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,_loc5_,0);
            }
            if(_loc2_ == 2 && _loc5_ == 17)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,_loc5_,0);
            }
            if(_loc2_ == 3 && _loc5_ == 18)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,_loc5_,0);
            }
            if(_loc2_ == 4 && sTypeReal == 82)
            {
               _loc3_ = new dofus.datacenter["\x11"](_loc4_,_loc5_,0);
            }
      }
      _loc6_[_loc2_] = _loc3_;
      _loc2_ = _loc2_ + 1;
   }
   var _loc22_ = this.api.datacenter.Sprites.getItemAt(_loc16_);
   _loc12_.accessories = _loc6_;
   this._svCharacter.enableBlur = true;
   this._svCharacter.refreshAccessories = !_loc17_;
   this._svCharacter.sourceSpriteData = _loc7_;
   this._svCharacter.spriteData = _loc12_;
   this._svCharacter.setColors(this._oColors);
};
_loc1.addProperty("itemInfo",function()
{
}
,_loc1.__set__statsItem);
_loc1.addProperty("item",function()
{
}
,_loc1.__set__item);
_loc1.addProperty("type",function()
{
}
,_loc1.__set__tipo);
_loc1.addProperty("listaItem",function()
{
}
,_loc1.__set__lista);
_loc1.addProperty("precioItem",function()
{
}
,_loc1.__set__prix);
_loc1.sItems = 0;
_loc1.tipo = 0;
_loc1.prix = 0;
_loc1.statsItem = "";
_loc1.lista = "";
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.ShopInfo.CLASS_NAME = "ShopInfo";
#endinitclip
