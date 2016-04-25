/* ----------------------------------------------------------------------------
Function: CBA_fnc_forceSetting

Description:
    Set a setting.

Parameters:
    _setting - Name of the setting <STRING>
    _source  - Can be "server", "mission" or "client" (optional, default: "current") <STRING>

Returns:
    None

Examples:
    (begin example)
        _result = ["CBA_TestSetting", 1] call CBA_fnc_setSetting
    (end)

Author:
    commy2
---------------------------------------------------------------------------- */
#include "script_component.hpp"

if (!isServer) exitWith {};

params [["_setting", "", [""]], ["_source", "current", [""]]];

if (_source == "client") exitWith {
    missionNamespace setVariable [format ["%1$PM", _setting], false, true];
    missionNamespace setVariable [format ["%1$PS", _setting], false, true];
};

if (_source == "server") exitWith {
    missionNamespace setVariable [format ["%1$PS", _setting], true, true];
};

if (_source == "mission") exitWith {
    missionNamespace setVariable [format ["%1$PM", _setting], true, true];
};

nil
