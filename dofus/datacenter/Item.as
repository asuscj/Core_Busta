#initclip 200
if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.datacenter)
{
   _global.dofus.datacenter = new Object();
}
var _loc1 = _global.dofus.datacenter["\f\f"].prototype;
_loc1["\f\f"] = function(nQuantity, nID, nUnicID, nPosition, sEffects, nPrice, nSkin, nMood)
{
   super();
   this.initialize(nQuantity,nID,nUnicID,nPosition,sEffects,nPrice,nSkin,nMood);
};
_loc1.__get__label = function()
{
   return this._nQuantity <= 1 ? undefined : this._nQuantity;
};
_loc1.__get__ID = function()
{
   return this._nID;
};
_loc1.__get__unicID = function()
{
   return this._nUnicID;
};
_loc1.__get__compressedEffects = function()
{
   return this._sEffects;
};
_loc1.__get__isEquiped = function()
{
   return this._nPosition > -1;
};
_loc1.__get__isRemovedFromInventory = function()
{
   return this._bRemovedFromInventory;
};
_loc1.__set__isRemovedFromInventory = function(bRemovedFromInventory)
{
   this._bRemovedFromInventory = bRemovedFromInventory;
};
_loc1.__set__Quantity = function(value)
{
   if(_global.isNaN(Number(value)))
   {
      return undefined;
   }
   this._nQuantity = Number(value);
};
_loc1.__get__Quantity = function()
{
   return this._nQuantity;
};
_loc1.__set__remainingHours = function(nRemainingHours)
{
   this._nRemainingHours = nRemainingHours;
};
_loc1.__get__remainingHours = function()
{
   return this._nRemainingHours;
};
_loc1.__set__position = function(value)
{
   if(_global.isNaN(Number(value)))
   {
      return undefined;
   }
   this._nPosition = Number(value);
};
_loc1.__get__position = function()
{
   return this._nPosition;
};
_loc1.__set__priceMultiplicator = function(value)
{
   if(_global.isNaN(Number(value)))
   {
      return undefined;
   }
   this._nPriceMultiplicator = Number(value);
};
_loc1.__get__priceMultiplicator = function()
{
   return this._nPriceMultiplicator;
};
_loc1.__get__name = function()
{
   var _loc3_;
   if(_global.ITEMS_CREADOS[this._nUnicID])
   {
      for(var _loc4_ in this._aEffects)
      {
         _loc3_ = this._aEffects[_loc4_];
         if(_loc3_[0] == 902)
         {
            return _loc3_[4];
         }
      }
   }
   return ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.fetchString(this._oUnicInfos.n),this.api.lang.getItemUnicStringText());
};
_loc1.showStatsTooltip = function(_loc2_, _loc3_)
{
   var target = _loc2_;
   var nYOffset = -20;
   var sText = this.name + " (" + this.api.lang.getText("LEVEL_SMALL") + " " + this.level + ")";
   var _loc5_ = true;
   var _loc4_;
   for(var _loc6_ in this.effects)
   {
      _loc4_ = this.effects[_loc6_];
      if(_loc4_.description.length > 0)
      {
         if(_loc5_)
         {
            sText += "\n";
            nYOffset -= 10;
            _loc5_ = false;
         }
         sText = sText + "\n" + _loc4_.description;
         nYOffset -= 12;
      }
   }
   this.api.ui.showTooltip(sText,target,nYOffset,{bXLimit:true, bYLimit:false});
};
_loc1.__get__description = function()
{
   var _loc4_ = this.api.lang.getItemTypeText(this.type).n;
   var _loc3_ = "";
   var _loc5_;
   var _loc2_;
   if(this.isFromItemSet)
   {
      _loc5_ = new dofus.datacenter.ItemSet(this.itemSetID);
      _loc3_ = "<u>" + _loc5_.name + " (" + this.api.lang.getText("ITEM_TYPE") + " : " + _loc4_ + ")</u>\n";
   }
   else
   {
      _loc2_ = "";
      if(this._sEffects.length > 0 && this._sEffects.indexOf("393") != -1)
      {
         _loc2_ = " (" + this.api.lang.getText("ITEM_TYPE_CEREMONIAL") + ")";
      }
      else
      {
         _loc2_ = "";
      }
      _loc3_ = "<u>" + this.api.lang.getText("ITEM_TYPE") + " : " + _loc4_ + _loc2_ + "</u>\n";
   }
   return _loc3_ + ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.fetchString(this._oUnicInfos.d),this.api.lang.getItemUnicStringText());
};
_global.dofus.datacenter["\f\f"].isFullSoul = function(_loc2_)
{
   return _loc2_ == dofus.datacenter["\f\f"].FULL_SOUL_STONE_NORMAL || (_loc2_ == dofus.datacenter["\f\f"].FULL_SOUL_STONE_ARCHI || _loc2_ == dofus.datacenter["\f\f"].FULL_SOUL_STONE_BOSS);
};
_loc1.__get__type = function()
{
   if(this._nRealType)
   {
      return this._nRealType;
   }
   return Number(this._oUnicInfos.t);
};
_loc1.__set__type = function(nType)
{
   this._nRealType = nType;
};
_loc1.__get__realType = function()
{
   return Number(this._oUnicInfos.t);
};
_loc1.__get__enhanceable = function()
{
   return this._oUnicInfos.fm;
};
_loc1.__get__style = function()
{
   switch(this._nColorStyle)
   {
      case 1:
         return "VIP";
      case 2:
         return "Leg";
      case 3:
         return "Div";
      case 4:
         return "Raro";
      case 5:
         return "Mitico";
      default:
         if(this.isFromItemSet)
         {
            return "ItemSet";
         }
         if(this._oUnicInfos.et == true)
         {
            return "Ethereal";
         }
         return "";
   }
};
_loc1.__set__itemPago = function(nType)
{
   this._nItemPago = nType;
};
_loc1.__get__itemPago = function()
{
   return this._nItemPago;
};
_loc1.__set__coinPago = function(nType)
{
   this._ncoin = nType;
};
_loc1.__get__coinPago = function()
{
   return this._ncoin;
};
_loc1.__set__Chapa = function(nType)
{
   this._nChapa = nType;
};
_loc1.__get__Chapa = function()
{
   return this._nChapa;
};
_loc1.__get__colorStyle = function()
{
   return this._nColorStyle;
};
_loc1.__get__needTwoHands = function()
{
   return this._oUnicInfos.tw == true;
};
_loc1.__get__isEthereal = function()
{
   return this._isEthereal;
};
_loc1.__get__isHidden = function()
{
   return this._oUnicInfos.h == true;
};
_loc1.__get__etherealResistance = function()
{
   var _loc2_;
   for(var _loc3_ in this._aEffects)
   {
      _loc2_ = this._aEffects[_loc3_];
      if(_loc2_[0] == 812)
      {
         return new dofus.datacenter["\x0f\r"](undefined,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
      }
   }
   return new Array();
};
_loc1.__get__isMimobionte = function()
{
   return this._isMimobionte;
};
_loc1.__get__isFromItemSet = function()
{
   return this._oUnicInfos.s != undefined;
};
_loc1.__get__itemSetID = function()
{
   return this._oUnicInfos.s;
};
_loc1.__get__typeText = function()
{
   return this.api.lang.getItemTypeText(this.type);
};
_loc1.__get__superType = function()
{
   return this.typeText.t;
};
_loc1.__get__superTypeText = function()
{
   return this.api.lang.getItemSuperTypeText(this.superType);
};
_loc1.__get__effects = function()
{
   return dofus.datacenter["\f\f"].getItemDescriptionEffects(this._aEffects,undefined,dofus.datacenter["\f\f"].getBaseItemEffects(this.unicID));
};
_loc1.__set__effects = function(aEffects)
{
   this._aEffects = aEffects;
};
_loc1.__get__visibleEffects = function()
{
   return dofus.datacenter["\f\f"].getItemDescriptionEffects(this._aEffects,true,dofus.datacenter["\f\f"].getBaseItemEffects(this.unicID));
};
_loc1.__get__canUse = function()
{
   return this._oUnicInfos.u != undefined ? true : false;
};
_loc1.__get__canTarget = function()
{
   return this._oUnicInfos.ut != undefined ? true : false;
};
_loc1.__get__canDestroy = function()
{
   return this.superType != 14 && !this.isCursed;
};
_loc1.__get__canDrop = function()
{
   return this.superType != 14 && !this.isCursed;
};
_loc1.__get__canMoveToShortut = function()
{
   return this.canUse == true || this.canTarget == true;
};
_loc1.__get__gfx = function()
{
   if(this._sGfx)
   {
      return this._sGfx;
   }
   return !_global.GFX[this._nUnicID] ? this._oUnicInfos.g : _global.GFX[this._nUnicID];
};
_loc1.__set__gfx = function(sGfx)
{
   this._sGfx = sGfx;
};
_loc1.__get__realGfx = function()
{
   return this._sRealGfx;
};
_loc1.__get__price = function()
{
   if(this._nPrice == undefined)
   {
      return Math.max(0,Math.round(Number(this._oUnicInfos.p) * (this._nPriceMultiplicator != undefined ? this._nPriceMultiplicator : 0)));
   }
   return this._nPrice;

};
_loc1.__get__weight = function()
{
   return Number(this._oUnicInfos.w);
};
_loc1.__get__isCursed = function()
{
   return this._oUnicInfos.m;
};
_loc1.__get__normalHit = function()
{
   return this._aEffects;
};
_loc1.__get__criticalHitBonus = function()
{
   return this.getItemFightEffectsText(0);
};
_loc1.__get__apCost = function()
{
   return this.getItemFightEffectsText(1);
};
_loc1.__get__rangeMin = function()
{
   return this.getItemFightEffectsText(2);
};
_loc1.__get__rangeMax = function()
{
   return this.getItemFightEffectsText(3);
};
_loc1.__get__criticalHit = function()
{
   return this.getItemFightEffectsText(4);
};
_loc1.__get__criticalFailure = function()
{
   return this.getItemFightEffectsText(5);
};
_loc1.__get__lineOnly = function()
{
   return this.getItemFightEffectsText(6);
};
_loc1.__get__lineOfSight = function()
{
   return this.getItemFightEffectsText(7);
};
_loc1.__get__effectZones = function()
{
   return this._aEffectZones;
};
_loc1.__get__characteristics = function()
{
   var _loc2_ = new Array();
   _loc2_.push(this.api.lang.getText("ITEM_AP",[this.apCost]));
   _loc2_.push(this.api.lang.getText("ITEM_RANGE",[(this.rangeMin == 0 ? "" : this.rangeMin + " " + this.api.lang.getText("TO_RANGE") + " ") + this.rangeMax]));
   _loc2_.push(this.api.lang.getText("ITEM_CRITICAL_BONUS",[this.criticalHitBonus <= 0 ? String(this.criticalHitBonus) : "+" + this.criticalHitBonus]));
   _loc2_.push((this.criticalHit == 0 ? "" : this.api.lang.getText("ITEM_CRITICAL",[this.criticalHit])) + (!(this.criticalHit != 0 && this.criticalFailure != 0) ? "" : " - ") + (this.criticalFailure == 0 ? "" : this.api.lang.getText("ITEM_MISS",[this.criticalFailure])));
   var _loc3_;
   if(this.criticalHit > 0 && this.ID == this.api.datacenter.Player.weaponItem.ID)
   {
      _loc3_ = this.api.kernel.GameManager.getCriticalHitChance(this.criticalHit);
      _loc2_.push(this.api.lang.getText("ITEM_CRITICAL_REAL",["1/" + _loc3_]));
   }
   return _loc2_;
};
_loc1.npc = function(_loc2_, _loc3_)
{
   var target = _loc2_;
   var nYOffset = -20;
   var sText = this.name + " (" + this.api.lang.getText("LEVEL_SMALL") + " " + this.level + ")";
   var _loc5_ = true;
   var _loc4_;
   for(var _loc6_ in this.effects)
   {
      _loc4_ = this.effects[_loc6_];
      if(_loc4_.description.length > 0)
      {
         if(_loc5_)
         {
            sText += "\n";
            nYOffset -= 10;
            _loc5_ = false;
         }
         sText = sText + "\n" + _loc4_.description;
         nYOffset -= 12;
      }
   }
   this.api.ui.showTooltip(sText,target,nYOffset,{bXLimit:true, bYLimit:false});
};
_loc1.__get__conditions = function()
{
   var _loc14_ = [">","<","=","!"];
   var _loc19_ = this._oUnicInfos.c;
   if(_loc19_ == undefined || _loc19_.length == 0)
   {
      return [String(this.api.lang.getText("NO_CONDITIONS"))];
   }
   var _loc18_ = _loc19_.split("&");
   var _loc9_ = new Array();
   var _loc13_ = 0;
   var _loc12_;
   var _loc8_;
   var _loc6_;
   var _loc4_;
   var _loc7_;
   var _loc5_;
   var _loc3_;
   var _loc10_;
   var _loc11_;
   var _loc17_;
   var _loc15_;
   var _loc16_;
   while(_loc13_ < _loc18_.length)
   {
      _loc18_[_loc13_] = new _global.palmad.ank.utils.ExtendedString(_loc18_[_loc13_]).replace(["(",")"],["",""]);
      _loc12_ = _loc18_[_loc13_].split("|");
      _loc8_ = 0;
      while(_loc8_ < _loc12_.length)
      {
         _loc6_ = -1;
         while(_loc6_ < _loc14_.length)
         {
            _loc4_ = _loc14_[_loc6_];
            _loc7_ = _loc12_[_loc8_].split(_loc4_);
            if(_loc7_.length > 1)
            {
               break;
            }
            _loc6_ = _loc6_ + 1;
         }
         if(_loc7_ != undefined)
         {
            _loc5_ = String(_loc7_[0]);
            _loc3_ = _loc7_[1];
            switch(_loc5_)
            {
               case "Ps":
                  _loc3_ = this.api.lang.getAlignment(Number(_loc3_)).n;
                  break;
               case "PS":
                  _loc3_ = _loc3_ != "1" ? this.api.lang.getText("MALE") : this.api.lang.getText("FEMELE");
                  break;
               case "Pr":
                  _loc3_ = this.api.lang.getAlignmentSpecialization(Number(_loc3_)).n;
                  break;
               case "Pg":
                  _loc10_ = _loc3_.split(",");
                  if(_loc10_.length == 2)
                  {
                     _loc3_ = this.api.lang.getAlignmentFeat(Number(_loc10_[0])).n + " (" + Number(_loc10_[1]) + ")";
                  }
                  else
                  {
                     _loc3_ = this.api.lang.getAlignmentFeat(Number(_loc3_)).n;
                  }
                  break;
               case "PG":
                  _loc3_ = this.api.lang.getClassText(Number(_loc3_)).sn;
                  break;
               case "PJ":
               case "Pj":
                  _loc11_ = _loc3_.split(",");
                  _loc3_ = this.api.lang.getJobText(_loc11_[0]).n + (_loc11_[1] != undefined ? " (" + this.api.lang.getText("LEVEL_SMALL") + " " + _loc11_[1] + ")" : "");
                  break;
               case "PO":
                  _loc17_ = new dofus.datacenter["\f\f"](-1,Number(_loc3_),1,0,"",0);
                  _loc3_ = _loc17_.name;
                  break;
               case "PM":
            }
            _loc15_ = _loc5_;
            _loc5_ = new _global.palmad.ank.utils.ExtendedString(_loc5_).replace(["CS","Cs","CV","Cv","CA","Ca","CI","Ci","CW","Cw","CC","Cc","CA","PG","PJ","Pj","PM","PA","PN","PE","<NO>","PS","PR","PL","PK","Pg","Pr","Ps","Pa","PP","PZ","CM","NR","GL","mK","mC"],this.api.lang.getText("ITEM_CHARACTERISTICS").split(","));
            _loc16_ = _loc4_ == "!";
            _loc4_ = new _global.palmad.ank.utils.ExtendedString(_loc4_).replace(["!"],[this.api.lang.getText("ITEM_NO")]);
            switch(_loc15_)
            {
               case "PZ":
                  _loc9_.push((_loc3_ != "0" ? "" : this.api.lang.getText("NO ")) + _loc5_);
                  break;
               case "BI":
                  _loc9_.push(this.api.lang.getText("UNUSABLE"));
                  break;
               case "NR":
                  _loc9_.push((_loc8_ <= 0 ? "" : this.api.lang.getText("ITEM_OR") + " ") + "Reset" + " " + _loc4_ + " " + _loc3_);
                  break;
               case "PO":
                  if(_loc16_)
                  {
                     _loc9_.push(this.api.lang.getText("ITEM_DO_NOT_POSSESS",[_loc3_]) + " <" + _loc4_ + ">");
                     break;
                  }
                  _loc9_.push(this.api.lang.getText("ITEM_DO_POSSESS",[_loc3_]) + " <" + _loc4_ + ">");
            }
            _loc9_.push((_loc8_ <= 0 ? "" : this.api.lang.getText("ITEM_OR") + " ") + _loc5_ + " " + _loc4_ + " " + _loc3_);
         }
         _loc8_ = _loc8_ + 1;
      }
      _loc13_ = _loc13_ + 1;
   }
   return _loc9_;
};
_loc1.__get__mood = function()
{
   return this._nMood;
};
_loc1.__get__skin = function()
{
   return this._nSkin;
};
_loc1.__set__skin = function(nSkin)
{
   this._nSkin = nSkin;
};
_loc1.__get__skineable = function()
{
   return this._bIsSkineable;
};
_loc1.__get__isAssociate = function()
{
   return this.skineable && this.realType != 113;
};
_loc1.__get__realUnicId = function()
{
   if(this._nRealUnicId)
   {
      return this._nRealUnicId;
   }
   return this._nUnicID;
};
_loc1.__get__maxSkin = function()
{
   var _loc2_ = 1;
   while(_loc2_ < dofus.datacenter["\f\f"].LEVEL_STEP.length)
   {
      if(this._nLivingXp < dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_])
      {
         return _loc2_;
      }
      _loc2_ = _loc2_ + 1;
   }
   return dofus.datacenter["\f\f"].LEVEL_STEP.length;
};
_loc1.__get__currentLivingXp = function()
{
   return this._nLivingXp;
};
_loc1.__get__currentLivingLevelXpMax = function()
{
   var _loc2_ = 1;
   while(_loc2_ < dofus.datacenter["\f\f"].LEVEL_STEP.length)
   {
      if(this._nLivingXp < dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_])
      {
         return dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_];
      }
      _loc2_ = _loc2_ + 1;
   }
   return -1;
};
_loc1.__get__currentLivingLevelXpMin = function()
{
   var _loc2_ = 1;
   while(_loc2_ < dofus.datacenter["\f\f"].LEVEL_STEP.length)
   {
      if(this._nLivingXp < dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_])
      {
         return dofus.datacenter["\f\f"].LEVEL_STEP[_loc2_ - 1];
      }
      _loc2_ = _loc2_ + 1;
   }
   return -1;
};
_loc1.__get__isSpeakingItem = function()
{
   return this.isAssociate || this.realType == 113;
};
_loc1.__get__isLeavingItem = function()
{
   return this.isAssociate || this.realType == 113;
};
_loc1.__get__canBeExchange = function()
{
   return this._bCanBeExchange;
};
_loc1.initialize = function(nID, nUnicID, nQuantity, nPosition, sEffects, nPrice, nSkin, nMood)
{
   this.api = _global.API;
   this._nID = nID;
   this._nUnicID = nUnicID;
   this._nQuantity = nQuantity != undefined ? nQuantity : 1;
   this._nPosition = nPosition != undefined ? nPosition : -1;
   if(nPrice != undefined)
   {
      this._nPrice = nPrice;
   }
   this._bCanBeExchange = true;
   this._oUnicInfos = this.api.lang.getItemUnicText(nUnicID);
   this.setEffects(sEffects);
   this._bIsSkineable = false;
   this.updateDataFromEffect();
   var _loc7_ = this.typeText.z;
   var _loc4_ = _loc7_.split("");
   this._aEffectZones = new Array();
   var _loc3_ = -2;
   while(true)
   {
      _loc3_ += 2;
      if(_loc3_ >= _loc4_.length)
      {
         break;
      }
      this._aEffectZones.push({shape:_loc4_[_loc3_],size:ank["\x1e\n\x07"]["\x12\r"].decode64(_loc4_[_loc3_ + 1])});
   }
   this._itemLevel = this.level;
   this._itemType = this.type;
   this._itemPrice = this.price;
   this._itemName = this.name;
   this._itemWeight = this.weight;
   if(nSkin != undefined)
   {
      this._nSkin = nSkin;
   }
   if(nMood != undefined)
   {
      this._nMood = nMood;
   }
};
_loc1.setEffects = function(compressedData)
{
   this._sEffects = compressedData;
   this._aEffects = new Array();
   var _loc5_ = compressedData.split(",");
   var _loc4_ = 0;
   var _loc3_;
   while(_loc4_ < _loc5_.length)
   {
      _loc3_ = _loc5_[_loc4_].split("#");
      _loc3_[0] = _global.parseInt(_loc3_[0],16);
      _loc3_[1] = _loc3_[1] != "0" ? _global.parseInt(_loc3_[1],16) : undefined;
      _loc3_[2] = _loc3_[2] != "0" ? _global.parseInt(_loc3_[2],16) : undefined;
      _loc3_[3] = _loc3_[3] != "0" ? _global.parseInt(_loc3_[3],16) : undefined;
      _loc3_[4] = _loc3_[4];
      this._aEffects.push(_loc3_);
      _loc4_ = _loc4_ + 1;
   }
};
_loc1.clone = function()
{
   return new dofus.datacenter["\f\f"](this._nID,this._nUnicID,this._nQuantity,this._nPosition,this._sEffects);
};
_loc1.equals = function(item)
{
   return this.unicID == item.unicID;
};
_loc1.getItemFightEffectsText = function(nPropertyIndex)
{
   return this._oUnicInfos.e[nPropertyIndex];
};
_loc1.updateDataFromEffect = function()
{
   this._isMimobionte = false;
   this.isRare = false;
   this.isLeg = false;
   this.isDiv = false;
   var _loc3_;
   var _loc0_;
   for(var _loc4_ in this._aEffects)
   {
      _loc3_ = this._aEffects[_loc4_];
      switch(_loc3_[0])
      {
         case 812:
            this._isEthereal = true;
            break;
         case 974:
            this._nLivingXp = !_loc3_[3] ? 0 : _loc3_[3];
            break;
         case 973:
            this._nRealType = !_loc3_[3] ? 0 : _loc3_[3];
            break;
         case 972:
            this._nSkin = !_loc3_[3] ? 0 : _global.parseInt(_loc3_[3]) - 1;
            this._bIsSkineable = true;
            break;
         case 971:
            this._nMood = !_loc3_[3] ? 0 : _loc3_[3];
            break;
         case 970:
            this._sRealGfx = !_global.GFX[this._nUnicID] ? this._oUnicInfos.g : _global.GFX[this._nUnicID];
            this._sGfx = this.api.lang.getItemUnicText(!_loc3_[3] ? 0 : _loc3_[3]).g;
            this._nRealUnicId = _loc3_[3];
            break;
         case 900:
            this._nColorStyle = _loc3_[1];
            break;
         case 1015:
            this.isRare = true;
            break;
         case 1016:
            this.isLeg = true;
            break;
         case 1017:
            this.isDiv = true;
            break;
         case 901:
            this._sRealGfx = _loc0_ = !_loc3_[3] ? 0 : _loc3_[3];
            this._sGfx = _loc0_;
            break;
         case 915:
            this._sGfx = this.api.lang.getItemUnicText(_loc3_[3] ? _loc3_[3] : 0).g;
            this._isMimobionte = true;
            break;
         case 983:
            this._bCanBeExchange = false;
      }
   }
};
_global.dofus.datacenter["\f\f"].getBaseItemEffects = function(nItemId)
{
   var _loc6_ = _global.API.lang.getItemStats(nItemId);
   var _loc4_ = _loc6_.split(",");
   var _loc5_ = new Array();
   var _loc3_ = 0;
   var _loc2_;
   while(_loc3_ < _loc4_.length)
   {
      _loc2_ = _loc4_[_loc3_].split("#");
      _loc2_[0] = _global.parseInt(_loc2_[0],16);
      _loc2_[1] = _loc2_[1] == "0" ? undefined : _global.parseInt(_loc2_[1],16);
      _loc2_[2] = _loc2_[2] == "0" ? undefined : _global.parseInt(_loc2_[2],16);
      _loc2_[3] = _loc2_[3] == "0" ? undefined : _global.parseInt(_loc2_[3],16);
      _loc5_.push(_loc2_);
      _loc3_ += 1;
   }
   return _loc5_;
};
_global.dofus.datacenter["\f\f"].getItemDescriptionEffects = function(aEffects, bVisibleOnly, aBaseEffect)
{
   var _loc12_ = new Array();
   var _loc14_ = aEffects.length;
   var _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc8_ = 0;
   while(_loc8_ < aBaseEffect.length)
   {
      _loc3_.push(aBaseEffect[_loc8_]);
      _loc8_ += 1;
   }
   var _loc9_;
   var _loc7_;
   var _loc11_;
   var _loc4_;
   var _loc10_;
   var _loc2_;
   var _loc6_;
   var _loc5_;
   if(typeof aEffects == "object")
   {
      _loc9_ = 0;
      while(_loc9_ < _loc14_)
      {
         _loc7_ = aEffects[_loc9_];
         _loc11_ = _loc7_[0];
         _loc4_ = new dofus.datacenter["\x0f\r"](undefined,_loc11_,_loc7_[1],_loc7_[2],_loc7_[3],_loc7_[4]);
         _loc10_ = false;
         if(_loc3_ != undefined && _loc3_.length > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               if(_loc3_[_loc2_][0] == _loc11_)
               {
                  _loc6_ = _loc3_[_loc2_][1];
                  _loc5_ = _loc3_[_loc2_][2];
                  _loc10_ = dofus.datacenter["\f\f"].isOver(_loc4_,_loc6_,_global.isNaN(_loc5_) ? _loc6_ : _loc5_);
                  _loc3_.splice(_loc2_,1);
                  break;
               }
               _loc2_ += 1;
            }
         }
         _loc4_.isOver = _loc10_;
         if(_loc4_.description != undefined)
         {
            if(bVisibleOnly == true)
            {
               if(_loc4_.showInTooltip)
               {
                  _loc12_.push(_loc4_);
               }
            }
            else
            {
               _loc12_.push(_loc4_);
            }
         }
         _loc9_ = _loc9_ + 1;
      }
      return _loc12_;
   }
   return null;
};
_loc1._bEstiloOficial = undefined;
_loc1._nColorStyle = Number(0);
_loc1._isEthereal = Boolean(false);
_loc1.isMimobionte = Boolean(false);
_loc1.addProperty("label",_loc1.__get__label,function()
{
}
);
_loc1.addProperty("position",_loc1.__get__position,_loc1.__set__position);
_loc1.addProperty("effectZones",_loc1.__get__effectZones,function()
{
}
);
_loc1.addProperty("conditions",_loc1.__get__conditions,function()
{
}
);
_loc1.addProperty("visibleEffects",_loc1.__get__visibleEffects,function()
{
}
);
_loc1.addProperty("priceMultiplicator",_loc1.__get__priceMultiplicator,_loc1.__set__priceMultiplicator);
_loc1.addProperty("canUse",_loc1.__get__canUse,function()
{
}
);
_loc1.addProperty("criticalHitBonus",_loc1.__get__criticalHitBonus,function()
{
}

);
_loc1.addProperty("level",_loc1.__get__level,function()
{
}
);
_loc1.addProperty("skin",_loc1.__get__skin,_loc1.__set__skin);
_loc1.addProperty("isHidden",_loc1.__get__isHidden,function()
{
}
);
_loc1.addProperty("currentLivingXp",_loc1.__get__currentLivingXp,function()
{
}
);
_loc1.addProperty("criticalFailure",_loc1.__get__criticalFailure,function()
{
}
);
_loc1.addProperty("type",_loc1.__get__type,_loc1.__set__type);
_loc1.addProperty("normalHit",_loc1.__get__normalHit,function()
{
}
);
_loc1.addProperty("compressedEffects",_loc1.__get__compressedEffects,function()
{
}
);
_loc1.addProperty("effects",_loc1.__get__effects,_loc1.__set__effects);
_loc1.addProperty("superTypeText",_loc1.__get__superTypeText,function()
{
}
);
_loc1.addProperty("unicID",_loc1.__get__unicID,function()
{
}
);
_loc1.addProperty("apCost",_loc1.__get__apCost,function()
{
}
);
_loc1.addProperty("etherealResistance",_loc1.__get__etherealResistance,function()
{
}
);
_loc1.addProperty("weight",_loc1.__get__weight,function()
{
}
);
_loc1.addProperty("realUnicId",_loc1.__get__realUnicId,function()
{
}
);
_loc1.addProperty("rangeMax",_loc1.__get__rangeMax,function()
{
}
);
_loc1.addProperty("characteristics",_loc1.__get__characteristics,function()
{
}
);
_loc1.addProperty("isCursed",_loc1.__get__isCursed,function()
{
}
);
_loc1.addProperty("itemSetID",_loc1.__get__itemSetID,function()
{
}
);
_loc1.addProperty("iconFile",_loc1.__get__iconFile,function()
{
}
);
_loc1.addProperty("isLeavingItem",_loc1.__get__isLeavingItem,function()
{
}
);
_loc1.addProperty("Quantity",_loc1.__get__Quantity,_loc1.__set__Quantity);
_loc1.addProperty("criticalHit",_loc1.__get__criticalHit,function()
{
}
);
_loc1.addProperty("style",_loc1.__get__style,function()
{
}
);
_loc1.addProperty("canTarget",_loc1.__get__canTarget,function()
{
}
);
_loc1.addProperty("enhanceable",_loc1.__get__enhanceable,function()
{
}
);
_loc1.addProperty("isEthereal",_loc1.__get__isEthereal,function()
{
}
);
_loc1.addProperty("canBeExchange",_loc1.__get__canBeExchange,function()
{
}
);
_loc1.addProperty("remainingHours",_loc1.__get__remainingHours,_loc1.__set__remainingHours);
_loc1.addProperty("price",_loc1.__get__price,function()
{
}
);
_loc1.addProperty("rangeMin",_loc1.__get__rangeMin,function()
{
}
);
_loc1.addProperty("gfx",_loc1.__get__gfx,_loc1.__set__gfx);
_loc1.addProperty("canDrop",_loc1.__get__canDrop,function()
{
}
);
_loc1.addProperty("needTwoHands",_loc1.__get__needTwoHands,function()
{
}
);
_loc1.addProperty("superType",_loc1.__get__superType,function()
{
}
);
_loc1.addProperty("description",_loc1.__get__description,function()
{
}
);
_loc1.addProperty("currentLivingLevelXpMax",_loc1.__get__currentLivingLevelXpMax,function()
{
}
);
_loc1.addProperty("canMoveToShortut",_loc1.__get__canMoveToShortut,function()
{
}
);
_loc1.addProperty("realType",_loc1.__get__realType,function()
{
}
);
_loc1.addProperty("lineOnly",_loc1.__get__lineOnly,function()
{
}
);
_loc1.addProperty("lineOfSight",_loc1.__get__lineOfSight,function()
{
}
);
_loc1.addProperty("isAssociate",_loc1.__get__isAssociate,function()
{
}
);
_loc1.addProperty("realGfx",_loc1.__get__realGfx,function()
{
}
);
_loc1.addProperty("params",_loc1.__get__params,function()
{
}
);
_loc1.addProperty("ID",_loc1.__get__ID,function()
{
}
);
_loc1.addProperty("maxSkin",_loc1.__get__maxSkin,function()
{
}
);
_loc1.addProperty("canDestroy",_loc1.__get__canDestroy,function()
{
}
);
_loc1.addProperty("skineable",_loc1.__get__skineable,function()
{
}
);
_loc1.addProperty("mood",_loc1.__get__mood,function()
{
}
);
_loc1.addProperty("name",_loc1.__get__name,function()
{
}
);
_loc1.addProperty("isFromItemSet",_loc1.__get__isFromItemSet,function()
{
}
);
_loc1.addProperty("isSpeakingItem",_loc1.__get__isSpeakingItem,function()
{
}
);
_loc1.addProperty("currentLivingLevelXpMin",_loc1.__get__currentLivingLevelXpMin,function()
{
}
);
_loc1.addProperty("typeText",_loc1.__get__typeText,function()
{
}
);
_loc1.addProperty("colorStyle",_loc1.__get__colorStyle,function()
{
}
);
_loc1.addProperty("isMimobionte",_loc1.__get__isMimobionte,function()
{
}
);
_loc1.addProperty("isRemovedFromInventory",_loc1.__get__isRemovedFromInventory,_loc1.__set__isRemovedFromInventory);
_loc1.addProperty("chapa",_loc1.__get__Chapa,_loc1.__set__Chapa);
_loc1.addProperty("itemPago",_loc1.__get__itemPago,_loc1.__set__itemPago);
_loc1.addProperty("coin",_loc1.__get__coinPago,_loc1.__set__coinPago);
_loc1.addProperty("isEquiped",_loc1.__get__isEquiped,function()
{
}
);
_loc1._bRemovedFromInventory = false;
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_loc1._sEffects = "";
_global.dofus.datacenter["\f\f"].FULL_SOUL_STONE_NORMAL = 85;
_global.dofus.datacenter["\f\f"].FULL_SOUL_STONE_BOSS = 124;
_global.dofus.datacenter["\f\f"].FULL_SOUL_STONE_ARCHI = 125;
_global.dofus.datacenter["\f\f"].LEVEL_STEP = [0,10,21,33,46,60,75,91,108,126,145,165,186,208,231,255,280,306,333,361];
_global.dofus.datacenter["\f\f"].DATE_ID = 0;
#endinitclip