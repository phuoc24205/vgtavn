#include <YSI\y_hooks>
// enum
new PlayerText:ChinhToyPTD[13],Text:ChinhToyTD[6], InChinhToy[MAX_PLAYERS], LuaChonChinhSua[MAX_PLAYERS], Float:ViTriX[MAX_PLAYERS], Float:ViTriY[MAX_PLAYERS],Float:ViTriZ[MAX_PLAYERS],
Float:XoayX[MAX_PLAYERS], Float:XoayY[MAX_PLAYERS], Float:XoayZ[MAX_PLAYERS], Float:KichThuocX[MAX_PLAYERS],Float:KichThuocY[MAX_PLAYERS],Float:KichThuocZ[MAX_PLAYERS];

chinhsuatoy(playerid) {
	new slotid = GetPVarInt(playerid, "ToySlot");
	for(new x = 0; x < 13; x++) PlayerTextDrawShow(playerid, ChinhToyPTD[x]);
	for(new y = 0; y < 6; y++) TextDrawShowForPlayer(playerid, ChinhToyTD[y]);
	InChinhToy[playerid] = 1;
	ViTriX[playerid] = PlayerToyInfo[playerid][slotid][ptPosX];
	ViTriY[playerid] = PlayerToyInfo[playerid][slotid][ptPosY];
	ViTriZ[playerid] = PlayerToyInfo[playerid][slotid][ptPosZ];
	XoayX[playerid] = PlayerToyInfo[playerid][slotid][ptRotX];
	XoayY[playerid] = PlayerToyInfo[playerid][slotid][ptRotY];
	XoayZ[playerid] = PlayerToyInfo[playerid][slotid][ptRotZ];
	KichThuocX[playerid] = PlayerToyInfo[playerid][slotid][ptScaleX];
	KichThuocY[playerid] = PlayerToyInfo[playerid][slotid][ptScaleY];
	KichThuocZ[playerid] = PlayerToyInfo[playerid][slotid][ptScaleZ];
	SelectTextDraw(playerid, 0x00FF00FF);
	print("da chay den day");
	return true;
}

