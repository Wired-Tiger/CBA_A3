/* ----------------------------------------------------------------------------
Function: CBA_fnc_getSetting

Description:
    Returns a setting.

Parameters:
    _setting - Name of the setting <STRING>
    _source  - Can be "current", "server", "mission", "client" or "default" (optional, default: "current") <STRING>

Returns:
    Value of the setting <ANY>

Examples:
    (begin example)
        _result = "CBA_TestSetting" call CBA_fnc_getSetting
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params [["_setting", "", [""]], ["_source", "current", [""]]];

// change source to whatever should take precedence
if (_source == "current") then {
    if (missionNamespace getVariable ([_setting, "PM"] joinString "$")) exitWith { _source = "mission" };
    if (missionNamespace getVariable ([_setting, "PS"] joinString "$")) exitWith { _source = "server" };
    _source = "client";
};

if (_source == "client") exitWith {
    profileNamespace getVariable _setting
};

if (_source == "server") exitWith {
    missionNamespace getVariable ([_setting, "S"] joinString "$")
};

if (_source == "mission") exitWith {
    missionNamespace getVariable ([_setting, "M"] joinString "$")
};

if (_source == "default") exitWith {
    private _config = configFile >> "CBA_Settings" >> _setting;

    private _type = getText (_config >> "type");
    if (_type == "NUMBER") then { _type = typeName 0 }; // game uses "SCALAR"

    if (_type == typeName "") exitWith { getText (_config >> "value") };
    if (_type == typeName 0) exitWith { getNumber (_config >> "value") };
    if (_type == typeName true) exitWith { getNumber (_config >> "value") == 1 };
};

nil
