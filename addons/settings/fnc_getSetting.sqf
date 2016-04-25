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
    if (missionNamespace getVariable format ["%1$PM", _setting]) exitWith { _source = "mission" };
    if (missionNamespace getVariable format ["%1$PS", _setting]) exitWith { _source = "server" };
    _source = "client";
};

if (_source == "client") exitWith {
    profileNamespace getVariable _setting
};

if (_source == "server") exitWith {
    missionNamespace getVariable format ["%1$S", _setting]
};

if (_source == "mission") exitWith {
    missionNamespace getVariable format ["%1$M", _setting]
};

if (_source == "default") exitWith {
    getNumber (configFile >> "CBA_Settings" >> _setting >> "value")
};

nil
