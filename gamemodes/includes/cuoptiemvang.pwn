/*
    Cướp tạp hóa v1.0
    enum pinfo
    pDangCuopGold,
    pKetQuaCuop,
    pTimeLayVang,
    Add trong public onkeypadinput của cuoptaphoa
    if(keypadID == KEYPAD_Gold && type == KEYPAD_INPUT_GOOD)
    {
        PlayerInfo[playerid][pKetQuaCuop] = 1;
        SendClientMessage(playerid, COLOR_GREY, "Ban da bat dau cuop cac thanh vien trong bang nhom hay lay vang.");
        GoldPoints[PlayerInfo[playerid][pDangCuopGold]][Failed] = 0;
        GoldPoints[PlayerInfo[playerid][pDangCuopGold]][DaCuop] = true;
        GoldPoints[PlayerInfo[playerid][pDangCuopGold]][TimeRespawn] = 60*1;
        PlayerInfo[playerid][pDangCuopGold] = -1;
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, 1);
        for(new i = 0; i < sizeof(GoldLayVang); i++)
        {
             GoldLayVang[i][DaLay] = false;
             Gold3DText[i] = CreateDynamic3DTextLabel("Nhan [N] de lay vang", 0xFF0000FF, GoldLayVang[i][PosX], GoldLayVang[i][PosY], GoldLayVang[i][PosZ], 5.0);
        }
        foreach(new i:Player)
        {
            if(IsACop(i))
            {
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang tiem vang hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang tiem vang hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang tiem vang hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang tiem vang hay den day mau !!!!");
            }
        }
    }
    else if(keypadID == KEYPAD_Gold && type == KEYPAD_INPUT_BAD)
    {
        if(key > GoldPoints[PlayerInfo[playerid][pDangCuopGold]][Password])
        {
            GameTextForPlayer(playerid, "~R~Ma so' be' hon", 3000, 3);
        }
        else
        {
            GameTextForPlayer(playerid, "~R~Ma so' lon' hon", 3000, 3);
        }
        SendClientMessage(playerid, COLOR_RED, "Ban da be khoa that bai, vui long khong roi khoi vi tri ban se duoc mo khoa lai trong 20 giay");
        GoldPoints[PlayerInfo[playerid][pDangCuopGold]][Failed]++;
        if(GoldPoints[PlayerInfo[playerid][pDangCuopGold]][Failed] == 3)
        {
            SendClientMessage(playerid, COLOR_RED, "Be khoa that bai qua nhieu lan canh sat dang den");
            foreach(new i:Player)
            {
                if(IsACop(i))
                {
                    SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang tiem vang hay den day mau !!!!");
                    SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang tiem vang hay den day mau !!!!");
                    SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang tiem vang hay den day mau !!!!");
                    SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang tiem vang hay den day mau !!!!");
                }
            }
        }
        defer ShowKeypadRobGold[20000](playerid);
    }
    else if(keypadID == KEYPAD_Gold && type == KEYPAD_INPUT_CANCEL)
    {
       CancelGoldRob(playerid);
    }
*/
#include <YSI\y_hooks>
#define KEYPAD_Gold 2
new PlayerBar:GoldRob_Bar[MAX_PLAYERS];
new FamilyRobGold;
new RandCheckpointGold;
enum enum_Gold  {
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    bool:DangCuop,
    bool:DaCuop,
    TimeRespawn,
    Password,
    Failed

}
enum enum_GoldLayVang {
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    bool:DaLay
}
new GoldLayVang[][enum_GoldLayVang] =
{
    {1316.4752,-881.8093,39.6076},
    {1321.1377,-881.8093,39.6076},
    {1320.8004,-879.2521,39.6076},
    {1321.1492,-888.9112,39.6076},
    {1316.5748,-888.9120,39.6076},
    {1309.5676,-888.1633,39.6076},
    {1307.3010,-889.3079,39.6076},
    {1307.3031,-893.4952,39.6076}
};
new CheckpointGold[][enum_GoldLayVang] =
{
    {-1462.4656,501.7678,10.0078}
};
new Text3D:Gold3DText[sizeof(GoldLayVang)];
new GoldPoints[][enum_Gold] =
{
    {1308.2781,-877.2443,39.6140}
};
task ResetGoldRob[1000]()
{
    for(new i = 0; i < sizeof(GoldPoints); i++)
    {
        if(GoldPoints[i][DaCuop] == true)
        {
            if(GoldPoints[i][TimeRespawn] > 0) GoldPoints[i][TimeRespawn] -= 1;
            else 
            {
                GoldPoints[i][DaCuop] = false;
                GoldPoints[i][DangCuop] = false;
                new Rand = Random(100, 999);
                GoldPoints[i][Password] = Rand;
                GoldPoints[i][Failed] = 0;
                for(new j = 0; j < sizeof(GoldLayVang); j++)
                {
                    GoldLayVang[j][DaLay] = true;
                    DestroyDynamic3DTextLabel(Gold3DText[j]);
                }
            }
        }
    }
    return 1;
}
timer LayTienGold[200](playerid)
{
    if(PlayerInfo[playerid][pTimeLayVang] < 120)
    {
        PlayerInfo[playerid][pTimeLayVang] += 1;
        SetPlayerProgressBarValue(playerid, GoldRob_Bar[playerid], PlayerInfo[playerid][pTimeLayVang]);
        ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.0, 1, 1, 1, 1, 0, 1);
    }
    else
    {
        if(KhoKetSatVang < 1)
        {
            PlayerInfo[playerid][pHanhDong] = 0;
            ClearAnimations(playerid);
            PlayerInfo[playerid][pTimeLayVang] = 0;
            SendClientMessage(playerid, COLOR_GREY, "Cuop that bai ! Tiem vang nay da bi cuop het vang roi.");
        } 
        else
        {
            new strings[256], stringss[256];
            // new render = Random(1,5);
            SendClientMessage(playerid, 0xD98002FF, "Ban da cuop thanh cong tiem vang, nhan N de cuop tiep hoac mang vang den dia diem de giao");
            // PlayerInfo[playerid][pCash] += render*50000;
            PlayerInfo[playerid][pTimeLayVang] = 0;
            PlayerInfo[playerid][pLayVang] += 1;
            format(strings,sizeof(strings),"Tui 3 gang cua ban dang co: {F00A21}%i{D98002}/30 cuc {F8FF02}VANG",PlayerInfo[playerid][pLayVang]);
            SendClientMessage(playerid, 0xD98002FF,strings);
            ClearAnimations(playerid);
            SetPlayerCheckpoint(playerid, CheckpointGold[RandCheckpointGold][PosX], CheckpointGold[RandCheckpointGold][PosY], CheckpointGold[RandCheckpointGold][PosZ], 3.0);
            PlayerInfo[playerid][pHanhDong] = 0;
            KhoKetSatVang--;
            new stringvang[128];
            format(stringvang, sizeof(stringvang), "So Luong {FFFF1F}Vang\n{ffffff}dang co: {D9020D}%i",KhoKetSatVang );
            UpdateDynamic3DTextLabelText(KhoKetSatVangText, 0xffffffff, stringvang);
            mysql_query(MainPipeline, "UPDATE `ketsatvang` SET `soluong` = `soluong` - 1 WHERE `id` = 1");
            if(IsPlayerAttachedObjectSlotUsed(playerid, 1))
            {
                 RemovePlayerAttachedObject(playerid, 1);
            }
            PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
            SetPlayerAttachedObject( playerid, 1, 11745, 6, 0.169999, -0.1, -0.049999, -103.6, -75.4, -30.2, 1.00, 1.000000, 1.000 ); // DYN_WOODPILE2 - thunggo           
            new str[64];
            format(str,sizeof(str),"Tui 3 gang: %i/30 Vang",PlayerInfo[playerid][pLayVang]);
            Notify_Send(playerid, str, 3000);
        }
         HidePlayerProgressBar(playerid,GoldRob_Bar[playerid]);
        return 1;
    }
    defer LayTienGold(playerid);
    return 1;
}
CancelGoldRob(playerid)
{
    if(PlayerInfo[playerid][pDangCuopGold] == 100) return 1;
    GoldPoints[PlayerInfo[playerid][pDangCuopGold]][DangCuop] = false;
    PlayerInfo[playerid][pDangCuopGold] = 100;
    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid);
    DisablePlayerCheckpoint(playerid);
    PlayerInfo[playerid][pHanhDong] = 0;
    return 1;
}
timer ShowKeypadRobGold[20000](playerid)
{
    new Goldid = PlayerInfo[playerid][pDangCuopGold];
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, GoldPoints[Goldid][PosX], GoldPoints[Goldid][PosY], GoldPoints[Goldid][PosZ]))
    {
        SendClientMessage(playerid, 0xff4242ff, "Cuop that bai ban da roi khoi vi tri cho cuop");
        CancelGoldRob(playerid);
        return 1;
    }
    new keypadGold[3];
    valstr(keypadGold, GoldPoints[Goldid][Password]);
    ShowPlayerKeypad(playerid, KEYPAD_Gold, keypadGold);
    return 1;
}
LoadGoldRob()
{
    for(new i = 0; i < sizeof(GoldPoints); i++)
    {
        GoldPoints[i][DangCuop] = false;
        GoldPoints[i][DaCuop] = false;
        new Rand = Random(100, 999);
        GoldPoints[i][Password] = Rand;
        CreateDynamic3DTextLabel("Nhan [N] de bat dau be khoa", 0xFFFF00FF, GoldPoints[i][PosX], GoldPoints[i][PosY], GoldPoints[i][PosZ], 5.0);
    }
    for(new i = 0; i < sizeof(GoldLayVang); i++)
    {
        GoldLayVang[i][DaLay] = true;
    }
    return 1;
}
BatDauCuopGold(playerid , Goldid)
{
    PlayerInfo[playerid][pDangCuopGold] = Goldid;
    GoldPoints[Goldid][DangCuop] = true;
    SendClientMessage(playerid, 0xff8a66ff, "Ban dang bat dau be khoa ! Se co 1 dong chu bat ky hien len tren man hinh hay bam vao no be khoa thanh cong !");
    foreach(new i:Player)
    {
        if(IsACop(i))
        {
            SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang be khoa tiem vang hay den day mau !!!!");
            SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang be khoa tiem vang hay den day mau !!!!");
            SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang be khoa tiem vang hay den day mau !!!!");
            SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang be khoa tiem vang hay den day mau !!!!");
        }
    }
    new keypadGold[4];
    valstr(keypadGold, GoldPoints[Goldid][Password]);
    ShowPlayerKeypad(playerid, KEYPAD_Gold, keypadGold);
    if(PlayerInfo[playerid][pAdmin] > 4)
    {
        new str[128];
        format(str, sizeof(str),"pass :%s", keypadGold);
        SendClientMessage(playerid, COLOR_RED, str);
    }
    TogglePlayerControllable(playerid, 0);
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 1, 1, 1, 0, 1);
    return 1;   
}

