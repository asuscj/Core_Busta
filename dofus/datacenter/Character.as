#initclip 85
if(!dofus)
{
   _global.dofus = new Object();
}
if(!dofus.datacenter)
{
   _global.dofus.datacenter = new Object();
}
_global.dofus.datacenter["\x13\x01"] = function(sID, clipClass, sGfxFile, cellNum, dir, gfxID, title, title2, nOrnamento)
{
   super();
   this._title = title;
   this._title2 = title2;
   this._nOrnamento = nOrnamento;
   this.initialize(sID,clipClass,sGfxFile,cellNum,dir,gfxID);
};
dofus.datacenter["\x13\x01"].prototype = new dofus.datacenter["\x1e\x16\x13"]();
var _loc1 = dofus.datacenter["\x13\x01"].prototype;
_loc1.__get__speedModerator = function()
{
   if(this.isSlow)
   {
      return 0.5;
   }
   return this.agilidad + this._nSpeedModerator;
};
_loc1.__get__agilidad = function()
{
   return this._nAgilidad;
};
_loc1.__set__agilidad = function(value)
{
   this._nAgilidad = Number(value);
};
_loc1.__get__Ornamento = function()
{
   return this._nOrnamento;
};
_loc1.__set__Ornamento = function(value)
{
   this._nOrnamento = Number(value);
};
_loc1.__get__Guild = function()
{
   return this._nGuild;
};
_loc1.__set__Guild = function(value)
{
   this._nGuild = Number(value);
};
_loc1.__get__Sex = function()
{
   return this._nSex;
};
_loc1.__set__Sex = function(value)
{
   this._nSex = Number(value);
};
_loc1.__get__Aura = function()
{
   return this._nAura;
};
_loc1.__set__Aura = function(value)
{
   this._nAura = Number(value);
};
_loc1.__get__alignment = function()
{
   return this._oAlignment;
};
_loc1.__set__alignment = function(value)
{
   this._oAlignment = value;
};
_loc1.__get__Merchant = function()
{
   return this._bMerchant;
};
_loc1.__set__Merchant = function(value)
{
   this._bMerchant = value;
};
_loc1.__get__serverID = function()
{
   return this._nServerID;
};
_loc1.__set__serverID = function(value)
{
   this._nServerID = value;
};
_loc1.__get__Died = function()
{
   return this._bDied;
};
_loc1.__get__resets = function()
{
   return this._nResets;
};
_loc1.__set__resets = function(value)
{
   this._nResets = Number(value);
};
_loc1.__get__vipes = function()
{
   return this._nvipes;
};
_loc1.__set__vipes = function(value)
{
   this._nvipes = Number(value);
};
_loc1.__set__Died = function(value)
{
   this._bDied = value;
};
_loc1.__get__rank = function()
{
   return this._oRank;
};
_loc1.__set__rank = function(value)
{
   this._oRank = value;
};
_loc1.__get__multiCraftSkillsID = function()
{
   return this._aMultiCraftSkillsID;
};
_loc1.__set__multiCraftSkillsID = function(value)
{
   this._aMultiCraftSkillsID = value;
};
_loc1.__set__guildName = function(sGuildName)
{
   this._sGuildName = sGuildName;
};
_loc1.__get__guildName = function()
{
   return this._sGuildName;
};
_loc1.__get__title = function()
{
   return this._title;
};
_loc1.__get__title2 = function()
{
   return this._title2;
};
_loc1.__set__title2 = function(title2)
{
   this._title2 = title2;
};
_loc1.__get__Venta = function()
{
   return this._bVenta;
};
_loc1.__set__Venta = function(value)
{
   this._bVenta = value;
};
_loc1.__set__emblem = function(oEmblem)
{
   this._oEmblem = oEmblem;
};
_loc1.__get__emblem = function()
{
   return this._oEmblem;
};
_loc1.__set__restrictions = function(nRestrictions)
{
   this._nRestrictions = Number(nRestrictions);
};
_loc1.__get__canBeAssault = function()
{
   return (this._nRestrictions & 1) != 1;
};
_loc1.__get__canBeChallenge = function()
{
   return (this._nRestrictions & 2) != 2;
};
_loc1.__get__canExchange = function()
{
   return (this._nRestrictions & 4) != 4;
};
_loc1.__get__canBeAttack = function()
{
   return (this._nRestrictions & 8) != 8;
};
_loc1.__get__forceWalk = function()
{
   return (this._nRestrictions & 0x10) == 16;
};
_loc1.__get__isSlow = function()
{
   return (this._nRestrictions & 0x20) == 32;
};
_loc1.__get__canSwitchInCreaturesMode = function()
{
   return (this._nRestrictions & 0x40) != 64;
};
_loc1.__get__isTomb = function()
{
   return (this._nRestrictions & 0x80) == 128;
};
_loc1.__set__resistances = function(aResistances)
{
   this._aResistances = aResistances;
};
_loc1.__get__resistances = function()
{
   var _loc3_ = new Array();
   var _loc2_ = 0;
   while(_loc2_ < this._aResistances.length)
   {
      _loc3_[_loc2_] = this._aResistances[_loc2_];
      _loc2_ += 1;
   }
   _loc3_[5] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PA_LOST_PROBABILITY);
   _loc3_[6] += this.CharacteristicsManager.getModeratorValue(dofus["\x0b\b"].CharacteristicsManager.DODGE_PM_LOST_PROBABILITY);
   return _loc3_;
};

