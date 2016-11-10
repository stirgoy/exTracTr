/*
	fn_btnHandler_veh.sqf
	Stirgoy
	Controla los botones que mueven items dde las listas de vehiculos y vclass
*/

_mode = param [0,"",[""]];

if (_mode == "") exitWith {};
disableSerialization;

_display = findDisplay 461530;
_lst0 = _display displayCtrl 1500;
_lst1 = _display displayCtrl 1501;
_lst2 = _display displayCtrl 1502;
_lst3 = _display displayCtrl 1503;


switch ( _mode ) do
{
	case "MTAE": //añadir tod_o a exportar
	{
		_tot = (lbSize _lst0) - 1;

		for "_i" from 0 to _tot do {
			_tx = (_lst0 lbText _i);
			_dt = (_lst0 lbData _i);

			_pos = _lst1 lbAdd _tx;
			_lst1 lbSetData [_pos,_dt];
			_lst1 lbSetTooltip [_pos,_dt];

			//_lst0 lbDelete _i;

			exT_vehExportLista pushBack _dt;
		};
		lbClear _lst0;

	};

	case "QTAE": //quitar todo a exportar
	{
		_tot = (lbSize _lst1) - 1;

		for "_i" from 0 to _tot do {
			_tx = (_lst1 lbText _i);
			_dt = (_lst1 lbData _i);

			_pos = _lst0 lbAdd _tx;
			_lst0 lbSetData [_pos,_dt];
			_lst0 lbSetTooltip [_pos,_dt];

			//_lst1 lbDelete _i;

			//_posi = exT_vehExportLista find _dt;
			exT_vehExportLista = exT_vehExportLista - [_dt];
			//exT_vehExportLista set [_posi,nil];
			//_tarr= [];
			//{ if (!(isNil "_x")) then {_tarr pushBack _x;}; } forEach exT_vehExportLista;	//rescrivimos array omotiendo nil
			//exT_vehExportLista = _tarr;

		};
		lbClear _lst1;

	};

	case "AVE": //añadir veh exportar
	{
		if ((lbCurSel _lst0) == -1) exitWith {};
		_datos = _lst0 lbData (lbCurSel _lst0);
		_txt = _lst0 lbText (lbCurSel _lst0);
		_lst0 lbDelete (lbCurSel _lst0);

		_ind = _lst1 lbAdd _txt;
		_lst1 lbSetData [_ind,_datos];
		_lst1 lbSetTooltip [_ind,_datos];

		//alternando valores arrays
		exT_vehExportLista pushBack _datos;
	};

	case "QVE": //Quitar veh exportar
	{
		if ((lbCurSel _lst1) == -1) exitWith {};
		_datos = _lst1 lbData (lbCurSel _lst1);
		_txt = _lst1 lbText (lbCurSel _lst1);
		_lst1 lbDelete (lbCurSel _lst1);

		_ind = _lst0 lbAdd _txt;
		_lst0 lbSetData [_ind,_datos];
		_lst0 lbSetTooltip [_ind,_datos];

		//alternando valores arrays
		_posi = exT_vehExportLista find _datos;
		exT_vehExportLista set [_posi,nil];
		_tarr= [];
		{ if (!(isNil "_x")) then {_tarr pushBack _x;}; } forEach exT_vehExportLista;	//rescrivimos array omotiendo nil
		exT_vehExportLista = _tarr;
	};

	case "AVC": //añadir vehclass
	{
		if ((lbCurSel _lst2) == -1) exitWith {};
		_datos = _lst2 lbData (lbCurSel _lst2);
		_txt = _lst2 lbText (lbCurSel _lst2);
		_lst2 lbDelete (lbCurSel _lst2);

		_ind = _lst3 lbAdd _txt;
		_lst3 lbSetData [_ind,_datos];

		//alternando valores arrays
		exT_vehBL pushBack _datos;
	};

	case "QVC": //Quitar vehclass
	{
		if ((lbCurSel _lst3) == -1) exitWith {};
		_datos = _lst3 lbData (lbCurSel _lst3);
		_txt = _lst3 lbText (lbCurSel _lst3);
		_lst3 lbDelete (lbCurSel _lst3);

		_ind = _lst2 lbAdd _txt;
		_lst2 lbSetData [_ind,_datos];

		//alternando valores arrays
		_posi = exT_vehBL find _datos;
		exT_vehBL set [_posi,nil];
		_tarr= [];
		{ if (!(isNil "_x")) then {_tarr pushBack _x;}; } forEach exT_vehBL;	//rescrivimos array omotiendo nil
		exT_vehBL = _tarr;
	};


};

//pedimos actualizacion de listas solo si son de vehiculos
if ( _mode in ["QVC","AVC"]) then { [] call exT_fnc_filtrarLista_veh; };
