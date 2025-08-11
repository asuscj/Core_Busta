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
_loc1.onReady = function(sExtraData)
{
   var _loc2_ = sExtraData.charAt(0) == "1";
   var _loc3_ = Number(sExtraData.substr(1));
   var _loc4_ = _loc3_ != this.api.datacenter.Player.ID ? 1 : 0;
   this.api.datacenter.Exchange.readyStates.updateItem(_loc4_,_loc2_);
};
_loc1.onCraft = function(bSuccess, sExtraData)
{
   if(this.api.datacenter.Basics.aks_exchange_isForgemagus || !this.api.datacenter.Basics.isCraftLooping)
   {
      this.api.datacenter.Exchange.clearLocalGarbage();
   }
   if(!this.api.datacenter.Basics.aks_exchange_isForgemagus)
   {
   }
   var _loc6_ = this.api.datacenter.Basics.aks_exchange_echangeType;
   var _loc3_;
   if(_loc6_ == 12 || _loc6_ == 13)
   {
      _loc3_ = this.api.datacenter.Exchange;
      _loc3_.clearDistantGarbage();
      _loc3_.clearPayGarbage();
      _loc3_.clearPayIfSuccessGarbage();
      _loc3_.payKama = 0;
      _loc3_.payIfSuccessKama = 0;
      this.api.ui.getUIComponent("SecureCraft").updateInventory();
   }
   var _loc8_ = !this.api.datacenter.Basics.aks_exchange_isForgemagus;
   var _loc2_;
   var _loc9_;
   var _loc10_;
   var _loc7_;
   var _loc11_;
   var _loc12_;
   var _loc4_;
   loop0:
   switch(sExtraData.substr(0,1))
   {
      case "I":
         if(!bSuccess)
         {
            this.api.kernel.showMessage(this.api.lang.getText("CRAFT"),this.api.lang.getText("NO_CRAFT_RESULT"),"ERROR_BOX",{name:"Impossible"});
         }
         break;
      case "F":
         if(!bSuccess && _loc8_)
         {
            this.api.kernel.showMessage(this.api.lang.getText("CRAFT"),this.api.lang.getText("CRAFT_FAILED"),"ERROR_BOX",{name:"CraftFailed"});
         }
         this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CRAFT_KO);
         break;
      case ";":
         if(bSuccess)
         {
            _loc2_ = sExtraData.substr(1).split(";");
            if(_loc2_.length == 1)
            {
               _loc9_ = new dofus.datacenter["\f\f"](0,Number(_loc2_[0]),undefined,undefined,undefined);
               this.api.kernel.showMessage(undefined,this.api.lang.getText("CRAFT_SUCCESS_SELF",[_loc9_.name]),"INFO_CHAT");
               this.api.kernel.SpeakingItemsManager.triggerEvent(dofus["\x0b\b"].SpeakingItemsManager.SPEAK_TRIGGER_CRAFT_KO);
               break;
            }
            _loc10_ = _loc2_[1].substr(0,1);
            _loc7_ = _loc2_[1].substr(1);
            _loc11_ = Number(_loc2_[0]) + ";0";
            _loc12_ = _loc2_[2];
            _loc4_ = new Array();
            _loc4_.push(_loc11_);
            _loc4_.push(_loc12_);
            switch(_loc10_)
            {
               case "T":
                  this.api.kernel.showMessage(undefined,this.api.kernel.ChatManager.parseInlineItems(this.api.lang.getText("CRAFT_SUCCESS_TARGET",[_loc7_]),_loc4_),"INFO_CHAT");
                  break loop0;
               case "B":
                  this.api.kernel.showMessage(undefined,this.api.kernel.ChatManager.parseInlineItems(this.api.lang.getText("CRAFT_SUCCESS_OTHER",[_loc7_]),_loc4_),"INFO_CHAT");
            }
         }
   }
   if(!bSuccess)
   {
      this.api.datacenter.Exchange.clearCoopGarbage();
   }
};
_loc1.onCraftLoopEnd = function(sExtraData)
{
   var _loc3_ = Number(sExtraData);
   this.api.datacenter.Basics.isCraftLooping = false;
   var _loc2_;
   switch(_loc3_)
   {
      case 1:
         _loc2_ = this.api.lang.getText("CRAFT_LOOP_END_OK");
         break;
      case 2:
         _loc2_ = this.api.lang.getText("CRAFT_LOOP_END_INTERRUPT");
         break;
      case 3:
         _loc2_ = this.api.lang.getText("CRAFT_LOOP_END_FAIL");
         break;
      case 4:
         _loc2_ = this.api.lang.getText("CRAFT_LOOP_END_INVALID");
   }
   this.api.kernel.showMessage(undefined,_loc2_,"INFO_CHAT");
   this.api.kernel.showMessage(this.api.lang.getText("CRAFT"),_loc2_,"ERROR_BOX");
   this.api.ui.getUIComponent("Craft").onCraftLoopEnd();
   if(!this.api.datacenter.Basics.aks_exchange_isForgemagus)
   {
      this.api.datacenter.Exchange.clearLocalGarbage();
   }
};
_loc1.onBuy = function(_loc3_)
{
   this.api.kernel.showMessage(undefined,this.api.lang.getText("BUY_DONE"),"INFO_CHAT");
   if(this.api.ui.getUIComponent("NpcShop") != undefined)
   {
      this.api.ui.getUIComponent("NpcShop").updateItemData(_loc3_);
   }
};
_loc1.onList = function(sExtraData)
{
   var _loc4_;
   var _loc32_;
   var _loc2_;
   var _loc19_;
   var _loc22_;
   var _loc9_;
   var _loc3_;
   var _loc12_;
   var _loc6_;
   var _loc11_;
   var _loc8_;
   var _loc10_;
   var _loc29_;
   var _loc31_;
   var _loc7_;
   var _loc27_;
   var _loc16_;
   var _loc23_;
   var _loc25_;
   var _loc17_;
   var _loc21_;
   var _loc28_;
   var _loc30_;
   var _loc5_;
   var _loc26_;
   var _loc14_;
   var _loc18_;
   var _loc24_;
   var _loc15_;
   var _loc20_;
   var _loc13_;
   var _loc0_;
   switch(this.api.datacenter.Basics.aks_exchange_echangeType)
   {
      case 0:
      case 20:
         _loc4_ = sExtraData.split("|");
         _loc32_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(var _loc34_ in _loc4_)
         {
            _loc2_ = _loc4_[_loc34_].split("@")[0].split(";");
            _loc19_ = Number(_loc2_[0]);
            _loc22_ = _loc2_[1];
            _loc9_ = _loc2_[2];
            _loc3_ = new dofus.datacenter["\f\f"](0,_loc19_,undefined,undefined,_loc22_,_loc9_);
            _loc3_.priceMultiplicator = this.api.lang.getConfigText("BUY_PRICE_MULTIPLICATOR");
            _loc3_.itemPago = _loc2_[3] != undefined ? Number(_loc2_[3]) : 0;
            _loc3_.cantidadCompra = !(_loc4_[_loc34_].split("@")[1] != undefined && _loc4_[_loc34_].split("@")[1] != -1) ? "" : _loc4_[_loc34_].split("@")[1];
            _loc3_.llevaCompra = !(_loc4_[_loc34_].split("@")[2] != undefined && _loc4_[_loc34_].split("@")[2] != -1) ? 0 : _loc4_[_loc34_].split("@")[2];
            _loc32_.push(_loc3_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc32_;
         break;
      case 5:
      case 15:
      case 8:
         _loc12_ = sExtraData.split(";");
         _loc9_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc12_)
         {
            _loc6_ = _loc12_[_loc34_];
            _loc11_ = _loc6_.charAt(0);
            _loc8_ = _loc6_.substr(1);
            switch(_loc11_)
            {
               case "O":
                  _loc10_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc8_);
                  _loc9_.push(_loc10_);
                  break;
               case "G":
                  this.onStorageKama(_loc8_);
            }
         }
         this.api.datacenter.Temporary.Storage.inventory = _loc9_;
         if(dofus.Constants.SAVING_THE_WORLD)
         {
            dofus["\x1e\x14\x0f"].getInstance().newItems(sExtraData);
            dofus["\x1e\x14\x0f"].getInstance().nextAction();
         }
         break;
      case 4:
      case 6:
         _loc29_ = sExtraData.split("|");
         _loc31_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc29_)
         {
            _loc7_ = _loc29_[_loc34_].split(";");
            _loc27_ = Number(_loc7_[0]);
            _loc16_ = Number(_loc7_[1]);
            _loc23_ = Number(_loc7_[2]);
            _loc25_ = _loc7_[3];
            _loc17_ = Number(_loc7_[4]);
            _loc21_ = new dofus.datacenter["\f\f"](_loc27_,_loc23_,_loc16_,-1,_loc25_,_loc17_);
            _loc3_.itemPago = _loc2_[5] != undefined ? Number(_loc2_[5]) : 0;
            _loc31_.push(_loc21_);
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc31_;
         break;
      case 10:
         _loc28_ = sExtraData.split("|");
         _loc30_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         if(sExtraData.length != 0)
         {
            for(_loc34_ in _loc28_)
            {
               _loc5_ = _loc28_[_loc34_].split(";");
               _loc26_ = Number(_loc5_[0]);
               _loc14_ = Number(_loc5_[1]);
               _loc18_ = Number(_loc5_[2]);
               _loc24_ = _loc5_[3];
               _loc15_ = Number(_loc5_[4]);
               _loc20_ = Number(_loc5_[5]);
               _loc13_ = new dofus.datacenter["\f\f"](_loc26_,_loc18_,_loc14_,-1,_loc24_,_loc15_);
               _loc3_.itemPago = _loc2_[6] != undefined ? Number(_loc2_[6]) : 0;
               _loc13_.remainingHours = _loc20_;
               _loc30_.push(_loc13_);
            }
         }
         this.api.datacenter.Temporary.Shop.inventory = _loc30_;
         break;
      case 30:
         _loc12_ = sExtraData.split(";");
         _loc9_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         for(_loc34_ in _loc12_)
         {
            _loc6_ = _loc12_[_loc34_];
            _loc11_ = _loc6_.charAt(0);
            _loc8_ = _loc6_.substr(1);
            if((_loc0_ = _loc11_) === "O")
            {
               _loc10_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc8_);
               _loc9_.push(_loc10_);
            }
         }
         this.api.datacenter.Player.Bank = _loc9_;
   }
};
_loc1.onList2 = function(sExtraData)
{
   var _loc6_ = sExtraData.split(";");
   var _loc7_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc2_;
   var _loc3_;
   var _loc4_;
   var _loc0_;
   var _loc5_;
   for(var _loc8_ in _loc6_)
   {
      _loc2_ = _loc6_[_loc8_];
      _loc3_ = _loc2_.charAt(0);
      _loc4_ = _loc2_.substr(1);
      if((_loc0_ = _loc3_) === "O")
      {
         _loc5_ = this.api.kernel.CharactersManager.getItemObjectFromData(_loc4_);
         _loc7_.push(_loc5_);
      }
   }
   this.api.datacenter.Player.Bank = _loc7_;
};
_loc1.onCreate = function(bSuccess, sExtraData, Taxs, MinOG)
{
   if(!bSuccess)
   {
      return undefined;
   }
   var _loc7_ = sExtraData.split("|");
   var _loc16_ = Number(_loc7_[0]);
   var _loc12_ = _loc7_[1];
   var _loc26_ = Taxs;
   var _loc27_ = MinOG;
   this.api.datacenter.Basics.aks_exchange_echangeType = _loc16_;
   var _loc5_ = this.api.datacenter.Temporary;
   var _loc15_;
   var _loc20_;
   var _loc25_;
   var _loc23_;
   var _loc24_;
   var _loc22_;
   var _loc21_;
   var _loc29_;
   var _loc28_;
   var _loc17_;
   var _loc11_;
   var _loc6_;
   var _loc8_;
   var _loc19_;
   var _loc18_;
   var _loc9_;
   var _loc10_;
   var _loc3_;
   var _loc4_;
   switch(_loc16_)
   {
      case 0:
      case 4:
      case 20:
         _loc5_.Shop = new dofus.datacenter.Shop();
         _loc15_ = this.api.datacenter.Sprites.getItemAt(_loc12_);
         if(_loc16_ == 20)
         {
            _loc5_.Shop.name = "Boutique";
            _loc5_.Shop.gfx = _loc12_;
         }
         else
         {
            _loc5_.Shop.name = _loc15_.name;
            _loc5_.Shop.gfx = _loc15_.gfxID;
         }
         _loc20_ = new Array();
         _loc20_[1] = _loc15_.color1 == undefined ? -1 : _loc15_.color1;
         _loc20_[2] = _loc15_.color2 == undefined ? -1 : _loc15_.color2;
         _loc20_[3] = _loc15_.color3 == undefined ? -1 : _loc15_.color3;
         if(_loc16_ == 0 || _loc16_ == 20)
         {
            this.api.ui.loadUIComponent("NpcShop","NpcShop",{data:_loc5_.Shop,colors:_loc20_});
         }
         else if(_loc16_ == 4)
         {
            this.api.ui.loadUIComponent("PlayerShop","PlayerShop",{data:_loc5_.Shop,colors:_loc20_});
         }
         break;
      case 1:
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
         this.api.ui.unloadUIComponent("AskCancelExchange");
         this.api.ui.loadUIComponent("Exchange","Exchange",{tax:_loc26_,min:_loc27_});
         break;
      case 2:
      case 9:
      case 17:
      case 18:
      case 3:
         if(_loc16_ == 3)
         {
            this.api.datacenter.Exchange = new dofus.datacenter.Exchange();
         }
         else
         {
            this.api.datacenter.Exchange = new dofus.datacenter.Exchange(Number(_loc12_));
         }
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         if(_loc16_ == 3)
         {
            _loc7_ = _loc12_.split(";");
            _loc25_ = Number(_loc7_[0]);
            _loc23_ = Number(_loc7_[1]);
            if(_global.API.lang.getSkillForgemagus(_loc23_) > 0)
            {
               this.api.ui.loadUIComponent("ForgemagusCraft","Craft",{skillId:_loc23_,maxItem:_loc25_});
            }
            else
            {
               this.api.ui.loadUIComponent("Craft","Craft",{skillId:_loc23_,maxItem:_loc25_});
            }
         }
         else
         {
            this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
            this.api.ui.unloadUIComponent("AskCancelExchange");
            this.api.ui.loadUIComponent("Exchange","Exchange",{tax:_loc26_,min:_loc27_});
         }
         break;
      case 5:
         _loc5_.Storage = new dofus.datacenter.Storage();
         this.api.ui.loadUIComponent("Storage","Storage",{data:_loc5_.Storage});
         break;
      case 8:
         _loc5_.Storage = new dofus.datacenter.TaxCollectorStorage();
         _loc24_ = this.api.datacenter.Sprites.getItemAt(_loc12_);
         _loc5_.Storage.name = _loc24_.name;
         _loc5_.Storage.gfx = _loc24_.gfxID;
         this.api.ui.loadUIComponent("TaxCollectorStorage","TaxCollectorStorage",{data:_loc5_.Storage});
         break;
      case 6:
         _loc5_.Shop = new dofus.datacenter.Shop();
         this.api.ui.loadUIComponent("PlayerShopModifier","PlayerShopModifier",{data:_loc5_.Shop});
         break;
      case 10:
         _loc5_.Shop = new dofus.datacenter["\x19\x01"]();
         _loc7_ = _loc12_.split(";");
         _loc22_ = _loc7_[0].split(",");
         _loc5_.Shop.quantity1 = Number(_loc22_[0]);
         _loc5_.Shop.quantity2 = Number(_loc22_[1]);
         _loc5_.Shop.quantity3 = Number(_loc22_[2]);
         _loc5_.Shop.types = _loc7_[1].split(",");
         _loc5_.Shop.tax = Number(_loc7_[2]);
         _loc5_.Shop.maxLevel = Number(_loc7_[3]);
         _loc5_.Shop.maxItemCount = Number(_loc7_[4]);
         _loc5_.Shop.npcID = Number(_loc7_[5]);
         _loc5_.Shop.maxSellTime = Number(_loc7_[6]);
         this.api.ui.loadUIComponent("BigStoreSell","BigStoreSell",{data:_loc5_.Shop});
         break;
      case 11:
         _loc5_.Shop = new dofus.datacenter["\x19\x01"]();
         _loc7_ = _loc12_.split(";");
         _loc21_ = _loc7_[0].split(",");
         _loc5_.Shop.quantity1 = Number(_loc21_[0]);
         _loc5_.Shop.quantity2 = Number(_loc21_[1]);
         _loc5_.Shop.quantity3 = Number(_loc21_[2]);
         _loc5_.Shop.types = _loc7_[1].split(",");
         _loc5_.Shop.tax = Number(_loc7_[2]);
         _loc5_.Shop.maxLevel = Number(_loc7_[3]);
         _loc5_.Shop.maxItemCount = Number(_loc7_[4]);
         _loc5_.Shop.npcID = Number(_loc7_[5]);
         _loc5_.Shop.maxSellTime = Number(_loc7_[6]);
         this.api.ui.loadUIComponent("BigStoreBuy","BigStoreBuy",{data:_loc5_.Shop});
         break;
      case 12:
      case 13:
         this.api.datacenter.Exchange.inventory = this.api.datacenter.Player.Inventory.clone();
         _loc7_ = _loc12_.split(";");
         _loc29_ = Number(_loc7_[0]);
         _loc28_ = Number(_loc7_[1]);
         this.api.ui.unloadUIComponent("AskYesNoIgnoreExchange");
         this.api.ui.unloadUIComponent("AskCancelExchange");
         this.api.ui.loadUIComponent("SecureCraft","SecureCraft",{skillId:_loc28_,maxItem:_loc29_});
         break;
      case 14:
         _loc17_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc11_ = _loc12_.split(";");
         _loc6_ = 0;
         while(_loc6_ < _loc11_.length)
         {
            _loc8_ = Number(_loc11_[_loc6_]);
            _loc17_.push({label:this.api.lang.getJobText(_loc8_).n,id:_loc8_});
            _loc6_ += 1;
         }
         this.api.ui.loadUIComponent("CrafterList","CrafterList",{crafters:new ank["\x1e\n\x07"]["\x0f\x01"](),jobs:_loc17_});
         break;
      case 15:
         this.api.ui.unloadUIComponent("Mount");
         _loc5_.Storage = new dofus.datacenter.Storage();
         this.api.ui.loadUIComponent("Storage","Storage",{isMount:true,data:_loc5_.Storage});
         break;
      case 16:
         _loc19_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc18_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
         _loc7_ = _loc12_.split("~");
         _loc9_ = _loc7_[0].split(";");
         _loc10_ = _loc7_[1].split(";");
         if(_loc9_ != undefined)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc9_.length)
            {
               if(_loc9_[_loc3_] != "")
               {
                  _loc19_.push(this.api.network.Mount.createMount(_loc9_[_loc3_]));
               }
               _loc3_ += 1;
            }
         }
         if(_loc10_ != undefined)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc10_.length)
            {
               if(_loc10_[_loc4_] != "")
               {
                  _loc18_.push(this.api.network.Mount.createMount(_loc10_[_loc4_]));
               }
               _loc4_ += 1;
            }
         }
         this.api.ui.loadUIComponent("MountStorage","MountStorage",{mounts:_loc19_,parkMounts:_loc18_});
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
            break;
         }
   }
};
_loc1.updateLocalData = function()
{
   this._cgLocal.dataProvider = this._eaLocalDataProvider;
   this.hideButtonValidate(true);
   ank["\x1e\n\x07"]["\x1e\x0b\x02"](this,"exchange",this,this.hideButtonValidate,dofus["\r\x14"].gapi.ui.Exchange.DELAY_BEFORE_VALIDATE,[false]);
};
_loc1.updateDistantData = function()
{
   this._cgDistant.dataProvider = this._eaDistantDataProvider;
   this.hideButtonValidate(true);
   ank["\x1e\n\x07"]["\x1e\x0b\x02"].setTimer(this,"exchange",this,this.hideButtonValidate,dofus["\r\x14"].gapi.ui.Exchange.DELAY_BEFORE_VALIDATE,[false]);
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
   }
};
_loc1.onStorageMovement = function(_loc2_, _loc3_)
{
   var _loc15_ = _loc3_.charAt(0);
   var _loc13_ = this.api.datacenter.Temporary.Storage;
   var _loc2_ = _loc13_.inventory;
   var _loc16_;
   var _loc12_;
   var _loc11_;
   var _loc5_;
   var _loc3_;
   var _loc6_;
   var _loc10_;
   var _loc8_;
   var _loc9_;
   var _loc4_;
   var _loc7_;
   if(_loc15_ == "G")
   {
      _loc16_ = Number(_loc3_.substr(1));
      _loc13_.Kama = _loc16_;
   }
   else
   {
      _loc12_ = _loc3_.charAt(1) == "+";
      _loc11_ = _loc3_.substr(2).split("*");
      _loc5_ = 0;
      while(_loc5_ < _loc11_.length)
      {
         _loc3_ = _loc11_[_loc5_].split("|");
         _loc6_ = Number(_loc3_[0]);
         _loc10_ = Number(_loc3_[1]);
         _loc8_ = Number(_loc3_[2]);
         _loc9_ = _loc3_[3];
         _loc4_ = _loc2_.findFirstItem("ID",_loc6_);
         if(_loc12_)
         {
            _loc7_ = new dofus.datacenter["\f\f"](_loc6_,_loc8_,_loc10_,-1,_loc9_);
            if(_loc4_.index != -1)
            {
               _loc2_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
               _loc2_.updateItem(_loc4_.index,_loc7_);
            }
            else
            {
               _loc2_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
               _loc2_.push(_loc7_);
            }
         }
         else if(_loc4_.index != -1)
         {
            _loc2_.startNoEventDispatchsPeriod(dofus.Constants.DELAYED_INVENTORY_ITEMS_VISUAL_REFRESH);
            _loc2_.removeItems(_loc4_.index,1);
         }
         else
         {
            ank["\x1e\n\x07"]["\x0b\x0b"].err("[onStorageMovement] cet objet n\'existe pas id=" + _loc6_);
         }
         _loc5_ += 1;
      }
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