// Setters for stats to dispatch events for heroes
_loc1.__get__Level = function() { return this._nLevel; };
_loc1.__set__Level = function(value) {
   this._nLevel = Number(value);
   this.dispatchEvent({type:"levelChanged",value:this._nLevel});
};

_loc1.__get__XP = function() { return this._nXP; };
_loc1.__set__XP = function(value) {
   this._nXP = Number(value);
   this.dispatchEvent({type:"xpChanged",value:this._nXP});
};

_loc1.__get__LP = function() { return this._nLP; };
_loc1.__set__LP = function(value) {
   this._nLP = Number(value);
   this.dispatchEvent({type:"lpChanged",value:this._nLP});
};

_loc1.__get__LPmax = function() { return this._nLPmax; };
_loc1.__set__LPmax = function(value) {
   this._nLPmax = Number(value);
   this.dispatchEvent({type:"lpMaxChanged",value:this._nLPmax});
};

_loc1.__get__AP = function() { return this._nAP; };
_loc1.__set__AP = function(value) {
   this._nAP = Number(value);
   this.dispatchEvent({type:"apChanged",value:this._nAP});
};

_loc1.__get__MP = function() { return this._nMP; };
_loc1.__set__MP = function(value) {
   this._nMP = Number(value);
   this.dispatchEvent({type:"mpChanged",value:this._nMP});
};

_loc1.__get__Initiative = function() { return this._nInitiative; };
_loc1.__set__Initiative = function(value) {
   this._nInitiative = Number(value);
   this.dispatchEvent({type:"initiativeChanged",value:this._nInitiative});
};

_loc1.__get__Discernment = function() { return this._nDiscernment; };
_loc1.__set__Discernment = function(value) {
   this._nDiscernment = Number(value);
   this.dispatchEvent({type:"discernmentChanged",value:this._nDiscernment});
};

_loc1.__get__ForceXtra = function() { return this._nForceXtra; };
_loc1.__set__ForceXtra = function(value) {
   this._nForceXtra = Number(value);
   this.dispatchEvent({type:"forceXtraChanged",value:this._nForceXtra});
};

_loc1.__get__VitalityXtra = function() { return this._nVitalityXtra; };
_loc1.__set__VitalityXtra = function(value) {
   this._nVitalityXtra = Number(value);
   this.dispatchEvent({type:"vitalityXtraChanged",value:this._nVitalityXtra});
};

_loc1.__get__WisdomXtra = function() { return this._nWisdomXtra; };
_loc1.__set__WisdomXtra = function(value) {
   this._nWisdomXtra = Number(value);
   this.dispatchEvent({type:"wisdomXtraChanged",value:this._nWisdomXtra});
};

_loc1.__get__ChanceXtra = function() { return this._nChanceXtra; };
_loc1.__set__ChanceXtra = function(value) {
   this._nChanceXtra = Number(value);
   this.dispatchEvent({type:"chanceXtraChanged",value:this._nChanceXtra});
};

_loc1.__get__AgilityXtra = function() { return this._nAgilityXtra; };
_loc1.__set__AgilityXtra = function(value) {
   this._nAgilityXtra = Number(value);
   this.dispatchEvent({type:"agilityXtraChanged",value:this._nAgilityXtra});
};

_loc1.__get__IntelligenceXtra = function() { return this._nIntelligenceXtra; };
_loc1.__set__IntelligenceXtra = function(value) {
   this._nIntelligenceXtra = Number(value);
   this.dispatchEvent({type:"intelligenceXtraChanged",value:this._nIntelligenceXtra});
};

_loc1.__get__BonusPoints = function() { return this._nBonusPoints; };
_loc1.__set__BonusPoints = function(value) {
   this._nBonusPoints = Number(value);
   this.dispatchEvent({type:"bonusPointsChanged",value:this._nBonusPoints});
};

_loc1.__get__BonusPointsSpell = function() { return this._nBonusPointsSpell; };
_loc1.__set__BonusPointsSpell = function(value) {
   this._nBonusPointsSpell = Number(value);
   this.dispatchEvent({type:"bonusSpellsChanged",value:this._nBonusPointsSpell});
};

_loc1.__get__Energy = function() { return this._nEnergy; };
_loc1.__set__Energy = function(value) {
   this._nEnergy = Number(value);
   this.dispatchEvent({type:"energyChanged",value:this._nEnergy});
};

_loc1.__get__EnergyMax = function() { return this._nEnergyMax; };
_loc1.__set__EnergyMax = function(value) {
   this._nEnergyMax = Number(value);
   this.dispatchEvent({type:"energyMaxChanged",value:this._nEnergyMax});
};

