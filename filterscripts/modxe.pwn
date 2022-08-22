#include <a_samp>

new VehiclePlayer[MAX_PLAYERS];
new VehicleID[MAX_PLAYERS];
new VehicleColor1[MAX_PLAYERS];
new VehicleColor2[MAX_PLAYERS];
new CarObject551733[MAX_PLAYERS];
new CarObject829893[MAX_PLAYERS];
new CarObject27507[MAX_PLAYERS];
new CarObject310130[MAX_PLAYERS];
new CarObject500668[MAX_PLAYERS];
new CarObject743837[MAX_PLAYERS];
new CarObject412542[MAX_PLAYERS];
new CarObject461827[MAX_PLAYERS];
new CarObject921600[MAX_PLAYERS];
new CarObject567024[MAX_PLAYERS];
new CarObject40870[MAX_PLAYERS];
new CarObject756813[MAX_PLAYERS];
new CarObject176325[MAX_PLAYERS];
new CarObject254314[MAX_PLAYERS];
new CarObject908022[MAX_PLAYERS];
new CarObject512134[MAX_PLAYERS];
new CarObject977038[MAX_PLAYERS];
new CarObject277282[MAX_PLAYERS];
new CarObject849475[MAX_PLAYERS];
new CarObject707061[MAX_PLAYERS];
new CarObject175303[MAX_PLAYERS];
new CarObject822715[MAX_PLAYERS];
new CarObject417376[MAX_PLAYERS];
new CarObject521687[MAX_PLAYERS];
new CarObject920393[MAX_PLAYERS];
new CarObject746957[MAX_PLAYERS];
new CarObject671501[MAX_PLAYERS];
new CarObject140250[MAX_PLAYERS];
new CarObject211650[MAX_PLAYERS];
new CarObject519349[MAX_PLAYERS];
new CarObject729990[MAX_PLAYERS];
new CarObject956998[MAX_PLAYERS];
new CarObject535706[MAX_PLAYERS];
new CarObject61417[MAX_PLAYERS];
new CarObject108397[MAX_PLAYERS];
new CarObject669661[MAX_PLAYERS];
new CarObject407857[MAX_PLAYERS];
new CarObject224721[MAX_PLAYERS];
new CarObject304794[MAX_PLAYERS];
new CarObject862721[MAX_PLAYERS];
new CarObject924564[MAX_PLAYERS];
new CarObject588928[MAX_PLAYERS];
new CarObject987348[MAX_PLAYERS];
new CarObject341760[MAX_PLAYERS];
new CarObject732683[MAX_PLAYERS];
new CarObject970662[MAX_PLAYERS];
new CarObject481029[MAX_PLAYERS];
new CarObject523631[MAX_PLAYERS];
new CarObject602974[MAX_PLAYERS];
new CarObject229463[MAX_PLAYERS];
new CarObject728761[MAX_PLAYERS];
new CarObject541271[MAX_PLAYERS];
new CarObject451838[MAX_PLAYERS];
new CarObject809200[MAX_PLAYERS];
new CarObject212771[MAX_PLAYERS];
new CarObject291588[MAX_PLAYERS];
new CarObject404151[MAX_PLAYERS];
new CarObject584908[MAX_PLAYERS];
new CarObject876835[MAX_PLAYERS];
new CarObject757520[MAX_PLAYERS];
new CarObject695887[MAX_PLAYERS];
new CarObject420599[MAX_PLAYERS];
new CarObject613749[MAX_PLAYERS];
new CarObject563491[MAX_PLAYERS];
new CarObject904328[MAX_PLAYERS];
new CarObject99694[MAX_PLAYERS];
new CarObject778988[MAX_PLAYERS];
new CarObject908091[MAX_PLAYERS];
new CarObject853817[MAX_PLAYERS];
new CarObject582093[MAX_PLAYERS];
new CarObject927519[MAX_PLAYERS];
new CarObject505599[MAX_PLAYERS];
new CarObject31383[MAX_PLAYERS];
new CarObject385594[MAX_PLAYERS];
new CarObject650916[MAX_PLAYERS];
new CarObject395013[MAX_PLAYERS];
new CarObject508145[MAX_PLAYERS];
new CarObject799586[MAX_PLAYERS];
new CarObject989574[MAX_PLAYERS];
new CarObject158881[MAX_PLAYERS];
new CarObject326872[MAX_PLAYERS];
new CarObject353505[MAX_PLAYERS];
new CarObject322537[MAX_PLAYERS];



public OnPlayerConnect(playerid)
{
DeleteObjectsToPlayerAndVehicle(playerid);
VehicleColor1[playerid] = 0;
VehicleColor2[playerid] = 0;
VehicleID[playerid] = 0;
return 1;
}