hook OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == ChinhToyPTD[0])
	{
		print("a");
		LuaChonChinhSua[playerid] = 1;
		print("a");
	}
	if(playertextid == ChinhToyPTD[1])
	{
		LuaChonChinhSua[playerid] = 2;
		print("ab");
	}
	if(playertextid == ChinhToyPTD[2])
	{
		LuaChonChinhSua[playerid] = 3;
		print("ac");
	}
	if(playertextid == ChinhToyPTD[4])
	{
		LuaChonChinhSua[playerid] = 4;
	}
	if(playertextid == ChinhToyPTD[5])
	{
		LuaChonChinhSua[playerid] = 5;
		print("ad");
	}
	if(playertextid == ChinhToyPTD[6])
	{
		LuaChonChinhSua[playerid] = 6;
	}

	if(playertextid == ChinhToyPTD[7])
	{
		LuaChonChinhSua[playerid] = 7;
		print("af");
	}
	if(playertextid == ChinhToyPTD[8])
	{
		LuaChonChinhSua[playerid] = 8;
	}
	if(playertextid == ChinhToyPTD[9])
	{
		LuaChonChinhSua[playerid] = 9;
	}
	if(playertextid == ChinhToyPTD[10])
	{
		switch(LuaChonChinhSua[playerid]) {
			case 1: {
				ViTriX[playerid] += 0.1;
			}
			case 2: {
				ViTriY[playerid] += 0.1;
			}
			case 3: {
				ViTriZ[playerid] += 0.1;
			}
			case 4: {
				XoayX[playerid] += 0.1;
			}
			case 5: {
				XoayY[playerid] += 0.1;
			}
			case 6: {
				XoayZ[playerid] += 0.1;
			}
			case 7: {
				KichThuocX[playerid] += 0.1;
			}
			case 8: {
				KichThuocY[playerid] += 0.1;
			}
			case 9: {
				KichThuocZ[playerid] += 0.1;
			}
		}
		new iIndex = GetPVarInt(playerid, "ToySlot");
		new toys;
		for(new i; i < 11; i++)
		{
			if(PlayerHoldingObject[playerid][i] == iIndex+1)
			{
				toys = i;
				if(IsPlayerAttachedObjectSlotUsed(playerid, toys-1))
				{
					PlayerHoldingObject[playerid][i] = 0;
					RemovePlayerAttachedObject(playerid, toys-1);
				}
			}
		}
		new toycount = GetFreeToySlot(playerid);
		SetPlayerAttachedObject(playerid, toycount-1, PlayerToyInfo[playerid][iIndex][ptModelID],
		PlayerToyInfo[playerid][iIndex][ptBone], ViTriX[playerid],
		ViTriY[playerid],ViTriZ[playerid],
		XoayX[playerid], XoayY[playerid],
		XoayZ[playerid], KichThuocX[playerid],
		KichThuocY[playerid], KichThuocZ[playerid]);
	}
	if(playertextid == ChinhToyPTD[3])
	{
		switch(LuaChonChinhSua[playerid]) {
			case 1: {
				ViTriX[playerid] -= 0.1;
				print("aaa");
			}
			case 2: {
				ViTriY[playerid] -= 0.1;
				print("aaaaa");
			}
			case 3: {
				ViTriZ[playerid] -= 0.1;
			}
			case 4: {
				XoayX[playerid] -= 0.1;
			}
			case 5: {
				XoayY[playerid] -= 0.1;
			}
			case 6: {
				XoayZ[playerid] -= 0.1;
			}
			case 7: {
				KichThuocX[playerid] -= 0.1;
			}
			case 8: {
				KichThuocY[playerid] -= 0.1;
			}
			case 9: {
				KichThuocZ[playerid] -= 0.1;
			}
		}
		new iIndex = GetPVarInt(playerid, "ToySlot");
		new toys;
		for(new i; i < 11; i++)
		{
			if(PlayerHoldingObject[playerid][i] == iIndex+1)
			{
				toys = i;
				if(IsPlayerAttachedObjectSlotUsed(playerid, toys-1))
				{
					PlayerHoldingObject[playerid][i] = 0;
					RemovePlayerAttachedObject(playerid, toys-1);
				}
			}
		}
		new toycount = GetFreeToySlot(playerid);
		SetPlayerAttachedObject(playerid, toycount-1, PlayerToyInfo[playerid][iIndex][ptModelID],
		PlayerToyInfo[playerid][iIndex][ptBone], ViTriX[playerid],
		ViTriY[playerid],ViTriZ[playerid],
		XoayX[playerid], XoayY[playerid],
		XoayZ[playerid], KichThuocX[playerid],
		KichThuocY[playerid], KichThuocZ[playerid]);
	}
	if(playertextid == ChinhToyPTD[12]) { // huy bo all thao tac toy quay ve nhu cu
   		for(new x = 0; x < 13; x++) PlayerTextDrawHide(playerid, ChinhToyPTD[x]);
		for(new y = 0; y < 6; y++) TextDrawHideForPlayer(playerid, ChinhToyTD[y]);
		InChinhToy[playerid] = 0;
		LuaChonChinhSua[playerid] = 0;
		ShowEditMenu(playerid);
		CancelSelectTextDraw(playerid);
   	}
   	if(playertextid == ChinhToyPTD[11]) { // hoan thanh chinh sua toys
   		new slotid = GetPVarInt(playerid, "ToySlot");
   		for(new x = 0; x < 13; x++) PlayerTextDrawHide(playerid, ChinhToyPTD[x]);
		for(new y = 0; y < 6; y++) TextDrawHideForPlayer(playerid, ChinhToyTD[y]);
		InChinhToy[playerid] = 0;
		LuaChonChinhSua[playerid] = 0;
		PlayerToyInfo[playerid][slotid][ptPosX] = ViTriX[playerid];
		PlayerToyInfo[playerid][slotid][ptPosY] = ViTriY[playerid];
		PlayerToyInfo[playerid][slotid][ptPosZ] = ViTriZ[playerid];
		PlayerToyInfo[playerid][slotid][ptRotX] = XoayX[playerid];
		PlayerToyInfo[playerid][slotid][ptRotY] = XoayY[playerid];
		PlayerToyInfo[playerid][slotid][ptRotZ] = XoayZ[playerid];
		PlayerToyInfo[playerid][slotid][ptScaleX] = KichThuocX[playerid];
		PlayerToyInfo[playerid][slotid][ptScaleY] = KichThuocY[playerid];
		PlayerToyInfo[playerid][slotid][ptScaleZ] = KichThuocZ[playerid];
		g_mysql_SaveToys(playerid,slotid); 
		CancelSelectTextDraw(playerid);
   	}

	return 1;
}

