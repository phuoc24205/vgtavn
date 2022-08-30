#include <YSI\y_hooks>

hook OnGameModeInit()
{
    for(new i = 0; i < sizeof(VehPizzaPos); i++)
    {
        carvid[i][idxe] =  CreateVehicle(413,VehPizzaPos[i][PosX],VehPizzaPos[i][PosY],VehPizzaPos[i][PosZ],VehPizzaPos[i][Rot],3,6,-1,0);

        carvid[i][object] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
        SetDynamicObjectMaterialText(carvid[i][object], 0, "{FFFF00}Pizza Company", 120, "Ariel", 60, 1, 0, 0, 1);
        AttachDynamicObjectToVehicle(carvid[i][object], carvid[i][idxe], -0.960, -1.409, 0.650, 0.000, -11.600, 180.000);
        carvid[i][object] = CreateDynamicObject(19580,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
        AttachDynamicObjectToVehicle(carvid[i][object], carvid[i][idxe], -0.940, -0.200, 0.659, 75.000, 0.000, 270.000);
        carvid[i][object] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
        SetDynamicObjectMaterialText(carvid[i][object], 0, "{FFFFFF}Delivery", 120, "Ariel", 70, 1, 0, 0, 1);
        AttachDynamicObjectToVehicle(carvid[i][object], carvid[i][idxe], -1.029, -1.920, 0.100, 0.000, 0.000, 180.000);
        carvid[i][object] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
        SetDynamicObjectMaterialText(carvid[i][object], 0, "{FFFFFF}U", 50, "Webdings", 55, 0, 0, 0, 1);
        AttachDynamicObjectToVehicle(carvid[i][object], carvid[i][idxe], -1.020, -0.500, -0.140, 0.000, 0.000, 180.000);
        carvid[i][object] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
        SetDynamicObjectMaterialText(carvid[i][object], 0, "{FFFFFF}VGTA.VN", 120, "Ariel", 120, 1, 0, 0, 0);
        AttachDynamicObjectToVehicle(carvid[i][object], carvid[i][idxe], 1.019, -0.899, 0.200, 0.000, -5.000, 0.000);
        carvid[i][idplayer] = INVALID_PLAYER_ID;
        for(new j = 0; j < 3; j++)
        {
            carvid[i][nguyenlieu][j] = 0;
        }
        new str[128];
        format(str, sizeof(str), "%i Hai San\n%i Nuoc Ep\n%i Bot Lam Banh", carvid[i][nguyenlieu][0], carvid[i][nguyenlieu][1], carvid[i][nguyenlieu][2]);
        carvid[i][label] = CreateDynamic3DTextLabel(str, 0xFFFFFFFF, 0.0, 0.0, 0.2, 30.0, INVALID_PLAYER_ID,  carvid[i][idxe], 0, -1, -1);
    }

    return 1;
}
hook OnGameModeExit()
{
    for(new i = 0; i < sizeof(VehPizzaPos); i++){
        DestroyVehicle(carvid[i][idxe]);
        DestroyDynamicObject(carvid[i][object]);
    } 
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_FIRE && GetPVarInt(playerid, "LayNguyenLieu") != -1)
    {
        for(new i = 0; i < sizeof(VehPizzaPos); i++)
        {
           new Float:VehPos[3];
           GetVehiclePos(carvid[i][idxe], VehPos[0], VehPos[1], VehPos[2]);
           if(IsPlayerInRangeOfPoint(playerid, 4.0, VehPos[0], VehPos[1], VehPos[2]))
           {
                if(SoLuongCop(i) == 5) return SendClientMessage(playerid, COLOR_GREY, "Cop xe da day ! Hay quay ve giao hang");
                carvid[i][nguyenlieu][GetPVarInt(playerid, "LayNguyenLieu")] += 1;
                SetPVarInt(playerid, "LayNguyenLieu", -1);
                UpdateVehPizzaLabel(i);
                SendClientMessage(playerid, COLOR_GREY, "Ban da cat nguyen lieu vao xe");
                return;
           }
        }
    }
    return 1;
}
hook OnPlayerEnterCheckpoint(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 3.0, 2129.6055,-1802.0852,13.6408))
    {
        new PizzaVehID = XeLayHangPizza(GetPlayerVehicleID(playerid));
        if(PizzaVehID != -1)
        {
            for(new i = 0; i < 3; i++)
            {
                PizzaInfo[NguyenLieu][i] += carvid[PizzaVehID][nguyenlieu][i];
                carvid[PizzaVehID][nguyenlieu][i] = 0;
            }
            UpdateVehPizzaLabel(PizzaVehID);
            UpdatePizzaLabel();
            SetVehicleToRespawn(GetPlayerVehicleID(playerid));
            DisablePlayerCheckpoint(playerid);
            
        }
    }
    return 1;
}
stock UpdateVehPizzaLabel(id)
{
    new str[128];
    format(str, sizeof(str), "%i Hai San\n%i Nuoc Ep\n%i Bot Lam Banh", carvid[id][nguyenlieu][0], carvid[id][nguyenlieu][1], carvid[id][nguyenlieu][2]);
    UpdateDynamic3DTextLabelText(carvid[id][label], 0xFFFFFFFF, str);
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