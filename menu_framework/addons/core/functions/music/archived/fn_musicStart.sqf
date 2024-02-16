/*
	Execution On: Client
	
	Purpose:

	Made by: Silence

    Arguments:
    _arrayLen	<INTEGER>
	
	Example:
	Just use musicSoundtrack
*/

params ["_arrayLen"];

private _musicStart = addMusicEventHandler ["MusicStart", { 
    private _index = missionNamespace getVariable ["menu_framework_musicIndex", 0];

    missionNamespace setVariable ["menu_framework_musicIndex", (_index + 1)];
}];

_musicStart