// diag_log "Running Main Menu Init";

enableEnvironment false;
showCinemaBorder false;

player setVariable ["menu_framework_canPlay", true]; // allow changing settings
player setVariable ["menu_framework_canVideo", true]; // allow video to play
player setVariable ["menu_framework_videoDelayed", false]; // allow video with delay to auto play on startup
player setVariable ["menu_framework_firstTime", true]; // makes startup video with delay play correctly for the first time

private _audio = profileNamespace getVariable ["menu_framework_Audio", "menu_framework_intro_1"];

setViewDistance 500;
setTerrainGrid 50;

while {player getVariable ["menu_framework_canVideo", false] && {profileNamespace getVariable ["menu_framework_Video", "intro_overlord"] isNotEqualTo "Menu_None"}} do
{
    player setVariable ["menu_framework_canVideo", false];
    titleCut ["", "BLACK FADED", 99999];

    private _background = profileNamespace getVariable ["menu_framework_Video", "intro_overlord"];

    private _videoPath = [(configFile >> "menu_framework_videos" >> _background), "path", false] call BIS_fnc_returnConfigEntry;
    private _delay = [(configFile >> "menu_framework_videos" >> _background), "delay", -1] call BIS_fnc_returnConfigEntry;

    if (_videoPath isEqualTo false && {_background isNotEqualTo ""}) then {hint "Erm... the video path doesn't exist!"};

    private _video = [_videoPath, [safeZoneX, safeZoneY, safeZoneW, safeZoneH], [1,1,1,1], "", [0,0,0,1], false] spawn BIS_fnc_playVideo;

	waitUntil {scriptDone _video};
    // titleCut ["", "BLACK FADED", 99999];

    if (_delay isNotEqualTo -1 && {player getVariable ["menu_framework_firstTime", false] isNotEqualTo true}) then {
        player setVariable ["menu_framework_videoDelayed", true];
        // diag_log "Delayed Video Playing";
        private _future = time + _delay;
        waitUntil {time >= _future || {player getVariable ["menu_framework_videoDelayed", false] isEqualTo false}}; // wait until the delay has ended OR the video has been reset
        // diag_log "Delay Ended Early";
    };

    player setVariable ["menu_framework_canVideo", true];
    player setVariable ["menu_framework_videoDelayed", false];

    player setVariable ["menu_framework_videoPlayingAudio", false];
    player setVariable ["menu_framework_firstTime", false];
};

[[_audio], false] call menu_framework_fnc_musicSoundtrack;

// addMusicEventHandler ["MusicStop", 
// {
//     [] spawn
//     {
//         uiSleep 5; 
//         private _audio = profileNamespace getVariable ["menu_framework_Audio", "SONG1"];
//         [[_audio]] call menu_framework_fnc_musicSoundtrack;
//         // refresh var incase it changed
//     };
// }];