#initclip 73
var _loc1 = ank["\x1e\n\x07"]["\x1e\x0b\x15"].prototype;
_loc1.onLoadComplete = function(mc)
{
   this.broadcastMessage("onLoadComplete",mc,this._aArgs);
};
_loc1.onLoadInit = function(mc)
{
   var _loc6_;
   var _loc18_;
   var _loc17_;
   var _loc16_;
   var _loc15_;
   var _loc14_;
   var _loc11_;
   var _loc9_;
   var _loc10_;
   var _loc20_;
   var _loc19_;
   var _loc13_;
   var _loc4_;
   var _loc7_;
   var _loc8_;
   var _loc3_;
   var _loc21_;
   var _loc22_;
   if(this._aArgs.ornamento)
   {
      _loc6_ = mc._parent._parent._parent;
      if(mc.attachMovie("ornament_" + this._frameStart,"_ornamento",30))
      {
         mc._ornamento._y -= this._aArgs.medio;
         if(_global.API.kernel.OptionsManager.getOption("omega") && _global.omegaPerso > 0)
         {
            mc._ornamento.bottom._Omega._visible = true;
            mc._ornamento.bottom._lblOmega._visible = true;
            mc._ornamento.bottom._lblOmega.text = _global.omegaPerso;
         }
         else
         {
            mc._ornamento.bottom._Omega._visible = false;
            mc._ornamento.bottom._lblOmega._visible = false;
         }
         _loc6_._mcTxtBackground._y -= this._aArgs.medio;
         _loc18_ = 0.75;
         _loc17_ = 40;
         _loc16_ = 160;
         _loc15_ = _global.parseInt(this._aArgs.alto);
         _loc14_ = _global.parseInt(this._aArgs.ancho);
         _loc11_ = _loc14_ / _loc16_;
         _loc9_ = _loc15_ / _loc17_;
         _loc10_ = 1;
         if(_loc11_ > _loc18_ || _loc9_ > _loc18_)
         {
            _loc20_ = _loc16_ / _loc14_;
            _loc19_ = _loc17_ / _loc15_;
            _loc10_ = _loc20_;
            if(_loc19_ < _loc10_)
            {
               _loc10_ = _loc19_;
            }
         }
         _loc13_ = 0;
         if(_loc11_ > _loc13_)
         {
            _loc13_ = _loc11_;
         }
         _loc9_ /= _loc11_;
         _loc4_ = mc._ornamento;
         _loc7_ = 80 + _loc4_.bg._x;
         _loc8_ = _loc4_.bg._y;
         _loc3_ = [_loc4_.bg,_loc4_.picto,_loc4_.top,_loc4_.left,_loc4_.right,_loc4_.bottom];
         for(var _loc12_ in _loc3_)
         {
            _loc3_[_loc12_]._x -= _loc7_;
            _loc3_[_loc12_]._y -= _loc8_;
         }
         _loc4_.bg._yscale = _loc9_ * 100;
         _loc4_.bottom._y *= _loc9_;
         _loc4_._xscale = _loc4_._yscale = _loc13_ * 100;
         _loc6_._xscale = _loc6_._yscale = _loc10_ * 100;
         _loc21_ = _loc6_.getBounds(_loc6_._parent._parent);
         _loc22_ = _loc21_.yMax + 20;
         _loc6_._y -= 30;
      }
      _loc6_._visible = true;
   }
   else
   {
      if(this._frameStart != undefined)
      {
         mc.gotoAndStop(this._frameStart);
      }
      mc._yscale = 100;
      mc._xscale = 100;
   }
   this.broadcastMessage("onLoadInit",mc,this._aArgs);
};
#endinitclip