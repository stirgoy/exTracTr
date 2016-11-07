class CfgFunctions
{
	class exTracTr_core
	{
		tag = "exT";
		class exT_Common
		{
			file = "exTracTr\Functions\Comunes";
			class getAuthor {};
			class getDisplayName {};
			class getOPicture {};
			class getPicture {};
			class getScope {};
			class getVClass {};
			class isBIS {};

		};

		class exT_GUI_veh
		{
			file = "exTracTr\GUI\Vehiculos";
			class abrir_veh {};
			class filtrarLista_veh {};
			class btnHandler_veh {};
			class sText_veh {};

		};

		class exT_EVH
		{
			file = "exTracTr\Functions\Eventos";
			class KHC {};
			class keyHandler {};

		};

		class exT_sys
		{
			file = "exTracTr\Functions\Sistema";
			class cargarMod { postInit = 1; };			//init controlado
			class cargarAjustes {};
			class defaultAjustes {};
			class actualizarjustes {};
			class guardaAjustes {};
			class recuperarVehiculos {};
			class mapear {};
			class TTST {};
			class colorST {};
			class dev {};
			class keyList {};			//Lista de teclas para ajustes
			class vehicleClassBL {};	//BL para vehiclleClases

		};

	};

};