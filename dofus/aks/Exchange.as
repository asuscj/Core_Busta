var _loc1 = dofus.aks.Exchange.prototype;
_loc1.transfertItems = function(_loc2_, _loc3_)
{
   this.aks.send("EMA" + _loc2_ + _loc3_,true);
};
_loc1.movementOgrine = function(_loc2_)
{
   this.aks.send("EMS" + _loc2_,true);
};
_loc1.getItemActualPriceInBigStore = function(_loc2_)
{
   this.aks.send(_loc2_);
};
_loc1.repeatCraft = function(nHowManyTimes)
{
   if(Number(nHowManyTimes) == 1)
   {
      this.aks.send("EMR1",false);
   }
   else
   {
      this._nItemsToCraft = nHowManyTimes - 1;
      this.aks.send("EMR" + nHowManyTimes,false);
      this.api.datacenter.Basics.isCraftLooping = true;
   }
};
_loc1.onLocalMovement = function(bSuccess, sExtraData)
{
   this.modifyLocal(sExtraData,this.api.datacenter.Exchange.localGarbage,"localKama","localOgrine");
};
_loc1.modifyLocal = function(sExtraData, ea, sKamaLocation, sOgrineLocation)
{
   var _loc17_ = sExtraData.charAt(0);
   var _loc3_ = this.api.datacenter.Exchange;
   var _loc16_;
   var _loc13_;
   var _loc4_;
   var _loc11_;
   var _loc12_;
   var _loc2_;
   var _loc5_;
   var _loc9_;
   var _loc10_;
   var _loc15_;
   var _loc8_;
   var _loc6_;
   switch(_loc17_)
   {
      case "O":
         _loc16_ = sExtraData.charAt(1) == "+";
         _loc13_ = sExtraData.substr(2).split("|");
         _loc4_ = Number(_loc13_[0]);
         _loc11_ = Number(_loc13_[1]);
         _loc12_ = this.api.datacenter.Player.Inventory.findFirstItem("ID",_loc4_);
         _loc2_ = _loc3_.inventory.findFirstItem("ID",_loc4_);
         _loc5_ = ea.findFirstItem("ID",_loc4_);
         if(_loc16_)
         {
            _loc9_ = _loc2_.item;
            _loc10_ = new dofus.datacenter["\f\f"](_loc4_,_loc9_.unicID,_loc11_,-2,_loc9_.compressedEffects);
            _loc15_ = -1;
            _loc8_ = _loc12_.item.Quantity - _loc11_;
            if(_loc8_ == 0)
            {
               _loc15_ = -3;
            }
            _loc2_.item.Quantity = _loc8_;
            _loc2_.item.position = _loc15_;
            _loc3_.inventory.updateItem(_loc2_.index,_loc2_.item);
            if(_loc5_.index != -1)
            {
               ea.updateItem(_loc5_.index,_loc10_);
            }
            else
            {
               ea.push(_loc10_);
            }
         }
         else if(_loc5_.index != -1)
         {
            _loc2_.item.position = -1;
            _loc2_.item.Quantity = _loc12_.item.Quantity;
            _loc3_.inventory.updateItem(_loc2_.index,_loc2_.item);
            ea.removeItems(_loc5_.index,1);
         }
         break;
      case "G":
         _loc6_ = Number(sExtraData.substr(1));
         _loc3_[sKamaLocation] = _loc6_;
         break;
      case "S":
         _loc6_ = Number(sExtraData.substr(1));
         _loc3_[sOgrineLocation] = _loc6_;
      default:
         return;
   }
};
_loc1.modifyDistant = function(sExtraData, ea, sKamaLocation, bForceModifyInventory, sOgrineLocation)
{
   var _loc16_ = sExtraData.charAt(0);
   var _loc4_ = this.api.datacenter.Exchange;
   var _loc17_;
   var _loc6_;
   var _loc9_;
   var _loc10_;
   var _loc13_;
   var _loc14_;
   var _loc7_;
   var _loc5_;
   var _loc15_;
   var _loc3_;
   var _loc8_;
   switch(_loc16_)
   {
      case "O":
         _loc17_ = sExtraData.charAt(1) == "+";
         _loc6_ = sExtraData.substr(2).split("|");
         _loc9_ = Number(_loc6_[0]);
         _loc10_ = Number(_loc6_[1]);
         _loc13_ = Number(_loc6_[2]);
         _loc14_ = _loc6_[3];
         _loc7_ = ea.findFirstItem("ID",_loc9_);
         if(_loc17_)
         {
            _loc5_ = new dofus.datacenter["\f\f"](_loc9_,_loc13_,_loc10_,-1,_loc14_);
            _loc15_ = bForceModifyInventory == undefined ? _loc4_.distantPlayerID == undefined : bForceModifyInventory;
            if(_loc7_.index != -1)
            {
               ea.updateItem(_loc7_.index,_loc5_);
            }
            else
            {
               ea.push(_loc5_);
            }
            if(_loc15_)
            {
               _loc3_ = _loc4_.inventory.findFirstItem("ID",_loc9_);
               if(_loc3_.index != -1)
               {
                  _loc3_.item.position = -1;
                  if(this.api.datacenter.Basics.aks_exchange_isForgemagus)
                  {
                     _loc3_.item.Quantity = Number(_loc10_);
                     this.api.ui.getUIComponent("Craft").updateDistantData();
                  }
                  else
                  {
                     _loc3_.item.Quantity = Number(_loc3_.item.Quantity) + Number(_loc10_);
                  }
                  _loc4_.inventory.updateItem(_loc3_.index,_loc5_);
               }
               else
               {
                  _loc4_.inventory.push(_loc5_);
                  _global.API.ui.getUIComponent("Craft").updateForgemagusResult(_loc5_);
               }
            }
         }
         else if(_loc7_.index != -1)
         {
            ea.removeItems(_loc7_.index,1);
         }
         break;
      case "G":
         _loc8_ = Number(sExtraData.substr(1));
         _loc4_[sKamaLocation] = _loc8_;
         break;
      case "S":
         _loc8_ = Number(sExtraData.substr(1));
         _loc4_[sOgrineLocation] = _loc8_;
      default:
         return;
   }
};
_loc1.onDistantMovement = function(bSuccess, sExtraData)
{
   var _loc11_;
   var _loc2_;
   var _loc5_;
   var _loc12_;
   var _loc8_;
   var _loc13_;
   var _loc10_;
   var _loc9_;
   var _loc4_;
   var _loc3_;
   var _loc7_;
   var _loc6_;
   switch(this.api.datacenter.Basics.aks_exchange_echangeType)
   {
      case 1:
      case 2:
      case 3:
      case 9:
      case 12:
      case 13:
         this.modifyDistant(sExtraData,this.api.datacenter.Exchange.distantGarbage,"distantKama",undefined,"distantOgrine");
         break;
      case 10:
         _loc11_ = sExtraData.charAt(0) == "+";
         _loc2_ = sExtraData.substr(1).split("|");
         _loc5_ = Number(_loc2_[0]);
         _loc12_ = Number(_loc2_[1]);
         _loc8_ = Number(_loc2_[2]);
         _loc13_ = _loc2_[3];
         _loc10_ = Number(_loc2_[4]);
         _loc9_ = Number(_loc2_[5]);
         _loc4_ = this.api.datacenter.Temporary.Shop;
         _loc3_ = _loc4_.inventory.findFirstItem("ID",_loc5_);
         if(_loc11_)
         {
            _loc7_ = new dofus.datacenter["\f\f"](_loc5_,_loc8_,_loc12_,-1,_loc13_,_loc10_);
            _loc7_.remainingHours = _loc9_;
            if(_loc3_.index != -1)
            {
               _loc4_.inventory.updateItem(_loc3_.index,_loc7_);
            }
            else
            {
               _loc4_.inventory.push(_loc7_);
            }
         }
         else if(_loc3_.index != -1)
         {
            _loc4_.inventory.removeItems(_loc3_.index,1);
         }
         else
         {
            ank.utils.Logger.err("[onDistantMovement] cet objet n\'existe pas id=" + _loc5_);
         }
         _loc6_ = this.api.ui.getUIComponent("BigStoreSell");
         if(_loc6_ != undefined)
         {
            _loc6_.updateItemCount();
            _loc6_.refreshRemoveButton();
         }
      default:
         return;
   }
};
_loc1.onBigStoreItemsList = function(_loc2_)
{
   var _loc10_ = _loc2_.split("|");
   var _loc17_ = Number(_loc10_[0]);
   _loc10_.shift();
   var _loc16_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_;
   var _loc4_;
   var _loc5_;
   var _loc9_;
   var _loc7_;
   var _loc6_;
   var _loc8_;
   var _loc3_;
   for(var _loc18_ in _loc10_)
   {
      _loc2_ = _loc10_[_loc18_].split(";");
      _loc4_ = Number(_loc2_[0]);
      _loc5_ = _loc2_[1];
      _loc9_ = Number(_loc2_[2]);
      _loc7_ = Number(_loc2_[3]);
      _loc6_ = Number(_loc2_[4]);
      _loc8_ = new dofus.datacenter["\f\f"](_loc4_,_loc17_,0,-1,_loc5_,0);
      _loc3_ = {id:_loc4_,item:_loc8_,priceSet1:_loc9_,priceSet2:_loc7_,priceSet3:_loc6_};
      if(this.api.ui.getUIComponent("BigStoreSell") != null)
      {
         this.api.ui.getUIComponent("BigStoreSell").setItemStats(_loc3_);
         return undefined;
      }
      _loc16_.push(_loc3_);
   }
   this.api.datacenter.Temporary.Shop.inventory2 = _loc16_;
   this.api.ui.getUIComponent("BigStoreBuy").setItem(_loc17_);
};
_loc1.onList = function(sExtraData)
{
   var _loc29_;
   var _loc32_;
   var _loc2_;
   var _loc21_;
   var _loc25_;
   var _loc8_;
   var _loc4_;
   var _loc11_;
   var _loc5_;
   var _loc9_;
   var _loc7_;
   var _loc10_;
   var _loc28_;
   var _loc31_;
   var _loc6_;
   var _loc23_;
   var _loc13_;
   var _loc15_;
   var _loc26_;
   var _loc17_;
   var _loc19_;
   var _loc27_;
   var _loc30_;
   var _loc3_;
   var _loc16_;
   var _loc14_;
   var _loc18_;
   var _loc24_;
   var _loc22_;
   var _loc20_;
   var _loc12_;
   var _loc0_;
   switch(this.api.datacenter.Basics.aks_exchange_echangeType)
   {
      case 0:
      case 20:
         _loc29_ = sExtraData.split("|");
         _loc32_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(var _loc34_ in _loc29_)
         {
            _loc2_ = _loc29_[_loc34_].split(";");
            _loc21_ = Number(_loc2_[0]);
            _loc25_ = _loc2_[1];
            _loc8_ = _loc2_[2];
            _loc4_ = new dofus.datacenter["\f\f"](0,_loc21_,undefined,undefined,_loc25_,_loc8_);
            _loc4_.priceMultiplicator = this.api.lang.getConfigText("BUY_PRICE_MULTIPLICATOR");
            _loc4_.itemPago = _loc2_[3] != undefined ? Number(_loc2_[3]) : 0;
            _loc4_.chapa = _loc2_[4] != undefined ? Number(_loc2_[4]) : 0;
            _loc32_.push(_loc4_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc32_;
         break;
      case 5:
      case 15:
      case 8:
         _loc11_ = sExtraData.split(";");
         _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc11_)
         {
            _loc5_ = _loc11_[_loc34_];
            _loc9_ = _loc5_.charAt(0);
            _loc7_ = _loc5_.substr(1);
            switch(_loc9_)
            {
               case "O":
                  _loc10_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc7_);
                  _loc8_.push(_loc10_);
                  break;
               case "G":
                  this.onStorageKama(_loc7_);
            }
         }
         this.api.datacenter.Temporary.Storage.inventory = _loc8_;
         if(dofus["\x12\x03"].SAVING_THE_WORLD)
         {
            dofus["\x1e\x14\x10"].getInstance().newItems(sExtraData);
            dofus["\x1e\x14\x10"].getInstance().nextAction();
         }
         break;
      case 4:
      case 6:
         _loc28_ = sExtraData.split("|");
         _loc31_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc28_)
         {
            _loc6_ = _loc28_[_loc34_].split(";");
            _loc23_ = Number(_loc6_[0]);
            _loc13_ = Number(_loc6_[1]);
            _loc15_ = Number(_loc6_[2]);
            _loc26_ = _loc6_[3];
            _loc17_ = Number(_loc6_[4]);
            _loc19_ = new dofus.datacenter["\f\f"](_loc23_,_loc15_,_loc13_,-1,_loc26_,_loc17_);
            _loc4_.itemPago = _loc2_[5] != undefined ? Number(_loc2_[5]) : 0;
            _loc31_.push(_loc19_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc31_;
         break;
      case 10:
         _loc27_ = sExtraData.split("|");
         _loc30_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         if(sExtraData.length != 0)
         {
            for(_loc34_ in _loc27_)
            {
               _loc3_ = _loc27_[_loc34_].split(";");
               _loc16_ = Number(_loc3_[0]);
               _loc14_ = Number(_loc3_[1]);
               _loc18_ = Number(_loc3_[2]);
               _loc24_ = _loc3_[3];
               _loc22_ = Number(_loc3_[4]);
               _loc20_ = Number(_loc3_[5]);
               _loc12_ = new dofus.datacenter["\f\f"](_loc16_,_loc18_,_loc14_,-1,_loc24_,_loc22_);
               _loc4_.itemPago = _loc2_[6] != undefined ? Number(_loc2_[6]) : 0;
               _loc12_.remainingHours = _loc20_;
               _loc30_.push(_loc12_);
            }
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc30_;
         break;
      case 30:
         _loc11_ = sExtraData.split(";");
         _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc11_)
         {
            _loc5_ = _loc11_[_loc34_];
            _loc9_ = _loc5_.charAt(0);
            _loc7_ = _loc5_.substr(1);
            if((_loc0_ = _loc9_) === "O")
            {
               _loc10_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc7_);
               _loc8_.push(_loc10_);
            }
         }
         this.api.datacenter.Player.Bank = _loc8_;
      default:
         return;
   }
};
_loc1.transfertToExchange = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO+" + _loc2_);
   a += 1;
};
_loc1.transfertToNoExchange = function()
{
   if(a >= size)
   {
      active = false;
      list = "";
      size = 0;
      a = 0;
      clearInterval(interval);
      return undefined;
   }
   var _loc2_ = list[a];
   this.api.network.send("EMO-" + _loc2_);
   a += 1;
};
_loc1.onCreate = function(_loc2_, _loc3_)
{
   if(!_loc2_)
   {
      return undefined;
   }
   this._lastMovedItemId = -1;
   var _loc6_ = _loc3_.split("|");
   var _loc19_ = Number(_loc6_[0]);
   var _loc15_ = _loc6_[1];
   this.api.datacenter.Basics.aks_exchange_echangeType = _loc19_;
   var _loc3_ = this.api.datacenter.Temporary;
   var _loc29_;
   if(this.api.datacenter.Player.ID != this.api.datacenter.PlayerReal.ID)
   {
      _loc29_ = this.api.datacenter.Player.ID;
   }
   var _loc14_;
   var _loc21_;
   var _loc24_;
   var _loc20_;
   var _loc25_;
   var _loc22_;
   var _loc23_;
   var _loc26_;
   var _loc27_;
   var _loc18_;
   var _loc11_;
   var _loc7_;
   var _loc8_;
   var _loc16_;
   var _loc17_;
   var _loc9_;
   var _loc10_;
   var _loc5_;
   var _loc4_;
   switch(_loc19_)
   {
      case 0:
      case 4:
         _loc3_.Shop = new dofus.datacenter.Shop();
         _loc14_ = this.api.datacenter.Sprites.getItemAt(_loc15_);
         _loc3_.Shop.id = _loc14_.id;
         _loc3_.Shop.name = _loc14_.name;
         _loc3_.Shop.gfx = _loc14_.gfxID;
         _loc21_ = new Array();
         _loc21_[1] = _loc14_.color1 == undefined ? -1 : _loc14_.color1;
         _loc21_[2] = _loc14_.color2 == undefined ? -1 : _loc14_.color2;
         _loc21_[3] = _loc14_.color3 == undefined ? -1 : _loc14_.color3;
         if(_loc19_ == 0)
         {
            this.api.ui.loadUIComponent("NpcShop","NpcShop",{data:_loc3_.Shop,colors:_loc21_});
         }
         else if(_loc19_ == 4)
         {
            this.api.ui.loadUIComponent("PlayerShop","PlayerShop",{data:_loc3_.Shop,colors:_loc21_});
         }
         break;
      case 1:
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
         this.api.ui.unloadUIComponent("AskCancelExchange");
         this.api.ui.loadUIComponent("Exchange","Exchange");
         break;
      case 2:
      case 9:
      case 17:
      case 18:
      case 3:
         if(_loc19_ == 3)
         {
            this.api.datacenter.Exchange = new dofus.datacenter.Exchange();
         }
         else
         {
            this.api.datacenter.Exchange = new dofus.datacenter.Exchange(Number(_loc15_));
         }
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         if(_loc19_ == 3)
         {
            _loc6_ = _loc15_.split(";");
            _loc24_ = Number(_loc6_[0]);
            _loc20_ = Number(_loc6_[1]);
            if(_global.API.lang.getSkillForgemagus(_loc20_) > 0)
            {
               this.api.ui.loadUIComponent("ForgemagusCraft","Craft",{skillId:_loc20_,maxItem:_loc24_});
            }
            else if(_loc20_ == 181)
            {
               this.api.ui.loadUIComponent("craft","Craft",{skillId:_loc20_,maxItem:this.api.lang.getConfigText("LIMIT_DECRAFT")});
            }
            else
            {
               this.api.ui.loadUIComponent("Craft","Craft",{skillId:_loc20_,maxItem:_loc24_});
            }
         }
         else
         {
            this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
            this.api.ui.unloadUIComponent("AskCancelExchange");
            this.api.ui.loadUIComponent("Exchange","Exchange");
         }
         break;
      case 5:
         _loc3_.Storage = new dofus.datacenter.Storage();
         this.api.ui.loadUIComponent("Storage","Storage",{data:_loc3_.Storage,heroID:_loc29_});
         break;
      case 8:
         _loc3_.Storage = new dofus.datacenter.TaxCollectorStorage();
         _loc25_ = this.api.datacenter.Sprites.getItemAt(_loc15_);
         _loc3_.Storage.name = _loc25_.name;
         _loc3_.Storage.gfx = _loc25_.gfxID;
         this.api.ui.loadUIComponent("TaxCollectorStorage","TaxCollectorStorage",{data:_loc3_.Storage});
         break;
      case 6:
         _loc3_.Shop = new dofus.datacenter.Shop();
         this.api.ui.loadUIComponent("PlayerShopModifier","PlayerShopModifier",{data:_loc3_.Shop});
         break;
      case 10:
         _loc3_.Shop = new dofus.datacenter["\x19\x01"]();
         _loc6_ = _loc15_.split(";");
         _loc22_ = _loc6_[0].split(",");
         _loc3_.Shop.quantity1 = Number(_loc22_[0]);
         _loc3_.Shop.quantity2 = Number(_loc22_[1]);
         _loc3_.Shop.quantity3 = Number(_loc22_[2]);
         _loc3_.Shop.types = _loc6_[1].split(",");
         _loc3_.Shop.tax = Number(_loc6_[2]);
         _loc3_.Shop.maxLevel = Number(_loc6_[3]);
         _loc3_.Shop.maxItemCount = Number(_loc6_[4]);
         _loc3_.Shop.npcID = Number(_loc6_[5]);
         _loc3_.Shop.maxSellTime = Number(_loc6_[6]);
         this.api.ui.loadUIComponent("BigStoreSell","BigStoreSell",{data:_loc3_.Shop});
         break;
      case 11:
         _loc3_.Shop = new dofus.datacenter["\x19\x01"]();
         _loc6_ = _loc15_.split(";");
         _loc23_ = _loc6_[0].split(",");
         _loc3_.Shop.quantity1 = Number(_loc23_[0]);
         _loc3_.Shop.quantity2 = Number(_loc23_[1]);
         _loc3_.Shop.quantity3 = Number(_loc23_[2]);
         _loc3_.Shop.types = _loc6_[1].split(",");
         _loc3_.Shop.tax = Number(_loc6_[2]);
         _loc3_.Shop.maxLevel = Number(_loc6_[3]);
         _loc3_.Shop.maxItemCount = Number(_loc6_[4]);
         _loc3_.Shop.npcID = Number(_loc6_[5]);
         _loc3_.Shop.maxSellTime = Number(_loc6_[6]);
         this.api.ui.loadUIComponent("BigStoreBuy","BigStoreBuy",{data:_loc3_.Shop});
         break;
      case 12:
      case 13:
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         _loc6_ = _loc15_.split(";");
         _loc26_ = Number(_loc6_[0]);
         _loc27_ = Number(_loc6_[1]);
         this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
         this.api.ui.unloadUIComponent("AskCancelExchange");
         this.api.ui.loadUIComponent("SecureCraft","SecureCraft",{skillId:_loc27_,maxItem:_loc26_});
         break;
      case 14:
         _loc18_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc11_ = _loc15_.split(";");
         _loc7_ = 0;
         while(_loc7_ < _loc11_.length)
         {
            _loc8_ = Number(_loc11_[_loc7_]);
            _loc18_.push({label:this.api.lang.getJobText(_loc8_).n,id:_loc8_});
            _loc7_ += 1;
         }
         this.api.ui.loadUIComponent("CrafterList","CrafterList",{crafters:new ank["\x1e\n\x07"]["\x0f\x01"](),jobs:_loc18_});
         break;
      case 15:
         this.api.ui.unloadUIComponent("Mount");
         _loc3_.Storage = new dofus.datacenter.Storage();
         this.api.ui.loadUIComponent("Storage","Storage",{isMount:true,data:_loc3_.Storage,heroID:_loc29_});
         break;
      case 16:
         _loc16_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc17_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc6_ = _loc15_.split("~");
         _loc9_ = _loc6_[0].split(";");
         _loc10_ = _loc6_[1].split(";");
         if(_loc9_ != undefined)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc9_.length)
            {
               if(_loc9_[_loc5_] != "")
               {
                  _loc16_.push(this.api.network.Mount.createMount(_loc9_[_loc5_]));
               }
               _loc5_ += 1;
            }
         }
         if(_loc10_ != undefined)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc10_.length)
            {
               if(_loc10_[_loc4_] != "")
               {
                  _loc17_.push(this.api.network.Mount.createMount(_loc10_[_loc4_]));
               }
               _loc4_ += 1;
            }
         }
         this.api.ui.loadUIComponent("MountStorage","MountStorage",{mounts:_loc16_,parkMounts:_loc17_});
      default:
         return;
   }
};
