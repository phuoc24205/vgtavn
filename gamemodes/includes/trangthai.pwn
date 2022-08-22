/*
    Đói , khát , ngủ
    enum pinfo
    pHungers (lưu SQL)
    pDry (lưu SQL)
    pSleep (lưu SQL)
*/
new DiNgu[MAX_PLAYERS];
#include <YSI\y_hooks>
new DangNguVGC[MAX_PLAYERS];
new DiNguVGC[MAX_PLAYERS];
new DangNgoiVGC[MAX_PLAYERS];
new GheVGC[2];
SetTrangThai(playerid)
{
    SetPlayerProgressBarValue(playerid, HungerBar[playerid], PlayerInfo[playerid][pHungers]);
    SetPlayerProgressBarValue(playerid, DryBar[playerid], PlayerInfo[playerid][pDry]);
    SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
    return 1;
}
hook OnGameModeInit()
{
    Stats_TD[0] = TextDrawCreate(569.833679, 198.555572, "HUD:radar_burgerShot");
    TextDrawLetterSize(Stats_TD[0], 0.000000, 0.000000);
    TextDrawTextSize(Stats_TD[0], 8.090002, 8.000000);
    TextDrawAlignment(Stats_TD[0], 1);
    TextDrawColor(Stats_TD[0], -1);
    TextDrawSetShadow(Stats_TD[0], 0);
    TextDrawSetOutline(Stats_TD[0], 0);
    TextDrawBackgroundColor(Stats_TD[0], 255);
    TextDrawFont(Stats_TD[0], 4);
    TextDrawSetProportional(Stats_TD[0], 0);
    TextDrawSetShadow(Stats_TD[0], 0);

    Stats_TD[1] = TextDrawCreate(569.833679, 209.156219, "HUD:radar_dateDrink");
    TextDrawLetterSize(Stats_TD[1], 0.000000, 0.000000);
    TextDrawTextSize(Stats_TD[1], 8.090002, 8.000000);
    TextDrawAlignment(Stats_TD[1], 1);
    TextDrawColor(Stats_TD[1], -1);
    TextDrawSetShadow(Stats_TD[1], 0);
    TextDrawSetOutline(Stats_TD[1], 0);
    TextDrawBackgroundColor(Stats_TD[1], 255);
    TextDrawFont(Stats_TD[1], 4);
    TextDrawSetProportional(Stats_TD[1], 0);
    TextDrawSetShadow(Stats_TD[1], 0);


    Stats_TD[2] = TextDrawCreate(569.801696, 220.231521, "HUD:radar_ZERO");
    TextDrawLetterSize(Stats_TD[2], 0.000000, 0.000000);
    TextDrawTextSize(Stats_TD[2], 8.090002, 8.000000);
    TextDrawAlignment(Stats_TD[2], 1);
    TextDrawColor(Stats_TD[2], -1);
    TextDrawSetShadow(Stats_TD[2], 0);
    TextDrawSetOutline(Stats_TD[2], 0);
    TextDrawBackgroundColor(Stats_TD[2], 255);
    TextDrawFont(Stats_TD[2], 4);
    TextDrawSetProportional(Stats_TD[2], 0);
    TextDrawSetShadow(Stats_TD[2], 0);

    CreateDynamic3DTextLabel("{ffffff}Noi ngu gianh cho nguoi Vo Gia Cu\nALT de su dung", COLOR_WHITE, 821.9683,-1853.1847,8.9361+1, 5.0);
    CreateDynamic3DTextLabel("{ffffff}ALT de ngoi", COLOR_WHITE, 824.8211,-1853.7174,8.3301+1, 5.0);
    GheVGC[0] = INVALID_PLAYER_ID;
    GheVGC[1] = INVALID_PLAYER_ID;
    return 1;
}
hook OnPlayerConnect(playerid)
{
    // repeat TrangThaiUpdate[60000](playerid);
    HungerBar[playerid] = CreatePlayerProgressBar(playerid, 582.000000, 200.000000, 58.000000, 5.199998, -8388353, 7000.0000, 0); // Tối đa pHungers là 7000 = 1 100p
    DryBar[playerid] = CreatePlayerProgressBar(playerid, 582.000000, 211.000000, 58.000000, 5.199998, 1090519039, 3600.0000, 0); // pDry là 3600 = 60p
    SleepBar[playerid] = CreatePlayerProgressBar(playerid, 582.000000, 222.000000, 58.000000, 5.199998, 2147418367, 7200, 0); // pSleep là 7200 = 2tieng
    DangNguVGC[playerid] = 0;
    
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    if(GetPVarInt(playerid, "DangNgu"))
    {
        DeletePVar(playerid, "DangNgu");
        ClearAnimations(playerid);
        PlayerInfo[playerid][pHanhDong] = 0;
        KillTimer(DiNgu[playerid]);
    }
    for(new i = 0; i < sizeof(GheVGC); i++)
    {
        if(GheVGC[i] == playerid)
        {
            GheVGC[i] = INVALID_PLAYER_ID;
        }
    }
    DangNgoiVGC[playerid] = 0;
    DestroyPlayerProgressBar(playerid, HungerBar[playerid]);
    DestroyPlayerProgressBar(playerid, DryBar[playerid]);
    DestroyPlayerProgressBar(playerid, SleepBar[playerid]);
    for(new i = 0; i < 3; i++)
    {
        TextDrawHideForPlayer(playerid, Stats_TD[i]);
    }
    return 1;
}
hook OnPlayerDeath(playerid)
{
    if(GetPVarInt(playerid, "DangNgu"))
    {
        DeletePVar(playerid, "DangNgu");
        ClearAnimations(playerid);
        PlayerInfo[playerid][pHanhDong] = 0;
        KillTimer(DiNgu[playerid]);
    }
    DangNguVGC[playerid] = 0;
    DangNgoiVGC[playerid] = 0;
    KillTimer(DiNguVGC[playerid]);
    for(new i = 0; i < sizeof(GheVGC); i++)
    {
        if(GheVGC[i] == playerid)
        {
            GheVGC[i] = INVALID_PLAYER_ID;
        }
    }
    return 1;
}
hook OnPlayerSpawn(playerid)
{
    for(new i = 0; i < 3; i++)
    {
        TextDrawShowForPlayer(playerid, Stats_TD[i]);
    }
    
    // defer TrangThaiUpdate[60000](playerid);
    ShowPlayerProgressBar(playerid, HungerBar[playerid]);
    ShowPlayerProgressBar(playerid, DryBar[playerid]);
    ShowPlayerProgressBar(playerid, SleepBar[playerid]);
    SetTrangThai(playerid);
    
    // PlayerInfo[playerid][pHungers] = 1800; // Cái này để test
    return 1;
}
// task TrangThaiUpdate[60000](playerid) // Mỗi phút nó check 1 lần rồi trừ 
// {
//     if(PlayerInfo[playerid][pHungers] > 0) PlayerInfo[playerid][pHungers] -= 30;
//     else
//     {
//         if(PlayerInfo[playerid][pHungers] < 0) PlayerInfo[playerid][pHungers] = 0;
//         // SendClientMessageEx(playerid, COLOR_RED, "Ban dang doi bung kia");
//     }

