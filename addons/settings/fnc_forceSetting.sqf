/* ----------------------------------------------------------------------------
Function: CBA_fnc_forceSetting

Description:
    Set a setting.

Parameters:
    _setting - Name of the setting <STRING>
    _source  - Can be "server", "mission" or "client" (optional, default: "client") <STRING>

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

params [["_setting", "", [""]], ["_source", "client", [""]]];

if (_source == "client") then {
    missionNamespace setVariable [[_setting, "PM"] joinString "$", false, true];
    missionNamespace setVariable [[_setting, "PS"] joinString "$", false, true];
};

if (_source == "server") then {
    missionNamespace setVariable [[_setting, "PS"] joinString "$", true, true];
};

if (_source == "mission") then {
    missionNamespace setVariable [[_setting, "PM"] joinString "$", true, true];
};

// send changed event, because the current active setting could have changed
private _value = _setting call CBA_fnc_getSetting;
["CBA_SettingChaged", [_setting, if (isNil "_value") then { nil } else { _value }]] call CBA_fnc_globalEvent;

nil
