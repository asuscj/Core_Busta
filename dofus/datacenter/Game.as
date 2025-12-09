var _loc1 = dofus.datacenter.Game.prototype;
_loc1.__set__results = function(oResults)
{
   this._oResults = oResults;
};
_loc1.__get__results = function()
{
   return this._oResults;
};
_loc1.__get__resultsArray = function()
{
   return dofus.datacenter.Game._aResults;
};
_loc1.__set__currentPlayerWithGlowID = function(sCurrentPlayerWithGlowID)
{
   this._sCurrentPlayerWithGlowID = sCurrentPlayerWithGlowID;
};
_loc1.__get__currentPlayerWithGlowID = function()
{
   return this._sCurrentPlayerWithGlowID;
};
_loc1.storeFightResults = function(oResults)
{
   if(dofus.datacenter.Game._aResults.length >= this.api.lang.getConfigText("MAX_FIGHT_HISTORY"))
   {
      dofus.datacenter.Game._aResults.pop();
      dofus.datacenter.Game._aResults.unshift(oResults);
   }
   else
   {
      dofus.datacenter.Game._aResults.unshift(oResults);
   }
};
_loc1.addSprite = function(nID)
{
   this.arraySprites.push(nID);
};
_loc1.clearSprites = function()
{
   this.arraySprites = new Array();
};
_loc1.getSprites = function()
{
   return this.arraySprites;
};
_loc1.setInteractionType = function(sType)
{
   switch(sType)
   {
      case "move":
         this._nInteractionType = 1;
         break;
      case "spell":
         this._nInteractionType = 2;
         break;
      case "cc":
         this._nInteractionType = 3;
         break;
      case "place":
         this._nInteractionType = 4;
         break;
      case "target":
         this._nInteractionType = 5;
         break;
      case "flag":
         this._nInteractionType = 6;
         break;
      case "fightpos":
         this._nInteractionType = 7;
         break;
      case "trigger":
         this._nInteractionType = 8;
      default:
         return;
   }
};
_global.dofus.datacenter.Game._aResults = new ank["\x1e\n\x07"]["\x0f\x01"]();
_loc1.arraySprites = new Array();
_loc1.addProperty("currentPlayerWithGlowID",_loc1.__get__currentPlayerWithGlowID,_loc1.__set__currentPlayerWithGlowID);
_loc1.addProperty("results",_loc1.__get__results,_loc1.__set__results);
_loc1.addProperty("resultsArray",_loc1.__get__resultsArray,function()
{
}
);
