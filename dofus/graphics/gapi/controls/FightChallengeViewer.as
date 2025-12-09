_global.dofus["\r\x14"].gapi.controls.FightChallengeViewer = function()
{
   super();
};
dofus["\r\x14"].gapi.controls.FightChallengeViewer.prototype = new ank.gapi.core["\x1e\n\r"]();
var _loc1 = _global.dofus["\r\x14"].gapi.controls.FightChallengeViewer.prototype;
_loc1.createChildren = function()
{
   this._btnView._visible = this.challenge.showTarget;
   this.update();
   this.addToQueue({object:this,method:this.addListeners});
   this.addToQueue({object:this,method:this.initText});
};
_loc1.initText = function()
{
   var _loc2_ = dofus["\x1e\n\x07"]["\x1d\x1b"](this.api);
   var _loc3_ = _loc2_.lang.getFightChallenge(this.challenge.id);
   this._winBg.title = _loc2_.lang.getText("CURRENT_FIGHT_CHALLENGE");
   var _loc4_;
   if(this.challenge.targetId)
   {
      var targetSprite = _loc2_.datacenter.Sprites.getItemAt(this.challenge.targetId);
      _loc4_ = targetSprite.name + " (" + _loc2_.lang.getText("LEVEL_SMALL") + " " + targetSprite.Level + ")";
      this._taDesc.text = _loc3_.d.split("%1").join(_loc4_);
   }
   else
   {
      this._taDesc.text = _loc3_.d;
   }
   this._lblTitleDrop.text = _loc2_.lang.getText("LOOT");
   this._lblTitleXp.text = _loc2_.lang.getText("WORD_XP");
   this._lblTitleOgrina.text = _loc2_.lang.getText("OGRINAS");
   this._lblTitle.text = _loc3_.n;
   this._lblBonusDrop.text = "+" + (this.challenge.teamDropBonus + this.challenge.basicDropBonus) + "%";
   this._lblBonusXp.text = "+" + (this.challenge.teamXpBonus + this.challenge.basicXpBonus) + "%";
   this._lblOgrinas.text = "+" + this.api.network.Game.gananciasOgrinasReto;
};
