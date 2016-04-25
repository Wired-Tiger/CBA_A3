#include "script_component.hpp"

disableSerialization;

// Get button
params ["_ctrl"];

// Get dialog
private _display = ctrlParent _ctrl;

private _ctrlGeneralGroup = _display displayCtrl 2300;
private _ctrlColorsGroup = _display displayCtrl 2301;
private _ctrlDifficultyGroup = _display displayCtrl 2301;
private _ctrlAddonsGroup = _display displayCtrl IDC_ADDONS_GROUP;
private _ctrlToggleButton = _display displayCtrl IDC_BTN_CONFIGURE_ADDONS;
private _ctrlFakeKeyboardButton = _display displayCtrl IDC_BTN_KEYBOARD_FAKE;

private _ctrlDifficultyButton = _display displayCtrl 304;
private _ctrlGeneralButton = _display displayCtrl 2402;
private _ctrlGUIButton = _display displayCtrl 2404;
private _ctrlLayoutButton = _display displayCtrl 2405;
private _ctrlTitle = _display displayCtrl 1000;

// Toggle displayed groups and buttons.
if !(ctrlEnabled _ctrlAddonsGroup) then {
    // Hide general group
    _ctrlGeneralGroup ctrlEnable false;
    _ctrlGeneralGroup ctrlShow false;

    // Hide colors group
    _ctrlColorsGroup ctrlEnable false;
    _ctrlColorsGroup ctrlShow false;

    // Hide difficulty group
    _ctrlDifficultyGroup ctrlEnable false;
    _ctrlDifficultyGroup ctrlShow false;

    // Hide Presets button
    private _control = _display displayCtrl 114;
    _control ctrlEnable false;
    _control ctrlShow false;

    // Hide Default button
    _control = _display displayCtrl 101;
    _control ctrlEnable false;
    _control ctrlShow false;

    // Hide difficulty, general, gui, and layout buttons
    _ctrlDifficultyButton ctrlEnable false;
    _ctrlDifficultyButton ctrlShow false;
    _ctrlGeneralButton ctrlEnable false;
    _ctrlGeneralButton ctrlShow false;
    _ctrlGUIButton ctrlEnable false;
    _ctrlGUIButton ctrlShow false;
    _ctrlLayoutButton ctrlEnable false;
    _ctrlLayoutButton ctrlShow false;

    // Show fake keyboard button
    _ctrlFakeKeyboardButton ctrlEnable true;
    _ctrlFakeKeyboardButton ctrlShow true;

    // Show Addons group
    _ctrlAddonsGroup ctrlEnable true;
    _ctrlAddonsGroup ctrlShow true;

    // Change button text
    _ctrlToggleButton ctrlSetText localize LSTRING(configureBase);
} else {
    // Switch back to vanilla keyboard config.
    // Hide Addons group
    _ctrlAddonsGroup ctrlEnable false;
    _ctrlAddonsGroup ctrlShow false;
    _ctrlToggleButton ctrlSetText localize LSTRING(configureAddons);

    //--- Enable General
    _ctrlGeneralGroup ctrlEnable true;
    _ctrlGeneralGroup ctrlShow true;

    //--- Disable Colors
    _ctrlColorsGroup ctrlEnable false;
    _ctrlColorsGroup ctrlShow false;

    //--- Disable Difficulty
    _ctrlDifficultyGroup ctrlEnable false;
    _ctrlDifficultyGroup ctrlShow false;

    // Hide fake keyboard button
    _ctrlFakeKeyboardButton ctrlEnable false;
    _ctrlFakeKeyboardButton ctrlShow false;

    // Terminate any waiting input actions
    GVAR(waitingForInput) = false;
    GVAR(input) = [];

    // Show difficulty, general, gui, and layout buttons
    _ctrlDifficultyButton ctrlEnable true;
    _ctrlDifficultyButton ctrlShow true;
    _ctrlGeneralButton ctrlEnable true;
    _ctrlGeneralButton ctrlShow true;
    _ctrlGUIButton ctrlEnable true;
    _ctrlGUIButton ctrlShow true;
    _ctrlLayoutButton ctrlEnable true;
    _ctrlLayoutButton ctrlShow true;

    //--- Show Presets button
    private _control = _display displayCtrl 114;
    _control ctrlEnable true;
    _control ctrlShow true;

    //--- Hide Default button
    _control = _display displayCtrl 101;
    _control ctrlEnable false;
    _control ctrlShow false;
};
