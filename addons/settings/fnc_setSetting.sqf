/* ----------------------------------------------------------------------------
Function: CBA_fnc_setSetting

Description:
    Set a setting.

Parameters:
    _setting - Name of the setting <STRING>
    _value   - Value of the setting <ANY>

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

params [["_setting", "", [""]], "_value"];

if (isNil "_value") then {
    _value = [_setting, "default"] call CBA_fnc_getSetting;
};

if (isServer) then {
    missionNamespace setVariable [[_setting, "S"] joinString "$", _value, true];

    // if the setting is forced, send changed event to remote machines
    if (missionNamespace getVariable [[_setting, "PS"] joinString "$", false]) then {
        ["CBA_SettingChaged", [_setting, _value]] call CBA_fnc_remoteEvent;
    };
};

profileNamespace setVariable [_setting, _value];
["CBA_SettingChaged", [_setting, _value]] call CBA_fnc_localEvent;

nil
