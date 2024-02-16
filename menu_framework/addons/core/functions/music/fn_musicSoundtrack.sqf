/*
	Currently deprecated, it just redirects the argument to a seperate function atm.
	Execution On: Client
	
	Purpose: Iterates through array and plays all songs in it one after the other, can pass a menu_soundtracks config entry

	Made by: Silence

    Arguments:
    _music	<ARRAY>
	
	Example:
	[["SONG1", "SONG2"], true] call menu_framework_fnc_musicSoundtrack;
*/

params ["_music"];

// redirect to new function, convert array to first element
[(_music select 0)] spawn menu_framework_fnc_playMusic;

/*
if (is3DEN) exitWith {};

if (typeName _music isEqualTo "STRING") then {
	_music = [(configFile >> "menu_soundtracks" >> _music), "soundtrack", []] call BIS_fnc_returnConfigEntry;
};

if (_music isEqualTo []) exitWith {hint "That music entry doesn't exist! Aborting script"};

diag_log format ["fn_musicSoundtrack: %1",_music];

if !( (missionNamespace getVariable ["menu_framework_currentMusic", []]) isEqualTo [] ) then {
	call menu_framework_fnc_musicClear;
}; // clear music EH's if not already done

private _arrayLen = count _music;

private _musicStart = [_arrayLen] spawn menu_framework_fnc_musicStart;

private _musicStop = [_music, _arrayLen] spawn menu_framework_fnc_musicStop;

missionNamespace setVariable ["menu_framework_currentMusic", [_musicStart, _musicStop], true];

[(_music select 0)] call menu_framework_fnc_playMusic; // start the loop

*/