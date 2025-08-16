#initclip 121
var _loc1 = ank.battlefield.datacenter["\x13\n"].prototype;
_loc1.__get__isTactic = function(oMap)
{
    var bIsTactic = false; 
    if(this.layerGroundNum == 0 && (this.groundSlope == 1 && (this.layerObject2Num == 0 || (this.layerObject2Num == 25 || this.layerObject2Num == 1030))))
    {
      if(!this.lineOfSight)
      {
         if(this.layerObject1Num == dofus.Constants.getTacticGfx(oMap.subarea,0)) 
         {
            bIsTactic = true;
         }
      }
      else if(this.movement == 0 || this.movement == 1)
      {
         if(this.layerObject1Num == 10002)
         {
            bIsTactic = true;
         }
      }
      else if(this.layerObject1Num == dofus.Constants.getTacticGfx(oMap.subarea,1) || this.layerObject1Num == dofus.Constants.getTacticGfx(oMap.subarea,2))
      {
         bIsTactic = true;
      }
   }
   return bIsTactic;
};
_loc1.turnTactic = function(mapHandler, oMap)
{
  var isTriggerCell = this.isTrigger;
  if(this.nPermanentLevel == 0)
  {
     this.nPermanentLevel = 1;
  }
  this.layerGroundNum = 0;
  this.groundSlope = 1;
  this.layerObject1Rot = 0;
  var cellCoords;
  if(!this.lineOfSight)
  {
     this.layerObject1Num = dofus.Constants.getTacticGfx(oMap.subarea,0);
  }
  else if(this.movement == 0 || this.movement == 1)
  {
     this.layerObject1Num = 10002;
  }
  else
  {
     cellCoords = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(mapHandler,this.num);
     var isEven = Math.abs(cellCoords.x) % 2 == Math.abs(cellCoords.y) % 2;
     this.layerObject1Num = isEven ? dofus.Constants.getTacticGfx(oMap.subarea,1) : dofus.Constants.getTacticGfx(oMap.subarea,3);
  }
  if(this.layerObject2Num != 25)
  {
     if(!this.lineOfSight)
     {
       this.layerObject2Num = dofus.Constants.getTacticLayerObject2(oMap.subarea); 
     }
     else if(isTriggerCell)
     {
       this.layerObject2Num = 1030;
     }
     else
     {
       this.layerObject2Num = 0;
     }
  }
};
_loc1.addProperty("isTactic",function()
{
}
,_loc1.__get__isTactic);
_loc1.estrellas = -1;
_loc1.layerTactico1_1 = 0;
_loc1.layerTactico1_2 = 0;
_loc1.layerTactico2_1 = 0;
_loc1.layerTactico2_2 = 0;
_loc1.oGroundSlope = 1;
#endinitclip