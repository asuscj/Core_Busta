_global.ank.gapi.controls.ToolTip = function()
{
   super();
};
ank.gapi.controls.ToolTip.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = ank.gapi.controls.ToolTip.prototype;
ank.gapi.controls.ToolTip.CLASS_NAME = "ToolTip";
ank.gapi.controls.ToolTip.MAX_WIDTH = 250;
_loc1.__set__params = function(oParams)
{
   this._oParams = oParams;
};
_loc1.__set__text = function(sText)
{
   this._sText = sText;
   if(this.initialized)
   {
      this._mcBackground.clear();
      this.draw();
   }
};
_loc1.__set__x = function(nX)
{
   this._nX = nX;
   if(this.initialized)
   {
      this.placeToolTip();
   }
};
_loc1.__set__y = function(nY)
{
   this._nY = nY;
   if(this.initialized)
   {
      this.placeToolTip();
   }
};
_loc1.init = function()
{
   super.init(false,ank.gapi.controls.ToolTip.CLASS_NAME);
};
_loc1.createChildren = function()
{
   this._visible = false;
   this.createEmptyMovieClip("_mcBackground",10);
   this.createTextField("_tfText",20,0,0,ank.gapi.controls.ToolTip.MAX_WIDTH,100);
   this._tfText.wordWrap = true;
   this._tfText.selectable = false;
   this._tfText.autoSize = "left";
   this._tfText.multiline = true;
   this._tfText.html = true;
   this.addToQueue({object:this,method:this.placeToolTip});
   Key.addListener(this);
};
_loc1.placeToolTip = function()
{
   var _loc4_ = this._oParams.bXLimit || this._oParams.bXLimit == undefined ? this.gapi.screenWidth : 1.7976931348623157e+308;
   var _loc5_ = this._oParams.bYLimit || this._oParams.bYLimit == undefined ? this.gapi.screenHeight : 1.7976931348623157e+308;
   var _loc6_ = !this._oParams.bRightAlign || this._oParams.bRightAlign == undefined ? false : this._oParams.bRightAlign;
   var _loc7_ = !this._oParams.bTopAlign || this._oParams.bTopAlign == undefined ? false : this._oParams.bTopAlign;
   var _loc2_ = _loc6_ ? this._nX - this.__width : this._nX;
   var _loc3_ = _loc7_ ? this._nY - this.__height : this._nY;
   if(_loc2_ > _loc4_ - this.__width)
   {
      this._x = _loc4_ - this.__width;
   }
   else if(_loc2_ < 0)
   {
      this._x = 0;
   }
   else
   {
      this._x = _loc2_;
   }
   if(_loc3_ > _loc5_ - this.__height)
   {
      this._y = _loc5_ - this.__height;
   }
   else if(_loc3_ < 0)
   {
      this._y = 0;
   }
   else
   {
      this._y = _loc3_;
   }
   this._visible = true;
};
_loc1.draw = function()
{
   var _loc2_ = this.getStyle();
   this._tfTextFormat = new TextFormat();
   this._tfTextFormat.font = _loc2_.font;
   this._tfTextFormat.size = _loc2_.size;
   this._tfTextFormat.color = _loc2_.color;
   if(!this._tfText.html)
   {
      this._tfTextFormat.bold = _loc2_.bold;
      this._tfTextFormat.italic = _loc2_.italic;
      this._tfText.text = this._sText;
   }
   else
   {
      this._tfText.htmlText = this._sText;
   }
   this._tfText.setTextFormat(this._tfTextFormat);
   this._tfText.embedFonts = _loc2_.embedfonts;
   this._tfText.antiAliasType = _loc2_.antialiastype;
   this.setSize(this._tfText.textWidth + 10,this._tfText.textHeight + 10);
   this._tfText._x = 2.5;
   this._tfText._y = 2.4;
   this.drawRoundRect(this._mcBackground,0,0,this.__width,this.__height,3,_loc2_.bgcolor,_loc2_.bgalpha);
};
_loc1.onKeyDown = function()
{
   this.removeMovieClip();
};
_loc1.onMouseDown = function()
{
   this.removeMovieClip();
};
_loc1.addProperty("params",function()
{
   return this._oParams;
}
,_loc1.__set__params);
_loc1.addProperty("text",function()
{
   return this._sText;
}
,_loc1.__set__text);
_loc1.addProperty("x",function()
{
   return this._nX;
}
,_loc1.__set__x);
_loc1.addProperty("y",function()
{
   return this._nY;
}
,_loc1.__set__y);
