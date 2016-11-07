/*
	fn_colorST.sqf
	Stirgoy
*/

private ["_texto","_color"];

_texto = param [0,"",["",0]];
_color = param [1,"",[""]];

if (typeName _texto != "STRING") then { _texto = str _texto; };
if (_texto == "" || _color == "" ) exitWith {};

_color = toLower _color;
_rTexto = "";

switch (_color) do
{
	case "blanco": { _rTexto = [_texto,0] call stir_fnc_str_t; };
	case "negro": { _rTexto = [_texto,1] call stir_fnc_str_t; };
	case "gris": { _rTexto = [_texto,2] call stir_fnc_str_t; };
	case "gris oscuro": { _rTexto = [_texto,11] call stir_fnc_str_t; };
	case "grisoscuro": { _rTexto = [_texto,11] call stir_fnc_str_t; };
	case "verde": { _rTexto = [_texto,3] call stir_fnc_str_t; };
	case "rojo": { _rTexto = [_texto,4] call stir_fnc_str_t; };
	case "azul": { _rTexto = [_texto,5] call stir_fnc_str_t; };
	case "naranja": { _rTexto = [_texto,6] call stir_fnc_str_t; };
	case "marron": { _rTexto = [_texto,7] call stir_fnc_str_t; };
	case "rosa": { _rTexto = [_texto,8] call stir_fnc_str_t; };
	case "amarillo": { _rTexto = [_texto,9] call stir_fnc_str_t; };
	case "rojo2": { _rTexto = [_texto,10] call stir_fnc_str_t; };
};

_rTexto
