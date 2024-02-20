    /*
        the "path" value expects a string pointing to an .ogv video file.

        the "name" value is what gets used in the cba settings.

        the "song" value expects a string pointing to a CfgMusic entry, though can also be set to "NONE" to not play any music at all.
        > If no value is set, no song is forced and cba settings are used.

        the "delay" value expects an integer. This will be the delay (in seconds) before a video starts playing again after completion.
        > If no value is set, it will automatically loop when the video finishes.
    */

    class vr_boot
    {
        path = "a3\missions_f_bootcamp\video\vr_boot.ogv";
        name = "VR Intro";
        song = "NONE"; // this has audio of its own
        delay = 99999; // we only want this to play once (well, realistically play once... 99999 seemed fitting.)
    };
    class a_in_intro : vr_boot
    {
        path = "a3\missions_f_epa\video\a_in_intro.ogv";
        name = "Arma Intro";
        // inherits both delay and song values from vr_boot
    };

    class intro_android
    {
        path = QPATHTOFOLDER(videos\intro_android.ogv);
        name = "Vanguard Capture";
    };
    class intro_winter
    {
        path = QPATHTOFOLDER(videos\intro_winter.ogv);
        name = "Winter Soldier";
    };
    class intro_nebula
    {
        path = QPATHTOFOLDER(videos\intro_nebula.ogv);
        name = "Nebula";
    };
    class intro_police
    {
        path = QPATHTOFOLDER(videos\intro_police.ogv);
        name = "SCO-19 Night Call (Rain)";
        song = "menu_framework_rain_light";
    };

    class Menu_None
    {
        path = ""
        name = "None";
    };