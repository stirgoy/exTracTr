/*
	fn_getScope.sqf
	Stirgoy
*/

private ["_cfgf","_cln"];

_cln = param [0,0,[0]];

_pasa = getNumber(configFile / "cfgVehicles" / _cln / "scope");

if ( _pasa == 0) then
{
	_pasa = getNumber(configFile / "cfgWeapons" / _cln / "scope");
};

if ( _pasa == 0) then
{
	_pasa = getNumber(configFile / "cfgMagazines" / _cln / "scope");
};

if ( _pasa == 0) then
{
	_pasa = getNumber(configFile / "cfgItems" / _cln / "scope");
};

_pasa
