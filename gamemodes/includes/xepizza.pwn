#include <YSI\y_hooks>

new carvid[10];
new xepizza_object[10];
new Text3D:Transportion_3DText[10];
hook OnGameModeInit()
{
	carvid[0] = CreateVehicle(413,2121.090,-1777.442,13.472,89.122,3,6,-1,0);

    xepizza_object[0] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(xepizza_object[0], 0, "{FFFF00}Pizza Company", 120, "Ariel", 60, 1, 0, 0, 1);
    AttachDynamicObjectToVehicle(xepizza_object[0], carvid[0], -0.960, -1.409, 0.650, 0.000, -11.600, 180.000);
    xepizza_object[0] = CreateDynamicObject(19580,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    AttachDynamicObjectToVehicle(xepizza_object[0], carvid[0], -0.940, -0.200, 0.659, 75.000, 0.000, 270.000);
    xepizza_object[0] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(xepizza_object[0], 0, "{FFFFFF}Delivery", 120, "Ariel", 70, 1, 0, 0, 1);
    AttachDynamicObjectToVehicle(xepizza_object[0], carvid[0], -1.029, -1.920, 0.100, 0.000, 0.000, 180.000);
    xepizza_object[0] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(xepizza_object[0], 0, "{FFFFFF}U", 50, "Webdings", 55, 0, 0, 0, 1);
    AttachDynamicObjectToVehicle(xepizza_object[0], carvid[0], -1.020, -0.500, -0.140, 0.000, 0.000, 180.000);
    xepizza_object[0] = CreateDynamicObject(19483,0.0,0.0,-1000.0,0.0,0.0,0.0,-1,-1,-1,300.0,300.0);
    SetDynamicObjectMaterialText(xepizza_object[0], 0, "{FFFFFF}VGTA.VN", 120, "Ariel", 120, 1, 0, 0, 0);
    AttachDynamicObjectToVehicle(xepizza_object[0], carvid[0], 1.019, -0.899, 0.200, 0.000, -5.000, 0.000);

}


hook OnGameModeExit()
{
	DestroyVehicle(carvid[0]);
}

stock XeLayHangPizza(carid)
{
	for (new v = 0; v < sizeof(carvid); v++) {
	    if(carid == carvid[v]) return 1;
	}
	return 0;
}