/*
	fn_getPicture.sqf
	Stirgoy
*/

private ["_cfgf","_cln"];

_cln = param [0,"",[""]];

_pasa = getText(configFile / "cfgVehicles" / _cln / "picture");

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgWeapons" / _cln / "picture");
};

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgMagazines" / _cln / "picture");
};

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgItems" / _cln / "picture");
};

_pasa
