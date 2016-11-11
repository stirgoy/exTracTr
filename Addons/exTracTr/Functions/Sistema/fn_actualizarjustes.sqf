/*
	fn_actualizarjustes.sqf
	Stirgoy
*/


_versionClient = profileNamespace getVariable "exTracTr_version_client";

if (_versionClient == 0.2) then
{
	profileNamespace setVariable ["exTracTr_addA3",true];
	profileNamespace setVariable ["exTracTr_version_client",0.2];
	exT_addA3 = true;
	_versionClient = 0.3;
};

if (_versionClient == 0.3) then
{
	profileNamespace setVariable ["exTracT_ajustes_filtroSide",false];
	profileNamespace setVariable ["exTracTr_version_client",0.3];
};


saveProfileNamespace;
