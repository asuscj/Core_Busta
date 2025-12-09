class dofus.managers.NightManager {
   static var _bNightMode = false;
   static var NIGHT_BG_COLOR = 0x222233; // Fondo oscuro
   static var NIGHT_TEXT_COLOR = 0xCCCCFF; // Texto claro

   static function setState() {
      var bActive = _global.API.kernel.OptionsManager.getOption("NightMode");
      NightManager._bNightMode = bActive;
      if(bActive) {
         NightManager.applyToChat();
         NightManager.applyToBattlefield();
      } else {
         NightManager.resetChat();
         NightManager.resetBattlefield();
      }
   }

   static function clear() {
      NightManager._bNightMode = false;
      NightManager.resetChat();
      NightManager.resetBattlefield();
   }

   static function applyToChat() {
      var chatUI = _global.API.ui.getUIComponent("Banner");
      if(chatUI && chatUI._mcChat) {
         chatUI._mcChat.backgroundColor = NightManager.NIGHT_BG_COLOR;
         chatUI._mcChat.textColor = NightManager.NIGHT_TEXT_COLOR;
      }
   }

   static function resetChat() {
      var chatUI = _global.API.ui.getUIComponent("Banner");
      if(chatUI && chatUI._mcChat) {
         chatUI._mcChat.backgroundColor = 0xFFFFFF;
         chatUI._mcChat.textColor = 0x000000;
      }
   }

   static function applyToBattlefield() {
      var battlefield = _global.API.gfx.getBattlefield();
      if(battlefield) {
         battlefield.setBackgroundColor(NightManager.NIGHT_BG_COLOR);
      }
   }

   static function resetBattlefield() {
      var battlefield = _global.API.gfx.getBattlefield();
      if(battlefield) {
         battlefield.setBackgroundColor(0xCCCCCC);
      }
   }

   static function isNightMode() {
      return NightManager._bNightMode;
   }
}
