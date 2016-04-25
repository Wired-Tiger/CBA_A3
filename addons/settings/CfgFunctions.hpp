
#define F_FILEPATH(func) class func {\
    file = QUOTE(PATHTOF(DOUBLES(fnc,func).sqf));\
}

class CfgFunctions {
    class CBA {
        class Settings {
            F_FILEPATH(setSetting);
            F_FILEPATH(getSetting);
            F_FILEPATH(forceSetting);
        };
    };
};
