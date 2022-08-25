#include <YSI\y_hooks>

enum eXePizza{
    idxe,
    idplayer,
    botbanh,
    nhanbanh,
    haisan,
    object
}
new carvid[][eXePizza];
new Text3D:XeLayHangPizza_3DText[10];
hook OnGameModeInit()
{
	carvid[0][idxe] = CreateVehicle(413,2121.090,-1777.442,13.472,89.122,3,6,-1,0);

    carvid[0][object] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(carvid[0][object], 0, "{FFFF00}Pizza Company", 120, "Ariel", 60, 1, 0, 0, 1);
    AttachDynamicObjectToVehicle(carvid[0][object], carvid[0][idxe], -0.960, -1.409, 0.650, 0.000, -11.600, 180.000);
    carvid[0][object] = CreateDynamicObject(19580,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(carvid[0][object], carvid[0][idxe], -0.940, -0.200, 0.659, 75.000, 0.000, 270.000);
    carvid[0][object] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(carvid[0][object], 0, "{FFFFFF}Delivery", 120, "Ariel", 70, 1, 0, 0, 1);
    AttachDynamicObjectToVehicle(carvid[0][object], carvid[0][idxe], -1.029, -1.920, 0.100, 0.000, 0.000, 180.000);
    carvid[0][object] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(carvid[0][object], 0, "{FFFFFF}U", 50, "Webdings", 55, 0, 0, 0, 1);
    AttachDynamicObjectToVehicle(carvid[0][object], carvid[0][idxe], -1.020, -0.500, -0.140, 0.000, 0.000, 180.000);
    carvid[0][object] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(carvid[0][object], 0, "{FFFFFF}VGTA.VN", 120, "Ariel", 120, 1, 0, 0, 0);
    AttachDynamicObjectToVehicle(carvid[0][object], carvid[0][idxe], 1.019, -0.899, 0.200, 0.000, -5.000, 0.000);
    carvid[0][idplayer] = INVALID_PLAYER_ID;
    carvid[0][botbanh] = 0;
    carvid[0][nhanbanh] = 0;
    carvid[0][haisan] = 0;
    print("loi 1");
    new str[256],idsohuu[64];
    if(carvid[0][idplayer] == INVALID_PLAYER_ID)
    {
        idsohuu = "{F5F5F5}(Trong)";
        print("loi 2");
    }
    else
    {
        format(idsohuu, sizeof(idsohuu), "{F5F5F5}cua {F54D42}%s", GetPlayerNameEx(carvid[0][idplayer]));
        print("loi 3");
    }
    format(str, sizeof(str), 
        "{FFCD00}Xe Cho Hang Pizza {F54D42}%s\n\
        {FF8356}Bot Banh: {FFCD00}%i\n\
        {FF8356}Nhan Banh: {FFCD00}%i\n\
        {FF8356}Hai San: {FFCD00}%i\n\
        ", idsohuu,carvid[0][botbanh], carvid[0][nhanbanh], carvid[0][haisan]);
    print("loi 4");
    XeLayHangPizza_3DText[0] = CreateDynamic3DTextLabel(str, 0xFFFFFFFF, 0.0, 0.0, 0.2, 30.0, INVALID_PLAYER_ID, carvid[0][idxe], 0, -1, -1);
    print("loi 5");
}


hook OnGameModeExit()
{
	DestroyVehicle(carvid[0][idxe]);
}

stock XeLayHangPizza(carid)
{
	for (new v = 0; v < 2; v++) {
	    if(carid == carvid[v][idxe]) return 1;
	}
	return 0;
}