public OnPlayerCommandText(playerid, cmdtext[])
{
	if(strcmp("/tc", cmdtext, true) == 0)
    {
      if(!IsPlayerInAnyVehicle(playerid))
       {
        ShowPlayerDialog(playerid,5300,DIALOG_STYLE_LIST,"{FFFF00}Tunable {99FF00}Car", "{CC3300}Infernus\n{CC3300}Bullet\n{CC3300}Previon","Select","Cancel");
		PlayerPlaySound(playerid, 21000, 0, 0, 0);
        }
        else
        {
        SendClientMessage(playerid,0xFF0000FF,"[Error]: {33FF00}Please exit the car!");
        }
      return 1;
    }
    return 0;
}

public OnPlayerDisconnect(playerid, reason)
{
DeleteObjectsToPlayerAndVehicle(playerid);
VehicleColor1[playerid] = 0;
VehicleColor2[playerid] = 0;
VehicleID[playerid] = 0;
return 1;
}


stock OnPlayerCreteVehicle(playerid)
{
DeleteObjectsToPlayerAndVehicle(playerid);
new Float:X,Float:Y,Float:Z,Float:Angle;
GetPlayerPos(playerid,X,Y,Z);
GetPlayerFacingAngle(playerid,Angle);
VehiclePlayer[playerid] = CreateVehicle(VehicleID[playerid],X,Y,Z+5,Angle, VehicleColor1[playerid],VehicleColor1[playerid],60);
PutPlayerInVehicle(playerid,VehiclePlayer[playerid],0);
return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
		if(dialogid == 5300)
        {
                if(response)
                {
                        switch(listitem)
                        {
                                case 0:  {VehicleID[playerid] = 411;VehicleColor1[playerid] = 226;VehicleColor2[playerid] = 226;OnPlayerCreteVehicle(playerid);TuneInfernus(playerid);PlayerPlaySound(playerid, 21000, 0, 0, 0);}
                                case 1:  {VehicleID[playerid] = 541;VehicleColor1[playerid] = 1;VehicleColor2[playerid] = 1;OnPlayerCreteVehicle(playerid);TuneBullet(playerid);PlayerPlaySound(playerid, 21000, 0, 0, 0);}
                                case 2:  {VehicleID[playerid] = 436;VehicleColor1[playerid] = 126;VehicleColor2[playerid] = 126;OnPlayerCreteVehicle(playerid);TunePrevion(playerid);PlayerPlaySound(playerid, 21000, 0, 0, 0);}
						}
                }
                return 1;
    }
        return 0;
}


public OnPlayerUpdate(playerid)
{
     new Float:vhealth;
     GetVehicleHealth(VehiclePlayer[playerid], vhealth);
     if(vhealth < 250)
     {
	 AntiLag(playerid);
	 }
	 return 1;
}



