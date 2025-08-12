#initclip 121
var _loc1 = ank.battlefield.datacenter["\x13\n"].prototype;
_loc1.__get__isTactic = function(_loc2_)
{
   var _loc2_ = false;
   if(this.layerGroundNum == 0 && (this.groundSlope == 1 && (this.layerObject2Num == 0 || (this.layerObject2Num == 25 || this.layerObject2Num == 1030))))
   {
      if(!this.lineOfSight)
      {
         if(this.layerObject1Num == dofus.Constants.getTacticGfx(_loc2_.subarea,0))
         {
            _loc2_ = true;
         }
      }
      else if(this.movement == 0 || this.movement == 1)
      {
         if(this.layerObject1Num == 10002)
         {
            _loc2_ = true;
         }
      }
      else if(this.layerObject1Num == dofus.Constants.getTacticGfx(_loc2_.subarea,1) || this.layerObject1Num == dofus.Constants.getTacticGfx(_loc2_.subarea,3))
      {
         _loc2_ = true;
      }
   }
   return _loc2_;
};
_loc1.turnTactic = function(mapHandler, oMapData) {
    // Nos aseguramos de que no quede ningún gráfico del mapa original.
    this.layerGroundNum = 0;
    this.layerObject1Num = 0;
    this.layerObject2Num = 0;
    this.layerObjectExternal = "";
    this.groundSlope = 1;
    this.layerObject1Rot = 0;
    
    // Guardamos el estado de la celda para el respaldo (backup)
    if (this.nPermanentLevel == 0) {
        this.nPermanentLevel = 1;
    }
    // DIBUJAR LOS NUEVOS GRÁFICOS TÁCTICOS
    var cellCoords;
    var isEven;

    if (!this.lineOfSight) {
        // Celda de obstáculo (sin línea de visión)
        this.layerObject1Num = dofus.Constants.getTacticGfx(oMapData.subarea, 0);

    } else if (this.movement == 0 || this.movement == 1) {
        // Celda caminable pero no para colocar personaje (azul claro)
        this.layerObject1Num = 10002;
        
    } else {
        // Celda de posicionamiento normal (azul oscuro y blanco)
        cellCoords = ank.battlefield["\x1e\n\x07"]["\x1e\x16\x1a"].getCaseCoordonnee(mapHandler, this.num);
        isEven = Math.abs(cellCoords.x) % 2 == Math.abs(cellCoords.y) % 2;
        this.layerObject1Num = isEven ? dofus.Constants.getTacticGfx(oMapData.subarea, 1) : dofus.Constants.getTacticGfx(oMapData.subarea, 3);
    }
    
    // Lógica adicional para triggers (glifos, trampas), si es necesario
    if (this.isTrigger) {
        this.layerObject2Num = 1030; // ID del gráfico para triggers
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