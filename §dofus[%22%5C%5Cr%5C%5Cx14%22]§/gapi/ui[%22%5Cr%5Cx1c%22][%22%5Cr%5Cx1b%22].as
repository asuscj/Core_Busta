var _loc1 = dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].prototype;
dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].MAX_DROPS_DISPLAYED = 10;
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   this._oItems = _loc4_;
   var _loc7_;
   var _loc6_;
   var _loc3_;
   var _loc5_;
   if(_loc2_)
   {
      switch(_loc4_.type)
      {
         case "monster":
         case "taxcollector":
         case "player":
            this._lblName.text = _loc4_.name;
            if(_global.isNaN(_loc4_.xp))
            {
               this._pbXP._visible = false;
            }
            else
            {
               this._pbXP._visible = true;
               this._pbXP.minimum = _loc4_.minxp;
               this._pbXP.maximum = _loc4_.maxxp;
               this._pbXP.value = _loc4_.xp;
               this._pbXP.uberValue = _loc4_.xp - (_global.isNaN(_loc4_.winxp) ? 0 : _loc4_.winxp);
            }
            _loc7_ = _global.API;
            this._lblWinXP.text = _global.isNaN(_loc4_.winxp) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.winxp).addMiddleChar(_loc7_.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblGuildXP.text = _global.isNaN(_loc4_.guildxp) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.guildxp).addMiddleChar(_loc7_.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblMountXP.text = _global.isNaN(_loc4_.mountxp) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.mountxp).addMiddleChar(_loc7_.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblKama.text = _global.isNaN(_loc4_.kama) ? "" : new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.kama).addMiddleChar(_loc7_.lang.getConfigText("THOUSAND_SEPARATOR"),3);
            this._lblLevel.text = _loc4_.level;
            this._mcDeadHead._visible = _loc4_.bDead;
            if(!_loc4_.bDead)
            {
               this._ldrGuild.contentPath = _loc4_.gfx;
            }
            _loc6_ = _loc4_.items.length;
            this._ldrXP._visible = _loc4_.bBonuspack;
            this._ldrXP.contentPath = "BonusXP_Pack";
            _loc3_ = 0;
            while(_loc3_ < dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].MAX_DROPS_DISPLAYED)
            {
               _loc5_ = this["_ctr" + _loc3_];
               _loc5_.contentData = _loc4_.items[_loc3_];
               _loc5_._visible = _loc5_.contentData != undefined;
               _loc3_ += 1;
            }
            this._ldrAllDrop._visible = _loc6_ > dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].MAX_DROPS_DISPLAYED;
         default:
            return;
      }
   }
   else if(this._lblName.text != undefined)
   {
      this._pbXP._visible = false;
      this._lblName.text = "";
      this._pbXP.minimum = 0;
      this._pbXP.maximum = 100;
      this._pbXP.value = random(99);
      this._lblWinXP.text = "";
      this._lblKama.text = "";
      this._mcDeadHead._visible = false;
      this._ldrGuild.contentPath = "";
      this._ldrXP._visible = false;
      _loc3_ = 0;
      while(_loc3_ < dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].MAX_DROPS_DISPLAYED)
      {
         _loc6_ = this["_ctr" + _loc3_];
         _loc6_.contentData = undefined;
         _loc3_ += 1;
      }
      this._ldrAllDrop._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcDeadHead._visible = false;
   this._ldrXP._visible = false;
   this._ldrGuild._visible = false;
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   var _loc4_ = this;
   this._ldrAllDrop.addEventListener("over",this);
   this._ldrAllDrop.addEventListener("out",this);
   this._pbXP.enabled = true;
   this._pbXP.addEventListener("over",this);
   this._pbXP.addEventListener("out",this);
   this._ldrXP.addEventListener("over",this);
   this._ldrXP.addEventListener("out",this);
   var _loc2_ = 0;
   var _loc3_;
   while(_loc2_ < dofus["\r\x14"].gapi.ui["\r\x1c"]["\r\x1b"].MAX_DROPS_DISPLAYED)
   {
      _loc3_ = this["_ctr" + _loc2_];
      _loc3_.addEventListener("over",this);
      _loc3_.addEventListener("out",this);
      _loc2_ += 1;
   }
};
