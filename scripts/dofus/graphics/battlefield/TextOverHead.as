#initclip 66
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
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x06"] = function(sText, sFile, nColor, nFrame, nPvpGain, title, sFile2, nOrnamento, title2)
{
   super();
   this.initialize(title != undefined,title2 != undefined);
   this.draw(sText,sFile,nColor,nFrame,nPvpGain,title,sFile2,nOrnamento,title2);
};
_global.dofus["\r\x14"].battlefield["\x1e\x0b\x06"].prototype = new dofus["\r\x14"].battlefield["\x14"]();
var _loc1 = _global.dofus["\r\x14"].battlefield["\x1e\x0b\x06"].prototype;
_loc1.initialize = function(displayTitle, displayTitle2)
{
   super.initialize();
   this.createTextField("_txtText",30,0,-3 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
   if(displayTitle)
   {
      this.createTextField("_txtTitle",31,0,-3 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
      this._txtTitle.embedFonts = true;
   }
   if(displayTitle2)
   {
      this.createTextField("_txtTitle2",32,0,-3 + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER,0,0);
      this._txtTitle2.embedFonts = true;
   }
   this._txtText.embedFonts = true;
};
_loc1.draw = function(sText, sFile, nColor, nFrame, nPvpGain, title, sFile2, nOrnamento, title2)
{
   var _loc10_ = sFile != undefined && nFrame != undefined;
   if(nPvpGain == undefined)
   {
      nPvpGain = 0;
   }
   this._txtText.autoSize = "center";
   this._txtText.text = sText;
   this._txtText.selectable = false;
   this._txtText.setTextFormat(_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.TEXT_FORMAT);
   if(nColor != undefined)
   {
      this._txtText.textColor = nColor;
   }
   var _loc3_;
   var _loc4_;
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
      this._txtTitle2._y = this._txtText._y + (_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER - 1.2) + this._txtText.textHeight;
      _loc3_ = Math.ceil(this._txtText.textHeight + this._txtTitle2.textHeight + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 3);
      _loc4_ = Math.ceil(Math.max(this._txtText.textWidth,this._txtTitle2.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2);
   }
   else
   {
      _loc3_ = Math.ceil(this._txtText.textHeight + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 2);
      _loc4_ = Math.ceil(this._txtText.textWidth + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2);
   }
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
         this._txtTitle._y = this._txtText._y + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + this._txtText.textHeight + this._txtTitle2.textHeight;
         _loc3_ = Math.ceil(this._txtText.textHeight + this._txtTitle2.textHeight + this._txtTitle.textHeight + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 3);
         _loc4_ = Math.ceil(Math.max(Math.max(this._txtText.textWidth,this._txtTitle.textWidth),this._txtTitle2.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2);
      }

      else
      {
         this._txtTitle._y = this._txtText._y + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER + this._txtText.textHeight;
         _loc3_ = Math.ceil(this._txtText.textHeight + this._txtTitle.textHeight + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.HEIGHT_SPACER * 3);
         _loc4_ = Math.ceil(Math.max(this._txtText.textWidth,this._txtTitle.textWidth) + _global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.WIDTH_SPACER * 2);
      }
   }
   var _loc7_;
   if(!_global.isNaN(nOrnamento) && nOrnamento > 0 && _global.API.kernel.OptionsManager.getOption("ViewOrnements"))
   {
      _loc7_ = 0;
      if(_loc4_ < 120)
      {
         _loc4_ = 120;
      }
      if(_loc3_ < 30)
      {
         _loc7_ = (30 - _loc3_) / 2;
         _loc3_ = 30;
      }
      this.drawOrnamentos(sFile2,nOrnamento,{ancho:_loc4_,alto:_loc3_,medio:_loc7_});
   }
   else
   {
      this.drawBackground(_loc4_,_loc3_,_global.palmad.dofus.graphics.battlefield.AbstractTextOverHead.BACKGROUND_COLOR);
   }
   if(_loc10_)
   {
      this.drawGfx(sFile,nFrame);
      this.addPvpGfxEffect(nPvpGain,nFrame);
   }
};
ASSetPropFlags(_loc1,null,1);
#endinitclip