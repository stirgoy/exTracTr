/*
	fn_sText_veh.sqf
	Stirgoy
	Actualiza el texto estructurado de la lista de vehicuos encontrados
*/


disableserialization;
_display = findDisplay 461530;

_lst = _display displayCtrl 1500;
_sText = _display displayCtrl 1100;
_pictC = _display displayCtrl 1200;

_indice = lbCurSel _lst;
_data = _lst lbData _indice;

/* nombre, vclass, bando, capacidad, maxVel */

_dname = [_data] call exT_fnc_getDisplayName;
_vclass = [_data] call exT_fnc_getVClass;
_bando = getNumber ( configFile / "CfgVehicles" / _data / "side" );
_maxSol = getNumber ( configFile / "CfgVehicles" / _data / "transportSoldier" );
_suma = count ( configFile / "CfgVehicles" / _data / "Turrets" );
_mVel = getNumber ( configFile / "CfgVehicles" / _data / "maxSpeed" );
_cv = getNumber ( configFile / "CfgVehicles" / _data / "enginePower" );

_maxSol = (_maxSol + _suma) + 1;	//+ 1 es el conductor

switch (_bando) do
{
	case 0: { _bando = "Opfor"; };
	case 1: { _bando = "Blufor"; };
	case 2: { _bando = "Independiente"; };
	case 3: { _bando = "Civil"; };
	case 4: { _bando = "Neutral"; };
	case 5: { _bando = "Enemigo"; };
	case 6: { _bando = "Aliado"; };
	case 7: { _bando = "Logica del juego"; };
	default { _bando = "Desconocido"; };
};

_dname = format ["¬%1", _dname];
_tit = [_dname,5,8,1,0,1,2] call TTST;
_sep = ["¬",0,8,0.8,0,0,0] call TTST;

_vclass =[_vclass,"verde"] call exT_fnc_colorST;
_bando =[_bando,"verde"] call exT_fnc_colorST;
_maxSol =[_maxSol,"verde"] call exT_fnc_colorST;
_mVel =[_mVel,"verde"] call exT_fnc_colorST;
_cv =[_cv,"verde"] call exT_fnc_colorST;

_p0 = ["¬VClass: ","blanco"] call exT_fnc_colorST;
_p1 = ["¬Bando: ","blanco"] call exT_fnc_colorST;
_p2 = ["¬Plazas: ","blanco"] call exT_fnc_colorST;
_p3 = ["¬Velocidad max.: ","blanco"] call exT_fnc_colorST;
_p4 = ["¬Cavallos: ","blanco"] call exT_fnc_colorST;

_preT = [[_tit,_sep,_p0,_vclass,_p1,_bando,_p2,_maxSol,_p3,_mVel,_p4,_cv]] call TTST_parse;

_ruta = [_data] call exT_fnc_getOPicture;
if (_ruta == "") then {_ruta = [_data] call exT_fnc_getPicture;};
if (_ruta == "") then {_ruta = "exTracTr\Images\blank.paa";};

//listos
_sText ctrlSetStructuredText _preT;
_pictC ctrlSetText _ruta;
