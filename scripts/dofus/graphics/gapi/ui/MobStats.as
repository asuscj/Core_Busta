_global.dofus["\r\x14"].gapi.ui.MobStats = function()
{
   super();
};
dofus["\r\x14"].gapi.ui.MobStats.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.MobStats.prototype;
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.MobStats.CLASS_NAME);
};
_loc1.callClose = function()
{
   this.unloadThis();
   return true;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initAnimList});
   this.addToQueue({object:this,method:this.loadMonsters});
};
_loc1.initTexts = function()
{
   this._winBg.title = "MOBS STATS";
   this._lblType.text = this.api.lang.getText("TYPE");
   this._btnCancel.label = "Cancel";
   this._btnModify.label = "Modify";
   this._btnTest.label = "Test";
   this._btnSearch.label = this.api.lang.getText("OK");
   this._tiSearch.text = !this._tiSearch.text.length ? "" : this._tiSearch.text;
   for(var _loc2_ in this.aIDsStats)
   {
      this["_it" + this.aIDsStats[_loc2_]].text = 0;
   }
   for(_loc2_ in this.aIDsResistances)
   {
      this["_res" + this.aIDsResistances[_loc2_]].text = 0;
   }
   this._itIA.text = 0;
   this._itPDV.text = 0;
   this._itXP.text = 0;
   this._itMinKamas.text = 0;
   this._itMaxKamas.text = 0;
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnModify.addEventListener("click",this);
   this._btnTest.addEventListener("click",this);
   this._cbType.addEventListener("itemSelected",this);
   this._cbGrado.addEventListener("itemSelected",this);
   this._cbAnim.addEventListener("itemSelected",this);
   this._cg.addEventListener("selectItem",this);
   this._cg.addEventListener("overItem",this);
   this._cg.addEventListener("outItem",this);
   this._cg.addEventListener("dblClickItem",this);
   this._btnSearch.addEventListener("click",this);
   for(var _loc2_ in this.aIDsStats)
   {
      this["_it" + this.aIDsStats[_loc2_]].addEventListener("change",this);
   }
   for(_loc2_ in this.aIDsResistances)
   {
      this["_res" + this.aIDsResistances[_loc2_]].addEventListener("change",this);
   }
   this._itMinKamas.addEventListener("change",this);
   this._itMaxKamas.addEventListener("change",this);
   this._itPDV.addEventListener("change",this);
   this._itXP.addEventListener("change",this);
   this._itIA.addEventListener("change",this);
   var ref = this;
   var _loc3_ = new Object();
   _loc3_.onSetFocus = function(oldFocus_txt, newFocus_txt)
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
   Selection.addListener(_loc3_);
};
_loc1.initAnimList = function(eaTypes)
{
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 0;
   while(_loc2_ < dofus["\r\x14"].gapi.ui.MobStats.ANIM_LIST.length)
   {
      _loc4_.push({label:dofus["\r\x14"].gapi.ui.MobStats.ANIM_LIST[_loc2_]});
      _loc2_ = _loc2_ + 1;
   }
   this._cbAnim.dataProvider = _loc4_;
};
_loc1.initData = function(eaTypes)
{
   this._cciSprite.deleteButton = false;
   this._eaTypes = eaTypes;
   eaTypes.sortOn("label");
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
   var _loc4_;
   var _loc3_;
   var _loc2_;
   var _loc8_;
   var _loc7_;
   var _loc6_;
   var _loc5_;
   for(var _loc18_ in _loc9_)
   {
      _loc4_ = _loc9_[_loc18_];
      _loc3_ = _loc4_.b;
      _loc2_ = _loc10_[_loc3_];
      if(_loc2_ == undefined)
      {
         _loc2_ = {label:this.api.lang.getMonstersRaceText(_loc3_).n,data:new ank["\x1e\n\x07"]["\x0f\x01"]()};
         _loc10_[_loc3_] = _loc2_;
         _loc15_.push(_loc2_);
      }
      _loc8_ = _loc18_;
      _loc7_ = _loc4_.n;
      _loc6_ = _loc4_.g;
      _loc5_ = {iconFile:_loc17_ + _loc6_ + ".swf",name:_loc7_,id:_loc8_,gfxId:_loc6_};
      _loc16_.push(_loc5_);
      _loc2_.data.push(_loc5_);
   }
   _loc15_.push({label:"-- ALL --",data:_loc16_});
   this.initData(_loc15_);
};
_loc1.select = function(oEvent)
{
};
_loc1.filterResult = function(sFilter)
{
   var _loc4_ = this._cbType.selectedItem.data;
   var _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_ = 0;
   var _loc5_;
   while(_loc2_ < _loc4_.length)
   {
      _loc5_ = _loc4_[_loc2_].name;
      if(!(sFilter.length && (sFilter != "" && (sFilter.length && _loc5_.toUpperCase().indexOf(sFilter.toUpperCase()) == -1))))
      {
         _loc6_.push(_loc4_[_loc2_]);
      }
      _loc2_ = _loc2_ + 1;
   }
   this._cg.dataProvider = _loc6_;
};
_loc1.change = function(oEvent)
{
   if(oEvent.target.text == undefined || oEvent.target.text == "")
   {
      oEvent.target.text = 0;
   }
};
_loc1.defecto = function(sText)
{
   var _loc5_ = sText.split("~");
   var _loc4_ = _loc5_[0].split("|");
   var _loc10_ = _loc5_[1].split("|");
   var _loc8_ = _loc5_[2].split("|");
   var _loc6_ = _loc5_[3].split("|");
   var _loc7_ = _loc5_[4].split("|");
   var _loc9_ = _loc5_[5];
   var _loc3_ = _loc5_[6].split("|");
   this._aStats = new Array();
   this._aResistances = new Array();
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      this._aStats[_loc2_ + 1] = _loc4_[_loc2_] + "|" + _loc10_[_loc2_] + "|" + _loc8_[_loc2_] + "|" + _loc6_[_loc2_] + "|" + _loc7_[_loc2_] + "|" + _loc9_;
      _loc2_ = _loc2_ + 1;
   }
   _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      this._aResistances[_loc2_ + 1] = _loc3_[_loc2_];
      _loc2_ = _loc2_ + 1;
   }
   this.actualizarStats(this._cbGrado.selectedItem.id);
};
_loc1.actualizarStats = function(nNumber)
{
   if(this._aStats[nNumber] == undefined)
   {
      return undefined;
   }
   var _loc6_ = this._aStats[nNumber].split("|");
   var _loc5_ = _loc6_[0].split(",");
   this._itPDV.text = _loc6_[1];
   this._itXP.text = _loc6_[2];
   this._itMinKamas.text = _loc6_[3];
   this._itMaxKamas.text = _loc6_[4];
   this._itIA.text = _loc6_[5];
   var _loc4_ = this._aResistances[nNumber].split(",");
   var _loc3_;
   var _loc2_;
   for(var _loc7_ in _loc5_)
   {
      _loc3_ = _loc5_[_loc7_].split(":");
      _loc2_ = this["_it" + _loc3_[0]];
      if(_loc2_ != undefined)
      {
         _loc2_.text = _loc3_[1];
      }
   }
   for(_loc7_ in _loc4_)
   {
      _loc3_ = _loc4_[_loc7_].split(":");
      _loc2_ = this["_res" + _loc3_[0]];
      _loc2_.restrict = "0-9\\-";
      if(_loc2_ != undefined)
      {
         _loc2_.text = _loc3_[1];
      }
   }
};
_loc1.click = function(oEvent)
{
   var _loc3_;
   var _loc2_;
   var _loc4_;
   var _loc5_;
   var _loc7_;
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
      case "_btnModify":
         _loc3_ = this.oData.id;
         _loc2_ = this._cbGrado.selectedItem.id;
         if(_loc3_ == undefined || _loc2_ == undefined)
         {
            return undefined;
         }
         if(oEvent.target._name == "_btnTest")
         {
            this.api.kernel.DebugConsole.process("TEST_DAÑO " + _loc3_ + " " + _loc2_ + " " + this.compilarSoloStats());
            break;
         }
         _loc4_ = this.compilarStats(_loc2_);
         _loc5_ = _loc4_.split("|");
         _loc7_ = _loc5_[5];
         this._aStats[_loc2_] = _loc4_;
         this._cLogs.text = this._lastStr + "\nREADY, STATS MOB MODIFIED";
         this.api.kernel.DebugConsole.process("MODIFICAR_STATS_MOB " + _loc3_ + " " + _loc2_ + " " + _loc4_);
         this.api.kernel.DebugConsole.process("STATS_DEFECTO_MOB " + _loc3_);
         break;
   }
};
_loc1.compilarSoloStats = function()
{
   var _loc2_ = "";
   var _loc3_;
   var _loc4_;
   for(var _loc5_ in this.aIDsStats)
   {
      _loc3_ = this.aIDsStats[_loc5_];
      _loc4_ = this["_it" + _loc3_];
      if(_loc4_ != undefined)
      {
         if(_loc2_.length > 0)
         {
            _loc2_ += ";";
         }
         _loc2_ += _loc3_ + "," + _loc4_.text;
      }
   }
   return _loc2_;
};
_loc1.compilarStats = function(grado)
{
   var _loc2_ = "";
   var _loc3_;
   var _loc4_;
   for(var _loc5_ in this.aIDsStats)
   {
      _loc3_ = this.aIDsStats[_loc5_];
      _loc4_ = this["_it" + _loc3_];
      if(_loc4_ != undefined)
      {
         if(_loc2_.length > 0)
         {
            _loc2_ += ",";
         }
         _loc2_ += _loc3_ + ":" + _loc4_.text;
      }
   }
   _loc2_ += "|";
   _loc2_ += this._itPDV.text;
   _loc2_ += "|";
   _loc2_ += this._itXP.text;
   _loc2_ += "|";
   _loc2_ += this._itMinKamas.text;
   _loc2_ += "|";
   _loc2_ += this._itMaxKamas.text;
   _loc2_ += "|";
   _loc2_ += this._itIA.text;
   _loc2_ += "|";
   for(_loc5_ in this.aIDsResistances)
   {
      _loc3_ = this.aIDsResistances[_loc5_];
      _loc4_ = this["_res" + _loc3_];
      if(_loc4_ != undefined)
      {
         if(_loc2_.length > 0)
         {
            _loc2_ += ",";
         }
         _loc2_ += _loc3_ + ":" + _loc4_.text;
      }
   }
   _loc2_ += ",";
   _loc2_ += "160:2";
   _loc2_ += ",";
   _loc2_ += "161:2";
   return _loc2_;
};
_loc1.recibir = function(sText)
{
   if(sText == "")
   {
      this._cLogs.text = "<b>MOB NO EXISTE / MOB DONT EXIST</b>";
      return undefined;
   }
   var _loc2_ = "";
   var _loc6_ = this.oData;
   var _loc5_;
   var _loc3_;
   var _loc4_;
   if(_loc6_ != undefined)
   {
      _loc2_ += "<b><u>" + _loc6_.name + " (" + _loc6_.id + ")</u></b>\n";
      _loc5_ = sText.split("|");
      _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         if(!(_loc5_[_loc3_] == undefined || _loc5_[_loc3_].length == 0))
         {
            _loc4_ = _loc5_[_loc3_].split(";");
            _loc2_ += "--------------------------\n";
            _loc2_ += "<b>" + this.api.lang.getSpellText(_loc4_[0]).n + "(" + _loc4_[0] + ")</b>\n";
            if(_loc4_[1] != undefined)
            {
               _loc2_ += _loc4_[1] + "\n";
            }
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   else
   {
      _loc2_ = "Porfavor, selecciona un mob";
   }
   this._lastStr = _loc2_;
   this._cLogs.text = _loc2_;
};
_loc1.dblClickItem = function(oEvent)
{
   this.select(oEvent);
};
_loc1.selectItem = function(oEvent)
{
   var _loc7_ = oEvent.target.contentData;
   var _loc6_;
   var _loc3_;
   var _loc2_;
   if(_loc7_ != undefined)
   {
      this._cciSprite.data = {name:_loc7_.name,gfxFile:dofus.Constants.CLIPS_PERSOS_PATH + _loc7_.gfxId + ".swf",title:_loc7_.id};
      this._cciSprite.enabled = true;
      _loc6_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc3_ = this.api.lang.getMonstersText(_loc7_.id);
      _loc2_ = 1;
      while(_loc2_ < 12)
      {
         if(_loc3_["g" + _loc2_] == undefined)
         {
            break;
         }
         _loc6_.push({label:_loc3_["g" + _loc2_].l,id:_loc2_});
         _loc2_ = _loc2_ + 1;
      }
      this._cbGrado.dataProvider = _loc6_;
      this._cbGrado.selectedIndex = 0;
      this.oData = _loc7_;
      this.api.kernel.DebugConsole.process("STATS_DEFECTO_MOB " + _loc7_.id);
   }
   else
   {
      this._cciSprite.data = undefined;
      this._cciSprite.enabled = false;
   }
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
   switch(oEvent.target)
   {
      case this._cbGrado:
         this.actualizarStats(this._cbGrado.selectedItem.id);
         break;
      case this._cbType:
         _loc2_ = this._cbType.selectedItem.data;
         this._cg.dataProvider = _loc2_;
         this._lblNumber.text = _loc2_.length + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this.api.lang.getText("MONSTER"),"m",_loc2_.length < 2);
         break;
      case this._cbAnim:
         this._cciSprite.setAnim(this._cbAnim.selectedItem.label,true);
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
_loc1.getEfecto = function(nEfecto)
{
   switch(nEfecto)
   {
      case 85:
         return "% PDV ATK AGUA";
      case 91:
         return "ROBA AGUA";
      case 96:
         return "DAÑO AGUA";
      case 275:
         return "% PDV ATK AGUA";
      case 86:
         return "% PDV ATK TIERRA";
      case 92:
         return "ROBA TIERRA";
      case 97:
         return "DAÑOS TIERRA";
      case 276:
         return "% PDV ATK TIERRA";
      case 87:
         return "% PDV ATK AIRE";
      case 93:
         return "ROBA AIRE";
      case 98:
         return "DAÑOS AIRE";
      case 277:
         return "% PDV ATK AIRE";
      case 88:
         return "% PDV ATK FUEGO";
      case 94:
         return "ROBA FUEGO";
      case 99:
         return "DAÑOS FUEGO";
      case 278:
         return "% PDV ATK FUEGO";
      case 89:
         return "% PDV ATK NEUTRAL";
      case 95:
         return "ROBA NEUTRAL";
      case 100:
         return "DAÑOS NEUTRAL";
      case 279:
         return "% PDV ATK NEUTRAL";
      case 81:
      case 108:
         return "CURACION";
      default:
         return "******";
   }
};
_loc1.aIDsStats = [111,128,118,123,126,119,182,174];
_loc1.aIDsResistances = [210,211,212,213,214,160,161];
_loc1.oData;
_loc1.aStats = new Array();
_loc1._lastStr = "";
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.ui.MobStats.CLASS_NAME = "MobStats";
_global.dofus["\r\x14"].gapi.ui.MobStats.ANIM_LIST = ["static","walk","run","hit","bonus","anim0","anim1","anim2","anim3","anim4","anim5","anim6","anim7","anim8","anim9","anim10","anim11","anim12","anim12","anim13","anim14","anim15","anim16","anim17","anim18","anim111","anim112","anim113","anim114","anim115","anim116","anim117","emote1","emote2","emote3","emote4","emote5","emote6","emote7","emote8","emote9","emote10","emote11","emote12","emote13","emote14","emote15","emote16","emote17","emote18","emote19","emote20","emote21","emoteStatic1","emoteStatic14","emoteStatic15","emoteStatic16","emoteStatic19","emoteStatic20","emoteStatic21","die"];
