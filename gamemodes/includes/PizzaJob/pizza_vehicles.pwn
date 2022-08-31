#include<YSI\y_hooks>
enum eXePizza{
    idxe,
    idplayer,
    nguyenlieu[3],
    object,
    Text3D:label
}
enum Pizza_Pos{
    Float:PosX,
    Float:PosY,
    Float:PosZ,
    Float:Rot
}
new VehPizzaPos[][Pizza_Pos] = {
    {2121.090,-1777.442,13.472,89.122},
    {2121.2207,-1773.6622,13.4781,89.0925},
    {2121.3430,-1769.6199,13.4829,89.7490},
    {2121.5471,-1765.3048,13.4816,87.4132}
};
new carvid[][eXePizza];
new Text3D:XeLayHangPizza_3DText[10];
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