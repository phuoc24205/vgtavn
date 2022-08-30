/*
Cuop xe V4.0
enum pinfo
	pCheckpointCuopXe,
	pIDOwnerRobCar,
	pIDRobCar,
	pDangCuopXe,
	pKeyRobCar[128],
    pRobCarTime,
*/
new PhaKhoaXeTimer[MAX_PLAYERS];
enum enum_RobCar
{
    rob_Key[128],
    KeyShow[128],
}
new Player_KeyRobCar[MAX_PLAYERS];
new KeyRobCar[][enum_RobCar] = 
{
    {"roleplay", "y,r,e,l,p,a,o,l"},
    {"vietnam", "m,v,e,a,i,n,t"},
    {"vgtavn","v,a,t,g,n,v"},
    {"thathinh","h,i,a,t,h,t,h,n"},
    {"banhbeo","o,b,n,h,a,b,e"},
    {"layloi","i,y,a,l,l,o"},
    {"toang","g,a,o,t,n"},
    {"suunhi","h,i,u,u,n,s"},
    {"tretrau","t,t,r,u,e,a,r"},
    {"sinhnhat","h,n,n,s,h,i,t,a"},
    {"hochiminh","m,o,i,i,h,h,c,n,h"},
    {"hanoi","n,i,h,o,a"},
    {"nongtrai","a,r,i,n,n,g,o,t"},
    {"vuive","i,v,v,e,u"},
    {"tiengviet","e,t,e,t,i,i,g,n,v"}
};
enum CheckPointRobVeh
{
    Float:PosX,
    Float:PosY,
    Float:PosZ
}
new RandomCheckPoint_RobVeh[][CheckPointRobVeh] = {
    {813.7307,-564.2820,16.3359},
    {2499.2412,-950.4758,82.2673},
    {2373.7429,-1141.3298,28.4649}
};
forward RobCarTimer(playerid, type);
public RobCarTimer(playerid, type)
{
    new str[128];
    switch(type)
    {
        case 0:
        {
            if(PlayerInfo[playerid][pRobCarTime] > 0)
            {
                if(PlayerInfo[playerid][pDangCuopXe] == 2) return 1;
                PlayerInfo[playerid][pRobCarTime] -= 1;
                format(str, sizeof(str), "THOI GIAN BE KHOA CON LAI : %i", PlayerInfo[playerid][pRobCarTime]);
                GameTextForPlayer(playerid, str, 1000, 3);
                SetTimerEx("RobCarTimer", 1000, false, "ii", playerid, 0);
            }
            else
            {
                PlayerInfo[playerid][pRobCarTime] = 0;
                PlayerInfo[playerid][pDangCuopXe] = 0;
                format(PlayerInfo[playerid][pKeyRobCar], 128, "");
                PlayerInfo[playerid][pIDRobCar] = INVALID_VEHICLE_ID;
                PlayerInfo[playerid][pIDOwnerRobCar] = INVALID_PLAYER_ID;
                PlayerInfo[playerid][pDangCuopXe] = 0;
                SendClientMessage(playerid, COLOR_GREY, "Be khoa that bai, /batdaubekhoa lai lan nua");
            }
        }
    }
    return 1;
}

