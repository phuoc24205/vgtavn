stock UpdateVehPizzaLabel(id)
{
    new str[128];
    format(str, sizeof(str), "%i Hai San\n%i Nuoc Ep\n%i Bot Lam Banh", carvid[id][nguyenlieu][0], carvid[id][nguyenlieu][1], carvid[id][nguyenlieu][2]);
    UpdateDynamic3DTextLabelText(carvid[id][label], 0xFFFFFFFF, str);
    return 1;
}
stock UpdateKhoPizzaLabel()
{
    new str[128];
    format(str, sizeof(str), "%i Hai San\n%i Nuoc Ep\n%i Bot Lam Banh", PizzaInfo[NguyenLieu][0], PizzaInfo[NguyenLieu][1], PizzaInfo[NguyenLieu][2]);
    UpdateDynamic3DTextLabelText(PizzaInfo[Label][0], COLOR_YELLOW, str);
    return 1;
}
stock UpdatePizzaLabel()
{
    new str[128];
    format(str, sizeof(str), "So luong Pizza : %i", PizzaInfo[Pizza]);
    UpdateDynamic3DTextLabelText(PizzaInfo[Label][1], COLOR_YELLOW, str);
    return 1;
}
stock SoLuongCop(pizzaid)
{
    new soluong = 0;
    for(new i = 0; i < 3; i++)
    {
       soluong +=  carvid[pizzaid][nguyenlieu][i];
    }
    return soluong;
}
stock XeLayHangPizza(carid)
{
	for (new v = 0; v < sizeof(VehPizzaPos); v++) {
	    if(carid == carvid[v][idxe]) return v;
	}
	return -1;
}
forward TimerLamBanh(playerid);
public TimerLamBanh(playerid)
{
    new time = GetPVarInt(playerid, "LamBanhTime");
    if(time > 0) 
    {
        new str[128];
        SetPVarInt(playerid, "LamBanhTime" , time - 1);
        format(str, sizeof(str), "Ban dang lam banh con %is", time);
        GameTextForPlayer(playerid, str, 500, 1);
    }
    else
    {
        SetPVarInt(playerid, "LamBanh", 0);
        KillTimer(LamBanh_Timer[playerid]);
        if(PizzaInfo[NguyenLieu][0] < 3) return SendClientMessage(playerid, COLOR_GREY, "That bai ! Khong du nguyen lieu hai san");
        if(PizzaInfo[NguyenLieu][1] < 2) return SendClientMessage(playerid, COLOR_GREY, "That bai ! Khong du nguyen lieu nuoc ep lam banh");
        if(PizzaInfo[NguyenLieu][2] < 4) return SendClientMessage(playerid, COLOR_GREY, "That bai ! Khong du nguyen lieu bot lam banh");
        PizzaInfo[Pizza] += 1;
        PizzaInfo[NguyenLieu][0] -= 2;
        PizzaInfo[NguyenLieu][1] -= 1;
        PizzaInfo[NguyenLieu][0] -= 3;
        UpdatePizzaLabel();
        UpdateKhoPizzaLabel();
    }
    return 1;
}
CMD:laynguyenlieu(playerid, params[])
{
    if(GetPVarInt(playerid, "LayNguyenLieu") != -1) return SendClientMessage(playerid, COLOR_GREY, "Ban phai cat nguyen lieu vao xe roi moi co the lay tiep");
    if(IsPlayerInRangeOfPoint(playerid, 3.0, 364.4582,-2024.5117,7.8359))
    {
        SendClientMessage(playerid, COLOR_GREY, "Ban da lay 1 phan hai san ! Hay di lai xe va cat no");
        SetPVarInt(playerid, "LayNguyenLieu", 0);
    }
    else if(IsPlayerInRangeOfPoint(playerid, 3.0, 365.3215,-2019.7249,7.6719))
    {
        SendClientMessage(playerid, COLOR_GREY, "Ban da lay 1 phan nuoc ep lam banh ! Hay di lai xe va cat no");
        SetPVarInt(playerid, "LayNguyenLieu", 1);
    }
    else if(IsPlayerInRangeOfPoint(playerid, 3.0, 377.5292,-2007.3160,7.8359))
    {
        SendClientMessage(playerid, COLOR_GREY, "Ban da lay 1 phan bot lam banh ! Hay di lai xe va cat no");
        SetPVarInt(playerid, "LayNguyenLieu", 2);
    }
    else SendClientMessage(playerid, COLOR_GREY, "Ban khong o cac khu vuc lay nguyen lieu ! /gps de tim khu vuc");
    return 1;
}
CMD:giaonguyenlieu(playerid, params[])
{
    SetPlayerCheckpoint(playerid, 2129.6055,-1802.0852,13.6408, 3.0);
    return 1;
}
CMD:lambanh(playerid, params[])
{
    if(GetPVarInt(playerid, "LamBanh") != 0) return SendClientMessage(playerid, COLOR_GREY, "Ban dang lam banh roi");
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 378.8385,-112.6412,1002.643)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong o vi tri lam banh");
    if(PizzaInfo[NguyenLieu][0] < 3) return SendClientMessage(playerid, COLOR_GREY, "Khong du nguyen lieu hai san");
    if(PizzaInfo[NguyenLieu][1] < 2) return SendClientMessage(playerid, COLOR_GREY, "Khong du nguyen lieu nuoc ep lam banh");
    if(PizzaInfo[NguyenLieu][2] < 4) return SendClientMessage(playerid, COLOR_GREY, "Khong du nguyen lieu bot lam banh");
    SetPVarInt(playerid, "LamBanh", 1);
    SetPVarInt(playerid, "LamBanhTime", 120);
    LamBanh_Timer[playerid] = SetTimerEx("TimerLamBanh", 1000, true, "i", playerid);
    return 1;
}
CMD:laybanh(playerid, params[])
{
	/*new jobhour;
	gettime(jobhour);
	jobhour = shifthour;
	if(jobhour < 13 || jobhour >= 16)
	{
		SendClientMessage(playerid, COLOR_GREY, "Cong viec chi lam tu 13h - 16h hang ngay.");
	    return 1;
	}*/
    if(PlayerInfo[playerid][pHungers] <= 0)
	{
		return SendClientMessage(playerid, COLOR_GREY, "Ban dang {ff0000}Doi Bung {afafaf}khong the lam viec.");
	}
	if(PlayerInfo[playerid][pJob] == 21 || PlayerInfo[playerid][pJob2] == 21)
	{
		if(!GetPVarType(playerid, "Pizza"))
		{
		    if(IsPlayerInAnyVehicle(playerid))
		    {
				if(IsPlayerInRangeOfPoint(playerid, 3.0, 1888.5854,2092.3545,11.0625))
				{
				    if(GetPlayerSkin(playerid) != 155)
				    {
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong mac quan ao Pizza boy khong the lam viec.");
				        return 1;
				    }
				    if(!IsAPizzaCar(GetPlayerVehicleID(playerid)))
					{
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong chay xe Pizza Stack khong the lam viec.");
				        return 1;
				    }
					new rand = random(30);
					//new rand = 1;
					while(!(HouseInfo[rand][hExteriorZ] <= 100 && HouseInfo[rand][hExteriorX] > 159.6704 && HouseInfo[rand][hExteriorX] < 2881.3550 && HouseInfo[rand][hExteriorY] > 100.000 && HouseInfo[rand][hExteriorY] < 1000.000)) 
						{
			     			if(++rand >= 30) {
							rand = 1;
						}
					}
					new
						iDist = floatround(GetPlayerDistanceFromPoint(playerid, HouseInfo[rand][hExteriorX], HouseInfo[rand][hExteriorY], HouseInfo[rand][hExteriorZ])),
						szMessage[512];
                    SetPVarInt(playerid, "IsFrozen", 1);
                    SetTimerEx("ReleasePlayer", 3000, 0, "d", playerid);
					SetPVarInt(playerid, "tpPizzaTimer", 10);
					SetPVarInt(playerid, "pizzaTotal", iDist / 5);
					SetPVarInt(playerid, "pizzaTimer", 10);
					SetPVarInt(playerid, "Pizza", rand);

					SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_TPPIZZARUNTIMER);
					SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_PIZZATIMER);
					SetPVarInt(playerid, "DaLayBanh", 1);
					format(szMessage, sizeof(szMessage), "Ban da nhan duoc mot chiec banh Pizza va can phai mang toi nha cua %s. Ban co %d giay de giao!", HouseInfo[rand][hOwnerID], iDist / 5);
					SendClientMessageEx(playerid, COLOR_WHITE, szMessage);
					//CP[playerid] = 252000;
					SetPlayerCheckpoint(playerid, HouseInfo[rand][hExteriorX], HouseInfo[rand][hExteriorY], HouseInfo[rand][hExteriorZ], 5);
				}
				else if(IsPlayerInRangeOfPoint(playerid, 3.0, 2092.4639,-1802.8440,13.5487))
				{
				    if(GetPlayerSkin(playerid) != 155)
				    {
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong mac quan ao Pizza boy khong the lam viec.");
				        return 1;
				    }
				    if(!IsAPizzaCar(GetPlayerVehicleID(playerid)))
					{
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong chay xe Pizza Stack khong the lam viec.");
				        return 1;
				    }
					// if(PizzaInfo[Pizza] <= 0) return SendClientMessageEx(playerid, COLOR_YELLOW, "So luong Pizza da het ! Ban phai che bien pizza de co the giao.");
     //                PizzaInfo[Pizza] -= 1;
     //                UpdatePizzaLabel();
					SetPVarInt(playerid, "IsFrozen", 1);
					SendClientMessage(playerid, COLOR_WHITE, "Dang lay banh vui long cho {ffff00}5 giay.");
					GameTextForPlayer(playerid, "Dang Lay Banh.....", 5000, 5);
                    SetTimerEx("ReleasePlayerPZ", 5000, 0, "d", playerid);
					// SetPVarInt(playerid, "tpPizzaTimer", 10);
					// SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_TPPIZZARUNTIMER);
					
				}
				else if(IsPlayerInRangeOfPoint(playerid, 3.0, 961.7795,-1353.7681,13.3438))
				{
				    if(GetPlayerSkin(playerid) != 167)
				    {
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong mac quan ao Cluckin' Bell khong the lam viec.");
				        return 1;
				    }
				    if(!IsAClukinCar(GetPlayerVehicleID(playerid)))
					{
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong chay xe Pizza Stack khong the lam viec.");
				        return 1;
				    }
				    new rand = Random(31, 60);
					while(!(HouseInfo[rand][hExteriorZ] <= 100 && HouseInfo[rand][hExteriorX] > 159.6704 && HouseInfo[rand][hExteriorX] < 2881.3550 && HouseInfo[rand][hExteriorY] < -1221.3380 && HouseInfo[rand][hExteriorY] > -1766.5830)) {
			     	if(++rand >= 60){
							rand = 31;
						}
					}

					new
						iDist = floatround(GetPlayerDistanceFromPoint(playerid, HouseInfo[rand][hExteriorX], HouseInfo[rand][hExteriorY], HouseInfo[rand][hExteriorZ])),
						szMessage[512];

					SetPVarInt(playerid, "tpPizzaTimer", iDist / 65);
					SetPVarInt(playerid, "pizzaTotal", iDist / 10);
					SetPVarInt(playerid, "pizzaTimer", iDist / 8);
					SetPVarInt(playerid, "Pizza", rand);

					SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_TPPIZZARUNTIMER);
					SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_PIZZATIMER);
					SetPVarInt(playerid, "DaLayBanh", 1);
					format(szMessage, sizeof(szMessage), "Ban da nhan duoc mot chiec banh Hambuger va can phai mang toi nha cua %s. Ban co %d giay de giao!", HouseInfo[rand][hOwnerID], iDist / 8);
					SendClientMessageEx(playerid, COLOR_WHITE, szMessage);

					SetPlayerCheckpoint(playerid, HouseInfo[rand][hExteriorX], HouseInfo[rand][hExteriorY], HouseInfo[rand][hExteriorZ], 5);
				}
				else if(IsPlayerInRangeOfPoint(playerid, 3.0, 794.1785,-1625.3730,13.3828))
				{
				    if(GetPlayerSkin(playerid) != 205)
				    {
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong mac quan ao Burger Shot khong the lam viec.");
				        return 1;
				    }
				    if(!IsAHambugerShotCar(GetPlayerVehicleID(playerid)))
					{
				        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong chay xe Pizza Stack khong the lam viec.");
				        return 1;
				    }
				    new rand = Random(61, 100);
					while(!(HouseInfo[rand][hExteriorZ] <= 100 && HouseInfo[rand][hExteriorX] > 159.6704 && HouseInfo[rand][hExteriorX] < 2881.3550 && HouseInfo[rand][hExteriorY] < -1221.3380 && HouseInfo[rand][hExteriorY] > -1766.5830)) {
			     	if(++rand >= 100){
							rand = 61;
						}
					}

					new
						iDist = floatround(GetPlayerDistanceFromPoint(playerid, HouseInfo[rand][hExteriorX], HouseInfo[rand][hExteriorY], HouseInfo[rand][hExteriorZ])),
						szMessage[512];

					SetPVarInt(playerid, "tpPizzaTimer", iDist / 65);
					SetPVarInt(playerid, "pizzaTotal", iDist / 10);
					SetPVarInt(playerid, "pizzaTimer", iDist / 8);
					SetPVarInt(playerid, "Pizza", rand);

					SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_TPPIZZARUNTIMER);
					SetTimerEx("OtherTimerEx", 1000, false, "ii", playerid, TYPE_PIZZATIMER);
					SetPVarInt(playerid, "DaLayBanh", 1);
					format(szMessage, sizeof(szMessage), "Ban da nhan duoc mot chiec banh Hambuger va can phai mang toi nha cua %s. Ban co %d giay de giao!", HouseInfo[rand][hOwnerID], iDist / 8);
					SendClientMessageEx(playerid, COLOR_WHITE, szMessage);

					SetPlayerCheckpoint(playerid, HouseInfo[rand][hExteriorX], HouseInfo[rand][hExteriorY], HouseInfo[rand][hExteriorZ], 5);
				}
				else
				{
					SendClientMessageEx(playerid, COLOR_WHITE,"Ban khong dung trong diem lay banh.");
					return 1;
				}
			}
			else return SendClientMessageEx(playerid, COLOR_WHITE,"Ban can phai o tren xe de lay banh.");
		}
		else return SendClientMessageEx(playerid, COLOR_WHITE,"Ban dang cung cap pizza.");
	}
	else return SendClientMessageEx(playerid, COLOR_WHITE, "Ban khong phai la PizzaBoy.");
	return 1;
}