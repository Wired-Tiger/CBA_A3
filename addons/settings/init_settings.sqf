
{
    private _setting = configName _x;

    private _value = _setting call CBA_fnc_getSetting;
    private _defaultValue = [_setting, "default"] call CBA_fnc_getSetting;

    // set value if not defined in profile or the type changed
    if (isNil "_value" || {!(_value isEqualType _defaultValue)}) then {
        [_setting, _defaultValue] call CBA_fnc_setSetting;
    };
} forEach ("true" configClasses (configFile >> "CBA_Settings"));
