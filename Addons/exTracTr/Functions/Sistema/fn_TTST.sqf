/*
	fn_TTST.sqf
	Stirgoy
	V2
*/

_cargado = missionNamespace getVariable "TTST_ARR";
if ( !isNil "_cargado" ) exitWith {};

_colorArray = [				//Lista de colores 0 = default
	"color='#FFFFFF' ",		//Blanco	0
	"color='#000000' ",		//Negro		1
	"color='#808080' ",		//Gris		2
	"color='#008000' ",		//Verde		3
	"color='#B22222' ",		//Rojo		4
	"color='#1E90FF' ",		//Azul		5
	"color='#FF8C00' ",		//Naranja	6
	"color='#542800' ",		//Marron	7
	"color='#FF00FF' ",		//Rosa		8
	"color='#FFD700' ",		//Amarillo	9
	"color='#9E1C00' ",		//Rojo 2 	10
	"color='#1D1D1D' "		//Gris Oscuro 11
	];
_fontArray = [								//Lista de fuentes 0 = default
	"font ='PuristaLight' ",				//0
	"font ='PuristaMedium' ",				//1
	"font ='PuristaSemiBold' ",				//2
	"font ='PuristaBold' ",					//3
	"font ='LucidaConsoleB' ",				//4
	"font ='EtelkaMonospacePro' ",			//5
	"font ='EtelkaMonospaceProBold' ",		//6
	"font ='EtelkaNarrowMediumPro' ",		//7
	"font ='TahomaB' "						//8
];

_dSize = "size='0.8' ";						//Tamaño de la fuente: Puedes usar decimales: "size='1.3' "
_dColor = _colorArray select 0;				//Color por defecto de la lista
_dFont = _fontArray select 8;				//fuente por defecto de la lista

//variables finales

_dShadow = "shadow='%1' ";					//Sombra del texto: 0 = sin sombra, 1 = sombra, 2 = relieve
_dAlign = "align='%1' ";					//Alineacion del texto center, left, right
_openT = "<t ";
_openTC = "<t >";
_closeT = "<t/>";
_closeOT = ">";
_closeTic = "/>";
_imag = "<img image='%1' ";
_hlink = "<a %3 href='%1'>%2<a/> ";
_dUnderL = "underline='%1' ";			//Underline bool

//Añadimos la config al jugador
_cArray = [
			_colorArray,	//0 arr
			_fontArray, 	//1 arr
			_openT, 		//2 <t "
			_openTC, 		//3 <t>"
			_closeT, 		//4 <t/>"
			_closeOT, 		//5  >"
			_closeTic,		//6 />"
			_dSize, 		//7 size='1'
			_dColor, 		//8 color='#FFFFF'
			_dFont,			//9 font='tahomab'
			_dAlign,		//10 align='%1'
			_dUnderL,		//11 underline=''
			_dShadow,		//12 shadow='%1'
			_imag,			//13 img
			_hlink			//14 a href


			];
missionNamespace setVariable ["TTST_ARR",_cArray];
//--------------------------------------------------------------------------------------------------------
/*
		STR = String a estructurar
		PAR1 = Integer numero en la lista de colores ( partiendo de 0 )	//Opcional def: -1
		PAR2 = Integer numero en la lista de fuentes ( partiendo de 0 )	//Opcional def: -1
		PAR3 = Float tamaño de la fuente								//Opcional def: -1
		PAR4 = Integer 1 = subrrallar, 0 = normal						//Opcional def: -1
		PAR5 = Integer 0 = Left, 1 = Center, 2 = Right					//Opcional def: -1
		PAR6 = Integer 1 = Sombreado, 2 = Contorno, 0 = Sin sombra		//Opcopnal def: -1
*/

