/*
    Job chat go
    enum pinfo
    pThueXeWoodWood,
    pWoodTime,

*/
#include <YSI\y_hooks>
#define DIALOG_WOOD 15055
#define TIEN_XEGO   100000

enum enum_Wood {
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    TimeRespawn,
    bool:DaChat,
    bool:DangChat,
    SoLan
}
// new WoodPoints[][enum_Wood] =
// {
//     {-277.55, -1335.25, 6.32},
//     {-275.18, -1345.70, 6.20},
//     {-290.96, -1343.91, 6.20},
//     {-290.39, -1332.32, 6.73},
//     {-289.01, -1353.11, 6.86},
//     {-302.23, -1341.51, 6.68},
//     {-302.00, -1348.90, 6.83},
//     {-302.99, -1333.01, 6.68},
//     {-311.77, -1339.59, 6.22},
//     {-312.36, -1349.10, 6.41},
//     {-308.58, -1358.75, 6.45}

// };

new WoodPoints[][enum_Wood] =
{
    {610.6555, 167.3225, 12.3934},
    {625.8455, 156.7325, 11.3234},
    {613.5455, 152.6625, 9.9434},
    {620.9555, 141.2625, 8.7734},
    {607.0755, 141.2625, 7.7334},
    {617.4755, 116.5224, 6.0133},
    {595.4557, 116.5224, 5.1333},
    {611.3305, 124.7046, 6.8333},
    {595.4557, 135.1125, 6.4633},
    {606.4170, 99.3677, 4.6633}

};


new Wood[MAX_VEHICLES];
new WoodMax[MAX_VEHICLES];
new WoodOwner[MAX_VEHICLES];
new WoodObject[sizeof(WoodPoints)];
new Text3D:WoodLabel[sizeof(WoodPoints)];
new Text3D:Wood3DText[MAX_VEHICLES];

timer WoodTimeReset[1000](playerid)
{
    if(PlayerInfo[playerid][pWoodTime] != 0) PlayerInfo[playerid][pWoodTime] = 0;
    return 1;
}
task RespawnWood[10000]()
{
    for(new i = 0; i < sizeof(WoodPoints); i++)
    {
        if(WoodPoints[i][DaChat] == true)
        {
            if(WoodPoints[i][TimeRespawn] > 0) WoodPoints[i][TimeRespawn] -= 10;
            else
            {
                DestroyDynamicObject(WoodObject[i]);
                CreateWood(i);
            }
        }
    }
    return 1;
}

