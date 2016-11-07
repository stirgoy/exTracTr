/*
	fn_isBIS.sqf
	Stirgoy
*/

_className = param [0,"",[""]];
if (_className == "") exitWith {false};

_author = gettext (configfile/"cfgVehicles"/_className/"author");

if (_author == "") then
{
	_author = gettext (configfile/"cfgWeapons"/_className/"author");
};

if (_author == "") then
{
	_author = gettext (configfile/"cfgMagazines"/_className/"author");
};

if (_author == "") then
{
	_author = gettext (configfile/"cfgItems"/_className/"author");
};

if (_author == "Bohemia Interactive") then
{true}
else
{ false};