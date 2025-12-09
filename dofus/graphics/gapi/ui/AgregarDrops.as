_global.dofus["\r\x14"].gapi.ui.AgregarDrops = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.AgregarDrops.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.AgregarDrops.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.AgregarDrops.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
_loc1.createChildren = function()
{
   this.hideItemViewer(true);
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initAnimList});
   this.addToQueue({object:this,method:this.loadMonsters});
   this.addToQueue({object:this,method:this.initData2});
};
_loc1.initData2 = function()
{
   this._eaItems = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = this.api.lang.getAllItemTypes();
   for(var _loc4_ in _loc2_)
   {
      _loc3_.push({label:_loc2_[_loc4_].n,id:_loc4_});
   }
   _loc3_.sortOn("label");
   _loc3_.push({label:"All",id:-1});
   this._cbTypeItems.dataProvider = _loc3_;
};
_loc1.initTexts = function()
{
   this._winBg.title = "ADD DROPS";
   this._lblType.text = this.api.lang.getText("TYPE");
   this._btnDelete.label = "Delete";
   this._btnModify.label = "Add or Modify";
   this._btnTest.label = "Test PP Item";
   this._btnSearch.label = "OK";
   this._tiSearch.text = !this._tiSearch.text.length ? "" : this._tiSearch.text;
   this._tiSearchItems.text = "";
   this.limpiarText();
};
_loc1.visualizar = function(sPacket)
{
   var _loc7_ = sPacket;
   var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_;
   var _loc2_;
   var _loc3_;
   if(_loc7_ != "")
   {
      _loc4_ = _loc7_.split(";");
      for(var _loc6_ in _loc4_)
      {
         _loc2_ = _loc4_[_loc6_].split(",");
         _loc3_ = new dofus.datacenter["\f\f"](0,Number(_loc2_[0]),1,0,"",_loc2_[1]);
         _loc5_.push(_loc3_);
      }
   }
   this._lstMyDrop.dataProvider = _loc5_;
};
_loc1.limpiarText = function()
{
   this._tiPP.text = "0";
   this._tiMax.text = "0";
   this._tiPorcentaje.text = "0.0";
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnDelete.addEventListener("click",this);
   this._btnModify.addEventListener("click",this);
   this._btnTest.addEventListener("click",this);
   this._cbType.addEventListener("itemSelected",this);
   this._cbAnim.addEventListener("itemSelected",this);
   this._cg.addEventListener("selectItem",this);
   this._cg.addEventListener("overItem",this);
   this._cg.addEventListener("outItem",this);
   this._cg.addEventListener("dblClickItem",this);
   this._btnSearch.addEventListener("click",this);
   var ref = this;
   var _loc2_ = new Object();
   _loc2_.onSetFocus = function(oldFocus_txt, newFocus_txt)
   {
      var _loc1_ = Selection.getFocus();
      if(_loc1_._parent == ref._tiSearch)
      {
         if(ref._tiSearch.text == "")
         {
            ref._tiSearch.text = "";
         }
      }
      else if(ref._tiSearch.text == "")
      {
         ref._tiSearch.text = "";
      }
   };
   Selection.addListener(_loc2_);
   this._tiSearchItems.addEventListener("change",this);
   this._cbTypeItems.addEventListener("itemSelected",this);
   this._lstMyDrop.addEventListener("itemSelected",this);
   this._lstMyDrop.addEventListener("itemRollOver",this);
   this._lstMyDrop.addEventListener("itemRollOut",this);
   this._lst.addEventListener("itemSelected",this);
   this._lst.addEventListener("itemRollOver",this);
   this._lst.addEventListener("itemRollOut",this);
};
_loc1.initAnimList = function(eaTypes)
{
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = -1;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= dofus["\r\x14"].gapi.ui.AgregarDrops.ANIM_LIST.length)
      {
         break;
      }
      _loc4_.push({label:dofus["\r\x14"].gapi.ui.AgregarDrops.ANIM_LIST[_loc2_]});
   }
   this._cbAnim.dataProvider = _loc4_;
};
_loc1.initData = function(eaTypes)
{
   this._cciSprite.deleteButton = false;
   this._eaTypes = eaTypes;
   eaTypes.sortOn("label");
   this.infoDrop(false);
   this._cbType.dataProvider = eaTypes;
};
_loc1.loadMonsters = function(sFilter)
{
   if(sFilter == undefined)
   {
      sFilter = "";
   }
   var _loc9_ = this.api.lang.getMonsters();
   var _loc17_ = dofus.Constants.ARTWORKS_BIG_PATH;
   var _loc15_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc16_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc10_ = new Object();
   var _loc3_;
   var _loc4_;
   var _loc2_;
   var _loc7_;
   var _loc8_;
   var _loc5_;
   var _loc6_;
   for(var _loc18_ in _loc9_)
   {
      _loc3_ = _loc9_[_loc18_];
      _loc4_ = _loc3_.b;
      _loc2_ = _loc10_[_loc4_];
      if(_loc2_ == undefined)
      {
         _loc2_ = {label:this.api.lang.getMonstersRaceText(_loc4_).n,data:new ank["\x1e\n\x07"]["\x0f\x01"]()};
         _loc10_[_loc4_] = _loc2_;
         _loc15_.push(_loc2_);
      }
      _loc7_ = _loc18_;
      _loc8_ = _loc3_.n;
      _loc5_ = _loc3_.g;
      _loc6_ = {iconFile:_loc17_ + _loc5_ + ".swf",name:_loc8_,id:_loc7_,gfxId:_loc5_};
      _loc16_.push(_loc6_);
      _loc2_.data.push(_loc6_);
   }
   _loc15_.push({label:"-- ALL --",data:_loc16_});
   this.initData(_loc15_);
};
_loc1.filterResult = function(sFilter)
{
   var _loc4_ = this._cbType.selectedItem.data;
   var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = -1;
   var _loc5_;
   while(true)
   {
      _loc2_ = _loc2_ + 1;
      if(_loc2_ >= _loc4_.length)
      {
         break;
      }
      _loc5_ = _loc4_[_loc2_].name;
      if(!(sFilter.length && (sFilter != "" && (sFilter.length && _loc5_.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))))
      {
         _loc6_.push(_loc4_[_loc2_]);
      }
   }
   this._cg.dataProvider = _loc6_;
};
_loc1.click = function(oEvent)
{
   var _loc2_;
   var _loc3_;
   switch(oEvent.target._name)
   {
      case "_btnClose":
      case "_btnCancel":
         this.dispatchEvent({type:"cancel"});
         this.callClose();
         break;
      case "_btnSearch":
         this._cbType.selectedIndex = 0;
         this.filterResult(this._tiSearch.text);
         break;
      case "_btnTest":
         _loc2_ = this.oData.id;
         _loc3_ = this._lst.selectedItem.unicID;
         if(_loc2_ == undefined || _loc3_ == undefined)
         {
            return undefined;
         }
         this.limpiarText();
         this.api.kernel.DebugConsole.process("INFO_DROP_MOB_OBJETO " + _loc2_ + " " + _loc3_);
         this.hideItemViewer(true);
         break;
      case "_btnDelete":
         if(this._lst.selectedItem != undefined)
         {
            _loc2_ = this.oData.id;
            _loc3_ = this._lst.selectedItem.unicID;
            if(_loc2_ == undefined || _loc3_ == undefined)
            {
               return undefined;
            }
            this.limpiarText();
            this.api.kernel.DebugConsole.process("BORRAR_DROP " + _loc2_ + " " + _loc3_);
            this.hideItemViewer(true);
         }
         else if(this._lstMyDrop.selectedItem != undefined)
         {
            _loc2_ = this.oData.id;
            _loc3_ = this._lstMyDrop.selectedItem.unicID;
            if(_loc2_ == undefined || _loc3_ == undefined)
            {
               return undefined;
            }
            this.limpiarText();
            this.api.kernel.DebugConsole.process("BORRAR_DROP " + _loc2_ + " " + _loc3_);
            this.hideItemViewer(true);
            this.api.network.send("wB" + _loc2_);
         }
         break;
      case "_btnModify":
         if(this._lst.selectedItem != undefined)
         {
            _loc2_ = this.oData.id;
            _loc3_ = this._lst.selectedItem.unicID;
            if(_loc2_ == undefined || _loc3_ == undefined)
            {
               return undefined;
            }
            this.api.kernel.DebugConsole.process("ADD_DROP " + _loc2_ + " " + _loc3_ + " " + this._tiPP.text + " " + this._tiPorcentaje.text + " " + this._tiMax.text);
            this.hideItemViewer(true);
         }
         else if(this._lstMyDrop.selectedItem != undefined)
         {
            _loc2_ = this.oData.id;
            _loc3_ = this._lstMyDrop.selectedItem.unicID;
            if(_loc2_ == undefined || _loc3_ == undefined)
            {
               return undefined;
            }
            this.api.kernel.DebugConsole.process("ADD_DROP " + _loc2_ + " " + _loc3_ + " " + this._tiPP.text + " " + this._tiPorcentaje.text + " " + this._tiMax.text);
            this.hideItemViewer(true);
         }
      default:
         return;
   }
};
_loc1.change = function(oEvent)
{
   if(this._tiSearchItems.text.length > 3)
   {
      this.searchItem(this._tiSearchItems.text.toUpperCase());
   }
   else if(this._lst.dataProvider != this._eaItemsOriginal)
   {
      this._lst.dataProvider = this._eaItemsOriginal;
   }
};
_loc1.recibir = function(sText)
{
   var _loc2_ = sText.split(";");
   this._tiPP.text = _loc2_[0];
   this._tiPorcentaje.text = Number(_loc2_[1]) / 1000;
   this._tiMax.text = _loc2_[2];
   this._btnUnico.selected = _loc2_[3] == "true";
   this._btnRaro.selected = _loc2_[4] == "true";
};
_loc1.selectItem = function(oEvent)
{
   var _loc5_ = oEvent.target.contentData;
   var _loc6_;
   var _loc2_;
   var _loc7_;
   if(_loc5_ != undefined)
   {
      this._cciSprite.data = {name:_loc5_.name,gfxFile:dofus.Constants.CLIPS_PERSOS_PATH + _loc5_.gfxId + ".swf",title:_loc5_.id};
      this._cciSprite.enabled = true;
      _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc2_ = 0;
      _loc7_ = this.api.lang.getMonstersText(_loc5_.id);
      while(true)
      {
         _loc2_ = _loc2_ + 1;
         if(_loc2_ >= 6)
         {
            break;
         }
         _loc6_.push({label:_loc7_["g" + _loc2_].l,id:_loc2_});
      }
      this._cbGrado.dataProvider = _loc6_;
      this._cbGrado.selectedIndex = 0;
      this.oData = _loc5_;
      this.api.network.send("wB" + _loc5_.id);
   }
   else
   {
      this._cciSprite.data = undefined;
      this._cciSprite.enabled = false;
   }
   this._tiPP.text = "0";
   this._tiMax.text = "0";
   this._tiPorcentaje.text = "0.0";
   this.hideItemViewer(true);
};
_loc1.overItem = function(oEvent)
{
   if(oEvent.target.contentData != undefined)
   {
      this.gapi.showTooltip(oEvent.target.contentData.name + " (" + oEvent.target.contentData.id + ", GFX: " + oEvent.target.contentData.gfxId + ")",oEvent.target,-20);
   }
};
_loc1.outItem = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.itemSelected = function(oEvent)
{
   var _loc2_;
   var _loc4_;
   var _loc5_;
   var _loc3_;
   switch(oEvent.target)
   {
      case this._cbType:
         _loc2_ = this._cbType.selectedItem.data;
         this._cg.dataProvider = _loc2_;
         this._lblNumber.text = _loc2_.length + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("MONSTER"),"m",_loc2_.length < 2);
         this.hideItemViewer(true);
         break;
      case this._cbAnim:
         this._cciSprite.setAnim(this._cbAnim.selectedItem.label,true);
         break;
      case this._cbTypeItems:
         this._aTypes = new Array();
         if(this._cbTypeItems.selectedItem.id != -1)
         {
            this._aTypes.push(this._cbTypeItems.selectedItem.id);
         }
         else
         {
            _loc2_ = 0;
            while(true)
            {
               _loc2_ = _loc2_ + 1;
               if(_loc2_ >= this._cbTypeItems.dataProvider.length)
               {
                  break;
               }
               if(this._cbTypeItems.dataProvider[_loc2_].id != -1)
               {
                  this._aTypes.push(this._cbTypeItems.dataProvider[_loc2_].id);
               }
            }
         }
         this.generateIndexes();
         this.change(oEvent);
         break;
      case this._lstMyDrop:
         _loc4_ = this._lstMyDrop.selectedItem;
         this._lst.selectedIndex = -1;
         this._lst.selectedItem = undefined;
         if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
         {
            this.api.kernel.GameManager.insertItemInChat(_loc4_);
            return undefined;
         }
         this.hideItemViewer(!this._winItemViewer._visible ? false : this._itvItemViewer.itemData.unicID == _loc4_.unicID);
         this._itvItemViewer.itemData = _loc4_;
         _loc5_ = _loc4_.price.split("#");
         this._tiPP.text = _loc5_[0];
         this._tiMax.text = _loc5_[2];
         this._tiPorcentaje.text = Number(_loc5_[1]) / 1000;
         break;
      case this._lst:
         this.limpiarText();
         _loc3_ = this._lst.selectedItem;
         this._lstMyDrop.selectedIndex = -1;
         this._lstMyDrop.selectedItem = undefined;
         if(_loc3_ == undefined)
         {
            this.hideItemViewer(true);
         }
         else
         {
            if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY))
            {
               this.api.kernel.GameManager.insertItemInChat(_loc3_);
               return undefined;
            }
            this.hideItemViewer(!this._winItemViewer._visible ? false : this._itvItemViewer.itemData.unicID == _loc3_.unicID);
            this._itvItemViewer.itemData = _loc3_;
         }
      default:
         return;
   }
};
_loc1.onShortcut = function(sShortcut)
{
   if(sShortcut == "ACCEPT_CURRENT_DIALOG" && this._tiSearch.focused)
   {
      this.click({target:this._btnSearch});
      return false;
   }
   return true;
};
_loc1.hideItemViewer = function(bHide)
{
   this._winItemViewer._visible = !bHide;
   this._itvItemViewer._visible = !bHide;
};
_loc1.generateIndexes = function()
{
   var _loc5_ = new Object();
   for(var _loc8_ in this._aTypes)
   {
      _loc5_[this._aTypes[_loc8_]] = true;
   }
   var _loc6_ = this.api.lang.getItemUnics();
   this._eaItems = new ank["\x1e\n\x07"]["\x0f\x01"]();
   this._eaItemsOriginal = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc3_;
   var _loc7_;
   var _loc4_;
   for(_loc8_ in _loc6_)
   {
      if(Number(_loc8_) <= _global.ID_OBJETO_MODELO_MAX)
      {
         _loc3_ = _loc6_[_loc8_];
         if(_loc5_[_loc3_.t])
         {
            if(_loc3_.n != "")
            {
               _loc7_ = _loc3_.n;
               _loc4_ = new dofus.datacenter["\f\f"](0,Number(_loc8_),1,0,"",0);
               this._eaItems.push(_loc4_);
               this._eaItemsOriginal.push(_loc4_);
            }
         }
      }
   }
};
_loc1.searchItem = function(sText)
{
   var _loc9_ = sText.split(" ");
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc4_ = new Object();
   var _loc7_ = new Object();
   var _loc5_ = 0;
   var _loc6_ = 0;
   var _loc2_;
   var _loc3_;
   while(true)
   {
      _loc6_ = _loc6_ + 1;
      if(_loc6_ >= this._eaItems.length)
      {
         break;
      }
      _loc2_ = this._eaItems[_loc6_];
      _loc3_ = this.searchWordsInName(_loc9_,_loc2_.name.toUpperCase(),_loc5_);
      if(_loc3_ != 0)
      {
         _loc4_[_loc2_.unicID] = _loc3_;
         _loc7_[_loc2_.unicID] = _loc2_;
         _loc5_ = _loc3_;
      }
   }
   for(var _loc10_ in _loc4_)
   {
      if(_loc4_[_loc10_] >= _loc5_)
      {
         _loc8_.push(_loc7_[_loc10_]);
      }
   }
   this._lst.dataProvider = _loc8_;
};
_loc1.searchWordsInName = function(aWords, sName, nMaxWordsCount)
{
   var _loc3_ = 0;
   var _loc1_ = aWords.length;
   var _loc2_;
   while(true)
   {
      _loc1_ = _loc1_ - 1;
      if(_loc1_ < 0)
      {
         break;
      }
      _loc2_ = aWords[_loc1_];
      if(sName.toUpperCase().indexOf(_loc2_.toUpperCase()) != -1)
      {
         _loc3_ = _loc3_ + 1;
      }
      else if(_loc3_ + _loc1_ < nMaxWordsCount)
      {
         return 0;
      }
   }
   return _loc3_;
};
_loc1.itemRollOver = function(oEvent)
{
   this.gapi.showTooltip(oEvent.row.item.name + (" (" + oEvent.row.item.unicID + ")"),oEvent.row,20,{bXLimit:true,bYLimit:false});
};
_loc1.itemRollOut = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.oData;
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_global.dofus["\r\x14"].gapi.ui.AgregarDrops.CLASS_NAME = "AgregarDrops";
_global.dofus["\r\x14"].gapi.ui.AgregarDrops.ANIM_LIST = ["static","walk","run","hit","bonus","anim0","anim1","anim2","anim3","anim4","anim5","anim6","anim7","anim8","anim9","anim10","anim11","anim12","anim12","anim13","anim14","anim15","anim16","anim17","anim18","anim111","anim112","anim113","anim114","anim115","anim116","anim117","emote1","emote2","emote3","emote4","emote5","emote6","emote7","emote8","emote9","emote10","emote11","emote12","emote13","emote14","emote15","emote16","emote17","emote18","emote19","emote20","emote21","emoteStatic1","emoteStatic14","emoteStatic15","emoteStatic16","emoteStatic19","emoteStatic20","emoteStatic21","die"];
