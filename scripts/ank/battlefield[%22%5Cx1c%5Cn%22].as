#initclip 48
var _loc1 = ank.battlefield["\x1c\n"].prototype;
_loc1.addSpriteBubble(sID,_loc3_,_loc4_);
this.api.kernel.showMessage(undefined,"spriteBubble: " + sID + " | " + this._oDatacenter.Sprites.getItemAt(sID),"COMMANDS_CHAT");
var _loc5_ = this._oDatacenter.Sprites.getItemAt(sID);
if(_loc5_ == undefined)
{
   ank["\x1e\n\x07"]["\x0b\f"].err("[addSpriteBubble] Sprite inexistant (sprite Id : " + sID + ")");
   return undefined;
}
if(_loc5_.isInMove)
{
   return undefined;
}
if(!_loc5_.isVisible)
{
   return undefined;
}
var _loc6_ = _loc5_.mc;
var _loc7_ = _loc6_._x;
var _loc8_ = _loc6_._y;
if(_loc4_ == undefined)
{
   _loc4_ = ank.battlefield["\x1e\x0b\x07"].BUBBLE_TYPE_CHAT;
}
if(_loc7_ == 0 || _loc8_ == 0)
{
   ank["\x1e\n\x07"]["\x0b\f"].err("[addSpriteBubble] le sprite n\'est pas encore placé");
   return undefined;
}
this.textHandler.addBubble(sID,_loc7_,_loc8_,_loc3_,_loc4_);
#endinitclip