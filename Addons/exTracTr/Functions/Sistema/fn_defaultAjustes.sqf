/*
	fn_defaultAjustes.sqf
	Stirgoy
*/

_ver = getNumber ( configFile / "exTracTr" / "versionMod" );

profileNamespace setVariable ["exTracT_ajustes_key_menu","º"];
profileNamespace setVariable ["exTracT_ajustes_key_menu_ctrl",false];
profileNamespace setVariable ["exTracT_ajustes_key_menu_shift",false];
profileNamespace setVariable ["exTracT_ajustes_key_menu_alt",false];
profileNamespace setVariable ["exTracTr_version_client",_ver];
profileNamespace setVariable ["exTracT_ajustes_filtroSide",false];

saveProfileNamespace;

_tmr = time;
[(format ["Ajustes por defecto...  (%1)",_tmr]),"rpt"] call exT_fnc_Dev;