hook OnGameModeInit()
{
    LoadGoldRob();
    return 1;
}
hook OnPlayerConnect(playerid)
{
    GoldRob_Bar[playerid] = CreatePlayerProgressBar(playerid, 270.000000, 327.000000, 105.500000, 5.199999, -1439485014, 120.0000, 0);
    PlayerInfo[playerid][pDangCuopGold] = 100;
    PlayerInfo[playerid][pTimeLayVang] = 0;
    // HidePlayerProgressBar(playerid,GoldRob_Bar[playerid]);
    return 1;
}
hook OnPlayerSpawn(playerid)
{
    // HidePlayerProgressBar(playerid,GoldRob_Bar[playerid]);
    return 1;
}
hook OnPlayerDisconnect(playerid)
{
    if(PlayerInfo[playerid][pDangCuopGold] != 100)
    {
       CancelGoldRob(playerid);
    }
    DestroyPlayerProgressBar(playerid, GoldRob_Bar[playerid]);
    if(playerid == PlayerInfo[playerid][pDangCuopGold])
    {
        GoldPoints[PlayerInfo[playerid][pDangCuopGold]][DaCuop] = true;
        GoldPoints[PlayerInfo[playerid][pDangCuopGold]][TimeRespawn] = 60*300;
    }
    
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    switch(newkeys)
    {
        case KEY_NO:
        {
            for(new i = 0; i < sizeof(GoldPoints); i++)
            {
                if(IsPlayerInRangeOfPoint(playerid, 2.0, GoldPoints[i][PosX], GoldPoints[i][PosY], GoldPoints[i][PosZ]))
                {
                    return SendClientMessage(playerid, COLOR_RED, "Tam Khoa !");
                    if(InventoryItemCheck(playerid, ITEM_CAYBUA, 1) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co Cay Bua, che tao o Lo Luyen Kim");
                    new str[128];
                    if(PlayerInfo[playerid][pDangCuopGold] == 100) 
                    {
                        if(GoldPoints[i][DaCuop] == true)
                        {
                            format(str, sizeof(str), "Tiem vang nay da bi cuop vui long cho %i de cuop tiep", GoldPoints[i][TimeRespawn]);
                            SendClientMessage(playerid, 0xff8a66ff, str);
                            return 1;
                        }
                        if(GoldPoints[i][DangCuop] == true) return 1;
                        BatDauCuopGold(playerid, i);
                        
                    }
                    else
                    {
                        return SendClientMessage(playerid, COLOR_GREY, "Ban dang cuop tiem vang roi.");
                    }
                    return 1;
                }
            }
            for(new i = 0; i < sizeof(GoldLayVang); i++)
            {
                if(IsPlayerInRangeOfPoint(playerid, 0.5, GoldLayVang[i][PosX], GoldLayVang[i][PosY], GoldLayVang[i][PosZ]))
                {
                    if(KhoKetSatVang < 1) return SendClientMessage(playerid, COLOR_GREY, "Tiem vang nay da bi cuop het vang roi.");
                    
                    if(PlayerInfo[playerid][pLayVang] == 30)
                    {
                        return SendClientMessage(playerid, COLOR_GREY, "Tui 3 gang cua ban da chua day vang roi.");
                    }
                    if(GoldLayVang[i][DaLay] == false && PlayerInfo[playerid][pTimeLayVang] <= 0 && GoldPoints[0][DaCuop] == true && PlayerInfo[playerid][pFMember] == FamilyRobGold)
                    {
                        // if(PlayerInfo[playerid][pLayVang] != 0) return SendClientMessage(playerid, COLOR_RED, "Ban da lay vang roi");
                        PlayerInfo[playerid][pTimeLayVang] = 0;
                        GoldLayVang[i][DaLay] = true;
                        ShowPlayerProgressBar(playerid,GoldRob_Bar[playerid]);
                        PlayerInfo[playerid][pHanhDong] = 1;
                        defer LayTienGold(playerid);
                    }
                    return 1;
                }
            }
        }
    }
    return 1;
}
hook OnPlayerEnterCheckpoint(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 3.0, CheckpointGold[RandCheckpointGold][PosX], CheckpointGold[RandCheckpointGold][PosY], CheckpointGold[RandCheckpointGold][PosZ]) && PlayerInfo[playerid][pLayVang] >= 1)
    {
        new string[256];
        format(string,sizeof(string),"Ban da cuop thanh cong Tiem Vang, va nhan duoc {EB369F}%i {F6FF2C}Cuc Vang", PlayerInfo[playerid][pLayVang]);
        AddItem(playerid, ITEM_VANG, PlayerInfo[playerid][pLayVang]);
        SendClientMessage(playerid, 0xD48026FF,string);
        format(string, sizeof(string),"{EB369F}[!] {2630D4}%s {D48026}da cuop thanh cong Tiem Vang, cua tiem da ton that {EB369F}%i {F6FF2C}Cuc Vang.",GetPlayerNameEx(playerid), PlayerInfo[playerid][pLayVang]);
        SendClientMessageToAll(0xD48026FF, string);
        PlayerInfo[playerid][pLayVang] = 0;
        DisablePlayerCheckpoint(playerid);
        
        if(IsPlayerAttachedObjectSlotUsed(playerid, 1))
        {
             RemovePlayerAttachedObject(playerid, 1);
        }
        for(new i = 0; i < sizeof(GoldLayVang); i++)
        {
            Gold3DText[i] = INVALID_3DTEXT_ID;
            DestroyDynamic3DTextLabel(Gold3DText[i]);
        }
    }
    return 1;
}

hook OnPlayerDeath(playerid)
{
    if(PlayerInfo[playerid][pLayVang] != 0)
    {
        PlayerInfo[playerid][pLayVang] = 0;
        DisablePlayerCheckpoint(playerid);
        SendClientMessage(playerid, 0xD48026FF,"Ban da chet, cuop vang that bai");
    }

    return 1;
}