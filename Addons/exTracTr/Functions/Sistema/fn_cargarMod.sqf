/*
	fn_cargarMod.sqf
	Stirgoy
*/

if ( isDedicated ) exitWith {};						//Server
if ( isMultiplayer ) exitWith {};					//MP
if ( !hasInterface && !isDedicated ) exitWith {};	//HC

_tmr = time;
[(format ["Cliente offline...  (%1)",_tmr]),"rpt"] call exT_fnc_Dev;
waitUntil { (!(isNull player) && (player == player))};
_tmr = time;
[(format ["Esperando display 46...  (%1)",_tmr]),"rpt"] call exT_fnc_Dev;
waitUntil { !(isNull findDisplay 46)};
_tmr = time;
[(format ["Cargando Variables y eventos...  (%1)",_tmr]),"rpt"] call exT_fnc_Dev;
//Variables
call compile PreprocessFileLineNumbers "exTracTr\Functions\config.sqf";

//eventos
exT_KeyHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call exT_fnc_keyHandler"];

_tmr = time;
[(format ["Compilando funciones...  (%1)",_tmr]),"rpt"] call exT_fnc_Dev;

//Ajustes
_tmr = time;
[(format ["Cargando ajustes...  (%1)",_tmr]),"rpt"] call exT_fnc_Dev;
_handle = [] spawn exT_fnc_cargarAjustes;
waitUntil {scriptDone _handle};

//Falta intro
_initT = format ["exTracTr cargado. pulsa %1 para abrir el menú.", ext_key_menu];
systemChat _initT;

_tmr = time;
[(format ["exTraxTr Cargado (%1)",_tmr]),"rpt"] call exT_fnc_Dev;
