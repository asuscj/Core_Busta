#initclip 16
if (!dofus)
{
    _global.dofus = new Object();
} // end if
if (!dofus["\r\x14"])
{
    _global.dofus["\r\x14"] = new Object();
} // end if
if (!dofus["\r\x14"].gapi)
{
    _global.dofus["\r\x14"].gapi = new Object();
} // end if
if (!dofus["\r\x14"].gapi.ui)
{
    _global.dofus["\r\x14"].gapi.ui = new Object();
} // end if
if (!dofus["\r\x14"].gapi.ui.gameresult)
{
    _global.dofus["\r\x14"].gapi.ui.gameresult = new Object();
} // end if
_global.dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerLight = function ()
{
    super();
};
_global.dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerLight.prototype = new ank.gapi.core["\x1e\n\f"]();
var _loc1 = dofus["\r\x14"].gapi.ui["\r\x1c"].GameResultPlayerLight.prototype;
_loc1.__set__list = function (_loc2_)
{
    this._mcList = _loc2_;
};
_loc1.GameResultPlayerLight = function ()
{
    super();
};
_loc1.setValue = function (_loc2_, _loc3_, _loc4_)
{
    this._oItems = _loc4_;
    if (_loc2_)
    {
        switch (_loc4_.type)
        {
            case "monster":
            case "taxcollector":
            case "player":
            {
                this._lblName.text = _loc4_.name;
                if (_global.isNaN(_loc4_.xp))
                {
                    this._pbXP._visible = false;
                }
                else
                {
                    this._pbXP._visible = true;
                    this._pbXP.minimum = _loc4_.minxp;
                    this._pbXP.maximum = _loc4_.maxxp;
                    this._pbXP.value = _loc4_.xp;
                } // end else if
                this._lblWinXP.text = !_global.isNaN(_loc4_.winxp) ? (new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.winxp).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"), 3)) : ("0");
                this._sGuildXP = !_global.isNaN(_loc4_.guildxp) ? (new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.guildxp).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"), 3)) : ("0");
                this._sMountXP = !_global.isNaN(_loc4_.mountxp) ? (new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.mountxp).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"), 3)) : ("0");
                this._lblKama.text = !_global.isNaN(_loc4_.kama) ? (new ank["\x1e\n\x07"]["\x0e\x1c"](_loc4_.kama).addMiddleChar(_global.API.lang.getConfigText("THOUSAND_SEPARATOR"), 3)) : ("0");
                this._lblLevel.text = _loc4_.level;
                this._mcDeadHead._visible = _loc4_.bDead;
                this.createEmptyMovieClip("_mcItems", 10);
                var _loc10 = false;
                var _loc4 = _loc4_.items.length;
                while (_loc4 = _loc4 - 1, _loc4 >= 0)
                {
                    var _loc6 = this._mcItemPlacer._x + 24 * _loc4;
                    if (_loc6 < this._mcItemPlacer._x + this._mcItemPlacer._width)
                    {
                        var _loc7 = _loc4_.items[_loc4];
                        var _loc3 = this._mcItems.attachMovie("Container", "_ctrItem" + _loc4, _loc4, {_x: _loc6, _y: this._mcItemPlacer._y + 1});
                        _loc3.setSize(18, 18);
                        _loc3.addEventListener("over", this);
                        _loc3.addEventListener("out", this);
                        _loc3.addEventListener("click", this);
                        _loc3.enabled = true;
                        _loc3.margin = 0;
                        _loc3.contentData = _loc7;
                        continue;
                    } // end if
                    _loc10 = true;
                } // end while
                this._ldrAllDrop._visible = _loc10;
            } 
        } // End of switch
    } // end if
};
_loc1.init = function ()
{
    super.init(false);
    this._mcItemPlacer._alpha = 0;
    this.addToQueue({object: this, method: this.addListeners});
};
_loc1.size = function ()
{
    super.size();
};
_loc1.addListeners = function ()
{
    var _loc3 = this;
    this._ldrAllDrop.addEventListener("over", this);
    this._ldrAllDrop.addEventListener("out", this);
    this._mcDetailsXP.onRollOver = function ()
    {
        this._parent.over({target: this});
    };
    this._mcDetailsXP.onRollOut = function ()
    {
        this._parent.out({target: this});
    };
};
_loc1.over = function (_loc2_)
{
    var api = _global.API;
    var target = _loc2_.target; // El elemento sobre el que está el ratón

    // --- Caso 1: El ratón está sobre los detalles de XP ---
    if (target == this._mcDetailsXP)
    {
        this.gapi.showTooltip(api.lang.getText("WORD_XP") + " " + api.lang.getText("XP_GUILD") + " : " + this._sGuildXP + "\n" + api.lang.getText("WORD_XP") + " " + api.lang.getText("XP_MOUNT") + " : " + this._sMountXP, this._lblWinXP, 22, {bXLimit: true, bYLimit: false});
        return;
    }

    // --- Caso 2: El ratón está sobre el botón "..." para ver todos los drops ---
    if (target == this._ldrAllDrop)
    {
        var allItemsText = "";
        var itemsList = this._oItems.items;
        for (var i = 0; i < itemsList.length; i = i + 1)
        {
            var item = itemsList[i];
            if (i > 0) {
                allItemsText += "\n";
            }
            allItemsText += item.Quantity + " x " + item.name;
        }
        if (allItemsText != "") {
            this.gapi.showTooltip(allItemsText, target, 30);
        }
        return;
    }
    // --- Caso 3 (el más importante): El ratón está sobre un ítem individual ---
    var itemData = target.contentData; // Obtenemos los datos del ítem específico
    if (itemData != undefined) 
    {
        // Creamos un tooltip solo para ese ítem
        var tooltipText = itemData.Quantity + " x " + itemData.name;
        this.gapi.showTooltip(tooltipText, target, 20);
    }
};
_loc1.out = function (_loc2_)
{
    this._mcList.gapi.hideTooltip();
};
_loc1.click = function (_loc2_)
{
    var _loc2 = _loc2_.target.contentData;
    if (Key.isDown(dofus.Constants.CHAT_INSERT_ITEM_KEY) && _loc2 != undefined)
    {
        this._mcList._parent.gapi.api.kernel.GameManager.insertItemInChat(_loc2);
    } // end if
};
_loc1.addProperty("list", function ()
{
}, _loc1.__set__list);
ASSetPropFlags(_loc1, null, 1);
_loc1._mcList = "";
_global.dofus["\r\x14"].gapi.ui.GameResultLight.CLASS_NAME = "GameResultLight";
#endinitclip