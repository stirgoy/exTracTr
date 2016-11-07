/*

	fn_filtrarLista_veh.sqf
	Stirgoy
	filtra la lista de vehiculos segun las propiedades establecidas
*/

if (exT_trabajando) exitWith {};
exT_trabajando = !exT_trabajando;

_display = findDisplay 461530;
_lstEncontrado = _display displayCtrl 1500;

_varr = missionNamespace getVariable "exT_vehArray";
_vcarr = missionNamespace getVariable "exT_vClassArray";

lbClear _lstEncontrado;
_filtrado0 = [];
_filtrado1 = [];
_filtradoF = [];


{	//Vclass && lista cliente
	_VC = [_x] call exT_fnc_getVClass;
	_VC = toLower _VC;
	_pasaVC = if (_VC in exT_vehBL) then {false} else {true};

	if ( _pasaVC && !(_x in exT_vehExportLista) ) then { _filtrado0 pushBack _x; };
} forEach _varr;


{	//A3
	_esBug = [_x] call exT_fnc_isBIS;
	if (exT_addA3 && _esBug) then { _filtrado1 pushBack _x;};
	if (!_esBug) then {_filtrado1 pushBack _x;};

} forEach _filtrado0;


{
	_bando = getNumber ( configFile / "CfgVehicles" / _x / "side" );
	if ( exT_filtroSide ) then
	{
		if ( _bando in [0,1,2,3] ) then {_filtradoF pushBack _x;};
	}
	else
	{
		_filtradoF pushBack _x;
	};
} forEach _filtrado1;

/*
//Debug
[((format["Encontrados: %1",(count _varr)]))] call exT_fnc_dev;
[((format["Filtro VClass: %1",(count _filtrado0)]))] call exT_fnc_dev;
[((format["Filtro A3: %1",(count _filtrado1)]))] call exT_fnc_dev;
[((format["Filtro bando: %1",(count _filtradoF)]))] call exT_fnc_dev;
*/

{	//lista
	_add = [_x] call exT_fnc_getDisplayName;
	_lstEncontrado lbAdd _add;
	_lstEncontrado lbSetData [_forEachIndex,_x];
} forEach _filtradoF;

_lstEncontrado lbSetCurSel 0;

exT_trabajando = !exT_trabajando;