var _loc1 = _global.dofus["\r\x14"].gapi.ui.ChooseCharacter.prototype;
_loc1.click = function(oEvent)
{
   switch(oEvent.target._name)
   {
      case "_btnPlay":
         if(this._aSpriteList[this._nSelectedIndex].Venta == 1)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PERSO_EN_VENTA"),"ERROR_BOX");
            return undefined;
         }
         if(this._aSpriteList[this._nSelectedIndex].Venta == 3)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PERSO_VENDIDO"),"ERROR_BOX");
            return undefined;
         }
         if(this._nSelectedIndex == undefined)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("SELECT_CHARACTER"),"ERROR_BOX",{name:"NoSelect"});
         }
         else
         {
            this.api.network.Account.setCharacter(this._aSpriteList[this._nSelectedIndex].id);
         }
         break;
      case "_btnCreate":
         if(this.api.datacenter.Player.isAuthorized)
         {
            this.gapi.loadUIComponent("CreateCharacter","CreateCharacter",{remainingTime:this._nRemainingTime});
            this.gapi.unloadUIComponent("ChooseCharacter");
         }
         if(this._nCharacterCount >= 8)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("TOO_MUCH_CHARACTER"),"ERROR_BOX");
         }
         if(this._nCharacterCount >= 7)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PRECIO_PERSONAJE_8"),"ERROR_BOX");
            this.gapi.loadUIComponent("CreateCharacter","CreateCharacter",{remainingTime:this._nRemainingTime});
            this.gapi.unloadUIComponent("ChooseCharacter");
         }
         if(this._nCharacterCount >= 6)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PRECIO_PERSONAJE_7"),"ERROR_BOX");
            this.gapi.loadUIComponent("CreateCharacter","CreateCharacter",{remainingTime:this._nRemainingTime});
            this.gapi.unloadUIComponent("ChooseCharacter");
         }
         if(this._nCharacterCount >= 5)
         {
            this.api.kernel.showMessage(undefined,this.api.lang.getText("PRECIO_PERSONAJE_6"),"ERROR_BOX");
            this.gapi.loadUIComponent("CreateCharacter","CreateCharacter",{remainingTime:this._nRemainingTime});
            this.gapi.unloadUIComponent("ChooseCharacter");
         }
         break;
      case "_btnSubscribe":
         _root.getURL(this.api.lang.getConfigText("PAY_LINK"),"_blank");
         break;
      case "_btnBack":
         this.api.kernel.changeServer(true);
      case "_btnChangeServer":
      default:
         return;
   }
};
