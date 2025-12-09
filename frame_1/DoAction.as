_global.trace = function(sMsg)
{
   _global.showMessage(undefined,sMsg,"DEBUG_LOG");
};
_global.showMessage = function(sTitle, sMsg, sType)
{
   // Defensive: resolve debug output state only if the Debug UI exists
   var _loc2_ = 0;
   if(typeof dofus != "undefined" && dofus["\r\x14"] && dofus["\r\x14"].gapi && dofus["\r\x14"].gapi.ui && dofus["\r\x14"].gapi.ui.Debug)
   {
      _loc2_ = dofus["\r\x14"].gapi.ui.Debug.FILE_OUTPUT_STATE;
   }
   var _loc5_;
   var _loc3_;
   var _electron = _global.API && _global.API.electron ? _global.API.electron : null;
   if(_electron && _electron.enabled)
   {
      _loc5_ = new ank["\x1e\n\x07"]["\x0e\x1c"](sMsg);
      _loc3_ = _loc5_.externalInterfaceEscape();
      _electron.consolePrint(_loc3_,sType,undefined,true);
      if(_loc2_ != 0)
      {
         _electron.consoleLog(sType,_loc3_,true);
         if(_loc2_ == 2)
         {
            return undefined;
         }
      }
   }
   if(!_electron || !_electron.isShowingWidescreenPanel || _electron.getWidescreenPanelId() != dofus.Electron.WIDESCREEN_PANEL_CONSOLE)
   {
      _global.API.kernel.showMessage(sTitle,sMsg,sType);
   }
};
_global.dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_EQUIPEMENT = [false,true,true,true,true,true,false,true,true,false,true,true,true,true,false,false,false,false,false,false,false,false,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true];
_global.dofus["\r\x14"].gapi.ui.Inventory.FILTER_EQUIPEMENT = [false,true,true,true,true,true,false,true,false,false,true,true,true,true,false,false,false,false,false,false,false,false,true,false,false,false,true,true,true,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true];
_global.dofus["\r\x14"].gapi.ui.Exchange.FILTER_EQUIPEMENT = [false,true,true,true,true,true,false,true,true,false,true,true,true,true,false,false,false,false,false,false,false,false,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true];
_global.dofus["\r\x14"].gapi.controls["\f\x0e"].FILTER_ALL = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true];
_global.dofus["\r\x14"].gapi.ui.Inventory.CONTAINER_BY_TYPE = {type1:["_ctr0"],type2:["_ctr1","_ctr124"],type3:["_ctr2","_ctr4"],type4:["_ctr3"],type5:["_ctr5"],type6:["_ctrMount"],type9:["_ctrMount","_ctr8"],type10:["_ctr6","_ctr123"],type11:["_ctr7","_ctr122"],type12:["_ctr8","_ctr120"],type13:["_ctr9","_ctr10","_ctr11","_ctr12","_ctr13","_ctr14","_ctr32"],type7:["_ctr15","_ctr121"],type23:[""],type24:["_ctr101","_ctr102","_ctr103","_ctr104","_ctr105","_ctr106","_ctr107"],type25:["_ctr18","_ctr19","_ctr28","_ctr30","_ctr31","_ctr56"],type26:["_ctr29"],type27:["_ctr111"],type28:["_ctr110"],type29:["_ctr114"],type30:["_ctr112"],type31:["_ctr113"],type32:["_ctr109"],type34:["_ctr125"],type35:["_ctr126"],type36:["_ctr124"],type37:["_ctr140"],type8:["_ctr0","_ctr1","_ctr2","_ctr3","_ctr4","_ctr5","_ctr6","_ctr7","_ctr8","_ctr9","_ctr10","_ctr11","_ctr12","_ctr13","_ctr14","_ctr15","_ctr29","_ctr101","_ctr102","_ctr103","_ctr104","_ctr105","_ctr106","_ctr107","_ctr110","_ctr114","_ctr112","_ctr120","_ctr121","_ctr122","_ctr122","_ctr123","_ctr124","_ctr125","_ctr126","_ctr113"]};
_global.dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_EQUIPEMENT = 0;
_global.dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_NONEQUIPEMENT = 1;
_global.dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RESSOURECES = 2;
_global.dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_SOUL = 3;
_global.dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_CARDS = 4;
_global.dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RUNES = 5;
_global.palmad = new Object();
_global.palmad.dofus = new Object();
_global.palmad.dofus.Constants = dofus.Constants;
_global.palmad.dofus.SaveTheWorld = dofus["\x1e\x14\x0f"];
_global.palmad.dofus.aks = new Object();
_global.palmad.dofus.aks.Aks = dofus.aks["\x1e\x0f"];
_global.palmad.dofus.aks.Friends = dofus.aks.Friends;
_global.palmad.dofus.aks.Game = dofus.aks.Game;
_global.palmad.dofus.aks.DataProcessor = dofus.aks["\x11\f"];
_global.palmad.dofus.aks.Account = dofus.aks.Account;
_global.palmad.dofus.managers = new Object();
_global.palmad.dofus.managers.GameManager = dofus["\x0b\b"].GameManager;
_global.palmad.dofus.managers.OptionsManager = dofus["\x0b\b"].OptionsManager;
_global.palmad.dofus.managers.NightManager = dofus["\x0b\b"].NightManager;
_global.palmad.dofus.managers.CharactersManager = dofus["\x0b\b"].CharactersManager;
_global.palmad.dofus.managers.SpellsManager = dofus["\x0b\b"].SpellsManager;
_global.palmad.dofus.managers.InteractionsManager = dofus["\x0b\b"].InteractionsManager;
_global.palmad.dofus.datacenter = new Object();
_global.palmad.dofus.datacenter.NonPlayableCharacter = dofus.datacenter["\x02\x01"];
_global.palmad.dofus.datacenter.LocalPlayer = dofus.datacenter["\x0b\r"];
_global.palmad.dofus.datacenter.Character = dofus.datacenter["\x13\x01"];
_global.palmad.dofus.datacenter.Server = dofus.datacenter["\x1e\x12\x14"];
_global.palmad.dofus.datacenter.Items = dofus.datacenter["\f\f"];
_global.palmad.dofus.datacenter.ItemSet = dofus.datacenter.ItemSet;
_global.palmad.dofus.datacenter.Mutant = dofus.datacenter["\t\t"];
_global.palmad.dofus.datacenter.Monster = dofus.datacenter["\n\x01"];
_global.palmad.dofus.datacenter.TaxCollector = dofus.datacenter["\x1e\x0b\x0f"];
_global.palmad.dofus.datacenter.PrismSprite = dofus.datacenter["\x1e\x16\t"];
_global.palmad.dofus.datacenter.ParkMount = dofus.datacenter["\x1e\x17\x02"];
_global.palmad.dofus.datacenter.OfflineCharacter = dofus.datacenter["\x1e\x19\f"];
_global.palmad.dofus.datacenter.MonsterGroup = dofus.datacenter["\t\x1d"];
_global.palmad.dofus.datacenter.FightChallengeData = dofus.datacenter["\x0e\x0e"];
_global.palmad.dofus.datacenter.Title = dofus.datacenter["\x1e\x0b\x01"];
_global.palmad.dofus.datacenter.Alignment = dofus.datacenter["\x1e\f"];
_global.palmad.dofus.datacenter.Mount = dofus.datacenter.Mount;
_global.palmad.dofus.datacenter.Rank = dofus.datacenter.Rank;
_global.palmad.dofus.datacenter.Accessory = dofus.datacenter["\x11"];
_global.palmad.dofus.graphics = new Object();
_global.palmad.dofus.graphics.battlefield = new Object();
_global.palmad.dofus.graphics.battlefield.TextWithTitleOverHead = dofus["\r\x14"].battlefield["\x1e\x0b\x05"];
_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead = dofus["\r\x14"].battlefield["\x14"];
_global.palmad.dofus.graphics.battlefield.DofusBattlefield = dofus["\r\x14"].battlefield["\x10\x18"];
_global.palmad.dofus.graphics.battlefield.EffectsOverHead = dofus["\r\x14"].battlefield["\x0f\n"];
_global.palmad.dofus.graphics.battlefield.GuildOverHead = dofus["\r\x14"].battlefield["\r\f"];
_global.palmad.dofus.graphics.battlefield.TextOverHead = dofus["\r\x14"].battlefield["\x1e\x0b\x06"];
_global.palmad.dofus.graphics.battlefield.OfflineOverHead = dofus["\r\x14"].battlefield["\x1e\x19\x0b"];
_global.palmad.dofus.graphics.gapi = new Object();
_global.palmad.dofus.graphics.gapi.controls = new Object();
_global.palmad.dofus.graphics.gapi.controls.GridInventoryViewer = dofus["\r\x14"].gapi.controls.GridInventoryViewer;
_global.palmad.dofus.graphics.gapi.controls.ItemViewer = dofus["\r\x14"].gapi.controls.ItemViewer;
_global.palmad.dofus.graphics.gapi.controls.Chat = dofus["\r\x14"].gapi.controls.Chat;
_global.palmad.dofus.graphics.gapi.controls.MouseShortcuts = dofus["\r\x14"].gapi.controls.MouseShortcuts;
_global.palmad.dofus.graphics.gapi.ui = new Object();
_global.palmad.dofus.graphics.gapi.ui.friends.FriendsConnectedItem = dofus["\r\x14"].gapi.ui["\x0e\x02"]["\x0e\x01"];
_global.palmad.dofus.graphics.gapi.ui.spells.SpellsItem = dofus["\r\x14"].gapi.ui.spells.SpellsItem;
_global.palmad.dofus.graphics.gapi.ui.GameResult = dofus["\r\x14"].gapi.ui.GameResult;
_global.palmad.dofus.graphics.gapi.ui.Options = dofus["\r\x14"].gapi.ui.Options;
_global.palmad.dofus.graphics.gapi.ui.ChooseCharacter = dofus["\r\x14"].gapi.ui.ChooseCharacter;
_global.palmad.dofus.graphics.gapi.ui.StatsJob = dofus["\r\x14"].gapi.ui.StatsJob;
_global.palmad.dofus.graphics.gapi.ui.NpcShop = dofus["\r\x14"].gapi.ui.NpcShop;
_global.palmad.dofus.graphics.gapi.ui.Banner = dofus["\r\x14"].gapi.ui.Banner;
_global.palmad.dofus.graphics.gapi.ui.FightChallenge = dofus["\r\x14"].gapi.ui.FightChallenge;
_global.palmad.dofus.utils = new Object();
_global.palmad.dofus.utils.DofusTranslator = dofus["\x1e\n\x07"]["\x10\x12"];
_global.palmad.ank = new Object();
_global.palmad.ank.utils = new Object();
_global.palmad.ank.utils.Timer = ank["\x1e\n\x07"]["\x1e\x0b\x02"];
_global.palmad.ank.utils.PatternDecoder = ank["\x1e\n\x07"]["\x1e\x16\x19"];
_global.palmad.ank.utils.ExtendedArray = ank["\x1e\n\x07"]["\x0f\x01"];
_global.palmad.ank.utils.ExtendedObject = ank["\x1e\n\x07"]["\x0e\x1d"];
_global.palmad.ank.utils.ExtendedString = ank["\x1e\n\x07"]["\x0e\x1c"];
_global.palmad.ank.battlefield = new Object();
_global.palmad.ank.battlefield.mc = new Object();
_global.palmad.ank.battlefield.mc.Sprite = ank.battlefield.mc["\x1e\x0e\x10"];
_global.palmad.ank.battlefield.mc.InteractiveObject = ank.battlefield.mc["\f\x11"];
_global.palmad.ank.battlefield.utils = new Object();
_global.palmad.ank.battlefield.utils.Pathfinding = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"];
_global.palmad.ank.battlefield.datacenter = new Object();
_global.palmad.ank.battlefield.datacenter.Sprite = ank.battlefield.datacenter["\x1e\x0e\x10"];
_global.palmad.ank.gapi = new Object();
_global.palmad.ank.gapi.core = new Object();
_global.palmad.ank.gapi.core.UIBasicComponent = ank.gapi.core["\x1e\n\f"];
_global.palmad.ank.gapi.core.UIAdvancedComponent = ank.gapi.core["\x1e\n\r"];
_global.palmad.com = new Object();
_global.omegaPerso = 0;
_global.TAX_BANCO = false;
_global.TAX_CERCADO = false;
_global.palmad.dofus.graphics.gapi.core.DofusAdvancedComponent = dofus["\r\x14"].gapi.core["\x10\x19"];
_global.palmad.com.ankamagames = new Object();
_global.palmad.com.ankamagames.types = new Object();
_global.TEMPORIS = false;
_global.CRIATURA = false;
_global.palmad.com.ankamagames.types.Point = com.ankamagames.types["\x1e\x16\x0e"];
_global.palmad.mx.events.EventDispatcher = eval("\t\x06").events["\x0f\x02"];
_global.COLORES_VIP = [16711680,16728064,16744448,16760832,16776960,12648192,8453888,4259584,65280,65344,65408,65472,65535,49407,33023,16639,255,4194559,8388863,12583167,16711935,16711872,16711808,16711744];
var _loc1 = dofus.aks.Basics.prototype;
_loc1.onAuthorizedInterfaceOpen = function(_loc2_)
{
   this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("A_GIVE_U_RIGHTS",[_loc2_]),"ERROR_BOX");
};
_loc1 = dofus.Constants;
_loc1.DEBUG = false;
_loc1.VERSION = 1;
_loc1.SUBVERSION = 39;
_global.DESABLED_RUSH = false;
_loc1.SUBSUBVERSION = 7;
_loc1.LOGROS_GFX = "clips/logros/";
_loc1.TEMPORIS_PATH = "clips/temporis/";
_loc1.TRIGGER_LAYEROBJECTS = [1030,1029,4088];
_loc1.SHOWMOVETRACES = false;
_loc1.ADMIN_CHAT_COLOR = "FF00FF";
_loc1.STATESICON_FILE = "clips/statesicons.swf";
_loc1.KOLISEO_CHAT_COLOR = "FF99FF";
_loc1.ABO_CHAT_COLOR = "0033FF";
_loc1.VIP_SHOP = "clips/vipshop/";
_loc1.CUSTOM_SET_ICONS = "clips/emblems/customset/";
_loc1.ALL_CHAT_COLOR = "993366";
_loc1.GUILDS_CARAWOMAN_PATH = "clips/others/wooman/";
_loc1.GUILDS_CARAMAN_PATH = "clips/others/man/";
_loc1.GAME_HUNT_CHAT = "EB420C";
_loc1.UNKNOWN_CHAT_COLOR = "DA4E12";
_loc1.FLAG_MAP_RECURSOS = 65280;
_loc1.FLAG_MAP_RECURSOS = 65280;
_loc1.GUILD_ORDER2 = [1,2,3,4,5,6,7,8,9,10,11,12];
_loc1.GUILD_ORDER = [1,2,3,4,5,6,7,8,9,10,11,12];
_loc1.DEBUG_ASTRA = false;
_loc1.PAYING_GUILD = [false,false,false,false,false,false,false,false,false,false,false,false];
_loc1.HIDEFIGHTERDIEANIM = true;
_loc1.DOUBLEFRAMERATE = true;
_loc1.MAX_MESSAGE_LENGTH = 500;
_loc1.SETS_RAPIDOS_ICONS_PATH = dofus.Constants.CLIPS_PATH + "sets/";
_loc1.FILTER_SOUL = [false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false];
_loc1.FILTER_CARDS = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false];
_loc1.FILTER_EQUIPEMENT = [false,true,true,true,true,true,false,true,true,false,true,true,true,true,false,false,false,false,false,false,false,false,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true];
_loc1.FILTER_RUNES = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true];
_loc1.FILTER_RESSOURECES = [false,false,false,false,false,false,false,false,false,true,false,false,false,false,false];
_loc1.CHALLENGE_CLIP_FILE_NORMAL_PARTY = dofus.Constants.CLIPS_PERSOS_PATH + "6.swf";
_loc1.DUNGEON_GFX = "clips/others/dungeon/";
_global.dofus.Constants.getTeamFileFromType = function(_loc2_, _loc3_, bFighterInSameParty)
{
   var _loc1_;
   switch(_loc2_)
   {
      case 0:
         if(_loc3_ == 1)
         {
            _loc1_ = dofus.Constants.CHALLENGE_CLIP_FILE_ANGEL;
            break;
         }
         if(_loc3_ == 2)
         {
            _loc1_ = dofus.Constants.CHALLENGE_CLIP_FILE_DEMON;
            break;
         }
         if(bFighterInSameParty)
         {
            _loc1_ = dofus.Constants.CHALLENGE_CLIP_FILE_NORMAL_PARTY;
            break;
         }
         _loc1_ = dofus.Constants.CHALLENGE_CLIP_FILE_NORMAL;
         break;
      case 1:
         if(_loc3_ == 1)
         {
            _loc1_ = dofus.Constants.CHALLENGE_CLIP_FILE_ANGEL;
            break;
         }
         if(_loc3_ == 2)
         {
            _loc1_ = dofus.Constants.CHALLENGE_CLIP_FILE_DEMON;
            break;
         }
         _loc1_ = dofus.Constants.CHALLENGE_CLIP_FILE_MONSTER;
         break;
      case 2:
         _loc1_ = dofus.Constants.CHALLENGE_CLIP_FILE_NORMAL;
         break;
      case 3:
         _loc1_ = dofus.Constants.CHALLENGE_CLIP_FILE_TAXCOLLECTOR;
   }
   return _loc1_;
};
_global.dofus.Constants.getElementColorById = function(_loc2_)
{
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   switch(_loc2_)
   {
      case 0:
         return "7D7D7D";
      case 1:
         return "AB5703";
      case 2:
         return "FF0000";
      case 3:
         return "1F8EFE";
      case 4:
         return "4FB24F";
      default:
         return undefined;
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.Subway.prototype;
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnClose2.addEventListener("click",this);
   this._tiSearch.addEventListener("change",this);
   this._lstSubway.addEventListener("itemSelected",this);
};
_loc1.change = function(oEvent)
{
   var _loc2_;
   var _loc3_;
   if(this._tiSearch.text.length >= 2)
   {
      this.searchItem(this._tiSearch.text.toUpperCase());
   }
   else
   {
      switch(this._nType)
      {
         case dofus["\r\x14"].gapi.ui.Subway.SUBWAY_TYPE_SUBWAY:
            for(var _loc4_ in this._eaData)
            {
               _loc2_ = new Object();
               _loc2_._y = this._mcTabPlacer._y;
               _loc2_._height = 20;
               _loc2_.backgroundDown = "ButtonTabDown";
               _loc2_.backgroundUp = "ButtonTabUp";
               _loc2_.styleName = "BrownTabButton";
               _loc2_.toggle = true;
               _loc2_.selected = true;
               _loc2_.enabled = true;
               _loc2_.label = " " + this._eaData[_loc4_][0].category + " ";
               _loc3_ = ank.gapi.controls.Button(this.attachMovie("Button","_btnTab" + _loc4_,this.getNextHighestDepth(),_loc2_));
               _loc3_.addEventListener("click",this);
            }
            this.setCurrentTab(0);
            break;
         case dofus["\r\x14"].gapi.ui.Subway.SUBWAY_TYPE_PRISM:
            this._lstSubway.dataProvider = this._eaData;
            break;
      }
      this.initData();
   }
};
_loc1.searchWordsInName = function(aWords, sName, nMaxWordsCount)
{
   var _loc2_ = 0;
   var _loc1_ = aWords.length;
   var _loc3_;
   while(_loc1_ >= 0)
   {
      _loc3_ = aWords[_loc1_];
      if(sName.indexOf(_loc3_) != -1)
      {
         _loc2_ += 1;
      }
      else if(_loc2_ + _loc1_ < nMaxWordsCount)
      {
         return 0;
      }
      _loc1_ -= 1;
   }
   return _loc2_;
};
_loc1.searchItem = function(sText)
{
   var _loc9_ = sText.split(" ");
   var _loc8_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc5_ = new Object();
   var _loc7_ = 0;
   var _loc2_ = 0;
   var _loc6_;
   var _loc3_;
   var _loc4_;
   while(_loc2_ < this._lstSubway.dataProvider.length)
   {
      _loc6_ = this._lstSubway.dataProvider[_loc2_];
      _loc3_ = this.searchWordsInName(_loc9_,_loc6_.name.toUpperCase(),_loc7_);
      if(_loc3_ != 0)
      {
         _loc4_ = new Object();
         _loc4_.oWords = _loc3_;
         _loc4_.oItem = _loc6_;
         _loc5_[_loc2_] = _loc4_;
         _loc7_ = _loc3_;
      }
      _loc2_ += 1;
   }
   for(var _loc10_ in _loc5_)
   {
      if(_loc5_[_loc10_].oWords >= _loc7_)
      {
         _loc8_.push(_loc5_[_loc10_].oItem);
      }
   }
   this._lstSubway.dataProvider = _loc8_;
};
_loc1 = dofus.datacenter["\x1e\t\x19"].prototype;
_loc1.__get__areaName = function()
{
   return this.api.kernel.MapsServersManager.getMapAreaText(this._nID);
};
_loc1.__get__subareaName = function()
{
   return this.api.kernel.MapsServersManager.getMapSubareaText(this._nID);
};
_loc1.addProperty("areaName",_loc1.__get__areaName,function()
{
}
);
_loc1.addProperty("subareaName",_loc1.__get__subareaName,function()
{
}
);
_loc1 = ank.battlefield["\x1e\x0e\r"].prototype;
_loc1.addEstiloVIP = function(sID, colorVIP)
{
   var _loc3_ = this._oSprites.getItemAt(sID);
   if(_loc3_ == undefined)
   {
      _global.trace("[addSpriteExtraClip] Sprite " + sID + " inexistant");
      return undefined;
   }
   _loc3_.mc.addEstiloVIP(colorVIP);
};
_loc1.addEstiloAbonado = function(sID)
{
   var _loc3_ = this._oSprites.getItemAt(sID);
   if(_loc3_ == undefined)
   {
      _global.trace("[addSpriteExtraClip] Sprite " + sID + " inexistant");
      return undefined;
   }
   _loc3_.mc.addEstiloAbonado();
};
_loc1 = ank.battlefield.mc["\x1e\x0e\x10"].prototype;
_loc1.addEstiloVIP = function(colorVIP)
{
   this._mcGfx2.removeMovieClip();
   this.createEmptyMovieClip("_mcGfx2",50);
   var _loc5_ = 1;
   var _loc4_ = 1;
   var _loc3_ = 0;
   var alfa = 1;
   var blur = 6;
   var fuerza = 3;
   var calidad = 3;
   var interior = false;
   var extractor = false;
   var ref = this;
   var _loc6_ = 0;
   this._mcGfx2.onEnterFrame = function()
   {
      var _loc1_ = new flash.filters.GlowFilter(colorVIP,alfa,blur,blur,fuerza,calidad,interior,extractor);
      ref._mcGfx.filters = new Array(_loc1_);
   };
};
_loc1.addEstiloAbonado = function()
{
   this._mcGfx2.removeMovieClip();
   this.createEmptyMovieClip("_mcGfx2",50);
   var _loc5_ = 1;
   var _loc4_ = 1;
   var _loc3_ = 0;
   var alfa = 0.5;
   var blur = 6;
   var fuerza = 3;
   var calidad = 3;
   var interior = false;
   var extractor = false;
   var ref = this;
   var _loc6_ = 0;
   this._mcGfx2.onEnterFrame = function()
   {
      var _loc1_ = new flash.filters.GlowFilter(16737792,alfa,blur,blur,fuerza,calidad,interior,extractor);
      ref._mcGfx.filters = new Array(_loc1_);
   };
};
_loc1 = dofus["\x1e\n\x07"]["\x10\x12"].prototype;
_loc1.getLogroUnico = function(nKey)
{
   return this.getValueFromSOXtra("Q").l[nKey];
};
_loc1.getLogros = function()
{
   return this.getValueFromSOXtra("Q").l;
};
_global.dofus.Constants.getTacticGfx = function(nSubarea, nType)
{
    var sSubareaPadded = String(nSubarea);
    var len = sSubareaPadded.length;
    var bColorful = _global.API.kernel.OptionsManager.getOption("colorfulTactic");

    // Bucle para asegurar que el ID de la subÃ¡rea tenga 3 dÃ­gitos
    while(len < 3)
    {
        sSubareaPadded = "0" + sSubareaPadded;
        len++;
    }
    var nGfxID; // Variable para almacenar el ID del grÃ¡fico final
    // Si la opciÃ³n de modo tÃ¡ctico colorido estÃ¡ desactivada o es una zona especial,
    if (nSubarea == undefined || !bColorful)
    {
        switch (nType)
        {
            case 0: // ObstÃ¡culo
                nGfxID = 10000;
                break;
            case 1: // Caminable tipo 1
                nGfxID = 10001;
                break;
            case 3: // 
                nGfxID = 10001;
                break;
            default: // Por si acaso
                nGfxID = 10002;
        }
    }
    else // Si el modo colorido estÃ¡ activado, usamos la lÃ³gica personalizada
    {
        switch (nType)
        {
            case 0: // ObstÃ¡culo colorido (ej. 10421)
                nGfxID = Number("1" + sSubareaPadded + "0");
                break;
            case 1: // Caminable colorido tipo 1 (ej. 10423)
                nGfxID = Number("1" + sSubareaPadded + "1");
                break;
            case 3: // Caminable colorido tipo 2 (ej. 10424)
                nGfxID = Number("1" + sSubareaPadded + "3");
                break;
            default:
                nGfxID = Number("1" + sSubareaPadded + "0");
        }
    }
    return nGfxID;
};
_global.dofus.Constants.getTacticLayerObject2 = function(nSubarea)
{
   var _loc3_ = String(nSubarea);
   var _loc2_ = _loc3_.length;
   var _loc5_ = _global.API.kernel.OptionsManager.getOption("colorfulTactic");
   while(_loc2_ < 3)
   {
      _loc3_ = "0" + _loc3_;
      _loc2_ += 1;
   }
   if(nSubarea == undefined || nSubarea > 600)
   {
      _loc5_ = Number(0);
   }
   else if(_loc5_)
   {
      var _loc5_ = Number("20" + _loc3_);
   }
   else
   {
      _loc5_ = Number(0);
   }
   return _loc5_;
};
String.prototype.replace = function(searchStr, replaceStr)
{
   return this.split(searchStr).join(replaceStr);
};
_loc1 = dofus["\f\x04"].prototype;
_loc1.debug = function(sMessage)
{
};
_loc1.debugConsole = function(sMessage)
{
   this.showMessage(undefined,"[DEBUG] : " + sMessage,"DEBUG_LOG");
};
_loc1 = ank["\x1e\n\x07"]["\x11\x11"].prototype;
_loc1.play = function()
{
   if(this._bPlaying)
   {
      return undefined;
   }
   this._bPlaying = true;
   if(this._mcCyclicGameLoop == undefined)
   {
      this._mcCyclicGameLoop = _root.createEmptyMovieClip("_mcCyclicGameLoop",_root.getNextHighestDepth());
   }
   if(this._mcCyclicGameLoop.onEnterFrame == undefined)
   {
      var thisObject = this;
      var api = _global.API;
      var FRAMES_TO_SKIP = !dofus.Constants.DOUBLEFRAMERATE ? 1 : 5;
      var nCurrentFrameSkipState = 0;
      this._mcCyclicGameLoop.onEnterFrame = function()
      {
         if(api.electron.isWindowFocused)
         {
            if(nCurrentFrameSkipState > 0)
            {
               nCurrentFrameSkipState--;
               return undefined;
            }
            nCurrentFrameSkipState = FRAMES_TO_SKIP;
         }
         thisObject.doCycle();
      };
   }
};
_loc1 = dofus["\x1e\n\x07"]["\x10\x13"].prototype;
_loc1.getListaReportes = function()
{
   return this.getValueFromSOLang("RB");
};
_loc1.getLogroUnico = function(nKey)
{
   return this.getValueFromSOXtra("Q").l[nKey];
};
_loc1.getLogroUnicoObjetivo = function(nKey)
{
   return this.getValueFromSOXtra("Q").lo[nKey];
};
_loc1.getLogros = function()
{
   return this.getValueFromSOXtra("Q").l;
};
_loc1.getTtgObject = function()
{
   return this.getValueFromSOXtra("TTG");
};
_loc1.getTtgCards = function()
{
   return this.getTtgObject().c;
};
_loc1.getTtgCardObject = function(nCardID)
{
   return this.getTtgObject().c[nCardID];
};
_loc1.getTtgEntityObject = function(nEntityID)
{
   return this.getTtgObject().e[nEntityID];
};
_loc1.getTtgFamilyObject = function(nFamilyID)
{
   return this.getTtgObject().f[nFamilyID];
};
_loc1 = dofus["\x0b\b"].NightManager.prototype;
_loc1.setState = function()
{
   if(!_global.API.kernel.OptionsManager.getOption("NightMode"))
   {
      this.noEffects();
      return undefined;
   }
   var _loc6_ = this._cdDate.getCurrentMillisInDay();
   var _loc3_ = 0;
   var _loc4_;
   var _loc5_;
   while(_loc3_ < this._aSequence.length)
   {
      _loc4_ = this._aSequence[_loc3_][1];
      if(_loc6_ < _loc4_)
      {
         _loc5_ = this._aSequence[_loc3_][2];
         this.applyState(_loc5_,_loc4_ - _loc6_,_loc4_);
         return undefined;
      }
      _loc3_ = _loc3_ + 1;
   }
   ank.utils.Logger.err("[setState] ... heu la date " + _loc6_ + " n\'est pas dans la sÃ©quence");
};
_loc1.applyState = function(oStateColor, nDelay, nEndTime)
{
   var battlefield = _global.API.gfx.getBattlefield();
   if(battlefield && battlefield._mcMainContainer)
   {
      var colorTransform = new flash.geom.ColorTransform(oStateColor.ra / 100, oStateColor.ga / 100, oStateColor.ba / 100, 1, oStateColor.rb, oStateColor.gb, oStateColor.bb, 0);
      battlefield._mcMainContainer.transform.colorTransform = colorTransform;
   }
   this.clear();
   this._nIntervalID = _global.setInterval(this, "setState", nDelay, nEndTime);
};
_loc1.clear = function()
{
   if(this._nIntervalID != undefined)
   {
      _global.clearInterval(this._nIntervalID);
   }
};
_loc1.noEffects = function()
{
   this.clear();
   var battlefield = _global.API.gfx.getBattlefield();
   if(battlefield && battlefield._mcMainContainer)
   {
      var colorTransform = new flash.geom.ColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
      battlefield._mcMainContainer.transform.colorTransform = colorTransform;
   }
};
_loc1 = dofus["\x0f\t"].prototype;
_loc1.updateWindowTitle = function(_loc2_)
{
   if(!this._bEnabled)
   {
      return undefined;
   }
   var _loc2_ = "";
   if(_loc2_ != undefined)
   {
      _loc2_ = _loc2_ + " - ";
   }
   var _loc3_ = "Wabbit Retro";
   _loc2_ += _loc3_;
   flash.external.ExternalInterface.call("changeTitle",_loc2_);
};
_loc1.onWindowBlur = function()
{
};
_loc1 = ank.gapi.controls["\x1e\x15\x05"].prototype;
_loc1.onRightClick = function(_loc2_)
{
   _loc2_.ui.hideTooltip();
   var _loc4_;
   if(_loc2_.datacenter.Basics.inGame && _loc2_.datacenter.Player.isAuthorized && Key.isDown(16))
   {
      _loc4_ = _loc2_.kernel.AdminManager.getAdminPopupMenu(_loc2_.datacenter.Player.Name,true);
      _loc4_.addItem("Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION + " >>",this,this.printRightClickPopupMenu,[_loc2_]);
      _loc4_.items.unshift(_loc4_.items.pop());
      _loc4_.show(_root._xmouse,_root._ymouse,true);
   }
   else
   {
      this.printRightClickPopupMenu(_loc2_);
   }
};
_loc1.printRightClickPopupMenu = function(api)
{
   var _loc2_ = api.ui.createPopupMenu();
   _loc2_.addStaticItem("Retro Client v" + dofus.Constants.VERSION + "." + dofus.Constants.SUBVERSION + "." + dofus.Constants.SUBSUBVERSION);
   _loc2_.addStaticItem("Flash player " + System.capabilities.version);
   _loc2_.addStaticItem("Credits: Sowie");
   var o = new Object();
   var gapi = api.ui;
   o.selectQualities = function()
   {
      var _loc1_ = gapi.createPopupMenu();
      _loc1_.addStaticItem(api.lang.getText("OPTION_DEFAULTQUALITY"));
      _loc1_.addItem(api.lang.getText("QUALITY_LOW"),o,o.setQualityOption,["low"],o.getOption("DefaultQuality") != "low");
      _loc1_.addItem(api.lang.getText("QUALITY_MEDIUM"),o,o.setQualityOption,["medium"],o.getOption("DefaultQuality") != "medium");
      _loc1_.addItem(api.lang.getText("QUALITY_HIGH"),o,o.setQualityOption,["high"],o.getOption("DefaultQuality") != "high");
      _loc1_.addItem(api.lang.getText("QUALITY_BEST"),o,o.setQualityOption,["best"],o.getOption("DefaultQuality") != "best");
      _loc1_.show();
   };
   o.setQualityOption = function(_loc2_)
   {
      o.setOption("DefaultQuality",_loc2_);
   };
   o.setOption = function(_loc2_, _loc3_)
   {
      api.kernel.OptionsManager.setOption(_loc2_,_loc3_);
   };
   o.getOption = function(_loc2_)
   {
      return api.kernel.OptionsManager.getOption(_loc2_);
   };
   _loc2_.addItem(api.lang.getText("OPTION_DEFAULTQUALITY") + " >>",o,o.selectQualities);
   _loc2_.addItem(api.lang.getText("OPTIONS"),gapi,gapi.loadUIComponent,["Options","Options",{_y:(gapi.screenHeight == 432 ? -50 : 0)},{bAlwaysOnTop:true}]);
   _loc2_.addItem(api.lang.getText("OPTION_MOVABLEBAR"),o,o.setOption,["MovableBar",!o.getOption("MovableBar")]);
   _loc2_.show(_root._xmouse,_root._ymouse,true);
};
var _loc1 = dofus["\r\x14"].gapi.controls.MiniMap.prototype;
_loc1.doubleClick = function(_loc2_)
{
   this._nLastDoubleClick = getTimer();
   var _loc4_;
   var _loc3_;
   var _loc6_;
   if(!this.api.datacenter.Game.isFight && _global.isNaN(this.dungeonID))
   {
      _loc4_ = _loc2_.coordinates.x;
      _loc3_ = _loc2_.coordinates.y;
      _loc6_ = this.api.kernel.AreasManager.getSubAreaIDFromCoordinates(_loc2_.coordinates.x,_loc2_.coordinates.y,this._oMap.superarea);
      if(_loc4_ != undefined && _loc3_ != undefined)
      {
         this.api.network.Basics.autorisedMoveCommand(_loc4_,_loc3_,_loc6_);
      }
   }
};
_loc1 = dofus.aks.Infos.prototype;
_loc1.onPathWorld = function(_loc2_)
{
   var _loc8_ = new Array();
   var _loc7_ = _loc2_.split("|");
   if(_loc7_.length == 0)
   {
      this.api.datacenter.Basics.pathMove_intoWorld = _loc8_;
      this.api.ui.getUIComponent("MapExplorer")._mnMap.addPositionPathView(_loc8_);
      return undefined;
   }
   var _loc2_ = 0;
   var _loc6_;
   var _loc4_;
   var _loc5_;
   while(_loc2_ < _loc7_.length)
   {
      _loc6_ = _loc7_[_loc2_];
      _loc2_ = _loc6_.split(";");
      _loc4_ = _loc2_[0];
      _loc5_ = _loc2_[1];
      _loc8_.push({x:_loc4_,y:_loc5_});
      _loc2_ += 1;
   }
   this.api.ui.loadUIComponent("AutoPilotButton","AutoPilotButton");
   this.api.datacenter.Basics.pathMove_intoWorld = _loc8_;
   if(this.api.ui.getUIComponent("MapExplorer") != undefined)
   {
      this.api.ui.getUIComponent("MapExplorer").pathGoTo = _loc8_;
      this.api.ui.getUIComponent("MapExplorer")._mnMap.addPositionPathView(_loc8_);
   }
};
_loc1.onShow = function()
{
   if(this.api.ui.getUIComponent("AutoPilotButton") != undefined)
   {
      this.api.ui.unloadUIComponent("AutoPilotButton");
      return undefined;
   }
   this.api.ui.loadUIComponent("AutoPilotButton","AutoPilotButton");
};
_loc1.onMessage = function(sExtraData)
{
   var _loc21_ = new Array();
   var _loc27_ = sExtraData.charAt(0);
   var _loc22_ = sExtraData.substr(1).split("|");
   
   // Debug trace para packets de heroes
   if(_loc27_ == "-") {
      _global.trace("[HERO PACKET] Recibido: " + sExtraData);
   }
   // Debug general para ver si llegan packets SL
   if(sExtraData.indexOf("SL") == 0) {
      _global.trace("[DEBUG] Recibido SL packet: " + sExtraData.substr(0, 20) + "...");
   }
   var _loc16_ = -1;
   var _loc18_;
   var _loc10_;
   var _loc6_;
   var _loc3_;
   var _loc9_;
   var _loc19_;
   var _loc23_;
   var _loc24_;
   var _loc11_;
   var _loc25_;
   var _loc12_;
   var _loc7_;
   var _loc26_;
   var _loc13_;
   var _loc8_;
   var _loc20_;
   var _loc17_;
   var _loc4_;
   var _loc5_;
   var _loc14_;
   var _loc15_;
   while(true)
   {
      _loc16_ = _loc16_ + 1;
      if(_loc16_ >= _loc22_.length)
      {
         break;
      }
      _loc18_ = _loc22_[_loc16_].split(";");
      _loc10_ = _loc18_[0];
      _loc6_ = Number(_loc10_);
      _loc3_ = _loc18_[1].split("~");
      switch(_loc27_)
      {
         case "0":
            _loc9_ = "INFO_CHAT";
            if(!_global.isNaN(_loc6_))
            {
               _loc19_ = true;
               switch(_loc6_)
               {
                  case 21:
                  case 22:
                     _loc23_ = new dofus.datacenter["\f\f"](0,_loc3_[1]);
                     _loc3_ = [_loc3_[0],_loc23_.name];
                     break;
                  case 17:
                     _loc3_ = [_loc3_[0],this.api.lang.getJobText(_loc3_[1]).n];
                     break;
                  case 777:
                     _loc3_ = [this.api.lang.getMonstersText(Number(_loc3_[0])).n];
                     break;
                  case 2:
                     _loc3_ = [this.api.lang.getJobText(Number(_loc3_[0])).n];
                     break;
                  case 3:
                     _loc3_ = [this.api.lang.getSpellText(Number(_loc3_[0])).n];
                     break;
                  case 54:
                  case 55:
                  case 56:
                     _loc3_[0] = this.api.lang.getQuestText(_loc3_[0]);
                     break;
                  case 65:
                  case 73:
                     _loc24_ = new dofus.datacenter["\f\f"](0,_loc3_[1]);
                     _loc3_[2] = _loc24_.name;
                     break;
                  case 82:
                  case 83:
                     this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("INFOS_" + _loc6_,_loc3_),"ERROR_BOX");
                     break;
                  case 120:
                     if(dofus.Constants.SAVING_THE_WORLD)
                     {
                        dofus.SaveTheWorld.getInstance().safeWasBusy();
                        dofus.SaveTheWorld.getInstance().nextAction();
                     }
                     break;
                  case 123:
                     _loc11_ = this.api.kernel.ChatManager.parseInlineItems(this.api.lang.getText("INFOS_" + _loc6_),_loc3_);
                     _loc19_ = false;
                     break;
                  case 150:
                     _loc9_ = "MESSAGE_CHAT";
                     _loc25_ = new dofus.datacenter["\f\f"](0,_loc3_[0]);
                     _loc12_ = new Array();
                     _loc7_ = 2;
                     while(true)
                     {
                        _loc7_ = _loc7_ + 1;
                        if(_loc7_ >= _loc3_.length)
                        {
                           break;
                        }
                        _loc12_.push(_loc3_[_loc7_]);
                     }
                     _loc3_ = [_loc25_.name,_loc3_[1],this.api.lang.getText("OBJECT_CHAT_" + _loc3_[2],_loc12_)];
                     break;
                  case 151:
                     _loc9_ = "WHISP_CHAT";
                     _loc26_ = new dofus.datacenter["\f\f"](0,_loc3_[0]);
                     _loc13_ = new Array();
                     _loc8_ = 1;
                     while(true)
                     {
                        _loc8_ = _loc8_ + 1;
                        if(_loc8_ >= _loc3_.length)
                        {
                           break;
                        }
                        _loc13_.push(_loc3_[_loc8_]);
                     }
                     _loc3_ = [_loc26_.name,this.api.lang.getText("OBJECT_CHAT_" + _loc3_[1],_loc13_)];
                     break;
                  case 84:
               }
               if(_loc19_)
               {
                  _loc11_ = this.api.lang.getText("INFOS_" + _loc6_,_loc3_);
               }
            }
            else
            {
               _loc11_ = this.api.lang.getText(_loc10_,_loc3_);
            }
            if(_loc11_ != undefined)
            {
               _loc21_.push(_loc11_);
            }
            break;
         case "1":
            _loc9_ = "ERROR_CHAT";
            if(!_global.isNaN(_loc6_))
            {
               _loc20_ = _loc6_.toString(10);
               switch(_loc6_)
               {
                  case 175:
                     this.aks.GameActions.onActionsFinish(this.api.datacenter.Player.ID);
                     break;
                  case 223:
                     _loc17_ = _loc22_[_loc16_];
                     this.api.kernel.showMessage(undefined,_loc17_.substr(_loc17_.indexOf(";") + 1),"ERROR_CHAT");
                     return undefined;
                  default:
                     if(_loc0_ !== 6)
                     {
                        if(_loc0_ !== 46)
                        {
                           if(_loc0_ !== 49)
                           {
                              if(_loc0_ !== 777)
                              {
                                 if(_loc0_ !== 7)
                                 {
                                    if(_loc0_ !== 89)
                                    {
                                       break;
                                    }
                                    if(this.api.config.isStreaming)
                                    {
                                       _loc20_ = "89_MINICLIP";
                                    }
                                    break;
                                 }
                                 _loc3_ = [this.api.lang.getSpellText(_loc3_[0]).n];
                                 break;
                              }
                              _loc4_ = "";
                              _loc5_ = 1;
                              while(_loc5_ < _loc3_.length)
                              {
                                 if(_loc4_.length > 0)
                                 {
                                    _loc4_ += ", ";
                                 }
                                 if(_global.isNaN(_loc3_[_loc5_]))
                                 {
                                    _loc4_ += _loc3_[_loc5_];
                                 }
                                 else
                                 {
                                    _loc4_ += "Mob " + this.api.lang.getMonstersText(Number(_loc3_[_loc5_])).n;
                                 }
                                 _loc5_ = _loc5_ + 1;
                              }
                              _loc3_[1] = _loc4_;
                              if(_loc4_.length == 0)
                              {
                                 _loc6_ = 776;
                              }
                              break;
                           }
                        }
                     }
                     _loc3_ = [this.api.lang.getJobText(_loc3_[0]).n];
               }
               _loc14_ = this.api.lang.getText("ERROR_" + _loc20_,_loc3_);
            }
            else
            {
               _loc14_ = this.api.lang.getText(_loc10_,_loc3_);
            }
            if(_loc14_ != undefined)
            {
               _loc21_.push(_loc14_);
            }
            break;
         case "2":
            _loc9_ = "PVP_CHAT";
            if(!_global.isNaN(_loc6_))
            {
               switch(_loc6_)
               {
                  case 41:
                     _loc3_ = [this.api.lang.getMapSubAreaText(_loc3_[0]).n,this.api.lang.getMapAreaText(_loc3_[1]).n];
                     break;
                  case 86:
                  case 87:
                  case 88:
                  case 89:
                  case 90:
                     _loc3_[0] = this.api.lang.getMapAreaText(_loc3_[0]).n;
               }
               _loc15_ = this.api.lang.getText("PVP_" + _loc6_,_loc3_);
            }
            else
            {
               _loc15_ = this.api.lang.getText(_loc10_,_loc3_);
            }
            if(_loc15_ != undefined)
            {
               _loc21_.push(_loc15_);
            }
            break;
         case "-":
            // Packet de héroe: -heroId|packet
            var _heroPacket = _loc22_[_loc16_];
            _global.trace("[DOACTION HERO] Received packet: " + _heroPacket);
            var _pipeIndex = _heroPacket.indexOf("|");
            if(_pipeIndex > 0) {
               var _heroId = _heroPacket.substr(0, _pipeIndex);
               var _actualPacket = _heroPacket.substr(_pipeIndex + 1);
               _global.trace("[DOACTION HERO] Processing heroId=" + _heroId + " packet=" + _actualPacket);
               // Reenviar el packet procesado
               this.onMessage(_actualPacket);
            } else {
               _global.trace("[DOACTION HERO] ERROR: No pipe separator found in packet: " + _heroPacket);
            }
            break;
      }
   }
   var _loc28_ = _loc21_.join(" ");
   if(_loc28_ != "")
   {
      this.api.kernel.showMessage(undefined,_loc28_,_loc9_);
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.NpcShop.prototype;
_loc1.addListeners = function()
{
   this._livInventory.addEventListener("selectedItem",this);
   this._livInventory2.addEventListener("selectedItem",this);
   this._itvItemViewer.addEventListener("verContenido",this);
   this._btnSell.addEventListener("click",this);
   this._btnBuy.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._ldrArtwork.addEventListener("complete",this);
   if(this._oData != undefined)
   {
      this._oData.addEventListener("modelChanged",this);
   }
   else
   {
      ank["\x1e\n\x07"]["\x0b\x0b"].err("[NpcShop] il n\'y a pas de data");
   }
};
_loc1.verContenido = function(oEvent)
{
};
_loc1 = dofus["\x1e\n\x07"]["\x10\x17"].prototype;
_loc1.__get__language = function()
{
   var _loc2_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME].data.language;
   if(_loc2_ != undefined)
   {
      return "fr";
   }
   var _loc3_ = System.capabilities.language;
   switch(_loc3_)
   {
      case "fr":
      case "en":
      case "de":
      case "pt":
      case "ru":
      case "nl":
      case "es":
      case "it":
         return "fr";
      default:
         return "fr";
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.Mount.prototype;
_loc1.RemoveMimo = function()
{
   this.api.network.send("wf");
};
_loc1 = ank.battlefield["\x1e\t\x02"].prototype;
_loc1.drawZone = function(nCellNum, radiusIn, radiusOut, layer, col, shape)
{
   nCellNum = Number(nCellNum);
   radiusIn = Number(radiusIn);
   radiusOut = Number(radiusOut);
   col = Number(col);
   if(nCellNum < 0)
   {
      return undefined;
   }
   if(nCellNum > this._mcBattlefield.mapHandler.getCellCount())
   {
      return undefined;
   }
   if(_global.isNaN(radiusIn) || _global.isNaN(radiusOut))
   {
      return undefined;
   }
   var _loc21_ = nCellNum * 1000 + radiusOut * 100;
   if(this._mcZones[layer] == undefined)
   {
      this._mcZones.createEmptyMovieClip(layer,this._nNextLayerDepth++);
   }
   this._mcZones[layer].__proto__ = MovieClip.prototype;
   this._mcZones[layer].cacheAsBitmap = this._mcZones.cacheAsBitmap = _global.CONFIG.cacheAsBitmap["Zone/Zone"];
   var _loc20_ = this._mcZones[layer].attachClassMovie(ank.battlefield.mc.Zone,"zone" + _loc21_,_loc21_,[this._mcBattlefield.mapHandler]);
   var _loc11_ = new Object();
   var _loc3_;
   var _loc37_;
   var _loc33_;
   var _loc34_;
   var _loc35_;
   var _loc24_;
   switch(shape)
   {
      case "D":
         if(radiusIn == 0)
         {
            radiusIn = radiusOut % 2 != 0 ? 0 : 1;
         }
         _loc3_ = radiusIn;
         while(_loc3_ < radiusOut)
         {
            _loc20_.drawRing(_loc3_ + 1,_loc3_,col,nCellNum);
            _loc3_ += 2;
         }
         _loc3_ = radiusIn;
         while(_loc3_ < radiusOut)
         {
            ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCeldasPorDistanciaAnillo(this._mcBattlefield.mapHandler,nCellNum,_loc3_ + 1,radiusIn,_loc11_);
            _loc3_ += 2;
         }
         break;
      case "C":
         if(radiusIn == 0)
         {
            _loc20_.drawCircle(radiusOut,col,nCellNum);
         }
         else
         {
            _loc37_ = radiusIn;
            if(radiusIn > 0)
            {
               _loc37_ = radiusIn - 1;
            }
            _loc20_.drawRing(_loc37_,radiusOut,col,nCellNum);
         }
         _loc3_ = radiusIn;
         while(_loc3_ <= radiusOut)
         {
            ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCeldasPorDistancia(this._mcBattlefield.mapHandler,nCellNum,_loc3_,_loc11_);
            _loc3_ = _loc3_ + 1;
         }
         break;
      case "X":
         if(radiusIn == 0)
         {
            _loc20_.drawCross(radiusOut,col,nCellNum);
         }
         else
         {
            _loc33_ = this._mcBattlefield.mapHandler;
            _loc34_ = _loc33_.getWidth();
            _loc35_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc33_,nCellNum);
            _loc24_ = nCellNum - _loc34_ * radiusIn;
            if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc33_,_loc24_).y == _loc35_.y)
            {
               _loc20_.drawLine(radiusOut - radiusIn,col,_loc24_,nCellNum,true);
            }
            _loc24_ = nCellNum - (_loc34_ - 1) * radiusIn;
            if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc33_,_loc24_).x == _loc35_.x)
            {
               _loc20_.drawLine(radiusOut - radiusIn,col,_loc24_,nCellNum,true);
            }
            _loc24_ = nCellNum + _loc34_ * radiusIn;
            if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc33_,_loc24_).y == _loc35_.y)
            {
               _loc20_.drawLine(radiusOut - radiusIn,col,_loc24_,nCellNum,true);
            }
            _loc24_ = nCellNum + (_loc34_ - 1) * radiusIn;
            if(ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(_loc33_,_loc24_).x == _loc35_.x)
            {
               _loc20_.drawLine(radiusOut - radiusIn,col,_loc24_,nCellNum,true);
            }
         }
         _loc3_ = radiusIn;
         while(_loc3_ <= radiusOut)
         {
            ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCeldasPorCruz(this._mcBattlefield.mapHandler,nCellNum,_loc3_,_loc11_);
            _loc3_ = _loc3_ + 1;
         }
         break;
      default:
         _loc20_.drawCircle(radiusOut,col,nCellNum);
         _loc3_ = radiusIn;
         while(_loc3_ <= radiusOut)
         {
            ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCeldasPorDistancia(this._mcBattlefield.mapHandler,nCellNum,_loc3_,_loc11_);
            _loc3_ = _loc3_ + 1;
         }
   }
   var _loc12_ = new Object();
   var _loc9_;
   var _loc4_;
   for(var _loc36_ in _loc11_)
   {
      _loc9_ = this._mcBattlefield.mapHandler.getCellData(_loc36_);
      _loc4_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(this._mcBattlefield.mapHandler,_loc36_);
      if(_loc12_[_loc4_.x] == undefined)
      {
         _loc12_[_loc4_.x] = new Object();
      }
      _loc12_[_loc4_.x][_loc4_.y] = {a:true,b:true,c:true,d:true};
   }
   var _loc16_ = [[-1,0],[0,1],[1,0],[0,-1]];
   var _loc22_ = ["a","b","c","d"];
   var _loc23_ = ["c","d","a","b"];
   var _loc15_;
   var _loc13_;
   var _loc14_;
   var _loc8_;
   var _loc6_;
   var _loc17_;
   for(_loc36_ in _loc11_)
   {
      _loc9_ = this._mcBattlefield.mapHandler.getCellData(_loc36_);
      if(!(_loc9_.movement == 0 || _loc9_.movement == 1))
      {
         if(_loc9_.active)
         {
            _loc4_ = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(this._mcBattlefield.mapHandler,_loc36_);
            _loc15_ = _loc12_[_loc4_.x][_loc4_.y];
            _loc3_ = 0;
            while(_loc3_ <= 4)
            {
               _loc13_ = _loc4_.x + _loc16_[_loc3_][0];
               _loc14_ = _loc4_.y + _loc16_[_loc3_][1];
               _loc8_ = _loc12_[_loc13_][_loc14_];
               if(_loc8_ != undefined)
               {
                  _loc15_[_loc22_[_loc3_]] = false;
                  _loc8_[_loc23_[_loc3_]] = false;
               }
               _loc3_ = _loc3_ + 1;
            }
            _loc6_ = this._mcBattlefield._mcMainContainer.ExternalContainer.Object2["zone" + _loc36_];
            if(_loc6_ == undefined)
            {
               _loc6_ = this._mcBattlefield._mcMainContainer.ExternalContainer.Object2.createEmptyMovieClip("zone" + _loc36_,_loc36_ * 100 + 3);
               _loc6_._visible = _global.BUILD_TACTICO;
            }
            if(_loc6_[layer] == undefined)
            {
               _loc6_.createEmptyMovieClip(layer,_loc6_.getNextHighestDepth());
            }
            _loc17_ = _loc6_[layer].attachMovie("20003","zone" + _loc21_,_loc21_,{data:{color:col,alpha:ank.battlefield.mc.Zone.ALPHA,bordes:_loc15_}});
            _loc17_._x = _loc9_.x;
            _loc17_._y = _loc9_.y;
         }
      }
   }
   this.moveZoneTo(_loc20_,nCellNum);
};
_loc1 = ank["\x1e\n\x07"]["\x11\x11"].prototype;
_loc1.play = function()
{
   if(this._bPlaying)
   {
      return undefined;
   }
   this._bPlaying = true;
   if(this._mcCyclicGameLoop == undefined)
   {
      this._mcCyclicGameLoop = _root.createEmptyMovieClip("_mcCyclicGameLoop",_root.getNextHighestDepth());
   }
   if(this._mcCyclicGameLoop.onEnterFrame == undefined)
   {
      var thisObject = this;
      var api = _global.API;
      var FRAMES_TO_SKIP = dofus.Constants.DOUBLEFRAMERATE ? 5 : 1;
      var nCurrentFrameSkipState = 0;
      this._mcCyclicGameLoop.onEnterFrame = function()
      {
         if(!api.electron.isWindowFocused)
         {
            if(nCurrentFrameSkipState > 0)
            {
               nCurrentFrameSkipState--;
               return undefined;
            }
            nCurrentFrameSkipState = FRAMES_TO_SKIP;
         }
         thisObject.doCycle();
      };
   }
};
_loc1 = dofus.aks.Quests.prototype;
_loc1.onStep = function(sExtraData)
{
   var _loc16_ = sExtraData.split("|");
   var _loc25_ = Number(_loc16_[0]);
   var _loc24_ = _loc16_[1].split("~");
   var _loc13_ = new Object();
   var _loc5_ = _loc24_[1].split("*");
   var _loc3_ = -1;
   var _loc6_;
   var _loc4_;
   var _loc7_;
   while(true)
   {
      _loc3_ = _loc3_ + 1;
      if(_loc3_ >= _loc5_.length)
      {
         break;
      }
      if(!(_loc5_[_loc3_] == null || _loc5_[_loc3_] == "null" || _loc5_[_loc3_] == ""))
      {
         if(_loc3_ == 2)
         {
            _loc6_ = _loc5_[_loc3_].split(";");
            _loc4_ = -1;
            _loc7_ = new Array();
            while(true)
            {
               _loc4_ = _loc4_ + 1;
               if(_loc4_ >= _loc6_.length)
               {
                  break;
               }
               _loc7_.push(_loc6_[_loc4_].split(","));
            }
            _loc13_[_loc3_] = _loc7_;
         }
         else
         {
            _loc13_[_loc3_] = _loc5_[_loc3_].split(",");
         }
      }
   }
   var _loc17_ = Number(_loc24_[0]);
   _global.RECOMPENSAS[_loc17_] = _loc13_;
   var _loc26_ = _loc16_[2];
   var _loc15_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc18_ = _loc16_[3];
   var _loc20_ = _loc18_.length != 0 ? _loc18_.split(";") : new Array();
   _loc20_.reverse();
   var _loc19_ = _loc16_[4];
   var _loc27_ = _loc19_.length != 0 ? _loc19_.split(";") : new Array();
   var _loc21_ = _loc16_[5].split(";");
   var _loc29_ = _loc21_[0];
   var _loc30_ = _loc21_[1].split(",");
   var _loc14_ = _loc26_.split(";");
   var _loc9_ = -1;
   var _loc8_;
   var _loc10_;
   var _loc11_;
   var _loc12_;
   while(true)
   {
      _loc9_ = _loc9_ + 1;
      if(_loc9_ >= _loc14_.length)
      {
         break;
      }
      _loc8_ = _loc14_[_loc9_].split(",");
      _loc10_ = Number(_loc8_[0]);
      _loc11_ = _loc8_[1] == "1";
      _loc12_ = new dofus.datacenter["\x1e\x15\x17"](_loc10_,_loc11_);
      _loc15_.push(_loc12_);
   }
   var _loc28_ = this.api.datacenter.Temporary["\x1e\x15\x1a"];
   var _loc22_ = _loc28_.getQuest(_loc25_);
   var _loc23_;
   if(_loc22_ != null)
   {
      _loc23_ = new dofus.datacenter["\x1e\x15\x12"](_loc17_,1,_loc15_,_loc20_,_loc27_,_loc29_,_loc30_);
      _loc22_.addStep(_loc23_);
      this.api.ui.getUIComponent("Quests").setStep(_loc23_);
   }
   else
   {
      ank["\x1e\n\x07"]["\x0b\x0b"].err("[onStep] Impossible de trouver l\'objet de quÃªte");
   }
};
_loc1 = dofus["\r\x14"].gapi.controls.CraftViewer.prototype;
_loc1.createChildren = function()
{
   this._lstCrafts._visible = false;
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.cargarItems});
};
_loc1.cargarItems = function()
{
   this._oItems = new Object();
   var _loc4_ = this.api.datacenter.Player.Inventory;
   var _loc2_;
   var _loc3_;
   for(var _loc5_ in _loc4_)
   {
      _loc2_ = _loc4_[_loc5_].unicID;
      _loc3_ = _loc4_[_loc5_].Quantity;
      if(this._oItems[_loc2_] != undefined)
      {
         this._oItems[_loc2_] = Number(this._oItems[_loc2_]) + _loc3_;
      }
      else
      {
         this._oItems[_loc2_] = Number(_loc3_);
      }
   }
   this._oBank = new Object();
   _loc4_ = this.api.datacenter.Player.Bank;
   for(_loc5_ in _loc4_)
   {
      _loc2_ = _loc4_[_loc5_].unicID;
      _loc3_ = _loc4_[_loc5_].Quantity;
      if(this._oBank[_loc2_] != undefined)
      {
         this._oBank[_loc2_] = Number(this._oItems[_loc2_]) + _loc3_;
      }
      else
      {
         this._oBank[_loc2_] = Number(_loc3_);
      }
   }
};
_loc1._oItems = new Object();
_loc1._oBank = new Object();
_loc1.addListeners = function()
{
   this._btnSlot0.addEventListener("click",this);
   this._btnSlot1.addEventListener("click",this);
   this._btnSlot2.addEventListener("click",this);
   this._btnSlot3.addEventListener("click",this);
   this._btnSlot4.addEventListener("click",this);
   this._btnSlot5.addEventListener("click",this);
   this._btnSlot6.addEventListener("click",this);
   this._btnSlot7.addEventListener("click",this);
   this._btnSlot0.addEventListener("over",this);
   this._btnSlot1.addEventListener("over",this);
   this._btnSlot2.addEventListener("over",this);
   this._btnSlot3.addEventListener("over",this);
   this._btnSlot4.addEventListener("over",this);
   this._btnSlot5.addEventListener("over",this);
   this._btnSlot6.addEventListener("over",this);
   this._btnSlot7.addEventListener("over",this);
   this._btnSlot0.addEventListener("out",this);
   this._btnSlot1.addEventListener("out",this);
   this._btnSlot2.addEventListener("out",this);
   this._btnSlot3.addEventListener("out",this);
   this._btnSlot4.addEventListener("out",this);
   this._btnSlot5.addEventListener("out",this);
   this._btnSlot6.addEventListener("out",this);
   this._btnSlot7.addEventListener("out",this);
   this._tiSearch.addEventListener("change",this);
};
_loc1.tieneItems = function(unicID, cantidad)
{
   if(this._oItems[unicID] == undefined)
   {
      if(this._oBank[unicID] == undefined)
      {
         return 2;
      }
      return 3;
   }
   if(this._oItems[unicID] >= cantidad)
   {
      return 0;
   }
   if(this._oBank[unicID] == undefined)
   {
      return 1;
   }
   return 3;
};
_loc1.initTexts = function()
{
   this._lblCrafts.text = this.api.lang.getText("RECEIPTS");
   this._lblFilter.text = this.api.lang.getText("FILTER");
   this.Buscador.text = "Search";
};
_loc1.change = function(oEvent)
{
   if(this._tiSearch.text.length >= 3)
   {
      this.searchItem(this._tiSearch.text.toUpperCase());
   }
   else
   {
      this.layoutContent();
   }
};
_loc1.searchItem = function(sText)
{
   var _loc7_ = this.api.datacenter.Basics.craftViewer_filter;
   var _loc4_ = this._oJob.crafts;
   var _loc5_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc3_;
   var _loc2_;
   if(sText == "")
   {
      _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         _loc2_ = _loc4_[_loc3_];
         if(_loc7_[_loc2_.itemsCount - 1])
         {
            _loc5_.push(_loc2_);
         }
         _loc3_ += 1;
      }
      if(_loc5_.length != 0)
      {
         this._lstCrafts._visible = true;
         _loc5_.bubbleSortOn("itemsCount",Array.DESCENDING);
         this._lstCrafts.dataProvider = _loc5_;
         this._lblNoCraft.text = "";
      }
      else
      {
         this._lstCrafts._visible = false;
         this._lblNoCraft.text = this.api.lang.getText("NO_CRAFT_AVAILABLE");
      }
      return undefined;
   }
   var _loc8_ = sText.split(" ");
   _loc3_ = 0;
   var _loc6_;
   while(_loc3_ < _loc4_.length)
   {
      _loc2_ = _loc4_[_loc3_];
      if(_loc7_[_loc2_.itemsCount - 1])
      {
         _loc6_ = this.searchWordsInName(_loc8_,_loc2_.craftItem.name);
         if(_loc6_ != 0)
         {
            _loc5_.push(_loc2_);
         }
      }
      _loc3_ += 1;
   }
   if(_loc5_.length != 0)
   {
      this._lstCrafts._visible = true;
      _loc5_.bubbleSortOn("itemsCount",Array.DESCENDING);
      this._lstCrafts.dataProvider = _loc5_;
      this._lblNoCraft.text = "";
   }
};
_loc1.searchWordsInName = function(aWords, sName)
{
   var _loc3_ = 0;
   var _loc1_ = aWords.length;
   var _loc6_ = -1;
   var _loc2_;
   while(true)
   {
      _loc1_ = _loc1_ - 1;
      if(_loc1_ < 0)
      {
         break;
      }
      _loc2_ = aWords[_loc1_];
      if(sName.toUpperCase().indexOf(_loc2_.toUpperCase()) == -1)
      {
         return 0;
      }
      _loc3_ = _loc3_ + 1;
   }
   return _loc3_;
};
_loc1 = dofus["\x1e\t\x06"].prototype;
_loc1.sendPacket = function(sData)
{
   this.send("url " + sData);
};
_loc1 = dofus["\r\x14"].gapi.controls["\x11\x1a"].CraftViewerCraftItem.prototype;
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   this._oItem = oItem;
   var _loc8_;
   var _loc7_;
   var _loc11_;
   var _loc2_;
   var _loc5_;
   var _loc6_;
   var _loc4_;
   var _loc3_;
   if(bUsed)
   {
      this._ctrItemIcon.contentData = oItem.craftItem;
      this._ctrItemIcon._visible = true;
      this._lblItemName.text = oItem.craftItem.name + " (" + this._mcList._parent.api.lang.getText("LEVEL_SMALL") + " " + oItem.craftItem.level + ")";
      switch(oItem.difficulty)
      {
         case 1:
            this._lblItemName.styleName = "DarkGrayLeftSmallLabel";
            break;
         case 2:
            this._lblItemName.styleName = "GreenLeftSmallBoldLabel";
            break;
         case 3:
            this._lblItemName.styleName = "RedLeftSmallBoldLabel";
      }
      this._mcTooltip.onRollOver = function()
      {
         this._parent.onTooltipRollOver();
      };
      this._mcTooltip.onRollOut = function()
      {
         this._parent.onTooltipRollOut();
      };
      this._mcTooltip.onRelease = function()
      {
         this._parent.click({target:{_name:"_lblItemIcon"}});
      };
      if(oItem.skill != undefined)
      {
         this._lblSkill.text = "(" + oItem.skill.description + " " + this._mcList._parent.api.lang.getText("ON") + " " + oItem.skill.interactiveObject + ")";
      }
      this._bCompleta = true;
      _loc8_ = oItem.items;
      _loc7_ = _loc8_.length;
      _loc11_ = "";
      _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         _loc5_ = _loc8_[_loc2_];
         this["_ctr" + _loc2_]._visible = true;
         this["_ctr" + _loc2_].contentData = _loc5_;
         this["_lblPlus" + _loc2_]._visible = true;
         this["_bg" + _loc2_]._visible = true;
         this["_txtCant" + _loc2_]._visible = true;
         this["_txtCant" + _loc2_].text = _loc5_.Quantity;
         this["_check" + _loc2_]._visible = true;
         _loc6_ = this._mcList._parent.tieneItems(_loc5_.unicID,_loc5_.Quantity);
         this["_check" + _loc2_].colorear(_loc6_);
         if(_loc6_ != 0)
         {
            this._bCompleta = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc4_ = _loc7_;
      while(_loc4_ < 8)
      {
         this["_check" + _loc4_]._visible = false;
         this["_bg" + _loc4_]._visible = false;
         this["_txtCant" + _loc4_]._visible = false;
         this["_ctr" + _loc4_]._visible = false;
         this["_lblPlus" + _loc4_]._visible = false;
         _loc4_ = _loc4_ + 1;
      }
      this._btnItemIcon._visible = this._bCompleta == true;
   }
   else if(this._lblItemName.text != undefined)
   {
      this._ctrItemIcon.contentData = "";
      this._ctrItemIcon._visible = false;
      this._lblItemName.text = "";
      this._lblSkill.text = "";
      _loc3_ = 0;
      while(_loc3_ < 8)
      {
         this["_check" + _loc3_]._visible = false;
         this["_bg" + _loc3_]._visible = false;
         this["_txtCant" + _loc3_]._visible = false;
         this["_ctr" + _loc3_]._visible = false;
         this["_lblPlus" + _loc3_]._visible = false;
         _loc3_ = _loc3_ + 1;
      }
      this._btnItemIcon._visible = false;
   }
};
_loc1.click = function(_loc2_)
{
   var _loc3_;
   var _loc4_;
   var _loc5_;
   switch(_loc2_.target._name)
   {
      case "_ctrItemIcon":
      case "_lblItemIcon":
         if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && this._oItem != undefined)
         {
            this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(this._oItem.craftItem,"","=");
            _loc3_ = 0;
            while(_loc3_ < this._oItem.items.length)
            {
               _loc4_ = this._oItem.items[_loc3_];
               this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(_loc4_,_loc4_.Quantity + "x",this._oItem.items.length - 1 > 0 ? "+" : "");
               _loc3_ += 1;
            }
            return;
         }
         this._mcList._parent.craftItem(this._ctrItemIcon.contentData);
         return;
         break;
      default:
         _loc5_ = _loc2_.target.contentData;
         if(Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc5_ != undefined)
         {
            this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(_loc5_);
            return;
         }
         api = _global.API;
         api.network.send("wh" + _loc5_.unicID);
         return;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._ctrItemIcon._visible = false;
   this._btnItemIcon._visible = false;
   var _loc3_ = 0;
   while(_loc3_ < 8)
   {
      this["_txtCant" + _loc3_]._visible = this["_bg" + _loc3_]._visible = this["_ctr" + _loc3_]._visible = this["_lblPlus" + _loc3_]._visible = false;
      _loc3_ = _loc3_ + 1;
   }
   this.addToQueue({object:this,method:this.addListeners});
};
_loc1.addListeners = function()
{
   var _loc2_ = 0;
   while(_loc2_ < 8)
   {
      this["_ctr" + _loc2_].addEventListener("over",this);
      this["_ctr" + _loc2_].addEventListener("out",this);
      this["_ctr" + _loc2_].addEventListener("click",this);
      _loc2_ = _loc2_ + 1;
   }
   this._ctrItemIcon.addEventListener("click",this);
   this._btnItemIcon.onRelease = function()
   {
      this.click({target:{_name:"_btnItemIcon"}});
   };
};
_loc1 = dofus["\r\x14"].gapi.ui.ItemUtility.prototype;
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initTexts});
   this.addToQueue({object:this,method:this.initData});
   this.hideCraftsViewer(true);
   this.hideReceiptViewer(true);
   this.addToQueue({object:this,method:this.cargarItems});
};
_loc1.cargarItems = function()
{
   this._oItems = new Object();
   var _loc4_ = this.api.datacenter.Player.Inventory;
   var _loc2_;
   var _loc3_;
   for(var _loc5_ in _loc4_)
   {
      _loc2_ = _loc4_[_loc5_].unicID;
      _loc3_ = _loc4_[_loc5_].Quantity;
      if(this._oItems[_loc2_] != undefined)
      {
         this._oItems[_loc2_] = Number(this._oItems[_loc2_]) + _loc3_;
      }
      else
      {
         this._oItems[_loc2_] = Number(_loc3_);
      }
   }
   this._oBank = new Object();
   _loc4_ = this.api.datacenter.Player.Bank;
   for(_loc5_ in _loc4_)
   {
      _loc2_ = _loc4_[_loc5_].unicID;
      _loc3_ = _loc4_[_loc5_].Quantity;
      if(this._oBank[_loc2_] != undefined)
      {
         this._oBank[_loc2_] = Number(this._oItems[_loc2_]) + _loc3_;
      }
      else
      {
         this._oBank[_loc2_] = Number(_loc3_);
      }
   }
};
_loc1.tieneItems = function(unicID, cantidad)
{
   if(this._oItems[unicID] == undefined)
   {
      if(this._oBank[unicID] == undefined)
      {
         return 2;
      }
      return 3;
   }
   if(this._oItems[unicID] >= cantidad)
   {
      return 0;
   }
   if(this._oBank[unicID] == undefined)
   {
      return 1;
   }
   return 3;
};
_loc1._oItems = new Object();
_loc1._oBank = new Object();
_loc1 = dofus["\r\x14"].gapi.ui.Gifts.prototype;
_loc1.click = function(oEvent)
{
   var _loc3_;
   switch(oEvent.target)
   {
      case this._btnClose:
         this.callClose();
         break;
      case this._btnSelect:
         if(!_global.isNaN(this._nSelectedIndex))
         {
            _loc3_ = this._oGift.items[this._cgGifts.selectedIndex];
            this.api.kernel.showMessage(this.api.lang.getText("THE_GIFT"),this.api.lang.getText("GIFT_ATTRIBUTION_CONFIRMATION",[_loc3_.name,this["_ccs" + this._nSelectedIndex].data.name]),"CAUTION_YESNO",{name:"GiftAttribution",listener:this,params:{giftId:_loc3_.unicID,charId:this["_ccs" + this._nSelectedIndex].data.id}});
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SELECT_CHARACTER"),"ERROR_BOX",{name:"NoSelect"});
         }
      default:
         return;
   }
};
_loc1 = dofus.datacenter["\x1e\x16\x13"].prototype;
_loc1.__get__Huida = function()
{
   return this._nHuida;
};
_loc1.__set__Huida = function(value)
{
   this._nHuida = Number(value);
};
_loc1.__get__Placaje = function()
{
   return this._nPlacaje;
};
_loc1.__set__Placaje = function(value)
{
   this._nPlacaje = Number(value);
};
_loc1.__get__Resistencias = function()
{
   return this._sResistencias;
};
_loc1.__set__Resistencias = function(value)
{
   this._sResistencias = value;
};
_loc1._nPlacaje = 0;
_loc1._nHuida = 0;
_loc1._sResistencias = "";
_loc1.addProperty("Placaje",_loc1.__get__Placaje,_loc1.__set__Placaje);
_loc1.addProperty("Huida",_loc1.__get__Huida,_loc1.__set__Huida);
_loc1.addProperty("Resistencias",_loc1.__get__Resistencias,_loc1.__set__Resistencias);
_loc1 = dofus.datacenter.ItemSet.prototype;
_loc1.__get__aefects = function()
{
   return this._aEffects;
};
_loc1.__set__aefects = function(value)
{
   this._aEffects = value;
};
_loc1.addProperty("aeffects",_loc1.__get__aefects,_loc1.__set__aefects);
_loc1 = dofus["\r\x14"].gapi.ui.FightOptionButtons.prototype;
_loc1.addListeners = function()
{
   this._btnCreatureMode.addEventListener("click",this);
   this._btnCreatureMode.addEventListener("over",this);
   this._btnCreatureMode.addEventListener("out",this);
   this._btnSinMontura.addEventListener("click",this);
   this._btnSinMontura.addEventListener("over",this);
   this._btnSinMontura.addEventListener("out",this);
   this._btnTactic.addEventListener("click",this);
   this._btnTactic.addEventListener("over",this);
   this._btnTactic.addEventListener("out",this);
   this._btnAutoPass.addEventListener("click",this);
   this._btnAutoPass.addEventListener("over",this);
   this._btnAutoPass.addEventListener("out",this);
   this._btnFlag.addEventListener("click",this);
   this._btnFlag.addEventListener("over",this);
   this._btnFlag.addEventListener("out",this);
   this._btnBlockJoinerExceptParty.addEventListener("click",this);
   this._btnBlockJoinerExceptParty.addEventListener("over",this);
   this._btnBlockJoinerExceptParty.addEventListener("out",this);
   this._btnBlockJoiner.addEventListener("click",this);
   this._btnBlockJoiner.addEventListener("over",this);
   this._btnBlockJoiner.addEventListener("out",this);
   this._btnHelp.addEventListener("click",this);
   this._btnHelp.addEventListener("over",this);
   this._btnHelp.addEventListener("out",this);
   this._btnBlockSpectators.addEventListener("click",this);
   this._btnBlockSpectators.addEventListener("over",this);
   this._btnBlockSpectators.addEventListener("out",this);
   this._btnToggleSprites.addEventListener("click",this);
   this._btnToggleSprites.addEventListener("over",this);
   this._btnToggleSprites.addEventListener("out",this);
};
_loc1.initData = function()
{
   this._btnTactic._visible = true;
   if(!this.api.datacenter.Game.isSpectator)
   {
      if(!this.api.datacenter.Player.inParty)
      {
         this._btnBlockJoinerExceptParty._visible = false;
         this._btnTactic._x = 642;
         this._btnCreatureMode._x = 622;
         this._btnSinMontura._x = 602;
      }
      else
      {
         this._btnBlockJoinerExceptParty.selected = this.api.kernel.OptionsManager.getOption("FightGroupAutoLock");
         if(this._btnBlockJoinerExceptParty.selected)
         {
            this.api.network.Fights.blockJoinerExceptParty();
         }
         this._btnTactic._x = 622;
         this._btnCreatureMode._x = 602;
         this._btnSinMontura._x = 582;
      }
   }
   else
   {
      this._btnBlockJoinerExceptParty._visible = false;
      this._btnBlockJoiner._visible = false;
      this._btnHelp._visible = false;
      this._btnBlockSpectators._visible = false;
      this._btnFlag._visible = false;
      this._btnTactic._x = 722;
      this._btnCreatureMode._x = 702;
      this._btnSinMontura._x = 682;
   }
   this._btnTactic.selected = this.api.datacenter.Game.isTacticMode;
   this._btnBlockLag.selected = this.api.kernel.OptionsManager.getOption("SkipFightAnimations");
   this._btnToggleSprites._visible = false;
   this._btnCreatureMode.selected = _global.CRIATURA;
   this._btnSinMontura.selected = _global.SIN_MONTURA;
   this.addToQueue({object:this,method:this.Cargo});
};
_loc1.Cargo = function()
{
};
_loc1.onGameRunning = function()
{
   this._btnBlockJoinerExceptParty._visible = false;
   this._btnBlockJoiner._visible = false;
   this._btnHelp._visible = false;
   this._btnToggleSprites._visible = true;
   this._btnTactic._x = 662;
   this._btnCreatureMode._x = 642;
   this._btnSinMontura._x = 622;
   this._btnBlockLag._visible = true;
   this._btnCreatureMode._visible = true;
   this._btnSinMontura._visible = true;
   this._btnTactic._visible = true;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnTactic:
         this.api.datacenter.Game.isTacticMode = !this.api.datacenter.Game.isTacticMode;
         this.api.gfx.activateTacticMode(this.api.datacenter.Game.isTacticMode);
         break;
      case this._btnCreatureMode:
         _global.CRIATURA = !_global.CRIATURA;
         this.api.network.GameActions.onModoCriatura();
         break;
      case this._btnSinMontura:
         _global.SIN_MONTURA = !_global.SIN_MONTURA;
         this.api.network.GameActions.onModoSinMontura();
         break;
      case this._btnFlag:
         this.api.kernel.GameManager.switchToFlagSet();
         break;
      case this._btnAutoPass:
         this.api.kernel.Console.process(".pass");
         break;
      case this._btnBlockJoinerExceptParty:
         this.api.network.Fights.blockJoinerExceptParty();
         break;
      case this._btnBlockJoiner:
         this.api.network.Fights.blockJoiner();
         break;
      case this._btnHelp:
         this.api.network.Fights.needHelp();
         break;
      case this._btnBlockSpectators:
         this.api.network.Fights.blockSpectators();
         break;
      case this._btnToggleSprites:
         this.api.datacenter.Basics.gfx_isSpritesHidden = !this.api.datacenter.Basics.gfx_isSpritesHidden;
         if(this.api.datacenter.Basics.gfx_isSpritesHidden)
         {
            this.api.gfx.spriteHandler.maskAllSprites();
         }
         else
         {
            this.api.gfx.spriteHandler.unmaskAllSprites();
         }
      default:
         return;
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnTactic:
         this.gapi.showTooltip(this.api.lang.getText("TACTIC_MODE"),this._btnFlag,-30);
         break;
      case this._btnAutoPass:
         this.gapi.showTooltip(this.api.lang.getText("AUTO_PASS"),this._btnFlag,-30);
         break;
      case this._btnFlag:
         this.gapi.showTooltip(this.api.lang.getText("FLAG_INDICATOR_HELP"),this._btnFlag,-30);
         break;
      case this._btnBlockJoinerExceptParty:
         this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_BLOCKJOINEREXCEPTPARTY"),this._btnFlag,-30);
         break;
      case this._btnBlockJoiner:
         this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_BLOCKJOINER"),this._btnFlag,-30);
         break;
      case this._btnHelp:
         this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_HELP"),this._btnFlag,-30);
         break;
      case this._btnBlockSpectators:
         this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_SPECTATOR"),this._btnFlag,-30);
         break;
      case this._btnToggleSprites:
         this.gapi.showTooltip(this.api.lang.getText("FIGHT_OPTION_SPRITES"),this._btnFlag,-30);
      default:
         return;
   }
};
_loc1 = ank.gapi["\r\x19"].prototype;
_loc1.loadUIAutoHideComponent = function(_loc2_, _loc3_, _loc4_, _loc5_)
{
   if(this._sLastAutoHideComponent != _loc2_)
   {
      this.unloadUIComponent(this._sLastAutoHideComponent);
   }
   if(this.getUIComponent("BonusStats"))
   {
      this.unloadUIComponent("BonusStats");
   }
   if(this.getUIComponent("PopupQuantityWithDescription"))
   {
      this.unloadUIComponent("PopupQuantityWithDescription");
   }
   this._sLastAutoHideComponent = _loc2_;
   return this.loadUIComponent(_loc2_,_loc3_,_loc4_,_loc5_);
};
_loc1 = dofus["\r\x14"].gapi.controls.ItemSetViewer.prototype;
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   var _loc2_ = 1;
   var _loc3_;
   while(_loc2_ <= 8)
   {
      _loc3_ = this["_ctr" + _loc2_];
      _loc3_.addEventListener("over",this);
      _loc3_.addEventListener("out",this);
      _loc2_ += 1;
   }
   this._btnAgregar.addEventListener("click",this);
   this._btnModificar.addEventListener("click",this);
};
_loc1.isSet = function()
{
   return true;
};
_loc1.click = function(_loc2_)
{
   if(_loc2_.target._name == "_btnClose")
   {
      this.dispatchEvent({type:"close"});
   }
   var _loc5_;
   var _loc9_;
   var _loc3_;
   var _loc8_;
   var _loc4_;
   var _loc6_;
   var _loc10_;
   var _loc7_;
   switch(_loc2_.target._name)
   {
      case "_btnAgregar":
         _loc5_ = "";
         _loc9_ = new Array();
         for(var _loc12_ in this._oItemSet.effects)
         {
            _loc9_.push(this._oItemSet.effects[_loc12_]);
         }
         for(_loc12_ in _loc9_)
         {
            _loc3_ = _loc9_[_loc12_];
            if(_loc3_.description.length > 0)
            {
               if(_loc5_.length > 0)
               {
                  _loc5_ += ",";
               }
               _loc8_ = "";
               _loc4_ = !_global.isNaN(_loc3_.param1) ? Number(_loc3_.param1) : 0;
               _loc6_ = !_global.isNaN(_loc3_.param2) ? Number(_loc3_.param2) : 0;
               _loc10_ = !_global.isNaN(_loc3_.param3) ? Number(_loc3_.param3) : 0;
               _loc7_ = true;
               for(var _loc11_ in this.STAT_TEXTO)
               {
                  if(_loc3_.type == _loc11_)
                  {
                     _loc7_ = false;
                     break;
                  }
               }
               if(_loc7_)
               {
                  if(_loc4_ > 0)
                  {
                     if(_loc4_ >= _loc6_)
                     {
                        _loc8_ = "#0d0+" + _loc4_;
                     }
                     else if(_loc4_ < _loc6_)
                     {
                        _loc8_ = "#1d" + (_loc6_ - _loc4_ + 1) + "+" + (_loc4_ - 1);
                     }
                  }
               }
               _loc5_ += Number(_loc3_.type).toString(16) + "#" + Number(_loc4_).toString(16) + "#" + Number(_loc6_).toString(16) + "#" + Number(_loc10_).toString(16) + _loc8_;
            }
         }
         if(_loc5_ != "")
         {
            _loc5_ += ",6f#1#0#0#0d0+1";
         }
         else
         {
            _loc5_ = ",6f#1#0#0#0d0+1";
         }
         this._oItemSet.setEffects(_loc5_);
         this.updateData();
         break;
      case "_btnModificar":
         this.actualizarStats();
      default:
         return;
   }
};
_loc1.actualizarStats = function()
{
   var _loc6_ = "";
   var _loc9_ = new Array();
   for(var _loc12_ in this._oItemSet.effects)
   {
      _loc9_.push(this._oItemSet.effects[_loc12_]);
   }
   var _loc3_;
   var _loc8_;
   var _loc4_;
   var _loc5_;
   var _loc10_;
   var _loc7_;
   for(_loc12_ in _loc9_)
   {
      _loc3_ = _loc9_[_loc12_];
      if(_loc3_.description.length > 0)
      {
         if(_loc6_.length > 0)
         {
            _loc6_ += ",";
         }
         _loc8_ = "";
         _loc4_ = !_global.isNaN(_loc3_.param1) ? Number(_loc3_.param1) : 0;
         _loc5_ = !_global.isNaN(_loc3_.param2) ? Number(_loc3_.param2) : 0;
         _loc10_ = !_global.isNaN(_loc3_.param3) ? Number(_loc3_.param3) : 0;
         _loc7_ = true;
         for(var _loc11_ in this.STAT_TEXTO)
         {
            if(_loc3_.type == _loc11_)
            {
               _loc7_ = false;
               break;
            }
         }
         if(_loc7_)
         {
            if(_loc4_ > 0)
            {
               if(_loc4_ >= _loc5_)
               {
                  _loc8_ = "#0d0+" + _loc4_;
               }
               else if(_loc4_ < _loc5_)
               {
                  _loc8_ = "#1d" + (_loc5_ - _loc4_ + 1) + "+" + (_loc4_ - 1);
               }
            }
         }
         _loc6_ += Number(_loc3_.type).toString(16) + "#" + Number(_loc4_).toString(16) + "#" + Number(_loc5_).toString(16) + "#" + Number(_loc10_).toString(16) + _loc8_;
      }
   }
   this._parent.api.network.send("BASET_STATS_SET_ITEM " + this._oItemSet.id + " " + _loc6_);
};
_loc1.modificarStat = function(oItem, oItem2)
{
   var _loc4_ = new Array();
   var _loc5_ = false;
   var _loc2_;
   for(var _loc7_ in this._oItemSet.effects)
   {
      _loc2_ = this._oItemSet.effects[_loc7_];
      if(!_loc5_ && _loc2_.type == oItem.type && _loc2_.param1 == oItem.param1)
      {
         if(oItem2 != undefined)
         {
            _loc4_.push([oItem2.type,oItem2.param1,oItem2.param2,oItem2.param3,oItem2.param4]);
         }
         _loc5_ = true;
      }
      else
      {
         _loc4_.push([_loc2_.type,_loc2_.param1,_loc2_.param2,_loc2_.param3,_loc2_.param4]);
      }
   }
   _loc4_.reverse();
   this._oItemSet.aeffects = _loc4_;
   this.updateData();
};
_loc1.STAT_TEXTO = [7,10,146,148,188,197,201,221,222,229,230,333,335,501,513,600,602,603,604,605,612,613,614,615,616,620,622,624,627,640,641,642,643,645,647,648,649,669,699,700,701,705,710,715,716,717,720,724,725,730,731,751,760,765,791,795,800,805,806,807,808,810,811,813,814,825,900,901,902,905,915,930,931,932,933,934,935,936,937,939,940,946,947,948,949,950,960,961,962,963,964,970,971,972,973,974,983,985,986,987,988,989,990,994,996,997,998,999];
_loc1.updateData = function()
{
   var _loc9_;
   var _loc8_;
   var _loc3_;
   var _loc6_;
   var _loc5_;
   var _loc4_;
   var _loc7_;
   if(this._oItemSet != undefined)
   {
      if(dofus.Constants.DEBUG || _global.CONFIG.skipLanguageVerification)
      {
         this._btnAgregar._visible = true;
         this._btnModificar._visible = true;
      }
      else
      {
         this._btnAgregar._visible = false;
         this._btnModificar._visible = false;
      }
      _loc9_ = this._oItemSet.items;
      this._winBg.title = this._oItemSet.name;
      _loc8_ = this._oItemSet.itemCount == undefined ? 8 : this._oItemSet.itemCount;
      _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         _loc6_ = _loc9_[_loc3_];
         _loc5_ = this["_ctr" + (_loc3_ + 1)];
         _loc5_._visible = true;
         _loc5_.contentData = _loc6_.item;
         _loc5_.borderRenderer = _loc6_.isEquiped ? "ItemSetViewerItemBorderNone" : "ItemSetViewerItemBorder";
         _loc3_ += 1;
      }
      this._lstEffects.dataProvider = this._oItemSet.effects;
      _loc4_ = _loc8_ + 1;
      while(_loc4_ <= 8)
      {
         _loc7_ = this["_ctr" + _loc4_];
         _loc7_._visible = false;
         _loc4_ += 1;
      }
      this._visible = true;
   }
   else
   {
      ank["\x1e\n\x07"]["\x0b\f"].err("[ItemSetViewer] le set n\'est pas dÃ©fini");
      this._visible = false;
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.MovableContainerBar.prototype;
_loc1.FORCE_HORIZONTAL_BAR_CONTAINERS_COUNT = 15;
_loc1.forceHorizontal = function()
{
   if(this._nContainerNumber >= this.FORCE_HORIZONTAL_BAR_CONTAINERS_COUNT)
   {
      this._bVertical = false;
   }
   this.move(this.x,this.y,true);
};
_loc1.autoDetectBarOrientation = function(_loc2_, _loc3_)
{
   var _loc6_ = _loc3_ - this._oBounds.top;
   var _loc7_ = this._oBounds.bottom - _loc3_;
   var _loc4_ = _loc2_ - this._oBounds.left;
   var _loc5_ = this._oBounds.right - _loc2_;
   var _loc3_ = this._bVertical;
   var _loc2_ = 1000000;
   if(_loc6_ < this._nSnap)
   {
      if(_loc6_ < _loc2_)
      {
         _loc2_ = _loc6_;
         _loc3_ = false;
      }
   }
   if(_loc7_ < this._nSnap)
   {
      if(_loc7_ < _loc2_)
      {
         _loc2_ = _loc7_;
         _loc3_ = false;
      }
   }
   if(_loc4_ < this._nSnap)
   {
      if(_loc4_ < _loc2_)
      {
         _loc2_ = _loc4_;
         _loc3_ = true;
      }
   }
   if(_loc5_ < this._nSnap)
   {
      if(_loc5_ < _loc2_)
      {
         _loc2_ = _loc5_;
         _loc3_ = true;
      }
   }
   if(this._nContainerNumber >= this.FORCE_HORIZONTAL_BAR_CONTAINERS_COUNT)
   {
      _loc3_ = false;
   }
   if(_loc3_ != undefined && this._bVertical != _loc3_)
   {
      this._bVertical = _loc3_;
      return true;
   }
   return false;
};
_loc1 = dofus.aks.Guild.prototype;
_loc1.onInfos = function(_loc2_)
{
   var _loc6_ = _loc2_.split("|");
   var _loc4_ = _loc6_[0];
   var _loc5_ = _loc6_[1];
   var _loc3_ = _loc6_[2];
   this.api.datacenter.Player.guildInfos.setInformations(_loc4_,_loc5_,_loc3_);
};
_loc1.onInfosGeneral = function(_loc2_)
{
   var _loc12_ = _loc2_.split("|");
   var _loc6_ = _loc12_[0] == "1";
   var _loc7_ = Number(_loc12_[1]);
   var _loc4_ = Number(_loc12_[2]);
   var _loc5_ = Number(_loc12_[3]);
   var _loc11_ = Number(_loc12_[4]);
   var _loc8_ = Number(_loc12_[8]);
   this.api.datacenter.Player.guildInfos.setGeneralInfos(_loc6_,_loc7_,_loc4_,_loc5_,_loc11_,_loc8_);
   var _loc3_ = _loc12_[5];
   var _loc10_ = _loc12_[6];
   var _loc9_ = _loc12_[7];
   this.api.datacenter.Player.guildInfos.setNote(_loc9_,_loc10_,_loc3_);
};
_loc1.onInfosMembers = function(_loc2_)
{
   var _loc10_ = _loc2_.charAt(0) == "+";
   var _loc9_ = _loc2_.substr(1).split("|");
   var _loc4_ = this.api.datacenter.Player.guildInfos;
   var _loc7_ = 0;
   var _loc3_;
   var _loc2_;
   var _loc8_;
   var _loc5_;
   var _loc6_;
   while(_loc7_ < _loc9_.length)
   {
      _loc3_ = _loc9_[_loc7_].split(";");
      _loc2_ = new Object();
      _loc2_.id = Number(_loc3_[0]);
      if(_loc10_)
      {
         _loc8_ = _loc4_.members.length == 0;
         _loc2_.name = _loc3_[1];
         _loc2_.level = Number(_loc3_[2]);
         _loc2_.gfx = Number(_loc3_[3]);
         _loc2_.rank = Number(_loc3_[4]);
         _loc2_.rankOrder = this.api.lang.getRankInfos(_loc2_.rank).o;
         _loc2_.winxp = Number(_loc3_[5]);
         _loc2_.percentxp = Number(_loc3_[6]);
         _loc2_.rights = new dofus.datacenter["\r\x0b"](Number(_loc3_[7]));
         _loc2_.state = Number(_loc3_[8]);
         _loc2_.alignement = Number(_loc3_[9]);
         _loc2_.lastConnection = Number(_loc3_[10]);
         _loc2_.isLocalPlayer = _loc2_.id == this.api.datacenter.Player.ID;
         _loc5_ = _loc3_[11].split(",");
         _loc6_ = _loc3_[12];
         _loc2_.color1 = _loc5_[0];
         _loc2_.color2 = _loc5_[1];
         _loc2_.color3 = _loc5_[2];
         this.api.kernel.CharactersManager.setSpriteAccessories(_loc2_,_loc6_);
         if(_loc8_)
         {
            _loc4_.members.push(_loc2_);
         }
         else
         {
            _loc5_ = _loc4_.members.findFirstItem("id",_loc2_.id);
            if(_loc5_.index != -1)
            {
               _loc4_.members.updateItem(_loc5_.index,_loc2_);
            }
            else
            {
               _loc4_.members.push(_loc2_);
            }
         }
         _loc4_.members.sortOn("rankOrder",Array.NUMERIC);
      }
      else
      {
         _loc6_ = _loc4_.members.findFirstItem("id",_loc2_.id);
         if(_loc6_.index != -1)
         {
            _loc4_.members.removeItems(_loc6_.index,1);
         }
      }
      _loc7_ += 1;
   }
   _loc4_.setMembers();
};
_loc1.onInfosTaxCollectorsMovement = function(_loc2_)
{
   var _loc15_;
   var _loc14_;
   var _loc6_;
   var _loc7_;
   var _loc5_;
   var _loc3_;
   var _loc11_;
   var _loc8_;
   var _loc13_;
   var _loc12_;
   var _loc4_;
   var _loc9_;
   var _loc10_;
   if(_loc2_.length == 0)
   {
      this.api.datacenter.Player.guildInfos.setNoTaxCollectors();
   }
   else
   {
      _loc15_ = _loc2_.charAt(0) == "+";
      _loc14_ = _loc2_.substr(1).split("|");
      _loc6_ = this.api.datacenter.Player.guildInfos;
      _loc7_ = 0;
      while(_loc7_ < _loc14_.length)
      {
         _loc5_ = _loc14_[_loc7_].split(";");
         _loc3_ = new Object();
         _loc3_.id = _global.parseInt(_loc5_[0],36);
         if(_loc15_)
         {
            _loc11_ = _loc6_.taxCollectors.length == 0;
            _loc8_ = _global.parseInt(_loc5_[2],36);
            _loc13_ = this.api.lang.getMapText(_loc8_).x;
            _loc12_ = this.api.lang.getMapText(_loc8_).y;
            _loc3_.name = this.api.lang.getFullNameText(_loc5_[1].split(","));
            _loc3_.position = this.api.kernel.MapsServersManager.getMapName(_loc8_) + " (" + _loc13_ + ", " + _loc12_ + ")";
            _loc3_.state = Number(_loc5_[3]);
            _loc3_.timer = Number(_loc5_[4]);
            _loc3_.maxTimer = Number(_loc5_[5]);
            _loc3_.timerReference = 5463;
            _loc3_.maxPlayerCount = Number(_loc5_[6]);
            _loc4_ = _loc5_[1].split(",");
            if(_loc4_.length != 2)
            {
               _loc3_.showMoreInfo = true;
               _loc3_.callerName = _loc4_[2].split("~")[0] == "" ? "?" : _loc4_[2].split("~")[0];
               _loc3_.startDate = _global.parseInt(_loc4_[3],10);
               _loc3_.lastHarvesterName = _loc4_[4] == "" ? "?" : _loc4_[4];
               _loc3_.lastHarvestDate = _global.parseInt(_loc4_[5],10);
               _loc3_.nextHarvestDate = _global.parseInt(_loc4_[6],10);
               _loc3_.isMine = _loc4_[2].split("~")[1] == "" ? false : _loc4_[2].split("~")[1] == "true";
            }
            else
            {
               _loc3_.showMoreInfo = false;
               _loc3_.callerName = "?";
               _loc3_.startDate = -1;
               _loc3_.lastHarvesterName = "?";
               _loc3_.lastHarvestDate = -1;
               _loc3_.nextHarvestDate = -1;
               _loc3_.isMine = false;
            }
            _loc3_.players = new ank["\x1e\n\x07"]["\x0f\x01"]();
            _loc3_.attackers = new ank["\x1e\n\x07"]["\x0f\x01"]();
            if(_loc11_)
            {
               _loc6_.taxCollectors.push(_loc3_);
            }
            else
            {
               _loc9_ = _loc6_.taxCollectors.findFirstItem("id",_loc3_.id);
               if(_loc9_.index != -1)
               {
                  _loc6_.taxCollectors.updateItem(_loc9_.index,_loc3_);
               }
               else
               {
                  _loc6_.taxCollectors.push(_loc3_);
               }
            }
         }
         else
         {
            _loc10_ = _loc6_.taxCollectors.findFirstItem("id",_loc3_.id);
            if(_loc10_.index != -1)
            {
               _loc6_.taxCollectors.removeItems(_loc10_.index,1);
            }
         }
         _loc7_ += 1;
      }
      _loc6_.setTaxCollectors();
   }
};
_loc1 = dofus["\r\x14"].gapi.controls["\x1e\x0b\f"].TaxCollectorsViewerItem.prototype;
_loc1.init = function()
{
   super.init(false);
   this._mcFight._visible = false;
   this._mcEnterFight._visible = false;
   this._mcCollect._visible = false;
   this._btnState._visible = false;
   this._btnAttackers.enabled = false;
   this._lblAttackersCount._visible = false;
   this._mcOwnCollector._visible = false;
};
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   this._oItem.players.removeEventListener("modelChanged",this);
   this._oItem.attackers.removeEventListener("modelChanged",this);
   this._oItem = _loc4_;
   var _loc4_;
   var _loc5_;
   if(_loc2_)
   {
      this._lblName.text = _loc4_.name;
      this._lblPosition.text = _loc4_.position;
      this.showStateIcon();
      this.showOwnCollectorIcon(this._oItem.isMine);
      if(!_global.isNaN(_loc4_.timer))
      {
         _loc4_ = _loc4_.timer - (6663 - _loc4_.timerReference);
         _loc5_ = _loc4_.maxTimer / 1000;
         if(_loc4_ > 0)
         {
            this._vcTimer.startTimer(_loc4_ / 1000,_loc5_);
            this.showButtonsJoin(_global.isNaN(_loc4_.maxPlayerCount) ? 0 : _loc4_.maxPlayerCount);
         }
         else
         {
            this._vcTimer.stopTimer();
            this.showButtonsJoin(0);
         }
      }
      else
      {
         this._vcTimer.stopTimer();
         this.showButtonsJoin(0);
      }
      _loc4_.players.addEventListener("modelChanged",this);
      _loc4_.attackers.addEventListener("modelChanged",this);
      this._btnAttackers.enabled = true;
      this.updateAttackers();
      this.updatePlayers();
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblPosition.text = "";
      this._mcFight._visible = false;
      this._mcEnterFight._visible = false;
      this._mcCollect._visible = false;
      this._btnState._visible = false;
      this._mcOwnCollector._visible = false;
      this.hideButtonsJoin();
      this._vcTimer.stopTimer();
      this._btnAttackers.enabled = false;
      this._lblAttackersCount._visible = false;
   }
   else
   {
      this.hideButtonsJoin();
      this._vcTimer.stopTimer();
   }
};
_loc1.showOwnCollectorIcon = function(_loc2_)
{
   this._mcOwnCollector._visible = _loc2_;
   this._mcOwnCollectorHitbox._visible = _loc2_;
   if(_loc2_)
   {
      var ref = this;
      this._mcOwnCollectorHitbox.onRollOut = function()
      {
         ref.out({target:this});
      };
      this._mcOwnCollectorHitbox.onRollOver = function()
      {
         ref.over({target:this});
      };
      this._mcOwnCollectorHitbox.onPress = function()
      {
         ref.onPress({target:this});
      };
   }
};
_loc1.over = function(_loc2_)
{
   var _loc7_;
   var _loc5_;
   var _loc2_;
   var _loc3_;
   var _loc4_;
   var _loc6_;
   var _loc15_;
   var _loc11_;
   var _loc12_;
   var _loc10_;
   var _loc13_;
   var _loc16_;
   var _loc14_;
   var _loc9_;
   switch(_loc2_.target._name)
   {
      case "_btnAttackers":
         if(!this._lblAttackersCount._visible)
         {
            return undefined;
         }
         _loc7_ = this._oItem.attackers.length;
         if(_loc7_ == 0)
         {
            return undefined;
         }
         _loc5_ = new String();
         _loc2_ = 0;
         while(_loc2_ < _loc7_)
         {
            _loc3_ = this._oItem.attackers[_loc2_];
            _loc5_ += "\n" + _loc3_.name + " (" + _loc3_.level + ")";
            _loc2_ += 1;
         }
         this._mcList.gapi.showTooltip(this._mcList.gapi.api.lang.getText("ATTACKERS") + " : " + _loc5_,_loc2_.target,40);
         return;
         break;
      case "_mcOwnCollectorHitbox":
         this._mcList.gapi.showTooltip(this._mcList.gapi.api.lang.getText("TAXCOLLECTOR_IS_MINE"),_loc2_.target,40);
         return;
      case "_btnState":
         _loc4_ = new String();
         switch(this._oItem.state)
         {
            case 0:
               _loc4_ = this._mcList.gapi.api.lang.getText("TAX_IN_COLLECT");
               break;
            case 1:
               _loc4_ = this._mcList.gapi.api.lang.getText("TAX_IN_ENTERFIGHT");
               break;
            case 2:
               _loc4_ = this._mcList.gapi.api.lang.getText("TAX_IN_FIGHT");
         }
         if(this._oItem.showMoreInfo)
         {
            if(this._oItem.callerName != "?")
            {
               _loc4_ += "\n" + this._mcList.gapi.api.lang.getText("OWNER_WORD") + " : " + this._oItem.callerName;
            }
            _loc6_ = new Date(this._oItem.startDate);
            if(_loc6_.getFullYear() != 1970)
            {
               _loc4_ += "\n" + this._mcList.gapi.api.lang.getText("TAX_COLLECTOR_START_DATE",[_loc6_.getDay(),_loc6_.getMonth() + 1,_loc6_.getFullYear() + this._mcList.gapi.api.lang.getTimeZoneText().z,_loc6_.getHours(),_loc6_.getMinutes()]);
            }
            if(this._oItem.lastHarvesterName != "?")
            {
               _loc4_ += "\n" + this._mcList.gapi.api.lang.getText("LAST_HARVESTER_NAME") + " : " + this._oItem.lastHarvesterName;
            }
            _loc6_ = new Date(this._oItem.lastHarvestDate);
            if(_loc6_.getFullYear() != 1970)
            {
               _loc4_ += "\n" + this._mcList.gapi.api.lang.getText("TAX_COLLECTOR_LAST_DATE",[_loc6_.getDay(),_loc6_.getMonth() + 1,_loc6_.getFullYear() + this._mcList.gapi.api.lang.getTimeZoneText().z,_loc6_.getHours(),_loc6_.getMinutes()]);
            }
            _loc15_ = new Date();
            _loc11_ = this._oItem.nextHarvestDate - _loc15_.valueOf();
            if(_loc11_ <= 0)
            {
               _loc4_ += "\n" + this._mcList.gapi.api.lang.getText("TAX_COLLECTOR_CAN_BE_HARVEST");
            }
            else
            {
               _loc12_ = Math.floor(_loc11_ / 1000 / 60 / 60);
               _loc10_ = Math.floor(_loc11_ / 1000 / 60 - _loc12_ * 60);
               _loc13_ = _loc12_ + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this._mcList.gapi.api.lang.getText("HOURS"),"m",_loc12_ == 1);
               if(_loc10_ == 0)
               {
                  _loc4_ += "\n" + this._mcList.gapi.api.lang.getText("TAX_COLLECTOR_CAN_BE_HARVEST_IN",[_loc13_,""]);
               }
               else
               {
                  _loc16_ = this._mcList.gapi.api.lang.getText("AND") + " ";
                  _loc14_ = _loc10_ + " " + ank["\x1e\n\x07"]["\x1e\x16\x19"].combine(this._mcList.gapi.api.lang.getText("MINUTES"),"m",_loc10_ == 1);
                  _loc4_ += "\n" + this._mcList.gapi.api.lang.getText("TAX_COLLECTOR_CAN_BE_HARVEST_IN",[_loc13_,_loc16_ + _loc14_]);
               }
            }
         }
         this._mcList.gapi.showTooltip(_loc4_,_loc2_.target,40);
         return;
      default:
         _loc9_ = _loc2_.target.params.player;
         if(_loc9_ != undefined)
         {
            this._mcList.gapi.showTooltip(_loc9_.name + " (" + _loc9_.level + ")",_loc2_.target,-20);
            return;
         }
         return;
   }
};
_loc1.out = function(_loc2_)
{
   this._mcList.gapi.hideTooltip();
};
_loc1 = dofus.datacenter.Mount.prototype;
_loc1.__get__iconFile = function()
{
   return dofus.Constants.GUILDS_MINI_PATH + this._lang.g + ".swf";
};
_loc1.addProperty("iconFile",_loc1.__get__iconFile,function()
{
}
);
_loc1 = dofus.datacenter.ItemSet.prototype;
_loc1.__get__aefects = function()
{
   return this._aEffects;
};
_loc1.__set__aefects = function(value)
{
   this._aEffects = value;
};
_loc1.addProperty("aeffects",_loc1.__get__aefects,_loc1.__set__aefects);
_loc1 = dofus["\r\x14"].gapi.controls["\r\r"].MountParksViewerItem.prototype;
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   this._bUsed = _loc2_;
   var _loc6_;
   var _loc5_;
   var _loc3_;
   var _loc2_;
   if(_loc2_)
   {
      this._oItem = _loc4_;
      _loc6_ = this.api.lang.getMapText(Number(_loc4_.map)).x;
      _loc5_ = this.api.lang.getMapText(Number(_loc4_.map)).y;
      this._lblSubArea.text = this.api.kernel.MapsServersManager.getMapName(_loc4_.map) + " (" + _loc6_ + ", " + _loc5_ + ")";
      _loc4_.sortLocalisation = this._lblSubArea.text;
      this._lblItems.text = this.api.lang.getText("MOUNTPARKS_CURRENT_ITEMS",[_loc4_.items,_loc4_.maxItems]);
      this._lblMounts.text = this.api.lang.getText("MOUNTPARKS_CURRENT_MOUNTS",[_loc4_.mounts.length,_loc4_.size]);
      _loc4_.sortMounts = _loc4_.mounts.length;
      this._btnTeleport._visible = true;
      this._btnTeleport.onRollOver = function()
      {
         this._parent.gapi.showTooltip(this._parent.api.lang.getText("GUILD_FARM_TELEPORT_TOOLTIP"),this,-20);
      };
      this._btnTeleport.onRollOut = function()
      {
         this._parent.gapi.hideTooltip();
      };
      _loc3_ = 0;
      while(_loc3_ < 20)
      {
         _loc2_ = this["_ctr" + _loc3_];
         if(_loc3_ < _loc4_.size)
         {
            _loc2_.backgroundRenderer = _loc4_.mounts[_loc3_].ownerName == this.api.datacenter.Player.Name ? "UI_MyMountGridBackground" : "UI_MountGridBackground";
            _loc2_.contentData = _loc4_.mounts[_loc3_];
            _loc2_.addEventListener("onContentLoaded",this);
            _loc2_.addEventListener("over",this);
            _loc2_.addEventListener("out",this);
            _loc2_.enabled = true;
            _loc2_._visible = true;
         }
         else
         {
            _loc2_._visible = false;
         }
         if(_loc4_.size < 11)
         {
            _loc2_._y = 11.5;
         }
         else if(_loc3_ < 10)
         {
            _loc2_._y = 1.5;
         }
         else
         {
            _loc2_._y = 21.5;
         }
         _loc3_ += 1;
      }
   }
   else
   {
      this._btnTeleport._visible = false;
      if(this._lblArea.text != undefined)
      {
         this._lblArea.text = "";
         this._lblSubArea.text = "";
         this._lblItems.text = "-";
         this._lblMounts.text = "";
      }
   }
};
_loc1.over = function(_loc2_)
{
   var _loc2_ = this._mcList._parent._parent.api;
   var _loc5_ = null;
   var _loc3_;
   if(_loc2_.target !== this._btnTeleport)
   {
      _loc3_ = _loc2_.target.contentData;
      _loc2_.ui.showTooltip(_loc3_ != undefined ? "<b>" + _loc3_.modelName + "</b> " + "<i>(" + _loc3_.name + ")</i> " + (_loc3_.sex == 0 ? "â™‚" : "â™€") + "\n" + _loc2_.lang.getText("OWNER_WORD") + " : " + "<b>" + _loc3_.ownerName + "</b>" : _loc2_.lang.getText("CUSTOM_SET_EMPTY_SLOT"),_loc2_.target,-30,{bXLimit:true,bYLimit:true});
   }
   else
   {
      _loc2_.ui.showTooltip(_loc2_.lang.getText("GUILD_FARM_TELEPORT_TOOLTIP"),_loc2_.target,-20);
   }
};
_loc1.applyRideColor = function(_loc2_, _loc3_, _loc4_)
{
   var _loc1_ = _loc4_.target.contentData["color" + _loc3_];
   if(_loc1_ == -1 || _loc1_ == undefined)
   {
      return undefined;
   }
   var _loc4_ = (_loc1_ & 0xFF0000) >> 16;
   var _loc5_ = (_loc1_ & 0xFF00) >> 8;
   var _loc6_ = _loc1_ & 0xFF;
   var _loc3_ = new Color(_loc2_);
   var _loc2_ = new Object();
   _loc2_ = {ra:0,ga:0,ba:0,rb:_loc4_,gb:_loc5_,bb:_loc6_};
   _loc3_.setTransform(_loc2_);
};
_loc1.onContentLoaded = function(oEvent)
{
   var ref = this;
   oEvent.content.applyRideColor = function(_loc2_, _loc3_, _loc4_)
   {
      ref.applyRideColor(_loc2_,_loc3_,oEvent);
   };
};
_loc1 = dofus["\r\x14"].gapi.controls.SpriteViewer.prototype;
_loc1.displayBackground = function(_loc2_)
{
   this.fondo._visible = _loc2_;
};
_loc1.__get__enableBackground = function()
{
   return this._bEnableBackground;
};
_loc1.__set__enableBackground = function(_loc2_)
{
   this._bEnableBackground = _loc2_;
   this.displayBackground(_loc2_);
};
_loc1.addProperty("enableBackground",_loc1.__get__enableBackground,_loc1.__set__enableBackground);
_loc1 = ank.gapi.controls.TextArea.prototype;
_loc1.setFocus = function(bSelectAll)
{
   if(this._tText == undefined)
   {
      this.addToQueue({object:this,method:function()
      {
         Selection.setFocus(this._tText);
      }});
   }
   else
   {
      Selection.setFocus(this._tText);
   }
   if(!bSelectAll)
   {
      Selection.setSelection(this._tText.length,this._tText.length);
   }
};
_loc1.setTextFieldProperties = function()
{
   if(this._tText != undefined)
   {
      if(this._bAutoHeight)
      {
         this._tText.autoSize = "left";
      }
      this._tText.wordWrap = this._bWordWrap ? true : false;
      this._tText.multiline = true;
      this._tText.selectable = this._bSelectable;
      this._tText.type = this._bEditable ? "input" : "dynamic";
      this._tText.html = this._bHTML;
      if(this._cssStyles != undefined)
      {
         this._tText.styleSheet = this._cssStyles;
         if(this._sText != undefined)
         {
            if(this._bHTML)
            {
               this._tText.htmlText = this._sText;
            }
            else
            {
               this._tText.text = this._sText;
            }
         }
      }
      else if(this._tfFormatter.font != undefined)
      {
         if(this._sText != undefined)
         {
            if(this._bHTML)
            {
               this._tText.htmlText = this._sText;
            }
            else
            {
               this._tText.text = this._sText;
            }
         }
         this._tText.setNewTextFormat(this._tfFormatter);
         this._tText.setTextFormat(this._tfFormatter);
      }
      this.onChanged();
   }
};
_loc1 = ank.gapi.controls.list.DefaultCellRenderer.prototype;
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   if(_loc2_)
   {
      this._lblText.text = _loc3_;
      if(_loc4_.icon != undefined)
      {
         this._lblText._x += 10;
         this.attachMovie("Loader","_ldrIcon",100,{_x:-5,_y:-5,_height:15,_width:15,contentPath:_loc4_.icon,centerContent:true,scaleContent:true});
      }
      else
      {
         this._ldrIcon.removeMovieClip();
         this._lblText._x = 0;
      }
   }
   else if(this._lblText.text != undefined)
   {
      this._lblText.text = "";
   }
};
_loc1 = ank.gapi.controls.ComboBox.prototype;
_loc1.getSelectedItemText = function()
{
   var _loc2_ = this.selectedItem;
   if(typeof _loc2_ == "string")
   {
      return String(_loc2_);
   }
   if(_loc2_.label != undefined)
   {
      return _loc2_;
   }
   return "";
};
_loc1.arrange = function()
{
   var _loc2_ = Math.max(this.__width - this._nButtonWidth - this._nLabelLeftMargin - this._nLabelRightMargin,0);
   var _loc3_ = Math.max(this.__height - this._nLabelTopMargin - this._nLabelBottomMargin,0);
   this._lblCombo.setSize(_loc2_,_loc3_);
   this._btnOpen.setSize(this._nButtonWidth,this.__height);
   this._lblCombo._y = this._nLabelTopMargin;
   if(this._bButtonLeft)
   {
      this._lblCombo._x = this._nButtonWidth + this._nLabelLeftMargin;
   }
   else
   {
      this._lblCombo._x = this._nLabelLeftMargin;
      this._btnOpen._x = this.__width - this._nButtonWidth;
   }
   this._nOriginalLblX = this._lblCombo._x;
   this._mcBack.setSize(this.__width,this.__height,true);
   this.calculateListSize();
};
_loc1.setLabel = function(oLabel)
{
   this._lblCombo.text = oLabel.label == undefined ? "" : oLabel.label;
   if(oLabel.icon != undefined)
   {
      this._lblCombo._x = this._nOriginalLblX + 15;
      this.attachMovie("Loader","_ldrIcon",100,{_x:-4,_y:-5,_height:15,_width:15,contentPath:"GuildMemberCrown",centerContent:true,scaleContent:true});
   }
   else
   {
      this._lblCombo._x = this._nOriginalLblX;
      this._ldrIcon.removeMovieClip();
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.GuildMemberInfos.prototype;
_loc1.initializeSprite = function()
{
   var _loc2_ = this._oMember;
   if(_loc2_ == undefined)
   {
      return undefined;
   }
   var _loc3_ = new ank.battlefield.datacenter["\x1e\x0e\x10"]("viewer",ank.battlefield.mc["\x1e\x0e\x10"],dofus.Constants.CLIPS_PERSOS_PATH + _loc2_.gfx + ".swf",undefined,5);
   _loc3_.color1 = _loc2_.color1;
   _loc3_.color2 = _loc2_.color2;
   _loc3_.color3 = _loc2_.color3;
   _loc3_.accessories = _loc2_.accessories;
   this._svCharacterViewer.spriteData = _loc3_;
   this._svCharacterViewer.useSingleLoader = true;
   this._svCharacterViewer.noDelay = true;
   this._svCharacterViewer.spriteAnims = ["emoteStatic14R","emoteStatic14L"];
};
_loc1.zoomSprite = function(_loc2_)
{
   if(_loc2_)
   {
      this._mcBackground._width = this._mcBackground._height = 70;
      this._svCharacterViewer.zoom = 130;
      this._svCharacterViewer._y = 14.15;
      this._svCharacterViewer._x = 200.75;
      this._mcMask._width = this._mcMask._height = 70;
      this._mcInteraction._width = this._mcInteraction._height = 70;
   }
   else
   {
      this._mcBackground._width = this._mcBackground._height = 50;
      this._svCharacterViewer.zoom = 100;
      this._svCharacterViewer._y = -3.25;
      this._svCharacterViewer._x = 190.75;
      this._mcMask._width = this._mcMask._height = 50;
      this._mcInteraction._width = this._mcInteraction._height = 50;
      this._svCharacterViewer.playNextAnim(0);
   }
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   this._btnCancel.addEventListener("click",this);
   this._btnModify.addEventListener("click",this);
   this._btnPercentXP.addEventListener("click",this);
   this._cbRanks.addEventListener("itemSelected",this);
   this._btnRBoost.addEventListener("click",this);
   this._btnRRights.addEventListener("click",this);
   this._btnRInvit.addEventListener("click",this);
   this._btnRBann.addEventListener("click",this);
   this._btnRPercentXP.addEventListener("click",this);
   this._btnROwnPercentXP.addEventListener("click",this);
   this._btnRRank.addEventListener("click",this);
   this._btnRHireTax.addEventListener("click",this);
   this._btnRDefendTax.addEventListener("click",this);
   this._btnEditRank.addEventListener("click",this);
   this._btnRCollect.addEventListener("click",this);
   this._bntRCanUseMountPark.addEventListener("click",this);
   this._btnRCanArrangeMountPark.addEventListener("click",this);
   this._btnRCanManageOtherMount.addEventListener("click",this);
   var _loc2_ = this.api.datacenter.Player.guildInfos.playerRights;
   this._btnEditRank._visible = _loc2_.canManageRights;
};
_loc1.click = function(_loc2_)
{
   var _loc2_;
   switch(_loc2_.target._name)
   {
      case "_btnCancel":
      case "_btnClose":
         this.unloadThis();
         break;
      case "_btnEditRank":
         this.api.ui.loadUIAutoHideComponent("GuildPerso","GuildPerso",{rank:this.api.datacenter.Player.guildInfos.rankperso});
         break;
      case "_btnModify":
         if(this._oMember.rank == this._oMemberClone.rank && (this._oMember.percentxp == this._oMemberClone.percentxp && this._oMember.rights.value == this._oMemberClone.rights.value))
         {
            return undefined;
         }
         this._oMember.rank = this._oMemberClone.rank;
         this._oMember.rankOrder = this._oMemberClone.rankOrder;
         this._oMember.percentxp = this._oMemberClone.percentxp;
         this._oMember.rights.value = this._oMemberClone.rights.value;
         this.api.network.Guild.changeMemberProfil(this._oMember);
         this.api.datacenter.Player.guildInfos.setMembers();
         this.unloadThis();
         break;
      case "_btnPercentXP":
         _loc2_ = this.gapi.loadUIComponent("PopupQuantity","PopupQuantity",{value:this._oMember.percentxp,max:90,min:0});
         _loc2_.addEventListener("validate",this);
         break;
      case "_btnRBoost":
         if(this._btnRBoost.selected)
         {
            this._oMemberClone.rights.value |= 2;
         }
         else
         {
            this._oMemberClone.rights.value ^= 2;
         }
         break;
      case "_btnRRights":
         if(this._btnRRights.selected)
         {
            this._oMemberClone.rights.value |= 4;
         }
         else
         {
            this._oMemberClone.rights.value ^= 4;
         }
         break;
      case "_btnRInvit":
         if(this._btnRInvit.selected)
         {
            this._oMemberClone.rights.value |= 8;
         }
         else
         {
            this._oMemberClone.rights.value ^= 8;
         }
         break;
      case "_btnRBann":
         if(this._btnRBann.selected)
         {
            this._oMemberClone.rights.value |= 16;
         }
         else
         {
            this._oMemberClone.rights.value ^= 16;
         }
         break;
      case "_btnRPercentXP":
         if(this._btnRPercentXP.selected)
         {
            this._oMemberClone.rights.value |= 32;
         }
         else
         {
            this._oMemberClone.rights.value ^= 32;
         }
         break;
      case "_btnRRank":
         if(this._btnRRank.selected)
         {
            this._oMemberClone.rights.value |= 64;
         }
         else
         {
            this._oMemberClone.rights.value ^= 64;
         }
         break;
      case "_btnRHireTax":
         if(this._btnRHireTax.selected)
         {
            this._oMemberClone.rights.value |= 128;
         }
         else
         {
            this._oMemberClone.rights.value ^= 128;
         }
         break;
      case "_btnROwnPercentXP":
         if(this._btnROwnPercentXP.selected)
         {
            this._oMemberClone.rights.value |= 256;
         }
         else
         {
            this._oMemberClone.rights.value ^= 256;
         }
         break;
      case "_btnRCollect":
         if(this._btnRCollect.selected)
         {
            this._oMemberClone.rights.value |= 512;
         }
         else
         {
            this._oMemberClone.rights.value ^= 512;
         }
         break;
      case "_bntRCanUseMountPark":
         if(this._bntRCanUseMountPark.selected)
         {
            this._oMemberClone.rights.value |= 4096;
         }
         else
         {
            this._oMemberClone.rights.value ^= 4096;
         }
         break;
      case "_btnRCanArrangeMountPark":
         if(this._btnRCanArrangeMountPark.selected)
         {
            this._oMemberClone.rights.value |= 8192;
         }
         else
         {
            this._oMemberClone.rights.value ^= 8192;
         }
         break;
      case "_btnRCanManageOtherMount":
         if(this._btnRCanManageOtherMount.selected)
         {
            this._oMemberClone.rights.value |= 16384;
         }
         else
         {
            this._oMemberClone.rights.value ^= 16384;
         }
      default:
         return;
   }
};
_loc1.over = function(_loc2_)
{
   if(_loc0_ = _loc2_.target == this._mcInteraction)
   {
      this.zoomSprite(true);
   }
};
_loc1.out = function(_loc2_)
{
   if(_loc2_.target == this._mcInteraction)
   {
      this.zoomSprite(false);
   }
};
_loc1.ObtainRank = function(sData)
{
   var _loc3_ = "Empty";
   var _loc2_ = this.api.datacenter.Player.guildInfos.rankperso.split(";");
   for(_loc3_ in _loc2_)
   {
      if(sData == _loc2_[_loc3_].split(",")[0])
      {
         _loc3_ = _loc2_[_loc3_].split(",")[1];
         break;
      }
   }
   return _loc3_;
};
_loc1.updateData = function()
{
   this._mcInteraction.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._mcInteraction.onRollOut = function()
   {
      this._parent.out({target:this});
   };
   this._mcInteraction.onRelease = function()
   {
      this._parent.click({target:this});
   };
   if(this._svCharacterViewer.spriteData == undefined)
   {
      this.initializeSprite();
   }
   this._winBg.title = this._oMember.name + " (" + this.api.lang.getText("LEVEL_SMALL") + " " + this._oMember.level + ")";
   this._lblPercentXPValue.text = this._oMemberClone.percentxp + "%";
   var _loc10_ = this.api.datacenter.Player.guildInfos.playerRights;
   this._cbRanks.enabled = _loc10_.canManageRanks;
   this._btnPercentXP._visible = _loc10_.canManageXPContitribution || _loc10_.canManageOwnXPContitribution;
   var _loc5_ = this._oMemberClone.rights;
   this._btnRBoost.selected = _loc5_.canManageBoost;
   this._btnRRights.selected = _loc5_.canManageRights;
   this._btnRInvit.selected = _loc5_.canInvite;
   this._btnRBann.selected = _loc5_.canBann;
   this._btnRPercentXP.selected = _loc5_.canManageXPContitribution;
   this._btnRRank.selected = _loc5_.canManageRanks;
   this._btnRHireTax.selected = _loc5_.canHireTaxCollector;
   this._btnROwnPercentXP.selected = _loc5_.canManageOwnXPContitribution;
   this._btnRCollect.selected = _loc5_.canCollect;
   this._bntRCanUseMountPark.selected = _loc5_.canUseMountPark;
   this._btnRCanArrangeMountPark.selected = _loc5_.canArrangeMountPark;
   this._btnRCanManageOtherMount.selected = _loc5_.canManageOtherMount;
   var _loc7_ = _loc10_.canManageRights && !_loc5_.isBoss;
   this._btnRBoost.enabled = _loc7_;
   this._btnRRights.enabled = _loc7_;
   this._btnRInvit.enabled = _loc7_;
   this._btnRBann.enabled = _loc7_;
   this._btnRPercentXP.enabled = _loc7_;
   this._btnRRank.enabled = _loc7_;
   this._btnRHireTax.enabled = _loc7_;
   this._btnROwnPercentXP.enabled = _loc7_;
   this._btnRCollect.enabled = _loc7_;
   this._bntRCanUseMountPark.enabled = _loc7_;
   this._btnRCanArrangeMountPark.enabled = _loc7_;
   this._btnRCanManageOtherMount.enabled = _loc7_;
   this._btnModify.enabled = _loc10_.isBoss || (_loc10_.canManageRights || (_loc10_.canManageRanks || (_loc10_.canManageXPContitribution || _loc5_.canManageOwnXPContitribution)));
   var _loc3_;
   var _loc4_;
   var _loc6_;
   var _loc2_;
   if(_loc10_.canManageRanks)
   {
      this._cbRanks._visible = true;
      _loc3_ = this.api.lang.getRanks().slice();
      _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc3_.sortOn("o",Array.NUMERIC);
      if(this.api.datacenter.Player.guildInfos.playerRights.isBoss)
      {
         _loc6_ = this.ObtainRank(_loc3_[0].i) == "Empty" ? _loc3_[0].n : this.ObtainRank(_loc3_[0].i);
         _loc4_.push({label:_loc6_,id:_loc3_[0].i,icon:"GuildMemberCrown"});
         if(this._oMemberClone.rank == _loc3_[0].i)
         {
            this._cbRanks.selectedIndex = 0;
         }
      }
      _loc2_ = 1;
      while(_loc2_ < _loc3_.length)
      {
         _loc6_ = this.ObtainRank(_loc3_[_loc2_].i) == "Empty" ? _loc3_[_loc2_].n : this.ObtainRank(_loc3_[_loc2_].i);
         _loc4_.push({label:_loc6_,id:_loc3_[_loc2_].i});
         if(this._oMemberClone.rank == _loc3_[_loc2_].i)
         {
            this._cbRanks.selectedIndex = _loc4_.length - 1;
         }
         _loc2_ += 1;
      }
      this._cbRanks.dataProvider = _loc4_;
   }
   else
   {
      this._lblRankValue.text = this.api.lang.getRankInfos(this._oMemberClone.rank).n;
   }
};
_loc1 = dofus["\r\x14"].gapi.controls["\r\x0e"].GuildMembersViewerMember.prototype;
_loc1.ObtainRank = function(sData)
{
   var _loc3_ = "Empty";
   var _loc2_ = this._mcList.gapi.api.datacenter.Player.guildInfos.rankperso.split(";");
   for(_loc3_ in _loc2_)
   {
      if(sData == _loc2_[_loc3_].split(",")[0])
      {
         _loc3_ = _loc2_[_loc3_].split(",")[1];
         break;
      }
   }
   return _loc3_;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this._nOriginalLblX = this._lblRank._x;
};
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   var _loc3_;
   var _loc4_;
   if(_loc2_)
   {
      this._oItem = _loc4_;
      _loc3_ = this._mcList.gapi.api.datacenter.Player.guildInfos.playerRights;
      this._lblName.text = _loc4_.name;
      this._lblRank.text = this.ObtainRank(this._mcList.gapi.api.lang.getRankInfos(_loc4_.rank).i) == "Empty" ? this._mcList.gapi.api.lang.getRankInfos(_loc4_.rank).n : this.ObtainRank(this._mcList.gapi.api.lang.getRankInfos(_loc4_.rank).i);
      this._lblLevel.text = _loc4_.level;
      this._lblPercentXP.text = _loc4_.percentxp + "%";
      this._lblWinXP.text = _loc4_.winxp;
      this._btnBann._visible = _loc4_.isLocalPlayer || _loc3_.canBann;
      this._btnProfil._visible = _loc4_.isLocalPlayer || (_loc3_.canManageRights || (_loc3_.canManageXPContitribution || _loc3_.canManageRanks));
      this._ldrGuild.contentPath = dofus.Constants.GUILDS_MINI_PATH + _loc4_.gfx + ".swf";
      this._mcFight._visible = _loc4_.state == 2;
      this._mcOffline._visible = _loc4_.state == 0;
      this._mcOver.hint = _loc4_.lastConnection;
      _loc4_ = _loc4_.rights.isBoss;
      if(_loc4_)
      {
         this._lblRank._x = this._nOriginalLblX + 15;
         this.attachMovie("Loader","_ldrIcon",100,{_x:this._nOriginalLblX - 8,_y:this._lblRank._y - 5,_height:15,_width:15,contentPath:"GuildMemberCrown",centerContent:true,scaleContent:true});
      }
      else
      {
         this._ldrIcon.removeMovieClip();
         this._lblRank._x = this._nOriginalLblX;
      }
      this._ldrAlignement.contentPath = dofus.Constants.ALIGNMENTS_MINI_PATH + _loc4_.alignement + ".swf";
   }
   else if(this._lblName.text != undefined)
   {
      this._lblName.text = "";
      this._lblRank.text = "";
      this._lblLevel.text = "";
      this._lblPercentXP.text = "";
      this._lblWinXP.text = "";
      this._btnBann._visible = false;
      this._btnProfil._visible = false;
      this._ldrGuild.contentPath = "";
      this._ldrAlignement.contentPath = "";
      this._mcFight._visible = false;
      this._mcOffline._visible = false;
      delete this._mcOver.onRollOver;
      delete this._mcOver.onRollOut;
   }
};
_loc1 = dofus.datacenter["\r\x0f"].prototype;
_loc1.setGeneralInfos = function(_loc2_, _loc3_, _loc4_, _loc5_, _loc6_, _loc7_)
{
   this._bValid = _loc2_;
   this._nLevel = _loc3_;
   this._nXPMin = _loc4_;
   this._nXP = _loc5_;
   this._nXPMax = _loc6_;
   this._sPriceEmblem = _loc7_;
   this.dispatchEvent({type:"modelChanged",eventName:"general"});
};
_loc1.setInformations = function(sInfos, sInfosMember, nInfosLastModification)
{
   this._sInfos = sInfos;
   this._sInfosMember = sInfosMember;
   this._nInfosLastModification = nInfosLastModification;
   this.dispatchEvent({type:"modelChanged",eventName:"informations"});
};
_loc1.setNote = function(sNote, sNoteMember, nNoteLastModification)
{
   this._sNote = sNote;
   this._sNoteMember = sNoteMember;
   this._nNoteLastModification = nNoteLastModification;
   this.dispatchEvent({type:"modelChanged",eventName:"note"});
};
_loc1.setRankHistory = function(_loc2_, _loc3_)
{
   this._sRanking = _loc2_;
   this._sLogs = _loc3_;
   this.dispatchEvent({type:"modelChanged",eventName:"infosUpdateRankHistory"});
};
_loc1.setBoostsStatsNew = function(_loc2_, _loc3_, _loc4_, _loc5_)
{
   this._sKamas = _loc2_;
   this._sOgrinas = _loc3_;
   this._boostStat = _loc4_;
   this._taxtShopStats = _loc5_;
   this.dispatchEvent({type:"modelChanged",eventName:"infosUpdateBoost"});
};
_loc1.__set__logs = function(sData)
{
   this._sLogs = sData;
};
_loc1.__set__ranking = function(sData)
{
   this._sRanking = sData;
};
_loc1.__get__logs = function()
{
   return this._sLogs;
};
_loc1.__get__ranking = function()
{
   return this._sRanking;
};
_loc1.__set__RankPerso = function(sData)
{
   this.RankPerso = sData;
};
_loc1.__set__ogrinas = function(sData)
{
   this._sOgrinas = sData;
};
_loc1.__set__kamas = function(sData)
{
   this._sKamas = sData;
};
_loc1.__set__booststats = function(sData)
{
   this._boostStat = sData;
};
_loc1.__set__taxtShopStats = function(sData)
{
   this._taxtShopStats = sData;
};
_loc1.__get__ogrinas = function()
{
   return this._sOgrinas;
};
_loc1.__get__kamas = function()
{
   return this._sKamas;
};
_loc1.__get__booststats = function()
{
   return this._boostStat;
};
_loc1.__get__taxtShopStats = function()
{
   return this._taxtShopStats;
};
_loc1.__set__infos = function(sData)
{
   this._sInfos = sData;
};
_loc1.__get__infos = function()
{
   return this._sInfos;
};
_loc1.__set__infosFormatedLastModification = function(sData)
{
   this._nInfosLastModification = sData;
};
_loc1.__get__infosFormatedLastModification = function()
{
   return this._sInfosMember;
};
_loc1.__set__infosMember = function(sData)
{
   this._sInfosMember = sData;
};
_loc1.__get__infosMember = function()
{
   return this._nInfosLastModification;
};
_loc1.__set__infos = function(sData)
{
   this._sInfos = sData;
};
_loc1.__get__infos = function()
{
   return this._sInfos;
};
_loc1.__set__infosFormatedLastModification = function(sData)
{
   this._nInfosLastModification = sData;
};
_loc1.__get__infosFormatedLastModification = function()
{
   return this._sInfosMember;
};
_loc1.__set__infosMember = function(sData)
{
   this._sInfosMember = sData;
};
_loc1.__get__infosMember = function()
{
   return this._nInfosLastModification;
};
_loc1.__set__note = function(sData)
{
   this._sNote = sData;
};
_loc1.__get__note = function()
{
   return this._sNote;
};
_loc1.__set__noteMember = function(sData)
{
   this._sNoteMember = sData;
};
_loc1.__get__noteMember = function()
{
   return this._sNoteMember;
};
_loc1.__set__noteFormatedLastModification = function(sData)
{
   this._nNoteLastModification = sData;
};
_loc1.__get__noteFormatedLastModification = function()
{
   return this._nNoteLastModification;
};
_loc1.__set__priceEmblem = function(sData)
{
   this._sPriceEmblem = sData;
};
_loc1.__get__priceEmblem = function()
{
   return this._sPriceEmblem;
};
_loc1.addProperty("rankperso",_loc1.__get__RankPerso,_loc1.__set__RankPerso);
_loc1.addProperty("kamasBonus",_loc1.__get__kamas,_loc1.__set__kamas);
_loc1.addProperty("ogrinasBonus",_loc1.__get__ogrinas,_loc1.__set__ogrinas);
_loc1.addProperty("boostStatsBonus",_loc1.__get__booststats,_loc1.__set__booststats);
_loc1.addProperty("taxtShopBonus",_loc1.__get__taxtShopStats,_loc1.__set__taxtShopStats);
_loc1.addProperty("logs",_loc1.__get__logs,_loc1.__set__logs);
_loc1.addProperty("ranking",_loc1.__get__ranking,_loc1.__set__ranking);
_loc1.addProperty("infos",_loc1.__get__infos,_loc1.__set__infos);
_loc1.addProperty("infosFormatedLastModification",_loc1.__get__infosFormatedLastModification,_loc1.__set__infosFormatedLastModification);
_loc1.addProperty("infosMember",_loc1.__get__infosMember,_loc1.__set__infosMember);
_loc1.addProperty("note",_loc1.__get__note,_loc1.__set__note);
_loc1.addProperty("noteFormatedLastModification",_loc1.__get__noteFormatedLastModification,_loc1.__set__noteFormatedLastModification);
_loc1.addProperty("noteMember",_loc1.__get__noteMember,_loc1.__set__noteMember);
_loc1.addProperty("priceEmblem",_loc1.__get__priceEmblem,_loc1.__set__priceEmblem);
_loc1.RankPerso = "";
_loc1 = dofus["\r\x14"].gapi.ui.MainMenu.prototype;
_loc1.setQuitButtonStatus = function()
{
   this._btnQuit.enabled = this._sQuitMode != "no";
   if(!this.api.datacenter.Player.subscriber && !this.api.datacenter.Basics.aks_is_free_community)
   {
      this._bBackgroundMoved = true;
      this._btnSubscribe._visible = true;
   }
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.ui.MainMenu.CLASS_NAME);
   this._btnSubscribe._visible = false;
};
_loc1.updateSubscribeButton = function()
{
   if(!this.api.datacenter.Player.subscriber && !this.api.datacenter.Basics.aks_is_free_community)
   {
      if(!this._bBackgroundMoved)
      {
         this._bBackgroundMoved = true;
      }
      this._btnSubscribe._visible = true;
   }
   if(this._bBackgroundMoved)
   {
      this._bBackgroundMoved = false;
   }
   this._btnSubscribe._visible = false;
};
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnQuit:
         if(this._sQuitMode == "quit")
         {
            this.api.kernel.quit(false);
         }
         else if(this._sQuitMode == "menu")
         {
            this.gapi.loadUIComponent("AskMainMenu","AskMainMenu");
         }
         break;
      case this._btnOptions:
         this.gapi.loadUIComponent("Options","Options",{_y:(this.gapi.screenHeight != 432 ? 0 : -50)},{bAlwaysOnTop:true});
         break;
      case this._btnCalidad:
         this.gapi.loadUIComponent("Calidad","Calidad");
         break;
      case this._btnHelp:
         if(this.api.ui.getUIComponent("Banner") != undefined)
         {
            this.gapi.loadUIComponent("KnownledgeBase","KnownledgeBase");
         }
         else
         {
            _root.getURL(this.api.lang.getConfigText("TUTORIAL_FILE"),"_blank");
         }
         break;
      case this._btnSubscribe:
         this.getURL("https://dofus.com/","_blank");
         break;
      case this._btnBugs:
         this.getURL("https://discord.gg/dhwSsT4Gbf","_blank");
      default:
         return;
   }
};
_loc1.over = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._btnQuit:
         this.api.ui.showTooltip(this.api.lang.getText("MAIN_MENU_QUIT"),oEvent.target,20,{bXLimit:true,bYLimit:true});
         break;
      case this._btnOptions:
         this.api.ui.showTooltip(this.api.lang.getText("MAIN_MENU_OPTIONS"),oEvent.target,20,{bXLimit:true,bYLimit:true});
         break;
      case this._btnHelp:
         if(this.api.ui.getUIComponent("Banner") != undefined)
         {
            this.api.ui.showTooltip(this.api.lang.getText("KB_TITLE"),oEvent.target,20,{bXLimit:true,bYLimit:true});
         }
         else
         {
            this.api.ui.showTooltip(this.api.lang.getText("MAIN_MENU_HELP"),oEvent.target,20,{bXLimit:true,bYLimit:true});
         }
         break;
      case this._btnBugs:
         this.api.ui.showTooltip(this.api.lang.getText("MAIN_MENU_DISCORD"),oEvent.target,20,{bXLimit:true,bYLimit:true});
         break;
      case this._btnCalidad:
         this.api.ui.showTooltip(this.api.lang.getText("MAIN_MENU_CALIDAD"),oEvent.target,20,{bXLimit:true,bYLimit:true});
         break;
      case this._btnSubscribe:
         this.api.ui.showTooltip(this.api.lang.getText("MAIN_MENU_SUBSCRIBE"),oEvent.target,20,{bXLimit:true,bYLimit:true});
      default:
         return;
   }
};
_loc1 = dofus["\x0b\b"].EffectsManager.prototype;
_loc1.addEffect = function(_loc2_)
{
   var _loc4_ = 0;
   var _loc3_;
   while(_loc4_ < this._aEffects.length)
   {
      _loc3_ = this._aEffects[_loc4_];
      if(_loc3_.spellID == _loc2_.spellID && (_loc3_.type == _loc2_.type && _loc3_.remainingTurn == _loc2_.remainingTurn))
      {
         _loc3_.param1 += _loc2_.param1;
         return undefined;
      }
      _loc4_ += 1;
   }
   this._aEffects.push(_loc2_);
   if(_global.API.ui.getUIComponent("PlayerInfos") != undefined)
   {
      _global.API.ui.getUIComponent("PlayerInfos").updateOnTime();
   }
};
_loc1.terminateAllEffects = function()
{
   var _loc3_ = this._aEffects.length;
   var _loc4_;
   while(true)
   {
      _loc3_ -= 1;
      if(_loc3_ < 0)
      {
         break;
      }
      _loc4_ = this._aEffects[_loc3_];
      this._aEffects.splice(_loc3_,_loc3_ + 1);
   }
   if(_global.API.ui.getUIComponent("PlayerInfos") != undefined)
   {
      _global.API.ui.getUIComponent("PlayerInfos").updateOnTime();
   }
};
_loc1.nextTurn = function()
{
   var _loc3_ = this._aEffects.length;
   var _loc4_;
   while(true)
   {
      _loc3_ -= 1;
      if(_loc3_ < 0)
      {
         break;
      }
      _loc4_ = this._aEffects[_loc3_];
      _loc4_.remainingTurn--;
      if(_loc4_.remainingTurn <= 0)
      {
         this._aEffects.splice(_loc3_,1);
      }
   }
   if(_global.API.ui.getUIComponent("PlayerInfos") != undefined)
   {
      _global.API.ui.getUIComponent("PlayerInfos").updateOnTime();
   }
};
_loc1.removeEffectsByCasterID = function(sCasterID)
{
   if(sCasterID == undefined)
   {
      return undefined;
   }
   var _loc3_ = this._aEffects.length;
   var _loc4_;
   while(true)
   {
      _loc3_ -= 1;
      if(_loc3_ < 0)
      {
         break;
      }
      _loc4_ = this._aEffects[_loc3_];
      if(_loc4_.sCasterID == sCasterID)
      {
         this._aEffects.splice(_loc3_,1);
      }
   }
   if(_global.API.ui.getUIComponent("PlayerInfos") != undefined)
   {
      _global.API.ui.getUIComponent("PlayerInfos").updateOnTime();
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.PlayerInfos.prototype;
_loc1.updateOnTime = function()
{
   if(this._oData != undefined)
   {
      this._lstEffects.dataProvider = null;
      this._winBackground.title = this.api.lang.getText("EFFECTS") + " " + this._oData.name + " (" + this.api.lang.getText("LEVEL_SMALL") + this._oData.Level + ")";
      this._lstEffects.dataProvider = this._oData.EffectsManager.getEffects();
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.BigStoreSearch.prototype;
_loc1.onSearchResult = function(bSuccess)
{
   if(bSuccess)
   {
      this.api.ui.unloadUIComponent("BigStoreSearch");
   }
   else
   {
      this.api.kernel.showMessage(this.api.lang.getText("BIGSTORE"),this.api.lang.getText("ITEM_NOT_IN_BIGSTORE"),"ERROR_BOX");
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.Buff.prototype;
_loc1.addListeners = function()
{
   var _loc2_ = 20;
   var _loc4_;
   while(_loc2_ <= dofus["\r\x14"].gapi.ui.Buff.LAST_CONTAINER)
   {
      _loc4_ = this["_ctr" + _loc2_];
      _loc4_.addEventListener("click",this);
      _loc4_.addEventListener("over",this);
      _loc4_.addEventListener("out",this);
      _loc2_ += 1;
   }
   var _loc3_ = 66;
   var _loc5_;
   while(_loc3_ <= dofus["\r\x14"].gapi.ui.Buff.LAST_GLADIATROOL_CONTAINER)
   {
      _loc5_ = this["_ctr" + _loc3_];
      _loc5_.addEventListener("click",this);
      _loc5_.addEventListener("over",this);
      _loc5_.addEventListener("out",this);
      _loc3_ += 1;
   }
   this.api.datacenter.Player.Inventory.addEventListener("modelChanged",this);
};
_loc1.updateData = function()
{
   var _loc8_ = new Array();
   var _loc6_ = 20;
   while(_loc6_ <= dofus["\r\x14"].gapi.ui.Buff.LAST_CONTAINER)
   {
      _loc8_[_loc6_] = true;
      _loc6_ += 1;
   }
   var _loc7_ = 6;
   while(_loc7_ <= dofus["\r\x14"].gapi.ui.Buff.LAST_GLADIATROOL_CONTAINER)
   {
      _loc8_[_loc7_] = true;
      _loc7_ += 1;
   }
   var _loc13_ = this.api.datacenter.Player.Inventory;
   var _loc9_;
   var _loc3_;
   var _loc12_;
   for(var _loc14_ in _loc13_)
   {
      _loc9_ = _loc13_[_loc14_];
      if(!_global.isNaN(_loc9_.position))
      {
         _loc3_ = _loc9_.position;
         if(!(_loc3_ < 20 && (_loc3_ > dofus["\r\x14"].gapi.ui.Buff.LAST_CONTAINER && (_loc3_ < dofus["\r\x14"].gapi.ui.Buff.LAST_GLADIATROOL_CONTAINER && _loc3_ > dofus["\r\x14"].gapi.ui.Buff.LAST_GLADIATROOL_CONTAINER))))
         {
            _loc12_ = this["_ctr" + _loc3_];
            _loc12_.contentData = _loc9_;
            _loc12_.enabled = true;
            _loc8_[_loc3_] = false;
         }
      }
   }
   var _loc4_ = 20;
   var _loc11_;
   while(_loc4_ <= dofus["\r\x14"].gapi.ui.Buff.LAST_CONTAINER)
   {
      if(_loc8_[_loc4_])
      {
         _loc11_ = this["_ctr" + _loc4_];
         _loc11_.contentData = undefined;
         _loc11_.enabled = false;
      }
      _loc4_ += 1;
   }
   var _loc5_ = 66;
   var _loc10_;
   while(_loc5_ <= dofus["\r\x14"].gapi.ui.Buff.LAST_GLADIATROOL_CONTAINER)
   {
      if(_loc8_[_loc5_])
      {
         _loc10_ = this["_ctr" + _loc5_];
         _loc10_.contentData = undefined;
         _loc10_.enabled = false;
      }
      _loc5_ += 1;
   }
};
_global.dofus["\r\x14"].gapi.ui.Buff.LAST_GLADIATROOL_CONTAINER = 74;
_loc1 = dofus["\r\x14"].gapi.ui.SecureCraft.prototype;
_loc1.addListeners = function()
{
   this._cgGrid.addEventListener("dblClickItem",this);
   this._cgGrid.addEventListener("dropItem",this);
   this._cgGrid.addEventListener("dragItem",this);
   this._cgGrid.addEventListener("selectItem",this);
   this._cgGrid.addEventListener("overItem",this);
   this._cgGrid.addEventListener("outItem",this);
   this._cgLocal.addEventListener("dblClickItem",this);
   this._cgLocal.addEventListener("dropItem",this);
   this._cgLocal.addEventListener("dragItem",this);
   this._cgLocal.addEventListener("selectItem",this);
   this._cgLocal.addEventListener("overItem",this);
   this._cgLocal.addEventListener("outItem",this);
   this._cgDistant.addEventListener("selectItem",this);
   this._cgDistant.addEventListener("overItem",this);
   this._cgDistant.addEventListener("outItem",this);
   this._cgCoop.addEventListener("selectItem",this);
   this._cgCoop.addEventListener("overItem",this);
   this._cgCoop.addEventListener("outItem",this);
   this._btnFilterSoul.addEventListener("click",this);
   this._btnFilterCards.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("over",this);
   this._btnFilterCards.addEventListener("over",this);
   this._btnFilterSoul.addEventListener("out",this);
   this._btnFilterCards.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnClose.addEventListener("click",this);
   this.api.datacenter.Exchange.addEventListener("localKamaChange",this);
   this.api.datacenter.Exchange.addEventListener("distantKamaChange",this);
   this.api.datacenter.Exchange.addEventListener("payKamaChange",this);
   this.api.datacenter.Exchange.addEventListener("payIfSuccessKamaChange",this);
   this._btnValidate.addEventListener("click",this);
   this._btnCraft.addEventListener("click",this);
   this._btnPrivateMessage.addEventListener("click",this);
   this._btnPay.addEventListener("click",this);
   this._mcFiligrane.onRollOver = function()
   {
      this._parent.over({target:this});
   };
   this._mcFiligrane.onRollOut = function()
   {
      this._parent.out({target:this});
   };
   this._cbTypes.addEventListener("itemSelected",this);
   this._cgPay.addEventListener("selectItem",this);
   this._cgPayIfSuccess.addEventListener("selectItem",this);
   this._btnPrivateMessagePay.addEventListener("click",this);
   this._btnValidatePay.addEventListener("click",this);
   if(this.isClient)
   {
      this._cgPay.addEventListener("dblClickItem",this);
      this._cgPay.addEventListener("dropItem",this);
      this._cgPayIfSuccess.addEventListener("dblClickItem",this);
      this._cgPayIfSuccess.addEventListener("dropItem",this);
   }
   this._mcPayIfSuccessHighlight.onRelease = function()
   {
      this._parent.switchPayBar(2);
   };
   this._mcPayHighlight.onRelease = function()
   {
      this._parent.switchPayBar(1);
   };
   this._cgCoop.multipleContainerSelectionEnabled = false;
   this._cgDistant.multipleContainerSelectionEnabled = false;
   this._cgGrid.multipleContainerSelectionEnabled = false;
   this._cgLocal.multipleContainerSelectionEnabled = false;
   this._cgPay.multipleContainerSelectionEnabled = false;
   this._cgPayIfSuccess.multipleContainerSelectionEnabled = false;
};
_loc1.over = function(_loc2_)
{
   switch(_loc2_.target._name)
   {
      case "_btnFilterEquipement":
         this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),_loc2_.target,-20);
         break;
      case "_btnFilterNonEquipement":
         this.api.ui.showTooltip(this.api.lang.getText("NONEQUIPEMENT"),_loc2_.target,-20);
         break;
      case "_btnFilterRessoureces":
         this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),_loc2_.target,-20);
         break;
      case "_btnFilterSoul":
         this.api.ui.showTooltip(this.api.lang.getText("SOUL"),_loc2_.target,-20);
         break;
      case "_btnFilterRunes":
         this.api.ui.showTooltip(this.api.lang.getText("RUNES"),_loc2_.target,-20);
         break;
      case "_btnFilterCards":
         this.api.ui.showTooltip(this.api.lang.getText("CARDS"),_loc2_.target,-20);
         break;
      case "_mcFiligrane":
         if(this._mcFiligrane.itemName != undefined)
         {
            this.gapi.showTooltip(this._mcFiligrane.itemName,this._ctrPreview,-22);
         }
      default:
         return;
   }
};
_loc1.click = function(_loc2_)
{
   if(_loc2_.target == this._btnClose)
   {
      this.callClose();
      return undefined;
   }
   var _loc3_;
   if(_loc2_.target == this._btnValidate)
   {
      _loc3_ = this.api.kernel.GameManager.analyseReceipts(this.getTotalCraftInventory(),this._nSkillId,this._nMaxItem);
      if(_loc3_ == undefined && (this.api.kernel.OptionsManager.getOption("AskForWrongCraft") && this.isNotForgemagus()))
      {
         this.api.kernel.showMessage(this.api.lang.getText("INFORMATIONS"),this.api.lang.getText("WRONG_CRAFT_CONFIRM"),"CAUTION_YESNO",{name:"confirmWrongCraft",listener:this});
      }
      else
      {
         this.validCraft();
      }
      return undefined;
   }
   if(_loc2_.target == this._btnCraft)
   {
      this.showCraftViewer(_loc2_.target.selected);
      return undefined;
   }
   if(_loc2_.target == this._btnPrivateMessage || _loc2_.target == this._btnPrivateMessagePay)
   {
      this.api.kernel.GameManager.askPrivateMessage(this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Exchange.distantPlayerID).name);
   }
   if(_loc2_.target == this._btnPay || _loc2_.target == this._btnValidatePay)
   {
      this._sCurrentDragSource = undefined;
      this._sCurrentDragTarget = undefined;
      this.switchToPayMode();
   }
   if(_loc2_.target != this._btnSelectedFilterButton)
   {
      this._btnSelectedFilterButton.selected = false;
      this._btnSelectedFilterButton = _loc2_.target;
      switch(_loc2_.target._name)
      {
         case "_btnFilterEquipement":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_EQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
            break;
         case "_btnFilterNonEquipement":
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.SecureCraft.FILTER_NONEQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
            break;
         case "_btnFilterRessoureces":
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.ui.SecureCraft.FILTER_RESSOURECES;
            this._lblFilter.text = this.api.lang.getText("RESSOURECES");
            break;
         case "_btnFilterRunes":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_RUNES;
            this._lblFilter.text = this.api.lang.getText("RUNES");
            break;
         case "_btnFilterCards":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_CARDS;
            this._lblFilter.text = this.api.lang.getText("CARDS");
            break;
         case "_btnFilterSoul":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_SOUL;
            this._lblFilter.text = this.api.lang.getText("SOUL");
      }
      this.updateData(true);
   }
   else
   {
      _loc2_.target.selected = true;
   }
};
_loc1 = dofus["\r\x14"].gapi.controls.InventoryViewer.prototype;
_loc1.addListeners = function()
{
   this._btnFilterEquipement.addEventListener("click",this);
   this._btnFilterNonEquipement.addEventListener("click",this);
   this._btnFilterRessoureces.addEventListener("click",this);
   this._btnMoreChoice.addEventListener("click",this);
   this._btnFilterEquipement.addEventListener("over",this);
   this._btnFilterNonEquipement.addEventListener("over",this);
   this._btnFilterRessoureces.addEventListener("over",this);
   this._btnMoreChoice.addEventListener("over",this);
   this._btnFilterEquipement.addEventListener("out",this);
   this._btnFilterNonEquipement.addEventListener("out",this);
   this._btnFilterRessoureces.addEventListener("out",this);
   this._btnMoreChoice.addEventListener("out",this);
   this._btnFilterSoul.addEventListener("click",this);
   this._btnFilterCards.addEventListener("click",this);
   this._btnFilterSoul.addEventListener("over",this);
   this._btnFilterCards.addEventListener("over",this);
   this._btnFilterSoul.addEventListener("out",this);
   this._btnFilterCards.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("out",this);
   this._btnFilterRunes.addEventListener("click",this);
   this._btnFilterRunes.addEventListener("over",this);
   this._cbTypes.addEventListener("itemSelected",this);
};
_loc1.hideNonCardsFilters = function()
{
   this._btnMoreChoice._x = this._btnFilterNonEquipement._x;
   this._btnFilterCards._x = this._btnFilterEquipement._x;
   this._btnFilterEquipement._visible = false;
   this._btnFilterNonEquipement._visible = false;
   this._btnFilterRessoureces._visible = false;
   this._btnFilterSoul._visible = false;
   this._btnFilterRunes._visible = false;
   this.setFilter(4);
};
_loc1.setFilter = function(_loc2_)
{
   if(_loc2_ == this._nCurrentFilterID)
   {
      return undefined;
   }
   if(_loc2_ !== dofus["\r\x14"].gapi.controls.FILTER_ID_EQUIPEMENT)
   {
      switch(_loc2_)
      {
         case dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_NONEQUIPEMENT:
            this.click({target:this._btnFilterNonEquipement});
            this._btnFilterNonEquipement.selected = true;
            break;
         case dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RESSOURECES:
            this.click({target:this._btnFilterRessoureces});
            this._btnFilterRessoureces.selected = true;
            break;
         case dofus["\r\x14"].gapi.controls.FILTER_ID_SOUL:
            this.click({target:this._btnFilterSoul});
            this._btnFilterSoul.selected = true;
            break;
         case dofus["\r\x14"].gapi.controls.FILTER_ID_CARDS:
            this.click({target:this._btnFilterCards});
            this._btnFilterCards.selected = true;
            break;
         case dofus["\r\x14"].gapi.controls.FILTER_ID_RUNES:
            this.click({target:this._btnFilterRunes});
            this._btnFilterRunes.selected = true;
         default:
            return;
      }
   }
   else
   {
      // Fallback: si el viewer no tiene botones (caso Storage/Banco), aplicar filtro directamente
      if(this._btnFilterEquipement != undefined)
      {
         this.click({target:this._btnFilterEquipement});
         this._btnFilterEquipement.selected = true;
      }
      else
      {
         // Asignar super tipos y ID de filtro directamente
         this._aSelectedSuperTypes = dofus.Constants.FILTER_EQUIPEMENT;
         this._nCurrentFilterID = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_EQUIPEMENT;
         if(this.updateData != undefined)
         {
            this.updateData(true);
         }
      }
   }
};
_loc1.setPreferedFilter = function()
{
   var _loc3_ = new Array({count:0,id:dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_EQUIPEMENT},{count:0,id:dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_NONEQUIPEMENT},{count:0,id:dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RESSOURECES},{count:0,id:dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_SOUL},{count:0,id:dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_CARDS},{count:0,id:dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RUNES});
   var _loc2_;
   for(var _loc4_ in this._eaDataProvider)
   {
      _loc2_ = this._eaDataProvider[_loc4_].superType;
      if(dofus.Constants.FILTER_EQUIPEMENT[_loc2_])
      {
         _loc3_[0].count++;
      }
      if(dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_NONEQUIPEMENT[_loc2_])
      {
         _loc3_[1].count++;
      }
      if(dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_RESSOURECES[_loc2_])
      {
         _loc3_[2].count++;
      }
      if(dofus.Constants.FILTER_SOUL[_loc2_])
      {
         _loc3_[3].count++;
      }
      if(dofus.Constants.FILTER_CARDS[_loc2_])
      {
         _loc3_[4].count++;
      }
      if(dofus.Constants.FILTER_RUNES[_loc2_])
      {
         _loc3_[5].count++;
      }
   }
   _loc3_.sortOn("count");
   this.setFilter(_loc3_[2].id);
};
_loc1.click = function(_loc2_)
{
   var _loc3_;
   if(_loc2_.target == this._btnMoreChoice)
   {
      _loc3_ = this.api.ui.createPopupMenu();
      _loc3_.addItem(this.api.lang.getText("INVENTORY_SEARCH"),this,this.showSearch);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_DATE_SORT"),this,this.sortInventory,["_itemDateId"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_NAME_SORT"),this,this.sortInventory,["_itemName"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_TYPE_SORT"),this,this.sortInventory,["_itemType"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_LEVEL_SORT"),this,this.sortInventory,["_itemLevel"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_POD_SORT"),this,this.sortInventory,["_itemWeight"]);
      _loc3_.addItem(this.api.lang.getText("INVENTORY_QTY_SORT"),this,this.sortInventory,["_nQuantity"]);
      _loc3_.show(_root._xmouse,_root._ymouse);
      return undefined;
   }
   if(_loc2_.target != this._btnSelectedFilterButton)
   {
      this._btnSelectedFilterButton.selected = false;
      this._btnSelectedFilterButton = _loc2_.target;
      switch(_loc2_.target._name)
      {
         case "_btnFilterEquipement":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_EQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("EQUIPEMENT");
            this._nCurrentFilterID = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_EQUIPEMENT;
            break;
         case "_btnFilterNonEquipement":
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_NONEQUIPEMENT;
            this._lblFilter.text = this.api.lang.getText("NONEQUIPEMENT");
            this._nCurrentFilterID = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_NONEQUIPEMENT;
            break;
         case "_btnFilterRessoureces":
            this._aSelectedSuperTypes = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_RESSOURECES;
            this._lblFilter.text = this.api.lang.getText("RESSOURECES");
            this._nCurrentFilterID = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RESSOURECES;
            break;
         case "_btnFilterSoul":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_SOUL;
            this._nCurrentFilterID = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_SOUL;
            break;
         case "_btnFilterCards":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_CARDS;
            this._nCurrentFilterID = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_CARDS;
            break;
         case "_btnFilterRunes":
            this._aSelectedSuperTypes = dofus.Constants.FILTER_RUNES;
            this._nCurrentFilterID = dofus["\r\x14"].gapi.controls.InventoryViewer.FILTER_ID_RUNES;
      }
      this.updateData();
   }
   else
   {
      _loc2_.target.selected = true;
   }
};
_loc1.over = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnFilterEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("EQUIPEMENT"),_loc2_.target,-20);
         break;
      case this._btnFilterNonEquipement:
         this.api.ui.showTooltip(this.api.lang.getText("NONEQUIPEMENT"),_loc2_.target,-20);
         break;
      case this._btnFilterRessoureces:
         this.api.ui.showTooltip(this.api.lang.getText("RESSOURECES"),_loc2_.target,-20);
         break;
      case this._btnFilterSoul:
         this.api.ui.showTooltip(this.api.lang.getText("SOUL"),_loc2_.target,-20);
         break;
      case this._btnFilterCards:
         this.api.ui.showTooltip(this.api.lang.getText("CARDS"),_loc2_.target,-20);
         break;
      case this._btnFilterRunes:
         this.api.ui.showTooltip(this.api.lang.getText("RUNES"),_loc2_.target,-20);
         break;
      case this._btnMoreChoice:
         this.api.ui.showTooltip(this.api.lang.getText("SEARCH_AND_SORT"),_loc2_.target,-20);
      default:
         return;
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.GameResult.prototype;
_loc1.addListeners = function()
{
   this._btnMinimize.addEventListener("click",this);
   this._btnClose.addEventListener("click",this);
   this._btnCross.addEventListener("click",this);
   this._sdStars.addEventListener("over",this);
   this._sdStars.addEventListener("out",this);
};
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("GAME_RESULTS") + " - " + this.api.lang.getText("TURNS_NUMBER") + " : " + this._oData.currentTableTurn;
   this._lblDuration.text = this.api.kernel.GameManager.getDurationString(this._oData.duration,true);
   if(this.api.datacenter.Basics.aks_game_end_bonus != undefined && this.api.datacenter.Basics.aks_game_end_bonus > 0)
   {
      this._lblBonus._visible = true;
      this._sdStars._visible = true;
      this._lblBonus.text = this.api.lang.getText("GAME_RESULTS_BONUS") + " :";
      this._sdStars.value = this.api.datacenter.Basics.aks_game_end_bonus;
   }
   if(this._oData.challenges && this._oData.challenges.length)
   {
      this._lblChallenges._visible = true;
      this._lblChallenges.text = this.api.lang.getText("FIGHT_CHALLENGE_BONUS") + " :";
   }
   this._btnClose.label = this.api.lang.getText("CLOSE");
};
_loc1.initData = function()
{
   var _loc10_ = this._oData.winners.length;
   var _loc11_ = this._oData.loosers.length;
   var _loc7_ = this._oData.collectors.length;
   var _loc16_ = _loc10_ + _loc11_ + _loc7_;
   var _loc12_ = Math.min(_loc10_,dofus["\r\x14"].gapi.ui.GameResult.MAX_VISIBLE_PLAYERS_IN_TEAM) * 20 + 65 + Math.min(_loc11_,dofus["\r\x14"].gapi.ui.GameResult.MAX_VISIBLE_PLAYERS_IN_TEAM) * 20 + 65;
   if(_loc7_ > 0)
   {
      _loc12_ += Math.min(_loc7_,dofus["\r\x14"].gapi.ui.GameResult.MAX_VISIBLE_PLAYERS_IN_TEAM) * 20 + 65;
   }
   var _loc15_ = _loc12_ + 32;
   var _loc6_ = ((_loc16_ > dofus["\r\x14"].gapi.ui.GameResult.MAX_PLAYERS ? 550 : this.gapi.screenHeight) - _loc15_) / 2;
   var _loc9_ = this._winBackground._x + 10;
   var _loc13_ = _loc6_ + 32;
   var _loc14_ = Math.min(_loc10_,dofus["\r\x14"].gapi.ui.GameResult.MAX_VISIBLE_PLAYERS_IN_TEAM) * 20 + 55 + _loc13_;
   var _loc17_ = Math.min(_loc11_,dofus["\r\x14"].gapi.ui.GameResult.MAX_VISIBLE_PLAYERS_IN_TEAM) * 20 + 55 + _loc14_;
   var _loc8_;
   switch(this._oData.fightType)
   {
      case 0:
         _loc8_ = "UI_GameResultTeam";
         break;
      case 1:
         _loc8_ = "UI_GameResultTeamPVP";
   }
   this.attachMovie(_loc8_,"_tWinners",10,{dataProvider:this._oData.winners,title:this.api.lang.getText("WINNERS"),_x:_loc9_,_y:_loc13_});
   this.attachMovie(_loc8_,"_tLoosers",20,{dataProvider:this._oData.loosers,title:this.api.lang.getText("LOOSERS"),_x:_loc9_,_y:_loc14_});
   if(_loc7_ > 0)
   {
      this.attachMovie(_loc8_,"_tCollectors",30,{dataProvider:this._oData.collectors,title:this.api.lang.getText("GUILD_TAXCOLLECTORS"),_x:_loc9_,_y:_loc17_});
   }
   this._winBackground._y = _loc6_;
   this._winBackground.setSize(undefined,_loc15_);
   this._lblDuration._y = _loc6_ + 5;
   this._btnClose._y = this._winBackground._y + this._winBackground._height;
   this._lblBonus._y = this._winBackground._y + 25;
   this._sdStars._y = this._winBackground._y + 30;
   this._btnMinimize._y = _loc6_ + 9;
   this._btnCross._y = _loc6_ + 9;
   var _loc2_;
   var _loc3_;
   var _loc0_;
   if(this._oData.challenges && this._oData.challenges.length)
   {
      this._lblChallenges._y = this._lblBonus._y + 17;
      this._mcChallengesPlacer._y = this._lblBonus._y + 18;
      _loc2_ = 0;
      while(_loc2_ < this._oData.challenges.length)
      {
         _loc3_ = this.attachMovie("FightChallengeIcon","fci" + _loc2_,this.getNextHighestDepth(),{challenge:this._oData.challenges[_loc2_],displayUiOnClick:false});
         _loc0_ = 17;
         _loc3_._height = _loc0_;
         _loc3_._width = _loc0_;
         _loc3_._x = _loc2_ * (_loc3_._width + 5) + this._mcChallengesPlacer._x;
         _loc3_._y = this._mcChallengesPlacer._y;
         // Add tooltip listeners for challenge icons (full result window)
         if(_loc3_.addEventListener != undefined)
         {
            _loc3_.addEventListener("over", this);
            _loc3_.addEventListener("out", this);
         }
         _loc2_ += 1;
      }
   }
};
_loc1.click = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnClose:
      case this._btnCross:
         this.callClose();
         break;
      case this._btnMinimize:
         if(this._oData.currentPlayerInfos.length != 0)
         {
            this.api.ui.loadUIComponent("GameResultLight","GameResultLight",{data:this._oData},{bAlwaysOnTop:false});
            this.api.kernel.OptionsManager.setOption("UseLightEndFightUI",true);
            this.callClose();
         }
         else
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("ERROR_248"),"ERROR_CHAT");
         }
      default:
         return;
   }
};
// Extend GameResult prototype to show tooltips for challenge icons similar to light version
_loc1.over = function(e)
{
   if(e.target == this._sdStars)
   {
      this.gapi.showTooltip(this.api.lang.getText("GAME_RESULTS_BONUS_TOOLTIP",[this._sdStars.value]),this._sdStars,-20);
   }
   else if(e.target != undefined && e.target.challenge != undefined && e.target.challenge.id != undefined)
   {
      var c = e.target.challenge;
      var challengeData = this.api.lang.getFightChallenge(c.id);
      var text = challengeData.n + "\n" + challengeData.d;
      var bonusXP = Number(c.basicXpBonus || 0) + Number(c.teamXpBonus || 0);
      var bonusDrop = Number(c.basicDropBonus || 0) + Number(c.teamDropBonus || 0);
      text += "\n";
      if(bonusDrop > 0)
      {
         text += "\nBotín: +" + bonusDrop + "%";
      }
      if(bonusXP > 0)
      {
         text += "\nXP: +" + bonusXP + "%";
      }
      var estadoTexto = "";
      if(c.state == 1)
      {
         estadoTexto = "Estado: Reto logrado";
      }
      else if(c.state == 2)
      {
         estadoTexto = "Estado: Reto no alcanzado";
      }
      else
      {
         estadoTexto = "Estado: Reto actual";
      }
      text += "\n" + estadoTexto;
      this.gapi.showTooltip(text, e.target, -20);
   }
   else
   {
      // Fallback: show duration/turns if rolling over background area
      if(this._mcRollOver != undefined && e.target == this._mcRollOver)
      {
         this.gapi.showTooltip(this.api.lang.getText("TURNS_NUMBER") + " : " + this._oData.currentTableTurn + "\n" + this.api.lang.getText("DURATION") + " : " + this.api.kernel.GameManager.getDurationString(this._oData.duration,true),this._mcRollOver,-20);
      }
   }
};
_loc1.out = function(e)
{
   this.gapi.hideTooltip();
};
_loc1 = ank["\x1e\n\x07"]["\x0e\x1d"].prototype;
_loc1.removeFromKeys = function(aKeys)
{
   var _loc3_;
   var _loc2_;
   for(var _loc5_ in this._items)
   {
      _loc3_ = false;
      _loc2_ = 0;
      while(_loc2_ < aKeys.length)
      {
         if(aKeys[_loc2_] == _loc5_)
         {
            _loc3_ = true;
            break;
         }
         _loc2_ += 1;
      }
      if(_loc3_)
      {
         delete this._items.k;
         this._count--;
      }
   }
   this.dispatchEvent({type:"modelChanged"});
};
_loc1.getItemAt = function(_loc2_)
{
   return this._items[_loc2_];
};
_loc1.removeFromEOKeys = function(eo)
{
   var _loc2_;
   for(var _loc5_ in this._items)
   {
      _loc2_ = false;
      for(var _loc3_ in eo.getItems())
      {
         if(_loc5_ == _loc3_)
         {
            _loc2_ = true;
            break;
         }
      }
      if(_loc2_)
      {
         delete this._items.k;
         this._count--;
      }
   }
   this.dispatchEvent({type:"modelChanged"});
};
_loc1.doesAnotherEOContainsAllMyKeys = function(eo)
{
   var _loc5_ = true;
   var _loc2_;
   for(var _loc6_ in this._items)
   {
      _loc2_ = false;
      for(var _loc3_ in eo.getItems())
      {
         if(_loc6_ == _loc3_)
         {
            _loc2_ = true;
            break;
         }
      }
      if(!_loc2_)
      {
         _loc5_ = false;
         break;
      }
   }
   return _loc5_;
};
_loc1 = dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerPVP.prototype;
_loc1.setValue = function(_loc2_, _loc3_, _loc4_)
{
   _loc4_.items.sortOn("_itemLevel",Array.DESCENDING | Array.NUMERIC);
   this._oItems = _loc4_;
   var _loc11_ = this._mcList._parent.api;
   var _loc4_;
   var _loc10_;
   var _loc6_;
   var _loc7_;
   var _loc3_;
   if(_loc2_)
   {
      switch(_loc4_.type)
      {
         case "monster":
         case "taxcollector":
         case "player":
            this._lblName.text = _loc4_.name;
            if(_loc4_.rank == 0 && !_loc11_.datacenter.Basics.aks_current_server.isHardcore())
            {
               this._pbHonour._visible = false;
               this._lblWinHonour._visible = false;
               this._pbDisgrace._visible = false;
               this._lblWinDisgrace._visible = false;
               this._lblRank._visible = false;
            }
            else
            {
               this._pbHonour._visible = true;
               this._pbDisgrace._visible = true;
               this._lblWinDisgrace._visible = true;
               this._lblWinHonour._visible = true;
               this._lblRank._visible = true;
               if(_loc11_.datacenter.Basics.aks_current_server.isHardcore())
               {
                  if(_global.isNaN(_loc4_.minxp))
                  {
                     this._pbDisgrace._visible = false;
                  }
                  this._pbDisgrace.minimum = _loc4_.minxp;
                  this._pbDisgrace.maximum = _loc4_.maxxp;
                  this._pbDisgrace.value = _loc4_.xp;
               }
               else
               {
                  this._pbDisgrace.minimum = _loc4_.mindisgrace;
                  this._pbDisgrace.maximum = _loc4_.maxdisgrace;
                  this._pbDisgrace.value = _loc4_.disgrace;
               }
               this._pbHonour.minimum = _loc4_.minhonour;
               this._pbHonour.maximum = _loc4_.maxhonour;
               if(_loc4_.winhonour >= 0)
               {
                  this._pbHonour.value = _loc4_.honour;
                  this._pbHonour.uberValue = _loc4_.honour - _loc4_.winhonour;
               }
               else
               {
                  this._pbHonour.value = _loc4_.honour - _loc4_.winhonour;
                  this._pbHonour.styleName = "BrownProgressBarLoss";
                  this._pbHonour.uberValue = _loc4_.honour;
               }
            }
            this._lblWinHonour.text = _global.isNaN(_loc4_.winhonour) ? "" : _loc4_.winhonour;
            if(!_loc11_.datacenter.Basics.aks_current_server.isHardcore())
            {
               this._lblWinDisgrace.text = _global.isNaN(_loc4_.windisgrace) ? "" : _loc4_.windisgrace;
            }
            else
            {
               this._lblWinDisgrace.text = _global.isNaN(_loc4_.winxp) ? "" : _loc4_.winxp;
            }
            this._lblRank.text = _global.isNaN(_loc4_.rank) ? "" : _loc4_.rank;
            this._lblKama.text = _global.isNaN(_loc4_.kama) ? "" : _loc4_.kama;
            _loc4_ = _loc4_.alignment;
            if(this._lblRank._visible && _loc4_ > 0)
            {
               this._mcAlignment.gotoAndStop(_loc4_ + 1);
            }
            this._lblLevel.text = _loc4_.level;
            this._mcDeadHead._visible = _loc4_.bDead;
            this.createEmptyMovieClip("_mcItems",10);
            _loc10_ = false;
            _loc4_ = _loc4_.items.length;
            while(true)
            {
               _loc4_ -= 1;
               if(_loc4_ < 0)
               {
                  break;
               }
               _loc6_ = this._mcItemPlacer._x + 24 * _loc4_;
               if(_loc6_ < this._mcItemPlacer._x + this._mcItemPlacer._width)
               {
                  _loc7_ = _loc4_.items[_loc4_];
                  _loc3_ = this._mcItems.attachMovie("Container","_ctrItem" + _loc4_,_loc4_,{_x:_loc6_,_y:this._mcItemPlacer._y + 1});
                  _loc3_.setSize(18,18);
                  _loc3_.addEventListener("over",this);
                  _loc3_.addEventListener("out",this);
                  _loc3_.addEventListener("click",this);
                  _loc3_.enabled = true;
                  _loc3_.margin = 0;
                  _loc3_.contentData = _loc7_;
               }
               else
               {
                  _loc10_ = true;
               }
            }
            this._ldrAllDrop._visible = _loc10_;
         default:
            return;
      }
   }
   else if(this._lblName.text != undefined)
   {
      this._pbHonour._visible = false;
      this._lblName.text = "";
      this._pbHonour.minimum = 0;
      this._pbHonour.maximum = 100;
      this._pbHonour.value = 0;
      this._pbDisgrace.minimum = 0;
      this._pbDisgrace.maximum = 100;
      this._pbDisgrace.value = 0;
      this._lblWinHonour.text = "";
      this._lblWinDisgrace.text = "";
      this._lblKama.text = "";
      this._mcDeadHead._visible = false;
      this._mcItems.removeMovieClip();
   }
};
_loc1 = dofus.aks.Party.prototype;
_loc1.onCreate = function(_loc2_, _loc3_)
{
   var _loc2_;
   var _loc3_;
   if(_loc2_)
   {
      _loc2_ = _loc3_;
      if(_loc2_ != this.api.datacenter.Player.Name)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("U_ARE_IN_GROUP",[_loc2_]),"INFO_CHAT");
      }
      this.api.datacenter.Player.inParty = true;
      this.api.ui.loadUIComponent("Party","Party",undefined,{bStrayIfPresent:true,bAlwaysOnTop:true});
   }
   else
   {
      _loc3_ = _loc3_.charAt(0);
      switch(_loc3_)
      {
         case "a":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PARTY_ALREADY_IN_GROUP"),"ERROR_CHAT",{name:"PartyError"});
            break;
         case "f":
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PARTY_FULL"),"ERROR_CHAT",{name:"PartyError"});
         default:
            return;
      }
   }
};
_loc1.onLeader = function(sData)
{
   // PL<leaderId> - Actualizar ID del líder en la UI de Party
   var _loc2_ = this.api.ui.getUIComponent("Party");
   if(_loc2_ != undefined)
   {
      _loc2_._sLeaderID = sData;
      _loc2_.updateData();
   }
};
_loc1.onInvite = function(bSuccess, sData)
{
   // PIK - Invitación de grupo (ya procesado, stub)
};
_loc1.onRefuse = function(sData)
{
   // PR - Rechazo de invitación
   this.api.datacenter.Player.inParty = false;
};
_loc1.onAccept = function(sData)
{
   // PA - Aceptación de invitación
};
_loc1.onLeave = function(sData)
{
   // PV - Alguien dejó el grupo
   this.api.datacenter.Player.inParty = false;
   this.api.ui.unloadUIComponent("Party");
};
_loc1.onFollow = function(bSuccess, sData)
{
   // PF - Seguir miembro (stub)
};
_loc1.onMovement = function(sData)
{
   // PM - Actualizar lista de miembros del grupo
   var _loc2_ = this.api.ui.getUIComponent("Party");
   if(_loc2_ == undefined)
   {
      return;
   }
   var _loc3_ = sData.charAt(0);
   var _loc4_ = sData.substr(1);
   if(_loc3_ == "+")
   {
      // PM+ - Puede ser lista completa (con |) o agregar UN miembro (sin |)
      _global.trace("[PARTY PM+] Recibido: " + sData);
      var _loc5_ = _loc4_.split("|");
      var _bIsFullList = _loc5_.length > 1 || _loc4_.indexOf("|") !== -1;
      var _loc6_ = new Array();
      var _loc7_ = 0;
      var _leaderID = undefined;
      while(_loc7_ < _loc5_.length)
      {
         if(_loc5_[_loc7_].length > 0)
         {
            var _loc8_ = _loc5_[_loc7_].split(";");
            // Formato servidor: id;nombre;gfxid;color1;color2;color3;accesorios;vida,vidamax;nivel;iniciativa;prospeccion;isLeader
            var vida = _loc8_[7] != undefined ? _loc8_[7].split(",") : ["0","0"];
            var isLeader = _loc8_[11] != undefined ? (_loc8_[11] == "1" || _loc8_[11] == 1) : false;
            if(isLeader && _leaderID == undefined)
            {
               _leaderID = Number(_loc8_[0]);
               _global.trace("[PARTY PM+] Líder encontrado: id=" + _leaderID);
            }
            var _loc9_ = {id:Number(_loc8_[0]),name:_loc8_[1],gfxid:Number(_loc8_[2]),colors:_loc8_[3] + "," + _loc8_[4] + "," + _loc8_[5],accessories:_loc8_[6],life:Number(vida[0]),lifeMax:Number(vida[1]),level:Number(_loc8_[8]),initiative:Number(_loc8_[9]),prospection:Number(_loc8_[10])};
            _global.trace("[PARTY PM+] Miembro parseado: id=" + _loc9_.id + ", name=" + _loc9_.name + ", gfxid=" + _loc9_.gfxid + ", colors=" + _loc9_.colors + ", accessories=" + _loc9_.accessories + ", isLeader=" + isLeader);
            _loc6_.push(_loc9_);
         }
         _loc7_++;
      }
      
      if(_bIsFullList)
      {
         // Lista completa (contiene |): REEMPLAZAR
         _global.trace("[PARTY PM+] FULL LIST MODE - Reemplazando _aMembers con " + _loc6_.length + " miembros");
         _loc2_._aMembers = _loc6_;
         // Actualizar _sLeaderID si se encontró
         if(_leaderID != undefined)
         {
            _loc2_._sLeaderID = _leaderID;
            _global.trace("[PARTY PM+] _sLeaderID actualizado a: " + _leaderID);
         }
      }
      else
      {
         // Un solo miembro (sin |): ACTUALIZAR o AGREGAR en array existente
         if(_loc6_.length === 1)
         {
            var _newMember = _loc6_[0];
            var _found = false;
            var _memberIdx = 0;
            while(_memberIdx < _loc2_._aMembers.length)
            {
               if(_loc2_._aMembers[_memberIdx].id === _newMember.id)
               {
                  _global.trace("[PARTY PM+] SINGLE MEMBER UPDATE - Actualizando miembro id=" + _newMember.id + " en posición " + _memberIdx);
                  _loc2_._aMembers[_memberIdx] = _newMember;
                  _found = true;
                  break;
               }
               _memberIdx++;
            }
            if(!_found)
            {
               _global.trace("[PARTY PM+] SINGLE MEMBER ADD - Agregando nuevo miembro id=" + _newMember.id);
               _loc2_._aMembers.push(_newMember);
            }
            // Actualizar _sLeaderID si este miembro es líder
            if(_leaderID != undefined)
            {
               _loc2_._sLeaderID = _leaderID;
               _global.trace("[PARTY PM+] _sLeaderID actualizado a: " + _leaderID);
            }
         }
      }
      
      _global.trace("[PARTY PM+] Total miembros en _aMembers: " + _loc2_._aMembers.length);
      _loc2_.updateData();
   }
   else if(_loc3_ == "~")
   {
      // PM~ - Actualizar info de un miembro
      _global.trace("[PARTY PM~] Actualizar miembro: " + sData);
      var _loc10_ = _loc4_.split(";");
      // Formato servidor: id;nombre;gfxid;color1;color2;color3;accesorios;vida,vidamax;nivel;iniciativa;prospeccion;1
      var vida2 = _loc10_[7] != undefined ? _loc10_[7].split(",") : ["0","0"];
      var _loc11_ = {id:Number(_loc10_[0]),name:_loc10_[1],gfxid:Number(_loc10_[2]),colors:_loc10_[3] + "," + _loc10_[4] + "," + _loc10_[5],accessories:_loc10_[6],life:Number(vida2[0]),lifeMax:Number(vida2[1]),level:Number(_loc10_[8]),initiative:Number(_loc10_[9]),prospection:Number(_loc10_[10])};
      _global.trace("[PARTY PM~] Datos: id=" + _loc11_.id + ", gfxid=" + _loc11_.gfxid + ", colors=" + _loc11_.colors + ", accessories=" + _loc11_.accessories);
      _loc2_.updateData(_loc11_);
   }
   else if(_loc3_ == "-")
   {
      // PM- - Remover miembro
      var _loc12_ = Number(_loc4_);
      var _loc13_ = 0;
      while(_loc13_ < _loc2_._aMembers.length)
      {
         if(_loc2_._aMembers[_loc13_].id == _loc12_)
         {
            _loc2_._aMembers.splice(_loc13_,1);
            break;
         }
         _loc13_++;
      }
      _loc2_.updateData();
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.Party.prototype;
_loc1.updateData = function(_loc2_)
{
   // DEBUG START: comprehensive state logging for disappearing members issue
   _global.trace("[PARTY updateData] START members=" + this._aMembers.length + " btnOpenClose.selected=" + this._btnOpenClose.selected);
   var __dbg_i = 0;
   while(__dbg_i < this._aMembers.length)
   {
      var __dbg_m = this._aMembers[__dbg_i];
      _global.trace("[PARTY updateData] member[" + __dbg_i + "] id=" + __dbg_m.id + " init=" + __dbg_m.initiative + " level=" + __dbg_m.level);
      __dbg_i++;
   }
   // FALLBACK: Inicializar _sLeaderID si es undefined (defensive initialization)
   // El primer miembro del grupo es siempre el líder según protocolo Dofus
   if(this._sLeaderID == undefined && this._aMembers.length > 0)
   {
      this._sLeaderID = this._aMembers[0].id;
      _global.trace("[PARTY updateData] FALLBACK: Inicializando _sLeaderID con primer miembro: " + this._sLeaderID);
   }
   var _loc11_ = 0;
   this._nLvlTotal = 0;
   this._nProspectionTotal = 0;
   var _loc12_ = false;
   var _loc5_;
   var _loc4_;
   var _loc6_;
   var _loc8_;
   var _loc2_;
   var _loc7_;
   var _loc3_;
   var _loc9_;
   if(this._aMembers.length != 0)
   {
      // SORT: Bubble sort by initiative - solo ordena los miembros existentes
      _loc8_ = true;
      while(_loc8_)
      {
         _loc8_ = false;
         _loc2_ = 0;
         while(_loc2_ < this._aMembers.length - 1)
         {
            if(this._aMembers[_loc2_].initiative < this._aMembers[_loc2_ + 1].initiative)
            {
               _loc7_ = this._aMembers[_loc2_];
               this._aMembers[_loc2_] = this._aMembers[_loc2_ + 1];
               this._aMembers[_loc2_ + 1] = _loc7_;
               _loc8_ = true;
            }
            _loc2_ += 1;
         }
      }
      _global.trace("[PARTY updateData] After sort: members=" + this._aMembers.length);
      
      // DISPLAY: Update UI slots - only display actual members, hide empty slots
      _loc5_ = 0;
      while(_loc5_ < dofus.Constants.MEMBERS_COUNT_IN_PARTY)
      {
         _loc6_ = this["_piMember" + _loc5_];
         _loc4_ = this._aMembers[_loc5_];
         
         if(_loc4_ != undefined)
         {
            // Slot has a member - set data and make visible
            _global.trace("[PARTY] Slot " + _loc5_ + " setData: id=" + _loc4_.id + ", name=" + _loc4_.name);
            _loc6_.setData(_loc4_);
            _loc6_.isFollowing = _loc4_.id == this._sFollowID;
            _loc6_.isLeader = _loc4_.id == this._sLeaderID;
            _global.trace("[PARTY] Slot " + _loc5_ + ": isLeader=" + _loc6_.isLeader + " (id=" + _loc4_.id + " vs _sLeaderID=" + this._sLeaderID + ")");
            _loc6_.isHero = this.api.datacenter.getHero(_loc4_.id) !== undefined;
            _loc6_._visible = !this._btnOpenClose.selected;
            if(_loc6_.isInGroup)
            {
               this._nLvlTotal += _loc4_.level;
               this._nProspectionTotal += _loc4_.prospection;
            }
         }
         else
         {
            // Slot is empty - clear it and hide
            _global.trace("[PARTY] Slot " + _loc5_ + " is empty - hiding");
            _loc6_.setData(null);
            _loc6_._visible = false;
         }
         _loc5_ += 1;
      }
   }
   _global.trace("[PARTY updateData] END members=" + this._aMembers.length + " btnOpenClose.selected=" + this._btnOpenClose.selected);
   var ref = this;
   this._mcInfo.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcInfo.onRollOut = function()
   {
      ref.out({target:this});
   };
};
var _loc1 = dofus["\r\x14"].gapi.ui.NpcDialog.prototype;
_loc1.setNpcCharacteristics = function()
{
   this._ldrChar.addEventListener("initialization",this);
   this._ldrArtwork.addEventListener("complete",this);
   this._ldrChar.forceReload = true;
   this._ldrChar.contentPath = this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID).artworkFile;
   if(this._nCustomArtwork != undefined && (!_global.isNaN(this._nCustomArtwork) && this._nCustomArtwork > 0))
   {
      this._ldrArtwork.contentPath = dofus.Constants.ARTWORKS_BIG_PATH + this._nCustomArtwork + ".swf";
   }
   else
   {
      this._ldrArtwork.contentPath = dofus.Constants.ARTWORKS_BIG_PATH + this._sGfx + ".swf";
   }
   this._winBackgroundUp.title = this._sName;
   this._winResponseBackgroundUp.title = this.api.datacenter.Player.Name;
};
_loc1.initialization = function(oEvent)
{
   this._mcSprite = oEvent.clip;
   this.gapi.api.colors.addSprite(this._mcSprite,this.api.datacenter.Sprites.getItemAt(this.api.datacenter.Player.ID));
   this._mcSprite._visible = this.reponse;
};
_loc1.showElements = function(bShow)
{
   this._ldrArtwork._visible = bShow;
   this._winBackground._visible = bShow;
   this._winBackgroundUp._visible = bShow;
   this._qvQuestionViewer._visible = bShow;
   this._winResponseBackground._visible = bShow && this.reponse;
   this._winResponseBackgroundUp._visible = bShow && this.reponse;
   this._qvResponseViewer._visible = bShow && this.reponse;
   if(this._mcSprite != undefined)
   {
      this._mcSprite._visible = bShow && this.reponse;
   }
};
_loc1.resize = function(oEvent)
{
   this._winBackground.setSize(undefined,this._qvQuestionViewer.height + (this._qvQuestionViewer._y - this._winBackground._y) + 12);
   this._winBackgroundUp.setSize(undefined,this._qvQuestionViewer.height + (this._qvQuestionViewer._y - this._winBackground._y) + 10);
   this._winResponseBackground.setSize(undefined,this._qvResponseViewer.height + (this._qvResponseViewer._y - this._winResponseBackground._y) + 12);
   this._winResponseBackgroundUp.setSize(undefined,this._qvResponseViewer.height + (this._qvResponseViewer._y - this._winResponseBackground._y) + 10);
};
_loc1.setQuestion = function(oQuestion)
{
   this._oQuestion = oQuestion;
   this.reponse = this._oQuestion.responses.length > 0 || !this._bFirstQuestion;
   if(this._qvQuestionViewer == undefined)
   {
      this.attachMovie("QuestionViewer","_qvQuestionViewer",10,{_x:this._mcQuestionViewer._x,_y:this._mcQuestionViewer._y,question:(!this.reponse ? oQuestion : new dofus.datacenter["\x1e\x15\x19"](oQuestion.id,null,oQuestion.questionParams)),isFirstQuestion:true});
      this._qvQuestionViewer.addEventListener("resize",this);
   }
   else
   {
      this._qvQuestionViewer.question = !this.reponse ? oQuestion : new dofus.datacenter["\x1e\x15\x19"](oQuestion.id,null,oQuestion.questionParams);
   }
   if(this.reponse)
   {
      if(this._qvResponseViewer == undefined)
      {
         this.attachMovie("QuestionViewer","_qvResponseViewer",11,{_x:this._mcResponseViewer._x,_y:this._mcResponseViewer._y,question:new dofus.datacenter["\x1e\x15\x19"](null,oQuestion.responsesID,null),isFirstQuestion:this._bFirstQuestion});
         this._qvResponseViewer.addEventListener("response",this);
         this._qvResponseViewer.addEventListener("resize",this);
      }
      else
      {
         this._qvResponseViewer.isFirstQuestion = this._bFirstQuestion;
         this._qvResponseViewer.question = new dofus.datacenter["\x1e\x15\x19"](null,oQuestion.responsesID,null);
      }
   }
   this.showElements(true);
};
var _loc1 = dofus.datacenter["\x1e\x15\x19"].prototype;
_loc1.initialize = function(nQuestionID, aResponsesID, aQuestionParams)
{
   this.api = _global.API;
   this._aQuestionParams = aQuestionParams;
   this._aResponsesID = aResponsesID;
   this._nQuestionID = nQuestionID;
   var _loc8_ = ank["\x1e\n\x07"]["\x1e\x16\x19"].getDescription(this.api.lang.getDialogQuestionText(nQuestionID),aQuestionParams);
   if(dofus.Constants.DEBUG && nQuestionID != null)
   {
      _loc8_ = _loc8_ + " (" + nQuestionID + ")";
   }
   this._sQuestionText = _loc8_;
   this._eaResponsesObjects = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc3_ = 0;
   var _loc4_;
   while(_loc3_ < aResponsesID.length)
   {
      _loc4_ = Number(aResponsesID[_loc3_]);
      this._eaResponsesObjects.push({label:this.api.lang.fetchString(this.api.lang.getDialogResponseText(_loc4_)),id:_loc4_});
      _loc3_ += 1;
   }
};
_loc1.__get__responsesID = function()
{
   return this._aResponsesID;
};
_loc1.__get__questionParams = function()
{
   return this._aQuestionParams;
};
_loc1.addProperty("questionParams",_loc1.__get__questionParams,function()
{
}
);
_loc1.addProperty("responsesID",_loc1.__get__responsesID,function()
{
}
);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
var _loc1 = dofus["\r\x14"].gapi.controls.QuestionViewer.prototype;
_loc1.layoutContent = function()
{
   var _loc2_;
   var _loc3_;
   if(this._bFirstQuestion)
   {
      _loc2_ = this._oQuestion.responses;
   }
   else if(this._oQuestion.responses.length == 0)
   {
      _loc3_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
      _loc3_.push({label:this._parent.api.lang.getText("CONTINUE_TO_SPEAK"),id:-1});
      _loc2_ = _loc3_;
   }
   else
   {
      _loc2_ = this._oQuestion.responses;
   }
   var _loc4_ = _loc2_.length;
   this._lstResponses.removeAll();
   this._lstResponses.setSize(undefined,dofus["\r\x14"].gapi.controls.QuestionViewer.RESPONSE_HEIGHT * _loc4_);
   this.addToQueue({object:this,method:this.addResponses,params:[_loc2_]});
   if(this._oQuestion.label == "undefined")
   {
      this._txtQuestion.text = null;
   }
   else
   {
      this._txtQuestion.text = this._oQuestion.label;
   }
};
_loc1.change = function(oEvent)
{
   this._lstResponses._y = this._txtQuestion._y + 10 + this._txtQuestion.height;
   this._lstResponses._visible = true;
   this.setSize(undefined,this._lstResponses._y + this._lstResponses.height);
   this.dispatchEvent({type:"resize"});
};
_loc1 = dofus["\r\x14"].gapi.ui["\x1e\x16\x1d"]["\x1e\x16\x1c"].prototype;
_loc1.__set__hero = function(sData)
{
   this._isHero = sData;
   this._switchHero._visible = sData;
};
_loc1.__get__hero = function()
{
   return this._isHero;
};
_loc1.createChildren = function()
{
   this.addToQueue({object:this,method:this.addListeners});
   this._mcBack._visible = false;
   this._mcFollow._visible = false;
   this._mcHealth._visible = false;
   this._btn._visible = false;
   this._switchHero._visible = false;
};
_loc1.addListeners = function()
{
   this._ldrSprite.addEventListener("initialization",this);
   this._btn.addEventListener("over",this);
   this._btn.addEventListener("out",this);
   this._btn.addEventListener("click",this);
   var ref = this;
   this._switchHero.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._switchHero.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._switchHero.onRelease = function()
   {
      ref.click({target:this});
   };
};
_loc1.setHealth = function(nLife)
{
   // Actualizar texto y barra de vida
   // nLife es la vida actual, _oSprite.lifeMax es la vida máxima
   _global.trace("[PARTY MEMBER] setHealth() called with: " + nLife + ", lifeMax=" + (this._oSprite ? this._oSprite.lifeMax : "undefined"));
   
   if(this._oSprite != undefined && this._mcHealth != undefined)
   {
      var _lifeMax = this._oSprite.lifeMax;
      var _healthPercent = (_lifeMax > 0) ? (nLife / _lifeMax) : 0;
      
      // Si _mcHealth es un MovieClip con gotoAndStop (barra gráfica)
      if(this._mcHealth.gotoAndStop != undefined)
      {
         var _frame = Math.round(_healthPercent * 100);
         if(_frame < 1 && _healthPercent > 0) _frame = 1;
         if(_frame > 100) _frame = 100;
         this._mcHealth.gotoAndStop(_frame);
         _global.trace("[PARTY MEMBER] setHealth: _mcHealth.gotoAndStop(" + _frame + ")");
      }
      
      // Si hay un TextField para mostrar "vida/vidamax"
      if(this._mcHealth._txt != undefined)
      {
         this._mcHealth._txt.text = nLife + "/" + _lifeMax;
         _global.trace("[PARTY MEMBER] setHealth: _txt.text = " + nLife + "/" + _lifeMax);
      }
   }
};
_loc1.updateData = function()
{
   if(this._oSprite != undefined && this._oSprite != null)
   {
      _global.trace("[PARTY MEMBER] updateData: id=" + this._oSprite.id + ", name=" + this._oSprite.name + ", gfxFile=" + this._oSprite.gfxFile);
      _global.trace("[PARTY MEMBER] updateData: life=" + this._oSprite.life + ", lifeMax=" + this._oSprite.lifeMax);
      
      this._ldrSprite.contentPath = this._oSprite.gfxFile == undefined ? "" : this._oSprite.gfxFile;
      this.api.colors.addSprite(this._ldrSprite,this._oSprite);
      this._mcBack._visible = true;
      this._btn.enabled = true;
      this._btn._visible = true;
      this._mcHealth._visible = true;
      
      // Llamar a setHealth() como lo hace Casper
      if(this.setHealth != undefined)
      {
         this.setHealth(this._oSprite.life);
         _global.trace("[PARTY MEMBER] setHealth() llamado con: " + this._oSprite.life);
      }
      else
      {
         _global.trace("[PARTY MEMBER] WARNING: setHealth() no está definido");
      }
      
      this.isInGroup = true;
      // NO asignar _switchHero._visible aquí - el setter de isLeader ya lo maneja
      this._visible = true;
   }
   else
   {
      _global.trace("[PARTY MEMBER] updateData: _oSprite es null/undefined - clearing slot");
      this._ldrSprite.contentPath = "";
      this._mcBack._visible = false;
      this._mcFollow._visible = false;
      this._btn.enabled = false;
      this._btn._visible = false;
      this._mcHealth._visible = false;
      this.isInGroup = false;
      this._visible = false;
      this._switchHero._visible = false;
   }
};
_loc1.setData = function(oData)
{
   _global.trace("[PARTY MEMBER] setData llamado con: " + (oData ? "id=" + oData.id + ", name=" + oData.name + ", gfxid=" + oData.gfxid : "null/undefined"));
   
   if(oData == null || oData == undefined)
   {
      // Clear the slot
      this._oSprite = null;
      this.updateData();
      return;
   }
   
   // Construir gfxFile a partir de gfxid si no existe
   if(oData.gfxFile == undefined && oData.gfxid != undefined)
   {
      oData.gfxFile = dofus.Constants.CLIPS_PERSOS_PATH + oData.gfxid + ".swf";
      _global.trace("[PARTY MEMBER] gfxFile construido: " + oData.gfxFile);
   }
   
   // Parsear colores si es string
   if(typeof oData.colors == "string" && oData.colors != "")
   {
      var colors = oData.colors.split(",");
      oData.color1 = colors[0] != undefined && colors[0] != "-1" ? Number("0x" + colors[0]) : -1;
      oData.color2 = colors[1] != undefined && colors[1] != "-1" ? Number("0x" + colors[1]) : -1;
      oData.color3 = colors[2] != undefined && colors[2] != "-1" ? Number("0x" + colors[2]) : -1;
      _global.trace("[PARTY MEMBER] Colores parseados: " + oData.color1 + "," + oData.color2 + "," + oData.color3);
   }
   
   // Procesar accesorios: convertir de string hex a array de objetos Accessory
   // IMPORTANTE: Hacer copia del objeto para no modificar _aMembers original
   if(typeof oData.accessories == "string" && oData.accessories != "")
   {
      // Crear una copia temporal del objeto para procesar accesorios
      var _tempObj = {accessories:oData.accessories};
      this.api.kernel.CharactersManager.setSpriteAccessories(_tempObj, oData.accessories);
      // Copiar el array procesado al objeto original
      oData.accessories = _tempObj.accessories;
      _global.trace("[PARTY MEMBER] Accesorios procesados: " + (oData.accessories ? oData.accessories.length : 0) + " items");
   }
   else if(oData.accessories == undefined || (typeof oData.accessories == "string" && oData.accessories == ""))
   {
      // Si es un string vacío o undefined, convertir a array vacío
      oData.accessories = [];
   }
   
   this._oSprite = oData;
   this.updateData();
};
_loc1.click = function(_loc2_)
{
   if(_loc2_.target._name == "_switchHero")
   {
      this.api.network.send2(this._oSprite.id,"HL");
   }
   else
   {
      // Clic en el recuadro del miembro - Abrir panel de Stats
      _global.trace("[PARTY MEMBER] Click en miembro: id=" + this._oSprite.id + ", enviando HhStatsJob");
      this.api.network.send2(this._oSprite.id,"HhStatsJob");
   }
};
_loc1._isHero = false;
_loc1.addProperty("isHero",_loc1.__get__hero,_loc1.__set__hero);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error

// Agregar propiedades para isLeader e isInGroup
_loc1._bIsLeader = false;
_loc1.__get__isLeader = function()
{
   return this._bIsLeader;
};
_loc1.__set__isLeader = function(bVal)
{
   this._bIsLeader = bVal;
   _global.trace("[PARTY MEMBER] isLeader setter: " + bVal + ", _switchHero._visible será: " + !bVal);
   // Si es líder, ocultar el circulo de cambio; si no es líder, mostrar círculo
   this._switchHero._visible = !bVal;
   return bVal;
};
_loc1.addProperty("isLeader",_loc1.__get__isLeader,_loc1.__set__isLeader);

_loc1._bIsInGroup = false;
_loc1.__get__isInGroup = function()
{
   return this._bIsInGroup;
};
_loc1.__set__isInGroup = function(bVal)
{
   this._bIsInGroup = bVal;
   return bVal;
};
_loc1.addProperty("isInGroup",_loc1.__get__isInGroup,_loc1.__set__isInGroup);

_loc1 = dofus["\r\x14"].gapi.ui.EditPlayer.prototype;
_loc1.change = function(_loc2_)
{
   var _loc3_;
   var _loc4_;
   switch(_loc2_.target)
   {
      case this._csColorsName:
         this.setColorsName(_loc2_.value);
         break;
      case this._csColors:
         this.setColors(_loc2_.value);
         break;
      case this._itCharacterName:
         _loc3_ = this._itCharacterName.text;
         if(this.api.datacenter.Player.isAuthorized)
         {
            _loc3_ = _loc3_.substr(0,1).toUpperCase() + _loc3_.substr(1);
            _loc4_ = _loc3_.substr(0,1);
            _loc2_ = 1;
            while(_loc2_ < _loc3_.length)
            {
               if(_loc3_.substr(_loc2_ - 1,1) != "-")
               {
                  _loc4_ += _loc3_.substr(_loc2_,1).toLowerCase();
               }
               else
               {
                  _loc4_ += _loc3_.substr(_loc2_,1);
               }
               _loc2_ += 1;
            }
            this._itCharacterName.removeEventListener("change",this);
            this._itCharacterName.text = _loc4_;
            this._itCharacterName.textColor = this._nColorName;
            this._itCharacterName.addEventListener("change",this);
         }
      default:
         return;
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.ForgemagusCraftNew.prototype;
_loc1.createChildren = function()
{
   this._bMakeAll = false;
   this._mcPlacer._visible = false;
   this.addToQueue({object:this,method:this.addListeners});
   this._btnSelectedFilterButton = this._btnFilterRunes;
   this.addToQueue({object:this,method:this.initData});
   this.hideItemViewer(true);
   this.addToQueue({object:this,method:this.initTexts});
   this.historyList = new ank["\x1e\n\x07"]["\x0f\x01"]();
};
_loc1.fillForgeMagiaCraft = function(oItem)
{
   this._dgStats.dataProvider = null;
   var _loc19_ = oItem.split("|");
   var _loc22_ = _loc19_[0];
   var _loc23_ = _loc19_[1];
   var _loc21_ = _loc19_[2];
   var _loc20_ = _loc19_[3];
   var _loc17_ = this.api.lang.getItemStats(_loc22_).split(",");
   var _loc14_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc12_ = 0;
   var _loc3_;
   var _loc6_;
   var _loc15_;
   var _loc16_;
   var _loc9_;
   var _loc13_;
   while(_loc12_ < _loc17_.length)
   {
      _loc3_ = _loc17_[_loc12_].split("#");
      _loc6_ = {};
      _loc15_ = [];
      _loc3_[0] = _global.parseInt(_loc3_[0],16);
      _loc3_[1] = _loc3_[1] == "0" ? undefined : _global.parseInt(_loc3_[1],16);
      _loc3_[2] = _loc3_[2] == "0" ? undefined : _global.parseInt(_loc3_[2],16);
      _loc16_ = _loc3_[0] + "#0#0#0#0d0+0";
      _loc9_ = _loc16_.split("#");
      _loc9_[2] = undefined;
      _loc9_[3] = undefined;
      _loc15_.push(_loc9_);
      _loc13_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc15_);
      if(_loc13_[0] instanceof dofus.datacenter["\x0f\r"])
      {
         _loc6_.value = _loc13_[0].description;
      }
      _loc6_.id = _loc3_[0];
      _loc6_.min = !_global.isNaN(_loc3_[1]) ? _loc3_[1] : 1;
      _loc6_.max = !_global.isNaN(_loc3_[2]) ? _loc3_[2] : 1;
      _loc14_.push(_loc6_);
      _loc12_ = _loc12_ + 1;
   }
   var _loc18_ = _loc23_.split(";");
   var _loc11_ = 0;
   var _loc5_;
   var _loc10_;
   var _loc8_;
   var _loc4_;
   var _loc7_;
   while(_loc11_ < _loc18_.length)
   {
      _loc5_ = _loc18_[_loc11_].split("~");
      _loc10_ = Number(_loc5_[0]);
      _loc8_ = _loc14_.findFirstItem("id",_loc10_);
      _loc4_ = _loc5_[1].split("#");
      _loc15_ = [];
      _loc4_[0] = _global.parseInt(_loc4_[0],16);
      _loc4_[1] = _loc4_[1] == "0" ? undefined : _global.parseInt(_loc4_[1],16);
      _loc4_[2] = _loc4_[2] == "0" ? undefined : _global.parseInt(_loc4_[2],16);
      _loc4_[3] = _loc4_[3] == "0" ? undefined : _global.parseInt(_loc4_[3],16);
      _loc15_.push(_loc4_);
      _loc13_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc15_);
      if(_loc13_[0] instanceof dofus.datacenter["\x0f\r"])
      {
         if(_loc8_.index === -1 && _loc13_[0].description != "")
         {
            _loc7_ = {};
            _loc7_.id = _loc10_;
            _loc7_.min = 1;
            _loc7_.max = 1;
            _loc7_.isExo = true;
            _loc14_.push(_loc7_);
            _loc8_ = _loc14_.findFirstItem("id",_loc10_);
         }
         _loc8_.item.value = _loc13_[0].description;
      }
      _loc8_.item.runes = _loc5_[2] !== "null" ? _loc5_[2] : undefined;
      _loc8_.item.modify = _loc5_[3] !== "null" ? _loc5_[3] : undefined;
      _loc11_ = _loc11_ + 1;
   }
   this.historial(_loc21_);
   this._txtPozoValue.text = !_global.isNaN(_loc20_) ? _loc20_ : 0;
   this._dgStats.dataProvider = _loc14_;
};
_loc1.historyList = new ank["\x1e\n\x07"]["\x0f\x01"]();
_loc1.historial = function(sData)
{
   var _loc10_ = sData.split("~");
   var _loc8_ = _loc10_;
   var _loc11_ = true;
   var _loc9_ = 0;
   var _loc5_;
   var _loc4_;
   var _loc6_;
   var _loc3_;
   var _loc7_;
   for(_loc9_ in _loc8_)
   {
      _loc5_ = _loc8_[_loc9_];
      _loc4_ = new Object();
      _loc4_.exito = _loc5_.split(",")[1];
      if(_loc4_.exito != "2" && _loc4_.exito != "3")
      {
         _loc6_ = new Array();
         _loc3_ = _loc5_.split(",")[0].split("#");
         _loc3_[0] = _global.parseInt(_loc3_[0],16);
         _loc3_[1] = _loc3_[1] == "0" ? undefined : _global.parseInt(_loc3_[1],16);
         _loc3_[2] = _loc3_[2] == "0" ? undefined : _global.parseInt(_loc3_[2],16);
         _loc3_[3] = _loc3_[3] == "0" ? undefined : _global.parseInt(_loc3_[3],16);
         _loc6_.push(_loc3_);
         _loc7_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc6_);
         if(_loc7_[0] instanceof dofus.datacenter["\x0f\r"])
         {
            _loc4_.name = _loc7_[0].description;
         }
      }
      else
      {
         _loc4_.name = _loc5_.split(",")[0];
      }
      if(_loc4_.name != undefined && _loc4_.name != "")
      {
         this.historyList.push(_loc4_);
      }
   }
   this._dgLogros.dataProvider = this.historyList;
};
_loc1 = dofus["\r\x14"].gapi.controls.ConquestStatsViewer.prototype;
_loc1.addListeners = function()
{
   this._btnTogglePvP.addEventListener("click",this);
   this._btnTogglePvP.addEventListener("over",this);
   this._btnTogglePvP.addEventListener("out",this);
   this._btnDisgraceSanction.addEventListener("click",this);
   this._btnDisgraceSanction.addEventListener("over",this);
   this._btnDisgraceSanction.addEventListener("out",this);
   this.api.datacenter.Player.addEventListener("rankChanged",this);
   this.api.datacenter.Player.addEventListener("huntMatchmakingStatusChanged",this);
   this.api.datacenter.Player.addEventListener("alignmentChanged",this);
   this.api.datacenter.Conquest.addEventListener("bonusChanged",this);
   this._btnInformation.addEventListener("click",this);
   this._btnInformation.addEventListener("over",this);
   this._btnInformation.addEventListener("out",this);
   this._mcBonusInteractivity.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcBonusInteractivity.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._mcMalusInteractivity.onRollOver = function()
   {
      ref.over({target:this});
   };
   this._mcMalusInteractivity.onRollOut = function()
   {
      ref.out({target:this});
   };
   this._btnToggleHuntFinder.addEventListener("click",this);
   this._btnToggleHuntFinder.addEventListener("over",this);
   this._btnToggleHuntFinder.addEventListener("out",this);
   this._btnStartHunt.addEventListener("click",this);
   this._btnStartHunt.addEventListener("over",this);
   this._btnStartHunt.addEventListener("out",this);
};
_loc1.initData = function()
{
   this.api.network.Conquest.getAlignedBonus();
   this.rankChanged({rank:this.api.datacenter.Player.rank});
   this.alignmentChanged({alignment:this.api.datacenter.Player.alignment});
};
_loc1.rankChanged = function(_loc2_)
{
   this._oRank = _loc2_.rank;
   var _loc3_ = this.api.lang.getGradeHonourPointsBounds(this._oRank.value);
   this._pbHonour.maximum = _global.isNaN(_loc3_.max) ? 0 : _loc3_.max;
   this._pbHonour.minimum = _global.isNaN(_loc3_.min) ? 0 : _loc3_.min;
   this._pbHonour.value = _global.isNaN(this._oRank.honour) ? 0 : this._oRank.honour;
   this._mcHonour.onRollOver = function()
   {
      this._parent.gapi.showTooltip(new ank["\x1e\n\x07"]["\x0e\x1c"](this._parent._oRank.honour).addMiddleChar(this._parent.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " / " + new ank["\x1e\n\x07"]["\x0e\x1c"](this._parent._pbHonour.maximum).addMiddleChar(this._parent.api.lang.getConfigText("THOUSAND_SEPARATOR"),3),this,-10);
   };
   this._mcHonour.onRollOut = function()
   {
      this._parent.gapi.hideTooltip();
   };
   this._pbDishonour.maximum = this.api.lang.getMaxDisgracePoints();
   this._pbDishonour.value = this._oRank.disgrace;
   this._mcDishonour.onRollOver = function()
   {
      this._parent.gapi.showTooltip(new ank["\x1e\n\x07"]["\x0e\x1c"](this._parent._oRank.disgrace).addMiddleChar(this._parent.api.lang.getConfigText("THOUSAND_SEPARATOR"),3) + " / " + new ank["\x1e\n\x07"]["\x0e\x1c"](this._parent._pbDishonour.maximum).addMiddleChar(this._parent.api.lang.getConfigText("THOUSAND_SEPARATOR"),3),this,-10);
   };
   this._mcDishonour.onRollOut = function()
   {
      this._parent.gapi.hideTooltip();
   };
   var _loc4_;
   if(this._oRank.enable && this._lblHunt.text != undefined)
   {
      _loc4_ = this.api.datacenter.Player.alignment.index;
      this._btnTogglePvP.label = this.api.lang.getText("DISABLE_PVP_SHORT");
   }
   else if(this._lblHunt.text != undefined)
   {
      this._btnTogglePvP.label = this.api.lang.getText("ENABLE_PVP_SHORT");
   }
   this._btnDisgraceSanction._visible = this.api.datacenter.Player.rank.disgrace > 0;
};
_loc1.initTexts = function()
{
   this._lblHonour.text = this.api.lang.getText("HONOUR_POINTS");
   this._lblDishonour.text = this.api.lang.getText("DISGRACE_POINTS");
   this._lblBonus.text = this.api.lang.getText("ALIGNED_AREA_MODIFICATORS");
   this._lblType.text = this.api.lang.getText("TYPE");
   this._lblBonusTitle.text = this.api.lang.getText("BONUS");
   this._lblMalusTitle.text = this.api.lang.getText("MALUS");
   this._lblInfos.text = this.api.lang.getText("INFORMATIONS");
   this._txtInfos.text = this.api.lang.getText("RANK_SYSTEM_INFO");
   this._lblMalusTitle.text = this.api.lang.getText("MALUS");
   this._lblHunt.text = this.api.lang.getText("HUNT_FINDER");
   this._lblCommander.text = this.api.lang.getText("YOUR_COMMANDER");
   this._btnStartHunt.label = this.api.lang.getText("HUNT_START_BUTTON");
   this.updatePvPHuntFinderButtons();
};
_loc1.huntMatchmakingStatusChanged = function()
{
   this.updatePvPHuntFinderButtons();
};
_loc1.click = function(_loc2_)
{
   var _loc2_;
   switch(_loc2_.target)
   {
      case this._btnDisgraceSanction:
         this.api.kernel.GameManager.showDisgraceSanction();
         break;
      case this._btnTogglePvP:
         if(this.api.datacenter.Player.rank.enable)
         {
            this.api.network.Game.askDisablePVPMode();
         }
         else
         {
            this.api.network.Game.onPVP("",true);
         }
         break;
      case this._btnStartHunt:
         this.api.network.Game.hunterAcceptPvPHunt();
         break;
      case this._btnToggleHuntFinder:
         if(!this.api.datacenter.Player.rank.enable)
         {
            _loc2_ = this.api.lang.getText("DO_U_ATTACK_WHEN_PVP_DISABLED");
            this.api.kernel.showMessage(undefined,_loc2_,"CAUTION_YESNO",{name:"ToggleHuntFinder",listener:this});
         }
         else
         {
            this.api.network.Game.toggleHunterMatchmakingRegister();
         }
      default:
         return;
   }
};
_loc1.yes = function(_loc2_)
{
   if(_loc2_.target._name == "AskYesNoToggleHuntFinder")
   {
      if(!this.api.datacenter.Player.rank.enable)
      {
         this.api.network.Game.setPlayerPosition(true);
      }
      this.api.network.Game.toggleHunterMatchmakingRegister();
   }
};
_loc1.over = function(_loc2_)
{
   switch(_loc2_.target)
   {
      case this._btnTogglePvP:
         this.gapi.showTooltip(this.api.lang.getText(this._oRank.enable ? "DISABLE_PVP" : "ENABLE_PVP"),this._btnTogglePvP,-20);
         break;
      case this._btnDisgraceSanction:
         this.gapi.showTooltip(this.api.lang.getText("DISGRACE_SANCTION_TOOLTIP"),this._btnDisgraceSanction,-20);
         break;
      case this._mcBonusInteractivity:
         this.gapi.showTooltip(this.api.lang.getText("CONQUEST_STATS_BONUS"),this._mcBonusInteractivity,-70);
         break;
      case this._btnInformation:
         this.gapi.showTooltip(this.api.lang.getText("RANK_SYSTEM_INFO"),this._btnDisgraceSanction,-20);
         break;
      case this._mcMalusInteractivity:
         this.gapi.showTooltip(this.api.lang.getText("CONQUEST_STATS_MALUS"),this._mcMalusInteractivity,-40);
      default:
         return;
   }
};
_loc1.alignmentChanged = function(_loc2_)
{
   if(_loc2_.alignment.index == 0 || _loc2_.alignment.index == 3)
   {
      this._mcCharacter.gotoAndStop(0);
      this._lblCommanderName.text = "-";
   }
   else
   {
      this._mcCharacter.gotoAndStop(_loc2_.alignment.index + 1);
      this._lblCommanderName.text = this.api.lang.getText("COMMANDER_ALIGN_" + _loc2_.alignment.index);
   }
};
_loc1.updatePvPHuntFinderButtons = function()
{
   var _loc2_ = this.api.datacenter.Player.isHuntMatchmakingActive();
   if(_loc2_ && this.api.datacenter.Player.huntMatchmakingStatus.currentStatus == "WAITING_FOR_START_CONFIRMATION")
   {
      this._btnStartHunt._visible = true;
      this._btnToggleHuntFinder._visible = false;
   }
   else
   {
      this._btnToggleHuntFinder.label = _loc2_ ? this.api.lang.getText("HUNT_STOP_FINDER") : this.api.lang.getText("HUNT_START_FINDER");
      this._btnToggleHuntFinder._visible = true;
      this._btnStartHunt._visible = false;
   }
};
_loc1 = dofus["\r\x14"].gapi.ui.ForgemagusCraftNew.prototype;
_loc1.createChildren = function()
{
   this._bMakeAll = false;
   this._mcPlacer._visible = false;
   this.addToQueue({object:this,method:this.addListeners});
   this._btnSelectedFilterButton = this._btnFilterRunes;
   this.addToQueue({object:this,method:this.initData});
   this.hideItemViewer(true);
   this.addToQueue({object:this,method:this.initTexts});
   this.historyList = new ank["\x1e\n\x07"]["\x0f\x01"]();
};
_loc1.fillForgeMagiaCraft = function(oItem)
{
   this._dgStats.dataProvider = null;
   var _loc20_ = oItem.split("|");
   var _loc22_ = this.api.lang.getItemStats(_loc20_[0]);
   var _loc19_ = _loc22_.split(",");
   var _loc12_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc13_ = 0;
   var _loc21_ = _loc20_[1];
   var _loc3_;
   var _loc5_;
   var _loc15_;
   var _loc18_;
   var _loc11_;
   var _loc14_;
   while(_loc13_ < _loc19_.length)
   {
      _loc3_ = _loc19_[_loc13_].split("#");
      _loc5_ = new Object();
      _loc15_ = new Array();
      _loc3_[0] = _global.parseInt(_loc3_[0],16);
      _loc3_[1] = _loc3_[1] == "0" ? undefined : _global.parseInt(_loc3_[1],16);
      _loc3_[2] = _loc3_[2] == "0" ? undefined : _global.parseInt(_loc3_[2],16);
      _loc18_ = _loc3_[0] + "#0#0#0#0d0+0";
      _loc11_ = _loc18_.split("#");
      _loc11_[2] = undefined;
      _loc11_[3] = undefined;
      _loc15_.push(_loc11_);
      _loc14_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc15_);
      if(_loc14_[0] instanceof dofus.datacenter["\x0f\r"])
      {
         _loc5_.value = _loc14_[0].description;
      }
      _loc5_.id = _loc3_[0];
      _loc5_.min = !_global.isNaN(_loc3_[1]) ? _loc3_[1] : 1;
      _loc5_.max = !_global.isNaN(_loc3_[2]) ? _loc3_[2] : 1;
      _loc12_.push(_loc5_);
      _loc13_ += 1;
   }
   var _loc7_ = _loc21_.split(";");
   var _loc6_ = 0;
   var _loc10_;
   var _loc8_;
   var _loc17_;
   var _loc16_;
   var _loc4_;
   var _loc9_;
   while(_loc6_ < _loc7_.length)
   {
      _loc10_ = Number(_loc7_[_loc6_].split("~")[0]);
      _loc8_ = _loc12_.findFirstItem("id",_loc10_);
      _loc17_ = _loc7_[_loc6_].split("~")[1];
      _loc16_ = new Array();
      _loc4_ = _loc17_.split("#");
      _loc4_[0] = _global.parseInt(_loc4_[0],16);
      _loc4_[1] = _loc4_[1] == "0" ? undefined : _global.parseInt(_loc4_[1],16);
      _loc4_[2] = _loc4_[2] == "0" ? undefined : _global.parseInt(_loc4_[2],16);
      _loc4_[3] = _loc4_[3] == "0" ? undefined : _global.parseInt(_loc4_[3],16);
      _loc16_.push(_loc4_);
      _loc9_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc16_);
      if(_loc9_[0] instanceof dofus.datacenter["\x0f\r"])
      {
         if(_loc8_.index == -1 && _loc9_[0].description != "" && _loc9_[0].description != undefined)
         {
            _loc5_ = new Object();
            _loc5_.id = _loc10_;
            _loc5_.min = 1;
            _loc5_.max = 1;
            _loc5_.isExo = true;
            _loc12_.push(_loc5_);
            _loc8_ = _loc12_.findFirstItem("id",_loc10_);
         }
         _loc8_.item.value = _loc9_[0].description;
      }
      _loc8_.item.runes = _loc7_[_loc6_].split("~")[2] != "null" ? _loc7_[_loc6_].split("~")[2] : undefined;
      _loc8_.item.modify = _loc7_[_loc6_].split("~")[3] != "null" ? _loc7_[_loc6_].split("~")[3] : undefined;
      _loc6_ += 1;
   }
   this.historial(_loc20_[2]);
   this._txtPozoValue.text = !_global.isNaN(_loc20_[3]) ? _loc20_[3] : 0;
   this._dgStats.dataProvider = _loc12_;
};
_loc1.historyList = new ank["\x1e\n\x07"]["\x0f\x01"]();
_loc1.historial = function(sData)
{
   var _loc10_ = sData.split("~");
   var _loc8_ = _loc10_;
   var _loc11_ = true;
   var _loc9_ = 0;
   var _loc5_;
   var _loc4_;
   var _loc6_;
   var _loc3_;
   var _loc7_;
   for(_loc9_ in _loc8_)
   {
      _loc5_ = _loc8_[_loc9_];
      _loc4_ = new Object();
      _loc4_.exito = _loc5_.split(",")[1];
      if(_loc4_.exito != "2" && _loc4_.exito != "3")
      {
         _loc6_ = new Array();
         _loc3_ = _loc5_.split(",")[0].split("#");
         _loc3_[0] = _global.parseInt(_loc3_[0],16);
         _loc3_[1] = _loc3_[1] == "0" ? undefined : _global.parseInt(_loc3_[1],16);
         _loc3_[2] = _loc3_[2] == "0" ? undefined : _global.parseInt(_loc3_[2],16);
         _loc3_[3] = _loc3_[3] == "0" ? undefined : _global.parseInt(_loc3_[3],16);
         _loc6_.push(_loc3_);
         _loc7_ = dofus.datacenter["\f\f"].getItemDescriptionEffects(_loc6_);
         if(_loc7_[0] instanceof dofus.datacenter["\x0f\r"])
         {
            _loc4_.name = _loc7_[0].description;
         }
      }
      else
      {
         _loc4_.name = _loc5_.split(",")[0];
      }
      if(_loc4_.name != undefined && _loc4_.name != "")
      {
         this.historyList.push(_loc4_);
      }
   }
   this._dgLogros.dataProvider = this.historyList;
};
_loc1 = dofus["\r\x14"].gapi.controls.GridInventoryViewer.prototype;
_loc1.validateDrop = function(_loc2_, _loc3_, _loc4_)
{
   _loc4_ = Number(_loc4_);
   if(_loc4_ < 1 || _global.isNaN(_loc4_))
   {
      return undefined;
   }
   if(_loc4_ > _loc3_.Quantity)
   {
      _loc4_ = _loc3_.Quantity;
   }
   this.dispatchEvent({type:"dropItem",item:_loc3_,quantity:_loc4_,owner:this});
};
_loc1.dblClickItem = function(_loc2_)
{
   this.dispatchEvent({type:_loc2_.type,item:_loc2_.target.contentData,target:this,targets:_loc2_.targets,index:_loc2_.target.id,owner:this});
};
_loc1 = dofus["\r\x14"].gapi.ui.CreateCharacter.prototype;
_loc1.click = function(oEvent)
{
   switch(oEvent.target)
   {
      case this._mcRight:
         this._csBreedSelection.slide(1);
         break;
      case this._mcLeft:
         this._csBreedSelection.slide(-1);
         break;
      case this._mcMaleButton:
         this.setClass(this._nBreed,0);
         break;
      case this._mcFemaleButton:
         this.setClass(this._nBreed,1);
         break;
      case this._mcSpellButton2:
      case this._mcSpellButton:
         this.api.ui.loadUIComponent("SpellViewerOnCreate","SpellViewerOnCreate",{breed:this._nBreed});
         break;
      case this._mcHistoryButton:
         this.api.ui.loadUIComponent("HistoryViewerOnCreate","HistoryViewerOnCreate",{breed:this._nBreed});
         break;
      case this._btnValidate:
         this.validateCreation();
         break;
      case this._btnBack:
         if(this.modeHero)
         {
            this.unloadThis();
         }
         else if(this.api.datacenter.Basics.createCharacter)
         {
            this.api.kernel.changeServer(true);
         }
         else
         {
            this.api.datacenter.Basics.ignoreCreateCharacter = true;
            this.api.network.Account.getCharactersForced();
         }
         break;
      case this._mcRandomName:
         if(this._nLastRegenerateTimer + dofus["\r\x14"].gapi.ui.CreateCharacter.NAME_GENERATION_DELAY < getTimer())
         {
            this.api.network.Account.getRandomCharacterName();
            this._nLastRegenerateTimer = getTimer();
         }
      default:
         return;
   }
};
_loc1.validateCreation = function()
{
   var _loc3_ = this._itCharacterName.text;
   if(_loc3_.length == 0 || _loc3_ == undefined)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("NEED_CHARACTER_NAME"),"ERROR_BOX",{name:"CREATENONAME"});
      return undefined;
   }
   if(_loc3_.length > 20)
   {
      this.api.kernel.showMessage(undefined,this.api.lang.getText("LONG_CHARACTER_NAME",[_loc3_,20]),"ERROR_BOX");
      return undefined;
   }
   var _loc8_;
   var _loc5_;
   var _loc4_;
   if(this.api.lang.getConfigText("CHAR_NAME_FILTER") && !this.api.datacenter.Player.isAuthorized)
   {
      _loc8_ = new dofus["\x1e\n\x07"]["\b\x16"]["\b\x17"](_loc3_);
      _loc5_ = new dofus["\x1e\n\x07"]["\b\x16"]["\x1e\x15\x01"].NameCheckerCharacterNameRules();
      _loc4_ = _loc8_.isValidAgainstWithDetails(_loc5_);
      if(!_loc4_.IS_SUCCESS)
      {
         this.api.kernel.showMessage(undefined,this.api.lang.getText("INVALID_CHARACTER_NAME") + "\r\n" + _loc4_.toString("\r\n"),"ERROR_BOX");
         return undefined;
      }
   }
   var _loc7_;
   if(dofus.Constants.EPISODIC_GUILD[this._nBreed - 1] > this.api.datacenter.Basics.aks_current_regional_version)
   {
      _loc7_ = this.api.lang.getClassText(this._nBreed).sn;
      this.api.kernel.showMessage(undefined,this.api.lang.getText("COMING_SOON_GUILD",[_loc7_]),"ERROR_BOX");
      return undefined;
   }
   var _loc6_;
   if(dofus.Constants.PAYING_GUILD[this._nBreed - 1] && this._nRemainingTime <= 0)
   {
      _loc6_ = this.api.lang.getClassText(this._nBreed).sn;
      this.api.kernel.showMessage(undefined,this.api.lang.getText("PAYING_GUILD",[_loc6_]),"ERROR_BOX");
      return undefined;
   }
   this.api.datacenter.Basics.hasCreatedCharacter = true;
   if(dofus.Constants.USE_JS_LOG && _global.CONFIG.isNewAccount)
   {
      this.getURL("JavaScript:WriteLog(\'addCharacter;" + _loc3_ + "\')");
   }
   // Ensure _oColors is initialized before using it
   if(this._oColors == undefined || this._oColors == null)
   {
      this._oColors = {color1:-1, color2:-1, color3:-1};
   }
   if(this.modeHero)
   {
      this.api.network.Account.addCharacterHero(_loc3_,this._nBreed,this._oColors.color1,this._oColors.color2,this._oColors.color3,this._nSex);
   }
   else
   {
      this.api.network.Account.addCharacter(_loc3_,this._nBreed,this._oColors.color1,this._oColors.color2,this._oColors.color3,this._nSex);
   }
};