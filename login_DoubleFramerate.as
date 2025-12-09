function agregacuenta()
{
   if(this.lacuenta.text == "" || this.lapass.text == "")
   {
      return undefined;
   }
   var _loc8_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME].data.datosguardados;
   var _loc9_;
   var _loc4_;
   var _loc3_;
   var _loc5_;
   var _loc6_;
   var _loc7_;
   if(_loc8_ != undefined && _loc8_.cuentas != undefined)
   {
      _loc9_ = _loc8_.cuentas;
      _loc4_ = _loc9_.split(";");
      _loc3_ = -1;
      _loc5_ = false;
      for(var _loc11_ = 0; _loc11_ < _loc4_.length; _loc11_++)
      {
         if(_loc4_[_loc11_].split(",")[0] == this.lacuenta.text)
         {
            _loc5_ = true;
            break;
         }
      }
      if(_loc5_)
      {
         return undefined;
      }
      _loc6_ = _loc8_.cuentas;
      if(_loc4_.length > 0)
      {
         if(_loc4_.length >= 15)
         {
            return undefined;
         }
         _loc6_ = _loc6_ + ";" + this.lacuenta.text + "," + this.lapass.text;
      }
      else
      {
         _loc6_ = this.lacuenta.text + "," + this.lapass.text;
      }
      _loc7_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME];
      _loc7_.data.datosguardados = {cuentas:_loc6_};
      _loc7_.flush();
   }
   else
   {
      _loc6_ = this.lacuenta.text + "," + this.lapass.text;
      _loc7_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME];
      _loc7_.data.datosguardados = {cuentas:_loc6_};
      _loc7_.flush();
   }
   cargatodo();
}
function recuperarPass(sLogin)
{
   var _loc3_;
   if(this.elcorreo.text == "")
   {
      _loc3_ = "Coloca el correo para poder recuperar";
      this.api.kernel.showMessage(this.api.lang.getText("RECUPERAR_PASS"),_loc3_ != undefined ? _loc3_ : "Coloca el correo para poder recuperar","ERROR_BOX");
      return undefined;
   }
   this.api.datacenter.Player.login = this.elcorreo.text;
   this.api.datacenter.Basics.aks_connection_server_port = _global._sServerPort;
   _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME].data.lastServerName = this._sServerName;
   if(_global._sServerIP == undefined || _global._sServerPort == undefined)
   {
      _loc3_ = this.api.lang.getText("NO_SERVER_ADDRESS");
      this.api.kernel.showMessage(this.api.lang.getText("CONNECTION"),_loc3_ != undefined ? _loc3_ : "Erreur interne\nContacte l\'équipe Dofus","ERROR_BOX",{name:"OnLogin"});
   }
   else
   {
      this.api.network.connect(_global._sServerIP,_global._sServerPort);
      this.sendIdentity();
   }
}
function cargatodo()
{
   _loc5 = new ank["\x1e\n\x07"]["\x0f\x01"]();
   _loc5.push({id:-1,label:"Clear"});
   var _loc10_ = 0;
   var _loc8_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME].data.datosguardados;
   var _loc3_ = -1;
   var _loc9_;
   var _loc4_;
   if(_loc8_ != undefined && _loc8_.cuentas != undefined)
   {
      _loc9_ = _loc8_.cuentas;
      _loc4_ = _loc9_.split(";");
      for(var _loc12_ = 0; _loc12_ < _loc4_.length; _loc12_++)
      {
         if(!(_loc4_[_loc12_].split(",")[0] == "" || _loc4_[_loc12_].split(",")[1] == ""))
         {
            _loc5.push({id:_loc12_,label:_loc4_[_loc12_].split(",")[0],pass:_loc4_[_loc12_].split(",")[1]});
         }
      }
   }
   this._cbTypes.dataProvider = _loc5;
}
function borracuenta(cuentax, lapas)
{
   var _loc9_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME].data.datosguardados;
   var _loc3_ = -1;
   var _loc4_ = "";
   var _loc10_;
   var _loc6_;
   var _loc2_;
   var _loc5_;
   var _loc8_;
   if(_loc9_ != undefined)
   {
      _loc10_ = _loc9_.cuentas;
      _loc6_ = _loc10_.split(";");
      for(var _loc13_ = 0; _loc13_ < _loc6_.length; _loc13_++)
      {
         _loc2_ = _loc6_[_loc13_].split(",")[0];
         _loc5_ = _loc6_[_loc13_].split(",")[1];
         if(!(_loc2_ == cuentax && _loc2_.length == cuentax.length))
         {
            if(_loc4_ == "")
            {
               _loc4_ = _loc2_ + "," + _loc5_;
            }
            else
            {
               _loc4_ = _loc4_ + ";" + _loc2_ + "," + _loc5_;
            }
         }
      }
      _loc8_ = _global[dofus.Constants.GLOBAL_SO_OPTIONS_NAME];
      _loc8_.data.datosguardados = {cuentas:_loc4_};
      _loc8_.flush();
      cargatodo();
   }
}
function inicioBoton()
{
   abierto = true;
   this.cuentascarga._visible = true;
   this.solotexto._visible = true;
   this._cbTypes._visible = true;
   this.btnguardar._visible = true;
   this.btnborrar._visible = true;
   this.btnconect._visible = true;
   this.lacuenta._visible = true;
   this.lapass._visible = true;
   this.elback._visible = true;
   this.elback2._visible = true;
}
function inicioPanel()
{
   panel = false;
   this.elcorreo._visible = false;
   this.btnenviar._visible = false;
   this.correoback._visible = false;
   this.correocarga._visible = false;
   this.btnno._visible = false;
   this.textocorreo._visible = false;
}
function close(oEvent)
{
   this._tiAccount.tabEnabled = true;
   this._tiPassword.tabEnabled = true;
   this._btnOK.tabEnabled = true;
}
function click(oEvent)
{
   var _loc2_;
   var _loc3_;
   switch(oEvent.target._name)
   {
      case "btnguardar":
         SOMA.playSound("fx_805.mp3");
         agregacuenta();
         if(this.lacuenta.text !== "")
         {
            this.lacuenta.text = "";
            this.lapass.text = "";
            return;
         }
         return;
         break;
      case "_btnOK":
         SOMA.playSound("fx_805.mp3");
         this.onLogin(this._tiAccount.text,this._tiPassword.text);
         return;
      case "btnborrar":
         SOMA.playSound("fx_804mp3");
         if(this._cbTypes.selectedItem.id != undefined)
         {
            borracuenta(this._cbTypes.selectedItem.label,this._cbTypes.selectedItem.pass);
            return;
         }
         return;
         break;
      case "btnno":
         SOMA.playSound("fx_806.mp3");
         this.elcorreo._visible = false;
         this.btnenviar._visible = false;
         this.correoback._visible = false;
         this.correocarga._visible = false;
         this.btnno._visible = false;
         this.textocorreo._visible = false;
         return;
      case "btnconect":
         SOMA.playSound("fx_805.mp3");
         this.onLogin(this._tiAccount.text,this._tiPassword.text);
         return;
      case "_btnForget":
         if(!panel)
         {
            panel = true;
            SOMA.playSound("fx_806.mp3");
            this.elcorreo._visible = true;
            this.btnenviar._visible = true;
            this.correoback._visible = true;
            this.correocarga._visible = true;
            this.btnno._visible = true;
            this.textocorreo._visible = true;
            return;
         }
         SOMA.playSound("fx_806.mp3");
         panel = false;
         this.elcorreo._visible = false;
         this.btnenviar._visible = false;
         this.correoback._visible = false;
         this.correocarga._visible = false;
         this.btnno._visible = false;
         this.textocorreo._visible = false;
         return;
         break;
      case "btnclicked":
         if(!abierto)
         {
            SOMA.playSound("fx_806.mp3");
            abierto = true;
            this.cuentascarga._visible = true;
            this._cbTypes._visible = true;
            this.btnguardar._visible = true;
            this.btnborrar._visible = true;
            this.btnconect._visible = true;
            this.lacuenta._visible = true;
            this.lapass._visible = true;
            this.elback._visible = true;
            this.solotexto._visible = true;
            this.elback2._visible = true;
            return;
         }
         SOMA.playSound("fx_806.mp3");
         abierto = false;
         this.cuentascarga._visible = false;
         this._cbTypes._visible = false;
         this.btnguardar._visible = false;
         this.solotexto._visible = false;
         this.btnborrar._visible = false;
         this.btnconect._visible = false;
         this.lacuenta._visible = false;
         this.lapass._visible = false;
         this.elback._visible = false;
         this.elback2._visible = false;
         return;
         break;
      case "btnenviar":
         SOMA.playSound("fx_803.mp3");
         this.recuperarPass(this.elcorreo.text + ";" + this.api.datacenter.Basics.aks_identity,false);
         if(this.elcorreo.text !== "")
         {
            this.elcorreo.text = "";
            return;
         }
         return;
         break;
      case "_btnDetails":
         if(this._btnDetails.selected)
         {
            this._aOldFlagsState = [this._mcFlagFR._visible,this._mcFlagEN._visible,this._mcFlagUK._visible,this._mcFlagDE._visible,this._mcFlagES._visible,this._mcFlagRU._visible,this._mcFlagPT._visible,this._mcFlagNL._visible,false,this._mcFlagIT];
            this._mcFlagFR._visible = false;
            this._mcFlagEN._visible = false;
            this._mcFlagUK._visible = false;
            this._mcFlagDE._visible = false;
            this._mcFlagES._visible = false;
            this._mcFlagRU._visible = false;
            this._mcFlagPT._visible = false;
            this._mcFlagNL._visible = false;
            this._mcFlagIT._visible = false;
            this._mcMaskFR._visible = false;
            this._mcMaskEN._visible = false;
            this._mcMaskUK._visible = false;
            this._mcMaskDE._visible = false;
            this._mcMaskES._visible = false;
            this._mcMaskRU._visible = false;
            this._mcMaskPT._visible = false;
            this._mcMaskNL._visible = false;
            this._mcMaskIT._visible = false;
         }
         else
         {
            this._mcFlagFR._visible = this._aOldFlagsState[0] === true;
            this._mcFlagEN._visible = this._aOldFlagsState[1] === true;
            this._mcFlagUK._visible = this._aOldFlagsState[2] === true;
            this._mcFlagDE._visible = this._aOldFlagsState[3] === true;
            this._mcFlagES._visible = this._aOldFlagsState[4] === true;
            this._mcFlagRU._visible = this._aOldFlagsState[5] === true;
            this._mcFlagPT._visible = this._aOldFlagsState[6] === true;
            this._mcFlagNL._visible = this._aOldFlagsState[7] === true;
            this._mcFlagIT._visible = this._aOldFlagsState[9] === true;
            this._mcMaskFR._visible = this.api.datacenter.Basics.aks_community_id != 0;
            this._mcMaskEN._visible = this.api.datacenter.Basics.aks_community_id != 2;
            this._mcMaskUK._visible = this.api.datacenter.Basics.aks_community_id != 1;
            this._mcMaskDE._visible = this.api.datacenter.Basics.aks_community_id != 3;
            this._mcMaskES._visible = this.api.datacenter.Basics.aks_community_id != 4;
            this._mcMaskRU._visible = this.api.datacenter.Basics.aks_community_id != 5;
            this._mcMaskPT._visible = this.api.datacenter.Basics.aks_community_id != 6;
            this._mcMaskNL._visible = this.api.datacenter.Basics.aks_community_id != 7;
            this._mcMaskIT._visible = this.api.datacenter.Basics.aks_community_id != 9;
         }
         this._mcAdvancedBack._y += !this._btnDetails.selected ? -30 : 30;
         this._lblRememberMe._visible = this._btnDetails.selected;
         this._btnRememberMe._visible = this._btnDetails.selected;
         this._mcAdvancedBackground._visible = this._btnDetails.selected;
         this._cbPorts._visible = this._btnDetails.selected;
         this._btnTestServer._visible = !dofus.Constants.TEST ? this._btnDetails.selected && (this.api.lang.getConfigText("TEST_SERVER_ACCESS") && !this.api.config.isStreaming) : true;
         this._lblDetails.text = !this._btnDetails.selected ? this.api.lang.getText("ADVANCED_LOGIN") + " >>" : "<< " + this.api.lang.getText("ADVANCED_LOGIN");
         return;
      case "_mcSubscribe":
         if(getTimer() - this._nLastRegisterTime < 1000)
         {
            return undefined;
         }
         this._nLastRegisterTime = getTimer();
         this._tiAccount.tabEnabled = false;
         this._tiPassword.tabEnabled = false;
         this._btnOK.tabEnabled = false;
         _loc2_ = this.gapi.loadUIComponent("Register","Register");
         _loc3_ = dofus.graphics.gapi.ui.Register(_loc2_);
         _loc2_.addEventListener("close",this);
         return;
         break;
      default:
         if(String(oEvent.target._name).substring(0,7) == "_mcFlag")
         {
            _loc2_ = String(oEvent.target._name).substr(7,2).toLowerCase();
            switch(_loc2_)
            {
               case "en":
                  this.switchLanguage("en");
                  this.api.datacenter.Basics.aks_detected_country = _loc2_.toUpperCase();
                  this.api.datacenter.Basics.aks_community_id = 2;
                  this.saveCommunityAndCountry();
                  return;
               case "uk":
                  this.switchLanguage("en");
                  this.api.datacenter.Basics.aks_detected_country = "UK";
                  this.api.datacenter.Basics.aks_community_id = 1;
                  this.saveCommunityAndCountry();
                  return;
               default:
                  this.switchLanguage(_loc2_);
                  this.api.datacenter.Basics.aks_detected_country = _loc2_.toUpperCase();
                  this.api.datacenter.Basics.aks_community_id = this.getCommunityFromCountry(_loc2_.toUpperCase());
                  this.saveCommunityAndCountry();
                  return;
            }
         }
         else
         {
            _loc3_ = oEvent.target.params.url;
            if(_loc3_ != undefined && _loc3_ != "")
            {
               this.getURL(_loc3_,"_blank");
               return;
            }
            return;
         }
   }
}
function itemdblClick(oEvent)
{
   this.onLogin(oEvent.row.item.label,oEvent.row.item.pass);
}
function itemSelected(oEvent)
{
   var _loc0_;
   var _loc4_;
   var _loc3_;
   if((_loc0_ = oEvent.target._name) !== "_cbPorts")
   {
      _loc4_ = oEvent.target._name;
      SOMA.playSound("fx_803.mp3");
      if(_loc4_ === "_cbTypes")
      {
         if(this._cbTypes.selectedItem.id != undefined)
         {
            if(this._cbTypes.selectedItem.id < 0)
            {
               this._tiAccount.text = "";
               this._tiPassword.text = "";
            }
            else
            {
               this._tiAccount.text = this._cbTypes.selectedItem.label;
               this._tiPassword.text = this._cbTypes.selectedItem.pass;
               this._tiPassword.password = true;
            }
         }
      }
   }
   else
   {
      _global.API.kernel.showMessage(undefined,this._cbPorts.selectedIndex,"DEBUG_LOG");
      _loc3_ = this._cbPorts.selectedItem;
      this._sloginservidor = _loc3_.data;
      this._btnTestServer.label = this._cbPorts.selectedIndex != 0 ? this.api.lang.getText("NORMAL_SERVER_ACCESS") : this.api.lang.getText("TEST_SERVER_ACCESS");
      this.api.kernel.OptionsManager.setOption("ServerPortIndex",this._cbPorts.selectedIndex);
   }
}
this._cLogs._visible = false;
embeber(this);
this.btnclicked.addEventListener("click",this);
this._btnOK.addEventListener("click",this);
this._cbTypes.addEventListener("itemdblClick",this);
this._cbTypes.addEventListener("itemSelected",this);
this._cbTypes.columnsNames = [this.api.lang.getText("TITUS2_CUENTAS")];
this.btncompleta.addEventListener("click",this);
this.btncompleta.label = "Cargar";
this.solotexto._username.text = this.api.lang.getText("TITUS_USER");
this.solotexto._password.text = this.api.lang.getText("TITUS_PASS");
this.btnguardar.addEventListener("click",this);
this.btnguardar.label = this.api.lang.getText("BOTONS_GUARDAR");
this._btnForget.addEventListener("click",this);
this.btnno.addEventListener("click",this);
this.btnno.label = "Cerrar";
this.btnenviar.addEventListener("click",this);
this.btnenviar.label = "Enviar";
this.btnborrar.addEventListener("click",this);
this.btnborrar.label = this.api.lang.getText("BOTONS_BORRAR");
this.btnconect.addEventListener("click",this);
this.btnconect.label = this.api.lang.getText("BOTONS_CONECTAR");
this.lacuenta.restrict = "\\-a-zA-Z0-9@";
this.lapass.password = true;
this.lacuenta.tabIndex = 6;
this.lapass.tabIndex = 7;
this.lacuenta.tabEnabled = true;
this.lapass.tabEnabled = true;
this._tiAccount.tabIndex = 1;
this._tiAccount.tabEnabled = true;
this._tiPassword.tabIndex = 2;
this._tiPassword.tabEnabled = true;
this._btnOK.tabIndex = 3;
this._btnOK.tabEnabled = true;
this.tiAccount = this._tiAccount;
this.tiPassword = this._tiPassword;
this.cuentascarga.title = this.api.lang.getText("TITUS_CUENTAS");
this.correocarga.title = "Recuperar cuenta";
var _loc5 = new ank["\x1e\n\x07"]["\x0f\x01"]();
var continua = true;
cargatodo();
var abierto = false;
inicioBoton();
var panel = false;
inicioPanel();
this._nLastRegisterTime = 0;
