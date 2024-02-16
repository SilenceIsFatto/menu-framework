/*
	Execution On: Client
	
	Purpose:

	Made by: Silence

    Arguments:
    _music	<ARRAY>
	
	Example:
	Just use musicSoundtrack
*/

params ["_music"];

missionNamespace setVariable ["menu_framework_Music", _music, true];
missionNamespace setVariable ["menu_framework_Music_Length", true];

// I am aware you can pass vars into event handlers... I am also lazy and this runs in SP only.

private _musicStop = addMusicEventHandler ["MusicStop", {
    private _index = missionNamespace getVariable ["menu_framework_musicIndex", 0];
    private _music = missionNamespace getVariable ["menu_framework_Music", ""];

    private _arrayLen = count _music;

    if (_index isEqualTo _arrayLen) exitWith {
        call menu_framework_fnc_musicClear;
    };

    // diag_log (_music select _index);
    // diag_log _index;

    // diag_log format ["fn_musicSoundtrack: %1, %2, %3",(_music select _index), _music, _index];

    [(_music select _index)] call menu_framework_fnc_playMusic;
}];

_musicStop