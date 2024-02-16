/*
	Execution On: Global
	
	Purpose: Clears all music event handlers

	Made by: Silence

    Arguments:
    NONE
	
	Example:
	call menu_framework_fnc_musicClear;
*/

private _handlers = missionNamespace getVariable ["menu_framework_currentMusic", []];

if (_handlers isEqualTo []) exitWith {nil};

removeAllMusicEventHandlers "MusicStart";
removeAllMusicEventHandlers "MusicStop";

missionNamespace setVariable ["menu_framework_currentMusic", [], true];
missionNamespace setVariable ["menu_framework_musicIndex", 0, true];