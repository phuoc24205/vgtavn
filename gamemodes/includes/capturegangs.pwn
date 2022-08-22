#include <YSI\y_hooks>

new g_CameraTimer[MAX_PLAYERS];
new g_CameraLoad[MAX_PLAYERS];
new gangcapture_Object[10];
new GateGang = 0;
new Text3D:gangcapture_Text[2];
new HitTien[10];
new HitTienTime[10];
task TimeCapturegPoint[60000]()
{
	// new tmphour;
	// gettime(tmphour);
	new string[128], tmphour, tmpminute, tmpsecond;
	gettime(tmphour, tmpminute, tmpsecond);
	// FixHour(tmphour);
	// tmphour = shifthour;
	// if (tmphour == 20 && gPoint[0][gPointStatus] == 0)
	// {
	// 	SendClientMessageToAll(COLOR_RED, "[THONG BAO] Thoi gian chiem dong DIA BAN cua cac GANGTERS da chinh thuc BAT DAU !!!!!!");
	// 	SendClientMessageToAll(COLOR_RED, "[THONG BAO] Moi nguoi dan chu y, han che khong dung gan khu vuc chiem dong, tranh bi sat hai nham lan !!!!!!");
	// 	SendClientMessageToAll(COLOR_RED, "[THONG BAO] De biet vi tri chiem dong o dau /timcacu. ");
	// 	gPoint[0][gPointStatus] = 1;
	// }
	// if(tmphour == 22 && gPoint[0][gPointStatus] == 1)
	// {
	// 	foreach(new i: Player)
	// 	{
	// 		if(gPoint[0][gPlayerClaiming] == i)
	// 		{
	// 			KetThucClaim(i, GetPlayerSQLId(i), 0);
	// 		}
	// 	}
		
	// }
	if(tmphour == 12 && HitTien[0] == 0)
	{
		HitTien[0] = 1;
		HitTienTime[0] = 30;
	}
	return 1;
}
task HitTienPoint[60000]()
{

	if(HitTien[0] == 1 && HitTienTime[0] > 0)
	{
		foreach(new i: Player)
		{
			if(PlayerInfo[i][pFMember] == gPoint[0][gClaimerTeam])
			{
				if(IsPlayerInRangeOfPoint(i, 10.0, 220.1040,1823.2097,7.5398))
				{
					new string[64];
					format(string, sizeof(string), "%s vua nhan duoc 10.000$.", GetPlayerNameEx(i));
					SetPlayerChatBubble(i, string, 0x6ee7ffff, 30.0, 10000);
					SendClientMessage(i, 0x6ee7ffff, "Ban vua nhan duoc 10.000$ tu can cu cua Gangs.");
					PlayerInfo[i][pCash] += 10000;
				}
			}
		}
		HitTienTime[0]--;
	}
	if (HitTien[0] == 1 && HitTienTime[0] == 0){
		DestroyDynamic3DTextLabel(gangcapture_Text[0]);
		gangcapture_Text[0] = Text3D:INVALID_3DTEXT_ID;
		DestroyDynamic3DTextLabel(gangcapture_Text[1]);
		gangcapture_Text[1] = Text3D:INVALID_3DTEXT_ID;
		for(new i = 0; i < 10; i++)
		{
			DestroyObject(gangcapture_Object[i]);
		}
		HitTien[0] = 0;
		HitTienTime[0] = 0;
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_FIRE)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, gPoint[0][gCaptureX],gPoint[0][gCaptureY],gPoint[0][gCaptureZ]))
		{
			if(gPoint[0][gPointStatus] == 1)
			{
				if(gPoint[0][gPointClaiming] == 0)
				{
					new szMessage[128];
					SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban bat dau chiem dong.");
				    format(szMessage, sizeof(szMessage), "* %s dang chiem dong cu diem.", GetPlayerNameEx(playerid));
					ProxDetector(25.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
					PreloadAnimLib(playerid, "BD_FIRE");
					ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 1, 0, 1);
					PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
					SetPlayerFacingAngle(playerid, 97.6687);
					gPoint[0][gPointClaiming] = 1;
					new string[128];
					if(IsACop(playerid))
					{
						format(string, sizeof(string), "{F80036}Chinh Phu VGTA{FFFF00}\nDang so huu can cu nay.");
					}
					else
					{
						if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID)
						{
							format(string, sizeof(string), "{F80036}Gangs %s{FFFF00}\nDang so huu can cu nay.", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
						}
						else 
						{
							format(string, sizeof(string), "{F80036}%s{FFFF00}\nDang so huu can cu nay.", GetPlayerNameEx(playerid));
						}
					
					}
					SetPVarInt(playerid, "ChiemCanCu", 30);
					ChiemCanCu_Time = SetTimerEx("ChiemCanCu_VGTA", 1000, true, "i", playerid);
				}
				else
				{
					SendClientMessage(playerid, COLOR_GREY, "Dang co nguoi chiem dong can cu nay.");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Chua den thoi gian chiem dong, Khu Vuc 51 (20h00 Hang Ngay).");
			}
		}
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 234.1836,1821.2799,7.4141))
		{
			if(HitTien[0] == 1)
			{
				if(gPoint[0][gClaimerTeam] == PlayerInfo[playerid][pFMember])
				{
					if(GateGang == 0)
					{
						PreloadAnimLib(playerid, "POLICE");
						ClearAnimations(playerid);
						ApplyAnimation(playerid, "POLICE", "CopTraf_Stop", 4.0, 1, 0, 0, 1, 0, 1);
						PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
						//SetPlayerFacingAngle(playerid, 77.8926);
						SetTimerEx("mocuagang", 3000, false, "i", playerid);
						
					}
					else
					{
						SendClientMessage(playerid, COLOR_GREY, "Cai Cua nay dang duoc mo");
					}
					
				}
				else
				{
					SendClientMessage(playerid, COLOR_GREY, "Ban khong phai la nguoi trong gangs chiem duoc can cu, ban khong the vao.");
				}
			}
		}
	}
	return 1;
}
forward mocuagang(playerid);
public mocuagang(playerid)
{
	DeletePVar(playerid, "IsFrozen");
	DeletePVar(playerid, "PlayerCuffed");
	PlayerCuffed[playerid] = 0;
	PlayerTied[playerid] = 0;
	TogglePlayerControllable(playerid, 1);
	MoveObject(gangcapture_Object[9],  233.4718, 1822.9168, 10.7588, 6.00, 0.0000, 0.0000, 89.8000);
	SetTimerEx("dongcuagang", 5000, false, "i", playerid);
	GateGang = 1;
	return 1;
}
	
