/*
	fn_getDisplayName.sqf
	Stirgoy
*/

private ["_cfgf","_cln"];

_cln = param [0,"",[""]];

_pasa = getText(configFile / "cfgVehicles" / _cln / "displayName");

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgWeapons" / _cln / "displayName");
};

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgMagazines" / _cln / "displayName");
};

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgItems" / _cln / "displayName");
};

_pasa
