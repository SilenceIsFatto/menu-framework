/*
	Execution On: Client
	
	Purpose: Plays music string and loops recursively

	Made by: Silence

    Arguments:
    _music   <STRING>
    _start   <INTEGER> <DEFAULT: 0>
	
	Example:
	["SONG1"] call menu_framework_fnc_playMusic;
*/

params ["_music", ["_start", 0]];

if (is3DEN) exitWith {};

if (_music isEqualTo "Menu_None") exitWith {playMusic ""};

private _background = profileNamespace getVariable ["menu_framework_Video", "intro_overlord"];
private _audio = profileNamespace getVariable ["menu_framework_Audio", "menu_framework_Intro"];
private _song = [(configFile >> "menu_framework_videos" >> _background), "song", "NOTSET"] call BIS_fnc_returnConfigEntry;

if (_song isEqualTo "NOTSET" && {_music isNotEqualTo _audio}) exitWith {}; // exit the loop if current music is not the same as the one selected
if (_song isNotEqualTo "NOTSET" && {_music isNotEqualTo _song}) exitWith {}; // exit the loop if the current music is not the same one as forced by background

playMusic "";

private _duration = [(configFile >> "CfgMusic" >> _music), "duration", -1] call BIS_fnc_returnConfigEntry;

if (_duration isEqualTo -1) exitWith {diag_log format["%1 has no duration value in its config. Please fix!", _music]};

playMusic [_music, _start];

uiSleep _duration;

[_music, _start] call menu_framework_fnc_playMusic;