/*
	fn_getVClass.sqf
	Stirgoy
*/

/*
_m=[];
_arrVe = "true" configClasses (configFile >> "Cfgvehicles");
{
_cNomb = configName _x;
_cClass = gettext ( configFile >> "cfgVehicles" >> _cNomb >> "vehicleclass" );
if !(_cclass in _m ) then{
_m pushBack _cClass;};
} foreach _arrve; copyToClipboard str _m;
*/

/*
_m=[];_arrVe = "true" configClasses (configFile >> "CfgWeapons");
{
_cNomb = configName _x;
_foco = getNumber ( configFile >> "CfgWeapons" >> _cNomb >> "scope" );
_cClass = gettext ( configFile >> "CfgWeapons" >> _cNomb >> "vehicleclass" );
if (!(_cclass in _m) && _foco >= 2 ) then{
_m pushBack _cnomb;};
} foreach _arrve; copyToClipboard str _m;
*/


private ["_cln"];

_cln = param [0,"",[""]];

_pasa = getText(configFile / "cfgVehicles" / _cln / "vehicleClass");

if (true) then {_pasa};
