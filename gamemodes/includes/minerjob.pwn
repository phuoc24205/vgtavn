/*
    Đào khoáng sản V1.0
    enum pinfo
    pMining
    pMineTime

*/

#include <YSI\y_hooks>
enum enum_mPos {
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    Float:PosA,
    Mining,
    Location,
    SoLan
}
new Miner_Zone;
new MinerPoints[][enum_mPos] = {
    {540.9409,828.0004,-38.7872,178.6423, 0,1,0},
    {524.8939,840.3464,-42.9609,171.7489, 0,2,0},
    {514.1629,850.1157,-42.8523,112.9253, 0,3,0},
    {533.8535,921.2797,-42.0467,10.6733, 0,4,0},
    {592.9744,917.6461,-42.2867,347.9258, 0,5,0},
    {694.6631,907.3171,-39.1191,329.7737, 0,6,0},
    {555.7443,914.8492,-42.5911,74.5532, 0,7,0},
    {596.3528,931.7349,-40.3420,99.8977, 0,8,0},
    {604.5243,873.1516,-42.6558,221.5448, 0,9,0},
    {607.2166,862.9365,-42.2619,288.2855, 0,10,0},
    {634.3328,856.9216,-42.1869,257.8919, 0,11,0},
    {639.7256,821.8779,-42.0366,67.3835, 0,12,0},
    {639.2888,856.8361,-40.2019,94.6203, 0,13,0}

    
};
LoadMinerPoints()
{
    for(new i = 0; i < sizeof(MinerPoints); i++)
    {
        CreateDynamic3DTextLabel("Nhan {c72a2a}[ALT]{ffc966} de bat dau\nNhan {c72a2a}[N]{ffc966} de dao\nNhan {c72a2a}[ALT]{ffc966} de ket thuc", 0xffc966FF, MinerPoints[i][PosX], MinerPoints[i][PosY], MinerPoints[i][PosZ], 50.0);
    }
    return 1;
}
EndMining(playerid)
{
    new minerid = PlayerInfo[playerid][pMining];
    MinerPoints[minerid][Mining] = 0;
    PlayerInfo[playerid][pMining] = INVALID_PLAYER_ID;
    ClearAnimations(playerid);
    TogglePlayerControllable(playerid, 1);
    // DeletePVar(playerid, "IsFrozen");
}
timer MinerTimeReset[2000](playerid)
{
    if(PlayerInfo[playerid][pMineTime] != 0) PlayerInfo[playerid][pMineTime] = 0;
    return 1;
}
hook OnGameModeInit()
{
    Miner_Zone = GangZoneCreate(490.4705, 730.5855, 841.9067, 1040.031);
    LoadMinerPoints();
    GiaVang[0] = 1000;//dong
    GiaVang[1] = 2000;//sat
    GiaVang[2] = 30000;//vang
    GiaVang[3] = 50000;//kc
    return 1;
}
hook OnPlayerConnect(playerid)
{
    PlayerInfo[playerid][pMining] = INVALID_PLAYER_ID;
    GangZoneShowForPlayer(playerid, Miner_Zone, COLOR_RED);
    return 1;
}
hook OnPlayerDisconnect(playerid)
{
    if(PlayerInfo[playerid][pMining] != INVALID_PLAYER_ID) 
    {
        EndMining(playerid);
    }
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    switch(newkeys)
    {
        case KEY_WALK:
        {
            for(new i = 0; i < sizeof(MinerPoints); i++)
            {
                if(IsPlayerInRangeOfPoint(playerid , 3.0, MinerPoints[i][PosX],  MinerPoints[i][PosY],  MinerPoints[i][PosZ]))
                {
                    // if(PlayerInfo[playerid][pMining] != -1) return 1;
                    
                    //if(IsPlayerNearPlayer(playerid, MAX_PLAYERS, 3.0)) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Khong the thuc hien , co nguoi dang dung gan ban");
                    if(PlayerInfo[playerid][pMining] == INVALID_PLAYER_ID)
                    {
                        if(MinerPoints[i][Mining] != 0) return SendClientMessage(playerid, COLOR_LIGHTBLUE, "Cho nay da co nguoi dao hay tim cho khac");
                        MinerPoints[i][Mining] = 1;
                        PlayerInfo[playerid][pMining] = i;
                        SetPlayerAttachedObject( playerid, 1, 2228, 6, 0.004761, 0.055440, 0.198325, 168.882232, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
                        // TogglePlayerControllable(playerid, 0);
                        // SetPVarInt(playerid, "IsFrozen", 1);
                        SendClientMessage(playerid, COLOR_YELLOW, "Nhan N de dao");
                        return 1;
                    }
                    else 
                    {
                        if(IsPlayerAttachedObjectSlotUsed(playerid, 1))
                        {
                             RemovePlayerAttachedObject(playerid, 1);
                        }
                        EndMining(playerid);
                    } 
                    
                }
            }
            
            return 1;
        }
        case KEY_NO:
        {
            if(PlayerInfo[playerid][pMining] != INVALID_PLAYER_ID)
            {
                new minerid = PlayerInfo[playerid][pMining];
                if(!IsPlayerInRangeOfPoint(playerid, 3.0, MinerPoints[minerid][PosX], MinerPoints[minerid][PosY], MinerPoints[minerid][PosZ])) return SendClientMessage(playerid, COLOR_RED, "Ban khong o vi tri dao ban dau");
                if(PlayerInfo[playerid][pMineTime] != 0) return 1;
                if(MinerPoints[minerid][SoLan] > 4 )
                {
                    return SendClientMessage(playerid, COLOR_GREY, "Ban da khai thac qua nhieu, xin hay {ff0000}doi 5 phut {afafaf}de hoi phuc san luong.");
                }
                PlayerInfo[playerid][pMineTime] = 1;
                ApplyAnimation(playerid, "BASEBALL", "Bat_4", 4.1, 0, 0, 0, 1, 0, 1);
                defer MinerTimeReset(playerid);
                new rand = Random(0, 10000);
                new str[128];
                switch(rand)
                {
                    case 0 .. 8000:
                    {
                        return 1;
                    }
                    case 8001 .. 9000:
                    {
                        AddItem(playerid, ITEM_DONG, 1);
                        format(str, sizeof(str), "+ 1 Dong");
                        Notify_Send(playerid, str, 1000); 
                        SendClientMessage(playerid, 0xffdb78FF, "[DAO DA]Ban nhan duoc 1 cuc DONG.");
                        MinerPoints[minerid][SoLan]++;
                        if(MinerPoints[minerid][SoLan] == 5 )
                        {
                            SetTimerEx("ResetMoVang", 180000, 0, "i", minerid);
                        }
                    }
                    case 9001 .. 9989: 
                    {
                        AddItem(playerid, ITEM_SAT, 1);
                        format(str, sizeof(str), "+ 1 Sat");
                        Notify_Send(playerid, str, 1000); 
                        SendClientMessage(playerid, 0xffdb78FF, "[DAO DA]Ban nhan duoc 1 cuc SAT.");
                        MinerPoints[minerid][SoLan]++;
                        if(MinerPoints[minerid][SoLan] == 5 )
                        {
                            SetTimerEx("ResetMoVang", 180000, 0, "i", minerid);
                        }
                    }
                    case 9990 .. 9998: 
                    {
                        AddItem(playerid, ITEM_VANG, 1);
                        format(str, sizeof(str), "+ 1 Vang");
                        Notify_Send(playerid, str, 1000);
                        format(str, sizeof(str), "WWOWW !!! %s vua dao duoc 1 Cuc VANG.", GetPlayerNameEx(playerid)); 
                        SendClientMessageToAll(0xffdb78FF, str);
                        SendClientMessage(playerid, 0xffdb78FF, "[DAO DA]Ban nhan duoc 1 cuc VANG.");
                        MinerPoints[minerid][SoLan]++;
                        if(MinerPoints[minerid][SoLan] == 5 )
                        {
                            SetTimerEx("ResetMoVang", 180000, 0, "i", minerid);
                        }
                    }
                    case 9999 ..10000: 
                    {
                        AddItem(playerid, ITEM_KIMCUONG, 1);
                        format(str, sizeof(str), "+ 1 Kim cuong");
                        Notify_Send(playerid, str, 1000);
                        format(str, sizeof(str), "WWOWW !!! %s vua dao duoc 1 Cuc KIM CUONG, THAT MAY MANNNNN.", GetPlayerNameEx(playerid)); 
                        SendClientMessageToAll(0xffdb78FF, str);
                        SendClientMessage(playerid, 0xffdb78FF, "[DAO DA]Ban nhan duoc 1 cuc KIM CUONG.");
                        MinerPoints[minerid][SoLan]++; 
                        if(MinerPoints[minerid][SoLan] == 5 )
                        {
                            SetTimerEx("ResetMoVang", 180000, 0, "i", minerid);
                        }
                    }
                }
               
                return 1;
            }
        }
    }
    return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        
    }
    return 1;
}
CMD:chinhgiaks(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1338)
    {
        return SendClientMessage(playerid, COLOR_GREY, "Ban khong du quyen Admin de thuc hien chuc nang nay");
    }
    else
    {
        new stringks[512];
        format(stringks, sizeof(stringks), 
            "Cuc {ffc35c}Dong\t{73ff5c}%s $\n\
            Cuc {d5dbba}Sat\t{73ff5c}%s $\n\
            Cuc {ffe629}Vang\t{73ff5c}%s $\n\
            Cuc {488bf0}Kim Cuong\t{73ff5c}%s $", number_format(GiaVang[0]), number_format(GiaVang[1]), number_format(GiaVang[2]), number_format(GiaVang[3]));
        ShowPlayerDialog(playerid, DIALOG_DIEUCHINHSELL, DIALOG_STYLE_TABLIST, "Dieu chinh khoang san", stringks, "Dieu Chinh", "Huy");
    }
    return 1;
}
forward ResetMoVang(movangid);
public ResetMoVang(movangid)
{
    MinerPoints[movangid][SoLan] = 0;
    return 1;
}