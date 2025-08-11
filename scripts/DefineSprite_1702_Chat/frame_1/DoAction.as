var radio = new Sound();
var state = false;
RadioServer.onPress = function()
{
   if(state)
   {
      radio.stop();
      RadioServer.gotoAndStop("play");
   }
   else
   {
      radio.loadSound("https://19313.live.streamtheworld.com/XLTNFM_SC",true);
      radio.start();
      radio.play();
      RadioServer.gotoAndStop("pause");
   }
   state = !state;
};
