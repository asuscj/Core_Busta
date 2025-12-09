_global.dofus["\r\x14"].gapi.ui.ShopCart = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.ShopCart.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.ShopCart.prototype;
_loc1.__set__itemList = function(sData)
{
   this.itemList = sData;
};
_loc1.init = function()
{
   super.init(false,"ShopCart");
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
};
_loc1.initData = function()
{
   var _loc9_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc8_ = 0;
   this._btnDelete._visible = false;
   var _loc3_ = 0;
   var _loc2_;
   var _loc6_;
   var _loc5_;
   var _loc7_;
   var _loc4_;
   while(_loc3_ < this.itemList.length)
   {
      _loc2_ = this.itemList[_loc3_];
      _loc6_ = _loc2_.itemId;
      _loc5_ = Number(_loc2_.cant);
      _loc7_ = _loc2_.prix;
      _loc8_ += _loc7_;
      _loc4_ = new dofus.datacenter["\f\f"](0,Number(_loc6_),_loc5_);
      _loc9_.push(_loc4_);
      _loc3_ = _loc3_ + 1;
   }
   this.price.text = _loc8_;
   this._cgLocal.dataProvider = _loc9_;
};
_loc1.addListeners = function()
{
   this._btnOk.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnEmpty.addEventListener("click",this);
   this._btnDelete.addEventListener("click",this);
   this._bgHidder.addEventListener("click",this);
   this._cgLocal.addEventListener("overItem",this);
   this._cgLocal.addEventListener("outItem",this);
   this._cgLocal.addEventListener("selectItem",this);
};
_loc1.initTexts = function()
{
   this._btnEmpty.label = "CLEAR";
   this._btnDelete.label = "DELETE";
   this._window.title = this.api.lang.getText("SHOP_BASKET");
};
_loc1.askBuy = function()
{
   var _loc3_;
   if(_global.parseInt(this.price.text) > this.api.datacenter.Player.Ogrine)
   {
      this.gapi.loadUIComponent("AskOk","AskOkNotRich",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("NOT_ENOUGH_RICH_OGRINAS")});
   }
   else
   {
      _loc3_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:this.api.lang.getText("BIGSTORE"),text:this.api.lang.getText("DO_U_BUY_ITEM_BIGSTORE_OGRINAS",[this.price.text + " Ogrine",_loc2_]),params:{precio:this.price.text}});
      _loc3_.addEventListener("yes",this);
   }
};
_loc1.yes = function(_loc2_)
{
   var _loc3_ = "";
   var _loc2_ = 0;
   var _loc6_;
   var _loc5_;
   var _loc4_;
   while(_loc2_ < this.itemList.length)
   {
      _loc6_ = this.itemList[_loc2_];
      _loc5_ = _loc6_.itemId;
      _loc4_ = Number(_loc6_.cant);
      if(_loc3_ == "")
      {
         _loc3_ = _loc5_ + "@" + _loc4_;
      }
      else
      {
         _loc3_ = _loc3_ + ";" + _loc5_ + "@" + _loc4_;
      }
      _loc2_ = _loc2_ + 1;
   }
   this.api.network.send("kbb" + _loc3_);
   this.api.ui.getUIComponent("ShopFull").clearCar();
   this.gapi.unloadUIComponent("ShopCart");
};
_loc1.click = function(oEvent)
{
   var _loc13_;
   var _loc8_;
   var _loc14_;
   var _loc9_;
   var _loc5_;
   var _loc4_;
   var _loc3_;
   var _loc2_;
   var _loc6_;
   var _loc7_;
   switch(oEvent.target)
   {
      case this._btnDelete:
         _loc13_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc8_ = 0;
         this._btnDelete._visible = false;
         _loc14_ = new Array();
         _loc9_ = 0;
         _loc5_ = 0;
         while(_loc5_ < this.itemList.length)
         {
            _loc4_ = this.itemList[_loc5_];
            _loc3_ = _loc4_.itemId;
            if(this.itemSeleccionado.unicID != _loc3_)
            {
               _loc2_ = Number(_loc4_.cant);
               _loc6_ = _loc4_.prix;
               _loc8_ += _loc6_;
               _loc9_ += _loc2_;
               _loc7_ = new dofus.datacenter["\f\f"](0,Number(_loc3_),_loc2_);
               _loc13_.push(_loc7_);
               _loc14_.push({itemId:_loc3_,cant:_loc2_,prix:Number(_loc6_)});
            }
            _loc5_ = _loc5_ + 1;
         }
         this.itemList = _loc14_;
         this.api.ui.getUIComponent("ShopFull").updateCar(this.itemList,_loc9_);
         this.price.text = _loc8_;
         this._cgLocal.dataProvider = _loc13_;
         break;
      case this._btnEmpty:
         this.itemList = new Array();
         _loc13_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         this._cgLocal.dataProvider = _loc13_;
         this.api.ui.getUIComponent("ShopFull").clearCar();
         this.price.text = 0;
         break;
      case this._btnOk:
         this.askBuy();
         break;
      case this._btnCancel:
      case this._bgHidder:
         this.gapi.unloadUIComponent("ShopCart");
      default:
         return;
   }
};
_loc1.selectItem = function(_loc2_)
{
   if(_loc2_.target.contentData != undefined)
   {
      this.itemSeleccionado = _loc2_.target.contentData;
      this._btnDelete._visible = true;
   }
};
_loc1.addProperty("listaItems",function()
{
}
,_loc1.__set__itemList);
_loc1.itemSeleccionado = undefined;
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.ShopCart.CLASS_NAME = "ShopCart";
