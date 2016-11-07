/*
	fn_dev.sqf
	Stirgoy
*/

_log = param [0,"",[""]];
_modo = param [1,"chat",[""]];

_isDev = getNumber ( configFile / "exTracTr" / "devLog" );
if ( _isDev == 0 || ( _log == "" ) ) exitWith {};

switch (_modo) do
{
	case "rpt": { diag_log _log; };
	case "chat": { systemChat _log; };
	case "bis": { _log call BIS_fnc_log; };
};
