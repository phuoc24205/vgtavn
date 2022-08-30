#include <YSI\y_hooks>

new LoNung;
new DaMaiSat;
new CucSatNung;
new CucDongNung;
new CucSatRen[MAX_PLAYERS];
new CucDongRen[MAX_PLAYERS];
new KhoiXH;
new CaybuaXH;
new LuaRenXH;
hook OnGameModeInit()
{
	LoNung = 0;
	CreateDynamic3DTextLabel("{FF0000}[Lo Nung]\n{ffd91c}duoc nhap khau tu Japan\n{f74d99}[ALT] {FFFFFF}de nung", -1, 214.8980,-224.2433,3.5750,8.0);
	CreateDynamic3DTextLabel("{FF0000}[Da' Mai` Kim]\n{ffd91c}Duoc nhap khau tu Japan\n{f74d99}[ALT] {FFFFFF}de mai` kim.", -1, 220.7129,-227.1111,3.4691,8.0);
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsPlayerInRangeOfPoint(playerid, 1.0, 215.0433,-226.1522,1.7786))
	{
		if(newkeys & KEY_WALK)
		{
			if(GetPVarInt(playerid, "BatDauNungTime")) return SendClientMessage(playerid, COLOR_GREY, "Ban dang nung roi, hay nung xong cai nay da.");
			if(PlayerInfo[playerid][pDangNung] != 0) return SendClientMessage(playerid, COLOR_GREY, "Ban dang nung 1 loai kim loai nao do roi.");
			ShowPlayerDialog(playerid, DIALOG_LOLUYENKIM, DIALOG_STYLE_TABLIST,"Ban muon luyen gi ?", 
					"Nung {ffa3f0}Cuc Sat\t{5ed1ff}(can 25 cuc Sat)\n\
					Nung {c16bff}Cuc Dong\t{eba400}(can 15 cuc Dong)\n\
					", "Chon", "Huy Bo");//
			// ShowPlayerDialog(playerid, DIALOG_LOLUYENKIM, DIALOG_STYLE_TABLIST,"Ban muon luyen gi ?", 
			// 		"{ffa3f0}Xeng\t{5ed1ff}(de dao kho bau tai Dao Dau Lau)\t Can 25 cuc Sat\n
			// 		{c16bff}Chia Khoa\t{eba400}(de Cuop Tap Hoa, Cuop Xe, mo Hop Kho Bau)\t Can 25 cuc Dong\n
			// 		{f7d37e}Bua\t{f9ff47}(de dap cua kinh Cuop Tiem Vang)\t Can 50 cuc Sat\n
			// 		", "Chon", "Huy Bo");//
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid, 1.0, 219.9101,-227.1319,1.7786))
	{
		if(newkeys & KEY_WALK)
		{
			ShowPlayerDialog(playerid, DIALOG_MAYRENKIM, DIALOG_STYLE_TABLIST,"Ban muon luyen gi ?", 
			"San pham\t            Cong dung\tTi le thanh cong\n\
			{ffa3f0}Xeng\t{5ed1ff}(de dao kho bau tai Dao Dau Lau)\t     40%\n\
			{c16bff}Chia Khoa\t{eba400}(de Cuop Tap Hoa, Cuop Xe, mo Hop Kho Bau)\t     75%\n\
			{f7d37e}Bua\t{f9ff47}(de dap cua kinh Cuop Tiem Vang)\t     20%\n\
			", "Chon", "Huy Bo");//
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_LOLUYENKIM)
	{
		if(response)
		{
			if(LoNung == 1) return SendClientMessage(playerid, COLOR_GREY, "May nung nay dang co nguoi khac dung, hay doi den luot ban.");
			switch(listitem)
			{
				case 0:
				{
					if(InventoryItemCheck(playerid, ITEM_SAT, 25) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 25 Cuc Sat de Luyen thanh cai xeng");
					new	slotid = InventoryItemCheck(playerid, ITEM_SAT, 25);
					DeleteItem(playerid, slotid, 25);
					SetPVarInt(playerid, "BatDauNungTime", 30);
					SetTimerEx("BatDauNung", 1000, false, "ii", playerid,listitem);
					CucSatNung = CreateObject(3930, 215.141, -224.782, 2.38862, 0.0000, 0.0000, 0.0000); //PointLight13
					PlayerInfo[playerid][pHanhDong] = 1;
					SetPlayerPos(playerid, 215.0365,-225.9842,1.7786);
					SetPlayerFacingAngle(playerid, 1.6812);
					PreloadAnimLib(playerid, "BD_FIRE");
					ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 1, 0, 1);
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					LoNung = 1;
					return 1;
				}
				case 1:
				{
					if(InventoryItemCheck(playerid, ITEM_DONG, 15) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 15 Cuc Dong de Luyen thanh chia khoa");
					new	slotid = InventoryItemCheck(playerid, ITEM_DONG, 15);
					DeleteItem(playerid, slotid, 15);
					SetPVarInt(playerid, "BatDauNungTime", 30);
					SetTimerEx("BatDauNung", 1000, false, "ii", playerid,listitem);
					CucDongNung = CreateObject(2936, 215.141, -224.782, 2.38862, 0.0000, 0.0000, 0.0000); //PointLight13
					PlayerInfo[playerid][pHanhDong] = 1;
					SetPlayerPos(playerid, 215.0365,-225.9842,1.7786);
					SetPlayerFacingAngle(playerid, 1.6812);
					PreloadAnimLib(playerid, "BD_FIRE");
					ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 1, 0, 1);
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					
					LoNung = 1;
					return 1;
				}
				// case 2:
				// {
				// 	if(InventoryItemCheck(playerid, ITEM_SAT, 50) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 50 Cuc Sat de Luyen thanh cai bua");
				// 	new	slotid = InventoryItemCheck(playerid, ITEM_SAT, 50);
				// 	DeleteItem(playerid, slotid, 50);
				// 	SetPVarInt(playerid, "BatDauNungTime", 30);
				// 	SetTimerEx("BatDauNung", 1000, false, "ii", playerid,listitem);
				// 	CucSatNung = CreateObject(3930, 215.141, -224.782, 2.38862, 0.0000, 0.0000, 0.0000); //PointLight13
				// 	PlayerInfo[playerid][pHanhDong] = 1;
				// 	SetPlayerPos(playerid, 215.0365,-225.9842,1.7786);
				// 	SetPlayerFacingAngle(playerid, 1.6812);
				// 	PreloadAnimLib(playerid, "BD_FIRE");
				// 	ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 1, 0, 1);
				// 	PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					
				// 	LoNung = 1;
				// 	return 1;
				// }
			}
		}
		
	}
	else if(dialogid == DIALOG_MAYRENKIM)
	{
		if(response)
		{
			if(DaMaiSat == 1) return SendClientMessage(playerid, COLOR_GREY, "Dang co nguoi dang dung Da' Ren`, xin vui long cho doi.");
			switch(listitem)
			{
				case 0:
				{
					ShowPlayerDialog(playerid, DIALOG_MAYRENKIM, DIALOG_STYLE_TABLIST,"Ban muon luyen gi ?", 
					"San pham\t            Cong dung\tTi le thanh cong\n\
					{ffa3f0}Xeng\t{5ed1ff}(de dao kho bau tai Dao Dau Lau)\t     40%\n\
					{c16bff}Chia Khoa\t{eba400}(de Cuop Tap Hoa, Cuop Xe, mo Hop Kho Bau)\t     75%\n\
					{f7d37e}Bua\t{f9ff47}(de dap cua kinh Cuop Tiem Vang)\t     20%\n\
					", "Chon", "Huy Bo");//
				
				}
				case 1:
				{
					if(PlayerInfo[playerid][pDangNung] != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban phai nung cuc Sat moi ren cay Xeng duoc.");
					if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
					SetPlayerAttachedObject( playerid, 1, 19631, 6, 0.070999, 0.040999, 0.167, 2.9, 83.4, -85.2999, 1, 1, 1);
					CucSatRen[playerid] = CreateObject(3930, 220.947, -227.15, 1.09862, 0.0000, 0.0000, 0.0000); //PointLight13
					KhoiXH = CreateObject(18704, 220.703, -227.126, -0.39138, 0.0000, 0.0000, 0.0000); //khoixh
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					SetPlayerPos(playerid, 219.5958,-227.3057,1.7786);
					SetPlayerFacingAngle(playerid, 273.6580);
					ApplyAnimation(playerid, "BASEBALL", "Bat_4", 4.1, 1, 0, 0, 1, 0, 1);
					DaMaiSat = 1;
					SetPVarInt(playerid, "DaMaiKimTime", 15);
					SetTimerEx("DaMaiKim", 1000, false, "ii", playerid, listitem);
				}
				case 2:
				{
					if(PlayerInfo[playerid][pDangNung] != 2) return SendClientMessage(playerid, COLOR_GREY, "Ban phai nung cuc Dong moi ren Chia Khoa duoc.");
					if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
					SetPlayerAttachedObject( playerid, 1, 19631, 6, 0.070999, 0.040999, 0.167, 2.9, 83.4, -85.2999, 1, 1, 1);
					CucDongRen[playerid] = CreateObject(2936, 220.876, -227.103, 1.16445, 0.0000, 0.0000, 0.0000); //PointLight13
					KhoiXH = CreateObject(18704, 220.703, -227.126, -0.39138, 0.0000, 0.0000, 0.0000); //khoixh
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					SetPlayerPos(playerid, 219.5958,-227.3057,1.7786);
					SetPlayerFacingAngle(playerid, 273.6580);
					ApplyAnimation(playerid, "BASEBALL", "Bat_4", 4.1, 1, 0, 0, 1, 0, 1);
					DaMaiSat = 1;
					SetPVarInt(playerid, "DaMaiKimTime", 15);
					SetTimerEx("DaMaiKim", 1000, false, "ii", playerid, listitem);
				}
				case 3:
				{
					if(PlayerInfo[playerid][pDangNung] != 1) return SendClientMessage(playerid, COLOR_GREY, "Ban phai nung cuc Sat moi ren cay Bua duoc.");
					if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
					SetPlayerAttachedObject( playerid, 1, 19631, 6, 0.070999, 0.040999, 0.167, 2.9, 83.4, -85.2999, 1, 1, 1);
					CucSatRen[playerid] = CreateObject(3930, 220.947, -227.15, 1.09862, 0.0000, 0.0000, 0.0000); //PointLight13
					KhoiXH = CreateObject(18704, 220.703, -227.126, -0.39138, 0.0000, 0.0000, 0.0000); //khoixh
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					SetPlayerPos(playerid, 219.5958,-227.3057,1.7786);
					SetPlayerFacingAngle(playerid, 273.6580);
					ApplyAnimation(playerid, "BASEBALL", "Bat_4", 4.1, 1, 0, 0, 1, 0, 1);
					DaMaiSat = 1;
					SetPVarInt(playerid, "DaMaiKimTime", 15);
					SetTimerEx("DaMaiKim", 1000, false, "ii", playerid, listitem);
				}
			}
		}
	}
	return 1;
}

forward BatDauNung(playerid, item);
public BatDauNung(playerid, item)
{
	if(GetPVarInt(playerid, "BatDauNungTime") > 0)
	{
		SetPVarInt(playerid, "BatDauNungTime", GetPVarInt(playerid, "BatDauNungTime") - 1);
		new string[128];
		format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%d giay con lai", GetPVarInt(playerid, "BatDauNungTime"));
		GameTextForPlayer(playerid, string, 1100, 3);
		SetTimerEx("BatDauNung", 1000, false, "ii",playerid, item);
	}
	else
	{
		switch(item)
		{
			case 0:
			{
				
				new szMessage[128];
				SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban da nung xong cuc Sat, hay di ren kim di nao.");
			    format(szMessage, sizeof(szMessage), "* %s da nung xong cuc Sat.", GetPlayerNameEx(playerid));
				ProxDetector(50.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				ClearAnimations(playerid);
				LoNung = 0;
				DestroyObject(CucSatNung);
				SetPlayerAttachedObject( playerid, 1, 3930, 6, 0.102374, 0.056051, -0.218629, 0.000000, 0.000000, 0.000000, 0.384645, 0.455856, 0.644288 );
				PlayerInfo[playerid][pDangNung] = 1;
				PreloadAnimLib(playerid, "CARRY");
                ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 1);
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Hay mang cuc Sat di ren kim", 7000, 1);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
				return 1;
			}
			case 1:
			{
				// AddItem(playerid, ITEM_CHIAKHOA, 1);
				new szMessage[128];
				SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban da nung xong cuc Dong, hay di ren kim di nao.");
			    format(szMessage, sizeof(szMessage), "* %s da nung xong cuc Dong.", GetPlayerNameEx(playerid));
				ProxDetector(50.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				ClearAnimations(playerid);
				LoNung = 0;
				DestroyObject(CucDongNung);
				SetPlayerAttachedObject( playerid, 1, 2936, 6, 0.095367, 0.042951, -0.177656, 335.583526, 273.362487, 0.000000, 0.389910, 0.187549, 0.339251 ); // kmb_rock - cuc dong
				PlayerInfo[playerid][pDangNung] = 2;
				PreloadAnimLib(playerid, "CARRY");
                ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 1);
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Hay mang cuc Dong di ren kim", 7000, 1);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
				return 1;
			}
			case 2:
			{
				new szMessage[128];
				SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban da luyen thanh cong cay Bua.");
			    format(szMessage, sizeof(szMessage), "* %s da luyen thanh cong cay Bua, qua la thien tai.", GetPlayerNameEx(playerid));
				ProxDetector(50.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				PlayerInfo[playerid][pHanhDong] = 0;
				ClearAnimations(playerid);
				LoNung = 0;
				DestroyObject(CucSatNung);
				return 1;
			}
		}
	}
	return 1;
}
forward DaMaiKim(playerid, item);
public DaMaiKim(playerid, item)
{
	if(GetPVarInt(playerid, "DaMaiKimTime") > 0)
	{
		SetPVarInt(playerid,"DaMaiKimTime", GetPVarInt(playerid, "DaMaiKimTime") - 1);
		new string[128];
		format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Dang dap %d giay con lai", GetPVarInt(playerid, "DaMaiKimTime"));
		GameTextForPlayer(playerid, string, 1100, 3);
		SetTimerEx("DaMaiKim", 1000, false, "ii", playerid, item);
	}
	else
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
		if(item == 1 )
		{
			DestroyObject(CucSatRen[playerid]);
			DestroyObject(KhoiXH);
			CucSatRen[playerid] = CreateObject(2237, 220.697, -226.565, 1.36293, -86.7, 0.0000, 4.6); //PointLight13
			CaybuaXH = CreateDynamicObject(19631, 220.4452, -227.0062, 1.4358, 11.8999, 0.0000, 54.4999);
			LuaRenXH = CreateObject(18717, 220.777, -227.43, -0.48138, 0, 0, 0);
			SetPlayerPos(playerid, 219.9727,-227.2495,1.7786);
			SetPlayerFacingAngle(playerid, 270.7737);
		}
		else if(item == 2)
		{
			DestroyObject(CucDongRen[playerid]);
			DestroyObject(KhoiXH);
			CucDongRen[playerid] = CreateObject(2680, 220.75, -227.246, 1.31465, -44.2, -10.6, 1.2); //PointLight13
			CaybuaXH = CreateDynamicObject(19631, 220.4452, -227.0062, 1.4358, 11.8999, 0.0000, 54.4999);
			LuaRenXH = CreateObject(18717, 220.777, -227.43, -0.48138, 0, 0, 0);
			SetPlayerPos(playerid, 219.9727,-227.2495,1.7786);
			SetPlayerFacingAngle(playerid, 270.7737);
		}
		else if(item == 3)
		{
			DestroyObject(CucSatRen[playerid]);
			DestroyObject(KhoiXH);
			CucSatRen[playerid] = CreateObject(18635, 220.748, -227.15, 1.31405, -83.5, -176.3, 8.4); //PointLight13
			CaybuaXH = CreateDynamicObject(19631, 220.4452, -227.0062, 1.4358, 11.8999, 0.0000, 54.4999);
			LuaRenXH = CreateObject(18717, 220.777, -227.43, -0.48138, 0, 0, 0);
			SetPlayerPos(playerid, 219.9727,-227.2495,1.7786);
			SetPlayerFacingAngle(playerid, 270.7737);
		}
		DeletePVar(playerid, "DaMaiKimTime");
		PreloadAnimLib(playerid,"BOMBER");
        ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 0, 0, 0, 0, 1);
		SetPVarInt(playerid,"DaMaiKimTime2", 15);
		SetTimerEx("DaMaiKim2", 1000, false, "ii", playerid, item);
	}
	return 1;
}
forward DaMaiKim2(playerid, listitem);
public DaMaiKim2(playerid, listitem)
{
	if(GetPVarInt(playerid, "DaMaiKimTime2") > 0)
	{
		SetPVarInt(playerid,"DaMaiKimTime2", GetPVarInt(playerid, "DaMaiKimTime2") - 1);
		new string[128];
		format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Dang Ren %d giay con lai", GetPVarInt(playerid, "DaMaiKimTime2"));
		GameTextForPlayer(playerid, string, 1100, 3);
		SetTimerEx("DaMaiKim2", 1000, false, "ii", playerid, listitem);
	}
	else
	{
		new rand = random(100);
		if(listitem == 1)
		{
			switch(rand)
			{
				case 0..60:
				{
					new szMessage[128];
					SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban da ren luyen thanh cong cay Xeng, hay di dao kho bau nao. Tui do (H).");
				    format(szMessage, sizeof(szMessage), "* %s da ren thanh cong cay Xeng.", GetPlayerNameEx(playerid));
					ProxDetector(50.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					ClearAnimations(playerid);
					DaMaiSat = 0;
					PlayerInfo[playerid][pHanhDong] = 0;
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					DestroyDynamicObject(CaybuaXH);
					DestroyObject(LuaRenXH);
					DestroyObject(CucSatRen[playerid]);
					PlayerInfo[playerid][pDangNung] = 0;
					AddItem(playerid, ITEM_XENG, 1);
					TinhToanNVChinh(playerid, 21);
				}
				default:
				{
					SendClientMessageEx(playerid, COLOR_GREY, "Ban da ren luyen that bai, dung nan. Co cong mai sat co ngay nen kim !!!");
					ClearAnimations(playerid);
					DaMaiSat = 0;
					PlayerInfo[playerid][pHanhDong] = 0;
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					DestroyDynamicObject(CaybuaXH);
					DestroyObject(LuaRenXH);
					PlayerInfo[playerid][pDangNung] = 0;
					DestroyObject(CucSatRen[playerid]);
				}
			}
		}
		if(listitem == 2)
		{
			switch(rand)
			{
				case 0..74:
				{
					new szMessage[128];
					SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban da ren luyen thanh cong chiec chia khoa, hay kiem tra Tui do (H).");
				    format(szMessage, sizeof(szMessage), "* %s da ren thanh cong chia khoa.", GetPlayerNameEx(playerid));
					ProxDetector(50.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					ClearAnimations(playerid);
					DaMaiSat = 0;
					PlayerInfo[playerid][pHanhDong] = 0;
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					DestroyDynamicObject(CaybuaXH);
					DestroyObject(LuaRenXH);
					DestroyObject(CucDongRen[playerid]);
					PlayerInfo[playerid][pDangNung] = 0;
					AddItem(playerid, ITEM_CHIAKHOA, 1);
				}
				default:
				{
					SendClientMessageEx(playerid, COLOR_GREY, "Ban da ren luyen that bai, dung nan. Co cong mai sat co ngay nen kim !!!");
					ClearAnimations(playerid);
					DaMaiSat = 0;
					PlayerInfo[playerid][pHanhDong] = 0;
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					DestroyDynamicObject(CaybuaXH);
					DestroyObject(LuaRenXH);
					PlayerInfo[playerid][pDangNung] = 0;
					DestroyObject(CucSatRen[playerid]);
				}
			}
		}
		if(listitem == 3)
		{
			switch(rand)
			{
				case 0..20:
				{
					new szMessage[128];
					SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban da ren luyen thanh cong cay Bua, hay kiem tra Tui do (H).");
				    format(szMessage, sizeof(szMessage), "* %s da ren thanh cong cay Bua.", GetPlayerNameEx(playerid));
					ProxDetector(50.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					ClearAnimations(playerid);
					DaMaiSat = 0;
					PlayerInfo[playerid][pHanhDong] = 0;
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					DestroyDynamicObject(CaybuaXH);
					DestroyObject(LuaRenXH);
					DestroyObject(CucSatRen[playerid]);
					PlayerInfo[playerid][pDangNung] = 0;
					AddItem(playerid, ITEM_CAYBUA, 1);
				}
				default:
				{
					SendClientMessageEx(playerid, COLOR_GREY, "Ban da ren luyen that bai, dung nan. Co cong mai sat co ngay nen kim !!!");
					ClearAnimations(playerid);
					DaMaiSat = 0;
					PlayerInfo[playerid][pHanhDong] = 0;
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					DestroyDynamicObject(CaybuaXH);
					DestroyObject(LuaRenXH);
					PlayerInfo[playerid][pDangNung] = 0;
					DestroyObject(CucSatRen[playerid]);
				}
			}
		}
	}
	return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	if(GetPVarInt(playerid,"BatDauNungTime"))
	{
		if(LoNung == 1)
		{
			LoNung = 0;
			DestroyObject(CucSatNung);
			DestroyObject(CucDongNung);
		}
		DeletePVar(playerid, "BatDauNungTime");
	}
	if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
	if(GetPVarInt(playerid,"DaMaiKimTime") || GetPVarInt(playerid,"DaMaiKimTime"))
	{
		DaMaiSat = 0;
		DestroyDynamicObject(CaybuaXH);
		DestroyObject(LuaRenXH);
		DestroyObject(KhoiXH);
		DestroyObject(CucSatRen[playerid]);
		DestroyObject(CucDongRen[playerid]);
		if(GetPVarInt(playerid,"DaMaiKimTime")) DeletePVar(playerid, "DaMaiKimTime");
		if(GetPVarInt(playerid,"DaMaiKimTime2")) DeletePVar(playerid, "DaMaiKimTime2");
	}
	return 1;
}
hook OnPlayerConnect(playerid)
{
	PlayerInfo[playerid][pDangNung] = 0;
	return 1;
}
hook OnPlayerDeath(playerid)
{
	if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
	PlayerInfo[playerid][pDangNung] = 0;
	return 1;
}