//     if(PlayerInfo[playerid][pDry] > 0) PlayerInfo[playerid][pDry] -= 30;
//     else
//     {
//         if(PlayerInfo[playerid][pDry] < 0) PlayerInfo[playerid][pDry] = 0;
//         // SendClientMessageEx(playerid, COLOR_RED, "Ban dang khat nuoc kia");
//     }

//     if(PlayerInfo[playerid][pSleep] > 0) PlayerInfo[playerid][pSleep] -= 30;
//     else
//     {
//         if(PlayerInfo[playerid][pSleep] < 0) PlayerInfo[playerid][pSleep] = 0;
//         // SendClientMessageEx(playerid, COLOR_RED, "Ban dang buon ngu kia");
//     }
//     SetTrangThai(playerid);
//     return 1;
// }

task TrangThaiUpdate[60000]() // Mỗi 60s check 1 lần rồi trừ 
{
    foreach(new i:Player)
    {
        if(PlayerInfo[i][pHungers] > 61) PlayerInfo[i][pHungers] -= 60;
        else
        {
            PlayerInfo[i][pHungers] = 0;
            // if(PlayerInfo[i][pHungers] <= 0) PlayerInfo[i][pHungers] = 0;
            // SendClientMessageEx(i, COLOR_RED, "Ban dang doi bung kia");
        }

        if(PlayerInfo[i][pDry] > 31) PlayerInfo[i][pDry] -= 30;
        else
        {
            PlayerInfo[i][pDry] = 0;
            // if(PlayerInfo[i][pDry] <= 0) PlayerInfo[i][pDry] = 0;
            // SendClientMessageEx(i, COLOR_RED, "Ban dang khat nuoc kia");
        }

        if(PlayerInfo[i][pSleep] > 31) PlayerInfo[i][pSleep] -= 30;
        else
        {
            PlayerInfo[i][pSleep] = 0;
            // if(PlayerInfo[i][pSleep] <= 0) PlayerInfo[i][pSleep] = 0;
            // SendClientMessageEx(i, COLOR_RED, "Ban dang buon ngu kia");
        }
        SetTrangThai(i);
    }
    return 1;
}