_loc1.addProperty("Level",_loc1.__get__Level,_loc1.__set__Level);
_loc1.addProperty("XP",_loc1.__get__XP,_loc1.__set__XP);
_loc1.addProperty("LP",_loc1.__get__LP,_loc1.__set__LP);
_loc1.addProperty("LPmax",_loc1.__get__LPmax,_loc1.__set__LPmax);
_loc1.addProperty("AP",_loc1.__get__AP,_loc1.__set__AP);
_loc1.addProperty("MP",_loc1.__get__MP,_loc1.__set__MP);
_loc1.addProperty("Initiative",_loc1.__get__Initiative,_loc1.__set__Initiative);
_loc1.addProperty("Discernment",_loc1.__get__Discernment,_loc1.__set__Discernment);
_loc1.addProperty("ForceXtra",_loc1.__get__ForceXtra,_loc1.__set__ForceXtra);
_loc1.addProperty("VitalityXtra",_loc1.__get__VitalityXtra,_loc1.__set__VitalityXtra);
_loc1.addProperty("WisdomXtra",_loc1.__get__WisdomXtra,_loc1.__set__WisdomXtra);
_loc1.addProperty("ChanceXtra",_loc1.__get__ChanceXtra,_loc1.__set__ChanceXtra);
_loc1.addProperty("AgilityXtra",_loc1.__get__AgilityXtra,_loc1.__set__AgilityXtra);
_loc1.addProperty("IntelligenceXtra",_loc1.__get__IntelligenceXtra,_loc1.__set__IntelligenceXtra);
_loc1.addProperty("BonusPoints",_loc1.__get__BonusPoints,_loc1.__set__BonusPoints);
_loc1.addProperty("BonusPointsSpell",_loc1.__get__BonusPointsSpell,_loc1.__set__BonusPointsSpell);
_loc1.addProperty("Energy",_loc1.__get__Energy,_loc1.__set__Energy);
_loc1.addProperty("EnergyMax",_loc1.__get__EnergyMax,_loc1.__set__EnergyMax);
_loc1.addProperty("alignment",_loc1.__get__alignment,_loc1.__set__alignment);
_loc1.addProperty("Aura",_loc1.__get__Aura,_loc1.__set__Aura);
_loc1.addProperty("ornamento",_loc1.__get__Ornamento,_loc1.__set__Ornamento);
_loc1.addProperty("isTomb",_loc1.__get__isTomb,function()
{
}
);
_loc1.addProperty("emblem",_loc1.__get__emblem,_loc1.__set__emblem);
_loc1.addProperty("resistances",_loc1.__get__resistances,_loc1.__set__resistances);
_loc1.addProperty("canBeChallenge",_loc1.__get__canBeChallenge,function()
{
}
);
_loc1.addProperty("Died",_loc1.__get__Died,_loc1.__set__Died);
_loc1.addProperty("canBeAttack",_loc1.__get__canBeAttack,function()
{
}
);
_loc1.addProperty("title",_loc1.__get__title,function()
{
}
);
_loc1.addProperty("title2",_loc1.__get__title2,function()
{
}
);
_loc1.addProperty("serverID",_loc1.__get__serverID,_loc1.__set__serverID);
_loc1.addProperty("guildName",_loc1.__get__guildName,_loc1.__set__guildName);
_loc1.addProperty("canExchange",_loc1.__get__canExchange,function()
{
}
);
_loc1.addProperty("canBeAssault",_loc1.__get__canBeAssault,function()
{
}
);
_loc1.addProperty("forceWalk",_loc1.__get__forceWalk,function()
{
}
);
_loc1.addProperty("Sex",_loc1.__get__Sex,_loc1.__set__Sex);
_loc1.addProperty("Guild",_loc1.__get__Guild,_loc1.__set__Guild);
_loc1.addProperty("multiCraftSkillsID",_loc1.__get__multiCraftSkillsID,_loc1.__set__multiCraftSkillsID);
_loc1.addProperty("Merchant",_loc1.__get__Merchant,_loc1.__set__Merchant);
_loc1.addProperty("Venta",_loc1.__get__Venta,_loc1.__set__Venta);
_loc1.addProperty("rank",_loc1.__get__rank,_loc1.__set__rank);
_loc1.addProperty("speedModerator",_loc1.__get__speedModerator,function()
{
}
);
_loc1.addProperty("resets",_loc1.__get__resets,_loc1.__set__resets);
_loc1.addProperty("vipes",_loc1.__get__vipes,_loc1.__set__vipes);
_loc1.addProperty("canSwitchInCreaturesMode",_loc1.__get__canSwitchInCreaturesMode,function()
{
}
);
_loc1.addProperty("restrictions",function()
{
}
,_loc1.__set__restrictions);
_loc1.addProperty("isSlow",_loc1.__get__isSlow,function()
{
}
);
_loc1.addProperty("agilidad",_loc1.__get__agilidad,_loc1.__set__agilidad);
// ASSetPropFlags(_loc1,null,1); // Removed - decompilation error
_loc1._nAgilidad = Number(0);
_loc1.xtraClipTopAnimations = {staticF:true};
#endinitclip
