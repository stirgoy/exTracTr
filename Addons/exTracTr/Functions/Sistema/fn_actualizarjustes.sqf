/*
	fn_actualizarjustes.sqf
	Stirgoy
*/


_versionClient = profileNamespace getVariable "exTracTr_version_client";

switch (_versionClient) do
{
	case 0.2:
	{
		profileNamespace setVariable ["exTracTr_addA3",true];
		profileNamespace setVariable ["exTracTr_version_client",0.2];
		exT_addA3 = true;
	};
	case 0.3:
	{
		profileNamespace setVariable ["exTracT_ajustes_filtroSide",false];
		profileNamespace setVariable ["exTracTr_version_client",0.3];
	}

};

saveProfileNamespace;
