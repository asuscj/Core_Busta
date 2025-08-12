#initclip 111
var _loc1 = _global.dofus.datacenter["\x1e\x15\x12"].prototype;
_loc1.__get__rewards = function()
{
    var _loc4_ = new ank.gapi.controls.util.Sort();
    var _loc17_ = this.api.lang.getQuestStepText(this._nID).r;

    if (_global.RECOMPENSAS[this._nID] != undefined)
    {
        _loc17_ = _global.RECOMPENSAS[this._nID];
    }

    if (_loc17_[0] != undefined)
    {
        _loc4_.push({iconFile: "UI_QuestXP", label: _loc17_[0]});
    }

    if (_loc17_[1] != undefined)
    {
        _loc4_.push({iconFile: "UI_QuestKamaSymbol", label: _loc17_[1]});
    }

    // Procesar recompensas de Items
    if (_loc17_[2] != undefined)
    {
        var _loc12_ = _loc17_[2];
        // BUCLE CORREGIDO
        for (var i = 0; i < _loc12_.length; i++)
        {
            var _loc15_ = Number(_loc12_[i][0]);
            var _loc3_ = _loc12_[i][1];
            var _loc7_ = new dofus.datacenter.Item(0, _loc15_, _loc3_);
            _loc4_.push({iconFile: _loc7_.iconFile, label: (_loc3_ == 0 ? "" : "x" + _loc3_ + " ") + _loc7_.name});
        }
    }

    // Procesar recompensas de Emotes
    if (_loc17_[3] != undefined)
    {
        var _loc19_ = _loc17_[3];
        // BUCLE CORREGIDO
        for (var i = 0; i < _loc19_.length; i++)
        {
            var _loc6_ = Number(_loc19_[i]);
            _loc4_.push({iconFile: dofus.Constants.EMOTES_ICONS_PATH + _loc6_ + ".swf", label: this.api.lang.getEmoteText(_loc6_).n});
        }
    }

    // Procesar recompensas de Oficios
    if (_loc17_[4] != undefined)
    {
        var _loc18_ = _loc17_[4];
        // BUCLE CORREGIDO
        for (var i = 0; i < _loc18_.length; i++)
        {
            var _loc14_ = Number(_loc18_[i]);
            var _loc9_ = new dofus.datacenter.Job(_loc14_);
            _loc4_.push({iconFile: _loc9_.iconFile, label: _loc9_.name});
        }
    }

    // Procesar recompensas de Hechizos
    if (_loc17_[5] != undefined)
    {
        var _loc20_ = _loc17_[5];
        // BUCLE CORREGIDO
        for (var i = 0; i < _loc20_.length; i++)
        {
            var _loc16_ = Number(_loc20_[i]);
            var _loc8_ = new dofus.datacenter.Spell(_loc16_, 1);
            _loc4_.push({iconFile: _loc8_.iconFile, label: _loc8_.name});
        }
    }
    
    return _loc4_;
};
_loc1.addProperty("rewards",_loc1.__get__rewards,function()
{
}
);
#endinitclip