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
    };
    // class intro_m05_vin : vr_boot
    // {
    //     path = "a3\missions_f_exp\video\exp_m05_vin.ogv";
    //     name = "Apex Intro";
    // };
    // class exp_m02_vin : vr_boot
    // {
    //     path = "a3\missions_f_exp\video\exp_m02_vin.ogv";
    //     name = "Apex Briefing";
    // };

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