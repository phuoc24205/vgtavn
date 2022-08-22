
/*
  Don rac V1.0
  enum pinfo
  pTrash

*/
#include <YSI\y_hooks>
enum enum_DonRac {
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    Float:PosA
}
enum enum_Trash {
    Modelid,
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    Float:RosX,
    Float:RosY,
    Float:RosZ,
    TimeRespawn,
    layracid

}
new DonRacPos[][enum_DonRac] = {
    {2175.2588,-1988.6812,14.1240,358.4360},
    {2180.6602,-1988.4402,14.1233,359.4790},
    {2186.1311,-1988.8413,14.1233,358.1717},
    {2191.0627,-1988.8259,14.1219,359.4686}

};
new TrashPos[][enum_Trash] =
{
    {1339, 2389.06958, -1899.07568, 13.19070,   0.00000, 0.00000, 357.55829},
    {1339, 2520.39038, -1722.80933, 13.23783,   0.00000, 0.00000, 94.74760},
    {1339, 2282.82324, -2066.26733, 13.25767,   0.00000, 0.00000, 315.93198},
    {1339, 2359.01392, -1668.89893, 13.11945,   0.00000, 0.00000, 179.05666},
    {1331, 2784.60693, -1361.33447, 25.28665,   0.00000, 0.00000, 275.08533},
    {3035, 2256.28589, -2239.44531, 13.17400,   0.00000, 0.00000, 225.92891},
    {1339, 2091.13647, -1820.63672, 12.89130,   0.00000, 0.00000, 0.00000},
    {1339, 807.05298, -1384.40649, 13.08380,   0.00000, 0.00000, 0.00000}

};
new TrashObject[sizeof(TrashPos)];
new Text3D:TrashLabel[sizeof(TrashPos)];
new Text3D:DonRac3DText[MAX_VEHICLES];
new DonRacSave[MAX_VEHICLES];
new DonRacVeh[sizeof(DonRacPos)];
LoadVehicleDonRac()
{
    for(new i = 0; i < sizeof(DonRacPos); i++)
    {
        new Float:Pos[4], str[128];
        Pos[0] = DonRacPos[i][PosX];
        Pos[1] = DonRacPos[i][PosY];
        Pos[2] = DonRacPos[i][PosZ];
        Pos[3] = DonRacPos[i][PosA];
        DonRacVeh[i] = AddStaticVehicleEx(408, Pos[0], Pos[1], Pos[2],  Pos[3],1,1,600);
        format(str, sizeof(str), "So rac : 0/20");
        DonRac3DText[DonRacVeh[i]] = CreateDynamic3DTextLabel(str, 0xFFFFFFFF, 0.0, 0.0, 0.2, 30.0, INVALID_PLAYER_ID,  DonRacVeh[i], 0, -1, -1);
        DonRacSave[DonRacVeh[i]] = 0;
    }
    return 1;
}
CreateTrash(i)
{
    TrashObject[i] =  CreateDynamicObject(TrashPos[i][Modelid], TrashPos[i][PosX], TrashPos[i][PosY], TrashPos[i][PosZ], 0.00,0.00,0.00);
    TrashLabel[i] = CreateDynamic3DTextLabel("Nhan [N] de tuong tac", COLOR_YELLOW, TrashPos[i][PosX], TrashPos[i][PosY], TrashPos[i][PosZ]+1, 4.0);
    TrashPos[i][layracid] = 0;
    return 1;
}
DestroyTrash(i)
{
    DestroyDynamic3DTextLabel(TrashLabel[i]);
    TrashPos[i][TimeRespawn] = 60*5; 
    return 1;
}
LoadTrashs()
{
    for(new i = 0; i < sizeof(TrashPos); i++)
    {
        CreateTrash(i);
    }
    return 1;
}
task RespawnTrash[1000]()
{
    for(new i = 0; i < sizeof(TrashPos); i++)
    {
        if(TrashPos[i][layracid] != 0 )
        {
            if(TrashPos[i][TimeRespawn] > 0) TrashPos[i][TimeRespawn] -= 10;
            else CreateTrash(i);
        }
    }
    return 1;
}
hook OnGameModeInit()
{
    CreateDynamicPickup(1265, 1, 2116.2205,-2003.3429,13.5469+0.2,-1);
    CreateDynamic3DTextLabel("/dorac de do rac tren xe", COLOR_YELLOW, 2116.2205,-2003.3429,13.5469+0.2, 4.0);
    LoadVehicleDonRac();
    LoadTrashs();
    RespawnTrash();
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    switch(newkeys)
    {
        case KEY_NO:
        {
            for(new i = 0; i < sizeof(TrashPos); i++)
            {
                if(IsPlayerInRangeOfPoint(playerid, 3.0, TrashPos[i][PosX], TrashPos[i][PosY], TrashPos[i][PosZ]) )
                {
                    if(PlayerInfo[playerid][pTrash] == 1) return SendClientMessage(playerid, -1, "Ban dang lay rac roi");
                    new idnguoilay =  GetPlayerSQLId(playerid);
                    if(TrashPos[i][layracid] == idnguoilay)
                    {
                        return SendClientMessage(playerid, 0xff5e5eff, "Thung rac nay da het rac, hay tim thung khac /timrac .");
                    }
                    PlayerInfo[playerid][pTrash] = 1;
                    TrashPos[i][layracid] = GetPlayerSQLId(playerid);
                    // new string[128];
                    // format(string, sizeof(string), "%d",TrashPos[i][layracid]);
                    // SendClientMessage(playerid, -1, string);
                    DestroyTrash(i);
                    SetPlayerAttachedObject( playerid, 1, 1265, 6, 0.231186, -0.216169, 0.000000, 289.012420, 285.745208, 0.000000, 1.000000, 1.000000, 1.000000 ); // BlackBag2 - tui rac
                    return 1;
                }
            }
        }
        case KEY_FIRE:
        {
            if(PlayerInfo[playerid][pTrash] != 0)
            {
                if(GetPVarInt(playerid, "DangDonRacF")) return SendClientMessage(playerid, COLOR_GREY, "Dang dang dua rac len xe hay cho chut");
                new r_Veh = GetClosestCar(playerid);
                if(GetVehicleModel(r_Veh) == 408 && IsPlayerInRangeOfVehicle(playerid, r_Veh, 5.0) && DonRacSave[r_Veh] < 20)
                {
                    ApplyAnimation(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 0, 0, 0, 0, 0, 1);
                    SetPVarInt(playerid, "DangDonRacF", 1);
                    SetTimerEx("PutTrash", 1000, 0, "ii", playerid, r_Veh);
                    
                }
            }
        }
    }
    return 1;
}
hook OnPlayerEnterCheckpoint(playerid)
{
    // if(IsPlayerInVehicle(playerid))
    // {
    //     if(IsPlayerInRangeOfPoint(playerid, 5.0, 2116.2205,-2003.3429,13.5469) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 408)
    //     {
    //         new str[128];
    //         DonRacSave[GetPlayerVehicleID(playerid)] = 0;
    //         format(str, sizeof(str), "So rac : %i/20", DonRacSave[GetPlayerVehicleID(playerid)]);
    //         Notify_Send(playerid, str, 1000); 
    //         UpdateDynamic3DTextLabelText(DonRac3DText[GetPlayerVehicleID(playerid)], 0xFFFFFFFF, str);
    //     }
    // }
    // return 1;
}