forward dongcuagang(playerid);
public dongcuagang(playerid)
{
	MoveObject(gangcapture_Object[9], 233.4718, 1822.9168, 8.2388, 6.00, 0.0000, 0.0000, 89.8000);
	GateGang = 0;
	return 1;
}
forward ChiemCanCu_VGTA(playerid);
public ChiemCanCu_VGTA(playerid)
{
	if(GetPVarInt(playerid, "ChiemCanCu") > 0)
	{
		SetPVarInt(playerid, "ChiemCanCu", GetPVarInt(playerid, "ChiemCanCu") - 1);
		new string[128];
		format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Dang chiem dong: %d giay con lai", GetPVarInt(playerid, "ChiemCanCu"));
		GameTextForPlayer(playerid, string, 1100, 3);
	}
	else
	{
		DeletePVar(playerid, "IsFrozen");
		DeletePVar(playerid, "PlayerCuffed");
		PlayerCuffed[playerid] = 0;
		PlayerTied[playerid] = 0;
		TogglePlayerControllable(playerid, 1);
		gPoint[0][gPointClaiming] = 0;
		gPoint[0][gPlayerClaiming] = playerid;
		KillTimer(ChiemCanCu_Time);
		KillTimer(TimetoCliam);
		DeletePVar(playerid, "ChiemCanCu");
		if(IsPlayerInRangeOfPoint(playerid, 2.0, gPoint[0][gCaptureX],gPoint[0][gCaptureY],gPoint[0][gCaptureZ]))
		{
			new string[128], GangsName[128];
			DestroyDynamic3DTextLabel(gPointText[0]);
			gPointText[0] = Text3D:INVALID_3DTEXT_ID;
			DestroyDynamic3DTextLabel(gPointTexts[0]);
			gPointTexts[0] = Text3D:INVALID_3DTEXT_ID;
			if(IsACop(playerid))
			{
				format(string, sizeof(string), "Dong chi %s da giai phong %s cho CHINH PHU VGTA !", GetPlayerNameEx(playerid), gPoint[0][gPointName]);
				format(GangsName, sizeof(GangsName), "{F80036}Chinh Phu VGTA{FFFF00}\nDang so huu can cu nay.");
			}
			else
			{
				if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID)
				{
					format(string, sizeof(string), "Nguoi choi %s da chiem %s cho %s !", GetPlayerNameEx(playerid), gPoint[0][gPointName], FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
					format(GangsName, sizeof(GangsName), "{F80036}Gangs %s{FFFF00}\nDang so huu can cu nay.", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
				}
				else 
				{
					format(string, sizeof(string), "Nguoi choi %s da chiem %s cho ban than !", GetPlayerNameEx(playerid), gPoint[0][gPointName]);
					format(GangsName, sizeof(GangsName), "{F80036}%s{FFFF00}\nDang so huu can cu nay.", GetPlayerNameEx(playerid));
				}
			
			}
			KillTimer(TimetoCliam);
			SendClientMessageToAll(0xff475aFF, string );
			SendClientMessageToAll(0xff475aFF, "Sau 15 phut khong ai chiem dong, can cu nay se thuoc ve ho." );
			gPointText[0] = CreateDynamic3DTextLabel(GangsName,COLOR_WHITE,gPoint[0][gPointx],gPoint[0][gPointy],gPoint[0][gPointz]+0.5,300.0);//chiem dong moi cua VGTA
			gPoint[0][gTimetoCliam] = 14;
			gPoint[0][gClaimerId] = GetPlayerSQLId(playerid);
			TimetoCliam = SetTimerEx("TimetoCliamFN", 60000, true, "ii",playerid, gPoint[0][gClaimerId]);

		}
		else
		{
			SendClientMessage(playerid, COLOR_GREY, "Ban khong dung gan vi tri chiem dong, chiem can cu THAT BAI !");
		}
	}
	
	
	return 1;
}
forward TimetoCliamFN(playerid, claimerid);
public TimetoCliamFN(playerid, claimerid)
{
	if(gPoint[0][gTimetoCliam] > 0)
	{
		gPoint[0][gTimetoCliam] -= 1;
	}
	else if(gPoint[0][gTimetoCliam] == 0)
	{
		KillTimer(TimetoCliam);
		KetThucClaim(playerid, claimerid, 0);
	}	
	return 1;
}

KetThucClaim(playerid, claimerid, gPointClaim)
{
	if(gPointClaim == 0)
	{
		gPoint[0][gTimetoCliam] = 0;
		KillTimer(TimetoCliam);
		gPoint[0][gClaimerId] = claimerid;
		new string[512];
		if(IsACop(playerid))
		{
			format(string, sizeof(string), "[THONG BAO] Sau 15p Dong Chi %s da giai phong thanh cong can cu, %s da chinh thuc thuoc ve CHINH PHU VGTA !", GetPlayerNameEx(playerid), gPoint[0][gPointName]);
			gPoint[0][gClaimerId] = -1;
			gPoint[0][gClaimerTeam] = 255;
			gPoint[0][gOwner] = -1;
			new iGroupID = PlayerInfo[playerid][pMember];
			arrGroupData[iGroupID][g_iBudget] += 1500000;
			new strings[128];
			format(strings, sizeof(strings), "UPDATE `gangs_point` SET `gClaimerId`='-1',`gClaimerTeam`='255',`gOwner`='Chinh Phu VGTA',`gTeamOwner`='Chinh Phu VGTA' WHERE `gPointId` = %i ", 0 );
			mysql_query(MainPipeline, strings);
			SendClientMessageToAll(0xffdd6eff, "[THONG BAO] Can cu vua duoc giai phong cac dong chi CANH SAT, duoc chinh phu thuong $1.500.000 vao ngan sach.");
		}
		else
		{
			if(PlayerInfo[playerid][pFMember] < INVALID_FAMILY_ID)
			{
				format(string, sizeof(string), "[THONG BAO] Sau 15p %s van giu duoc can cu, %s da chinh thuc thuoc ve %s.", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName], gPoint[0][gPointName], FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName] );
				new qr[500];
				format(qr, sizeof(qr), "UPDATE `gangs_point` SET `gClaimerId`='%i',`gClaimerTeam`='%i',`gOwner`='%s',`gTeamOwner`='%s' WHERE `gPointId` = %i ", claimerid, PlayerInfo[playerid][pFMember], GetPlayerNameEx(playerid), FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName], 0 );
				mysql_query(MainPipeline, qr);
				gPoint[0][gClaimerId] = claimerid;
				gPoint[0][gClaimerTeam] = PlayerInfo[playerid][pFMember];
				gangcapture_Object[0] = CreateObject(19293, 220.0603, 1822.9908, 7.1750, 0.0000, 0.0000, 0.0000); //PointLight13
				gangcapture_Object[1] = CreateObject(19295, 220.0834, 1822.9477, 7.1716, 0.0000, 0.0000, 0.0000); //PointLight15
				gangcapture_Object[2] = CreateObject(19290, 220.1794, 1823.0561, 7.2374, 0.0000, 0.0000, 0.0000); //PointLight10
				gangcapture_Object[3] = CreateObject(14637, 226.0930, 1823.1214, 9.2272, 0.0000, 0.5000, 175.8999); //triad_dragon
				gangcapture_Object[4] = CreateObject(14637, 214.8966, 1822.2393, 9.1299, 0.0000, 0.5000, 0.2000); //triad_dragon
				gangcapture_Object[5] = CreateObject(18688, 214.8003, 1827.9509, 8.0116, 54.2999, 67.9999, -27.6999); //fire
				gangcapture_Object[6] = CreateObject(18688, 225.3909, 1827.4780, 7.1466, 0.0000, 0.0000, 0.0000); //fire
				gangcapture_Object[7] = CreateObject(18688, 224.9007, 1818.4660, 6.2965, 0.0000, 0.0000, 0.0000); //fire
				gangcapture_Object[8] = CreateObject(18688, 215.7842, 1817.7623, 6.4008, 0.0000, 0.0000, 0.0000); //fire
				gangcapture_Object[9] = CreateObject(2929, 233.4718, 1822.9168, 8.2388, 0.0000, 0.0000, 89.8000); //a51_blastdoorL // cai cua
				gangcapture_Text[0] =  CreateDynamic3DTextLabel("{FF0000}[HAM BI MAT]\nClick {00FF00}Chuot Trai{FFFFFF} de mo cong", -1, 234.1836,1821.2799,7.4141,10.0);//ham bi mat
				gangcapture_Text[1] =  CreateDynamic3DTextLabel("{FF0000}[PHAN THUONG]\n{FFFFFF}Dung trong Khu Vuc Nay se nhan duoc\n{00FF00}10.000$/PHUT", -1, 220.1040,1823.2097,7.5398+2,10.0);//ham bi mat
				HitTien[0] = 1;
				HitTienTime[0] = 30;
				
			}
			else
			{
				format(string, sizeof(string), "[THONG BAO] Sau 15p Nguoi choi %s van giu duoc can cu, %s da chinh thuc thuoc ve %s !", GetPlayerNameEx(playerid), gPoint[0][gPointName], GetPlayerNameEx(playerid));
				new strings[128],tb[256];
				format(strings, sizeof(strings), "UPDATE `gangs_point` SET `gClaimerId`='%i',`gClaimerTeam`='255',`gOwner`='%s',`gTeamOwner`='Chinh Phu VGTA' WHERE `gPointId` = %i ", claimerid, GetPlayerNameEx(playerid), 0 );
				mysql_query(MainPipeline, strings);
				gPoint[0][gClaimerId] = claimerid;
				gPoint[0][gClaimerTeam] = 255;
				PlayerInfo[playerid][pCash] += 1500000;
				format(tb,sizeof(tb), "[THONG BAO] %s 1 minh chiem thanh cong can cu, nhan duoc $1.500.000 vao tui tien.");
				SendClientMessageToAll(0xffdd6eff, tb);
				
			}
			
		}
		SendClientMessageToAll(0xff475aff, string);
		foreach(new i: Player)
		{
			SetPlayerCameraPos(i, 265.1261,1980.4254,112.0562);
			SetPlayerCameraLookAt(i, 213.7271,1879.3699,13.1406);
			TogglePlayerControllable(i, false);
			g_CameraLoad[i] = 20;
			g_CameraTimer[i] = SetTimerEx("LoadCamera", 500, true, "i", i);
		}
	}
	return 1;
}

