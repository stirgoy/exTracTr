/*
fn_keyHandler.sqf
Stirgoy
Manejador de teclas con conversor a string (KHC)
*/

private ["_handled", "_ctrl", "_keyP", "_shift", "_ctrlKey", "_alt"];
_ctrl = _this select 0;
_keyP = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;

_handled = false;

//Conversor a String
_keyP = [_keyP] call exT_fnc_KHC;

switch ( _keyP ) do
{
	//TEMPORAL FOR DEVELOPMENT
	case "º": {if ( !_ctrlKey && !_shift && _alt && !dialog ) then{createDialog "RscDisplayDebugPublic";_handled = true;};};

	//Open menu
	case ext_key_menu:
	{
		if ( !_ctrlKey && _shift && !_alt && !dialog ) then //s
		{
			if (!ext_key_menu_ctrl && ext_key_menu_shift && !ext_key_menu_alt ) then
			{
				[] spawn exT_fnc_abrir_veh; _handled = true;
			};
		};

		if ( _ctrlKey && !_shift && !_alt && !dialog ) then //c
		{
			if (ext_key_menu_ctrl && !ext_key_menu_shift && !ext_key_menu_alt ) then
			{
				[] spawn exT_fnc_abrir_veh; _handled = true;
			};
		};

		if ( !_ctrlKey && !_shift && _alt && !dialog ) then //a
		{
			if (!ext_key_menu_ctrl && !ext_key_menu_shift && ext_key_menu_alt ) then
			{
				[] spawn exT_fnc_abrir_veh; _handled = true;
			};
		};

		if ( _ctrlKey && _shift && !_alt && !dialog ) then //cs
		{
			if (ext_key_menu_ctrl && ext_key_menu_shift && !ext_key_menu_alt ) then
			{
				[] spawn exT_fnc_abrir_veh; _handled = true;
			};
		};

		if ( _ctrlKey && !_shift && _alt && !dialog ) then //ca
		{
			if (ext_key_menu_ctrl && !ext_key_menu_shift && ext_key_menu_alt ) then
			{
				[] spawn exT_fnc_abrir_veh; _handled = true;
			};
		};

		if ( !_ctrlKey && _shift && _alt && !dialog ) then //sa
		{
			if (!ext_key_menu_ctrl && ext_key_menu_shift && ext_key_menu_alt ) then
			{
				[] spawn exT_fnc_abrir_veh; _handled = true;
			};
		};

		if ( !_ctrlKey && !_shift && !_alt && !dialog ) then //
		{
			if (!ext_key_menu_ctrl && !ext_key_menu_shift && !ext_key_menu_alt ) then
			{
				[] spawn exT_fnc_abrir_veh; _handled = true;
			};
		};

	};
};

//return if the key is handled or no
if (_handled) then {true} else {false};