forward PutTrash(playerid, r_Veh);
public PutTrash(playerid, r_Veh)
{
    PlayerInfo[playerid][pTrash] = 0;
    new str[128];
    PlayerInfo[playerid][pTrash] = 0;
    DonRacSave[r_Veh] += 1;
    ClearAnimations(playerid);
    RemovePlayerAttachedObject(playerid, 1);
    format(str, sizeof(str), "So rac : %i/20", DonRacSave[r_Veh]);
    // Notify_Send(playerid, str, 1000); 
    SendClientMessage(playerid, 0xff5e5eff, str);
    UpdateDynamic3DTextLabelText(DonRac3DText[r_Veh], 0xFFFFFFFF, str);
    DeletePVar(playerid, "DangDonRacF");
    // if(DonRacSave[r_Veh] == 20)
    // {
    //     SetPlayerCheckpoint(playerid, 2116.2205,-2003.3429,13.5469, 5.0);
    // }
    return 1;
}
CMD:dorac(playerid,  params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 5.0, 2199.8999,-1974.0369,13.5579) )
    {
        if(IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 408)
        {
            if(DonRacSave[GetPlayerVehicleID(playerid)] > 0)
            {
                new str[128], string[128];
                // format(str, sizeof(str), "Ban nhan duoc %i diem cong dan", DonRacSave[GetPlayerVehicleID(playerid)]);
                // Notify_Send(playerid, str, 3000); 
                SendClientMessage(playerid, 0x5effffff, "Ban da hoan thanh cong viec cong ich cho xa hoi, ban da duoc nha nuoc trao tang diem cong dan.");
                format(string, sizeof(string), "Ban da do {ff5e5e}%d tui rac{5effff} va nhan duoc {ff5e5e}%d diem cong huan{5effff} tu chinh phu.", DonRacSave[GetPlayerVehicleID(playerid)], DonRacSave[GetPlayerVehicleID(playerid)]*3);
                SendClientMessage(playerid, 0x5effffff, string);
                PlayerInfo[playerid][pDiemCongDan] += DonRacSave[GetPlayerVehicleID(playerid)]*3;
                if(PlayerInfo[playerid][pDiemCongDan] > 100)
                {
                    PlayerInfo[playerid][pDiemCongDan] = 100;
                    SendClientMessage(playerid, 0x5effffff, "Ban da dat toi da diem cong dan (100 diem)");
                }
                DonRacSave[GetPlayerVehicleID(playerid)] = 0;
                format(str, sizeof(str), "So rac : %i/20", DonRacSave[GetPlayerVehicleID(playerid)]);
                // Notify_Send(playerid, str, 1000); 
                UpdateDynamic3DTextLabelText(DonRac3DText[GetPlayerVehicleID(playerid)], 0xFFFFFFFF, str);
               
            }
            else{
                SendClientMessage(playerid, COLOR_GREY, "Xe cua ban phai co it nhat mot tui rac");
            }
            
        }
        else{
            SendClientMessage(playerid, COLOR_GREY, "Ban khong o tren chiec xe Do Rac");
        }
    }
    else
    {
        SendClientMessage(playerid, COLOR_GREY, "Ban khong o dia diem do rac.");
    }
    return 1;
}
CMD:timrac(playerid, params[])
{
    for(new i = 0; i < sizeof(TrashPos); i++)
    {
        if( TrashPos[i][layracid] == 0 || TrashPos[i][layracid] != GetPlayerSQLId(playerid) )
        {
            SetPlayerCheckpoint(playerid,TrashPos[i][PosX] , TrashPos[i][PosY]+2, TrashPos[i][PosZ], 3.0);
            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
            CP[playerid] = 252000;
            SendClientMessage(playerid, 0x5effffff, "Vi tri thung rac da xuat hien tren ban do, hay den do de lay rac.");
            return 1;
        }
    }
    SendClientMessage(playerid, COLOR_GREY, "Tat ca thung rac da het rac roi.");
    return 1;
}
hook OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
    {
        if(IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 408)
        {
            new engine,lights,alarm,doors,bonnet,boot,objective;
             new vehicleid = GetPlayerVehicleID(playerid);
            GetVehicleParamsEx(vehicleid,engine,lights,alarm,doors,bonnet,boot,objective);
            if(engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET)
            {
                SendClientMessage(playerid, COLOR_WHITE,"< De bat dau cong viec Don Rac go~ {FF0000}/timrac{FFFFFF} >");
            }
            
        }
            
    }
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
     if(GetPVarInt(playerid, "DangDonRacF"))
     {
        DeletePVar(playerid, "DangDonRacF");
     }
    return 1;
}