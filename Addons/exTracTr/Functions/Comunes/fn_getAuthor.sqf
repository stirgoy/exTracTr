/*
	fn_getAuthor.sqf
	Stirgoy
*/

private ["_cfgf","_cln"];

_cln = param [0,"",[""]];

_pasa = getText(configFile / "cfgVehicles" / _cln / "author");

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgWeapons" / _cln / "author");
};

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgMagazines" / _cln / "author");
};

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgItems" / _cln / "author");
};

_pasa
