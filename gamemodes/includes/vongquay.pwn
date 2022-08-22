#include <YSI\y_hooks>



hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	// if(clickedid == VongQuay_TD[9])
	// {
	// 	if(GetPVarInt(playerid,"VQ_DangQuay") == 1) return 1;
	// 	SetPVarInt(playerid, "VQ_DangQuay", 1);
	// 	SetPVarInt(playerid, "VongQuayID", 0);
	// 	SetPVarInt(playerid, "SoVong", 0);
	// 	SetPVarInt(playerid, "VongQuayRand", -1);
	// 	VQ_Timer[playerid] = SetTimerEx("VongQuay_Timer", 200, true, "i", playerid);
	// }
	return 1;
}
// hook OnPlayerCommandText(playerid, cmdtext[])
// {
// 	new idx;
// 	new cmd[256];
	
// 	cmd = strtok(cmdtext, idx);

// 	else if(strcmp(cmd, "/vongquay", true) == 0) {
// 		ShowVongQuay(playerid);
//     	return 1;
// 	}

// 	return 0;
// }

hook OnPlayerConnect(playerid)
{
	

	return 1;
}


hook OnGameModeInit()
{

	

	return 1;
}
