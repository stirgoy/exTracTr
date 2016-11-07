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
	case "blanco": { _rTexto = [_texto,0] call TTST; };
	case "negro": { _rTexto = [_texto,1] call TTST; };
	case "gris": { _rTexto = [_texto,2] call TTST; };
	case "gris oscuro": { _rTexto = [_texto,11] call TTST; };
	case "grisoscuro": { _rTexto = [_texto,11] call TTST; };
	case "verde": { _rTexto = [_texto,3] call TTST; };
	case "rojo": { _rTexto = [_texto,4] call TTST; };
	case "azul": { _rTexto = [_texto,5] call TTST; };
	case "naranja": { _rTexto = [_texto,6] call TTST; };
	case "marron": { _rTexto = [_texto,7] call TTST; };
	case "rosa": { _rTexto = [_texto,8] call TTST; };
	case "amarillo": { _rTexto = [_texto,9] call TTST; };
	case "rojo2": { _rTexto = [_texto,10] call TTST; };
};

_rTexto
