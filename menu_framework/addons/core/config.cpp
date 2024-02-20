#include "script_component.hpp"

class CfgPatches 
{
	class ADDON
	{
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "A3_Map_Data",
            "A3_Map_Stratis",
            "A3_Ui_F",
            "A3_Map_Altis",
            "A3_Map_VR",
            "A3_Data_F_Exp",
            "A3_Map_Malden",
            "A3_Sounds_F_Enoch",
            "menu_framework_scene"
		};
		author = "Silence";
		authorUrl = "";
		VERSION_CONFIG;
	};
};

class CfgMusic
{
	class MOD(rain_light)
	{
		duration = 104.359;
		musicClass = "calm";
		name = "";
		sound[] = {QPATHTOFOLDER(sounds\rain_light.ogg),1,1};
		tags[] = {"bis"};
		theme = "safe";
		type = "ambient";
	};
	class MOD(wind_REALLYshort)
	{
		duration = 5.265;
		musicClass = "calm";
		name = "";
		sound[] = {QPATHTOFOLDER(sounds\wind_REALLYshort.ogg),5,1};
		tags[] = {"bis"};
		theme = "safe";
		type = "ambient";
	};
	// debug sound ^
	class MOD(wind_long)
	{
		duration = 291.135;
		musicClass = "calm";
		name = "";
		sound[] = {QPATHTOFOLDER(sounds\wind_long.ogg),1,1};
		tags[] = {"bis"};
		theme = "safe";
		type = "ambient";
	};
};

class CfgWorlds
{
	class CAWorld;

	class VR : CAWorld
	{
		cutscenes[] = { "menu_framework_scene" };
	};

	class Altis : CAWorld
	{
		cutscenes[] = { "menu_framework_scene" };
	};

	class Tanoa : CAWorld
	{
		cutscenes[] = { "menu_framework_scene" };
	};

	class Malden : CAWorld
	{
		cutscenes[] = { "menu_framework_scene" };
	};

	class Stratis : CAWorld
	{
		cutscenes[] = { "menu_framework_scene" };
	};

	class Enoch : CAWorld
	{
		cutscenes[] = { "menu_framework_scene" };
	};

	initWorld = "VR";
	demoWorld = "VR";
};

class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay 
{
	enableDisplay = 0;
	delete Spotlight;
	class controls 
	{
		delete Spotlight1;
		delete Spotlight2;
		delete Spotlight3;
		delete BackgroundSpotlightRight;
		delete BackgroundSpotlightLeft;
		delete BackgroundSpotlight;
		delete SpotlightNext;
		delete SpotlightPrev;
		class Logo
		{
			access = 0;
			color[] = {0.9,0.9,0.9,1};
			colorActive[] = {1,1,1,1};
			colorDisabled[] = {1,1,1,0.25};
			default = 0;
			deletable = 0;
			fade = 0;
			font = "RobotoCondensed";
			h = "1 * 	5 * 	(pixelH * pixelGrid * 2)";
			idc = -1;
			onButtonClick = "if (scriptdone (missionnamespace getvariable ['RscDisplayMain_credits',scriptnull])) then {RscDisplayMain_credits = _this spawn (uinamespace getvariable 'bis_fnc_credits');};";
			onKillFocus = "(_this select 0) ctrlsettextcolor [0.9,0.9,0.9,1];";
			onLoad = "(_this select 0) ctrlshow !(395180 in getDLCs 1)";
			onSetFocus = "(_this select 0) ctrlsettextcolor [1,1,1,1];";
			shadow = 0;
			sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			soundClick[] = {"",0.1,1};
			soundEnter[] = {"",0.1,1};
			soundEscape[] = {"",0.1,1};
			soundPush[] = {"",0.1,1};
			style = 48;
			text = SPOTLIGHTLOGO;
			tooltip = "View game credits, see the names behind Arma 3.";
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			tooltipColorText[] = {1,1,1,1};
			type = 11;
			url = "";
			w = "2 * 	5 * 	(pixelW * pixelGrid * 2)";
			x = "0.5 - 	5 * 	(pixelW * pixelGrid * 2)";
			y = "safezoneY + (3 - 0.5 * 	5) * 	(pixelH * pixelGrid * 2)";
		};
	};
	class ControlsBackground
	{
		delete MouseArea;
	};
}; // disable 3 buttons in middle

class MOD(videos)
{
	class songs
	{
		#include "configs\cfgMenuSongs.hpp"
	};
	#include "configs\cfgMenuVideos.hpp"
};

#include "CfgFunctions.hpp"