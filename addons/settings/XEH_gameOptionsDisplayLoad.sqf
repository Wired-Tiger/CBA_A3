// Extra initialization steps for the vanilla RscDisplayConfigure dialog
// needed to support mod settings system.
#include "script_component.hpp"

params ["_display"];

// Hide addons group on display init.
private _addonsGroup = _display displayctrl IDC_ADDONS_GROUP;
_addonsGroup ctrlShow false;
_addonsGroup ctrlEnable false;

if (!isNil {is3DEN} && {is3DEN}) exitWith { // bwc for linux build
    // if in eden editor, postInit will not run, so there won't be any valid keybinds to modify
    private _lb = _display displayCtrl 202;
    _lb lnbAddRow [localize LSTRING(canNotEdit)];
};



/*
if (isNil "cba_fnc_registerKeybind") then {
    // XEH PreInit has not run yet, so we need to prepare this function right now.
    FUNC(onButtonClick_configure) = compile preprocessFileLineNumbers "\x\cba\addons\keybinding\gui\fnc_onButtonClick_configure.sqf";
    FUNC(onButtonClick_cancel) = {};

    private _lb = _display displayCtrl 202;
    _lb lnbAddRow [localize LSTRING(canNotEdit)];
} else {
    [true] call FUNC(updateGUI); // true means first-run

    // Do this here to avoid automatic uppercasing by BI RscDisplayConfigure.sqf onLoad.
    private _text = _display displayCtrl 206;
    _text ctrlSetText "Double click any action to change its binding";

    // Add handler to prevent key passthrough when waiting for input for binding (to block Esc).
    _display displayAddEventHandler ["KeyDown", "_this call cba_keybinding_fnc_onKeyDown"];
    _display displayAddEventHandler ["KeyUp", "_this call cba_keybinding_fnc_onKeyUp"];
};
*/