stock TunePrevion(playerid)
{
CarObject404151[playerid] = CreateObject(1149,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject404151[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject404151[playerid],GetPlayerVehicleID(playerid),1.050000,-1.840001,-0.059999,0.000000,0.000000,0.000000);
CarObject584908[playerid] = CreateObject(1149,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject584908[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject584908[playerid],GetPlayerVehicleID(playerid),1.050000,-1.690001,-0.059999,0.000000,0.000000,0.000000);
CarObject876835[playerid] = CreateObject(1020,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject876835[playerid],GetPlayerVehicleID(playerid),-0.469999,-1.680001,-0.459999,0.000000,0.000000,0.000000);
CarObject757520[playerid] = CreateObject(1020,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject757520[playerid],GetPlayerVehicleID(playerid),0.470000,-1.680001,-0.459999,0.000000,0.000000,0.000000);
CarObject695887[playerid] = CreateObject(1003,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject695887[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject695887[playerid],GetPlayerVehicleID(playerid),-0.029999,-2.480001,0.350000,0.000000,0.000000,0.000000);
CarObject420599[playerid] = CreateObject(1006,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject420599[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject420599[playerid],GetPlayerVehicleID(playerid),0.370000,-0.150001,0.800000,-5.000000,0.000000,0.000000);
CarObject613749[playerid] = CreateObject(1006,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject613749[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject613749[playerid],GetPlayerVehicleID(playerid),-0.379999,-0.150001,0.800000,-5.000000,0.000000,0.000000);
CarObject563491[playerid] = CreateObject(1171,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject563491[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject563491[playerid],GetPlayerVehicleID(playerid),-1.039999,1.729998,-0.049999,-1.000000,0.000000,0.000000);
CarObject99694[playerid] = CreateObject(1012,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject99694[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject99694[playerid],GetPlayerVehicleID(playerid),0.010000,1.249998,0.260000,-1.000000,0.000000,0.000000);
CarObject904328[playerid] = CreateObject(1005,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject904328[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject904328[playerid],GetPlayerVehicleID(playerid),0.010000,1.209998,0.260000,-1.000000,0.000000,0.000000);
CarObject778988[playerid] = CreateObject(1005,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject778988[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject778988[playerid],GetPlayerVehicleID(playerid),0.010000,1.169998,0.260000,-1.000000,0.000000,0.000000);
CarObject908091[playerid] = CreateObject(1005,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject908091[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject908091[playerid],GetPlayerVehicleID(playerid),0.010000,1.129998,0.260000,-1.000000,0.000000,0.000000);
CarObject853817[playerid] = CreateObject(1005,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject853817[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject853817[playerid],GetPlayerVehicleID(playerid),0.010000,1.089998,0.260000,-1.000000,0.000000,0.000000);
CarObject582093[playerid] = CreateObject(1005,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject582093[playerid], 0, 6283, "pierb_law2", "sanice1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject582093[playerid],GetPlayerVehicleID(playerid),0.010000,1.049998,0.260000,-1.000000,0.000000,0.000000);
CarObject927519[playerid] = CreateObject(1050,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject927519[playerid], 0, 10969, "scum_sfse", "ws_apartmentblue2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject927519[playerid],GetPlayerVehicleID(playerid),0.000000,1.279998,0.250000,-1.000000,0.000000,0.000000);
CarObject505599[playerid] = CreateObject(1050,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject505599[playerid], 0, 10969, "scum_sfse", "ws_apartmentblue2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject505599[playerid],GetPlayerVehicleID(playerid),0.900000,-0.270001,-0.449999,-651.000000,-360.000000,-270.000000);
CarObject31383[playerid] = CreateObject(1050,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject31383[playerid], 0, 10969, "scum_sfse", "ws_apartmentblue2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject31383[playerid],GetPlayerVehicleID(playerid),0.900000,0.189998,-0.449999,-651.000000,-360.000000,-270.000000);
CarObject385594[playerid] = CreateObject(1050,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject385594[playerid], 0, 10969, "scum_sfse", "ws_apartmentblue2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject385594[playerid],GetPlayerVehicleID(playerid),-0.909999,0.209998,-0.419999,-651.000000,-360.000000,-450.000000);
CarObject650916[playerid] = CreateObject(1050,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject650916[playerid], 0, 10969, "scum_sfse", "ws_apartmentblue2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject650916[playerid],GetPlayerVehicleID(playerid),-0.909999,-0.280001,-0.419999,-651.000000,-360.000000,-450.000000);
CarObject395013[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject395013[playerid],GetPlayerVehicleID(playerid),0.000000,-0.919300,0.800000,89.000000,0.000000,181.500000);
SetObjectMaterialText(CarObject395013[playerid],"{6633CC}EXE",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",50,0,0xFFFFFFFF,0, 1);
CarObject508145[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject508145[playerid],GetPlayerVehicleID(playerid),0.000000,-2.009300,0.349999,89.000000,0.000000,181.500000);
SetObjectMaterialText(CarObject508145[playerid],"{CC3366}Drift",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",50,0,0xFFFFFFFF,0, 1);
CarObject799586[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject799586[playerid],GetPlayerVehicleID(playerid),0.010000,1.810700,0.229999,-79.000000,0.000000,176.500000);
SetObjectMaterialText(CarObject799586[playerid],"{6633CC}sYs",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",50,0,0xFFFFFFFF,0, 1);
AddVehicleComponent(GetPlayerVehicleID(playerid), 1079);
return 1;
}



stock TuneInfernus(playerid)
{
CarObject212771[playerid] = CreateObject(18649,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject212771[playerid],GetPlayerVehicleID(playerid),-0.650000,0.000000,-0.650000,0.000000,0.000000,0.000000);
CarObject291588[playerid] = CreateObject(18649,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject291588[playerid],GetPlayerVehicleID(playerid),0.850000,0.250000,-0.650000,0.000000,0.000000,0.000000);
CarObject277282[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject277282[playerid],GetPlayerVehicleID(playerid),1.080000,0.230700,-0.150000,-1.000000,0.000000,269.500000);
SetObjectMaterialText(CarObject277282[playerid],"{FF0000}INFERNUS",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",50,0,0xFFFFFFFF,0, 1);
CarObject849475[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterialText(CarObject849475[playerid],"{FF0000}INFERNUS",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",50,0,0xFFFFFFFF,0, 1);
AttachObjectToVehicle(CarObject849475[playerid],GetPlayerVehicleID(playerid),-1.110000,0.230700,-0.150000,-1.000000,0.000000,271.500000);
CarObject707061[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject707061[playerid],GetPlayerVehicleID(playerid),0.009999,1.690700,0.199999,-82.000000,0.000000,180.500000);
SetObjectMaterialText(CarObject707061[playerid],"{FFFF00}NFS",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",80,0,0xFFFFFFFF,0, 1);
CarObject175303[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject175303[playerid],GetPlayerVehicleID(playerid),0.009999,-0.169299,0.699999,-91.000000,0.000000,178.500000);
SetObjectMaterialText(CarObject175303[playerid],"{FFFF00}SA:MP",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",70,0,0xFFFFFFFF,0, 1);
CarObject822715[playerid] = CreateObject(1144,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject822715[playerid], 0, 4595, "crparkgm_lan2", "sl_cparkbarrier1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject822715[playerid],GetPlayerVehicleID(playerid),-0.000000,-2.450000,-0.000000,2.000000,88.000000,-450.000000);
CarObject417376[playerid] = CreateObject(1010,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject417376[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject417376[playerid],GetPlayerVehicleID(playerid),-0.700000,-1.860000,0.230000,0.000000,0.000000,-90.000000);
CarObject521687[playerid] = CreateObject(1010,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject521687[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject521687[playerid],GetPlayerVehicleID(playerid),0.669999,-1.860000,0.230000,0.000000,0.000000,-90.000000);
CarObject920393[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject920393[playerid],GetPlayerVehicleID(playerid),-0.000000,-1.909300,0.249999,89.000000,0.000000,181.500000);
SetObjectMaterialText(CarObject920393[playerid],"{FFFF00}NFS",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",80,0,0xFFFFFFFF,0, 1);
CarObject746957[playerid] = CreateObject(1004,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject746957[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject746957[playerid],GetPlayerVehicleID(playerid),0.000000,2.200000,0.060000,0.000000,0.000000,0.000000);
CarObject671501[playerid] = CreateObject(1004,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject671501[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject671501[playerid],GetPlayerVehicleID(playerid),0.000000,2.140000,0.060000,0.000000,0.000000,0.000000);
CarObject140250[playerid] = CreateObject(1004,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject140250[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject140250[playerid],GetPlayerVehicleID(playerid),0.000000,2.090000,0.060000,0.000000,0.000000,0.000000);
CarObject211650[playerid] = CreateObject(1004,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject211650[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject211650[playerid],GetPlayerVehicleID(playerid),0.000000,2.040000,0.060000,0.000000,0.000000,0.000000);
CarObject519349[playerid] = CreateObject(1004,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject519349[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject519349[playerid],GetPlayerVehicleID(playerid),0.000000,1.990000,0.060000,0.000000,0.000000,0.000000);
CarObject729990[playerid] = CreateObject(1013,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject729990[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject729990[playerid],GetPlayerVehicleID(playerid),0.000000,-0.710000,0.720000,0.000000,0.000000,0.000000);
CarObject956998[playerid] = CreateObject(1006,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject956998[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject956998[playerid],GetPlayerVehicleID(playerid),0.000000,0.349999,0.620000,0.000000,0.000000,0.000000);
CarObject535706[playerid] = CreateObject(19419,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject535706[playerid],GetPlayerVehicleID(playerid),0.000000,1.149999,0.100000,0.000000,0.000000,0.000000);
CarObject61417[playerid] = CreateObject(1144,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject61417[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject61417[playerid],GetPlayerVehicleID(playerid),-0.780000,1.509999,0.200000,-4.000000,0.000000,-2.000000);
CarObject108397[playerid] = CreateObject(1144,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject108397[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject108397[playerid],GetPlayerVehicleID(playerid),-0.770000,1.939999,0.140000,-9.000000,0.000000,-2.000000);
CarObject669661[playerid] = CreateObject(1144,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject669661[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject669661[playerid],GetPlayerVehicleID(playerid),-0.750000,2.339999,0.050000,-15.000000,0.000000,-2.000000);
CarObject407857[playerid] = CreateObject(1144,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject407857[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject407857[playerid],GetPlayerVehicleID(playerid),0.769999,1.529999,0.200000,4.000000,0.000000,-179.000000);
CarObject224721[playerid] = CreateObject(1144,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject224721[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject224721[playerid],GetPlayerVehicleID(playerid),0.759999,1.979999,0.140000,11.000000,0.000000,-179.000000);
CarObject862721[playerid] = CreateObject(1144,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject862721[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject862721[playerid],GetPlayerVehicleID(playerid),0.749999,2.369998,0.050000,16.000000,0.000000,-179.000000);
CarObject304794[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject304794[playerid],GetPlayerVehicleID(playerid),0.029999,2.790699,0.019999,-1.000000,0.000000,181.500000);
SetObjectMaterialText(CarObject304794[playerid],"{FFFF00}§",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",50,0,0xFFFFFFFF,0, 1);
CarObject924564[playerid] = CreateObject(1005,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject924564[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject924564[playerid],GetPlayerVehicleID(playerid),0.419999,-2.329999,0.190000,0.000000,0.000000,-180.000000);
CarObject588928[playerid] = CreateObject(1005,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject588928[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject588928[playerid],GetPlayerVehicleID(playerid),-0.429999,-2.329999,0.190000,0.000000,0.000000,-180.000000);
CarObject987348[playerid] = CreateObject(1005,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject987348[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject987348[playerid],GetPlayerVehicleID(playerid),-0.029999,-2.329999,0.190000,0.000000,0.000000,-180.000000);
CarObject341760[playerid] = CreateObject(1001,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject341760[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject341760[playerid],GetPlayerVehicleID(playerid),-0.009999,-2.429999,0.340000,0.000000,0.000000,-360.000000);
CarObject732683[playerid] = CreateObject(1157,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject732683[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject732683[playerid],GetPlayerVehicleID(playerid),-1.130000,2.079998,-0.200000,0.000000,0.000000,0.000000);
CarObject970662[playerid] = CreateObject(1157,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject970662[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject970662[playerid],GetPlayerVehicleID(playerid),-1.010000,2.079998,-0.200000,0.000000,0.000000,0.000000);
CarObject481029[playerid] = CreateObject(1056,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject481029[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject481029[playerid],GetPlayerVehicleID(playerid),-1.030000,0.159998,-0.600000,0.000000,0.000000,0.000000);
CarObject523631[playerid] = CreateObject(1062,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject523631[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject523631[playerid],GetPlayerVehicleID(playerid),1.029999,0.159998,-0.600000,0.000000,0.000000,0.000000);
CarObject602974[playerid] = CreateObject(1063,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject602974[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject602974[playerid],GetPlayerVehicleID(playerid),1.029999,-0.170001,-0.610000,0.000000,0.000000,0.000000);
CarObject229463[playerid] = CreateObject(1057,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject229463[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject229463[playerid],GetPlayerVehicleID(playerid),-1.040000,-0.160001,-0.610000,0.000000,0.000000,0.000000);
CarObject728761[playerid] = CreateObject(1161,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject728761[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject728761[playerid],GetPlayerVehicleID(playerid),1.009999,-1.960001,-0.180000,4.299998,-0.439999,0.000000);
CarObject541271[playerid] = CreateObject(1161,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject541271[playerid], 0, 10403, "golf_sfs", "cokopops_1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject541271[playerid],GetPlayerVehicleID(playerid),1.139999,-1.960001,-0.180000,4.299998,-0.439999,0.000000);
CarObject451838[playerid] = CreateObject(1019,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject451838[playerid],GetPlayerVehicleID(playerid),-0.610000,-1.650001,-0.489999,4.299998,-0.439999,0.000000);
CarObject809200[playerid] = CreateObject(1019,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject809200[playerid],GetPlayerVehicleID(playerid),0.609998,-1.650001,-0.489999,4.299998,-0.439999,0.000000);
AddVehicleComponent(GetPlayerVehicleID(playerid), 1079);
return 1;
}

stock TuneBullet(playerid)
{
CarObject326872[playerid] = CreateObject(18646,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject326872[playerid], 0, 6336, "sunset02_law2", "malawn01_LAwN", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject326872[playerid],GetPlayerVehicleID(playerid),-0.569999,-2.109300,0.029999,-93.000000,70.000000,249.500000);
CarObject322537[playerid] = CreateObject(18646,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject322537[playerid],GetPlayerVehicleID(playerid),0.590000,-2.109300,0.029999,-93.000000,70.000000,249.500000);
CarObject353505[playerid] = CreateObject(1254,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject353505[playerid],GetPlayerVehicleID(playerid),-0.009999,-2.209300,0.089999,-184.000000,-180.000000,179.500000);
CarObject989574[playerid] = CreateObject(1145,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject989574[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject989574[playerid],GetPlayerVehicleID(playerid),-1.009999,0.750700,-0.100000,-274.000000,-180.000000,89.500000);
CarObject158881[playerid] = CreateObject(1144,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject158881[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject158881[playerid],GetPlayerVehicleID(playerid),1.010000,0.740700,-0.100000,-274.000000,-180.000000,-90.500000);
CarObject908022[playerid] = CreateObject(1150,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject908022[playerid], 0, 5174, "warehus_las2", "ws_carparkwall2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject908022[playerid],GetPlayerVehicleID(playerid),-0.840000,-1.839999,-0.099999,0.000000,0.000000,0.000000);
CarObject254314[playerid] = CreateObject(1150,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject254314[playerid], 0, 5174, "warehus_las2", "ws_carparkwall2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject254314[playerid],GetPlayerVehicleID(playerid),-1.079999,-1.839999,-0.099999,0.000000,0.000000,0.000000);
CarObject176325[playerid] = CreateObject(2659,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject176325[playerid],GetPlayerVehicleID(playerid),0.010000,-1.709300,0.359999,78.000000,0.000000,181.500000);
SetObjectMaterialText(CarObject176325[playerid],"{FF0000}Bullet",0,OBJECT_MATERIAL_SIZE_256x128,"Comic Sans MS",50,0,0xFFFFFFFF,0, 1);
CarObject512134[playerid] = CreateObject(1143,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject512134[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject512134[playerid],GetPlayerVehicleID(playerid),0.820000,-0.939299,0.369999,-6.000000,-50.000000,187.500000);
CarObject977038[playerid] = CreateObject(1143,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject977038[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject977038[playerid],GetPlayerVehicleID(playerid),-0.839999,-0.939299,0.379999,-4.000000,41.000000,182.500000);
CarObject551733[playerid] = CreateObject(1166,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject551733[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject551733[playerid],GetPlayerVehicleID(playerid),1.050000,1.690699,-0.000000,-2.000000,0.000000,360.500000);
CarObject829893[playerid] = CreateObject(1023,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject829893[playerid], 0, 4595, "crparkgm_lan2", "sl_cparkbarrier1", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject829893[playerid],GetPlayerVehicleID(playerid),0.000000,-2.249999,0.300000,0.000000,0.000000,0.000000);
CarObject27507[playerid] = CreateObject(1150,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject27507[playerid], 0, 5174, "warehus_las2", "ws_carparkwall2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject27507[playerid],GetPlayerVehicleID(playerid),-0.850000,-1.909299,-0.100000,-2.000000,0.000000,360.500000);
CarObject310130[playerid] = CreateObject(1150,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject310130[playerid], 0, 5174, "warehus_las2", "ws_carparkwall2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject310130[playerid],GetPlayerVehicleID(playerid),-1.050000,-1.909299,-0.100000,-2.000000,0.000000,360.500000);
CarObject500668[playerid] = CreateObject(1089,0.0,0.0,0.0,0.0,0.0,0.0);
AttachObjectToVehicle(CarObject500668[playerid],GetPlayerVehicleID(playerid),0.000000,0.190699,-0.100000,-2.000000,0.000000,360.500000);
CarObject743837[playerid] = CreateObject(1070,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject743837[playerid], 0, 5174, "warehus_las2", "ws_carparkwall2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject743837[playerid],GetPlayerVehicleID(playerid),-0.950000,-0.909300,-0.450000,-1.000000,0.000000,360.500000);
CarObject412542[playerid] = CreateObject(1072,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject412542[playerid], 0, 5174, "warehus_las2", "ws_carparkwall2", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject412542[playerid],GetPlayerVehicleID(playerid),0.950000,-0.909300,-0.450000,-1.000000,0.000000,360.500000);
CarObject461827[playerid] = CreateObject(1006,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject461827[playerid], 0, 5789, "melrosetr_lawn", "melrsign06_LA", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject461827[playerid],GetPlayerVehicleID(playerid),0.400000,-0.059300,0.599999,-1.000000,0.000000,360.500000);
CarObject921600[playerid] = CreateObject(1006,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject921600[playerid], 0, 5789, "melrosetr_lawn", "melrsign06_LA", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject921600[playerid],GetPlayerVehicleID(playerid),-0.400000,-0.059300,0.599999,-1.000000,0.000000,360.500000);
CarObject567024[playerid] = CreateObject(1012,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject567024[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject567024[playerid],GetPlayerVehicleID(playerid),0.000000,1.690699,0.199999,-1.000000,0.000000,360.500000);
CarObject40870[playerid] = CreateObject(1012,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject40870[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject40870[playerid],GetPlayerVehicleID(playerid),0.000000,1.640699,0.199999,-1.000000,0.000000,360.500000);
CarObject756813[playerid] = CreateObject(1012,0.0,0.0,0.0,0.0,0.0,0.0);
SetObjectMaterial(CarObject756813[playerid], 0, 981, "helixbarrier", "colourboxes", 0xFFFFFFFF);
AttachObjectToVehicle(CarObject756813[playerid],GetPlayerVehicleID(playerid),0.000000,1.540699,0.199999,-1.000000,0.000000,360.500000);
AddVehicleComponent(GetPlayerVehicleID(playerid), 1079);
return 1;
}

stock DeleteObjectsToPlayerAndVehicle(playerid)
{
DestroyObject(CarObject989574[playerid]);
DestroyObject(CarObject158881[playerid]);
DestroyObject(CarObject326872[playerid]);
DestroyObject(CarObject353505[playerid]);
DestroyObject(CarObject322537[playerid]);
DestroyVehicle(VehiclePlayer[playerid]);
DestroyObject(CarObject551733[playerid]);
DestroyObject(CarObject829893[playerid]);
DestroyObject(CarObject27507[playerid]);
DestroyObject(CarObject310130[playerid]);
DestroyObject(CarObject500668[playerid]);
DestroyObject(CarObject743837[playerid]);
DestroyObject(CarObject412542[playerid]);
DestroyObject(CarObject461827[playerid]);
DestroyObject(CarObject921600[playerid]);
DestroyObject(CarObject567024[playerid]);
DestroyObject(CarObject40870[playerid]);
DestroyObject(CarObject756813[playerid]);
DestroyObject(CarObject176325[playerid]);
DestroyObject(CarObject254314[playerid]);
DestroyObject(CarObject908022[playerid]);
DestroyObject(CarObject512134[playerid]);
DestroyObject(CarObject977038[playerid]);
DestroyObject(CarObject277282[playerid]);
DestroyObject(CarObject849475[playerid]);
DestroyObject(CarObject707061[playerid]);
DestroyObject(CarObject175303[playerid]);
DestroyObject(CarObject822715[playerid]);
DestroyObject(CarObject417376[playerid]);
DestroyObject(CarObject521687[playerid]);
DestroyObject(CarObject920393[playerid]);
DestroyObject(CarObject746957[playerid]);
DestroyObject(CarObject671501[playerid]);
DestroyObject(CarObject140250[playerid]);
DestroyObject(CarObject211650[playerid]);
DestroyObject(CarObject519349[playerid]);
DestroyObject(CarObject729990[playerid]);
DestroyObject(CarObject956998[playerid]);
DestroyObject(CarObject535706[playerid]);
DestroyObject(CarObject61417[playerid]);
DestroyObject(CarObject108397[playerid]);
DestroyObject(CarObject669661[playerid]);
DestroyObject(CarObject407857[playerid]);
DestroyObject(CarObject224721[playerid]);
DestroyObject(CarObject304794[playerid]);
DestroyObject(CarObject862721[playerid]);
DestroyObject(CarObject924564[playerid]);
DestroyObject(CarObject588928[playerid]);
DestroyObject(CarObject987348[playerid]);
DestroyObject(CarObject341760[playerid]);
DestroyObject(CarObject732683[playerid]);
DestroyObject(CarObject970662[playerid]);
DestroyObject(CarObject481029[playerid]);
DestroyObject(CarObject523631[playerid]);
DestroyObject(CarObject602974[playerid]);
DestroyObject(CarObject229463[playerid]);
DestroyObject(CarObject728761[playerid]);
DestroyObject(CarObject541271[playerid]);
DestroyObject(CarObject451838[playerid]);
DestroyObject(CarObject809200[playerid]);
DestroyObject(CarObject212771[playerid]);
DestroyObject(CarObject291588[playerid]);
DestroyVehicle(CarObject404151[playerid]);
DestroyVehicle(CarObject584908[playerid]);
DestroyVehicle(CarObject876835[playerid]);
DestroyVehicle(CarObject757520[playerid]);
DestroyVehicle(CarObject695887[playerid]);
DestroyVehicle(CarObject420599[playerid]);
DestroyVehicle(CarObject613749[playerid]);
DestroyVehicle(CarObject563491[playerid]);
DestroyVehicle(CarObject904328[playerid]);
DestroyVehicle(CarObject99694[playerid]);
DestroyVehicle(CarObject778988[playerid]);
DestroyVehicle(CarObject908091[playerid]);
DestroyVehicle(CarObject853817[playerid]);
DestroyVehicle(CarObject582093[playerid]);
DestroyVehicle(CarObject927519[playerid]);
DestroyVehicle(CarObject505599[playerid]);
DestroyVehicle(CarObject31383[playerid]);
DestroyVehicle(CarObject385594[playerid]);
DestroyVehicle(CarObject650916[playerid]);
DestroyVehicle(CarObject395013[playerid]);
DestroyVehicle(CarObject508145[playerid]);
DestroyVehicle(CarObject799586[playerid]);
return 1;
}

stock AntiLag(playerid)
{
DestroyObject(CarObject989574[playerid]);
DestroyObject(CarObject158881[playerid]);
DestroyObject(CarObject326872[playerid]);
DestroyObject(CarObject353505[playerid]);
DestroyObject(CarObject322537[playerid]);
DestroyObject(CarObject551733[playerid]);
DestroyObject(CarObject829893[playerid]);
DestroyObject(CarObject27507[playerid]);
DestroyObject(CarObject310130[playerid]);
DestroyObject(CarObject500668[playerid]);
DestroyObject(CarObject743837[playerid]);
DestroyObject(CarObject412542[playerid]);
DestroyObject(CarObject461827[playerid]);
DestroyObject(CarObject921600[playerid]);
DestroyObject(CarObject567024[playerid]);
DestroyObject(CarObject40870[playerid]);
DestroyObject(CarObject756813[playerid]);
DestroyObject(CarObject277282[playerid]);
DestroyObject(CarObject176325[playerid]);
DestroyObject(CarObject254314[playerid]);
DestroyObject(CarObject908022[playerid]);
DestroyObject(CarObject512134[playerid]);
DestroyObject(CarObject977038[playerid]);
DestroyObject(CarObject849475[playerid]);
DestroyObject(CarObject707061[playerid]);
DestroyObject(CarObject175303[playerid]);
DestroyObject(CarObject822715[playerid]);
DestroyObject(CarObject417376[playerid]);
DestroyObject(CarObject521687[playerid]);
DestroyObject(CarObject920393[playerid]);
DestroyObject(CarObject746957[playerid]);
DestroyObject(CarObject671501[playerid]);
DestroyObject(CarObject140250[playerid]);
DestroyObject(CarObject211650[playerid]);
DestroyObject(CarObject519349[playerid]);
DestroyObject(CarObject729990[playerid]);
DestroyObject(CarObject956998[playerid]);
DestroyObject(CarObject535706[playerid]);
DestroyObject(CarObject61417[playerid]);
DestroyObject(CarObject108397[playerid]);
DestroyObject(CarObject669661[playerid]);
DestroyObject(CarObject407857[playerid]);
DestroyObject(CarObject224721[playerid]);
DestroyObject(CarObject304794[playerid]);
DestroyObject(CarObject862721[playerid]);
DestroyObject(CarObject924564[playerid]);
DestroyObject(CarObject588928[playerid]);
DestroyObject(CarObject987348[playerid]);
DestroyObject(CarObject341760[playerid]);
DestroyObject(CarObject732683[playerid]);
DestroyObject(CarObject970662[playerid]);
DestroyObject(CarObject481029[playerid]);
DestroyObject(CarObject523631[playerid]);
DestroyObject(CarObject602974[playerid]);
DestroyObject(CarObject229463[playerid]);
DestroyObject(CarObject728761[playerid]);
DestroyObject(CarObject541271[playerid]);
DestroyObject(CarObject451838[playerid]);
DestroyObject(CarObject809200[playerid]);
DestroyObject(CarObject212771[playerid]);
DestroyObject(CarObject291588[playerid]);
DestroyVehicle(CarObject404151[playerid]);
DestroyVehicle(CarObject584908[playerid]);
DestroyVehicle(CarObject876835[playerid]);
DestroyVehicle(CarObject757520[playerid]);
DestroyVehicle(CarObject695887[playerid]);
DestroyVehicle(CarObject420599[playerid]);
DestroyVehicle(CarObject613749[playerid]);
DestroyVehicle(CarObject563491[playerid]);
DestroyVehicle(CarObject904328[playerid]);
DestroyVehicle(CarObject99694[playerid]);
DestroyVehicle(CarObject778988[playerid]);
DestroyVehicle(CarObject908091[playerid]);
DestroyVehicle(CarObject853817[playerid]);
DestroyVehicle(CarObject582093[playerid]);
DestroyVehicle(CarObject927519[playerid]);
DestroyVehicle(CarObject505599[playerid]);
DestroyVehicle(CarObject31383[playerid]);
DestroyVehicle(CarObject385594[playerid]);
DestroyVehicle(CarObject650916[playerid]);
DestroyVehicle(CarObject395013[playerid]);
DestroyVehicle(CarObject508145[playerid]);
DestroyVehicle(CarObject799586[playerid]);
return 1;
}