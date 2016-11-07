/*
	fn_recuperarVehiculos.sqf
	Stirgoy
	Muestra GUI y recupera vehiculos
*/

if (exT_trabajando) exitWith {};
exT_trabajando = !exT_trabajando;

_c0 = missionNamespace getVariable "exT_vehArray";
_c1 = missionNamespace getVariable "exT_vClassArray";

if !( isNil "_c0" || isNil "_c1" ) exitWith { exT_trabajando = !exT_trabajando; };

private ["_confArr","_vehCnArr","_classN","_vClass","_blackList","_vClassArr"];

disableSerialization;


//pb display
cutRsc ["stir", "BLACK"];
createDialog "exT_GUI_pb";
waitUntil {!(isNull findDisplay 77755)};
_displayPb = findDisplay 77755;
exT_evh_key = _displayPb displayAddEventHandler ["KeyDown", "_keyPr = _this select 1; if ( _keyPr == 1 && exT_trabajando) then { true;} else {false;};"];

_pb_pb = _displayPb displayCtrl 3466;
_pb_tx = _displayPb displayCtrl 1001;
//pb config
_pc = "%";
_pbPos = 0.001;

//loop
_confArr = "getNumber (_x >> 'scope') >= 2" configClasses (configFile >> "CfgVehicles");
_blackList = [] call exT_fnc_vehicleClassBL;
_vehCnArr = [];
_vClassArr = [];
_total = count _confArr;


{

	_classN = configName _x;
	_vClass = [_classN] call exT_fnc_getVClass;
	_vClass = toLower _vClass;
	//pb upddate
	_pbPos = [_forEachIndex,0,_total,0,1] call stir_fnc_mapear;
	_pb_pb progressSetPosition _pbPos;

	_pbPos = _pbPos * 100;
	_ttxt = format ["Cargando: %1%2 - %3", (floor _pbPos), _pc, _classN];
	_pb_tx ctrlSetText _ttxt;

	_mVelp = getNumber ( configFile / "CfgVehicles" / _classN / "maxSpeed" );

	//filtros
	if ((_mVelp > 25) || _vClass == "static" ) then	//solo vehiculos con Vmax > 25 o estaticos ( para filtrar Vclass de addons )
	{
		if !( _vClass in _blackList ) then	//filtro vclases eddificios, arbustos,...
		{
			if !( _vClass in _vClassArr ) then	//filtro VC
			{
				_vClassArr pushBack _vClass;	//añadimos vclass
			};

			//if ( _vClass in ["car","air","ship","static"]) then	//filtro basura
			//{
			_vehCnArr pushBack _classN;	//añadimos class
		};
		//};
	};

} forEach _confArr;



missionNamespace setVariable ["exT_vehArray",_vehCnArr];
missionNamespace setVariable ["exT_vClassArray",_vClassArr];

closeDialog 0;

exT_trabajando = !exT_trabajando;
