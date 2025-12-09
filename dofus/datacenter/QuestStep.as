var _loc1 = _global.dofus.datacenter["\x1e\x15\x12"].prototype;
_loc1.__get__rewards = function()
{
   var _loc4_ = new ank["\x1e\n\x07"]["\x0f\x01"]();
   var _loc17_ = this.api.lang.getQuestStepText(this._nID).r;
   if(_global.RECOMPENSAS[this._nID] != undefined)
   {
      _loc17_ = _global.RECOMPENSAS[this._nID];
   }
   if(_loc17_[0] != undefined)
   {
      _loc4_.push({iconFile:"UI_QuestXP",label:_loc17_[0]});
   }
   if(_loc17_[1] != undefined)
   {
      _loc4_.push({iconFile:"UI_QuestKamaSymbol",label:_loc17_[1]});
   }
   var _loc12_;
   var _loc5_;
   var _loc15_;
   var _loc3_;
   var _loc7_;
   if(_loc17_[2] != undefined)
   {
      _loc12_ = _loc17_[2];
      _loc5_ = -1;
      while(true)
      {
         _loc5_ = _loc5_ + 1;
         if(_loc5_ >= _loc12_.length)
         {
            break;
         }
         _loc15_ = Number(_loc12_[_loc5_][0]);
         _loc3_ = _loc12_[_loc5_][1];
         _loc7_ = new dofus.datacenter["\f\f"](0,_loc15_,_loc3_);
         _loc4_.push({iconFile:_loc7_.iconFile,label:(_loc3_ == 0 ? "" : "x" + _loc3_ + " ") + _loc7_.name});
      }
   }
   var _loc19_;
   var _loc11_;
   var _loc6_;
   if(_loc17_[3] != undefined)
   {
      _loc19_ = _loc17_[3];
      _loc11_ = -1;
      while(true)
      {
         _loc11_ = _loc11_ + 1;
         if(_loc11_ >= _loc19_.length)
         {
            break;
         }
         _loc6_ = Number(_loc19_[_loc11_]);
         _loc4_.push({iconFile:dofus.Constants.EMOTES_ICONS_PATH + _loc6_ + ".swf",label:this.api.lang.getEmoteText(_loc6_).n});
      }
   }
   var _loc18_;
   var _loc10_;
   var _loc14_;
   var _loc9_;
   if(_loc17_[4] != undefined)
   {
      _loc18_ = _loc17_[4];
      _loc10_ = -1;
      while(true)
      {
         _loc10_ = _loc10_ + 1;
         if(_loc10_ >= _loc18_.length)
         {
            break;
         }
         _loc14_ = Number(_loc18_[_loc10_]);
         _loc9_ = new dofus.datacenter.Job(_loc14_);
         _loc4_.push({iconFile:_loc9_.iconFile,label:_loc9_.name});
      }
   }
   var _loc20_;
   var _loc13_;
   var _loc16_;
   var _loc8_;
   if(_loc17_[5] != undefined)
   {
      _loc20_ = _loc17_[5];
      _loc13_ = -1;
      while(true)
      {
         _loc13_ = _loc13_ + 1;
         if(_loc13_ >= _loc20_.length)
         {
            break;
         }
         _loc16_ = Number(_loc20_[_loc13_]);
         _loc8_ = new dofus.datacenter["\x1e\x0f\x02"](_loc16_,1);
         _loc4_.push({iconFile:_loc8_.iconFile,label:_loc8_.name});
      }
   }
   return _loc4_;
};
_loc1.addProperty("rewards",_loc1.__get__rewards,function()
{
}
);