CMD:settt(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 1337)
    {
        new string[128], stringlg[128], giveplayerid, loai, chiso;
        if(sscanf(params, "uid", giveplayerid, loai, chiso)) 
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Loai: 1. Thuc An, 2. Khat Nuoc, 3. Ngu");
            SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /settt [player] [loai] [so phut]");
            return 1;
        }
        if(IsPlayerConnected(giveplayerid))
        {
            if(loai == 1)
            {
                PlayerInfo[giveplayerid][pHungers] = 60*chiso;
                format(string, sizeof(string), "%s da dieu chinh thanh THUC AN cua %s's thanh %d phut!",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid),chiso);
                format(stringlg, sizeof(stringlg), "%s da dieu chinh thanh THUC AN cua %s's thanh %d phut(/settt)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid),chiso);
                SetPlayerProgressBarValue(giveplayerid, HungerBar[giveplayerid], PlayerInfo[giveplayerid][pHungers]);
            }
            else if(loai == 2)
            {
                PlayerInfo[giveplayerid][pDry] = 60*chiso;
                format(string, sizeof(string), "%s da dieu chinh thanh KHAT NUOC cua %s's thanh %d phut !",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid),chiso);
                format(stringlg, sizeof(stringlg), "%s da dieu chinh thanh KHAT NUOC cua %s's thanh %d phut (/settt)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid),chiso);
                SetPlayerProgressBarValue(giveplayerid, DryBar[giveplayerid], PlayerInfo[giveplayerid][pDry]);
            }
            else if(loai == 3)
            {
                PlayerInfo[giveplayerid][pSleep] = 60*chiso;
                format(string, sizeof(string), "%s da dieu chinh thanh NGU cua %s's thanh %d phut !",GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid),chiso);
                format(stringlg, sizeof(stringlg), "%s da dieu chinh thanh NGU cua %s's thanh %d phut (/settt)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid),chiso);
                SetPlayerProgressBarValue(giveplayerid, SleepBar[giveplayerid], PlayerInfo[giveplayerid][pSleep]);
            }
            else
            {
                return SendClientMessage(playerid, COLOR_GREY, "KHONG DUNG CU PHAP !! Loai 1: Thuc An, Loai 2: Khat Nuoc, Loai 3: Ngu.");
            }
            SendClientMessageEx(playerid, COLOR_YELLOW, string);
            SendClientMessageEx(giveplayerid, COLOR_YELLOW, string);
            Log("logs/stats.log", stringlg);
            
        }
    }
    else
    {
        SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
    }
    return 1;
}