CMD:batdaubekhoa(playerid, params[])
{
    if(InventoryItemCheck(playerid, ITEM_CHIAKHOA, 1) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co chia khoa khong the cuop xe.{ffff00} Y > Xin Viec > Lo Luyen Kim.");
    if(PlayerInfo[playerid][pDangCuopXe] > 1) return SendClientMessage(playerid, COLOR_GREY, "Ban dang thuc hien vu cuop roi");
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Ban phai ngoi tren xe moi co the su dung lenh nay");

    foreach(new i: Player)
    {
        for(new vehicleid = 0; vehicleid < MAX_PLAYERVEHICLES; vehicleid++)
        {
            if(IsPlayerInVehicle(playerid, PlayerVehicleInfo[i][vehicleid][pvId]))
            {
                if(IsABike(PlayerVehicleInfo[i][vehicleid][pvId])) return SendClientMessage(playerid, COLOR_GREY, "Xe dap va moto khong the cuop.");
                new str[128];
                new Rand = Random(0, sizeof(KeyRobCar));
                PlayerInfo[playerid][pDangCuopXe] = 1;
                PlayerInfo[playerid][pIDRobCar] = PlayerVehicleInfo[i][vehicleid][pvId];
                PlayerInfo[playerid][pIDOwnerRobCar] = i;
                format(PlayerInfo[playerid][pKeyRobCar], 128, "%s", KeyRobCar[Rand][rob_Key]);
                format(str, sizeof(str), "Su dung /bkcode [code]\nHay ghep cac ky tu voi nhau thanh 1 tu tieng anh hoac tieng viet\n%s",KeyRobCar[Rand][KeyShow]);
                SendClientMessage(playerid, 0xffaf47ff, str);
                PlayerInfo[playerid][pRobCarTime] = 30;
                SetTimerEx("RobCarTimer", 1000, false, "ii", playerid, 0);
                return 1;
            }
        }
    }
    return SendClientMessage(playerid, COLOR_GREY, "Xe nay khong the cuop");
}
CMD:bkcode(playerid, params[])
{
    new code[128];
    if(sscanf(params, "s[128]", code))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /bkcode [code]");
		return 1;
	}
    if(PlayerInfo[playerid][pDangCuopXe] != 1) return 1;
    if(isnull(PlayerInfo[playerid][pKeyRobCar])) return 1;
    if(strcmp(code,PlayerInfo[playerid][pKeyRobCar],true) == 0)
    {
        DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_CHIAKHOA, 1), 1);
        format(PlayerInfo[playerid][pKeyRobCar], 128, "");
        PlayerInfo[playerid][pDangCuopXe] = 2;
        SendClientMessage(playerid, 0x1fffbcff, "Be khoa thanh cong, va mat 1 chiec chia khoa");
        new rand = random(3);
        SetPlayerCheckpoint(playerid, RandomCheckPoint_RobVeh[rand][PosX], RandomCheckPoint_RobVeh[rand][PosY], RandomCheckPoint_RobVeh[rand][PosZ], 10);
        PlayerInfo[playerid][pCheckpointCuopXe] = rand;
    }
    else
    {
        PlayerInfo[playerid][pRobCarTime] = 0;
        PlayerInfo[playerid][pDangCuopXe] = 0;
        format(PlayerInfo[playerid][pKeyRobCar], 128, "");
        PlayerInfo[playerid][pIDRobCar] = INVALID_VEHICLE_ID;
        PlayerInfo[playerid][pIDOwnerRobCar] = INVALID_PLAYER_ID;
        PlayerInfo[playerid][pDangCuopXe] = 0;
        SendClientMessage(playerid, COLOR_GREY, "Be khoa that bai, /batdaubekhoa lai lan nua");
    }
    return 1;
}
CMD:phakhoabaove(playerid, params[])
{
    if(GetPVarInt(playerid, "PhaKhoaXeTime")) return SendClientMessage(playerid, COLOR_GREY, "Ban dang pha khoa xe, xin hay doi ket thuc.");
    new rVeh = GetClosestCar(playerid);
    if(IsPlayerInRangeOfVehicle(playerid, rVeh, 3.0))
    {

        foreach(new i: Player)
        {
            for(new vehicleid = 0; vehicleid < MAX_PLAYERVEHICLES; vehicleid++)
            {
                if(rVeh == PlayerVehicleInfo[i][vehicleid][pvId])
                {
                    if(PlayerVehicleInfo[i][vehicleid][pvLocked] != 1) return SendClientMessage(playerid, COLOR_GREY, "Xe nay khong khoa cua");
                    new Rand = Random (0, 10);
                    switch(Rand)
                    {
                        case 0 .. 7:
                        {
                            SetPVarInt(playerid, "PhaKhoaXeTime", 15);
                            PhaKhoaXeTimer[playerid] = SetTimerEx("PhaKhoaXe", 1000, true, "iiid",playerid,i,1,vehicleid );
                            PlayerInfo[playerid][pHanhDong] = 1;
                            PreloadAnimLib(playerid, "BD_FIRE");
                            ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 1, 0, 0, 1, 0, 1);

                            
                        }
                        case 8 .. 10:
                        {
                            SetPVarInt(playerid, "PhaKhoaXeTime", 15);
                            PhaKhoaXeTimer[playerid] = SetTimerEx("PhaKhoaXe", 1000, true, "iiid",playerid,i,2,vehicleid );
                            PlayerInfo[playerid][pHanhDong] = 1;
                            PreloadAnimLib(playerid, "BD_FIRE");
                            ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 1, 0, 0, 1, 0, 1);
                        }
                    }
                    // Thêm Timer 10p bẻ khóa 1 lần lưu trong SQL
                    return 1;
                }
            }
        }
        return SendClientMessage(playerid, COLOR_GREY, "Khong the pha khoa xe nay");
    }
    return 1;
}
hook OnPlayerEnterCheckpoint(playerid)
{
    if(PlayerInfo[playerid][pDangCuopXe] == 2 && IsPlayerInRangeOfPoint(playerid, 10, RandomCheckPoint_RobVeh[PlayerInfo[playerid][pCheckpointCuopXe]][PosX], RandomCheckPoint_RobVeh[PlayerInfo[playerid][pCheckpointCuopXe]][PosY], RandomCheckPoint_RobVeh[PlayerInfo[playerid][pCheckpointCuopXe]][PosZ]))
    {
        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) == PlayerInfo[playerid][pIDRobCar])
        {
            new str[128];
            new Rand = Random(1, 20);
            new Randd = Random(1, 3);
            AddItem(playerid, ITEM_DONG, Rand);
            AddItem(playerid, ITEM_SAT, Randd);
            // PlayerInfo[PlayerInfo[playerid][pIDOwnerRobCar]][pCash] -= Rand;
            format(str, sizeof(str), "Ban da cuop thanh cong chiec xe va ra thanh cong chiec xe nhan duoc %i Cuc Dong, %i Cuc Sat", Rand, Randd);
            SendClientMessage(playerid, 0x42f5daff, str);
            format(str, sizeof(str), "Xe cua ban da bi cuop, va no da bi hu hong nang. (/timxe)");
            SendClientMessage(PlayerInfo[playerid][pIDOwnerRobCar], 0x42f5daff, str);
            SetVehicleToRespawn(PlayerInfo[playerid][pIDRobCar]);
            SetVehicleHealth(PlayerInfo[playerid][pIDRobCar], 250);
            for(new i = 0; i < MAX_PLAYERVEHICLES; i++)
            {
                if(PlayerVehicleInfo[pIDOwnerRobCar][i][pvId] == PlayerInfo[playerid][pIDRobCar])
                {
                    PlayerVehicleInfo[pIDOwnerRobCar][i][pvHealth] = 250;
                }
            }
            PlayerInfo[playerid][pIDRobCar] = INVALID_VEHICLE_ID;
            PlayerInfo[playerid][pIDOwnerRobCar] = INVALID_PLAYER_ID;
            PlayerInfo[playerid][pDangCuopXe] = 0;
            DisableCheckPoint(playerid);
        }
    }
    return 1;
}

