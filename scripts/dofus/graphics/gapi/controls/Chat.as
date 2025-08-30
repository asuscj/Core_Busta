#initclip 26
var _loc1 = _global.dofus["\r\x14"].gapi.controls.Chat.prototype;
_loc1.__get__filters = function()
{
   return new Array(this._btnFilter0.selected,this._btnFilter1.selected,this._btnFilter2.selected,this._btnFilter3.selected,this._btnFilter4.selected,this._btnFilter5.selected,this._btnFilter6.selected,this._btnFilter7.selected,this._btnFilter8.selected);
};
_loc1.__get__selectable = function()
{
   return this._txtChat.selectable;
};
_loc1.__set__selectable = function(bSelectable)
{
   this._txtChat.selectable = bSelectable;
};
_loc1.open = function(bOpen)
{
   if(bOpen == !this._bOpened)
   {
      return undefined;
   }
   this._btnOpenClose.selected = !bOpen;
   if(!bOpen)
   {
      _loc2 = 1;
   }
   else
   {
      var _loc2 = -1;
   }
   this._txtChat.setSize(this._txtChat.width,this._txtChat.height + _loc2 * dofus["\r\x14"].gapi.controls.Chat.OPEN_OFFSET);
   this._y -= _loc2 * dofus["\r\x14"].gapi.controls.Chat.OPEN_OFFSET;
   this._bOpened = !bOpen;
};
_loc1.setText = function(sText)
{
   this._txtChat.text = sText;
};
_loc1.updateSmileysEmotes = function()
{
   this._sSmileys.update();
};
_loc1.hideSmileys = function(bHide)
{
   this._sSmileys._visible = !bHide;
   this._bSmileysOpened = !bHide;
   this._btnSmileys.selected = this._bSmileysOpened;
};
_loc1.showSitDown = function(bShow)
{
   this._btnSitDown._visible = bShow;
   this._btnBanco._visible = bShow;
   this._btnPrestigio._visible = bShow;
   this._btnBestiario._visible = bShow;
   this._btnMercadillo._visible = bShow;
   this._btnLogros._visible = bShow;
   this._btnPase._visible = bShow;
   this._btnKoliseo._visible = bShow;
   this._btnLadder._visible = bShow;
   this._btnKxO._visible = bShow;
   this._btnServicios._visible = bShow;
   this._btnCasino._visible = bShow;
   this._btnOrnamentos._visible = bShow;
   this._btnTitulos._visible = bShow;
   this._btnGlobalFights._visible = bShow;
   this._btnLoginReward._visible = bShow;
   this._btnTemporis._visible = bShow;
};
_loc1.selectFilter = function(nFilter, bSelect)
{
   this["_btnFilter" + nFilter].selected = bSelect;
};
_loc1.init = function()
{
   super.init(false,dofus["\r\x14"].gapi.controls.Chat.CLASS_NAME);
   this.api.kernel.ChatManager.updateRigth();
};
_loc1.createChildren = function()
{
   var _loc3_ = this.api.lang.getConfigText("CHAT_FILTERS");
   var _loc2_ = 0;
   while(true)
   {
      _loc2_++;
      if(_loc2_ >= _loc3_.length)
      {
         break;
      }
      if(_loc3_[_loc2_] != 1)
      {
         this["_btnFilter" + (_loc2_ + 1)]._visible = false;
      }
   }
   this.addToQueue({method:this.addListeners,object:this});
   this.addToQueue({method:this.initData,object:this});
   this.hideSmileys(true);
};
_loc1.addListeners = function()
{
   this._btnOpenClose.addEventListener("click",this);
   this._btnSmileys.addEventListener("click",this);
   this._btnFilter0.addEventListener("click",this);
   this._btnFilter1.addEventListener("click",this);
   this._btnFilter2.addEventListener("click",this);
   this._btnFilter3.addEventListener("click",this);
   this._btnFilter4.addEventListener("click",this);
   this._btnFilter5.addEventListener("click",this);
   this._btnFilter6.addEventListener("click",this);
   this._btnFilter7.addEventListener("click",this);
   this._btnFilter8.addEventListener("click",this);
   this._btnSitDown.addEventListener("click",this);
   this._btnOpenClose.addEventListener("over",this);
   this._btnSmileys.addEventListener("over",this);
   this._btnFilter0.addEventListener("over",this);
   this._btnFilter1.addEventListener("over",this);
   this._btnFilter2.addEventListener("over",this);
   this._btnFilter3.addEventListener("over",this);
   this._btnFilter4.addEventListener("over",this);
   this._btnFilter5.addEventListener("over",this);
   this._btnFilter6.addEventListener("over",this);
   this._btnFilter7.addEventListener("over",this);
   this._btnFilter8.addEventListener("over",this);
   this._btnSitDown.addEventListener("over",this);
   this._btnOpenClose.addEventListener("out",this);
   this._btnSmileys.addEventListener("out",this);
   this._btnFilter0.addEventListener("out",this);
   this._btnFilter1.addEventListener("out",this);
   this._btnFilter2.addEventListener("out",this);
   this._btnFilter3.addEventListener("out",this);
   this._btnFilter4.addEventListener("out",this);
   this._btnFilter5.addEventListener("out",this);
   this._btnFilter6.addEventListener("out",this);
   this._btnFilter7.addEventListener("out",this);
   this._btnFilter8.addEventListener("out",this);
   this._btnSitDown.addEventListener("out",this);
   this._sSmileys.addEventListener("selectSmiley",this);
   this._sSmileys.addEventListener("selectEmote",this);
   this._txtChat.addEventListener("href",this);
   this._btnMercadillo.addEventListener("click",this);
   this._btnMercadillo.addEventListener("over",this);
   this._btnMercadillo.addEventListener("out",this);
   this._btnPase.addEventListener("click",this);
   this._btnPase.addEventListener("over",this);
   this._btnPase.addEventListener("out",this);
   this._btnLogros.addEventListener("click",this);
   this._btnLogros.addEventListener("over",this);
   this._btnLogros.addEventListener("out",this);
   this._btnBanco.addEventListener("click",this);
   this._btnBanco.addEventListener("over",this);
   this._btnBanco.addEventListener("out",this);
   this._btnPrestigio.addEventListener("click",this);
   this._btnPrestigio.addEventListener("over",this);
   this._btnPrestigio.addEventListener("out",this);
   this._btnBestiario.addEventListener("click",this);
   this._btnBestiario.addEventListener("over",this);
   this._btnBestiario.addEventListener("out",this);
   this._btnKoliseo.addEventListener("click",this);
   this._btnKoliseo.addEventListener("over",this);
   this._btnKoliseo.addEventListener("out",this);
   this._btnLadder.addEventListener("click",this);
   this._btnLadder.addEventListener("over",this);
   this._btnLadder.addEventListener("out",this);
   this._btnKxO.addEventListener("click",this);
   this._btnKxO.addEventListener("over",this);
   this._btnKxO.addEventListener("out",this);
   this._btnServicios.addEventListener("click",this);
   this._btnServicios.addEventListener("over",this);
   this._btnServicios.addEventListener("out",this);
   this._btnTemporis.addEventListener("click",this);
   this._btnTemporis.addEventListener("over",this);
   this._btnTemporis.addEventListener("out",this);
   this._btnCasino.addEventListener("click",this);
   this._btnCasino.addEventListener("over",this);
   this._btnCasino.addEventListener("out",this);
   this._btnOrnamentos.addEventListener("click",this);
   this._btnOrnamentos.addEventListener("over",this);
   this._btnOrnamentos.addEventListener("out",this);
   this._btnTitulos.addEventListener("click",this);
   this._btnTitulos.addEventListener("over",this);
   this._btnTitulos.addEventListener("out",this);
   this._btnGlobalFights.addEventListener("click",this);
   this._btnGlobalFights.addEventListener("over",this);
   this._btnGlobalFights.addEventListener("out",this);
   this._btnLoginReward.addEventListener("click",this);
   this._btnLoginReward.addEventListener("over",this);
   this._btnLoginReward.addEventListener("out",this);
   var _loc3_ = this._btnFilter0;
   var _loc2_ = 0;
   while(_loc3_ != undefined)
   {
      _loc3_.selected = this.api.datacenter.Basics.chat_type_visible[_loc2_] == true;
      this.api.kernel.ChatManager.setTypeVisible(_loc2_,_loc3_.selected);
      _loc2_ = _loc2_ + 1;
      _loc3_ = this["_btnFilter" + _loc2_];
   }
   this.api.kernel.ChatManager.setTypeVisible(1,true);
   this.api.kernel.ChatManager.refresh();
   var chat = this;
   this._mcReplacementPanelMask.onRelease = function()
   {
    var _loc2_ = {};
    _loc2_.target = this;
    chat._replacementPanelsManager.click(_loc2_); // Asegúrate que _replacementPanelsManager exista
};
};
_loc1.click = function(oEvent)
{
   var _loc3_;
   var _loc5_;
   switch(oEvent.target._name)
   {
      case "_btnTitulos":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.kernel.Console.process(".titulos");
         break;
      case "_btnOrnamentos":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.kernel.Console.process(".ornamentos");
         break;
      case "_btnGlobalFights":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("wj");
         break;
      case "_btnLoginReward":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("wf");
         break;
      case "_btnMercadillo":
         this.api.sounds.events.onBannerChatButtonClick();
         if(this.api.datacenter.Basics.aks_exchange_echangeType != null)
         {
            this.api.network.Exchange.leave();
         }
         else
         {
            this.api.network.Exchange.request(11,0);
         }
         break;
      case "_btnServicios":
         this.api.sounds.events.onBannerChatButtonClick();
         _loc3_ = this.api.ui.createPopupMenu();
         _loc3_.addStaticItem("TIENDA_OGRINAS");
         _loc3_.addItem(this.api.lang.getText("TIENDA_OBJETOS"),this,this.escojerTienda);
         _loc3_.addItem(this.api.lang.getText("SERVICIOS"),this,this.escojerServicios);
         _loc3_.show(_root._xmouse,_root._ymouse);
         break;
      case "_btnTemporis":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("wY");
         break;
      case "_btnPase":
         this.api.sounds.events.onBannerChatButtonClick();
         if(this.api.ui.getUIComponent("Prestigio") != undefined)
         {
            this.api.ui.unloadUIComponent("Prestigio");
            break;
         }
         this.api.network.send("ZK");
         break;
      case "_btnBanco":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.kernel.Console.process(".banco");
         break;
      case "_btnPrestigio":
         this.api.sounds.events.onBannerChatButtonClick();
         if(this.api.ui.getUIComponent("PanelPrestige") != undefined)
         {
            this.api.ui.unloadUIComponent("PanelPrestige");
            break;
         }
         this.api.network.send("Xy");
         break;
      case "_btnKoliseo":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("kP");
         break;
      case "_btnCasino":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("we");
         break;
      case "_btnBestiario":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("ZC");
         break;
      case "_btnLadder":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("ZZ");
         break;
      case "_btnKxO":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("wT");
         break;
      case "_btnSitDown":
         this.api.sounds.events.onBannerChatButtonClick();
         _loc5_ = this.api.lang.getEmoteID("sit");
         if(_loc5_ != undefined)
         {
            this.api.network.Emotes.useEmote(_loc5_);
         }
         break;
      case "_btnLogros":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("wC");
         break;
      case "_btnSmileys":
         this.api.sounds.events.onBannerChatButtonClick();
         this.hideSmileys(this._bSmileysOpened);
         break;
      case "_btnOpenClose":
         this.api.sounds.events.onBannerChatButtonClick();
         this.open(!oEvent.target.selected);
         break;
      default:
         this.dispatchEvent({selected:oEvent.target.selected,filter:Number(oEvent.target._name.substr(10)),type:"filterChanged"});
   }
};
_loc1.over = function(oEvent)
{
   var _loc3_;
   switch(oEvent.target._name)
   {
      case "_btnTitulos":
         this.gapi.showTooltip("Titulos",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnOrnamentos":
         this.gapi.showTooltip("Ornamentos",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnMercadillo":
         this.gapi.showTooltip("Mercadillo Global",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnServicios":
         this.gapi.showTooltip("Tienda",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnTemporis":
         this.gapi.showTooltip(this.api.lang.getText("TEMPORIS"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnPase":
         this.gapi.showTooltip("Pase de batalla",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnLogros":
         this.gapi.showTooltip("Logros",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnGlobalFights":
         this.gapi.showTooltip("Peleas globales",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnLoginReward":
         this.gapi.showTooltip(this.api.lang.getText("LOGIN_REWARD"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnBanco":
         this.gapi.showTooltip("Banco",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnPrestigio":
         this.gapi.showTooltip(this.api.lang.getText("PRESTIGIO"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnKoliseo":
         this.gapi.showTooltip("Koliseo",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnLadder":
         this.gapi.showTooltip("Clasificación",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnKxO":
         this.gapi.showTooltip(this.api.lang.getText("MERCADILLO_OGRINAS"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnSmileys":
         this.gapi.showTooltip(this.api.lang.getText("CHAT_SHOW_SMILEYS"),oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnCasino":
         this.gapi.showTooltip("Ruleta",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnOpenClose":
         this.gapi.showTooltip(this.api.lang.getText("CHAT_SHOW_MORE"),oEvent.target,-33,{bYLimit:false,bXLimit:true});
         break;
      case "_btnBestiario":
         this.gapi.showTooltip("Enciclopedia",oEvent.target,-20,{bYLimit:false,bXLimit:true});
         break;
      case "_btnSitDown":
         this.gapi.showTooltip(this.api.lang.getText("SITDOWN_TOOLTIP"),oEvent.target,-46,{bYLimit:false,bXLimit:true});
         break;
      case "_btnShowMonsterTextOverHead":
         this.gapi.showTooltip(this.api.lang.getText("CHAT_SHOW_MONSTER_TEXT_OVERHEAD"),oEvent.target,-20,{bXLimit:true,bYLimit:false});
         break;
      default:
         _loc3_ = Number(oEvent.target._name.substr(10));
         this.gapi.showTooltip(this.api.lang.getText("CHAT_TYPE" + _loc3_),oEvent.target,-20,{bYLimit:true,bXLimit:true});
   }
};
_loc1.out = function(oEvent)
{
   this.gapi.hideTooltip();
};
_loc1.selectSmiley = function(oEvent)
{
   if(!this.api.datacenter.Player.data.isInMove)
   {
      this.dispatchEvent(oEvent);
      if(this.api.kernel.OptionsManager.getOption("AutoHideSmileys"))
      {
         this.hideSmileys(true);
      }
   }
};
_loc1.escojerTienda = function()
{
   this.api.network.send("wA");
};
_loc1.escojerServicios = function()
{
   this.api.network.send("ZOC");
};
_loc1.selectEmote = function(oEvent)
{
   if(!this.api.datacenter.Player.data.isInMove)
   {
      this.dispatchEvent(oEvent);
      if(this.api.kernel.OptionsManager.getOption("AutoHideSmileys"))
      {
         this.hideSmileys(true);
      }
   }
};
_loc1.href = function(oEvent)
{
   this.dispatchEvent(oEvent);
};
_loc1.addProperty("selectable",_loc1.__get__selectable,_loc1.__set__selectable);
_loc1.addProperty("filters",_loc1.__get__filters,function()
{
}
);
_loc1.useReplacementPanel = function(nReplacementPanel, aArgs)
{
    // Esta variable es TRUE si estamos en modo chat normal, FALSE si estamos en modo panel (widescreen).
    var bIsNormalChat = nReplacementPanel == dofus.graphics.gapi.ui.ChatReplacementPanelsManager.NO_REPLACEMENT_PANEL;

    // Muestra u oculta los elementos del chat normal
    this._chatFilters._visible = bIsNormalChat;
    this._txtChat._visible = bIsNormalChat;
    
    // Bucle para mostrar u ocultar todos los botones de filtro (_btnFilter0, _btnFilter1, etc.)
    var i = 0;
    while(i < 14) // El original usa 14, ajústalo si tienes más o menos filtros
    {
       if (this["_btnFilter" + i] != undefined) {
          this["_btnFilter" + i]._visible = bIsNormalChat;
       }
       i = i + 1;
    }

    // Muestra u oculta los contenedores de los paneles de reemplazo
    this._mcReplacementPanel._visible = !bIsNormalChat;
    this._mcReplacementPanelMask._visible = !bIsNormalChat;
    
    // Lógica específica para el minimapa
    this._mcMiniMapReplacementPanel._visible = nReplacementPanel == dofus.graphics.gapi.ui.ChatReplacementPanelsManager.MINIMAP && (!bIsNormalChat && !this._replacementPanelsManager.isCurrentReplacementPanelTemporary);
    
    // Llama al gestor de paneles para que cargue el contenido correcto (minimapa, etc.)
    this.addToQueue({object:this._replacementPanelsManager, method:this._replacementPanelsManager.changeReplacementPanel, params:[nReplacementPanel, undefined, aArgs]});
};
ASSetPropFlags(_loc1,null,1);
_global.dofus["\r\x14"].gapi.controls.Chat.CLASS_NAME = "Chat";
_global.dofus["\r\x14"].gapi.controls.Chat.OPEN_OFFSET = 350;
_loc1._bOpened = false;
#endinitclip