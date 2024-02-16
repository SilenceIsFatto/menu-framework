#include "script_component.hpp"

class CfgPatches 
{
	class ADDON 
	{
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"CBA_Main"};
		author = "Silence";
		url = "";
		VERSION_CONFIG;
	};
};

class CfgMissions
{
	class Cutscenes
	{
		class MOD(scene)
		{
			directory = "z\menu_framework\addons\scene\scenes\menu_overwrite.Stratis";
		};
	};
};

class Extended_PreInit_EventHandlers
{
    class MOD(settings)
    {
        init = "call compile preprocessFileLineNumbers 'z\menu_framework\addons\scene\XEH_preInit.sqf'";
    };
};