hook OnPlayerConnect(playerid)
{
	LuaChonChinhSua[playerid] = 0;
	InChinhToy[playerid] = 0;

	ChinhToyTD[0] = TextDrawCreate(448.360076, 128.166687, "box");
	TextDrawLetterSize(ChinhToyTD[0], 0.000000, 26.163978);
	TextDrawTextSize(ChinhToyTD[0], 601.000000, 0.000000);
	TextDrawAlignment(ChinhToyTD[0], 1);
	TextDrawColor(ChinhToyTD[0], -1);
	TextDrawUseBox(ChinhToyTD[0], 1);
	TextDrawBoxColor(ChinhToyTD[0], 136);
	TextDrawSetShadow(ChinhToyTD[0], 0);
	TextDrawSetOutline(ChinhToyTD[0], 0);
	TextDrawBackgroundColor(ChinhToyTD[0], 255);
	TextDrawFont(ChinhToyTD[0], 1);
	TextDrawSetProportional(ChinhToyTD[0], 1);
	TextDrawSetShadow(ChinhToyTD[0], 0);

	ChinhToyTD[1] = TextDrawCreate(524.260925, 112.999984, "CHINH SUA TOY");
	TextDrawLetterSize(ChinhToyTD[1], 0.267993, 1.227542);
	TextDrawTextSize(ChinhToyTD[1], 0.000000, 152.000000);
	TextDrawAlignment(ChinhToyTD[1], 2);
	TextDrawColor(ChinhToyTD[1], -1);
	TextDrawUseBox(ChinhToyTD[1], 1);
	TextDrawBoxColor(ChinhToyTD[1], -1061109505);
	TextDrawSetShadow(ChinhToyTD[1], 0);
	TextDrawSetOutline(ChinhToyTD[1], 1);
	TextDrawBackgroundColor(ChinhToyTD[1], 255);
	TextDrawFont(ChinhToyTD[1], 2);
	TextDrawSetProportional(ChinhToyTD[1], 1);
	TextDrawSetShadow(ChinhToyTD[1], 0);

	ChinhToyTD[2] = TextDrawCreate(529.883422, 294.416687, "THAY DOI");
	TextDrawLetterSize(ChinhToyTD[2], 0.327847, 1.296666);
	TextDrawAlignment(ChinhToyTD[2], 2);
	TextDrawColor(ChinhToyTD[2], -1);
	TextDrawSetShadow(ChinhToyTD[2], 1);
	TextDrawSetOutline(ChinhToyTD[2], 1);
	TextDrawBackgroundColor(ChinhToyTD[2], 255);
	TextDrawFont(ChinhToyTD[2], 2);
	TextDrawSetProportional(ChinhToyTD[2], 1);
	TextDrawSetShadow(ChinhToyTD[2], 1);

	ChinhToyTD[3] = TextDrawCreate(527.540710, 129.916702, "VI TRI");
	TextDrawLetterSize(ChinhToyTD[3], 0.327847, 1.296666);
	TextDrawAlignment(ChinhToyTD[3], 2);
	TextDrawColor(ChinhToyTD[3], -1);
	TextDrawSetShadow(ChinhToyTD[3], 1);
	TextDrawSetOutline(ChinhToyTD[3], 1);
	TextDrawBackgroundColor(ChinhToyTD[3], 255);
	TextDrawFont(ChinhToyTD[3], 2);
	TextDrawSetProportional(ChinhToyTD[3], 1);
	TextDrawSetShadow(ChinhToyTD[3], 1);

	ChinhToyTD[4] = TextDrawCreate(528.477783, 187.666717, "XOAY");
	TextDrawLetterSize(ChinhToyTD[4], 0.327847, 1.296666);
	TextDrawAlignment(ChinhToyTD[4], 2);
	TextDrawColor(ChinhToyTD[4], -1);
	TextDrawSetShadow(ChinhToyTD[4], 1);
	TextDrawSetOutline(ChinhToyTD[4], 1);
	TextDrawBackgroundColor(ChinhToyTD[4], 255);
	TextDrawFont(ChinhToyTD[4], 2);
	TextDrawSetProportional(ChinhToyTD[4], 1);
	TextDrawSetShadow(ChinhToyTD[4], 1);

	ChinhToyTD[5] = TextDrawCreate(531.289001, 246.583328, "kich thuoc");
	TextDrawLetterSize(ChinhToyTD[5], 0.327847, 1.296666);
	TextDrawAlignment(ChinhToyTD[5], 2);
	TextDrawColor(ChinhToyTD[5], -1);
	TextDrawSetShadow(ChinhToyTD[5], 1);
	TextDrawSetOutline(ChinhToyTD[5], 1);
	TextDrawBackgroundColor(ChinhToyTD[5], 255);
	TextDrawFont(ChinhToyTD[5], 2);
	TextDrawSetProportional(ChinhToyTD[5], 1);
	TextDrawSetShadow(ChinhToyTD[5], 1);
// PlayerTextDraw
	ChinhToyPTD[0] = CreatePlayerTextDraw(playerid, 475.534545, 153.250000, "X");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[0], 0.502722, 1.874166);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[0], 10.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[0], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[0], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[0], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[0], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[0], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[0], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[0], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[0], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[0], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[0], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[0], true);

	ChinhToyPTD[1] = CreatePlayerTextDraw(playerid, 528.009155, 153.833312, "Y");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[1], 0.493820, 1.950001);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[1], 10.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[1], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[1], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[1], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[1], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[1], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[1], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[1], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[1], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[1], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[1], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[1], true);

	ChinhToyPTD[2] = CreatePlayerTextDraw(playerid, 577.203857, 153.833282, "Z");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[2], 0.493820, 1.903334);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[2], 10.000000, 33.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[2], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[2], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[2], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[2], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[2], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[2], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[2], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[2], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[2], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[2], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[2], true);

	ChinhToyPTD[3] = CreatePlayerTextDraw(playerid, 564.084838, 311.916748, "-");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[3], 0.558007, 1.640833);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[3], 10.000000, 28.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[3], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[3], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[3], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[3], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[3], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[3], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[3], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[3], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[3], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[3], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[3], true);

	ChinhToyPTD[4] = CreatePlayerTextDraw(playerid, 477.877197, 213.333358, "X");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[4], 0.497099, 2.008333);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[4], 10.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[4], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[4], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[4], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[4], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[4], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[4], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[4], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[4], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[4], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[4], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[4], true);

	ChinhToyPTD[5] = CreatePlayerTextDraw(playerid, 528.946105, 213.916641, "Y");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[5], 0.490072, 1.979166);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[5], 10.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[5], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[5], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[5], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[5], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[5], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[5], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[5], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[5], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[5], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[5], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[5], true);

	ChinhToyPTD[6] = CreatePlayerTextDraw(playerid, 578.609436, 214.499984, "Z");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[6], 0.486324, 1.979166);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[6], 10.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[6], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[6], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[6], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[6], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[6], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[6], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[6], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[6], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[6], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[6], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[6], true);

	ChinhToyPTD[7] = CreatePlayerTextDraw(playerid, 478.345642, 273.416900, "X");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[7], 0.493820, 1.827499);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[7], 10.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[7], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[7], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[7], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[7], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[7], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[7], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[7], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[7], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[7], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[7], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[7], true);

	ChinhToyPTD[8] = CreatePlayerTextDraw(playerid, 529.883300, 274.000244, "Y");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[8], 0.493351, 1.780833);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[8], 10.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[8], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[8], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[8], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[8], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[8], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[8], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[8], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[8], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[8], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[8], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[8], true);

	ChinhToyPTD[9] = CreatePlayerTextDraw(playerid, 580.015197, 273.416900, "Z");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[9], 0.485386, 1.769166);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[9], 10.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[9], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[9], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[9], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[9], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[9], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[9], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[9], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[9], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[9], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[9], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[9], true);

	ChinhToyPTD[10] = CreatePlayerTextDraw(playerid, 490.995483, 313.083404, "+");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[10], 0.558007, 1.640833);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[10], 10.000000, 29.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[10], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[10], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[10], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[10], -1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[10], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[10], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[10], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[10], 1);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[10], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[10], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[10], true);

	ChinhToyPTD[11] = CreatePlayerTextDraw(playerid, 530.819885, 346.916809, "xong");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[11], 0.234726, 1.144999);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[11], 10.000000, 36.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[11], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[11], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[11], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[11], 8388788);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[11], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[11], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[11], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[11], 2);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[11], 1);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[11], 0);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[11], true);

	ChinhToyPTD[12] = CreatePlayerTextDraw(playerid, 589.385131, 113.000091, "X");
	PlayerTextDrawLetterSize(playerid, ChinhToyPTD[12], 0.256747, 1.244167);
	PlayerTextDrawTextSize(playerid, ChinhToyPTD[12], 10.000000, 23.000000);
	PlayerTextDrawAlignment(playerid, ChinhToyPTD[12], 2);
	PlayerTextDrawColor(playerid, ChinhToyPTD[12], -1);
	PlayerTextDrawUseBox(playerid, ChinhToyPTD[12], 1);
	PlayerTextDrawBoxColor(playerid, ChinhToyPTD[12], -16777003);
	PlayerTextDrawSetShadow(playerid, ChinhToyPTD[12], 0);
	PlayerTextDrawSetOutline(playerid, ChinhToyPTD[12], 1);
	PlayerTextDrawBackgroundColor(playerid, ChinhToyPTD[12], 255);
	PlayerTextDrawFont(playerid, ChinhToyPTD[12], 2);
	PlayerTextDrawSetProportional(playerid, ChinhToyPTD[12], 1);
	PlayerTextDrawSetSelectable(playerid, ChinhToyPTD[12], true);
	return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if((dialogid == EDITTOYS2)) {
	    if(response) switch(listitem) {
		    case 0: ShowPlayerDialog(playerid, EDITTOYSBONE, DIALOG_STYLE_LIST, "Chon mot vi tri", "Cot song\nDau\nTren tay trai\nCanh tay phai\nTay trai\nTay phai\nDui trai\nDui phai\nChan trai\nChan phai\nBap chan phai\nBap chan trai\nCanh tay trai\nCanh tay phai\nXuong don trai\nXuong don phai\nCo\nQuay ham", "Lua chon", "Huy bo");
		    case 1:
			{		
				/*for(new i; i < 11; i++)
				{
					if(PlayerHoldingObject[playerid][i] == GetPVarInt(playerid, "ToySlot")+1)
					{
						EditAttachedObject(playerid, i-1);
						break;
					}
				}
			    SendClientMessage(playerid, COLOR_WHITE, "HINT: Giu {8000FF}~k~~PED_SPRINT~ {FFFFAA}de di chuyen goc nhin cua ban, bam esc de thoat ra");*/
			    chinhsuatoy(playerid);
			}
		}
		else
		{
		    new stringg[4096], icount = GetPlayerToySlots(playerid);
			for(new x;x<icount;x++)
			{
			    new name[24];
			    format(name, sizeof(name), "None");

			    for(new i;i<sizeof(HoldingObjectsAll);i++)
			    {
       				if(HoldingObjectsAll[i][holdingmodelid] == PlayerToyInfo[playerid][x][ptModelID])
			        {
           				format(name, sizeof(name), "%s", HoldingObjectsAll[i][holdingmodelname]);
					}
				}
				if(PlayerToyInfo[playerid][x][ptModelID] != 0 && (strcmp(name, "None", true) == 0))
				{
					format(name, sizeof(name), "ID: %d", PlayerToyInfo[playerid][x][ptModelID]);
				}
				format(stringg, sizeof(stringg), "%s(%d) %s (Bone: %s)\n", stringg, x, name, HoldingBones[PlayerToyInfo[playerid][x][ptBone]]);
			}
   			format(stringg, sizeof(stringg), "%s\n{40FFFF}Them slot toys {FFD700}(Credits: %s){A9C4E4}", stringg, number_format(ShopItems[28][sItemPrice]));
   			ShowPlayerDialog(playerid, EDITTOYS, DIALOG_STYLE_LIST, "Chon do choi", stringg, "Lua chon", "Thoat");
		}
	}
	return 1;
}