#include <YSI\y_hooks>

new PlayerText:VongQuay_PTD[MAX_PLAYERS];
new VQ_Timer[MAX_PLAYERS];
new Text:VongQuay_TD[10];
enum Pos
{
	Float:PosX,
	Float:PosY
};
forward ResetVongQuay_Timer(playerid);
public ResetVongQuay_Timer(playerid)
{
	SetPVarInt(playerid, "VongQuayID", 0);
	SetPVarInt(playerid, "SoVong", 0);
	SetPVarInt(playerid, "VongQuayRand", -1);
	new VongQuay_ID = GetPVarInt(playerid, "VongQuayID");
	SetPVarInt(playerid, "VQ_DangQuay", 0);
	CreateVongQuay(playerid, VongQuay_ID);
}
forward VongQuay_Timer(playerid);
public VongQuay_Timer(playerid)
{
	new VongQuay_ID = GetPVarInt(playerid, "VongQuayID");
	new SoVong_V = GetPVarInt(playerid, "SoVong");
	if(GetPVarInt(playerid, "SoVong")  <= 2)
	{
		CreateVongQuay(playerid, VongQuay_ID + 1);
		VongQuay_ID++;
		SetPVarInt(playerid, "VongQuayID", VongQuay_ID);
		if(VongQuay_ID == 7)
		{
			SoVong_V++;
			SetPVarInt(playerid, "VongQuayID", -1);
		} 
		SetPVarInt(playerid, "SoVong", SoVong_V);
	}
	else
	{
		if(GetPVarInt(playerid, "VongQuayRand") == -1) SetPVarInt(playerid, "VongQuayRand", random(8));
		if(GetPVarInt(playerid, "VongQuayID") < GetPVarInt(playerid, "VongQuayRand"))
		{
			CreateVongQuay(playerid, VongQuay_ID + 1);
			SetPVarInt(playerid, "VongQuayID", VongQuay_ID+1);
		}
		else
		{
			switch(GetPVarInt(playerid, "VongQuayRand"))
			{
				case 0:
				{
					 SendClientMessage(playerid, -1, "Trung 0");
				}
				case 1:
				{
					 SendClientMessage(playerid, -1, "Trung 1");
				}
				case 2:
				{
					 SendClientMessage(playerid, -1, "Trung 2");
				}
				case 3:
				{
					 SendClientMessage(playerid, -1, "Trung 3");
				}
				case 4:
				{
					 SendClientMessage(playerid, -1, "Trung 4");
				}
				case 5:
				{
					 SendClientMessage(playerid, -1, "Trung 5");
				}
				case 6:
				{
					 SendClientMessage(playerid, -1, "Trung 6");
				}
				case 7:
				{
					 SendClientMessage(playerid, -1, "Trung 7");
				}
				case 8:
				{
					 SendClientMessage(playerid, -1, "Trung 8");
				}
			}
				KillTimer(VQ_Timer[playerid]);
				SetTimerEx("ResetVongQuay_Timer", 5000, false, "i", playerid);

			}
		}
}

