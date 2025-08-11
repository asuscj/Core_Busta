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
_global.dofus["\r\x14"].gapi.ui.ShopFull = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.ShopFull.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.ShopFull.prototype;
_loc1.__set__promotions = function(sData)
{
   this._sPromos = sData.split("|");
};
_loc1.__set__ogrinas = function(sData)
{
   this._misogrinas = sData;
};
_loc1.__set__objetos = function(sData)
{
   var _loc10_ = sData.split("|");
   this._oObjetos = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc3_ = 0;
   var _loc2_;
   var _loc4_;
   var _loc9_;
   var _loc7_;
   var _loc6_;
   var _loc8_;
   var _loc5_;
   while(_loc3_ < _loc10_.length)
   {
      _loc2_ = _loc10_[_loc3_];
      _loc4_ = _loc2_.split("@")[1];
      _loc9_ = _loc2_.split("@")[0];
      _loc7_ = _loc2_.split("@")[2];
      _loc6_ = _loc2_.split("@")[3] == 1;
      _loc8_ = _loc2_.split("@")[4] == 1;
      _loc5_ = new dofus.datacenter["\f\f"](0,Number(_loc4_),1,-1,_loc2_.split("@")[5].split("^").join(","));
      this._oObjetos.push({id:_loc4_,tipo:_loc9_,precio:_loc7_,nuevo:_loc6_,promo:_loc8_,name:_loc5_.name,description:description,item:_loc5_});
      _loc3_ = _loc3_ + 1;
   }
};
_loc1.__set__categorias = function(sData)
{
   this._sData = sData;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.ShopFull.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.updateData,params:["0"]});
};
_loc1.addTabListeners = function()
{
   var _loc2_ = 0;
   var ref = this;
   var _loc7_ = this._btnCar;
   _loc7_.onRelease = function()
   {
      ref.click({target:this});
   };
   var _loc6_ = this._btnCar;
   _loc6_.onRelease = function()
   {
      ref.click({target:this});
   };
   var _loc4_;
   var _loc3_;
   while(_loc2_ < 39)
   {
      _loc4_ = this._mcTabViewer["shop" + _loc2_].cuadro;
      _loc4_.onRollOver = function()
      {
         ref.over({target:this});
      };
      _loc4_.onRollOut = function()
      {
         ref.out({target:this});
      };
      _loc3_ = this._mcTabViewer["_prevItem" + _loc2_];
      _loc3_.onRelease = function()
      {
         ref.click({target:this});
      };
      _loc3_.onRollOver = function()
      {
         ref.over({target:this});
      };
      _loc3_.onRollOut = function()
      {
         ref.out({target:this});
      };
      _loc2_ += 1;
   }
};
_loc1.addListeners = function()
{
   this._lstLogros.addEventListener("itemSelected",this);
   this._btnClose.addEventListener("click",this);
   this.serviceTxt.addEventListener("click",this);
   this._sbOptions.addEventListener("scroll",this);
   this._btnSearch.addEventListener("click",this);
   ank["\x1e\n\x07"]["\t\x17"].addListener(this);
};
_loc1.scroll = function(var2)
{
   this._mcTabViewer._y = this._mcPlacer._y - this._sbOptions.scrollPosition;
};
_loc1.onMouseWheel = function(_loc2_, _loc3_)
{
   if(dofus["\r\x14"].gapi.ui.Zoom.isZooming())
   {
      return undefined;
   }
   if(String(_loc3_._target).indexOf(this._target) != -1 && this._sbOptions._visible)
   {
      this._sbOptions.scrollPosition -= _loc2_ > 0 ? 20 : -20;
   }
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("SHOP");
   this._txtOgrinas.text = this._misogrinas;
   this._btnSearch.label = this.api.lang.getText("SEARCH");
   this._tiSearch.text = "";
   this._tiSearch.setFocus();
   this.serviceTxt.label = this.api.lang.getText("SERVICE");
   this._txtCarItems.text = 0;
   this._tiSearch.borderColor3 = 65280;
   this.basketTxt.text = this.api.lang.getText("BASKET");
   this._lstLogros.columnsNames = ["",this.api.lang.getText("CATEGORYS_SHOP")];
   this._txtComprar.text = this.api.lang.getText("SHOP_BUY");
};
_loc1.initData = function()
{
   var _loc14_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc15_ = 0;
   var _loc7_ = this._sData.split(";");
   var _loc4_;
   for(_loc15_ in _loc7_)
   {
      _loc4_ = new Object();
      _loc4_.id = _loc15_;
      _loc4_.name = _loc7_[_loc15_].split("|")[0];
      _loc4_.icon = _loc7_[_loc15_].split("|")[1];
      _loc14_.push(_loc4_);
      _loc15_ = _loc15_ + 1;
   }
   _loc14_.reverse();
   this._lstLogros.dataProvider = _loc14_;
   _loc4_ = 0;
   var _loc10_;
   var _loc9_;
   var _loc11_;
   while(_loc4_ < 39)
   {
      _loc10_ = this._mcTabViewer["shop" + _loc4_];
      _loc9_ = this._mcTabViewer["card" + _loc4_];
      _loc11_ = this._mcTabViewer["_prevItem" + _loc4_];
      _loc9_.border._visible = false;
      _loc10_._visible = false;
      _loc11_._visible = false;
      _loc4_ += 1;
   }
   var _loc2_ = 0;
   this.alto = 0;
   this.cantPaginas = 0;
   var _loc3_;
   var _loc5_;
   for(var _loc16_ in this._oObjetos)
   {
      _loc3_ = this._oObjetos[_loc16_];
      if(_loc3_.tipo == this.sCategory)
      {
         this._mcTabViewer["shop" + _loc2_]._visible = true;
         this._mcTabViewer["shop" + _loc2_].cuadro.setInfoItem(this.descriItem(_loc3_.item));
         this._mcTabViewer["shop" + _loc2_].cuadro.border._visible = false;
         this._mcTabViewer["shop" + _loc2_].promo._visible = false;
         this._mcTabViewer["_prevItem" + _loc2_]._visible = true;
         _loc5_ = new dofus.datacenter["\f\f"](0,Number(_loc3_.id));
         this["prevItem" + _loc2_] = _loc5_;
         this._mcTabViewer["shop" + _loc2_].newP._visible = false;
         item;
         this._mcTabViewer["shop" + _loc2_]._ldritem.contentPath = _loc5_.iconFile;
         if(_loc3_.nuevo)
         {
            this._mcTabViewer["shop" + _loc2_].newP._visible = true;
         }
         if(_loc3_.promo)
         {
            this._mcTabViewer["shop" + _loc2_].promo._visible = true;
         }
         this["Item" + _loc2_] = _loc3_.id;
         this._mcTabViewer["shop" + _loc2_].price.text = _loc3_.precio;
         this._mcTabViewer["shop" + _loc2_]._lblClassName.text = _loc5_.name;
         _loc2_ = _loc2_ + 1;
      }
   }
   this.cantPaginas = _loc2_;
   this.alto = _loc2_ / 2 * 100;
   if(this.cantPaginas <= 3)
   {
      this._sbOptions._visible = false;
   }
   else
   {
      this._sbOptions.scrollPosition = 0;
      this._sbOptions._visible = true;
      this._sbOptions.min = 0;
      this._sbOptions.max = this.alto;
   }
   var _loc13_;
   var _loc6_;
   var _loc12_;
   var _loc8_;
   if(this._itemsCart.length > 0)
   {
      _loc13_ = 0;
      _loc6_ = 0;
      while(_loc6_ < this._itemsCart.length)
      {
         _loc12_ = this._itemsCart[_loc6_];
         _loc8_ = Number(_loc12_.cant);
         _loc13_ += _loc8_;
         _loc6_ = _loc6_ + 1;
      }
      this._txtCarItems.text = Number(_loc13_);
   }
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
_loc1.updateItemsFilter = function(sFilter)
{
   var _loc11_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc13_ = 0;
   var _loc6_ = this._sData.split(";");
   var _loc4_;
   for(_loc13_ in _loc6_)
   {
      _loc4_ = new Object();
      _loc4_.id = _loc13_;
      _loc4_.name = _loc6_[_loc13_].split("|")[0];
      _loc4_.icon = _loc6_[_loc13_].split("|")[1];
      _loc11_.push(_loc4_);
      _loc13_ = _loc13_ + 1;
   }
   _loc11_.reverse();
   this._lstLogros.dataProvider = _loc11_;
   _loc4_ = 0;
   var _loc7_;
   var _loc8_;
   var _loc9_;
   while(_loc4_ < 39)
   {
      _loc7_ = this._mcTabViewer["shop" + _loc4_];
      _loc8_ = this._mcTabViewer["card" + _loc4_];
      _loc9_ = this._mcTabViewer["_prevItem" + _loc4_];
      _loc8_.border._visible = false;
      _loc7_._visible = false;
      _loc9_._visible = false;
      _loc4_ += 1;
   }
   var _loc2_ = 0;
   this.alto = 0;
   this.cantPaginas = 0;
   var _loc3_;
   var _loc5_;
   for(var _loc12_ in this._oObjetos)
   {
      _loc3_ = this._oObjetos[_loc12_];
      if(!(sFilter.length > 0 && _loc3_.name.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))
      {
         _loc5_ = new dofus.datacenter["\f\f"](0,Number(_loc3_.id));
         this._mcTabViewer["_prevItem" + _loc2_]._visible = true;
         this["prevItem" + _loc2_] = _loc5_;
         this._mcTabViewer["shop" + _loc2_]._visible = true;
         this._mcTabViewer["shop" + _loc2_].cuadro.setInfoItem(this.descriItem(_loc3_.item));
         this._mcTabViewer["shop" + _loc2_].cuadro.border._visible = false;
         this._mcTabViewer["shop" + _loc2_].promo._visible = false;
         this._mcTabViewer["shop" + _loc2_].newP._visible = false;
         this._mcTabViewer["shop" + _loc2_]._ldritem.contentPath = _loc5_.iconFile;
         if(_loc3_.nuevo)
         {
            this._mcTabViewer["shop" + _loc2_].newP._visible = true;
         }
         if(_loc3_.promo)
         {
            this._mcTabViewer["shop" + _loc2_].promo._visible = true;
         }
         this["Item" + _loc2_] = _loc3_.id;
         this._mcTabViewer["shop" + _loc2_].price.text = _loc3_.precio;
         this._mcTabViewer["shop" + _loc2_]._lblClassName.text = _loc5_.name;
         _loc2_ = _loc2_ + 1;
      }
   }
   this.cantPaginas = _loc2_;
   this.alto = _loc2_ / 3 * 90;
   if(this.cantPaginas <= 3)
   {
      this._sbOptions._visible = false;
   }
   else
   {
      this._sbOptions.scrollPosition = 0;
      this._sbOptions._visible = true;
      this._sbOptions.min = 0;
      this._sbOptions.max = this.alto;
   }
};
_loc1.askBuy = function(_loc3_)
{
   var _loc3_ = this.objeto;
   var _loc5_;
   if(_loc3_ != undefined)
   {
      if(_global.parseInt(_loc3_.precio * _loc3_) > this._misogrinas || _global.parseInt(_loc3_.precio * _loc3_) > this._txtOgrinas.text)
      {
         this.gapi.loadUIComponent("AskOk","AskOkNotRich",{title:this.api.lang.getText("ERROR_WORD"),text:this.api.lang.getText("NOT_ENOUGH_RICH_OGRINAS")});
      }
      else
      {
         _loc5_ = this.gapi.loadUIComponent("AskYesNo","AskYesNoBuy",{title:this.api.lang.getText("BIGSTORE"),text:this.api.lang.getText("DO_U_BUY_ITEM_BIGSTORE_OGRINAS",[_loc3_.precio * _loc3_ + " Ogrine",_loc3_]),params:{id:_loc3_.id,precio:_loc3_.precio * _loc3_,promo:false,cantidad:_loc3_}});
         _loc5_.addEventListener("yes",this);
      }
   }
};
_loc1.yes = function(_loc2_)
{
   this._txtOgrinas.text -= _loc2_.target.params.precio;
   this.api.network.send("wm" + _loc2_.target.params.id + ";" + _loc2_.target.params.cantidad);
};
_loc1.updateOgrinas = function(_loc2_)
{
   this._misogrinas = _loc2_;
   this._txtOgrinas.text = _loc2_;
};
_loc1.updateData = function(sParam)
{
   var _loc2_ = "ShopItems";
   this._mcTabViewer.removeMovieClip();
   this.attachMovie(_loc2_,"_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
   this._mcTabViewer.setMask(this._mcMask);
   if(this._mcTabViewer._height > this._mcPlacer._height)
   {
      this._sbOptions._visible = true;
      this._sbOptions.min = 0;
      this._sbOptions.max = this._mcTabViewer._height - this._mcPlacer._height;
      this._sbOptions.page = this._sbOptions.max / 2;
   }
   else
   {
      this._sbOptions._visible = false;
   }
   this.sCategory = sParam;
   this.addToQueue({object:this,method:this.initData});
   this.addToQueue({object:this,method:this.initTabTexts});
   this.addToQueue({object:this,method:this.addTabListeners});
};
_loc1.itemSelected = function(oEvent)
{
   this.updateData(this._lstLogros.selectedItem.id);
};
_loc1.buscar = function(sFilter)
{
   if(sFilter == undefined || sFilter == "")
   {
      return undefined;
   }
   var _loc3_ = "ShopItems";
   this._mcTabViewer.removeMovieClip();
   this.attachMovie(_loc3_,"_mcTabViewer",this.getNextHighestDepth(),{_x:this._mcPlacer._x,_y:this._mcPlacer._y});
   this._mcTabViewer.setMask(this._mcMask);
   if(this._mcTabViewer._height > this._mcPlacer._height)
   {
      this._sbOptions._visible = true;
      this._sbOptions.min = 0;
      this._sbOptions.max = this._mcTabViewer._height - this._mcPlacer._height;
      this._sbOptions.page = this._sbOptions.max / 2;
   }
   else
   {
      this._sbOptions._visible = false;
   }
   this.sCategory = 0;
   this.addToQueue({object:this,method:this.updateItemsFilter,params:[sFilter]});
   this.addToQueue({object:this,method:this.initTabTexts});
   this.addToQueue({object:this,method:this.addTabListeners});
};
_loc1.validate = function(_loc2_)
{
   this.askBuy(_loc2_.value);
};
_loc1.addItemsToCart = function(sItemId, cantidad, precio)
{
   this._itemsCart.push({itemId:sItemId,cant:cantidad,prix:Number(precio)});
   this._txtCarItems.text = Number(this._txtCarItems.text) + Number(cantidad);
};
_loc1.updateCar = function(itemList, cantItems)
{
   this._txtCarItems.text = Number(cantItems);
   this._itemsCart.length = 0;
   this._itemsCart = itemList;
};
_loc1.clearCar = function()
{
   this._itemsCart.length = 0;
   this._txtCarItems.text = Number(0);
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "serviceTxt":
         this.api.ui.loadUIComponent("Edit","Edit");
         break;
      case "_btnCar":
         this.api.ui.loadUIComponent("ShopCart","ShopCart",{listaItems:this._itemsCart});
         break;
      case "_btnSearch":
         this.buscar(this._tiSearch.text);
         break;
      case "_prevItem0":
         this.api.network.send("wP" + this.prevItem0.unicID);
         break;
      case "_prevItem1":
         this.api.network.send("wP" + this.prevItem1.unicID);
         break;
      case "_prevItem2":
         this.api.network.send("wP" + this.prevItem2.unicID);
         break;
      case "_prevItem3":
         this.api.network.send("wP" + this.prevItem3.unicID);
         break;
      case "_prevItem4":
         this.api.network.send("wP" + this.prevItem4.unicID);
         break;
      case "_prevItem5":
         this.api.network.send("wP" + this.prevItem5.unicID);
         break;
      case "_prevItem6":
         this.api.network.send("wP" + this.prevItem6.unicID);
         break;
      case "_prevItem7":
         this.api.network.send("wP" + this.prevItem7.unicID);
         break;
      case "_prevItem8":
         this.api.network.send("wP" + this.prevItem8.unicID);
         break;
      case "_prevItem9":
         this.api.network.send("wP" + this.prevItem9.unicID);
         break;
      case "_prevItem10":
         this.api.network.send("wP" + this.prevItem10.unicID);
         break;
      case "_prevItem11":
         this.api.network.send("wP" + this.prevItem11.unicID);
         break;
      case "_prevItem12":
         this.api.network.send("wP" + this.prevItem12.unicID);
         break;
      case "_prevItem13":
         this.api.network.send("wP" + this.prevItem13.unicID);
         break;
      case "_prevItem14":
         this.api.network.send("wP" + this.prevItem14.unicID);
         break;
      case "_prevItem15":
         this.api.network.send("wP" + this.prevItem15.unicID);
         break;
      case "_prevItem16":
         this.api.network.send("wP" + this.prevItem16.unicID);
         break;
      case "_prevItem17":
         this.api.network.send("wP" + this.prevItem17.unicID);
         break;
      case "_prevItem18":
         this.api.network.send("wP" + this.prevItem18.unicID);
         break;
      case "_prevItem19":
         this.api.network.send("wP" + this.prevItem19.unicID);
         break;
      case "_prevItem20":
         this.api.network.send("wP" + this.prevItem20.unicID);
         break;
      case "_prevItem21":
         this.api.network.send("wP" + this.prevItem21.unicID);
         break;
      case "_prevItem22":
         this.api.network.send("wP" + this.prevItem22.unicID);
         break;
      case "_prevItem23":
         this.api.network.send("wP" + this.prevItem23.unicID);
         break;
      case "_prevItem24":
         this.api.network.send("wP" + this.prevItem24.unicID);
         break;
      case "_prevItem25":
         this.api.network.send("wP" + this.prevItem25.unicID);
         break;
      case "_prevItem26":
         this.api.network.send("wP" + this.prevItem26.unicID);
         break;
      case "_prevItem27":
         this.api.network.send("wP" + this.prevItem27.unicID);
         break;
      case "_prevItem28":
         this.api.network.send("wP" + this.prevItem28.unicID);
         break;
      case "_prevItem29":
         this.api.network.send("wP" + this.prevItem29.unicID);
         break;
      case "_prevItem30":
         this.api.network.send("wP" + this.prevItem30.unicID);
         break;
      case "_prevItem31":
         this.api.network.send("wP" + this.prevItem31.unicID);
         break;
      case "_prevItem32":
         this.api.network.send("wP" + this.prevItem32.unicID);
         break;
      case "_prevItem33":
         this.api.network.send("wP" + this.prevItem33.unicID);
         break;
      case "_prevItem34":
         this.api.network.send("wP" + this.prevItem34.unicID);
         break;
      case "_prevItem35":
         this.api.network.send("wP" + this.prevItem35.unicID);
         break;
      case "_prevItem36":
         this.api.network.send("wP" + this.prevItem36.unicID);
         break;
      case "_prevItem37":
         this.api.network.send("wP" + this.prevItem37.unicID);
         break;
      case "_prevItem38":
         this.api.network.send("wP" + this.prevItem38.unicID);
         break;
      case "_btnClose":
         this.api.ui.unloadUIComponent("ShopFull");
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "cuadro":
         oEvent.target.border._visible = true;
         this.gapi.showTooltip(oEvent.target.itemInf,_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      case "_prevItem0":
      case "_prevItem1":
      case "_prevItem2":
      case "_prevItem3":
      case "_prevItem4":
      case "_prevItem5":
      case "_prevItem6":
      case "_prevItem7":
      case "_prevItem8":
      case "_prevItem9":
      case "_prevItem10":
      case "_prevItem11":
      case "_prevItem12":
      case "_prevItem13":
      case "_prevItem14":
      case "_prevItem15":
      case "_prevItem16":
      case "_prevItem17":
      case "_prevItem18":
      case "_prevItem19":
      case "_prevItem20":
      case "_prevItem21":
      case "_prevItem22":
      case "_prevItem23":
      case "_prevItem24":
      case "_prevItem25":
      case "_prevItem26":
      case "_prevItem27":
      case "_prevItem28":
      case "_prevItem29":
      case "_prevItem30":
      case "_prevItem31":
      case "_prevItem32":
      case "_prevItem33":
      case "_prevItem34":
      case "_prevItem35":
      case "_prevItem36":
      case "_prevItem37":
      case "_prevItem38":
      case "_prevItem39":
      case "_prevItem40":
      case "_prevItem41":
      case "_prevItem42":
      case "_prevItem43":
      case "_prevItem44":
      case "_prevItem45":
      case "_prevItem46":
      case "_prevItem47":
      case "_prevItem48":
      case "_prevItem49":
      case "_prevItem50":
      case "_prevItem51":
         this.gapi.showTooltip("Buy Item",_root._xmouse + 8,_root._ymouse - 8,{bYLimit:false,bXLimit:true});
         break;
      default:
         this.gapi.showTooltip(oEvent.target.contentData.name,oEvent.target,-20);
   }
};
_loc1.out = function(oEvent)
{
   var _loc0_;
   if((_loc0_ = oEvent.target._name) !== "cuadro")
   {
      this.gapi.hideTooltip();
   }
   else
   {
      oEvent.target.border._visible = false;
      this.gapi.hideTooltip();
   }
};
_loc1.addProperty("promotions",function()
{
}
,_loc1.__set__promotions);
_loc1.addProperty("categorias",function()
{
}
,_loc1.__set__categorias);
_loc1.addProperty("ogrinas",function()
{
}
,_loc1.__set__ogrinas);
_loc1.addProperty("objetos",function()
{
}
,_loc1.__set__objetos);
_loc1.sCategory = 0;
_loc1.Item0 = 0;
_loc1.ItemPromo0 = 0;
_loc1.ItemPromo1 = 0;
_loc1.ItemPromo2 = 0;
_loc1.ItemPromo3 = 0;
_loc1.Item1 = 0;
_loc1.Item2 = 0;
_loc1.Item3 = 0;
_loc1.Item4 = 0;
_loc1.Item5 = 0;
_loc1.Item6 = 0;
_loc1.Item7 = 0;
_loc1.Item8 = 0;
_loc1.Item9 = 0;
_loc1.Item10 = 0;
_loc1.Item11 = 0;
_loc1.Item12 = 0;
_loc1.Item13 = 0;
_loc1.Item14 = 0;
_loc1.Item15 = 0;
_loc1.Item16 = 0;
_loc1.Item17 = 0;
_loc1.Item18 = 0;
_loc1.Item19 = 0;
_loc1.Item20 = 0;
_loc1.Item21 = 0;
_loc1.Item22 = 0;
_loc1.Item23 = 0;
_loc1.Item24 = 0;
_loc1.Item25 = 0;
_loc1.Item26 = 0;
_loc1.Item27 = 0;
_loc1.Item28 = 0;
_loc1.Item29 = 0;
_loc1.Item30 = 0;
_loc1.Item31 = 0;
_loc1.Item32 = 0;
_loc1.Item33 = 0;
_loc1.Item35 = 0;
_loc1.Item36 = 0;
_loc1.Item37 = 0;
_loc1.Item38 = 0;
_loc1.Item39 = 0;
_loc1.Item40 = 0;
_loc1.Item41 = 0;
_loc1.Item42 = 0;
_loc1.Item43 = 0;
_loc1.Item45 = 0;
_loc1.Item46 = 0;
_loc1.Item47 = 0;
_loc1.Item48 = 0;
_loc1.Item49 = 0;
_loc1.Item50 = 0;
_loc1.Item51 = 0;
_loc1.prevItem0 = new Object();
_loc1.prevItem1 = new Object();
_loc1.prevItem2 = new Object();
_loc1.prevItem3 = new Object();
_loc1.prevItem4 = new Object();
_loc1.prevItem5 = new Object();
_loc1.prevItem6 = new Object();
_loc1.prevItem7 = new Object();
_loc1.prevItem8 = new Object();
_loc1.prevItem9 = new Object();
_loc1.prevItem10 = new Object();
_loc1.prevItem11 = new Object();
_loc1.prevItem12 = new Object();
_loc1.prevItem13 = new Object();
_loc1.prevItem14 = new Object();
_loc1.prevItem15 = new Object();
_loc1.prevItem16 = new Object();
_loc1.prevItem17 = new Object();
_loc1.prevItem18 = new Object();
_loc1.prevItem19 = new Object();
_loc1.prevItem20 = new Object();
_loc1.prevItem21 = new Object();
_loc1.prevItem22 = new Object();
_loc1.prevItem23 = new Object();
_loc1.prevItem24 = new Object();
_loc1.prevItem25 = new Object();
_loc1.prevItem26 = new Object();
_loc1.prevItem27 = new Object();
_loc1.prevItem28 = new Object();
_loc1.prevItem29 = new Object();
_loc1.prevItem30 = new Object();
_loc1.prevItem31 = new Object();
_loc1.prevItem32 = new Object();
_loc1.prevItem33 = new Object();
_loc1.prevItem35 = new Object();
_loc1.prevItem36 = new Object();
_loc1.prevItem37 = new Object();
_loc1.prevItem38 = new Object();
_loc1.prevItem39 = new Object();
_loc1.prevItem40 = new Object();
_loc1.prevItem41 = new Object();
_loc1.prevItem42 = new Object();
_loc1.prevItem43 = new Object();
_loc1.prevItem45 = new Object();
_loc1.prevItem46 = new Object();
_loc1.prevItem47 = new Object();
_loc1.prevItem48 = new Object();
_loc1.prevItem49 = new Object();
_loc1.prevItem50 = new Object();
_loc1.prevItem51 = new Object();
_loc1.cantPaginas = 0;
_loc1.alto = 0;
_loc1._sPromos = "";
_loc1._sData = "";
_loc1._misogrinas = 0;
_loc1._oObjetos = new ank["\x1e\n\x07"]["\x0f\x01"]();
_loc1._aLogros = new Array();
_loc1._itemsCart = new Array();
ASSetPropFlags(_loc1,null,1);
_loc1._aFiltersType = [16,17,18,82];
_loc1._sLink = "https://kitsuneon.com/shop";
_global.dofus["\r\x14"].gapi.ui.ShopFull.CLASS_NAME = "ShopFull";