CMD:ngu(playerid, params[])
{
    if(PlayerInfo[playerid][pHanhDong] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the ngu tai thoi diem nay.");
    if(!GetPVarInt(playerid, "DangNgu"))
    {
        ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 1, 1, 1, 0, 1);
        PlayerInfo[playerid][pHanhDong] = 1;
        SetPVarInt(playerid, "DangNgu", 1);
        DiNgu[playerid] = SetTimerEx("DiVaoGiacNgu", 500, 1, "i", playerid);
        SendClientMessage(playerid, COLOR_GREY, "Neu ban muon ket thuc trang thai ngu {ff0000}/thucday");
    }
    return 1;
}
CMD:thucday(playerid, params[])
{
    
    if(GetPVarInt(playerid, "DangNgu"))
    {
        DeletePVar(playerid, "DangNgu");
        ClearAnimations(playerid);
        PlayerInfo[playerid][pHanhDong] = 0;
        KillTimer(DiNgu[playerid]);
        SendClientMessage(playerid, COLOR_PURPLE, "Ban da thuc day, co the that sang khoaiii~~~~ ");
    }
    else
    {
        SendClientMessage(playerid, COLOR_GREY, "Ban co ngu dau ma thuc.");
    }
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_SPRINT)
    {
        if(PlayerInfo[playerid][pDry] == 0 && PlayerInfo[playerid][pHanhDong] == 0 )
        {
           if(!IsPlayerInAnyVehicle(playerid))
           {
            ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.1, 0, 1, 0, 1, 0, 1);
            PlayerInfo[playerid][pHanhDong] = 1;
            SendClientMessage(playerid, COLOR_GREY, "Ban khong the chay nhanh vi dang khat nuoc {ff0000} Y {AFAFAF}> {ff0000}Tim Duong {AFAFAF}> {ff0000}CircleK");
            SetTimerEx("XoaKhatNgu", 1200, 0, "i", playerid);
            PlayerInfo[playerid][pDry] = 60*5;
            SetPlayerProgressBarValue(playerid, DryBar[playerid], PlayerInfo[playerid][pDry]);
           }
            
        }
    }
    if(newkeys & KEY_JUMP)
    {
        if(PlayerInfo[playerid][pSleep] == 0 && PlayerInfo[playerid][pHanhDong] == 0)
        {
            if(!IsPlayerInAnyVehicle(playerid))
            {
                ApplyAnimation(playerid, "PED", "BIKE_fallR", 4.1, 0, 1, 0, 1, 0, 1);
                PlayerInfo[playerid][pHanhDong] = 1;
                SendClientMessage(playerid, COLOR_GREY, "Ban khong the nhay vi dang buon ngu {ff0000}/ngu {AFAFAF}hoac {ff0000} Y {AFAFAF}> {ff0000}Tim Duong {AFAFAF}> {ff0000}CircleK");
                SetTimerEx("XoaKhatNgu", 1200, 0, "i", playerid);
                PlayerInfo[playerid][pSleep] = 60*5;
                SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
            }
        }
    }
    if(IsPlayerInRangeOfPoint(playerid, 1.0, 821.9683,-1853.1847,8.9361))
    {
        if(newkeys & KEY_WALK)
        {
            if(DangNguVGC[playerid] == 0)
            {
                ShowPlayerDialog(playerid, DIALOG_NGUVOGIACU, DIALOG_STYLE_MSGBOX, "Di Vao Giac Ngu", "{ffffff}Ban co muon di {21ffe9}Ngu {ffffff}khong?", "Ok", "Huy Bo");
            }
            else
            {
                ShowPlayerDialog(playerid, DIALOG_NGUVOGIACU, DIALOG_STYLE_MSGBOX, "Thuc day", "{ffffff}Ban co muon {21ffe9}Thuc Day {ffffff}khong?", "Ok", "Huy Bo");
            }
            
        }
    }
    if(IsPlayerInRangeOfPoint(playerid, 1.0, 824.8211,-1853.7174,8.3301))
    {
        if(newkeys & KEY_WALK)
        {
            if(DangNgoiVGC[playerid] == 0)
            {
                ShowPlayerDialog(playerid, DIALOG_NGOIVOGIACU, DIALOG_STYLE_MSGBOX, "Ngoi Ghe", "{ffffff}Ban co muon di {21ffe9}Ngoi {ffffff}khong?", "Ok", "Huy Bo");
            }
            else
            {
                ShowPlayerDialog(playerid, DIALOG_NGOIVOGIACU, DIALOG_STYLE_MSGBOX, "Dung Day", "{ffffff}Ban co muon {21ffe9}Dung len {ffffff}khong?", "Ok", "Huy Bo");
            }
            
        }
    }
    return 1;
}
forward XoaKhatNgu(playerid);
public XoaKhatNgu(playerid)
{
    ClearAnimations(playerid);
    PlayerInfo[playerid][pHanhDong] = 0;   
    return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_NGUVOGIACU)
    {
        if(response)
        {
            if(DangNguVGC[playerid] == 0)
            {
                if(GheVGC[0] != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Cai ghe nay dang co nguoi ngu");
                SetPlayerPos(playerid, 821.9683,-1853.1847,8.9361);
                SetPlayerFacingAngle(playerid, 283.5987);
                PlayerInfo[playerid][pHanhDong] = 1;
                PreloadAnimLib(playerid,"CRACK");
                ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 1, 1, 1, 0, 1);
                DangNguVGC[playerid] = 1;
                SendClientMessage(playerid, COLOR_PURPLE, "Ban da di vao giac ngu.");
                DiNguVGC[playerid] = SetTimerEx("DiVaoGiacNgu2", 3000, 1, "i", playerid);
                GheVGC[0] = playerid;
                new Float:plocx,Float:plocy,Float:plocz;
                GetPlayerPos(playerid, plocx, plocy, plocz);
                foreach(new i:Player)
                {
                    if(IsPlayerInRangeOfPoint(i, 100.0,  plocx, plocy, plocz))
                    {
                        SetPlayerVirtualWorld(i, 1);
                        SetPlayerInterior(i, 1);
                        Streamer_UpdateEx(i, plocx, plocy, plocz);
                        SetPlayerVirtualWorld(i, 0);
                        SetPlayerInterior(i, 0);
                    }
                }
            }
            else
            {
               ClearAnimations(playerid);
               PlayerInfo[playerid][pHanhDong] = 0;
               DangNguVGC[playerid] = 0;
               SendClientMessage(playerid, COLOR_GREY, "Ban da thuc day."); 
               KillTimer(DiNguVGC[playerid]);
               GheVGC[0] = INVALID_PLAYER_ID;
            }
        }
        
        
    }
    if(dialogid == DIALOG_NGOIVOGIACU)
    {
        if(response)
        {
            if(DangNgoiVGC[playerid] == 0)
            {
                if(GheVGC[1] != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Cai ghe nay dang co nguoi dang ngoi roi");
                SetPlayerPos(playerid, 824.8211,-1853.7174,8.3301);
                SetPlayerFacingAngle(playerid, 122.4406);
                PlayerInfo[playerid][pHanhDong] = 1;
                PreloadAnimLib(playerid,"BLOWJOBZ");
                ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_P", 4.1, 1, 0, 0, 1, 0, 1);
                DangNgoiVGC[playerid] = 1;
                GheVGC[1] = playerid;
                new Float:plocx,Float:plocy,Float:plocz;
                GetPlayerPos(playerid, plocx, plocy, plocz);
                foreach(new i:Player)
                {
                    if(IsPlayerInRangeOfPoint(i, 100.0,  plocx, plocy, plocz))
                    {
                        SetPlayerVirtualWorld(i, 1);
                        SetPlayerInterior(i, 1);
                        Streamer_UpdateEx(i, plocx, plocy, plocz);
                        SetPlayerVirtualWorld(i, 0);
                        SetPlayerInterior(i, 0);
                    }
                }
            }
            else
            {
               ClearAnimations(playerid);
               PlayerInfo[playerid][pHanhDong] = 0;
               DangNgoiVGC[playerid] = 0;
               SendClientMessage(playerid, COLOR_GREY, "Ban da dung len."); 
               GheVGC[1] = INVALID_PLAYER_ID;
            }
        }
        
        
    }
    return 1;
}

