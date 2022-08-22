#include <YSI\y_hooks>


enum enum_Event {
	event_Status,
	event_giftVehicle[3],
	event_giftMoney[3],
	win_player[3],
}
enum enum_RacePlane{
	Float:PosX,
	Float:PosY,
	Float:PosZ,
	Float:PosA,
	race_player,
}
enum enum_RacePlaneCheckpoint {
	Float:PosX,
	Float:PosY,
	Float:PosZ,
	checkpoint_type,
}

new SuKien[enum_Event]	= {0, {0, 0, 0}, {1000, 1500, 1600}};
new RacePlanePos[][enum_RacePlane] = 
{
	{-1660.0403,-158.4999,14.6530,318.3808},
	{-1651.7035,-167.9478,14.6473,312.4259,0},
	{-1637.1356,-135.1709,14.6990,313.7234,0},
	{-1628.6659,-148.0907,14.7020,318.4707,0},
	{-1622.7944,-117.0015,14.6806,321.2035,0},
	{-1611.3478,-129.7386,14.6741,311.9242,0},
	{-1607.9301,-101.5151,14.6716,325.2623,0},
	{-1593.9719,-113.8041,14.6727,304.5883,0},
	{-1594.4302,-87.7428,14.6813,327.0047,0},
	{-1578.9110,-102.9465,14.6845,313.4770,0},
	{-1561.0924,-85.5286,14.6997,306.6597,0},
	{-1577.8221,-68.6042,14.7193,316.6249,0},
	{-1561.0206,-50.7481,14.6902,315.4283,0},
	{-1544.1864,-68.0878,14.6894,312.1173,0},
	{-1523.0162,-46.6693,14.6857,314.1178,0},
	{-1537.9142,-28.4149,14.6767,309.8002,0},
	{-1515.1576,-5.5000,14.7020,310.4234,0},
	{-1500.7988,-22.4027,14.7016,298.4607,0},
	{-1477.2078,-0.5089,14.6834,308.5754,0},
	{-1491.2034,17.1645,14.7277,307.9216,0}
};
new RacePlaneCheckpoint[][enum_RacePlaneCheckpoint] =
{
	{-944.4749,570.7966,95.9710,3},
	{-263.8795,972.4320,175.9926,3},
	{595.3517,1328.7911,165.3955,3},
	{1482.6173,1606.9493,62.1787,4}
};
stock KetThucSuKien(playerid)
{
	SetPlayerPos(playerid,EventFloats[playerid][1],EventFloats[playerid][2],EventFloats[playerid][3]);
	Player_StreamPrep(playerid, EventFloats[playerid][1],EventFloats[playerid][2],EventFloats[playerid][3], FREEZE_TIME);
	SetPlayerVirtualWorld(playerid, EventLastVW[playerid]);
	SetPlayerFacingAngle(playerid, EventFloats[playerid][0]);
	SetPlayerInterior(playerid,EventLastInt[playerid]);
	SetPlayerHealth(playerid, EventFloats[playerid][4]);
	if(EventFloats[playerid][5] > 0) {
		SetPlayerArmor(playerid, EventFloats[playerid][5]);
	}
	for(new d = 0; d < 6; d++)
	{
		EventFloats[playerid][d] = 0.0;
	}
	EventLastVW[playerid] = 0;
	EventLastInt[playerid] = 0;
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_EVENT)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					ShowPlayerDialog(playerid, DIALOG_EVENT1, DIALOG_STYLE_LIST, "Thiet lap phan thuong", "Hang nhat\nHang 2\nHang 3\nTao su kien", "Tiep tuc", "Huy");
				}
				case 1:
				{
					SendClientMessage(playerid, COLOR_RED, "Dang cap nhat");
				}
			}
		}
	}
	else if(dialogid == DIALOG_EVENT1)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					SetPVarInt(playerid, "ChonHang", 0);
					new str[100];
					format(str, sizeof(str),"Phuong tien :%i\nMoney: %i", SuKien[event_giftVehicle][0], SuKien[event_giftMoney][0]);
					ShowPlayerDialog(playerid, DIALOG_EVENT2, DIALOG_STYLE_LIST, "Thiet lap phan thuong", str, "Tiep tuc", "Huy");
				}
				case 1:
				{
					SetPVarInt(playerid, "ChonHang", 1);
					new str[100];
					format(str, sizeof(str),"Phuong tien :%i\nMoney: %i", SuKien[event_giftVehicle][1], SuKien[event_giftMoney][1]);
					ShowPlayerDialog(playerid, DIALOG_EVENT2, DIALOG_STYLE_LIST, "Thiet lap phan thuong", str, "Tiep tuc", "Huy");
				}
				case 2:
				{
					SetPVarInt(playerid, "ChonHang", 2);
					new str[100];
					format(str, sizeof(str),"Phuong tien :%i\nMoney: %i", SuKien[event_giftVehicle][2], SuKien[event_giftMoney][2]);
					ShowPlayerDialog(playerid, DIALOG_EVENT2, DIALOG_STYLE_LIST, "Thiet lap phan thuong", str, "Tiep tuc", "Huy");
				}
				case 3:
				{
					SuKien[event_Status] = 1;
					for(new i = 0; i < 3; i++)
					{
						SuKien[win_player][i] = -1;
					}
					for(new i = 0; i < sizeof(RacePlanePos); i++)
					{
						RacePlanePos[i][race_player] = -1;
					}
					SendClientMessageToAll(COLOR_RED, "Mot su kien da duoc to chuc su dung /vaosukien");
				}
			}
		}
	}
	else if(dialogid == DIALOG_EVENT2)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					ShowPlayerDialog(playerid, DIALOG_EVENT3, DIALOG_STYLE_INPUT, "Thiet lap phan thuong su kien", "Nhap ID phuong tien danh cho phan thuong", "Tiep tuc", "Huy");
				}
				case 1:
				{
					ShowPlayerDialog(playerid, DIALOG_EVENT4, DIALOG_STYLE_INPUT, "Thiet lap phan thuong su kien", "Nhap Money danh cho phan thuong", "Tiep tuc", "Huy");
				}
			}
		}
	}
	else if(dialogid == DIALOG_EVENT3)
	{
		if(response)
		{
			new veh = strval(inputtext);
			if(400 < veh < 611)
			{
				SuKien[event_giftVehicle][GetPVarInt(playerid,"ChonHang")] = veh;
			}
		}
	}
	else if(dialogid == DIALOG_EVENT4)
	{
		if(response)
		{
			new money = strval(inputtext);
			if(money > 0)
			{
				SuKien[event_giftMoney][GetPVarInt(playerid,"ChonHang")] = money;
			}
		}
	}
    return 1;
}
hook OnPlayerEnterRaceCheckpoint(playerid)
{
    if(PlayerInfo[playerid][pSuKien] == 1)
    {
        new racepoint = PlayerInfo[playerid][pRaceCheckpoint] - 1;
        if(racepoint < sizeof(RacePlaneCheckpoint) - 1)
        {
            PlayerInfo[playerid][pRaceCheckpoint]++;
            racepoint = PlayerInfo[playerid][pRaceCheckpoint] - 1;
            SetPlayerRaceCheckpoint(playerid,RacePlaneCheckpoint[racepoint][checkpoint_type],RacePlaneCheckpoint[racepoint][PosX],RacePlaneCheckpoint[racepoint][PosY],RacePlaneCheckpoint[racepoint][PosZ],RacePlaneCheckpoint[racepoint][PosX],RacePlaneCheckpoint[racepoint][PosY],RacePlaneCheckpoint[racepoint][PosZ],20);
        }
        else
        {
            for(new i = 0; i < 3; i++)
            {
                if(SuKien[win_player][i] == -1)
                {
                    SuKien[win_player][i] = playerid;
                    new str[50];
                    format(str, sizeof(str),"%s da ve hang %i", GetPlayerNameExt(playerid), i+1);
                    SendClientMessageToAll(COLOR_RED, str);
                    format(str, sizeof(str), "Ban nhan duoc %i Money va 1 phuong tien %i", SuKien[event_giftMoney][i], VehicleName[SuKien[event_giftVehicle][i] - 400] );
                    SendClientMessage(playerid, COLOR_RED, str);
                    GivePlayerCash(playerid, SuKien[event_giftMoney][i]);
                    if(i == 0)
                    {
                    	new Float: arr_fPlayerPos[4];
						GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
						GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
						CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), SuKien[event_giftVehicle][i], arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2], arr_fPlayerPos[3], 0, 0, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
                    }
                    if(i == 2)
                    {
                        SuKien[event_Status] = 0;
                        for(new j = 0; j < sizeof(RacePlanePos); i++)
                        {
                            if(RacePlanePos[j][race_player] != -1)
                            {
                                KetThucSuKien(j);
                            }
                        }
                    }
                    break;
                }
            }
        }
    }
	return 1;
}

