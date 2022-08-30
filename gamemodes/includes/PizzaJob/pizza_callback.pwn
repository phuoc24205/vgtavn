#include<YSI\y_hooks>
hook OnPlayerConnect(playerid)
{
    SetPVarInt(playerid, "LamBanh", 0);
    SetPVarInt(playerid, "LayNguyenLieu", -1);
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
                return 1;
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
            UpdateKhoPizzaLabel();
            UpdateVehPizzaLabel(PizzaVehID);
            SetVehicleToRespawn(GetPlayerVehicleID(playerid));
            DisablePlayerCheckpoint(playerid);
            
        }
    }
    return 1;
}