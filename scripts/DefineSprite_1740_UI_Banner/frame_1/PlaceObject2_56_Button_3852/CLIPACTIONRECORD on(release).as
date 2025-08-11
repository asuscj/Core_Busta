on(release){
   if(!this._parent.api.datacenter.Game.isFight)
   {
      var _loc3_ = this._parent.api.ui.createPopupMenu();
      _loc3_.addStaticItem("Comandos Exprés del Servidor");
      _loc3_.addItem("Astrub",this._parent.api.network,this._parent.api.network.send,["BM*|.astrub|"]);
      _loc3_.addItem("El pueblo",this._parent.api.network,this._parent.api.network.send,["BM*|.pueblo|"]);
      _loc3_.addItem("[ PvP ]",this._parent.api.network,this._parent.api.network.send,["BM*|.pvp|"]);
      _loc3_.addItem("[ Shop ]",this._parent.api.network,this._parent.api.network.send,["BM*|.shop|"]);
      _loc3_.addItem("[ Zonas ]",this._parent.api.network,this._parent.api.network.send,["BM*|.zonas|"]);
      _loc3_.addItem("Finaccion",this._parent.api.network,this._parent.api.network.send,["BM*|.finaccion|"]);
      _loc3_.addItem("Desbuguear",this._parent.api.network,this._parent.api.network.send,["BM*|.deblo|"]);
      _loc3_.addItem("Infos",this._parent.api.network,this._parent.api.network.send,["BM*|.infos|"]);
      _loc3_.addItem("Comandos",this._parent.api.network,this._parent.api.network.send,["BM*|.comandos|"]);
      _loc3_.addItem("Ser Brakmariano",this._parent.api.network,this._parent.api.network.send,["BM*|.brakmar|"]);
      _loc3_.addItem("Ser Neutral",this._parent.api.network,this._parent.api.network.send,["BM*|.neutral|"]);
      _loc3_.addItem("Ser Bontariano",this._parent.api.network,this._parent.api.network.send,["BM*|.bonta|"]);
      _loc3_.show(_root._xmouse,_root._ymouse);
   }
}
