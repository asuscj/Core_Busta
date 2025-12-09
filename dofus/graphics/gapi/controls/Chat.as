var _loc1 = dofus["\r\x14"].gapi.controls.Chat.prototype;
_loc1.__get__filters = function()
{
   return new Array(this._btnFilter0.selected,this._btnFilter1.selected,this._btnFilter2.selected,this._btnFilter3.selected,this._btnFilter4.selected,this._btnFilter5.selected,this._btnFilter6.selected,this._btnFilter7.selected,this._btnFilter8.selected,this._btnFilter11.selected);
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
   this._btnFilter11.addEventListener("click",this);
   this._btnSitDown.addEventListener("click",this);
   this._btnBigStore.addEventListener("click",this);
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
   this._btnFilter11.addEventListener("over",this);
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
   this._btnFilter11.addEventListener("out",this);
   this._sSmileys.addEventListener("selectSmiley",this);
   this._sSmileys.addEventListener("selectEmote",this);
   this._txtChat.addEventListener("href",this);
   var _loc3_ = this._btnFilter0;
   var _loc2_ = 0;
   while(_loc3_ != undefined)
   {
      _loc3_.selected = this.api.datacenter.Basics.chat_type_visible[_loc2_] == true;
      _loc3_.selected = true;
      this.api.kernel.ChatManager.setTypeVisible(_loc2_,_loc3_.selected);
      _loc2_ += 1;
      _loc3_ = this["_btnFilter" + _loc2_];
   }
   this.api.kernel.ChatManager.setTypeVisible(1,true);
   this.api.kernel.ChatManager.refresh();
   this._btnHeroes.addEventListener("click",this);
   this._btnHeroes.addEventListener("over",this);
   this._btnHeroes.addEventListener("out",this);
   this._btnOgrinas.addEventListener("click",this);
   this._btnOgrinas.addEventListener("over",this);
   this._btnOgrinas.addEventListener("out",this);
   this._btnBestiario.addEventListener("click",this);
   this._btnBestiario.addEventListener("over",this);
   this._btnBestiario.addEventListener("out",this);
   this._btnOrnamentos.addEventListener("click",this);
   this._btnOrnamentos.addEventListener("over",this);
   this._btnOrnamentos.addEventListener("out",this);
   this._btnMercadillo.addEventListener("click",this);
   this._btnMercadillo.addEventListener("over",this);
   this._btnMercadillo.addEventListener("out",this);
   this._btnBanco.addEventListener("click",this);
   this._btnBanco.addEventListener("over",this);
   this._btnBanco.addEventListener("out",this);
   this._btnPase.addEventListener("click",this);
   this._btnPase.addEventListener("over",this);
   this._btnPase.addEventListener("out",this);
   this._btnLadder.addEventListener("click",this);
   this._btnLadder.addEventListener("over",this);
   this._btnLadder.addEventListener("out",this);
   this._btnTitulos.addEventListener("click",this);
   this._btnTitulos.addEventListener("over",this);
   this._btnTitulos.addEventListener("out",this);
   this._btnRuleta.addEventListener("click",this);
   this._btnRuleta.addEventListener("over",this);
   this._btnRuleta.addEventListener("out",this);
   this._btnInfo.addEventListener("click",this);
   this._btnInfo.addEventListener("over",this);
   this._btnInfo.addEventListener("out",this);
   this._btnLogros.addEventListener("click",this);
   this._btnLogros.addEventListener("over",this);
   this._btnLogros.addEventListener("out",this);
   this._btnMazmorra.addEventListener("click",this);
   this._btnMazmorra.addEventListener("over",this);
   this._btnMazmorra.addEventListener("out",this);
   this._btnKoliseo.addEventListener("click",this);
   this._btnKoliseo.addEventListener("over",this);
   this._btnKoliseo.addEventListener("out",this);
   this._btnAlmanax.addEventListener("click",this);
   this._btnAlmanax.addEventListener("over",this);
   this._btnAlmanax.addEventListener("out",this);
   this._btnMercado.addEventListener("click",this);
   this._btnMercado.addEventListener("over",this);
   this._btnMercado.addEventListener("out",this);
   this._btnPlus.addEventListener("click",this);
   this._btnPlus.addEventListener("over",this);
   this._btnPlus.addEventListener("out",this);
   this.mostrarBotones(false);
};
_loc1.mostrando = false;
_loc1.mostrarBotones = function(bShow)
{
   this._btnOgrinas._visible = bShow;
   this._btnBestiario._visible = bShow;
   this._btnOrnamentos._visible = bShow;
   this._btnMercadillo._visible = bShow;
   this._btnBanco._visible = bShow;
   this._btnLadder._visible = bShow;
   this._btnPase._visible = bShow;
   this._btnTitulos._visible = bShow;
   this._btnRuleta._visible = bShow;
   this._btnInfo._visible = bShow;
   this._btnLogros._visible = bShow;
   this._btnMazmorra._visible = bShow;
   this._btnKoliseo._visible = bShow;
   this._btnAlmanax._visible = bShow;
   this._btnMercado._visible = bShow;
   this._winMenu._visible = bShow;
   this.mostrando = bShow;
};
_loc1.showSitDown = function(bShow)
{
   this._btnSitDown._visible = bShow;
   this._btnHeroes._visible = bShow;
};
_loc1.click = function(_loc2_)
{
   var _loc2_;
   switch(_loc2_.target._name)
   {
      case "_btnOgrinas":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("kbo");
         break;
      case "_btnPlus":
         this.api.sounds.events.onBannerChatButtonClick();
         if(this.mostrando)
         {
            this.mostrarBotones(false);
            this._btnPlus.backgroundDown = "ButtonPlus2Up";
            this._btnPlus.backgroundUp = "ButtonPlus2Up";
            break;
         }
         this.mostrarBotones(true);
         this._btnPlus.backgroundDown = "ButtonPlus2Down";
         this._btnPlus.backgroundUp = "ButtonPlus2Down";
         break;
      case "_btnBestiario":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("ZC");
         break;
      case "_btnOrnamentos":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.kernel.Console.process(".ornement");
         break;
      case "_btnMercadillo":
         this.api.sounds.events.onBannerChatButtonClick();
         if(this._mercadilloAbierto)
         {
            this.api.network.send("EV");
         }
         else
         {
            this.api.network.send("ER11");
         }
         this._mercadilloAbierto = !this._mercadilloAbierto;
         break;
      case "_btnBanco":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("XD8");
         break;
      case "_btnPase":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("?2");
         break;
      case "_btnLadder":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("ZZ");
         break;
      case "_btnHeroes":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("HP");
         break;
      case "_btnTitulos":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("XDT");
         break;
      case "_btnRuleta":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("we");
         break;
      case "_btnInfo":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.ui.loadUIAutoHideComponent("GiftTemporis","GiftTemporis");
         break;
      case "_btnLogros":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("wCA");
         break;
      case "_btnMazmorra":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("?m");
         break;
      case "_btnKoliseo":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("?k");
         break;
      case "_btnAlmanax":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("ZA");
         break;
      case "_btnMercado":
         this.api.sounds.events.onBannerChatButtonClick();
         this.api.network.send("?1O");
         break;
      case "_btnSitDown":
         this.api.sounds.events.onBannerChatButtonClick();
         _loc2_ = this.api.lang.getEmoteID("sit");
         if(_loc2_ != undefined)
         {
            this.api.network.Emotes.useEmote(_loc2_);
         }
         break;
      case "_btnSmileys":
         this.api.sounds.events.onBannerChatButtonClick();
         this.hideSmileys(this._bSmileysOpened);
         break;
      case "_btnOpenClose":
         this.api.sounds.events.onBannerChatButtonClick();
         this.open(!_loc2_.target.selected);
         break;
      case "_btnFilter0":
         this.dispatchEvent({type:"filterChanged",filter:0,selected:this._btnFilter0.selected});
         this.api.kernel.ChatManager.setTypeVisible(0,this._btnFilter0.selected);
         break;
      case "_btnFilter1":
         this.dispatchEvent({type:"filterChanged",filter:1,selected:this._btnFilter1.selected});
         this.api.kernel.ChatManager.setTypeVisible(1,this._btnFilter1.selected);
         break;
      case "_btnFilter2":
         this.dispatchEvent({type:"filterChanged",filter:2,selected:this._btnFilter2.selected});
         this.api.kernel.ChatManager.setTypeVisible(2,this._btnFilter2.selected);
         break;
      case "_btnFilter3":
         this.dispatchEvent({type:"filterChanged",filter:3,selected:this._btnFilter3.selected});
         this.api.kernel.ChatManager.setTypeVisible(3,this._btnFilter3.selected);
         break;
      case "_btnFilter4":
         this.dispatchEvent({type:"filterChanged",filter:4,selected:this._btnFilter4.selected});
         this.api.kernel.ChatManager.setTypeVisible(4,this._btnFilter4.selected);
         break;
      case "_btnFilter5":
         this.dispatchEvent({type:"filterChanged",filter:5,selected:this._btnFilter5.selected});
         this.api.kernel.ChatManager.setTypeVisible(5,this._btnFilter6.selected);
         break;
      case "_btnFilter6":
         this.dispatchEvent({type:"filterChanged",filter:6,selected:this._btnFilter6.selected});
         this.api.kernel.ChatManager.setTypeVisible(6,this._btnFilter6.selected);
         break;
      case "_btnFilter7":
         this.dispatchEvent({type:"filterChanged",filter:7,selected:this._btnFilter7.selected});
         this.api.kernel.ChatManager.setTypeVisible(7,this._btnFilter7.selected);
         break;
      case "_btnFilter8":
         this.dispatchEvent({type:"filterChanged",filter:8,selected:this._btnFilter8.selected});
         this.api.kernel.ChatManager.setTypeVisible(8,this._btnFilter8.selected);
         break;
      case "_btnFilter9":
         this.dispatchEvent({type:"filterChanged",filter:9,selected:this._btnFilter9.selected});
         this.api.kernel.ChatManager.setTypeVisible(9,this._btnFilter9.selected);
         break;
      case "_btnFilter10":
         this.dispatchEvent({type:"filterChanged",filter:10,selected:this._btnFilter10.selected});
         this.api.kernel.ChatManager.setTypeVisible(10,this._btnFilter10.selected);
         break;
      case "_btnFilter11":
         this.dispatchEvent({type:"filterChanged",filter:11,selected:this._btnFilter11.selected});
         this.api.kernel.ChatManager.setTypeVisible(11,this._btnFilter11.selected);
         break;
      default:
         this.dispatchEvent({type:"filterChanged",filter:Number(_loc2_.target._name.substr(10)),selected:_loc2_.target.selected});
   }
   this.api.ui.unloadUIComponent("TiendaDung");
};
_loc1.over = function(_loc2_)
{
   var _loc3_;
   switch(_loc2_.target._name)
   {
      case "_btnHeroes":
         this.gapi.showTooltip(this.api.lang.getText("PANEL_HEROES"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnPlus":
         this.gapi.showTooltip(this.api.lang.getText("MENU_CHAT"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnOgrinas":
         this.gapi.showTooltip(this.api.lang.getText("TIENDA"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnBestiario":
         this.gapi.showTooltip(this.api.lang.getText("BESTIARIO"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnOrnamentos":
         this.gapi.showTooltip(this.api.lang.getText("ORNAMENTOS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnMercadillo":
         this.gapi.showTooltip(this.api.lang.getText("MERCADILLO"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnBanco":
         this.gapi.showTooltip(this.api.lang.getText("BANCO"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnLadder":
         this.gapi.showTooltip(this.api.lang.getText("LADDER"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnPase":
         this.gapi.showTooltip(this.api.lang.getText("PASE"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnTitulos":
         this.gapi.showTooltip(this.api.lang.getText("TITULOS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnRuleta":
         this.gapi.showTooltip(this.api.lang.getText("RULETA"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnInfo":
         this.gapi.showTooltip(this.api.lang.getText("GIFT_AREA"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnLogros":
         this.gapi.showTooltip(this.api.lang.getText("LOGROS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnMazmorra":
         this.gapi.showTooltip(this.api.lang.getText("MAZMORRA"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnKoliseo":
         this.gapi.showTooltip(this.api.lang.getText("KOLISEO"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnAlmanax":
         this.gapi.showTooltip(this.api.lang.getText("ALMANAX"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnMercado":
         this.gapi.showTooltip(this.api.lang.getText("MERCADO"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnSmileys":
         this.gapi.showTooltip(this.api.lang.getText("CHAT_SHOW_SMILEYS"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      case "_btnOpenClose":
         this.gapi.showTooltip(this.api.lang.getText("CHAT_SHOW_MORE"),_loc2_.target,-33,{bXLimit:true,bYLimit:false});
         return;
      case "_btnSitDown":
         this.gapi.showTooltip(this.api.lang.getText("SITDOWN_TOOLTIP"),_loc2_.target,-46,{bXLimit:true,bYLimit:false});
         return;
      case "_btnBigStore":
         this.gapi.showTooltip(this.api.lang.getText("BIGSTORE_TOOLTIP"),_loc2_.target,-20,{bXLimit:true,bYLimit:false});
         return;
      default:
         _loc3_ = Number(_loc2_.target._name.substr(10));
         this.gapi.showTooltip(this.api.lang.getText("CHAT_TYPE" + _loc3_),_loc2_.target,-20,{bXLimit:true,bYLimit:true});
         return;
   }
};
_loc1.out = function(_loc2_)
{
   if(this.api.gfx.mapHandler.showingFightCells && !this.api.datacenter.Game.isFight)
   {
      this.api.gfx.unSelect(true);
      this.api.gfx.mapHandler.showingFightCells = false;
   }
   this.gapi.hideTooltip();
};