TTST = compileFinal "

	private [""_value0"",""_value1"",""_value2"",""_value3"",""_value4"",""_value5"",""_confArray"",""_ot"",""_clt"",""_cot"",""_col"",""_siz"",""_fon"",""_cInd"",""_retVal0A"",""_val0ArrSt"",""_strf"",""_und"",""_fal"",""_som"",""_smbr""];
	_value0 = param [0,"""",[""""]];
	_value1 = param [1,-1,[0]];
	_value2 = param [2,-1,[0]];
	_value3 = param [3,-1,[0]];
	_value4 = param [4,-1,[0]];
	_value5 = param [5,-1,[0]];
	_value6 = param [6,-1,[0]];

	_confArray = missionNamespace getVariable ""TTST_ARR"";
	if ( _value1 < -1 || _value1 > (count (_confArray select 0) - 1) ) then { _value1 = -1; };
	if ( _value2 < -1 || _value2 > (count (_confArray select 1) - 1) ) then { _value2 = -1; };
	if ( _value4 < -1 || _value4 > 1 ) then { _value4 = -1; };
	if ( _value5 < -1 || _value5 > 2 ) then { _value5 = -1 };
	if ( _value6 < -1 || _value6 > 2 ) then { _value6 = -1 };

	_ot = _confArray select 2;
	_clt = _confArray select 4;
	_cot =  _confArray select 5;
	_al = _confArray select 10;
	_smbr = _confArray select 12;

	_col = """";
	_siz = """";
	_fon = """";
	_fal = """";
	_som = """";
	_cInd = 0;
	_retVal0A = [];

	if ( _value3 == -1 || isNil ""_value3"" ) then { _siz = _confArray select 7; } else { _siz = format [""size='%1' "", _value3]; };
	if ( _value1 == -1 || isNil ""_value1"" ) then { _col = _confArray select 8; } else { _col = _confArray select 0 select _value1; };
	if ( _value2 == -1 || isNil ""_value2"" ) then { _fon = _confArray select 9; } else { _fon = _confArray select 1 select _value2; };
	if ( _value4 == -1 || isNil ""_value4"" ) then { _und = """"; } else { _und = format [_confArray select 11, _value4]; };
	if ( _value6 == -1 || isNil ""_value6"" ) then { _som = format [_smbr, 0] } else { _som = format [_smbr, _value6] };

	switch ( _value5 ) do {
		case 0: { _fal = ""left""; _fal = format [_al, _fal]; };
		case 1: { _fal = ""center""; _fal = format [_al, _fal]; };
		case 2: { _fal = ""right""; _fal = format [_al, _fal]; };
		default { _fal = ""left""; _fal = format [_al, _fal]; };
	};

		_val0ArrSt = toArray _value0;
	{
		if ( _x == 172 ) then
		{
			_retVal0A = _retVal0A + [60,98,114,47,62]
		}
		else
		{
			_retVal0A pushBack _x;
		};
	}forEach _val0ArrSt;

	_strf = toString _retVal0A;

	format [""%1%2%8%9%10%3%4%5%6%7"", _ot, _col, _siz, _fon, _cot, _strf, _clt, _und,_fal,_som]

";
//_strf = _retVal0A joinString """";

TTST_image = compileFinal "

	private[""_value0"",""_value1"",""_value2"",""_confArray"",""_col"",""_siz"",""_bimg"",""_fimg""];
	_value0 = param [0,"""",[""""]];
	_value1 = param [1,-1,[0]];
	_value2 = param [2,-1,[0]];
	_confArray = missionNamespace getVariable ""TTST_ARR"";
	if ( _value2 < -1 || _value2 > (count (_confArray select 0) - 1) ) then { _value2 = -1; };
	if ( _value1 == -1 || isNil ""_value1"" ) then { _siz = """"; } else { _siz = format [""size='%1' "", _value1]; };
	if ( _value2 == -1 || isNil ""_value2"" ) then { _col = ""color='#FFFFFFFF' ""; } else { _col = _confArray select 0 select _value2; };
	_closI = _confArray select 6;
	_bimg = _confArray select 13;
	_fimg = format [_bimg, _value0];
	format [""%1%2%3%4"", _fimg, _siz, _col, _closI]

";

TTST_parse = compileFinal "

	private [""_value0""];
	_value0 = _this select 0;

	switch (typeName (_value0)) do
	{
		case ""STRING"": { parseText _value0 };

		case ""ARRAY"": {	parseText (_value0 joinString """") };

		default {};
	};
";


TTST_onlyT = compileFinal "

	private [""_value0"",""_confArray"",""_ot"",""_cot""];
	_value0 = param [0,"""",[""""]];
	_confArray = player getVariable ""TTST_ARR"";
	_ot = _confArray select 3;
	_cot = _confArray select 4;
	format [""%1%2%3"", _ot,_value0,_cot]
";
