/*
	fn_abrir_veh.sqf
	Stirgoy
	Abre el menú de vehiculos
*/

disableSerialization;



//pedimos config
[] spawn exT_fnc_recuperarVehiculos;
sleep .02;
waitUntil {!exT_trabajando};
_varr = missionNamespace getVariable "exT_vehArray";
_vcarr = missionNamespace getVariable "exT_vClassArray";

//ESCAPE & open
createDialog "exT_GUI_vehiculos";
waitUntil {!isNull findDisplay 461530};
_display = findDisplay 461530;
exT_evh_keyESC = _display displayAddEventHandler ["KeyDown", "_keyPr = _this select 1; if ( _keyPr == 1 && exT_trabajando) then { true;} else {false;};"];


//ctrl
_combo = _display displayCtrl 2100;
_lstEncontrado = _display displayCtrl 1500;
_lstCliente = _display displayCtrl 1501;
_lstVCEncontrado = _display displayCtrl 1502;
_chk = _display displayCtrl 2800;
_chks = _display displayCtrl 2801;


//limpiamos
lbClear _combo;
lbClear _lstEncontrado;
lbClear _lstVCEncontrado;
lbClear _lstCliente;

//combo
_combo lbAdd "Todos";
_combo lbSetData [0,""];

{
	_combo lbAdd _x;
	_combo lbSetData [(_forEachIndex + 1),_x];
} forEach ["air","car","ship","static"];


//veh
{
	_add = [_x] call exT_fnc_getDisplayName;
	_lstEncontrado lbAdd _add;
	_lstEncontrado lbSetData [_forEachIndex,_x];
	_lstEncontrado lbSetTooltip [_forEachIndex,_x];

} forEach _varr;


//vclass
{
	_lstVCEncontrado lbAdd _x;
	_lstVCEncontrado lbSetData [_forEachIndex,_x];

} forEach _vcarr;

//lista cliente
if (count exT_vehExportLista > 0) then
{
	{
		_lstCliente lbAdd _x;
		_lstCliente lbSetData [_forEachIndex,_x];
		_lstCliente lbSetTooltip [_forEachIndex,_x];

	} forEach exT_vehExportLista;
};

//chk
_chk cbSetChecked exT_addA3;
_chks cbSetChecked exT_filtroSide;

_combo lbSetCurSel 0;
_lstEncontrado lbSetCurSel 0;


cutRsc ["exT", "BLACK IN"];
