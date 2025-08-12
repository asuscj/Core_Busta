#initclip 62
if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus["\r\x14"])
{
   _global.dofus["\r\x14"] = new Object();
}
if(!dofus["\r\x14"].battlefield)
{
   _global.dofus["\r\x14"].battlefield = new Object();
}
_global.dofus["\r\x14"].battlefield["\r\f"] = function(sText, sSpriteName, oEmblem, sFile, nFrame, nPvpGain, title, sFile2, nOrnamento, nColorNombre, title2)
{
   super();
   this.initialize(title != undefined,title2 != undefined);
   this.draw(sText,sSpriteName,oEmblem,sFile,nFrame,nPvpGain,title,sFile2,nOrnamento,nColorNombre,title2);
};
_global.dofus["\r\x14"].battlefield["\r\f"].prototype = new dofus["\r\x14"].battlefield["\x14"]();
var _loc1 = _global.dofus["\r\x14"].battlefield["\r\f"].prototype;
_loc1.initialize = function(displayTitle, displayTitle2)
{
   super.initialize();
   this.createTextField("_txtGuildName",30,0,-2 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
   this.createTextField("_txtSpriteName",33,0,13 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
   if(displayTitle)
   {
      this.createTextField("_txtTitle",31,0,-2 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
      this._txtTitle.embedFonts = true;
   }
   if(displayTitle2)
   {
      this.createTextField("_txtTitle2",32,0,-2 + dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
      this._txtTitle2.embedFonts = true;
   }
};
_loc1.draw = function(sGuildName, sSpriteName, oEmblem, sFile, nFrame, nPvpGain, title, sFile2, nOrnamento, nColorNombre, title2)
{
   var _loc13_ = sFile != undefined && nFrame != undefined;
   if(nPvpGain == undefined)
   {
      nPvpGain = 0;
   }
   this._txtGuildName.embedFonts = true;
   this._txtGuildName.autoSize = "left";
   this._txtGuildName.text = sGuildName;
   this._txtGuildName.selectable = false;
   this._txtGuildName.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_SMALL_FORMAT);
   this._txtSpriteName.embedFonts = true;
   this._txtSpriteName.autoSize = "left";
   this._txtSpriteName.text = sSpriteName;
   this._txtSpriteName.selectable = false;
   this._txtSpriteName.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
   if(nColorNombre != undefined)
   {
      this._txtSpriteName.textColor = nColorNombre;
   }
   var _loc7_ = 0;
   var _loc4_;
   var _loc5_;
   var _loc3_;
   if(title2)
   {
      this._txtTitle2.autoSize = "center";
      this._txtTitle2.text = title2.text;
      this._txtTitle2.selectable = false;
      this._txtTitle2.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT2);
      if(title2.color != undefined)
      {
         this._txtTitle2.textColor = title2.color;
      }
      _loc4_ = Math.ceil(27 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 3 + this._txtTitle2.textHeight);
      _loc5_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 4) + 55;
      _loc3_ = Math.ceil(Math.max(_loc5_,this._txtTitle2.textWidth + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2));
      _loc7_ = _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + this._txtTitle2.textHeight;
      this._txtGuildName._x = this._txtSpriteName._x = (- _loc3_) / 2 + 30 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2;
      this._txtTitle2._y = 23 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2;
   }
   else
   {
      _loc4_ = Math.ceil(27 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2);
      _loc3_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 4) + 50;
      this._txtGuildName._x = this._txtSpriteName._x = (- _loc3_) / 2 + 30 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2;
   }
   var _loc11_;
   if(title)
   {
      this._txtTitle.autoSize = "center";
      this._txtTitle.text = title.text;
      this._txtTitle.selectable = false;
      this._txtTitle.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT2);
      if(title.color != undefined)
      {
         this._txtTitle.textColor = title.color;
      }
      if(title2)
      {
         _loc4_ = Math.ceil(27 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 3 + this._txtTitle.textHeight + this._txtTitle2.textHeight);
         _loc5_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth + 5) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 4) + 65;
         _loc3_ = Math.ceil(Math.max(_loc5_,this._txtTitle.textWidth + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2));
         _loc11_ = Math.ceil(Math.max(_loc3_,this._txtTitle2.textWidth + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2));
         _loc7_ = _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + this._txtTitle.textHeight + this._txtTitle2.textHeight;
         this._txtGuildName._x = this._txtSpriteName._x = (- _loc11_) / 2 + 30 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2;
         this._txtTitle._y = 32 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2;
         _loc3_ = _loc11_;
      }
      else
      {
         _loc4_ = Math.ceil(27 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 3 + this._txtTitle.textHeight);
         if(!_global.isNaN(nOrnamento) && nOrnamento > 0)
         {
            _loc5_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 4) + 50;
         }
         else
         {
            _loc5_ = Math.ceil(Math.max(this._txtGuildName.textWidth,this._txtSpriteName.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 4) + 55;
         }
         _loc3_ = Math.ceil(Math.max(_loc5_,this._txtTitle.textWidth + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 3));
         _loc7_ = _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + this._txtTitle.textHeight;
         this._txtGuildName._x = this._txtSpriteName._x = (- _loc3_) / 2 + 30 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2;
         this._txtTitle._y = 23 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2;
      }
   }
   var _loc9_;
   if(!_global.isNaN(nOrnamento) && nOrnamento > 0)
   {
      _loc9_ = 0;
      if(_loc3_ < 120)
      {
         _loc3_ = 120;
      }
      if(_loc4_ < 30)
      {
         _loc9_ = (30 - _loc4_) / 2;
         _loc4_ = 30;
      }
      this.drawOrnamentos(sFile2,nOrnamento,{ancho:_loc3_,alto:_loc4_,medio:_loc9_});
   }
   else
   {
      this.drawBackground(_loc3_,_loc4_,_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.BACKGROUND_COLOR);
   }
   this.attachMovie("Emblem","_eEmblem",100,{_x:Math.ceil((- _loc3_) / 2) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER + 5,_y:_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + 3,_height:25,_width:25,data:oEmblem,shadow:true});
   if(_loc13_)
   {
      this.drawGfx(sFile,nFrame);
      this.addPvpGfxEffect(nPvpGain,nFrame);
   }
};
ASSetPropFlags(_loc1,null,1);
#endinitclip