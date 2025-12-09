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
if(!dofus["\r\x14"].gapi.ui.dungeonSelector)
{
   _global.dofus["\r\x14"].gapi.ui.dungeonSelector = new Object();
}
_global.dofus["\r\x14"].gapi.ui.dungeonSelector.DungeonSelectorItem = function()
{
   super();
};
_global.dofus["\r\x14"].gapi.ui.dungeonSelector.DungeonSelectorItem.prototype = new dofus["\r\x14"].gapi.core["\x10\x19"]();
var _loc1 = _global.dofus["\r\x14"].gapi.ui.dungeonSelector.DungeonSelectorItem.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this._oItem = oItem;
      this._ldr.contentPath = dofus.Constants.DUNGEON_GFX + oItem.id + ".png";
      this._lblName._visible = true;
      this._lblLevel._visible = true;
      this._lblName.text = oItem.name;
      this._ldr._visible = true;
      this._lblLevel.text = _global.API.lang.getText("LEVEL") + " " + oItem.level;
      this._mcBg._visible = true;
      this._check._visible = oItem.completo;
   }
   else
   {
      this._ldr._visible = false;
      this._mcBg._visible = false;
      this._check._visible = false;
      this._lblName._visible = false;
      this._lblLevel._visible = false;
   }
};
_loc1.init = function()
{
   super.init(false);
   this._mcBg._visible = false;
   this._check._visible = false;
};
loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
