#include "script_component.hpp"

// ADDON = true;

#define SETTING_HEADER QUOTE(Main Menu Framework)

private _videos = (configfile >> "menu_framework_videos") call BIS_fnc_getCfgSubClasses;
private _songs = (configfile >> "menu_framework_videos" >> "songs") call BIS_fnc_getCfgSubClasses;

private _cfgNameArray = [];
private _pathArray = [];
private _nameArray = [];

{
    if (_x isEqualTo "songs") then {} else 
    {
        private _cfgName = _x;
        private _path = getText (configFile >> "menu_framework_videos" >> _x >> "path");
        private _name = getText (configFile >> "menu_framework_videos" >> _x >> "name");
        
        _cfgNameArray pushBack _cfgName;
        _pathArray pushBack _path;
        _nameArray pushBack _name;
    };
} forEach _videos; // grab each video entry + data for _x

private _songCfgNameArray = [];
private _songNameArray = [];

{
    private _name = getText (configFile >> "menu_framework_videos" >> "songs" >> _x >> "name");
    private _song = getText (configFile >> "menu_framework_videos" >> "songs" >> _x >> "song");
    
    _songCfgNameArray pushBack _song;
    _songNameArray pushBack _name;
} forEach _songs; // grab each song entry

[
    "menu_framework_Video", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Background Video", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [_cfgNameArray, _nameArray, 0], // [default value], [name for default value], index for default value
    false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        private _song = [(configFile >> "menu_framework_videos" >> _value), "song", "NOTSET"] call BIS_fnc_returnConfigEntry;

        // diag_log _song;

        if (_song isEqualTo "NONE") then {
            if !([player] call menu_framework_fnc_isInMenu) exitWith {};
            [["Menu_None"]] call menu_framework_fnc_musicSoundtrack;
        }; // this ensures that if you swap background and it has a song restriction, the current song stops

        if (_song isNotEqualTo "NONE") then {
            if !([player] call menu_framework_fnc_isInMenu) exitWith {};
            if (_song isEqualTo "NOTSET") then {_song = profileNamespace getVariable ["menu_framework_Audio", "menu_intro_1"]};
            [[_song]] call menu_framework_fnc_musicSoundtrack;
        }; // this ensures that if you swap background and it has no restriction, song continues as normal

        profileNamespace setVariable ["menu_framework_Video", _value];

        if !([player] call menu_framework_fnc_isInMenu) exitWith {};

        player setVariable ["menu_framework_videoDelayed", false];
        player setVariable ["menu_framework_firstTime", true];
        // diag_log "Delayed Video Running, Video Changed";

        [""] spawn BIS_fnc_playVideo;
    }
] call CBA_fnc_addSetting;

[
    "menu_frameworks_Audio", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Background Audio", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    SETTING_HEADER, // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [_songCfgNameArray, _songNameArray, 0], // [default value], [name for default value], index for default value
    false, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];

        private _background = profileNamespace getVariable ["menu_framework_Video", "intro_overlord"];
        private _song = [(configFile >> "menu_framework_videos" >> _background), "song", "NOTSET"] call BIS_fnc_returnConfigEntry;

        if (_song isEqualTo "NONE") exitWith {
            if !([player] call menu_framework_fnc_isInMenu) exitWith {};
            [["Menu_None"]] call menu_framework_fnc_musicSoundtrack;
            profileNamespace setVariable ["menu_framework_Audio", _value];
        }; // can't be bothered commenting this, code doesn't lie but I do
        
        if (_song isNotEqualTo "NOTSET") exitWith { // if current background uses custom audio, exit early
            profileNamespace setVariable ["menu_framework_Audio", _value]; // set the audio so it gets grabbed correctly when background changes
            false
        };
        
        profileNamespace setVariable ["menu_framework_Audio", _value];

        if !([player] call menu_framework_fnc_isInMenu) exitWith {};

        [[_value]] call menu_framework_fnc_musicSoundtrack;
    }
] call CBA_fnc_addSetting;