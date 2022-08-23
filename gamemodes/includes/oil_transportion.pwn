/* enum pinfo 
	pThueXe
	pThungDau
	pGiaoHang
	pCuopDau
*/
#define DIALOG_TRANSPORTION 15050
#define DIALOG_GIAODAUSACH  15051
#define DIALOG_GIAODAUDO	15052
#define DIALOG_GIAODAUDO1	15053
#define DIALOG_GIAODAUDO2	15054

#include <YSI\y_hooks>
new Transportion[MAX_VEHICLES];
new TransportionMax[MAX_VEHICLES];
new TransportionOwner[MAX_VEHICLES];
new TransportionGiaoHang[MAX_VEHICLES];
new Text3D:Transportion_3DText[MAX_VEHICLES];
new TrailerVehicleID[MAX_PLAYERS];
new CuopDauTimer[MAX_PLAYERS];
new XeDau[8];
new TrailerVehicle[8];
new AntiTeleport_GiaoDau[MAX_PLAYERS];

forward CuopDau(playerid, trailerid);
public CuopDau(playerid, trailerid)
{
	new str[256];
	if(GetPVarType(playerid, "PlayerCuffed") || GetPVarType(playerid, "Injured") || GetPVarType(playerid, "IsFrozen")) return SendClientMessage(playerid, COLOR_CYAN, "Cuop dau that bai");
	if(PlayerInfo[playerid][pCuopDau] == 0)
	{
		new Float:t_Pos[3];
		
		GetVehiclePos(trailerid, t_Pos[0], t_Pos[1], t_Pos[2]);
		if(!IsPlayerInRangeOfPoint(playerid, 5.0, t_Pos[0], t_Pos[1], t_Pos[2])) return SendClientMessage(playerid, COLOR_CYAN, "Cuop dau that bai ba da di qua xa thung dau");
		
		SendClientMessage(playerid, COLOR_CYAN, "Ban da cuop thanh cong 10 thung dau.");
		Transportion[trailerid] -= 10;
		format(str, sizeof(str), "{FF0000}Owner :{FFFFFF} %s\n{FF0000}So thung dau : {FFFFFF}%i/%i\n/cuopdau de cuop", GetPlayerNameExt(TransportionOwner[trailerid]),Transportion[trailerid], TransportionMax[trailerid]);
		UpdateDynamic3DTextLabelText(Transportion_3DText[trailerid], 0xFFFFFFFF, str);
		AddItem(playerid, ITEM_DAUDO, 10);
		DeletePVar(playerid, "IsFrozen");
		DeletePVar(playerid, "PlayerCuffed");
		PlayerCuffed[playerid] = 0;
		PlayerTied[playerid] = 0;
		TogglePlayerControllable(playerid, 1);

	} 
	else
	{
		PlayerInfo[playerid][pCuopDau] -= 1;
		format(str, sizeof(str), "Thoi gian cuop dau : %is", PlayerInfo[playerid][pCuopDau]);
		GameTextForPlayer(playerid, str, 1000, 3);
		SetTimerEx("CuopDau", 1000, false, "ii", playerid, trailerid);
	}
	return 1;
}
TaoXeDau(playerid, maxslot)
{
	new Float:p_Pos[4], str[128];
	GetPlayerFacingAngle(playerid, p_Pos[3]);
	GetPlayerPos(playerid, p_Pos[0], p_Pos[1], p_Pos[2]);
	new t_Veh = CreateVehicle(403, p_Pos[0], p_Pos[1], p_Pos[2], p_Pos[3], -1, -1, 0);
	new t_Trailer =  CreateVehicle(584, p_Pos[0] - 100, p_Pos[1] - 100, p_Pos[2], p_Pos[3], -1, -1, 0);
	PutPlayerInVehicle(playerid, t_Veh, 0);
	AttachTrailerToVehicle(t_Trailer, t_Veh);
	PlayerInfo[playerid][pThueXe] = t_Veh;
	TrailerVehicleID[playerid] = t_Trailer;
	Transportion[t_Trailer] = 0;
	TransportionMax[t_Trailer] = maxslot;
	TransportionOwner[t_Trailer] = playerid;
	TransportionGiaoHang[t_Trailer] = 0;
	VehicleFuel[t_Veh] = 200.00;
	format(str, sizeof(str), "{FF0000}Owner :{FFFFFF} %s\n{FF0000}So thung dau :{FFFFFF} %i/%i\n/cuopdau de cuop", GetPlayerNameExt(playerid),Transportion[t_Trailer], TransportionMax[t_Trailer]);
	Transportion_3DText[t_Trailer] = CreateDynamic3DTextLabel(str, 0xFFFFFFFF, 0.0, 0.0, 0.2, 30.0, INVALID_PLAYER_ID, t_Trailer, 0, -1, -1);
	SendClientMessage(playerid, 0xFFFFFFFF, "Hay di den dia diem {ff0000}/laydau{ffffff} de dua dau len xe.");
	return 1;
}
hook OnGameModeInit()
{
	// dausach_actor
	new DauSach_Actor;
	new DauDo_Actor;
	//actor dau sach
	DauSach_Actor = CreateActor(37,1054.1160,2087.3403,10.8203,105.3764);//thay x len 2
	PreloadAnimLib(DauSach_Actor, "COP_AMBIENT");
	ApplyActorAnimation(DauSach_Actor, "COP_AMBIENT", "Coplook_think", 4.0, 1, 0, 0, 0, 0); // Pay anim
	SetPlayerInterior(DauSach_Actor, 5);
	CreateDynamic3DTextLabel("{FF0000}[Nhan vien CTY PETRO]\n {00FF00}Buon ban DAU SACH\n{FF0000}[ALT] {FFFFFF}de giao dich", -1, 1054.1160,2087.3403,10.8203,40.0);
	CreateDynamic3DTextLabel("{FF0000}[CTY CO PHAN PETRO VN]", -1, 1041.8217,2127.9485,10.8203+0.5,80.0);

	//actor dau do
	DauDo_Actor = CreateActor(292,-214.8430,1077.0455,19.7422,171.1270);//thay x len 2
	PreloadAnimLib(DauDo_Actor, "SMOKING");
	ApplyActorAnimation(DauDo_Actor, "SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0); // Pay anim
	SetPlayerInterior(DauDo_Actor, 5);

	CreateDynamic3DTextLabel("{FF0000}[Ke buon lau Xang Dau]\n {00FF00}Buon ban DAU DO\n{FF0000}[ALT] {FFFFFF}de giao dich", -1, -214.8430,1077.0455,19.7422,40.0);
	CreateDynamic3DTextLabel("Khu vuc {FF0000}/thuexejob\n{FFFF00}Hay dung cach xa nhau de thue xe tranh bi lat xe",0xFFFF00FF,689.0663,1259.9113,11.7188+0.6,100.0);
	CreateDynamic3DTextLabel("{FF0000}/laydau",COLOR_YELLOW,600.1542,1247.5126,11.7188+0.6,50.0);
	return 1;
}
// Job vận chuyển dầu
hook OnPlayerDisconnect(playerid, reason)
{
	if(PlayerInfo[playerid][pThueXe] != 0 && TransportionGiaoHang[TrailerVehicleID[playerid]] != 0)
	{
		PlayerInfo[playerid][pCash] += Transportion[TrailerVehicleID[playerid]] * 5000;
		DestroyDynamic3DTextLabel(Transportion_3DText[TrailerVehicleID[playerid]]);
		Transportion[TrailerVehicleID[playerid]] = 0;
		TransportionMax[TrailerVehicleID[playerid]] = 0;
		DestroyVehicle(PlayerInfo[playerid][pThueXe]);
		PlayerInfo[playerid][pThueXe] = 0;
		DestroyVehicle(TrailerVehicleID[playerid]);
		TrailerVehicleID[playerid] = 0;
		PlayerInfo[playerid][pGiaoHang] = 0;
		DisableCheckPoint(playerid);
	}
	else
	{
		PlayerInfo[playerid][pCash] += TransportionMax[TrailerVehicleID[playerid]] * 5000;
		DestroyDynamic3DTextLabel(Transportion_3DText[TrailerVehicleID[playerid]]);
		Transportion[TrailerVehicleID[playerid]] = 0;
		TransportionMax[TrailerVehicleID[playerid]] = 0;
		DestroyVehicle(PlayerInfo[playerid][pThueXe]);
		PlayerInfo[playerid][pThueXe] = 0;
		DestroyVehicle(TrailerVehicleID[playerid]);
		TrailerVehicleID[playerid] = 0;
		PlayerInfo[playerid][pGiaoHang] = 0;
		DisableCheckPoint(playerid);
	}
	if(PlayerInfo[playerid][pCuopDau] > 0) PlayerInfo[playerid][pCuopDau] = 0;
	return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_TRANSPORTION:
		{
			if(response)
			{

				switch(listitem)
				{
					case 0:
					{
						if(PlayerInfo[playerid][pCash] < 50000) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong du tien");
						TaoXeDau(playerid, 10);
						PlayerInfo[playerid][pCash] -= 50000;
					}
					case 1:
					{
						if(PlayerInfo[playerid][pCash] < 100000) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong du tien");
						TaoXeDau(playerid, 20);
						PlayerInfo[playerid][pCash] -= 100000;
					}
					// case 2:
					// {
					// 	if(PlayerInfo[playerid][pCash] < 500000) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong du tien");
					// 	TaoXeDau(playerid, 100);
					// 	PlayerInfo[playerid][pCash] -= 500000;
					// }
					// case 3:
					// {
					// 	if(PlayerInfo[playerid][pCash] < 1000000) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong du tien");
					// 	TaoXeDau(playerid, 200);
					// 	PlayerInfo[playerid][pCash] -= 1000000;
					// }
				}
			}
		}
		case DIALOG_GIAODAUSACH:
		{
			if(response)
			{
				new soluong = strval(inputtext);
				if(soluong < 1)
				{
					SendClientMessage(playerid, COLOR_GREY, "Mot lan ban it nhat phai la mot thung");
					ShowPlayerDialog(playerid, DIALOG_GIAODAUSACH, 1, "{FFFF00}CTY Xang Dau PETRO VN", "{FFFFFF}DAU SACH VOI GIA: {42f57e}8.500${FF0000}/thung", "Ban", "Huy bo");
				}
				else
				{
					if(InventoryItemCheck(playerid, ITEM_DAUSACH, soluong) != 50)
					{
						new string[128];
						new	slotid = InventoryItemCheck(playerid, ITEM_DAUSACH, soluong);
						PlayerInfo[playerid][pCash] += soluong * 8500;
						DeleteItem(playerid, slotid, soluong);
						format(string, sizeof(string), "Ban vua ban %d thung dau sach va nhan duoc so tien %d.", soluong, soluong*8500);
						SendClientMessage(playerid, COLOR_CYAN, string);
						ShowPlayerDialog(playerid, DIALOG_GIAODAUSACH, 1, "{FFFF00}CTY Xang Dau PETRO VN", "{FFFFFF}DAU SACH VOI GIA: {42f57e}8.500${FF0000}/thung", "Ban", "Huy bo");
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "Ban khong du so thung dau ma ban muon ban, hay kiem tra lai tui do H.");
						ShowPlayerDialog(playerid, DIALOG_GIAODAUSACH, 1, "{FFFF00}CTY Xang Dau PETRO VN", "{FFFFFF}DAU SACH VOI GIA: {42f57e}8.500${FF0000}/thung", "Ban", "Huy bo");
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Tam biet Quy Khach !");
			}
		}
		case DIALOG_GIAODAUDO:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						ShowPlayerDialog(playerid, DIALOG_GIAODAUDO1, 1, "{FFFF00}Ke buon XANG/DAU lau", "{FFFFFF}Tao mua DAU DO voi gia: {42f57e}3.000${FF0000}/thung", "Ban", "Huy bo");
					}
					case 1:
					{
						ShowPlayerDialog(playerid, DIALOG_GIAODAUDO2, 1, "{FFFF00}Ke buon XANG/DAU lau", "{FFFFFF}Toi mua DAU DO voi gia: {42f57e}8.000${FF0000}/thung", "Ban", "Huy bo");
					}
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Khong co viec gi thi dung lam phien tao, Cut' !!");
			}
		}
		case DIALOG_GIAODAUDO1: 
		{
			if(response)
			{
				new soluong = strval(inputtext);
				if(soluong < 1)
				{
					SendClientMessage(playerid, COLOR_GREY, "Mot lan ban it nhat phai la mot thung dau do.");
					ShowPlayerDialog(playerid, DIALOG_GIAODAUDO1, 1, "{FFFF00}Ke buon XANG/DAU lau", "{FFFFFF}Tao mua DAU DO voi gia: {42f57e}3.000${FF0000}/thung", "Ban", "Huy bo");
				}
				else
				{
					if(InventoryItemCheck(playerid, ITEM_DAUDO, soluong) != 50)
					{
						new string[128];
						new	slotid = InventoryItemCheck(playerid, ITEM_DAUDO, soluong);
						PlayerInfo[playerid][pCash] += soluong * 3000;
						DeleteItem(playerid, slotid, soluong);
						format(string, sizeof(string), "Ban vua ban %d thung dau do va nhan duoc so tien %d.", soluong, soluong*3000);
						SendClientMessage(playerid, COLOR_CYAN, string);
						ShowPlayerDialog(playerid, DIALOG_GIAODAUDO1, 1, "{FFFF00}Ke buon XANG/DAU lau", "{FFFFFF}Tao mua DAU DO voi gia: {42f57e}3.000${FF0000}/thung", "Ban", "Huy bo");
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "Ban khong du so thung dau ma ban muon ban, hay kiem tra lai tui do H.");
						ShowPlayerDialog(playerid, DIALOG_GIAODAUDO1, 1, "{FFFF00}Ke buon XANG/DAU lau", "{FFFFFF}Tao mua DAU DO voi gia: {42f57e}3.000${FF0000}/thung", "Ban", "Huy bo");
					}
				}
			}
		}
		case DIALOG_GIAODAUDO2: 
		{
			if(response)
			{
				if(!IsACop(playerid))
				{
					return SendClientMessage(playerid, COLOR_GREY, "May khong phai la Cops !");
				}
				new soluong = strval(inputtext);
				if(soluong < 1)
				{
					SendClientMessage(playerid, COLOR_GREY, "Mot lan ban it nhat phai la mot thung dau do.");
					ShowPlayerDialog(playerid, DIALOG_GIAODAUDO1, 1, "{FFFF00}Ke buon XANG/DAU lau", "{FFFFFF}Tao mua DAU DO voi gia: {42f57e}8.000${FF0000}/thung", "Ban", "Huy bo");
				}
				else
				{
					if(InventoryItemCheck(playerid, ITEM_DAUDO, soluong) != 50)
					{
						new string[128];
						new	slotid = InventoryItemCheck(playerid, ITEM_DAUDO, soluong);
						PlayerInfo[playerid][pCash] += soluong * 8000;
						DeleteItem(playerid, slotid, soluong);
						format(string, sizeof(string), "Ban vua ban %d thung dau do va nhan duoc so tien %d.", soluong, soluong*8000);
						SendClientMessage(playerid, COLOR_CYAN, string);
						ShowPlayerDialog(playerid, DIALOG_GIAODAUDO1, 1, "{FFFF00}Ke buon XANG/DAU lau", "{FFFFFF}Tao mua DAU DO voi gia: {42f57e}8.000${FF0000}/thung", "Ban", "Huy bo");
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "Ban khong du so thung dau ma ban muon ban, hay kiem tra lai tui do H.");
						ShowPlayerDialog(playerid, DIALOG_GIAODAUDO1, 1, "{FFFF00}Ke buon XANG/DAU lau", "{FFFFFF}Tao mua DAU DO voi gia: {42f57e}8.000${FF0000}/thung", "Ban", "Huy bo");
					}
				}
			}
		}
	}
	return 1;
}
forward DuaDau(playerid);
public DuaDau(playerid)
{
	new Float:v_Pos[3];
	GetVehiclePos(TrailerVehicleID[playerid], v_Pos[0], v_Pos[1], v_Pos[2]);
	if(IsPlayerInRangeOfPoint(playerid, 5.0, v_Pos[0], v_Pos[1], v_Pos[2]))
	{	
		new str[128], string[128], t_Veh = TrailerVehicleID[playerid];
		if(Transportion[t_Veh] == TransportionMax[t_Veh]) return SendClientMessage(playerid, COLOR_CYAN, "Xe nay da chua toi da thung dau roi");
		Transportion[t_Veh] += 1;
		PlayerInfo[playerid][pThungDau] = 0;
		format(str, sizeof(str), "{FF0000}Owner :{FFFFFF} %s\n{FF0000}So thung dau : {FFFFFF}%i/%i\n/cuopdau de cuop", GetPlayerNameExt(playerid), Transportion[t_Veh], TransportionMax[t_Veh]);
		UpdateDynamic3DTextLabelText(Transportion_3DText[t_Veh], 0xFFFFFFFF, str);
		format(string,sizeof(string),"Ban vua chat 1 thung dau len xe, hien tai tren xe %d/%d thung dau.",Transportion[t_Veh], TransportionMax[t_Veh]);
		SendClientMessage(playerid, COLOR_CYAN, string);
	   	PreloadAnimLib(playerid, "CARRY");
		ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, 0);
	    ClearAnimations(playerid);
	    DeletePVar(playerid, "IsFrozen");
		DeletePVar(playerid, "PlayerCuffed");
		PlayerCuffed[playerid] = 0;
		PlayerTied[playerid] = 0;
		PlayerInfo[playerid][pHanhDong] = 0;
		TogglePlayerControllable(playerid, 1);
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	    DeletePVar(playerid, "DangDuaDau");
	}
	else
	{
		PlayerInfo[playerid][pThungDau] = 0;
		DeletePVar(playerid, "IsFrozen");
		DeletePVar(playerid, "PlayerCuffed");
		PlayerCuffed[playerid] = 0;
		PlayerTied[playerid] = 0;
		TogglePlayerControllable(playerid, 1);
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		SendClientMessage(playerid, COLOR_GREY, "Dua dau len xe that bai, ban di qua xa xe cho dau cua ban");
		DeletePVar(playerid, "DangDuaDau");
	}	
	return 1;
}
CMD:chatdau(playerid, params[])
{
	if(PlayerInfo[playerid][pThungDau] == 1)
	{
		new Float:v_Pos[3];
		GetVehiclePos(TrailerVehicleID[playerid], v_Pos[0], v_Pos[1], v_Pos[2]);
		if(GetPVarInt(playerid, "DangDuaDau")) return SendClientMessage(playerid, COLOR_GREY, "Ban dang dua dau len xe");
		if(IsPlayerInRangeOfPoint(playerid, 5.0, v_Pos[0], v_Pos[1], v_Pos[2]))
		{	SetPVarInt(playerid, "DangDuaDau", 1);
			GameTextForPlayer(playerid, "Dang dua dau len xe", 3000, 3);
			SetTimerEx("DuaDau", 1000, false, "i", playerid);
			if(IsPlayerAttachedObjectSlotUsed(playerid, 1))
			{
		    	 RemovePlayerAttachedObject(playerid, 1);
			}
			PreloadAnimLib(playerid, "BD_FIRE");
			ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 1, 0, 1);
			PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
			PlayerInfo[playerid][pThungDau] = 0;
		}
	}
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_FIRE)
	{
		if(PlayerInfo[playerid][pThungDau] == 1)
		{
			new Float:v_Pos[3];
			GetVehiclePos(TrailerVehicleID[playerid], v_Pos[0], v_Pos[1], v_Pos[2]);
			if(GetPVarInt(playerid, "DangDuaDau")) return SendClientMessage(playerid, COLOR_GREY, "Ban dang dua dau len xe");
			if(IsPlayerInRangeOfPoint(playerid, 5.0, v_Pos[0], v_Pos[1], v_Pos[2]))
			{	SetPVarInt(playerid, "DangDuaDau", 1);
				GameTextForPlayer(playerid, "Dang dua dau len xe", 3000, 3);
				SetTimerEx("DuaDau", 1000, false, "i", playerid);
				if(IsPlayerAttachedObjectSlotUsed(playerid, 1))
				{
			    	 RemovePlayerAttachedObject(playerid, 1);
				}
				PreloadAnimLib(playerid, "BD_FIRE");
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 1, 0, 1);
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
				PlayerInfo[playerid][pThungDau] = 0;
			}
		}
	}
	if(newkeys == KEY_WALK)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1054.1160,2087.3403,10.8203))
		{
			ShowPlayerDialog(playerid, DIALOG_GIAODAUSACH, 1, "{FFFF00}CTY Xang Dau PETRO VN", "{FFFFFF}DAU SACH VOI GIA: {42f57e}8.000${FF0000}/thung", "Ban", "Huy bo");
		}
		if(IsPlayerInRangeOfPoint(playerid, 3.0, -214.8430,1077.0455,19.7422))
		{
			ShowPlayerDialog(playerid, DIALOG_GIAODAUDO, 2, "{FFFF00}Ke buon XANG/DAU lau", "Toi khong phai la canh sat\nToi la canh sat, toi co chut giao dich", "OK !", "Huy bo");
		}
	}
	return 1;
}
hook OnPlayerEnterCheckpoint(playerid)
{
	if(PlayerInfo[playerid][pGiaoHang] == 1 && IsPlayerInRangeOfPoint(playerid, 8.0, 993.0028,-920.0865,42.1797))
	{
		if(!IsPlayerInVehicle(playerid, PlayerInfo[playerid][pThueXe])) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong dang o chiec xe ma ban dang thue");
		if(!IsTrailerAttachedToVehicle(PlayerInfo[playerid][pThueXe])) return SendClientMessage(playerid, COLOR_CYAN, "Xe cua ban khong co thung hang");
		SetPlayerCheckpoint(playerid,2789.9683,-2531.4622,13.6306, 8.0);
		PlayerInfo[playerid][pGiaoHang] = 2;
	}
	else if(PlayerInfo[playerid][pGiaoHang] == 2 && IsPlayerInRangeOfPoint(playerid, 8.0, 2789.9683,-2531.4622,13.6306))
	{
		if(!IsPlayerInVehicle(playerid, PlayerInfo[playerid][pThueXe])) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong dang o chiec xe ma ban dang thue");
		if(!IsTrailerAttachedToVehicle(PlayerInfo[playerid][pThueXe])) return SendClientMessage(playerid, COLOR_CYAN, "Xe cua ban khong co thung hang");
		if(AntiTeleport_GiaoDau[playerid] > 0)
		{
			SendClientMessage(playerid, 0xff4a4aff, "[CANH BAO] Phat hien hack VAN CHUYEN DAU, them lan nua ban se bi khoa tai khoan !!");
			SetTimerEx("KickEx", 1000, 0, "i", playerid);
			return 1;
		}
		AddItem(playerid, ITEM_DAUSACH, Transportion[TrailerVehicleID[playerid]]);
		new string[128];
		format(string, sizeof(string), "Ban da nhan duoc %d thung DAU SACH, hay kiem tra tui do H.", Transportion[TrailerVehicleID[playerid]]);
		SendClientMessage(playerid, COLOR_CYAN, string);
		DestroyDynamic3DTextLabel(Transportion_3DText[TrailerVehicleID[playerid]]);
		Transportion[TrailerVehicleID[playerid]] = 0;
		TransportionMax[TrailerVehicleID[playerid]] = 0;
		DestroyVehicle(PlayerInfo[playerid][pThueXe]);
		PlayerInfo[playerid][pThueXe] = 0;
		DestroyVehicle(TrailerVehicleID[playerid]);
		TrailerVehicleID[playerid] = 0;
		PlayerInfo[playerid][pGiaoHang] = 0;
		DisablePlayerCheckpoint(playerid);
		// AddItem(playerid, ITEM_HOTQUET, 1);
		// SendClientMessage(playerid, COLOR_ORANGE, "Ban duoc tang 1 chiec HOT QUET.");
		TinhToanNVChinh(playerid, 28);

	}
	return 1;
}
CMD:thuexejob(playerid, params[]) {
	if(PlayerInfo[playerid][pHungers] <= 0)
	{
		return SendClientMessage(playerid, COLOR_GREY, "Ban doi bung khong the lam viec hay den cua hang {ff0000}Y > {ff0000}Tim Duong{afafaf} > {ff0000}CircleK {afafaf}hoac di {ff0000}Cau Ca.");
	}
	if(PlayerInfo[playerid][pTruckSkill] < 400)
	{
		return SendClientMessage(playerid, COLOR_GREY, "Ky nang {ff0000}Trucker {afafaf}cua ban can phai dat {ff0000}cap do 3 {afafaf}moi duoc lam cong viec nay.");
	}
	if(PlayerInfo[playerid][pThueXe] != 0) return SendClientMessage(playerid, COLOR_CYAN, "Ban da thue 1 chiec xe roi vui luong /traxe");
	if(!IsPlayerInRangeOfPoint(playerid, 50.0, 689.0663,1259.9113,11.7188)) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong o khu vuc thue xe");
	new tmphour;
	gettime(tmphour);
	FixHour(tmphour);
	tmphour = shifthour;
	if ( (tmphour >= 12 && tmphour <= 23)  || PlayerInfo[playerid][pAdmin] > 9999)
	{
		// ShowPlayerDialog(playerid, DIALOG_TRANSPORTION,DIALOG_STYLE_TABLIST_HEADERS, "Thue xe", "Loai xe\t Gia tien\tSo thung chua duoc\n
		// Linerunner\t100,000 SAD\t20 thung\n
		// Linerunner\t200,000 SAD\t40 thung\n
		// Linerunner\t500,000 SAD\t100 thung\n
		// Linerunner\t1.000,000 SAD\t200 thung","Thue","Huy");
		ShowPlayerDialog(playerid, DIALOG_TRANSPORTION,DIALOG_STYLE_TABLIST_HEADERS, "Thue xe", "Loai xe\t Gia tien\tSo thung chua duoc\n\
		Linerunner\t50,000 SAD\t10 thung\n\
		Linerunner\t100,000 SAD\t20 thung","Thue","Huy");
	}
	else
	{
		return SendClientMessage(playerid, COLOR_GREY, "Cong viec nay chi mo tu 12h - 24h.");
	}
	
	return 1;
}
CMD:laydau(playerid, params[]) {
	if(!IsPlayerInRangeOfPoint(playerid, 20.0, 600.1542,1247.5126,11.7188)) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong o vi tri /laydau");
	if(PlayerInfo[playerid][pThungDau] == 1) return SendClientMessage(playerid, COLOR_CYAN, "Ban dang lay mot thung roi hay mang no vao xe nhe");
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) return SendClientMessageEx(playerid, COLOR_YELLOW, "**Ban can phai xuong xe de lay thung dau.");
	if(PlayerInfo[playerid][pGiaoHang] != 0) return SendClientMessageEx(playerid, COLOR_YELLOW, "**Ban dang giao dau roi khong the lay duoc nua.");
	PlayerInfo[playerid][pThungDau] = 1;
	PlayerInfo[playerid][pHanhDong] = 1;
	SendClientMessage(playerid, COLOR_CYAN, "Lay thung dau thanh cong hay di chuyen no len xe");
	SetPlayerAttachedObject( playerid, 1, 3632, 6, 0.058748, 0.293770, -0.263122, 347.877288, 351.771911, 352.513153, 1.000000, 1.000000, 1.000000 ); //  thung dau
	ClearAnimations(playerid);
	PreloadAnimLib(playerid, "CARRY");
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 1);
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"Hay mang dau tro ve chiec xe tai cua ban, Click chuot trai hoac /chatdau");
	GameTextForPlayer(playerid, "~w~Click Chuot Trai~r~de dua dau len xe", 7000, 1);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	return 1;
}
CMD:giaodau(playerid, params[]) {
	new t_Trailer = TrailerVehicleID[playerid];
	if(Transportion[t_Trailer] <= 0) return SendClientMessage(playerid, COLOR_CYAN, "Ban chua chat dau len xe");
	if(!IsPlayerInRangeOfPoint(playerid, 200.0, 606.2123,1216.8055,11.7188))
	{
		return SendClientMessage(playerid, COLOR_GREY, "Ban khong o noi xuat phat, o noi lay dau /giaodau");
	}
	PlayerInfo[playerid][pGiaoHang] = 1;
	SetPlayerCheckpoint(playerid, 993.0028,-920.0865,42.1797, 8.0);
	TransportionGiaoHang[t_Trailer] = 1;
	new string[128];
	format(string,sizeof(string), "[THONG BAO] %s da bat dau van chuyen lo hang %i thung dau !", GetPlayerNameEx(playerid), Transportion[TrailerVehicleID[playerid]]);
	SendClientMessageToAll(0xffdea1ff, string);
	AntiTeleport_GiaoDau[playerid] = 5;
	SetTimerEx("AntiGiaoDau", 60000, false, "i", playerid);
	return 1;
}
CMD:cuopdau(playerid, params[]) {

	new t_Veh = GetClosestCar(playerid);
	if(IsACop(playerid))
	{
		return SendClientMessage(playerid, COLOR_GREY, "Canh sat khong the cuop dau cua nguoi dan.");
	}
	if(TrailerVehicleID[playerid] == t_Veh) return SendClientMessage(playerid, COLOR_CYAN, "Khong the cuop xe cua chinh ban");  
	if(PlayerInfo[playerid][pCuopDau] > 0) return SendClientMessage(playerid, COLOR_CYAN, "Ban dang cuop dau roi");  
	if(IsPlayerInRangeOfVehicle(playerid, t_Veh, 5.0))
	{
		if(GetVehicleModel(t_Veh) == 584)
		{
			if(Transportion[t_Veh] > 0 && PlayerInfo[playerid][pCuopDau] == 0 && TransportionGiaoHang[t_Veh] != 0)
			{
				// AddItem
				PlayerInfo[playerid][pCuopDau] = 10;
				SetTimerEx("CuopDau", 1000, false, "ii", playerid, t_Veh);
				new szMessage[128];
				SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban dang bat dau cop dau.");
			    format(szMessage, sizeof(szMessage), "* %s dang cuop dau.", GetPlayerNameEx(playerid));
				ProxDetector(25.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				PreloadAnimLib(playerid, "BD_FIRE");
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 1, 0, 1);
				PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
			}	
		}
	}
	return 1;
}

forward AntiGiaoDau(playerid);
public AntiGiaoDau(playerid)
{
	if(AntiTeleport_GiaoDau[playerid] > 0)
	{
		AntiTeleport_GiaoDau[playerid]--;
		SetTimerEx("AntiGiaoDau", 60000, false, "i", playerid);
	}

	return 1;
}