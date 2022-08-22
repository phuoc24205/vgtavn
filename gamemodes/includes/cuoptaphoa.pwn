/*
    Cướp tạp hóa v1.0
    enum pinfo
    pDangCuopStore,
    pKetQuaCuop,
    pTimeLayTien,
    add cái này ở phần new M26RP
    new PlayerText:StoreRob_TD[MAX_PLAYERS];
    new PlayerBar:StoreRob_Bar[MAX_PLAYERS];
    add cái này vô onplayerclickplayertextdraw
    if(playertextid == StoreRob_TD[playerid])
    {
        PlayerInfo[playerid][pKetQuaCuop] = 1;
        SendClientMessage(playerid, COLOR_GREY, "Be khoa thanh cong dang lay tien.");
        CancelSelectTextDraw(playerid);
        PlayerTextDrawHide(playerid, StoreRob_TD[playerid]);
        PlayerTextDrawDestroy(playerid, StoreRob_TD[playerid]);
        ShowPlayerProgressBar(playerid,StoreRob_Bar[playerid]);
        SetPlayerProgressBarValue(playerid, StoreRob_Bar[playerid], 0);
        defer LayTienStore(playerid);
        return 1;
    }

    
*/
#include <YSI\y_hooks>
#define KEYPAD_STORE 1
enum enum_Store  {
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    bool:DangCuop,
    bool:DaCuop,
    TimeRespawn,
    Password,
    Failed

}
enum enum_StoreTD {
    Float:PosX,
    Float:PosY,
}
new StoreTD[][enum_StoreTD] =
{
    {433.333374, 265.081481},
    {312.333374, 146.029647},
    {247.000091, 238.533340},
    {478.333435, 103.718574},
    {427.666778, 192.488891}
};
new StorePoints[][enum_Store] =
{
    {1022.1708,-1913.4664,12.7890},
    {0.0, 0.0, 0.0}
};
task ResetStoreRob[1000]()
{
    for(new i = 0; i < sizeof(StorePoints); i++)
    {
        if(StorePoints[i][DaCuop] == true)
        {
            if(StorePoints[i][TimeRespawn] > 0) StorePoints[i][TimeRespawn] -= 1;
            else 
            {
                StorePoints[i][DaCuop] = false;
                StorePoints[i][DangCuop] = false;
                new Rand = Random(10, 99);
                StorePoints[i][Password] = Rand;
                StorePoints[i][Failed] = 0;
            }
        }
    }
    return 1;
}
timer TextDrawCuopShow[1000](playerid)
{
    new Rand;
    Rand = Random(0, sizeof(StoreTD));
    StoreRob_TD[playerid] = CreatePlayerTextDraw(playerid, StoreTD[Rand][PosX], StoreTD[Rand][PosY], "Nhan vao day de be khoa");
    PlayerTextDrawLetterSize(playerid, StoreRob_TD[playerid], 0.200665, 1.317924);
    PlayerTextDrawAlignment(playerid, StoreRob_TD[playerid], 3);
    PlayerTextDrawColor(playerid, StoreRob_TD[playerid], -16776961);
    PlayerTextDrawSetShadow(playerid, StoreRob_TD[playerid], 0);
    PlayerTextDrawSetOutline(playerid, StoreRob_TD[playerid], 0);
    PlayerTextDrawBackgroundColor(playerid, StoreRob_TD[playerid], 255);
    PlayerTextDrawFont(playerid, StoreRob_TD[playerid], 2);
    PlayerTextDrawSetProportional(playerid, StoreRob_TD[playerid], 1);
    PlayerTextDrawSetShadow(playerid, StoreRob_TD[playerid], 0);
    PlayerTextDrawSetSelectable(playerid, StoreRob_TD[playerid], true);
    PlayerTextDrawShow(playerid, StoreRob_TD[playerid]);
    defer TextDrawCuopHide[500](playerid);
    return 1;
}
timer TextDrawCuopHide[1000](playerid)
{
    PlayerTextDrawHide(playerid, StoreRob_TD[playerid]);
    PlayerTextDrawDestroy(playerid, StoreRob_TD[playerid]);
    if(PlayerInfo[playerid][pKetQuaCuop] == 0)
    {
        SendClientMessage(playerid, COLOR_RED, "Ban da be khoa that bai");
        StorePoints[PlayerInfo[playerid][pDangCuopStore]][DangCuop] = false;
        PlayerInfo[playerid][pDangCuopStore] = -1;
        CancelSelectTextDraw(playerid);
        
    }
    return 1;
}
timer LayTienStore[1000](playerid)
{
    if(PlayerInfo[playerid][pTimeLayTien] < 120)
    {
        PlayerInfo[playerid][pTimeLayTien] += 1;
        SetPlayerProgressBarValue(playerid, StoreRob_Bar[playerid], PlayerInfo[playerid][pTimeLayTien]);
        ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.0, 1, 1, 1, 1, 0, 1);
    }
    else
    {
        new strings[256], stringss[256];
        new render = Random(1,5);
        SendClientMessage(playerid, COLOR_RED, "Cuop thanh cong");
        PlayerInfo[playerid][pCash] += render*50000;

        format(strings, sizeof(strings), "Ban cuop thanh cong CircleK va nhan duoc so tien $%s", number_format(render*50000));
        SendClientMessage(playerid, COLOR_YELLOW, strings);

        new szMessage[128];
        format(szMessage, sizeof(szMessage), "* %s vua cuop thanh cong CircleK va nhan duoc so tien $ %s !!", GetPlayerNameEx(playerid) , number_format(render*50000) ) ;
        SendClientMessageToAll(COLOR_YELLOW, szMessage);

        ClearActorAnimations(circlek_Actor);
        StorePoints[PlayerInfo[playerid][pDangCuopStore]][DaCuop] = true;
        StorePoints[PlayerInfo[playerid][pDangCuopStore]][TimeRespawn] = 60*240;
        CancelStoreRob(playerid);
        HidePlayerProgressBar(playerid,StoreRob_Bar[playerid]);
        return 1;
    }
    defer LayTienStore(playerid);
    return 1;
}
CancelStoreRob(playerid)
{
    StorePoints[PlayerInfo[playerid][pDangCuopStore]][DangCuop] = false;
    PlayerInfo[playerid][pDangCuopStore] = -1;
    TogglePlayerControllable(playerid, 1);
    ClearAnimations(playerid);
    return 1;
}
timer ShowKeypadRobStore[20000](playerid)
{
    new storeid = PlayerInfo[playerid][pDangCuopStore];
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, StorePoints[storeid][PosX], StorePoints[storeid][PosY], StorePoints[storeid][PosZ]))
    {
        SendClientMessage(playerid, COLOR_RED, "Cuop that bai ban da roi khoi vi tri cho cuop");
        CancelStoreRob(playerid);
        return 1;
    }
    new keypadstore[3];
    valstr(keypadstore, StorePoints[storeid][Password]);
    ShowPlayerKeypad(playerid, KEYPAD_STORE, keypadstore);
    return 1;
}
LoadStoreRob()
{
    for(new i = 0; i < sizeof(StorePoints); i++)
    {
        StorePoints[i][DangCuop] = false;
        StorePoints[i][DaCuop] = false;
        new Rand = Random(10, 99);
        StorePoints[i][Password] = Rand;
        CreateDynamic3DTextLabel("Nhan [N] de bat dau be khoa", 0xFF0000FF, StorePoints[i][PosX], StorePoints[i][PosY], StorePoints[i][PosZ], 5.0);
    }
    return 1;
}
BatDauCuopStore(playerid , storeid)
{
    PlayerInfo[playerid][pDangCuopStore] = storeid;
    StorePoints[storeid][DangCuop] = true;
    SendClientMessage(playerid, COLOR_RED, "Ban dang bat dau be khoa ! Se co 1 dong chu bat ky hien len tren man hinh hay bam vao no be khoa thanh cong !");
    //new Rand = Random(500, 1500);
    //defer TextDrawCuopShow[Rand](playerid);
    new keypadstore[4];
    valstr(keypadstore, StorePoints[storeid][Password]);
    ShowPlayerKeypad(playerid, KEYPAD_STORE, keypadstore);
    if(PlayerInfo[playerid][pAdmin] > 4)
    {
        new str[128];
        format(str, sizeof(str),"pass :%s", keypadstore);
        SendClientMessage(playerid, COLOR_RED, str);
    }
    TogglePlayerControllable(playerid, 0);
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 1, 1, 1, 0, 1);
    DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_CHIAKHOA, 1), 1);
    return 1;   
}
public OnPlayerKeypadInput(playerid, keypadID, type, key)
{
    if(keypadID == KEYPAD_STORE && type == KEYPAD_INPUT_GOOD)
    {
        PlayerInfo[playerid][pKetQuaCuop] = 1;
        SendClientMessage(playerid, COLOR_GREY, "Be khoa thanh cong dang lay tien.");
        ApplyActorAnimation(circlek_Actor, "ped", "cower", 4.0, 1, 0, 0, 0, 0); // Pay anim
        ShowPlayerProgressBar(playerid,StoreRob_Bar[playerid]);
        SetPlayerProgressBarValue(playerid, StoreRob_Bar[playerid], 0);
        defer LayTienStore(playerid);
        StorePoints[PlayerInfo[playerid][pDangCuopStore]][Failed] = 0;
        foreach(new i:Player)
        {
            if(IsACop(i))
            {
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tap hoa CircleK hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tap hoa CircleK hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tap hoa CircleK hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tap hoa CircleK hay den day mau !!!!");
            }
        }
    }
    else if(keypadID == KEYPAD_STORE && type == KEYPAD_INPUT_BAD)
    {
        if(key > StorePoints[PlayerInfo[playerid][pDangCuopStore]][Password])
        {
            GameTextForPlayer(playerid, "~R~Ma so' be' hon", 3000, 3);
        }
        else
        {
            GameTextForPlayer(playerid, "~R~Ma so' lon' hon", 3000, 3);
        }
        SendClientMessage(playerid, 0xff4242ff, "Ban da be khoa that bai, vui long khong roi khoi vi tri ban se duoc mo khoa lai trong 20 giay");
        StorePoints[PlayerInfo[playerid][pDangCuopStore]][Failed]++;
        if(StorePoints[PlayerInfo[playerid][pDangCuopStore]][Failed] == 3)
        {
            SendClientMessage(playerid, COLOR_RED, "Be khoa that bai qua nhieu lan canh sat dang den");
            foreach(new i:Player)
            {
                if(IsACop(i))
                {
                    SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tap hoa CircleK hay den day mau !!!!");
                    SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tap hoa CircleK hay den day mau !!!!");
                    SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tap hoa CircleK hay den day mau !!!!");
                    SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tap hoa CircleK hay den day mau !!!!");
                }
            }
        }
        defer ShowKeypadRobStore[20000](playerid);
    }
    else if(keypadID == KEYPAD_STORE && type == KEYPAD_INPUT_CANCEL)
    {
       CancelStoreRob(playerid);
    }
    // cuop tiem vang
    if(keypadID == KEYPAD_Gold && type == KEYPAD_INPUT_GOOD)
    {
        PlayerInfo[playerid][pKetQuaCuop] = 1;
        SendClientMessage(playerid, 0x78ff42ff, "Ban da bat dau cuop cac thanh vien trong bang nhom hay lay vang.");
        GoldPoints[PlayerInfo[playerid][pDangCuopGold]][Failed] = 0;
        GoldPoints[PlayerInfo[playerid][pDangCuopGold]][DaCuop] = true;
        GoldPoints[PlayerInfo[playerid][pDangCuopGold]][TimeRespawn] = 60*300;
        FamilyRobGold = PlayerInfo[playerid][pFMember];
        PlayerInfo[playerid][pDangCuopGold] = 100;
        ClearAnimations(playerid);
        RandCheckpointGold = Random(0, sizeof(CheckpointGold));
        TogglePlayerControllable(playerid, 1);
        for(new i = 0; i < sizeof(GoldLayVang); i++)
        {
             GoldLayVang[i][DaLay] = false;
             Gold3DText[i] = CreateDynamic3DTextLabel("Nhan [N] de lay vang", 0xFFFF00FF, GoldLayVang[i][PosX], GoldLayVang[i][PosY], GoldLayVang[i][PosZ], 5.0);
        }
        foreach(new i:Player)
        {
            if(IsACop(i))
            {
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tiem vang hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tiem vang hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tiem vang hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tiem vang hay den day mau !!!!");
                SendClientMessage(i, 0xff000011, "[BAO DONG] Co ke dang cuop tiem vang hay den day mau !!!!");
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
    return 1;
}
hook OnGameModeInit()
{
    LoadStoreRob();
    return 1;
}
hook OnPlayerConnect(playerid)
{
    StoreRob_Bar[playerid] = CreatePlayerProgressBar(playerid, 270.000000, 327.000000, 105.500000, 5.199999, -1439485014, 120.0000, 0);
    PlayerInfo[playerid][pDangCuopStore] = -1;
    PlayerInfo[playerid][pTimeLayTien] = 0;
    // HidePlayerProgressBar(playerid,StoreRob_Bar[playerid]);
    return 1;
}
hook OnPlayerSpawn(playerid)
{
    // HidePlayerProgressBar(playerid,StoreRob_Bar[playerid]);
    return 1;
}
hook OnPlayerDisconnect(playerid)
{
    if(PlayerInfo[playerid][pDangCuopStore] != -1)
    {
       CancelStoreRob(playerid);
    }
    DestroyPlayerProgressBar(playerid, StoreRob_Bar[playerid]);
    return 1;
}
CMD:setcc(playerid, params[])
{
    HidePlayerProgressBar(playerid,StoreRob_Bar[playerid]);
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    switch(newkeys)
    {
        case KEY_NO:
        {
             for(new i = 0; i < sizeof(StorePoints); i++)
            {
                if(IsPlayerInRangeOfPoint(playerid, 2.0, StorePoints[i][PosX], StorePoints[i][PosY], StorePoints[i][PosZ]))
                {
                    new str[128];
                    if(PlayerInfo[playerid][pDangCuopStore] != -1) return SendClientMessage(playerid, COLOR_RED, "Ban dang cuop tap hoa roi");
                    if(InventoryItemCheck(playerid, ITEM_CHIAKHOA, 1) == 50) return SendClientMessage(playerid, COLOR_RED, "Ban khong co dung cu be khoa Y > Tim Duong > Tho Thu Cong (/chetao)");
                    if(StorePoints[i][DaCuop] == true)
                    {
                        format(str, sizeof(str), "Tiem tap hoa nay da bi cuop vui long cho %i de cuop tiep", StorePoints[i][TimeRespawn]);
                        SendClientMessage(playerid, COLOR_RED, str);
                        return 1;
                    }
                    if(StorePoints[i][DangCuop] == true) return 1;
                    BatDauCuopStore(playerid, i);
                    return 1;
                }
            }
        }
    }
    return 1;
}