new VongQuayPos[][Pos] = {
	{297.399963, 53.951107},
	{355.399932, 89.293327},
	{385.399932, 152.511093},
	{360.199981, 225.684463},
	{294.599914, 253.560058},
	{230.599914, 229.168945},
	{210.999908, 158.484466},
	{239.399856, 88.297805}
};
stock ResetPVarVQ(playerid)
{
	DeletePVar(playerid, "VongQuayShow");
	DeletePVar(playerid, "VongQuayRand");
	DeletePVar(playerid, "SoVong");
	DeletePVar(playerid, "VQ_DangQuay");
	SetPVarInt(playerid, "VongQuayRand", -1);
	

}
stock ShowVongQuay(playerid)
{
	if(GetPVarInt(playerid, "VongQuayShow") == 1) return;
	SetPVarInt(playerid,"VongQuayShow", 1);
	for(new i = 0; i < 10; i++)
	{
		//SetPVarBool(playerid, "VongQuay", true);
		TextDrawShowForPlayer(playerid, VongQuay_TD[i]);
		SelectTextDraw(playerid, 0x00FF00FF);
	}
	CreateVongQuay(playerid, 0);

}
stock CreateVongQuay(playerid, pos)
{
	PlayerTextDrawDestroy(playerid, VongQuay_PTD[playerid]);
	VongQuay_PTD[playerid] = CreatePlayerTextDraw(playerid, VongQuayPos[pos][PosX], VongQuayPos[pos][PosY], "LD_BEAT:cring");
	PlayerTextDrawLetterSize(playerid, VongQuay_PTD[playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, VongQuay_PTD[playerid], 48.000000, 47.000000);
	PlayerTextDrawAlignment(playerid, VongQuay_PTD[playerid], 1);
	PlayerTextDrawColor(playerid, VongQuay_PTD[playerid], -1);
	PlayerTextDrawSetShadow(playerid, VongQuay_PTD[playerid], 0);
	PlayerTextDrawSetOutline(playerid, VongQuay_PTD[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, VongQuay_PTD[playerid], 255);
	PlayerTextDrawFont(playerid, VongQuay_PTD[playerid], 4);
	PlayerTextDrawSetProportional(playerid, VongQuay_PTD[playerid], 0);
	PlayerTextDrawSetShadow(playerid, VongQuay_PTD[playerid], 0);
	PlayerTextDrawShow(playerid, VongQuay_PTD[playerid]);
}
hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == VongQuay_TD[9])
	{
		if(GetPVarInt(playerid,"VQ_DangQuay") == 1) return 1;
		SetPVarInt(playerid, "VQ_DangQuay", 1);
		SetPVarInt(playerid, "VongQuayID", 0);
		SetPVarInt(playerid, "SoVong", 0);
		SetPVarInt(playerid, "VongQuayRand", -1);
		VQ_Timer[playerid] = SetTimerEx("VongQuay_Timer", 200, true, "i", playerid);
	}
	return 1;
}
hook OnPlayerCommandText(playerid, cmdtext[])
{
	new idx;
	new cmd[256];
	
	cmd = strtok(cmdtext, idx);

	else if(strcmp(cmd, "/vongquay", true) == 0) {
		ShowVongQuay(playerid);
    	return 1;
	}

	return 0;
}
hook OnPlayerConnect(playerid)
{
	VongQuay_PTD[playerid] = CreatePlayerTextDraw(playerid, 295.333282, 254.555511, "LD_BEAT:cring");
	PlayerTextDrawLetterSize(playerid, VongQuay_PTD[playerid], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, VongQuay_PTD[playerid], 48.000000, 47.000000);
	PlayerTextDrawAlignment(playerid, VongQuay_PTD[playerid], 1);
	PlayerTextDrawColor(playerid, VongQuay_PTD[playerid], -1);
	PlayerTextDrawSetShadow(playerid, VongQuay_PTD[playerid], 0);
	PlayerTextDrawSetOutline(playerid, VongQuay_PTD[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, VongQuay_PTD[playerid], 255);
	PlayerTextDrawFont(playerid, VongQuay_PTD[playerid], 4);
	PlayerTextDrawSetProportional(playerid, VongQuay_PTD[playerid], 0);
	PlayerTextDrawSetShadow(playerid, VongQuay_PTD[playerid], 0);

	return 1;
}


hook OnGameModeInit()
{

	VongQuay_TD[0] = TextDrawCreate(224.666702, 89.874046, "LD_DRV:nawtxt");
	TextDrawLetterSize(VongQuay_TD[0], 0.000000, 0.000000);
	TextDrawTextSize(VongQuay_TD[0], 189.000000, 199.000000);
	TextDrawAlignment(VongQuay_TD[0], 1);
	TextDrawColor(VongQuay_TD[0], -1);
	TextDrawSetShadow(VongQuay_TD[0], 0);
	TextDrawSetOutline(VongQuay_TD[0], 0);
	TextDrawBackgroundColor(VongQuay_TD[0], 255);
	TextDrawFont(VongQuay_TD[0], 4);
	TextDrawSetProportional(VongQuay_TD[0], 0);
	TextDrawSetShadow(VongQuay_TD[0], 0);

	VongQuay_TD[1] = TextDrawCreate(275.999908, 52.125923, "");
	TextDrawLetterSize(VongQuay_TD[1], 0.000000, 0.000000);
	TextDrawTextSize(VongQuay_TD[1], 85.000000, 59.000000);
	TextDrawAlignment(VongQuay_TD[1], 1);
	TextDrawColor(VongQuay_TD[1], -1);
	TextDrawSetShadow(VongQuay_TD[1], 0);
	TextDrawSetOutline(VongQuay_TD[1], 0);
	TextDrawBackgroundColor(VongQuay_TD[1], 0);
	TextDrawFont(VongQuay_TD[1], 5);
	TextDrawSetProportional(VongQuay_TD[1], 0);
	TextDrawSetShadow(VongQuay_TD[1], 0);
	TextDrawSetPreviewModel(VongQuay_TD[1], 29);
	TextDrawSetPreviewRot(VongQuay_TD[1], 0.000000, 0.000000, 0.000000, 1.000000);

	VongQuay_TD[2] = TextDrawCreate(335.599731, 72.037010, "");
	TextDrawLetterSize(VongQuay_TD[2], 0.000000, 0.000000);
	TextDrawTextSize(VongQuay_TD[2], 86.000000, 88.000000);
	TextDrawAlignment(VongQuay_TD[2], 1);
	TextDrawColor(VongQuay_TD[2], -1);
	TextDrawSetShadow(VongQuay_TD[2], 0);
	TextDrawSetOutline(VongQuay_TD[2], 0);
	TextDrawBackgroundColor(VongQuay_TD[2], 0);
	TextDrawFont(VongQuay_TD[2], 5);
	TextDrawSetProportional(VongQuay_TD[2], 0);
	TextDrawSetShadow(VongQuay_TD[2], 0);
	TextDrawSetPreviewModel(VongQuay_TD[2], 445);
	TextDrawSetPreviewRot(VongQuay_TD[2], 0.000000, 0.000000, -30.000000, 1.000000);
	TextDrawSetPreviewVehCol(VongQuay_TD[2], 1, 1);

	VongQuay_TD[3] = TextDrawCreate(367.199554, 141.228057, "");
	TextDrawLetterSize(VongQuay_TD[3], 0.000000, 0.000000);
	TextDrawTextSize(VongQuay_TD[3], 85.000000, 74.000000);
	TextDrawAlignment(VongQuay_TD[3], 1);
	TextDrawColor(VongQuay_TD[3], -1);
	TextDrawSetShadow(VongQuay_TD[3], 0);
	TextDrawSetOutline(VongQuay_TD[3], 0);
	TextDrawBackgroundColor(VongQuay_TD[3], 0);
	TextDrawFont(VongQuay_TD[3], 5);
	TextDrawSetProportional(VongQuay_TD[3], 0);
	TextDrawSetShadow(VongQuay_TD[3], 0);
	TextDrawSetPreviewModel(VongQuay_TD[3], 411);
	TextDrawSetPreviewRot(VongQuay_TD[3], 0.000000, 0.000000, -30.000000, 1.000000);
	TextDrawSetPreviewVehCol(VongQuay_TD[3], 1, 1);

	VongQuay_TD[4] = TextDrawCreate(329.999877, 211.414642, "");
	TextDrawLetterSize(VongQuay_TD[4], 0.000000, 0.000000);
	TextDrawTextSize(VongQuay_TD[4], 109.000000, 86.000000);
	TextDrawAlignment(VongQuay_TD[4], 1);
	TextDrawColor(VongQuay_TD[4], -1);
	TextDrawSetShadow(VongQuay_TD[4], 0);
	TextDrawSetOutline(VongQuay_TD[4], 0);
	TextDrawBackgroundColor(VongQuay_TD[4], 0);
	TextDrawFont(VongQuay_TD[4], 5);
	TextDrawSetProportional(VongQuay_TD[4], 0);
	TextDrawSetShadow(VongQuay_TD[4], 0);
	TextDrawSetPreviewModel(VongQuay_TD[4], 522);
	TextDrawSetPreviewRot(VongQuay_TD[4], 0.000000, 0.000000, -30.000000, 1.000000);
	TextDrawSetPreviewVehCol(VongQuay_TD[4], 1, 1);

	VongQuay_TD[5] = TextDrawCreate(288.399902, 250.739059, "");
	TextDrawLetterSize(VongQuay_TD[5], 0.000000, 0.000000);
	TextDrawTextSize(VongQuay_TD[5], 55.000000, 55.000000);
	TextDrawAlignment(VongQuay_TD[5], 1);
	TextDrawColor(VongQuay_TD[5], -1);
	TextDrawSetShadow(VongQuay_TD[5], 0);
	TextDrawSetOutline(VongQuay_TD[5], 0);
	TextDrawBackgroundColor(VongQuay_TD[5], 0);
	TextDrawFont(VongQuay_TD[5], 5);
	TextDrawSetProportional(VongQuay_TD[5], 0);
	TextDrawSetShadow(VongQuay_TD[5], 0);
	TextDrawSetPreviewModel(VongQuay_TD[5], 2912);
	TextDrawSetPreviewRot(VongQuay_TD[5], 0.000000, 0.000000, -30.000000, 1.000000);

	VongQuay_TD[6] = TextDrawCreate(211.199996, 212.410339, "");
	TextDrawLetterSize(VongQuay_TD[6], 0.000000, 0.000000);
	TextDrawTextSize(VongQuay_TD[6], 81.000000, 68.000000);
	TextDrawAlignment(VongQuay_TD[6], 1);
	TextDrawColor(VongQuay_TD[6], -1);
	TextDrawSetShadow(VongQuay_TD[6], 0);
	TextDrawSetOutline(VongQuay_TD[6], 0);
	TextDrawBackgroundColor(VongQuay_TD[6], 0);
	TextDrawFont(VongQuay_TD[6], 5);
	TextDrawSetProportional(VongQuay_TD[6], 0);
	TextDrawSetShadow(VongQuay_TD[6], 0);
	TextDrawSetPreviewModel(VongQuay_TD[6], 1212);
	TextDrawSetPreviewRot(VongQuay_TD[6], 100.000000, 0.000000, 100.000000, 1.000000);

	VongQuay_TD[7] = TextDrawCreate(161.266601, 114.762832, "");
	TextDrawLetterSize(VongQuay_TD[7], 0.000000, 0.000000);
	TextDrawTextSize(VongQuay_TD[7], 148.000000, 138.000000);
	TextDrawAlignment(VongQuay_TD[7], 1);
	TextDrawColor(VongQuay_TD[7], -1);
	TextDrawSetShadow(VongQuay_TD[7], 0);
	TextDrawSetOutline(VongQuay_TD[7], 0);
	TextDrawBackgroundColor(VongQuay_TD[7], 0);
	TextDrawFont(VongQuay_TD[7], 5);
	TextDrawSetProportional(VongQuay_TD[7], 0);
	TextDrawSetShadow(VongQuay_TD[7], 0);
	TextDrawSetPreviewModel(VongQuay_TD[7], 447);
	TextDrawSetPreviewRot(VongQuay_TD[7], 0.000000, 0.000000, -30.000000, 1.000000);
	TextDrawSetPreviewVehCol(VongQuay_TD[7], 1, 1);

	VongQuay_TD[8] = TextDrawCreate(224.866699, 88.380638, "");
	TextDrawLetterSize(VongQuay_TD[8], 0.000000, 0.000000);
	TextDrawTextSize(VongQuay_TD[8], 92.000000, 105.000000);
	TextDrawAlignment(VongQuay_TD[8], 1);
	TextDrawColor(VongQuay_TD[8], -1);
	TextDrawSetShadow(VongQuay_TD[8], 0);
	TextDrawSetOutline(VongQuay_TD[8], 0);
	TextDrawBackgroundColor(VongQuay_TD[8], 0);
	TextDrawFont(VongQuay_TD[8], 5);
	TextDrawSetProportional(VongQuay_TD[8], 0);
	TextDrawSetShadow(VongQuay_TD[8], 0);
	TextDrawSetPreviewModel(VongQuay_TD[8], 348);
	TextDrawSetPreviewRot(VongQuay_TD[8], 0.000000, -50.000000, 0.000000, 1.000000);

	VongQuay_TD[9] = TextDrawCreate(295.999969, 168.595550, "QUAY");
	TextDrawLetterSize(VongQuay_TD[9], 0.442000, 2.660266);
	TextDrawAlignment(VongQuay_TD[9], 1);
	TextDrawColor(VongQuay_TD[9], -1);
	TextDrawSetShadow(VongQuay_TD[9], 0);
	TextDrawSetOutline(VongQuay_TD[9], 1);
	TextDrawBackgroundColor(VongQuay_TD[9], 255);
	TextDrawFont(VongQuay_TD[9], 2);
	TextDrawSetProportional(VongQuay_TD[9], 1);
	TextDrawSetShadow(VongQuay_TD[9], 0);
	TextDrawSetSelectable(VongQuay_TD[9], true);

	return 1;
}
