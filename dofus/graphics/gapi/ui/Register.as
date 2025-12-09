var _loc1 = _global.dofus["\r\x14"].gapi.ui.Register.prototype;
_loc1.initTexts = function()
{
   this._winBackground.title = this.api.lang.getText("REGISTER_TITLE");
   this._lblAccountName.text = this.api.lang.getText("REGISTER_LOGIN");
   this._lblPassword.text = this.api.lang.getText("REGISTER_PASSOWRD1");
   this._lblConfirmPassword.text = this.api.lang.getText("REGISTER_PASSOWRD2");
   this._lblEmail.text = this.api.lang.getText("REGISTER_EMAIL");
   this._lblLastName.text = this.api.lang.getText("REGISTER_LAST_NAME");
   this._lblFirstName.text = this.api.lang.getText("REGISTER_FIRST_NAME");
   this._lblBirthDate.text = this.api.lang.getText("REGISTER_BIRTHDAY");
   this._lblSecretQuestion.text = this.api.lang.getText("REGISTER_QUESTION");
   this._lblSecretAnswer.text = this.api.lang.getText("REGISTER_ANSWER");
   this._lblPseudo.text = this.api.lang.getText("PSEUDO_DOFUS_SIMPLE");
   this._lblCountry.text = this.api.lang.getText("REGISTER_COUNTRY");
   this._lblAccept.text = this.api.lang.getText("VALIDATE");
};
_loc1.addListeners = function()
{
   this._btnClose.addEventListener("click",this);
   var ref = this;
   this._mcValidateButton.onRelease = function()
   {
      ref.click({target:this});
   };
   this._cbCountry.addEventListener("itemSelected",this);
   this.api.kernel.KeyManager.addShortcutsListener("onShortcut",this);
};
_loc1.initData = function()
{
   this._tiPassword1.password = true;
   this._tiPassword2.password = true;
   var _loc2 = new ank["\x1e\n\x07"]["\x0f\x01"]();
   _loc2.push({label:"-",data:"-1"});
   var _loc3 = 0;
   while(true)
   {
      ++_loc3;
      if(_loc3 >= 32)
      {
         break;
      }
      _loc2.push({label:_loc3,data:_loc3});
   }
   this._cbDay.dataProvider = _loc2;
   this._cbDay.selectedIndex = 0;
   var _loc4 = new ank["\x1e\n\x07"]["\x0f\x01"]();
   _loc4.push({label:"-",data:"-1"});
   var _loc5 = 0;
   while(true)
   {
      ++_loc5;
      if(_loc5 >= 13)
      {
         break;
      }
      var _loc6 = new Date(0,_loc5,0,0,0,0,0);
      _loc4.push({label:eval("\x1e\x18\x01")["\x1e\n\x07"]["\x1e\x11\f"].formatDate(_loc6,"MMM",this.api.config.language),data:_loc5});
   }
   this._cbMonth.dataProvider = _loc4;
   this._cbMonth.selectedIndex = 0;
   var _loc7 = new ank["\x1e\n\x07"]["\x0f\x01"]();
   _loc7.push({label:"-",data:"-1"});
   var _loc8 = new Date().getFullYear() - 6;
   while(true)
   {
      --_loc8;
      if(_loc8 <= new Date().getFullYear() - 105)
      {
         break;
      }
      _loc7.push({label:_loc8,data:_loc8});
   }
   this._cbYear.dataProvider = _loc7;
   this._cbYear.selectedIndex = 0;
   this.addToQueue({object:this,method:this.refreshHearingAbout});
   var _loc9 = ank["\x1e\n\x07"]["\x12\x02"].COUNTRIES[this.api.config.language];
   if(_loc9 == undefined)
   {
      _loc9 = ank["\x1e\n\x07"]["\x12\x02"].COUNTRIES.en;
   }
   var _loc10 = new ank["\x1e\n\x07"]["\x0f\x01"]();
   _loc10.push({label:"",data:"--"});
   for(var k in _loc9)
   {
      _loc10.push({label:_loc9[k],data:k});
   }
   this._cbCountry.dataProvider = _loc10;
   this._cbCountry.selectedIndex = 0;
   this._tiAccount.tabIndex = 5;
   this._tiPassword1.tabIndex = 6;
   this._tiPassword2.tabIndex = 7;
   this._tiEmail.tabIndex = 8;
   this._tiQuestion.tabIndex = 9;
   this._tiAnswer.tabIndex = 10;
   this._tiPseudo.tabIndex = 11;
   this._tiLastName.tabIndex = 12;
   this._tiFirstName.tabIndex = 13;
   this._tiAccount.setFocus();
   this._lblNextStepButton.text = this.api.lang.getText("TERMINATE_WORD").toUpperCase();
};
_loc1.initCrypto = function(bForce)
{
};
_loc1.switchToStep = function(nStep)
{
   this._bgStep1._visible = true;
};
_loc1.preValidateForm = function(nStep)
{
   if(this._tiAccount.text.length <= 0 || this._tiPassword1.text.length <= 0 || this._tiPassword2.text.length <= 0 || this._tiEmail.text.length <= 0 || this._tiLastName.text.length <= 0 || this._tiFirstName.text.length <= 0 || this._cbDay.selectedItem.data == -1 || this._cbMonth.selectedItem.data == -1 || this._cbYear.selectedItem.data == -1)
   {
      this.api.kernel.showMessage(this.api.lang.getText("LOGIN_SUBSCRIBE"),this.api.lang.getText("REGISTER_NOT_FULLFILLED"),"ERROR_BOX");
      return false;
   }
   if(this._tiPassword1.text.length < 1 || this._tiPassword2.text.length < 1)
   {
      this.api.kernel.showMessage(this.api.lang.getText("LOGIN_SUBSCRIBE"),this.api.lang.getText("PASSWORD_TOO_SHORT"),"ERROR_BOX");
      return false;
   }
   if(this._tiQuestion.text.length <= 0 || this._tiAnswer.text.length <= 0 || this._tiPseudo.text.length <= 0 || this._cbCountry.selectedItem.data == "--")
   {
      this.api.kernel.showMessage(this.api.lang.getText("LOGIN_SUBSCRIBE"),this.api.lang.getText("REGISTER_NOT_FULLFILLED"),"ERROR_BOX");
      return false;
   }
   return true;
};
_loc1.validateForm = function()
{
   this._oLoader.langB = this.api.config.language;
   this._oLoader.validRegister1 = true;
   this._oLoader.cuentaB = this._tiAccount.text;
   this._oLoader.passB = this._tiPassword1.text;
   this._oLoader.passB2 = this._tiPassword2.text;
   this._oLoader.emailB = this._tiEmail.text;
   this._oLoader.apellidoB = this._tiLastName.text;
   this._oLoader.nombreB = this._tiFirstName.text;
   this._oLoader.nacDiaB = this._cbDay.selectedItem.data;
   this._oLoader.nacMesB = this._cbMonth.selectedItem.data;
   this._oLoader.nacAnoB = this._cbYear.selectedItem.data;
   this._oLoader.preguntaB = this._tiQuestion.text;
   this._oLoader.respuestaB = this._tiAnswer.text;
   this._oLoader.apodoB = this._tiPseudo.text;
   this._oLoader.paisB = this._cbCountry.selectedItem.data;
   this._urlIndex = 0;
   this._oResult = new LoadVars();
   var ref = this;
   this._oResult.onLoad = function(bSuccess)
   {
      ref.onResultLoad(!bSuccess ? 0 : 1);
   };
   this.registrando();
};
_loc1.registrando = function()
{
   var _loc2_ = "http://51.161.11.134/data/registroB.php";
   this.api.kernel.showMessage(undefined,"Registrando en el link " + _loc2_,"DEBUG_LOG");
   this._oLoader.sendAndLoad(_loc2_,this._oResult,"POST");
   this._lblNextStepButton.text = this.api.lang.getText("LOADING");
   this._bCurrentlyLoading = true;
   this.api.ui.loadUIComponent("CenterText","CenterText",{text:this.api.lang.getText("WAITING_MSG_RECORDING"),timer:0,background:true},{bForceLoad:true});
};
_loc1.onResultLoad = function(nSuccess)
{
   this._lblNextStepButton.text = this.api.lang.getText("TERMINATE_WORD").toUpperCase();
   this._bCurrentlyLoading = false;
   this.api.ui.unloadUIComponent("CenterText");
   if(nSuccess == 2)
   {
      this.api.kernel.showMessage(this.api.lang.getText("LOGIN_SUBSCRIBE"),this.api.lang.getText("REGISTRATION_ERROR"),"ERROR_BOX");
   }
   else if(nSuccess == 1)
   {
      if(this._oResult.result != "")
      {
         this.api.kernel.showMessage(this.api.lang.getText("LOGIN_SUBSCRIBE"),this._oResult.result,"ERROR_BOX");
      }
      else
      {
         this.api.kernel.showMessage(this.api.lang.getText("LOGIN_SUBSCRIBE"),this.api.lang.getText("REGISTRATION_DONE",[this._tiAccount.text,this._tiQuestion.text,this._tiAnswer.text,this._tiEmail.text]),"ERROR_BOX");
         this.callClose();
      }
   }
   else
   {
      this.registrando();
   }
};
_loc1.click = function(oEvent)
{
   if(this._bCurrentlyLoading)
   {
      return undefined;
   }
   switch(oEvent.target)
   {
      case this._btnClose:
         this.callClose();
         break;
      case this._mcValidateButton:
         if(this.preValidateForm())
         {
            this.validateForm();
         }
      default:
         return;
   }
};
