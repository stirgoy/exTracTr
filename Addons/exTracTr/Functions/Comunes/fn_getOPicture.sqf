/*
	fn_getOPicture.sqf
	Stirgoy
*/

private ["_cfgf","_cln"];

_cln = param [0,"",[""]];

_pasa = getText(configFile / "cfgVehicles" / _cln / "overviewPicture");

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgWeapons" / _cln / "overviewPicture");
};

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgMagazines" / _cln / "overviewPicture");
};

if ( _pasa == "") then
{
	_pasa = getText(configFile / "cfgItems" / _cln / "overviewPicture");
};

_pasa
