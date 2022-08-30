/*
	Job Ngư Dân V1.0
	*enum pinfo
	pCa, (Save SQL)
*/

#include <YSI\y_hooks>
new Text:NguDan_TD[1];
new PlayerBar:Bar_NguDan[MAX_PLAYERS];
new ND_DangThaLuoi[MAX_VEHICLES];
new ND_PlayerThaLuoi[MAX_PLAYERS];
new NguDan_Zone;
hook OnGameModeInit() {
	for(new i = 0; i < MAX_VEHICLES; i++)
	{
		ND_DangThaLuoi[i] = INVALID_PLAYER_ID;
	}
	NguDan_Zone = GangZoneCreate(256.9133, -2814.368, 794.0955, -2347.253);
	NguDan_TD[0] = TextDrawCreate(326.599761, 390.599884, "DANG THA LUOI ....");
	TextDrawLetterSize(NguDan_TD[0], 0.229666, 0.977777);
	TextDrawAlignment(NguDan_TD[0], 3);
	TextDrawColor(NguDan_TD[0], -1);
	TextDrawSetShadow(NguDan_TD[0], 0);
	TextDrawSetOutline(NguDan_TD[0], 0);
	TextDrawBackgroundColor(NguDan_TD[0], 255);
	TextDrawFont(NguDan_TD[0], 2);
	TextDrawSetProportional(NguDan_TD[0], 1);
	TextDrawSetShadow(NguDan_TD[0], 0);
	return 1;
}
hook OnPlayerConnect(playerid) {
	Bar_NguDan[playerid] = CreatePlayerProgressBar(playerid, 245.000000, 401.000000, 151.000000, 11.199999, 869072810, 100.0000, 0);
	ND_PlayerThaLuoi[playerid] = INVALID_PLAYER_ID;
	return 1;
}
hook OnPlayerDisconnect(playerid, reason){
	if(ND_PlayerThaLuoi[playerid] != INVALID_PLAYER_ID) EndThaLuoi(playerid);
	return 1;
}
hook OnPlayerSpawn(playerid) {
	GangZoneShowForPlayer(playerid, NguDan_Zone, 0x00000096);
	return 1;
}
EndThaLuoi(playerid){
	ND_DangThaLuoi[ND_PlayerThaLuoi[playerid]] = INVALID_PLAYER_ID;
	ND_PlayerThaLuoi[playerid] = INVALID_PLAYER_ID;
	HidePlayerProgressBar(playerid, Bar_NguDan[playerid]);
	TextDrawHideForPlayer(playerid, NguDan_TD[0]);
	return 1;
}
timer ThaLuoi[50000](playerid) {
	if(!IsPlayerInGangZone(playerid, NguDan_Zone))
	{
		SendClientMessage(playerid, COLOR_RED, "[NGU DAN] Ban da roi khoi khu vuc tha luoi");
		EndThaLuoi(playerid);
		return 1;
	}
	if(InventoryItemCheck(playerid, ITEM_FISH, 100) == 50)
	{
		new strings[64];
		new render = Random(1,5);
		format(strings, sizeof(strings), "+%i con ca", render);
		Notify_Send(playerid, strings, 1000);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, strings);
		AddItem(playerid, ITEM_FISH, render);
		new slotid = InventoryItemCheck(playerid, ITEM_FISH, 1);
		SetPlayerProgressBarValue(playerid, Bar_NguDan[playerid], PlayerInfo[playerid][pInvAmount][slotid]);
		defer ThaLuoi(playerid);
		TinhToanNVChinh(playerid, 23);
	}
	else if(InventoryItemCheck(playerid, ITEM_FISH, 100) != 50)
	{
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban da tha luoi du 100 con ca hay dem di ban");
		EndThaLuoi(playerid);
	}
	return 1;
}
CMD:thaluoi(playerid, params[]) {
	if(PlayerInfo[playerid][pHungers] <= 0)
	{
		return SendClientMessage(playerid, COLOR_GREY, "Ban doi bung khong the lam viec hay den cua hang {ff0000}Y > {ff0000}Tim Duong{afafaf} > {ff0000}CircleK {afafaf}hoac di {ff0000}Cau Ca.");
	}
	new Vehicle_ID = GetPlayerVehicleID(playerid);
	if(GetVehicleModel(Vehicle_ID) != 453) return SendClientMessage(playerid, COLOR_WHITE, "Ban phai ngoi tren thuyen danh ca (Reefer)");
	if(ND_DangThaLuoi[Vehicle_ID] != INVALID_VEHICLE_ID) return SendClientMessage(playerid, COLOR_WHITE, "Thuyen nay dang co nguoi tha luoi roi");
	if(ND_PlayerThaLuoi[playerid] != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_WHITE, "Ban dang tha luoi roi");
	if(!IsPlayerInGangZone(playerid, NguDan_Zone)) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong o trong khu vuc tha luoi hay bat map len va di den vi tri tha luoi");
	if(InventoryItemCheck(playerid, ITEM_FISH, 100) != 50) return SendClientMessage(playerid, COLOR_WHITE, "Ban da chua du so luong ca roi");
	ND_DangThaLuoi[Vehicle_ID] = playerid;
	ND_PlayerThaLuoi[playerid] = Vehicle_ID;
	new slotid = InventoryItemCheck(playerid, ITEM_FISH, 1);
	if(InventoryItemCheck(playerid, ITEM_FISH, 1) != 50) 
	{
		SetPlayerProgressBarValue(playerid, Bar_NguDan[playerid], PlayerInfo[playerid][pInvAmount][slotid]);
	}
	else SetPlayerProgressBarValue(playerid, Bar_NguDan[playerid], 0);
	ShowPlayerProgressBar(playerid, Bar_NguDan[playerid]);
	TextDrawShowForPlayer(playerid, NguDan_TD[0]);
	defer ThaLuoi(playerid);
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_WALK)
	{
	// ban ca
		if(IsPlayerInRangeOfPoint(playerid, 3, 380.0632,-2034.6177,7.8301))
		{
			if(PlayerInfo[playerid][pFMember] == idgangchoca)
			{
				ShowPlayerDialog(playerid, DIALOG_BANCALS, DIALOG_STYLE_INPUT,"{ff0000}Ban CA'","{FFFFFF}Hay nhap so luong CA' muon {FF0000}BAN{FFFFFF} vao day.\ngia: {00FF00}$400 SAD/con{FFFFFF}.","BAN","Huy bo");
			}
			else
			{
				ShowPlayerDialog(playerid, DIALOG_BANCALS, DIALOG_STYLE_INPUT,"{ff0000}Ban CA'","{FFFFFF}Hay nhap so luong CA' muon {FF0000}BAN{FFFFFF} vao day.\ngia: {00FF00}$200 SAD/con{FFFFFF}.","BAN","Huy bo");
			}
			
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_ANCA)
	{
		if(response)
		{
			if(PlayerInfo[playerid][pHungers] < 1800)
			{
				PlayerInfo[playerid][pHungers] += 60*2;
				SetPlayerProgressBarValue(playerid, HungerBar[playerid], PlayerInfo[playerid][pHungers]);
				// Notify_Send(playerid, "+2 Thuc An", 1000);
				SendClientMessage(playerid, COLOR_YELLOW, "+2 Thuc An");
				PlayAnimEx(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0, 1);
				new	slotid = InventoryItemCheck(playerid, ITEM_FISH, 1);
				DeleteItem(playerid, slotid, 1);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Ban chi an thuc an mang theo den day thoi. ");
				SendClientMessage(playerid, COLOR_WHITE, "Muon an no bung hay den quan an {FF0000}Y {FFFFFF}>{FF0000} Tim Duong {FFFFFF}>{FF0000} Quan An. ");
			}
			
		}
	}
	if(dialogid == DIALOG_BANCALS)
	{
		if(response)
		{
		    if(!IsNumeric(inputtext)) return ShowPlayerDialog(playerid, DIALOG_BANCALS, DIALOG_STYLE_INPUT,"{ff0000}Ban CA'","{FFFFFF}Hay nhap so luong CA' muon {FF0000}BAN{FFFFFF} vao day.\ngia: {00FF00}$500 SAD/con{FFFFFF}.","BAN","Huy bo");
			new amount = strval(inputtext);
			new moneykaka = 200*amount;
			if(PlayerInfo[playerid][pFMember] == idgangchoca)
			{
				moneykaka = 400*amount;
			}
			
			
			if(amount >= 1 && InventoryItemCheck(playerid, ITEM_FISH, amount) == 50) 
			{
				SendClientMessageEx(playerid,COLOR_LIGHTRED,"Ban khong du so CA' de BAN' !");
				if(PlayerInfo[playerid][pFMember] == idgangchoca)
				{
					ShowPlayerDialog(playerid, DIALOG_BANCALS, DIALOG_STYLE_INPUT,"{ff0000}Ban CA'","{FFFFFF}Hay nhap so luong CA' muon {FF0000}BAN{FFFFFF} vao day.\ngia: {00FF00}$400 SAD/con{FFFFFF}.","BAN","Huy bo");
				}
				else
				{
					ShowPlayerDialog(playerid, DIALOG_BANCALS, DIALOG_STYLE_INPUT,"{ff0000}Ban CA'","{FFFFFF}Hay nhap so luong CA' muon {FF0000}BAN{FFFFFF} vao day.\ngia: {00FF00}$200 SAD/con{FFFFFF}.","BAN","Huy bo");
				}
				
				return 1;
			}
			
			if(amount >= 1 )
			{
				new stringa[256];
				format(stringa,sizeof(stringa),"Ban da ban %d con ca voi gia $%d .", amount, moneykaka);
				PlayerInfo[playerid][pCash] += moneykaka;
				DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_FISH, amount), amount);
				SendClientMessageEx(playerid, COLOR_LIGHTGREEN, stringa);
				new strings[64];
				format(strings, sizeof(strings), "+%d$", moneykaka);
				// Notify_Send(playerid, strings, 2000);
				SendClientMessage(playerid, COLOR_YELLOW, strings);
				
			}
			else {
				if(PlayerInfo[playerid][pFMember] == idgangchoca)
				{
					ShowPlayerDialog(playerid, DIALOG_BANCALS, DIALOG_STYLE_INPUT,"{ff0000}Ban CA'","{FFFFFF}Hay nhap so luong CA' muon {FF0000}BAN{FFFFFF} vao day.\ngia: {00FF00}$400 SAD/con{FFFFFF}.","BAN","Huy bo");
				}
				else
				{
					ShowPlayerDialog(playerid, DIALOG_BANCALS, DIALOG_STYLE_INPUT,"{ff0000}Ban CA'","{FFFFFF}Hay nhap so luong CA' muon {FF0000}BAN{FFFFFF} vao day.\ngia: {00FF00}$200 SAD/con{FFFFFF}.","BAN","Huy bo");
				}
			}
		}
	}
	return 1;
}