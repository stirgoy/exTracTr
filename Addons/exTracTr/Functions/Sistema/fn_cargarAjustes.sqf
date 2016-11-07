/*
	fn_cargarAjustes.sqf
	Stirgoy
*/


_versionMod = getNumber ( configFile / "exTracTr" / "versionMod" );
_versionClient = profileNamespace getVariable "exTracTr_version_client";

if ( isNil "_versionClient" ) exitWith { [] call exT_fnc_defaultAjustes; };
if ( _versionClient < _versionMod ) exitWith { [] call exT_fnc_actualizarjustes; };

ext_key_menu = profileNamespace getVariable "exTracT_ajustes_key_menu";
ext_key_menu_ctrl = profileNamespace getVariable "exTracT_ajustes_key_menu_ctrl";
ext_key_menu_shift = profileNamespace getVariable "exTracT_ajustes_key_menu_shift";
ext_key_menu_alt = profileNamespace getVariable "exTracT_ajustes_key_menu_alt";
exT_filtroSide = profileNamespace getVariable "exTracT_ajustes_filtroSide";