forward PhaKhoaXe(playerid, giveplayerid, tinhtrang, vehicleid);
public PhaKhoaXe(playerid, giveplayerid, tinhtrang, vehicleid)
{
    if(GetPVarInt(playerid, "PhaKhoaXeTime") > 0)
    {
        SetPVarInt(playerid, "PhaKhoaXeTime", GetPVarInt(playerid, "PhaKhoaXeTime") - 1);
        new string[128];
        format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Dang pha khoa ~r~%d~w~ giay con lai", GetPVarInt(playerid, "PhaKhoaXeTime"));
        GameTextForPlayer(playerid, string, 1100, 3);
    }
    else
    {
        DeletePVar(playerid, "PhaKhoaXeTime");
        KillTimer(PhaKhoaXeTimer[playerid]);
        ClearAnimations(playerid);
        PlayerInfo[playerid][pHanhDong] = 0;
        if(tinhtrang == 1)
        {
            SendClientMessage(playerid, 0x1fffbcff, "Pha khoa xe thanh cong, hay len xe /batdaubekhoa");
            PlayerVehicleInfo[giveplayerid][vehicleid][pvLocked] = 0;
            UnLockPlayerVehicle(giveplayerid, PlayerVehicleInfo[giveplayerid][vehicleid][pvId], PlayerVehicleInfo[giveplayerid][vehicleid][pvLock]);
        }
        else
        {
            new rand = random(3);
            if(rand == 0)
            {
                SendClientMessage(giveplayerid, COLOR_GREY, "{ff0000}** [BAO DONG]{eaeaea} Chuong chong trom tu xe cua ban da phat len, co ke dang co y trom xe cua ban.");
            }
            SendClientMessage(playerid, COLOR_GREY, "Pha khoa xe that bai.");
        }
    }
    return 1;
}

hook OnPlayerDeath(playerid)
{
    if(GetPVarInt(playerid, "PhaKhoaXeTime"))
    {
        DeletePVar(playerid, "PhaKhoaXeTime");
        KillTimer(PhaKhoaXeTimer[playerid]);
        ClearAnimations(playerid);
        PlayerInfo[playerid][pHanhDong] = 0;
        SendClientMessage(playerid, COLOR_GREY, "Ban da chet trong luc dang pha khoa xe, pha khoa xe that bai.");
    }
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
     if(GetPVarInt(playerid, "PhaKhoaXeTime"))
    {
        DeletePVar(playerid, "PhaKhoaXeTime");
        KillTimer(PhaKhoaXeTimer[playerid]);
        ClearAnimations(playerid);
        PlayerInfo[playerid][pHanhDong] = 0;
    }
    return 1;
}