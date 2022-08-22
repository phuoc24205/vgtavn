#include <YSI\y_hooks>

new dangchiemchoca;
new iddangchiemchoca;
new TimeChiemChoCa[MAX_PLAYERS];
hook OnGameModeInit()
{
	iddangchiemchoca = INVALID_PLAYER_ID;
	chiemdongchoca = 0;
	dangchiemchoca = INVALID_PLAYER_ID;
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 391.2874,-2072.3948,7.8359) )
	{
		if(newkeys & KEY_WALK)
		{
			if(chiemdongchoca == 1)
			{
				 if(GetPVarInt(playerid, "Injured") == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban dang chet khong the chiem dong.");
				if(dangchiemchoca != INVALID_PLAYER_ID)
				{
					return SendClientMessage(playerid, COLOR_GREY, "Co nguoi dang chiem.");
				}
				new szMessage[128];
				SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban bat dau chiem cho ca.");
			    format(szMessage, sizeof(szMessage), "* %s dang bat dau chiem Cho Ca.", GetPlayerNameEx(playerid));
				ProxDetector(100.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				dangchiemchoca = playerid;
				PlayerInfo[playerid][pHanhDong] = 1;
				SetPlayerPos(playerid, 391.7228,-2072.3914,7.8484);
				SetPlayerFacingAngle(playerid, 92.4602);
				PreloadAnimLib(playerid,"BOMBER");
        		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 1, 0, 0, 0, 0, 1);
        		SetPVarInt(playerid, "ChiemChoCaTime", 30);
				SetTimerEx("ChiemChoCa", 1000, false, "i", playerid);
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Khu cho ca nay chua san sang chiem dong.");
			}
		}
	}
	return 1;
}
hook OnPlayerDeath(playerid)
{
	if(dangchiemchoca == playerid)
	{
		dangchiemchoca = INVALID_PLAYER_ID;
		DeletePVar(playerid, "ChiemChoCaTime");
	}
	if(GetPVarInt(playerid,"KetThucChiemChoCaTime"))
	{
		DeletePVar(playerid, "KetThucChiemChoCaTime");
		SendClientMessage(playerid, COLOR_GREY, "Ban da chet, chiem dong Cho Ca that bai.");
		KillTimer(TimeChiemChoCa[playerid]);
	}
	if(playerid == iddangchiemchoca)
	{
		DeletePVar(playerid, "KetThucChiemChoCaTime");
		KillTimer(TimeChiemChoCa[iddangchiemchoca]);
	}
	return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	if(dangchiemchoca == playerid)
	{
		dangchiemchoca = INVALID_PLAYER_ID;
		DeletePVar(playerid, "ChiemChoCaTime");
	}
	if(GetPlayerSQLId(playerid) == idchoca && chiemdongchoca == 1)
	{
		SendClientMessageToAll(COLOR_LIGHTRED, "[Bui Doi Cho Ca] Nguoi choi chiem giu Cho Ca da thoat khi dang bao ve, quyen so huu da duoc cap nhat lai.");
	}
	if(GetPVarInt(playerid,"KetThucChiemChoCaTime"))
	{
		DeletePVar(playerid, "KetThucChiemChoCaTime");
		KillTimer(TimeChiemChoCa[playerid]);
	}
	if(playerid == iddangchiemchoca)
	{
		DeletePVar(playerid, "KetThucChiemChoCaTime");
		KillTimer(TimeChiemChoCa[iddangchiemchoca]);
	}
	return 1;
}
CMD:mochoca(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1337) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay.");
	new string[256];
	dangchiemchoca = INVALID_PLAYER_ID;
	if(GetPVarInt(iddangchiemchoca, "KetThucChiemChoCaTime"))
	{
		DeletePVar(playerid, "KetThucChiemChoCaTime");
	}
	iddangchiemchoca = INVALID_PLAYER_ID;
	if(chiemdongchoca == 0)
	{
		chiemdongchoca = 1;
		format(string, sizeof(string), "[Bui Doi Cho Ca] Khu Cho Ca da san sang chiem dong. /timchoca ");
		SendClientMessageToAll(COLOR_LIGHTRED, string);
	}
	else
	{
		chiemdongchoca = 0;
		format(string, sizeof(string), "[Bui Doi Cho Ca] Khu Cho Ca da ket thuc chiem dong !");
		SendClientMessageToAll(COLOR_LIGHTRED, string);
	}
	
	return 1;
}
CMD:timchoca(playerid, params[])
{
	SetPlayerCheckpoint(playerid, 391.2874,-2072.3948,7.8359, 8.0);
	CP[playerid] = 252000;
	return 1;
}
forward ChiemChoCa(playerid);
public ChiemChoCa(playerid)
{
	if(GetPVarInt(playerid, "ChiemChoCaTime") > 0)
	{
		SetPVarInt(playerid,"ChiemChoCaTime", GetPVarInt(playerid, "ChiemChoCaTime") - 1);
		new string[128];
		format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Dang chiem ~r~%d~w~ giay con lai", GetPVarInt(playerid, "ChiemChoCaTime"));
		GameTextForPlayer(playerid, string, 1100, 3);
		SetTimerEx("ChiemChoCa", 1000, false, "i", playerid);
	}
	else
	{
		PlayerInfo[playerid][pHanhDong] = 0;
		dangchiemchoca = INVALID_PLAYER_ID;
		ClearAnimations(playerid);
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 391.7228,-2072.3914,7.8484))
		{
			if(iddangchiemchoca != INVALID_PLAYER_ID)
			{
				DeletePVar(iddangchiemchoca, "KetThucChiemChoCaTime");
				KillTimer(TimeChiemChoCa[iddangchiemchoca]);
			}
			new setchoca[256],strchoca[128],strthongbao[256];
			if(PlayerInfo[playerid][pFMember] != INVALID_FAMILY_ID)
			{
				idchoca = GetPlayerSQLId(playerid);
				format(setchoca, sizeof(setchoca),"UPDATE `buidoichoca` SET `idsql` = %d, `tengang` = '%s', `idgang` = %i WHERE `id` = 1", GetPlayerSQLId(playerid), FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName], PlayerInfo[playerid][pFMember]);
				format(strchoca, sizeof(strchoca), "{ffffff}[Bui Doi Cho Ca] Khu Cho Ca\n{ff0000}%s \n{ffff00}dang chiem giu", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
				UpdateDynamic3DTextLabelText(choca_Text[0], 0xFFFFFFFF, strchoca);
				format(strthongbao, sizeof(strthongbao),"[Bui Doi Cho Ca] Gangs %s dang chiem giu khu Cho Ca, trong vong 15 phut neu bao ve thanh cong se chinh thuc thuoc ve ho.", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
				SendClientMessageToAll(COLOR_LIGHTRED, strthongbao);
				iddangchiemchoca = playerid;
				SetPVarInt(playerid,"KetThucChiemChoCaTime",900);
				TimeChiemChoCa[playerid] =  SetTimerEx("KetThucChiemChoCa", 1000, true, "i", playerid);
			}
			else if(PlayerInfo[playerid][pMember] != INVALID_GROUP_ID)
			{
				idchoca = GetPlayerSQLId(playerid);
				format(setchoca, sizeof(setchoca),"UPDATE `buidoichoca` SET `idsql` = %d, `tengang` = 'Chinh Phu Los Santos', `idgang` = 255 WHERE `id` = 1", GetPlayerSQLId(playerid));
				format(strchoca, sizeof(strchoca), "{ffffff}[Bui Doi Cho Ca] Khu Cho Ca\n{ff0000}Chinh Phu Los Santos \n{ffff00}dang chiem giu");
				UpdateDynamic3DTextLabelText(choca_Text[0], 0xFFFFFFFF, strchoca);
				SendClientMessageToAll(COLOR_LIGHTRED, "[Bui Doi Cho Ca] Chinh phu Los santos dang chiem giu khu Cho Ca, trong vong 15 phut neu bao ve thanh cong se chinh thuc thuoc ve nha nuoc.");
				iddangchiemchoca = playerid;
				SetPVarInt(playerid,"KetThucChiemChoCaTime",900);
				TimeChiemChoCa[playerid] = SetTimerEx("KetThucChiemChoCa", 1000, true, "i", playerid);
			}
			else{
				idchoca = GetPlayerSQLId(playerid);
				format(setchoca, sizeof(setchoca),"UPDATE `buidoichoca` SET `idsql` = %d, `tengang` = '{ffffff}Nguoi choi {ff0000}%s', `idgang` = 255 WHERE `id` = 1", GetPlayerSQLId(playerid), GetPlayerNameEx(playerid));
				format(strchoca, sizeof(strchoca), "{ffffff}[Bui Doi Cho Ca] Khu Cho Ca\nNguoi choi {ff0000}%s \n{ffff00}dang chiem giu", GetPlayerNameEx(playerid));
				UpdateDynamic3DTextLabelText(choca_Text[0], 0xFFFFFFFF, strchoca);
				format(strthongbao, sizeof(strthongbao),"[Bui Doi Cho Ca] Nguoi choi %s dang chiem giu khu Cho Ca, trong vong 15 phut neu bao ve thanh cong se chinh thuc thuoc ve ho.", GetPlayerNameEx(playerid));
				SendClientMessageToAll(COLOR_LIGHTRED, strthongbao);
				iddangchiemchoca = playerid;
				SetPVarInt(playerid,"KetThucChiemChoCaTime",900);
				TimeChiemChoCa[playerid] = SetTimerEx("KetThucChiemChoCa", 1000, true, "i", playerid);
			}
			mysql_query(MainPipeline, setchoca);
		}
		else
		{
			SendClientMessage(playerid, COLOR_GREY, "Chiem Cho Ca that bai, vi ban khong o vi tri chiem.");
		}
		
	}
	return 1;
}
forward KetThucChiemChoCa(playerid);
public KetThucChiemChoCa(playerid)
{
	if(GetPVarInt(playerid, "KetThucChiemChoCaTime") > 0)
	{
		SetPVarInt(playerid,"KetThucChiemChoCaTime", GetPVarInt(playerid, "KetThucChiemChoCaTime") - 1);
		if(GetPVarInt(playerid, "KetThucChiemChoCaTime") == 180)
		{
			SendClientMessageToAll(COLOR_LIGHTRED, "[Bui Doi Co Ca] Chi con 3 phut nua hoan thanh bao ve Cho Ca.");
		}
	}
	else
	{
		DeletePVar(playerid, "KetThucChiemChoCaTime");
		KillTimer(TimeChiemChoCa[playerid]);
		new setchoca[256], strthongbao[256];
			if(PlayerInfo[playerid][pFMember] != INVALID_FAMILY_ID)
			{
				format(setchoca, sizeof(setchoca),"UPDATE `buidoichoca` SET `idsql` = %d, `tengang` = '%s', `idgang` = %i WHERE `id` = 1", GetPlayerSQLId(playerid), FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName], PlayerInfo[playerid][pFMember]);
				format(strthongbao, sizeof(strthongbao),"[Bui Doi Cho Ca] Gangs %s da chiem giu thanh cong khu Cho Ca. Cung' Hy~ Cung' Hy~ !!!!", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
				SendClientMessageToAll(COLOR_LIGHTRED, strthongbao);
				format(strthongbao, sizeof(strthongbao),"[Bui Doi Cho Ca] Thanh vien trong Gangs %s duoc ban' ca' tai Cho Ca voi gia tot $900/con .", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
				SendClientMessageToAll(COLOR_LIGHTRED, strthongbao);
				idgangchoca = PlayerInfo[playerid][pFMember];
			}
			else if(PlayerInfo[playerid][pMember] != INVALID_GROUP_ID)
			{
				format(setchoca, sizeof(setchoca),"UPDATE `buidoichoca` SET `idsql` = %d, `tengang` = 'Chinh Phu Los Santos', `idgang` = 255 WHERE `id` = 1", GetPlayerSQLId(playerid));
				SendClientMessageToAll(COLOR_LIGHTRED, "[Bui Doi Cho Ca] Chinh phu Los santos da chiem thanh cong khu Cho Ca. Nguoi dan ca thanh pho deu vui mung !!!");
				arrGroupData[PlayerInfo[playerid][pMember]][g_iBudget] += 1500000;
				SendClientMessageToAll(COLOR_LIGHTRED, "[Bui Doi Cho Ca] To chuc chiem duoc Cho Ca duoc chinh phu trao tang $1.500.000 va ngan sach cua to chuc.");
				idgangchoca = 255;
			}
			else{
				format(setchoca, sizeof(setchoca),"UPDATE `buidoichoca` SET `idsql` = %d, `tengang` = '{ffffff}Nguoi choi {ff0000}%s', `idgang` = 255 WHERE `id` = 1", GetPlayerSQLId(playerid), GetPlayerNameEx(playerid));
				format(strthongbao, sizeof(strthongbao),"[Bui Doi Cho Ca] Nguoi choi %s dang chiem giu thanh cong khu Cho Ca. Xin Chuc Mung !!!", GetPlayerNameEx(playerid));
				SendClientMessageToAll(COLOR_LIGHTRED, strthongbao);
				format(strthongbao, sizeof(strthongbao),"[Bui Doi Cho Ca] %s Nhan duoc $1.000.000 vi chiem thanh cong Cho Ca.", GetPlayerNameEx(playerid));
				SendClientMessageToAll(COLOR_LIGHTRED, strthongbao);
				idgangchoca = 255;
			}
			mysql_query(MainPipeline, setchoca);
		chiemdongchoca = 0;
		iddangchiemchoca = INVALID_PLAYER_ID;
	}
	return 1;
}