CMD:taosukien(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_EVENT, DIALOG_STYLE_LIST, "Tao su kien", "Su kien dua may bay #1\n Su kien dua may bay #2 (Update)", "Chon", "Huy");
	return 1;
}
CMD:vaosukien(playerid, params[])
{
	new counts = 0;
	if(PlayerInfo[playerid][pSuKien] == 1) return SendClientMessage(playerid, COLOR_RED, "Ban dang o trong su kien");
	if(SuKien[event_Status] == 0) return SendClientMessage(playerid, COLOR_RED, "Khong co su kien nao duoc to chuc");
	for(new i = 0; i < sizeof(RacePlanePos); i++) if(RacePlanePos[i][race_player] != -1) counts++;
	if(counts == sizeof(RacePlanePos)) return SendClientMessage(playerid, COLOR_RED, "Su kien da day");
	for(new iIterator; iIterator < sizeof(CreatedCars); iIterator++){
			if(iIterator >= 49) return SendClientMessageEx(playerid, COLOR_GRAD1, "The maximum limit of 50 spawned vehicles has been reached.");
			else if(CreatedCars[iIterator] == INVALID_VEHICLE_ID) {
			new Float:fVehPos[4];
			for(new i = 0; i < sizeof(RacePlanePos); i++)
			{
				if(RacePlanePos[i][race_player] == -1)
				{
					fVehPos[0] = RacePlanePos[i][PosX];
					fVehPos[1] = RacePlanePos[i][PosY];
					fVehPos[2] = RacePlanePos[i][PosZ];
					fVehPos[3] = RacePlanePos[i][PosA];
					RacePlanePos[i][race_player] = playerid;
					break;
				}
			}
			PlayerInfo[playerid][pFlyLic] = 1;
			CreatedCars[iIterator] = CreateVehicle(513, fVehPos[0], fVehPos[1], fVehPos[2], fVehPos[3], 3, 3, -1);
			PutPlayerInVehicle(playerid, CreatedCars[iIterator], 0);
			PlayerInfo[playerid][pRaceCheckpoint] = 1;
			new racepoint = PlayerInfo[playerid][pRaceCheckpoint] - 1;
			SetPlayerRaceCheckpoint(playerid,RacePlaneCheckpoint[racepoint][checkpoint_type],RacePlaneCheckpoint[racepoint][PosX],RacePlaneCheckpoint[racepoint][PosY],RacePlaneCheckpoint[racepoint][PosZ],RacePlaneCheckpoint[racepoint][PosX],RacePlaneCheckpoint[racepoint][PosY],RacePlaneCheckpoint[racepoint][PosZ],20);
			TogglePlayerControllable(playerid, 0);
			SetPVarInt(playerid, "IsFrozen", 1);
			PlayerInfo[playerid][pSuKien] = 1;
			GetPlayerHealth(playerid, EventFloats[playerid][4]);
			GetPlayerArmour(playerid, EventFloats[playerid][5]);
			EventLastVW[playerid] = GetPlayerVirtualWorld(playerid);
			EventLastInt[playerid] = GetPlayerInterior(playerid);
			GetPlayerPos(playerid, EventFloats[playerid][1], EventFloats[playerid][2], EventFloats[playerid][3]);
			GetPlayerFacingAngle(playerid, EventFloats[playerid][0]);
			return 1;
		}
	}		
	return 1;
}
CMD:batdausukien(playerid, params[])
{
	if(SuKien[event_Status] == 0) return SendClientMessage(playerid, COLOR_RED, "Khong co su kien nao duoc to chuc");
	if(SuKien[event_Status] == 2) return SendClientMessage(playerid, COLOR_RED, "Su kien nay dang duoc bat dau");
	SuKien[event_Status] = 2;
	SetTimerEx("CountdownSuKien", 100, false, "i", playerid);
	return 1;
}
CMD:ketthucsukien(playerid, params[])
{
	SuKien[event_Status] = 0;
	foreach(new i: Player)
	{
		if(PlayerInfo[playerid][pSuKien] != 0)
		{
			PlayerInfo[playerid][pSuKien] = 0;
		}
	}
	for(new i = 0; i < sizeof(RacePlanePos); i++)
	{
		if(RacePlanePos[i][race_player] != -1) KetThucSuKien(i);
	}
	SuKien[event_Status] = 0;
	SendClientMessage(playerid, COLOR_RED, "Su kien da ket thuc boi admin");
	return 1;
}


forward CountdownSuKien(playerid);
public CountdownSuKien(playerid)
{
	    if(CountDown == 0) {
	 		CountDown++;
	 		SendClientMessageToAll(COLOR_LIGHTBLUE, "** 3");
	 		SetTimerEx("CountdownSuKien", 1000, false, "i", playerid);
		} else if(CountDown == 1) {
		    CountDown++;
		    SendClientMessageToAll(COLOR_LIGHTBLUE, "** 2");
		    SetTimerEx("CountdownSuKien", 1000, false, "i", playerid);
		} else if(CountDown == 2) {
		    CountDown++;
		    SendClientMessageToAll(COLOR_LIGHTBLUE, "** 1");
		    SetTimerEx("CountdownSuKien", 1000, false, "i", playerid);
		} else if(CountDown == 3) 
		{
		    CountDown = 0;
		    SendClientMessageToAll(COLOR_LIGHTBLUE, "** Go Go Go!");
		    foreach (new i: Player)
		    {
		    	if(PlayerInfo[i][pSuKien] == 1) 
		    	{
		    		DeletePVar(i, "IsFrozen");
		    		TogglePlayerControllable(i, 1);
		    	}
		    }
		   
		    
		}
	
	
	return 1;
}
