_global.dofus["\r\x14"].gapi.controls.LadderPeleas = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.LadderPeleas.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.LadderPeleas.prototype;
_loc1.__set__list = function(mcList)
{
   this._mcList = mcList;
};
_loc1.setValue = function(bUsed, sSuggested, oItem)
{
   if(bUsed)
   {
      this.sPerso = oItem.perso;
      this._lblMap.text = oItem.mapa;
      this._lblVs.text = oItem.versus;
      this._mcEye._visible = oItem.perso == undefined ? false : true;
   }
   else if(this._lblName.text != undefined)
   {
      this._lblMap.text = "";
      this._lblVs.text = "";
      this._mcEye._visible = false;
   }
};
_loc1.addListeners = function()
{
   var ref = this;
   this._mcEye.onRelease = function()
   {
      ref._mcList._parent._parent.joinSpectator(ref.sPerso);
   };
};
_loc1.init = function()
{
   super.init(false);
   this.addToQueue({object:this,method:this.addListeners});
   this._mcEye._visible = false;
};
_loc1.addProperty("list",function()
{
}
,_loc1.__set__list);
_loc1.sPerso = 0;
ASSetPropFlags(_loc1,null,1);
