#include <YSI\y_hooks>
new DatBan;
new DangLamThucAn;
new LamThucAnObject;
new LamThucAn[MAX_PLAYERS];
new BanAn[13][6];
new AnThucAn[MAX_PLAYERS];
new BanAnObject[MAX_PLAYERS];
hook OnGameModeInit()
{
	DatBan = 0;
	DangLamThucAn = -1;
	for(new i = 0; i < 13; i++)
	{
		for(new j = 0; j < 6; j++)
		{
			BanAn[i][j] = -1;
		}
	}
	// dat ban thuc an
	CreateDynamic3DTextLabel("{ff0000}[GIAO DICH THUC AN]{ffff0f}\nNhan nut [{66ff66}ALT{ffff0f}] de giao dich",COLOR_YELLOW,1221.1368,-1433.3489,13.4437+0.6,10.0);
	datban_Actor = CreateActor(189,1221.2789,-1435.4408,13.4437,4.7600);
	SetActorPos(datban_Actor, 1221.2789,-1435.4408,13.4437);
	SetActorFacingAngle(datban_Actor, 4.7600);
		// lay thuc an
	CreatePickup(19133, 23, 1227.7736,-1435.1357,13.4437, -1); // Matrun 4 (pickup)// lay vat lieu o lv
	CreateDynamic3DTextLabel("{ff0000}[NHAN THUC AN]{ffff0f}\nNhan nut [{66ff66}ALT{ffff0f}] de nhan",COLOR_YELLOW,1227.7736,-1435.1357,13.4437+0.6,10.0);
	duathucan_Actor = CreateActor(205,1229.7100,-1435.4185,13.4437,93.4085);
	SetActorPos(duathucan_Actor, 1229.7100,-1435.4185,13.4437);
	SetActorFacingAngle(duathucan_Actor,93.4085);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_WALK)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1221.1368,-1433.3489,13.4437))
		{
			if(DatBan == 1)
			{
				return SendClientMessage(playerid, COLOR_GREY, "Co nguoi dang dat ban roi hay cho den luot minh.");
			}
			DatBan = 1;
			SetTimerEx("DatBanTime", 15000, 0, "i", playerid);
			SetActorPos(datban_Actor, 1221.2789,-1435.4408,13.4437);
			SetActorFacingAngle(datban_Actor, 4.7600);
			ApplyActorAnimation(datban_Actor, "PED", "IDLE_CHAT", 4.0, 1, 0, 0, 0, 0); // Pay anim
			new string[256];
			format(string,sizeof(string),"{fff41c}MUA PHIEU AN\t{20ff1c}$%s\t1 phieu\n\
				{7b42ff}GIAO CA\t{20ff1c}$800\t1 con", number_format(giaphieu_quanan));
			ShowPlayerDialog(playerid, DIALOG_GIAODICHTHUCAN, DIALOG_STYLE_TABLIST, "NHAN VIEN CUA HANG",
				string,
				"Dong Y", "Huy Bo");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1227.7736,-1435.1357,13.4437))
		{
			ShowPlayerDialog(playerid, DIALOG_NHANTHUCAN, DIALOG_STYLE_MSGBOX, "NHAN THUC AN", "{f5ee20}NHAN THUC AN {ffffff}ban se mat {84f542}1 phieu an\n{21ff60}Ban co muon nhan thuc an khong?", "Nhan", "Huy Bo");
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1221.4147,-1441.8804,14.1359))// ban 1
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[0][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[0][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN1, DIALOG_STYLE_TABLIST, "Ban An {ffff00}1",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		// 
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1221.0403,-1446.1029,14.1282))// ban 2
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[1][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[1][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN2, DIALOG_STYLE_TABLIST, "Ban An {ffff00}2",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1221.8643,-1450.6219,14.1282))// ban 3
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[2][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[2][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN3, DIALOG_STYLE_TABLIST, "Ban An {ffff00}3",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		// 
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1223.2312,-1456.2985,14.1359))// ban 4
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[3][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[3][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN4, DIALOG_STYLE_TABLIST, "Ban An {ffff00}4",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//  
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1226.8757,-1456.1276,14.1282))// ban 5
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[4][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[4][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN5, DIALOG_STYLE_TABLIST, "Ban An {ffff00}5",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//  
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1228.3478,-1459.9015,14.1359))// ban 6
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[5][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[5][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN6, DIALOG_STYLE_TABLIST, "Ban An {ffff00}6",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//  
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1225.5065,-1459.5660,14.1282))// ban 7
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[6][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[6][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN7, DIALOG_STYLE_TABLIST, "Ban An {ffff00}7",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//  
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1214.9641,-1446.3617,14.1359))// ban 8
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[7][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[7][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN8, DIALOG_STYLE_TABLIST, "Ban An {ffff00}8",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//  
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1215.6897,-1442.9562,14.1359))// ban 9
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[8][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[8][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN9, DIALOG_STYLE_TABLIST, "Ban An {ffff00}9",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//  
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1214.9038,-1439.8575,14.1282))// ban 10
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthais[12];
				trangthai = "Trong";
				trangthais = "Trong";
				if(BanAn[9][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[9][1] != -1)
				{
					trangthais = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s", trangthai,trangthais);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN10, DIALOG_STYLE_TABLIST, "Ban An {ffff00}10",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1215.0168,-1452.0581,14.2179))// ban 11
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthai1[12],trangthai2[12],trangthai3[12],trangthai4[12],trangthai5[12];
				trangthai = "Trong";
				trangthai1 = "Trong";
				trangthai2 = "Trong";
				trangthai3 = "Trong";
				trangthai4 = "Trong";
				trangthai5 = "Trong";
				if(BanAn[10][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[10][1] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[10][2] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[10][3] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[10][4] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[10][5] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s\n\
					{fff41c}Ghe 3\t%s\n\
					{fff41c}Ghe 4\t%s\n\
					{fff41c}Ghe 5\t%s\n\
					{fff41c}Ghe 6\t%s\n\
					", trangthai,trangthai1,trangthai2,trangthai3,trangthai4,trangthai5);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN11, DIALOG_STYLE_TABLIST, "Ban An {ffff00}11",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		// 
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1215.1375,-1458.1132,14.2179))// ban 12
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthai1[12],trangthai2[12],trangthai3[12],trangthai4[12],trangthai5[12];
				trangthai = "Trong";
				trangthai1 = "Trong";
				trangthai2 = "Trong";
				trangthai3 = "Trong";
				trangthai4 = "Trong";
				trangthai5 = "Trong";
				if(BanAn[11][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[11][1] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[11][2] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[11][3] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[11][4] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[11][5] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s\n\
					{fff41c}Ghe 3\t%s\n\
					{fff41c}Ghe 4\t%s\n\
					{fff41c}Ghe 5\t%s\n\
					{fff41c}Ghe 6\t%s\n\
					", trangthai,trangthai1,trangthai2,trangthai3,trangthai4,trangthai5);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN12, DIALOG_STYLE_TABLIST, "Ban An {ffff00}12",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1221.1820,-1460.5809,14.2179))// ban 13
		{
			if(PlayerInfo[playerid][pDangAn] == 0)
			{
				new stringf[128],trangthai[12],trangthai1[12],trangthai2[12],trangthai3[12],trangthai4[12],trangthai5[12];
				trangthai = "Trong";
				trangthai1 = "Trong";
				trangthai2 = "Trong";
				trangthai3 = "Trong";
				trangthai4 = "Trong";
				trangthai5 = "Trong";
				if(BanAn[11][0] != -1)
				{
					trangthai = "{ff0000}Day";
				}
				if(BanAn[11][1] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[11][2] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				if(BanAn[11][3] != -1)
				{
					trangthai1 = "{ff0000}Day";
				}
				
				format(stringf, sizeof(stringf), "{fff41c}Ghe 1\t%s\n\
					{fff41c}Ghe 2\t%s\n\
					{fff41c}Ghe 3\t%s\n\
					{fff41c}Ghe 4\t%s\n\
					", trangthai,trangthai1,trangthai2,trangthai3,trangthai4,trangthai5);
				ShowPlayerDialog(playerid, DIALOG_CHONBAN13, DIALOG_STYLE_TABLIST, "Ban An {ffff00}13",
					stringf,
					"Ngoi", "Huy Bo");
			}
			else
			{
				RoiBanAn(playerid);
			}
		}
		//                      
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_GIAODICHTHUCAN)
	{
		if(response)
		{
			if(listitem == 0)
			{
				new string[256];
				format(string,sizeof(string),"{f5ee20}PHIEU AN {ffffff}voi gia: {84f542}%s${ffffff}/phieu\n{21ff60}Ban co muon MUA khong?", number_format(giaphieu_quanan));
				ShowPlayerDialog(playerid, DIALOG_GIAODICHPHIEUAN, DIALOG_STYLE_MSGBOX, "MUA PHIEU AN", string, "Mua", "Huy Bo");
			}
			else if(listitem == 1)
			{
				ShowPlayerDialog(playerid, DIALOG_GIAODICHCA, DIALOG_STYLE_INPUT,"{ff0000}Giao Ca' cho cua hang","{FFFFFF}Hay nhap so luong CA' muon {FF0000}GIAO{FFFFFF} vao day.\ngia: {00FF00}$800 SAD/con{FFFFFF}.","Giao","Huy bo");
			}
		}
		else
		{
			ClearActorAnimations(datban_Actor);
			DatBan = 0;
		}
	}
	else if(dialogid == DIALOG_GIAODICHPHIEUAN)
	{
		if(response)
		{
			DatBan = 0;
			ClearActorAnimations(datban_Actor);
			if(PlayerInfo[playerid][pCash] < giaphieu_quanan)
			{
				return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua phieu thuc an.");
			}
			// Notify_Send(playerid, "+1 Phieu Thuc An", 1000);
			TinhToanNVChinh(playerid, 14);
			AddItem(playerid, ITEM_PHIEUAN, 1);
			new string[256];
			format(string,sizeof(string),"Ban da nhan duoc 1 phieu thuc an voi gia $%s, di nhan thuc an nao.", number_format(giaphieu_quanan));
			SendClientMessage(playerid, 0xfaff69FF, string);
			PlayerInfo[playerid][pCash] -= giaphieu_quanan;
			tienchuquan += giaphieu_quanan;
			new settien[256];
			format(settien, sizeof(settien),"UPDATE `dauthauquan` SET `sotien` = `sotien` + %d WHERE `id` = 1", giaphieu_quanan);
			mysql_query(MainPipeline, settien);
		}
		else
		{
			DatBan = 0;
			ClearActorAnimations(datban_Actor);
		}
	}
	else if(dialogid == DIALOG_GIAODICHCA)
	{
		if(response)
		{
			if(!IsNumeric(inputtext)) return ShowPlayerDialog(playerid, DIALOG_GIAODICHCA, DIALOG_STYLE_INPUT,"{ff0000}Giao Ca' cho cua hang","{FFFFFF}Hay nhap so luong CA' muon {FF0000}GIAO{FFFFFF} vao day.\ngia: {00FF00}$800 SAD/con{FFFFFF}.","Giao","Huy bo");
			new amount = strval(inputtext);
			new moneykaka = 800*amount;
			if(amount >= 1 && InventoryItemCheck(playerid, ITEM_FISH, amount) == 50) 
			{
				SendClientMessageEx(playerid,COLOR_LIGHTRED,"Ban khong du so CA' de GIAO !");
				ShowPlayerDialog(playerid, DIALOG_GIAODICHCA, DIALOG_STYLE_INPUT,"{ff0000}Giao Ca' cho cua hang","{FFFFFF}Hay nhap so luong CA' muon {FF0000}GIAO{FFFFFF} vao day.\ngia: {00FF00}$800 SAD/con{FFFFFF}.","Giao","Huy bo");
				return 1;
			}
			
			if(amount >= 1 )
			{
				new stringa[256];
				format(stringa,sizeof(stringa),"Ban da giao %d con ca cho cua hang va nhan duoc $%d .", amount, moneykaka);
				PlayerInfo[playerid][pCash] += moneykaka;
				DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_FISH, amount), amount);
				SendClientMessageEx(playerid, COLOR_LIGHTGREEN, stringa);
				new strings[64];
				format(strings, sizeof(strings), "+%d$", moneykaka);
				// Notify_Send(playerid, strings, 2000);
				SendClientMessageEx(playerid, COLOR_LIGHTGREEN, strings);
				DatBan = 0;
				ClearActorAnimations(datban_Actor);
			}
			else ShowPlayerDialog(playerid, DIALOG_GIAODICHCA, DIALOG_STYLE_INPUT,"{ff0000}Giao Ca' cho cua hang","{FFFFFF}So luong nhap phai lon hon {FF0000}0\n{FFFFFF}Hay nhap so luong CA' muon {FF0000}GIAO{FFFFFF} vao day.\ngia: {00FF00}$800 SAD/con{FFFFFF}.","Giao","Huy bo");
		}
		else
		{
			DatBan = 0;
			ClearActorAnimations(datban_Actor);
		}
	}
	else if(dialogid == DIALOG_NHANTHUCAN)
	{
		if(response)
		{
			if(DangLamThucAn != -1)
			{
				return SendClientMessage(playerid, COLOR_GREY, "Dau Bep dang lam thuc an cho nguoi khac, ban hay doi ti nhe.");
			}
			if(InventoryItemCheck(playerid, ITEM_PHIEUAN, 1) == 50)
			{
				return SendClientMessage(playerid, COLOR_GREY, "Ban can it nhat 1 phieu an.");
			}
			if(sothucan < 1) return SendClientMessage(playerid, COLOR_GREY, "Quan an da het thuc an, hay doi chu quan lam them thuc an.");
			LamThucAnObject = CreateObject(2221, 1228.9, -1435.47, 13.5637, 0.000, 0.000, 0.0000);
			// Notify_Send(playerid, "Dang lam phan an cho ban", 8000);
			SendClientMessage(playerid, COLOR_YELLOW, "Dang lam phan an cho ban.");
			DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_PHIEUAN, 1), 1);
			DangLamThucAn = playerid;
			SetActorPos(duathucan_Actor, 1229.7100,-1435.4185,13.4437);
			SetActorFacingAngle(duathucan_Actor,93.4085);
			ApplyActorAnimation(duathucan_Actor, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 0, 0); // Pay anim
			LamThucAn[playerid] =  SetTimerEx("LamThucAnTime", 10000, 0, "i", playerid);
			SetPlayerPos(playerid, 1227.9280,-1435.6244,13.4437);
			SetPlayerFacingAngle(playerid,276.5614);
			TogglePlayerControllable(playerid, false);
			sothucan--;
			new setthucan[128];
			format(setthucan, sizeof(setthucan),"UPDATE `dauthauquan` SET `sothucan` = `sothucan` - 1 WHERE `id` = 1");
			mysql_query(MainPipeline, setthucan);
			new stringtulanh[256];
			format(stringtulanh, sizeof(stringtulanh), "{ffff14}Tu lanh dang co {ff0000}%d/100 {ffff14}Thuc An", sothucan);
			UpdateDynamic3DTextLabelText(tulanhquanan_Text, 0xFFFFFFFF, stringtulanh);
			
		}
	}
	else if(dialogid == DIALOG_ROIBAN1)
	{
		if(response)
		{
			DeletePVar(playerid, "FixAntiMauGiap");
			PlayerInfo[playerid][pDangAn] = 0;
			PlayerInfo[playerid][pHanhDong] = 0;
			ClearAnimations(playerid);
			KillTimer(AnThucAn[playerid]);
			DestroyObject(BanAnObject[playerid]);
			if(IsPlayerAttachedObjectSlotUsed(playerid, 5))
		    {
		         RemovePlayerAttachedObject(playerid, 5);
		    }
			for(new i = 0; i < 13; i++)
			{
				for(new j = 0; j < 6; j++)
				{
					if(BanAn[i][j] == playerid)
					{
						BanAn[i][j] = -1;
						return 1;
					}
				}
			}
		}
	}
	else if(dialogid == DIALOG_CHONBAN1)
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[0][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1221.26, -1442.08, 13.2137, 0.000, 0.499999, 37.7);
						BanAn[0][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1220.8065,-1442.2988,11.8553);
						SetPlayerFacingAngle(playerid, 305.7713);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[0][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1221.84, -1441.94, 13.2237, 0.000, 0.000, 00.00);
						BanAn[0][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1222.4735,-1442.0229,11.8553);
						SetPlayerFacingAngle(playerid, 112.5128);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	else if(dialogid == DIALOG_CHONBAN2)//chon ban 2
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[1][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1221.35, -1446.15, 13.2137, 0.000, 0.0, 0.00);
						BanAn[1][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1221.7841,-1446.0012,11.8553);
						SetPlayerFacingAngle(playerid, 106.8497);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[1][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1220.78, -1446.33, 13.2437, 0.000, 0.000, 38.00);
						BanAn[1][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1220.3987,-1446.6674,11.8553);
						SetPlayerFacingAngle(playerid, 307.6775);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN3)//chon ban 3
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[2][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1221.84, -1450.44, 13.2238, 0.000, 0.0, 69.1);
						BanAn[2][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1222.1151,-1449.9354,11.8553);
						SetPlayerFacingAngle(playerid, 150.0183);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[2][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1221.77, -1450.983, 13.2137, 0.000, 0.000, 100.2);
						BanAn[2][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1221.9006,-1451.4860,13.0553);
						SetPlayerFacingAngle(playerid, 11.6894);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN4)//chon ban 4
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[3][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1223.48, -1456.06, 13.2138, 0.000, 0.0, 58.6);
						BanAn[3][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1223.7974,-1455.5781,13.0553);
						SetPlayerFacingAngle(playerid, 150.0184);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[3][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1223.41, -1456.6, 13.2137, 0.000, 0.000, 90.0);
						BanAn[3][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1223.4542,-1457.0968,13.0553);
						SetPlayerFacingAngle(playerid, 11.6906);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN5)//chon ban 5
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[4][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						
						BanAnObject[playerid] = CreateObject(2221, 1227.02, -1455.9, 13.2137, 0.000, 0.0, 57.9);
						BanAn[4][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1227.3016,-1455.4380,13.0553);
						SetPlayerFacingAngle(playerid, 153.4642);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[4][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1227, -1456.5, 13.2237, 0.000, 0.000, 90.0);
						BanAn[4][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1227.1332,-1456.9664,13.0553);
						SetPlayerFacingAngle(playerid, 11.6894);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN6)//chon ban 6
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[5][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1228.52, -1459.6, 13.2238, 0.000, 0.0, -110);
						BanAn[5][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1228.7488,-1459.1051,13.0553);
						SetPlayerFacingAngle(playerid, 148.3925);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[5][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1228.56, -1460.19, 13.2137, 0.000, 0.000, 90.0);
						BanAn[5][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1228.5099,-1460.7100,13.0553);
						SetPlayerFacingAngle(playerid, 21.6494);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN7)//chon ban 7
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[6][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1225.43, -1459.23, 13.2069, 0.000, 0.0, -92.5);
						BanAn[6][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1225.4285,-1458.7439,13.0553);
						SetPlayerFacingAngle(playerid, 176.3925);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[6][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1225.69, -1459.87, 13.2137, 0.000, 0.000, 119.8);
						BanAn[6][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1225.9727,-1460.2445,13.0553);
						SetPlayerFacingAngle(playerid, 37.7824);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN8)//chon ban 8
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[7][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.44, -1446.49, 13.2137, 0.000, 0.0, -172.3);
						BanAn[7][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1215.9663,-1446.5659,13.0553);
						SetPlayerFacingAngle(playerid, 84.3807);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[7][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1214.84, -1446.73, 13.2137, 0.000, 0.000, 27.9);
						BanAn[7][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1214.4302,-1447.0637,13.0553);
						SetPlayerFacingAngle(playerid, 305.7706);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN9)//chon ban 9
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[8][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.72, -1442.71, 13.2137, 0.000, 0.0, -114.5);
						BanAn[8][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1215.8936,-1442.2234,13.0553);
						SetPlayerFacingAngle(playerid, 167.7811);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[8][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.5, -1443.18, 13.2137, 0.000, 0.000, -144.3);
						BanAn[8][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1214.9965,-1443.5121,13.0553);
						SetPlayerFacingAngle(playerid, 308.0170);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN10)//chon ban 10
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[9][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.34, -1439.52, 13.2137, 0.000, 0.0, 0.00);
						BanAn[9][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1215.9019,-1439.5151,13.0553);
						SetPlayerFacingAngle(playerid, 107.9035);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[9][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1214.9, -1439.4, 13.2177, 0.000, 0.699998, 141.2);
						BanAn[9][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1214.1926,-1439.0483,13.0553);
						SetPlayerFacingAngle(playerid, 243.0548);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN11)//chon ban 11
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[10][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.38, -1451.19, 13.2937, 0.000, 0.0, 0.00);
						BanAn[10][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1216.2162,-1451.4052,13.8953);
						SetPlayerFacingAngle(playerid, 87.9365);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[10][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.37, -1452.05, 13.2853, 0.000, 0.00, 0.00);
						BanAn[10][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1216.3008,-1452.2898,13.8953);
						SetPlayerFacingAngle(playerid, 97.3366);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 2)
			{
				if(BanAn[10][2] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.35, -1453.05, 13.2853, 0.000, 0.00, 0.00);
						BanAn[10][2] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1216.2322,-1453.0527,13.8953);
						SetPlayerFacingAngle(playerid, 92.0099);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 3)
			{
				if(BanAn[10][3] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1214.87, -1451.15, 13.2853, 0.000, 0.00, 0.00);
						BanAn[10][3] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1214.1348,-1451.0663,13.8953);
						SetPlayerFacingAngle(playerid, 273.4317);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 4)
			{
				if(BanAn[10][4] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1214.81, -1452.08, 13.2853, 0.000, 0.00, 0.00);
						BanAn[10][4] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1214.2026,-1452.1910,13.8953);
						SetPlayerFacingAngle(playerid, 275.9384);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 5)
			{
				if(BanAn[10][5] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1214.84, -1453.05, 13.3008, -1.4, 1.40001, 179.7);
						BanAn[10][5] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1214.1525,-1453.2061,13.8953);
						SetPlayerFacingAngle(playerid, 273.7451);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN12)//chon ban 12
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[11][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.39, -1457.31, 13.2952, 0.000, 0.9, 0.799992);
						BanAn[11][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1216.4618,-1457.3700,13.8953);
						SetPlayerFacingAngle(playerid, 93.8900);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[11][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.4, -1458.25, 13.2937, 0.000, 0.00, 176);
						BanAn[11][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1216.5831,-1458.2634,13.8953);
						SetPlayerFacingAngle(playerid, 91.6966);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 2)
			{
				if(BanAn[11][2] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1215.34, -1459.37, 13.2937, 0.000, 0.00, 0.69998);
						BanAn[11][2] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1216.3427,-1459.1910,13.8953);
						SetPlayerFacingAngle(playerid, 100.1567);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 3)
			{
				if(BanAn[11][3] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1214.85, -1457.33, 13.2853, 0.000, 0.00, 0.00);
						BanAn[11][3] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1214.0160,-1457.2271,13.8953);
						SetPlayerFacingAngle(playerid, 274.9750);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 4)
			{
				if(BanAn[11][4] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1214.85, -1458.26, 13.3053, 0.000, 0.00, 0.00);
						BanAn[11][4] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1214.0757,-1458.3721,13.8953);
						SetPlayerFacingAngle(playerid, 272.7818);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 5)
			{
				if(BanAn[11][5] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1214.92, -1459.33, 13.2853, 0.000, 0.000, -178.9);
						BanAn[11][5] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1214.0928,-1459.4789,13.8953);
						SetPlayerFacingAngle(playerid, 264.9485);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//
	else if(dialogid == DIALOG_CHONBAN13)//chon ban 13
	{
		if(response)
		{
			if(listitem == 0)
			{
				if(BanAn[12][0] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1220.49, -1460.44, 13.2853, 0.000, 0.000, -92);
						BanAn[12][0] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1220.5320,-1459.5768,13.8953);
						SetPlayerFacingAngle(playerid, 182.5412);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 1)
			{
				if(BanAn[12][1] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1221.7, -1460.44, 13.2853, 0.000, 0.00, -88);
						BanAn[12][1] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1221.8185,-1459.5308,13.8953);
						SetPlayerFacingAngle(playerid, 196.6179);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 2)
			{
				if(BanAn[12][2] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1220.65, -1460.91, 13.2853, 0.000, 0.00, -94.9);
						BanAn[12][2] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1220.6528,-1461.3466,13.8953);
						SetPlayerFacingAngle(playerid, 0.4928);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}
			else if(listitem == 3)
			{
				if(BanAn[12][3] == -1)
				{
					if(PlayerInfo[playerid][pDangBungThucAn] == 0)
					{
						return SendClientMessage(playerid, COLOR_GREY, "Ban khong co thuc an, khong The ngoi ghe cua Quan An");
					}
					if(PlayerInfo[playerid][pDangAn] == 0)
					{
						BanAnObject[playerid] = CreateObject(2221, 1221.72, -1460.93, 13.2853, 0.000, 0.00, 88.6999);
						BanAn[12][3] = playerid;
						SetPVarInt(playerid, "FixAntiMauGiap", 1);
						SetPlayerPos(playerid, 1221.7753,-1461.5037,13.8953);
						SetPlayerFacingAngle(playerid, 339.4992);
						VoBanAn(playerid);
					}
				}
				else
				{
					return SendClientMessage(playerid, COLOR_GREY, "Ghe nay da co nguoi ngoi, xin vui long chon ghe khac");
				}
			}

		}
	}
	//                                                                                       
	return 1;
}
hook OnPlayerConnect(playerid)
{
	PlayerInfo[playerid][pDangBungThucAn] = 0;
	PlayerInfo[playerid][pDangAn] = 0;
	return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	if(GetPVarInt(playerid, "FixAntiMauGiap"))
	{
		DeletePVar(playerid, "FixAntiMauGiap");
	}
	KillTimer(AnThucAn[playerid]);
	DestroyObject(BanAnObject[playerid]);
	if(DangLamThucAn == playerid)
	{
		KillTimer(LamThucAn[playerid]);
		KetThucLamThucAn(playerid);
	}
	for(new i = 0; i < 13; i++)
	{
		for(new j = 0; j < 6; j++)
		{
			if(BanAn[i][j] == playerid)
			{
				BanAn[i][j] = -1;
				return 1;
			}
		}
	}
	return 1;
}
forward DatBanTime(playerid);
public DatBanTime(playerid)
{
	ClearActorAnimations(datban_Actor);
	DatBan = 0;
	return 1;
}
forward LamThucAnTime(playerid);
public LamThucAnTime(playerid)
{
	SetPlayerAttachedObject( playerid, 5, 2221, 6, 0.061454, 0.087104, -0.165424, 256.419097, 0.681838, 354.374084, 1.000000, 1.000000, 1.000000 ); // rustylow - nhan suat an
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	ClearAnimations(playerid);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 1);
	TogglePlayerControllable(playerid, true);
	// Notify_Send(playerid, "Ban da nhan duoc 1 Phan An", 10000);
	SendClientMessage(playerid, COLOR_YELLOW, "Ban da nhan duoc phan an, hay tim ghe ngoi de an di nao");
	PlayerInfo[playerid][pDangBungThucAn] = 1;
	KetThucLamThucAn(playerid);
	return 1;
}
forward AnThucAnTime(playerid);
public AnThucAnTime(playerid)
{
	if(PlayerInfo[playerid][pHungers] < 7000)
	{
		PlayerInfo[playerid][pHungers] += 60*2;
		// Notify_Send(playerid, "+2 phut Thuc An", 800);
		SetPlayerProgressBarValue(playerid, HungerBar[playerid], PlayerInfo[playerid][pHungers]);
	}
	else
	{
		// DestroyObject(BanAnObject[playerid]);
		KillTimer(AnThucAn[playerid]);
		if(IsPlayerAttachedObjectSlotUsed(playerid, 5))
	    {
	         RemovePlayerAttachedObject(playerid, 5);
	    }
	 //    SendClientMessage(playerid, COLOR_PURPLE, "Ban da an no bung, ui da qua.");
	 //    new szMessage[128];
	 //    format(szMessage, sizeof(szMessage), "* %s da an no bung, anh ay dang cam thay tran day suc song.", GetPlayerNameEx(playerid));
		// ProxDetector(25.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	}
	return 1;
}
forward SuaViTri(playerid);
public SuaViTri(playerid)
{
	SetPlayerVirtualWorld(playerid, 0);
	new Float:plocx,Float:plocy,Float:plocz;
	GetPlayerPos(playerid, plocx, plocy, plocz);
	foreach(new i:Player)
	{
		if(IsPlayerInRangeOfPoint(i, 100.0,  plocx, plocy, plocz))
		{
			
			Streamer_UpdateEx(i, plocx, plocy, plocz);
		}
	}
	
	ApplyAnimation(playerid, "FOOD", "FF_Sit_Eat2", 4.1, 1, 0, 0, 1, 0, 1);
	SetTimerEx("SuaNgoiAn", 1000, 0, "i", playerid);
	AnThucAn[playerid] = SetTimerEx("AnThucAnTime", 2000, 1, "i", playerid);
	return 1;
}
forward SuaNgoiAn(playerid);
public SuaNgoiAn(playerid)
{
	ApplyAnimation(playerid, "FOOD", "FF_Sit_Eat2", 4.1, 1, 0, 0, 1, 0, 1);
	ApplyAnimation(playerid, "FOOD", "FF_Sit_Eat2", 4.1, 1, 0, 0, 1, 0, 1);
	foreach(new i:Player)
	{
		if(PlayerInfo[i][pDangAn] == 1)
		{
			if(IsPlayerInRangeOfPoint(i, 50.0, 1221.4813,-1452.6875,13.4437))
			{
				ApplyAnimation(i, "FOOD", "FF_Sit_Eat2", 4.1, 1, 0, 0, 1, 0, 1);
				ApplyAnimation(i, "FOOD", "FF_Sit_Eat2", 4.1, 1, 0, 0, 1, 0, 1);
				return 1;
			}
		}	
	}
	return 1;
}
KetThucLamThucAn(playerid)
{
	DangLamThucAn = -1;
	ClearActorAnimations(duathucan_Actor);
	DestroyObject(LamThucAnObject);
	return 1;
}
VoBanAn(playerid)
{
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    if(IsPlayerAttachedObjectSlotUsed(playerid, 5))
    {
         RemovePlayerAttachedObject(playerid, 5);
    }
    SetPlayerAttachedObject( playerid, 5, 2703, 6, 0.106552, 0.025530, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 ); // CJ_BURG_1 - hamberger
    PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
    ClearAnimations(playerid);
    PlayerInfo[playerid][pHanhDong] = 1;
    PlayerInfo[playerid][pDangAn] = 1;
    PlayerInfo[playerid][pDangBungThucAn] = 0;
    SetPlayerVirtualWorld(playerid, 1);
    SetTimerEx("SuaViTri", 1000, 0, "i", playerid);
			
	return 1;
}
RoiBanAn(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_ROIBAN1, DIALOG_STYLE_MSGBOX, "Roi khoi ban", "{FFFFFF}Ban co muon \n{fdffb5}Roi Khoi Ban An{ffffff} khong?", "Roi Khoi", "Huy Bo");
	return 1;
}