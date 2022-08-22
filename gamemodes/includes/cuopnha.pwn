/*
 Cuop Nha
*/
#include <YSI\y_hooks>
hook OnGameModeInit()
{

    return 1;
}
CMD:cuopnha(playerid ,params[]) {
    for(new i = 0; i < sizeof(HouseInfo); i++) 
    {
        if(IsPlayerInRangeOfPoint(playerid,3,HouseInfo[i][hExteriorX], HouseInfo[i][hExteriorY], HouseInfo[i][hExteriorZ]) && GetPlayerInterior(playerid) == HouseInfo[i][hExtIW] && GetPlayerVirtualWorld(playerid) == HouseInfo[i][hExtVW])
        {
            new str[128];
            if(PlayerInfo[playerid][pPhousekey] == i || PlayerInfo[playerid][pPhousekey2] == i) return SendClientMessage(playerid, COLOR_RED, "Khong the cuop nha cua ban");
            if(HouseInfo[i][hTimeRespawn] > 0)
            {
                format(str, sizeof(str), "Nha nay da bi cuop roi phai doi %i moi duoc cuop tiep", HouseInfo[i][hTimeRespawn]);
                SendClientMessage(playerid, COLOR_RED , str);
                return 1;
            }
            if(HouseInfo[i][hDangCuop] == true) return SendClientMessage(playerid, COLOR_RED, "Nha nay dang bi cuop");
            if(HouseInfo[i][hRobKey] == 0)
            {
                new Rand = Random(1000, 9999);
                HouseInfo[i][hRobKey] = Rand;
            }
            SetPVarInt(playerid, "HouseRobID", i);
            new KeyPadHouse[5];
            valstr(KeyPadHouse, HouseInfo[i][hRobKey]);
            HouseInfo[i][hDangCuop] = true;
            ShowPlayerKeypad(playerid, KEYPAD_HOUSEROB, KeyPadHouse);
            format(str, sizeof(str), "%i", HouseInfo[i][hRobKey]);
            SendClientMessage(playerid, COLOR_RED , str);

            return 1;


        }
    }
    return 1;
}

    