CreateWoodVehicle(playerid, maxslot)
{
    new Float:p_Pos[4], str[256];
    GetPlayerFacingAngle(playerid, p_Pos[3]);
    GetPlayerPos(playerid, p_Pos[0], p_Pos[1], p_Pos[2]);
    new w_Veh = CreateVehicle(456, p_Pos[0], p_Pos[1], p_Pos[2], p_Pos[3], -1, -1, 0);
    PutPlayerInVehicle(playerid, w_Veh, 0);
    PlayerInfo[playerid][pThueXeWood] = w_Veh;
    Wood[w_Veh] = 0;
    WoodMax[w_Veh] = maxslot;
    WoodOwner[w_Veh] = playerid;
    format(str, sizeof(str), "{FF0000}Owner :{FFFFFF} %s\n{FF0000}So thung go : {FFFFFF}%i/%i", GetPlayerNameExt(playerid),Wood[w_Veh], WoodMax[w_Veh]);
    Wood3DText[w_Veh] = CreateDynamic3DTextLabel(str, 0xFFFFFFFF, 0.0, 0.0, 0.2, 30.0, INVALID_PLAYER_ID, w_Veh, 0, -1, -1);
    return 1;
}
DestroyWoodVehicle(playerid)
{
    if(PlayerInfo[playerid][pThueXeWood] == 1000) return 1;
    DestroyDynamic3DTextLabel(Wood3DText[PlayerInfo[playerid][pThueXeWood]]);
    Wood[PlayerInfo[playerid][pThueXeWood]] = 0;
    WoodMax[PlayerInfo[playerid][pThueXeWood]] = 0;
    DestroyVehicle(PlayerInfo[playerid][pThueXeWood]);
    PlayerInfo[playerid][pThueXeWood] = 0;
    return 1;
}
CreateWood(i)
{
    WoodObject[i] =  CreateDynamicObject(656, WoodPoints[i][PosX], WoodPoints[i][PosY], WoodPoints[i][PosZ], 0, 0, 0);
    WoodLabel[i] = CreateDynamic3DTextLabel("{FFFFFF}Nhan {FF0000}[N] {FFFFFF}nhieu lan de chat go\nNhan {FF0000}[ALT] {FFFFFF}de {FFFF00}bat dau/ket thuc {FFFFFF}chat go", COLOR_WHITE, WoodPoints[i][PosX], WoodPoints[i][PosY], WoodPoints[i][PosZ], 10.0);
    WoodPoints[i][DaChat] = false;
    WoodPoints[i][DangChat] = false;
    WoodPoints[i][SoLan] = 5;
    return 1;
}
DestroyWood(i)
{
    DestroyDynamicObject(WoodObject[i]);
    WoodObject[i] =  CreateDynamicObject(831, WoodPoints[i][PosX], WoodPoints[i][PosY], WoodPoints[i][PosZ]+0.8, 0, 0, 0);
    WoodPoints[i][DaChat] = true;
    WoodPoints[i][DangChat] = false;
    WoodPoints[i][TimeRespawn] = 60*1;
    return 1;
}
LoadWood()
{
    for (new i = 0; i < sizeof(WoodPoints); i++)
    {
        CreateWood(i);
    }
    return 1;
}
EndChatGo(playerid)
{
    TogglePlayerControllable(playerid , 1);

    if(PlayerInfo[playerid][pBatDauChat] < 1000) WoodPoints[PlayerInfo[playerid][pBatDauChat]][DangChat] = false;

    PlayerInfo[playerid][pBatDauChat] = 1000;

    ResetPlayerWeaponsEx(playerid);

    PlayerInfo[playerid][pHanhDong] = 0;

    return 1;
}
hook OnGameModeInit()
{
    LoadWood();
    RespawnWood();
    CreateDynamicPickup(19132, 1, 2089.5876,-2198.7642,13.5469+0.2,-1); // noi thue xe
    CreateDynamic3DTextLabel("/thuexego de thue xe", 0xffc145FF, 2089.5876,-2198.7642,13.5469, 50.0);
    CreateDynamicPickup(19132, 1, 2081.7571,-2284.4990,13.5469+0.2,-1);
    CreateDynamic3DTextLabel("/traxego de tra xe", 0xffc145FF, 2081.7571,-2284.4990,13.5469, 50.0);
    CreateDynamicPickup(1463, 1, 2032.8990,-2281.7866,13.5469+0.2,-1);
    CreateDynamic3DTextLabel("/giaogo de giao go cho nha kho.", 0xffc145FF, 2032.8990,-2281.7866,13.5469, 50.0);
    return 1;
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch(dialogid)
    {
        case DIALOG_WOOD:
        {
            if(response)
            {
                if(PlayerInfo[playerid][pCash] < TIEN_XEGO)
                {
                    return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien thue xe cho go, can 100.000");
                }
                CreateWoodVehicle(playerid,500);
                PlayerInfo[playerid][pCash] -= TIEN_XEGO;
            }
        }
    }
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    switch(newkeys)
    {
        case KEY_NO:
        {
            for(new i = 0; i < sizeof(WoodPoints); i++)
            {
                if(IsPlayerInRangeOfPoint(playerid , 3.0, WoodPoints[i][PosX],  WoodPoints[i][PosY],  WoodPoints[i][PosZ]))
                {
                    if(WoodPoints[i][DaChat] == false && WoodPoints[i][DangChat] == true && PlayerInfo[playerid][pWood] == 0)
                    {
                        if(PlayerInfo[playerid][pWoodStart] == 0) return SendClientMessage(playerid, COLOR_GREY, "Ban chua bat dau cong viec hay len xe va nhan ALT de bat dau");
                        ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.1, 0, 0, 0, 1, 0, 1);
                        if(PlayerInfo[playerid][pWoodTime] != 0) return 1;
    
                        WoodPoints[i][SoLan] -= 1;
                        defer WoodTimeReset(playerid);
                        PlayerInfo[playerid][pWoodTime] = 1;
                        // defer WoodTimeReset(playerid);
                        if(WoodPoints[i][SoLan] == 0)
                        {
                            PlayerInfo[playerid][pWood] = 1;
                            // PlayerInfo[playerid][pBatDauChat] = -1;
                            Notify_Send(playerid, "+1 Go", 1000);
                            SendClientMessage(playerid, COLOR_LIGHTBLUE, "+1 Thung Go");
                            SetPlayerAttachedObject( playerid, 8, 1463, 6, 0.045645, 0.202926, -0.094204, 245.091735, 2.611207, 147.662246, 0.246767, 1.000000, 0.968662 ); // DYN_WOODPILE2 - thunggo
                            ClearAnimations(playerid);
                            PreloadAnimLib(playerid, "CARRY");
                            ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 1, 1, 1, 1, 1, 1);
                            SendClientMessageEx(playerid, COLOR_LIGHTBLUE,"Hay mang dau tro ve chiec xe tai cua ban.");
                            GameTextForPlayer(playerid, "~w~Click Chuot Trai~r~de dua thung go len xe", 7000, 1);
                            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
                            DestroyWood(i);
                            EndChatGo(playerid);
                            

                        }
                    }
                    return 1;
                }
            }
        }
        case KEY_WALK:
        {
            for(new i = 0; i < sizeof(WoodPoints); i++)
            {
                
                if(IsPlayerInRangeOfPoint(playerid , 3.0, WoodPoints[i][PosX],  WoodPoints[i][PosY],  WoodPoints[i][PosZ]))
                {
                  
                    if(PlayerInfo[playerid][pWood] == 1) return 1;
               
                    if(PlayerInfo[playerid][pBatDauChat] == 1000)
                    {
                       
                        PlayerInfo[playerid][pBatDauChat] = i;
                      
                        WoodPoints[i][DangChat] = true;
                      
                        TogglePlayerControllable(playerid , 0);
                        GivePlayerValidWeapon(playerid, 9 , 60000);
                        SetPlayerArmedWeapon(playerid, 9);
                     
                        PlayerInfo[playerid][pHanhDong] = 1;
                    
                    }
                    else
                    {
                        EndChatGo(playerid);
                    }
                    return 1;
                }
            }
        }
        case KEY_FIRE:
        {
            if(IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 456)
            {
                for(new i = 0; i < MAX_VEHICLES; i++)
                {
                    if(WoodMax[GetPlayerVehicleID(playerid)] != 0)
                    {
                        if(PlayerInfo[playerid][pWoodStart] == 0)
                        {
                            PlayerInfo[playerid][pWoodStart] = 1;
                            SendClientMessage(playerid, COLOR_RED, "Ban da bat dau cong viec");
                            SetPlayerCheckpoint(playerid, 615.7977,137.4260,9.0912, 10.0);
                            CP[playerid] = 252000;
                        }
                        
                    }
                    return 1;
                }
            }
            if (PlayerInfo[playerid][pWood] == 0) return 1;
            new Float:v_Pos[3];
            new w_Veh = GetClosestCar(playerid);
            GetVehiclePos(w_Veh, v_Pos[0], v_Pos[1], v_Pos[2]);
            if(WoodMax[w_Veh] != 0)
            {
                if(IsPlayerInRangeOfPoint(playerid, 5.0, v_Pos[0], v_Pos[1], v_Pos[2]))
                {
                    new str[128], string[256];
                    if(Wood[w_Veh] == WoodMax[w_Veh]) return SendClientMessage(playerid, COLOR_CYAN, "Xe nay da chua toi da go roi");
                    Wood[w_Veh] += 1;
                    PlayerInfo[playerid][pWood] = 0;
                    format(str, sizeof(str), "{FF0000}Owner :{FFFFFF} %s\n{FF0000}So thung go : {FFFFFF}%i/%i", GetPlayerNameExt(playerid), Wood[w_Veh], WoodMax[w_Veh]);
                    UpdateDynamic3DTextLabelText(Wood3DText[w_Veh], 0xFFFFFFFF, str);
                    format(string,sizeof(string),"Ban vua chat 1 thung go len xe, hien tai tren xe %d/%d thung go.",Wood[w_Veh], WoodMax[w_Veh]);
                    SendClientMessage(playerid, COLOR_CYAN, string);
                    PreloadAnimLib(playerid, "CARRY");
                    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, 0);
                    ClearAnimations(playerid);
                    DeletePVar(playerid, "IsFrozen");
                    DeletePVar(playerid, "PlayerCuffed");
                    PlayerCuffed[playerid] = 0;
                    PlayerTied[playerid] = 0;
                    TogglePlayerControllable(playerid, 1);
                    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                    if(IsPlayerAttachedObjectSlotUsed(playerid, 8))
                    {
                         RemovePlayerAttachedObject(playerid, 8);
                    }
                    PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
                    PlayerInfo[playerid][pHanhDong] = 0;
                }
                else
                {
                    PlayerInfo[playerid][pWood] = 0;
                    DeletePVar(playerid, "IsFrozen");
                    DeletePVar(playerid, "PlayerCuffed");
                    PlayerCuffed[playerid] = 0;
                    PlayerTied[playerid] = 0;
                    TogglePlayerControllable(playerid, 1);
                    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                    SendClientMessage(playerid, COLOR_GREY, "Dua go len xe that bai, ban di qua xa xe cho dau cua ban");
                    if(IsPlayerAttachedObjectSlotUsed(playerid, 8))
                    {
                         RemovePlayerAttachedObject(playerid, 8);
                    }
                    PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
                    PlayerInfo[playerid][pHanhDong] = 0;
                }
            }
        }
    }
    return 1;
}
hook OnPlayerConnect(playerid)
{
    PlayerInfo[playerid][pHanhDong] = 0;
    PlayerInfo[playerid][pBatDauChat] = 1000;
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    PlayerInfo[playerid][pHanhDong] = 0;
    if(PlayerInfo[playerid][pThueXeWood] != 0)
    {
        // PlayerInfo[playerid][pCash] += 500000;
        DestroyWoodVehicle(playerid);
    }
    if(PlayerInfo[playerid][pBatDauChat] < 1000 )
    {
        PlayerInfo[playerid][pBatDauChat] = 1000;
    }
    
    return 1;
}
CMD:thuexego(playerid, params[]) {
    if(PlayerInfo[playerid][pHungers] <= 0)
    {
        return SendClientMessage(playerid, COLOR_GREY, "Ban doi bung khong the lam viec hay den cua hang {ff0000}Y > {ff0000}Tim Duong{afafaf} > {ff0000}CircleK {afafaf}hoac di {ff0000}Cau Ca.");
    }
    if(PlayerInfo[playerid][pThueXeWood] != 0) return SendClientMessage(playerid, COLOR_CYAN, "Ban da thue 1 chiec xe roi vui long den noi tra xe de tra xe");
    if(!IsPlayerInRangeOfPoint(playerid, 30.0, 2089.5876,-2198.7642,13.5469)) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong o khu vuc thue xe");
    ShowPlayerDialog(playerid, DIALOG_WOOD, DIALOG_STYLE_MSGBOX, "Thue xe go", "Gia thue : 100.000$ SAD\nKhi thue xe ban se mat 100.000$ SAD, lam xong cong viec den noi tra xe de duoc hoan tien\nKhi bi thoat game ban cung se duoc hoan tien nhung se mat toan bo so go~ tren xe", "Dong y", "Tu choi");
    return 1;
}
CMD:traxego(playerid, params[]) {

    if(PlayerInfo[playerid][pThueXeWood] == 0) return SendClientMessage(playerid, COLOR_CYAN, "Ban chua thue xe");
    if(!IsPlayerInRangeOfPoint(playerid, 10.0, 2081.7571,-2284.4990,13.5469)) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong o khu vuc tra xe");
    DestroyWoodVehicle(playerid);
    PlayerInfo[playerid][pCash] += 100000;
    return 1;
}
CMD:giaogo(playerid, params[]) {

    if(PlayerInfo[playerid][pThueXeWood] == 0) return SendClientMessage(playerid, COLOR_CYAN, "Ban chua thue xe");
    if(!IsPlayerInRangeOfPoint(playerid, 10.0, 2032.8990,-2281.7866,13.5469)) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong o khu vuc ban go");
    if(!IsPlayerInVehicle(playerid, PlayerInfo[playerid][pThueXeWood])) return SendClientMessage(playerid, COLOR_CYAN, "Ban khong o tren xe go cua ban");
    new w_Veh = PlayerInfo[playerid][pThueXeWood], str[128], strings[256];
    SendClientMessage(playerid, COLOR_CYAN, "Giao go thanh cong !");
    format(strings, sizeof(strings), "Ban nhan duoc %i thung go, nhan nut H de kiem tra", Wood[w_Veh]);
    SendClientMessage(playerid, 0xf58d42FF, strings);
    AddItem(playerid, ITEM_THUNGGO, Wood[w_Veh]);
    // PlayerInfo[playerid][pCash] += 2000*Wood[w_Veh];
    Wood[w_Veh] = 0;
    PlayerInfo[playerid][pWoodStart] = 0;
    format(str, sizeof(str), "{FF0000}Owner :{FFFFFF} %s\n{FF0000}So thung go : {FFFFFF}%i/%i", GetPlayerNameExt(playerid), Wood[w_Veh], WoodMax[w_Veh]);
    UpdateDynamic3DTextLabelText(Wood3DText[w_Veh], 0xFFFFFFFF, str);
    return 1;
}
hook OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
    {
        if(IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 456)
        {
            new w_Veh = GetClosestCar(playerid);
            if(PlayerInfo[playerid][pWoodStart] == 0)
            {
                SendClientMessage(playerid, COLOR_WHITE,"< De bat dau cong viec chat go nhan nut {FF0000}ALT{FFFFFF} >");
            }
            if(Wood[w_Veh] > 0)
            {
                SendClientMessage(playerid, COLOR_WHITE,"< De giao go nhan nut {FF0000}Y > Tim Duong LS > Noi Giao Go{FFFFFF}.");
            }
        }
            
    }
    return 1;
}