forward LoadCamera(playerid);
public LoadCamera(playerid)
{
	if(g_CameraLoad[playerid] <= 0)
	{
		KillTimer(g_CameraTimer[playerid]);
		SetCameraBehindPlayer(playerid);
		TogglePlayerControllable(playerid, true);
		gPoint[0][gPointStatus] = 0;
	}
	else
	{
		new rand = Random(1,18);
		switch(rand)
		{
			case 1: CreateExplosion(277.3961,1809.1340,17.6406, 7, 5);
			case 2: CreateExplosion(277.1644,1896.4771,17.6406, 7, 5);
			case 3: CreateExplosion(102.8324,1936.8895,18.4178, 7, 5);
			case 4: CreateExplosion(101.0314,1817.1278,17.6406, 7, 5);
			case 5: CreateExplosion(272.8243,1802.9243,17.6406, 7, 5);
			case 6: CreateExplosion(265.9839,1896.1918,33.8984, 7, 5);
			case 7: CreateExplosion(201.8424,1864.5994,19.5481, 7, 5);
			case 8: CreateExplosion(231.2903,1864.7877,19.5604, 7, 5);
			case 9: CreateExplosion(220.2489,1833.7086,23.7877, 7, 5);
			case 10: CreateExplosion(170.3701,1834.4493,22.3842, 7, 5);
			case 11: CreateExplosion(145.0969,1850.8457,25.1402, 7, 5);
			case 12: CreateExplosion(134.1918,1874.9591,53.5213, 7, 5);
			case 13: CreateExplosion(220.8985,1916.7845,57.4965, 7, 5);
			case 14: CreateExplosion(124.3814,1921.1812,54.3911, 7, 5);
			case 15: CreateExplosion(256.5070,1840.3408,60.4066, 7, 5);
			case 16: CreateExplosion(147.9668,1868.2600,17.8331, 7, 5);
			case 17: CreateExplosion(134.1918,1874.9591,53.5213, 7, 5);
			default: CreateExplosion(277.3961,1809.1340,17.6406, 7, 5);
		}
		g_CameraLoad[playerid]--;
	}
	return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	if(g_CameraTimer[playerid]) KillTimer(g_CameraTimer[playerid]);
	
	return 1;
}
CMD:endhitmoney(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1337)
	{
		DestroyDynamic3DTextLabel(gangcapture_Text[0]);
		gangcapture_Text[0] = Text3D:INVALID_3DTEXT_ID;
		DestroyDynamic3DTextLabel(gangcapture_Text[1]);
		gangcapture_Text[1] = Text3D:INVALID_3DTEXT_ID;
		for(new i = 0; i < 10; i++)
		{
			DestroyObject(gangcapture_Object[i]);
		}
		HitTien[0] = 0;
		HitTienTime[0] = 0;
		SendClientMessage(playerid, COLOR_PURPLE, "Ban da ket thuc hit tien cua gangs chiem cu diem");
		
	}
	else
	{
		SendClientMessage(playerid, COLOR_GREY, "Ban khong du quyen han de su dung lenh nay Admin 1337 tro len.");
	}
	
	return 1;
}
CMD:mohitmoney(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1337)
	{
		if(HitTien[0] == 1 && HitTienTime[0] > 0 )
		{
			return SendClientMessage(playerid, COLOR_GREY, "Dang dien ra Hit Money Ban Khong The mo tiep");
		}
		gangcapture_Object[0] = CreateObject(19293, 220.0603, 1822.9908, 7.1750, 0.0000, 0.0000, 0.0000); //PointLight13
		gangcapture_Object[1] = CreateObject(19295, 220.0834, 1822.9477, 7.1716, 0.0000, 0.0000, 0.0000); //PointLight15
		gangcapture_Object[2] = CreateObject(19290, 220.1794, 1823.0561, 7.2374, 0.0000, 0.0000, 0.0000); //PointLight10
		gangcapture_Object[3] = CreateObject(14637, 226.0930, 1823.1214, 9.2272, 0.0000, 0.5000, 175.8999); //triad_dragon
		gangcapture_Object[4] = CreateObject(14637, 214.8966, 1822.2393, 9.1299, 0.0000, 0.5000, 0.2000); //triad_dragon
		gangcapture_Object[5] = CreateObject(18688, 214.8003, 1827.9509, 8.0116, 54.2999, 67.9999, -27.6999); //fire
		gangcapture_Object[6] = CreateObject(18688, 225.3909, 1827.4780, 7.1466, 0.0000, 0.0000, 0.0000); //fire
		gangcapture_Object[7] = CreateObject(18688, 224.9007, 1818.4660, 6.2965, 0.0000, 0.0000, 0.0000); //fire
		gangcapture_Object[8] = CreateObject(18688, 215.7842, 1817.7623, 6.4008, 0.0000, 0.0000, 0.0000); //fire
		gangcapture_Object[9] = CreateObject(2929, 233.4718, 1822.9168, 8.2388, 0.0000, 0.0000, 89.8000); //a51_blastdoorL // cai cua
		gangcapture_Text[0] =  CreateDynamic3DTextLabel("{FF0000}[HAM BI MAT]\nClick {00FF00}Chuot Trai{FFFFFF} de mo cong", -1, 234.1836,1821.2799,7.4141,10.0);//ham bi mat
		gangcapture_Text[1] =  CreateDynamic3DTextLabel("{FF0000}[PHAN THUONG]\n{FFFFFF}Dung trong Khu Vuc Nay se nhan duoc\n{00FF00}3.000$/PHUT", -1, 220.1040,1823.2097,7.5398+2,10.0);
		HitTien[0] = 1;
		HitTienTime[0] = 30;
		SendClientMessage(playerid, COLOR_PURPLE, "Ban da MO hit tien cua gangs chiem cu diem");
		
	}
	else
	{
		SendClientMessage(playerid, COLOR_GREY, "Ban khong du quyen han de su dung lenh nay Admin 1337 tro len.");
	}
	
	return 1;
}
CMD:mochiemdong(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1337)
	{
		if(gPoint[0][gPointStatus] == 0)
		{
			new string[128];
			gPoint[0][gPointStatus] = 1;
			SendClientMessage(playerid, COLOR_PURPLE, "Ban da MO chiem dong Khu Vuc 51");
			format(string, sizeof(string), "Admin %s da MO chiem dong khu vuc 51 !", GetPlayerNameEx(playerid));
			SendClientMessageToAll(0xff475aff, string);
			SendClientMessageToAll(COLOR_RED, "[THONG BAO] Thoi gian chiem dong DIA BAN cua cac GANGTERS da chinh thuc BAT DAU !!!!!!");
			SendClientMessageToAll(COLOR_RED, "[THONG BAO] Moi nguoi dan chu y, han che khong dung gan khu vuc chiem dong, tranh bi sat hai nham lan !!!!!!");
			SendClientMessageToAll(COLOR_RED, "[THONG BAO] De biet vi tri chiem dong o dau /timcancu. ");
		}
		else
		{
			new string[128];
			gPoint[0][gPointStatus] = 0;
			SendClientMessage(playerid, COLOR_PURPLE, "Ban da DONG chiem dong Khu Vuc 51");
			format(string, sizeof(string), "Admin %s da DONG chiem dong khu vuc 51 !", GetPlayerNameEx(playerid));
			SendClientMessageToAll(0xff475aff, string);
		}
	}
	
	return 1;
}

CMD:timcancu(playerid, params[])
{
	CP[playerid] = 99999;
	SetPlayerCheckpoint(playerid, gPoint[0][gPointx],gPoint[0][gPointy],gPoint[0][gPointz], 5.0);
	PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	SendClientMessage(playerid, COLOR_PURPLE, "Vi tri chiem dong dia ban da xuat hien tran ban do, hay di den vi tri mau do xuat hien tren Radar.");
	return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
	 if(CP[playerid] == 99999)
	{
		PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
		CP[playerid] = 0;
		DisablePlayerCheckpoint(playerid);
		return 1;
	}
	return 1;
}