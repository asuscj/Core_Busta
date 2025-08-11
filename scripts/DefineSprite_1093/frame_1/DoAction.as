this.colorear = function(color)
{
   var _loc2_ = [39168,16776960,16724736,255];
   var _loc4_ = new Color(this._borde);
   _loc4_.setRGB(_loc2_[color]);
   var _loc3_ = new Color(this._contenido);
   _loc3_.setRGB(_loc2_[color]);
   this._contenido._alpha = 40;
};