forward DiVaoGiacNgu(playerid);
public DiVaoGiacNgu(playerid)
{
    if(PlayerInfo[playerid][pSleep] >= 5100)
    {
        PlayerInfo[playerid][pSleep] = 5100;
        SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
        DeletePVar(playerid, "DangNgu");
        ClearAnimations(playerid);
        PlayerInfo[playerid][pHanhDong] = 0;
        KillTimer(DiNgu[playerid]);
        SendClientMessage(playerid, COLOR_PURPLE, "Ban chi duoc ngu nhieu day thoi, neu muon tinh tao han {ff0000}Y {ffffff}> {ff0000}Tim Duong {ffffff}> {ff0000}CircleK{C2A2DA} (Mua {ff0000}Cafe{C2A2DA}) ");
        return 1;
    }
    else
    {
        PlayerInfo[playerid][pSleep] += 60*2;
        SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
    }
    
    return 1;
}
forward DiVaoGiacNgu2(playerid);
public DiVaoGiacNgu2(playerid)
{
    if(PlayerInfo[playerid][pSleep] >= 7200)
    {
        PlayerInfo[playerid][pSleep] = 7200;
        SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
        return 1;
    }
    else
    {
        PlayerInfo[playerid][pSleep] += 60*3;
        SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
        Notify_Send(playerid, "+3 phut Giac Ngu", 1000);
    }
    
    return 1;
}
