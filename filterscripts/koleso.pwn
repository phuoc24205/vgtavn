// This is a comment

#include <a_samp>
#include <streamer>

#define FERRIS_KOLESO_SPEED 0.05
new objectswheel[38];
new Float:FerrisAngle=0.0,FerrisAlternate=0;

public OnFilterScriptInit()
{
	new tmpobjid,Float:X[3],Float:X1[3],Float:RX[3];
	tmpobjid = CreateDynamicObject(16088,1188.729,-2011.010,148.529,0.000,0.000,0.000,-1,-1,-1,600.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	SetDynamicObjectMaterial(tmpobjid, 2, 18036, "range_main", "gun_galss1", 0);
	tmpobjid = CreateDynamicObject(16088,1188.829,-2004.569,148.529,0.000,0.000,0.000,-1,-1,-1,600.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	SetDynamicObjectMaterial(tmpobjid, 2, 18036, "range_main", "gun_galss1", 0);
	tmpobjid = CreateDynamicObject(3498,1188.750,-2007.520,156.179,0.000,90.000,90.000,-1,-1,-1,600.000);
	tmpobjid = CreateDynamicObject(1395,1188.689,-2017.780,100.190,0.000,0.000,0.000,-1,-1,-1,600.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	SetDynamicObjectMaterial(tmpobjid, 2, 6064, "law_beach1", "musk1", 0);
	tmpobjid = CreateDynamicObject(1395,1188.689,-1997.859,100.190,0.000,0.000,0.000,-1,-1,-1,600.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	SetDynamicObjectMaterial(tmpobjid, 1, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	SetDynamicObjectMaterial(tmpobjid, 2, 6064, "law_beach1", "musk1", 0);
	tmpobjid = CreateDynamicObject(1395,1171.020,-2017.739,89.669,0.000,20.000,0.000,-1,-1,-1,600.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	tmpobjid = CreateDynamicObject(1395,1206.339,-2017.670,89.669,0.000,20.000,180.000,-1,-1,-1,600.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	tmpobjid = CreateDynamicObject(1395,1206.369,-1997.839,89.669,0.000,20.000,180.000,-1,-1,-1,600.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11252, "railbridge_sfse", "ws_goldengate5bnoalpha", 0);
	tmpobjid = CreateDynamicObject(11420,1187.459,-2007.439,67.760,0.000,0.000,-209.940,-1,-1,-1,600.000);
	SetDynamicObjectMaterial(tmpobjid, 0, 6064, "law_beach1", "musk1", 0);
	objectswheel[0] = CreateObject(18877,1188.719,-2007.319,156,0.000,0.000,0.0000,600.000); //Объект 0
	objectswheel[1] = CreateObject(11439,1168.420,-2007.939,71.099,20.000,0.000,90.0000,600.000);
	SetObjectMaterial(objectswheel[1], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[2] = CreateObject(11439,1208.599,-2006.930,71.040,20.000,0.000,-90.0000,600.000);
	SetObjectMaterial(objectswheel[2], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[3] = CreateObject(11439,1198.780,-2006.839,242.039,0.000,180.000,90.0000,600.000);
	SetObjectMaterial(objectswheel[3], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[4] = CreateObject(11439,1268.410,-2007.869,121.279,-60.000,0.000,90.0000,600.000);
	SetObjectMaterial(objectswheel[4], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[5] = CreateObject(11439,1271.949,-2007.880,180.720,-100.000,0.000,90.0000,600.000);
	SetObjectMaterial(objectswheel[5], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[6] = CreateObject(11439,1236.390,-2007.839,228.369,-140.000,0.000,90.0000,600.000);
	SetObjectMaterial(objectswheel[6], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[7] = CreateObject(11439,1140.800,-2006.859,228.369,-140.000,0.000,-90.0000,600.000);
	SetObjectMaterial(objectswheel[7], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[8] = CreateObject(11439,1105.280,-2006.849,180.720,-100.000,0.000,-90.0000,600.000);
	SetObjectMaterial(objectswheel[8], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[9] = CreateObject(11439,1108.670,-2006.829,121.279,-60.000,0.000,-90.0000,600.000);
	SetObjectMaterial(objectswheel[9], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[10] = CreateObject(16328,1188.550,-2007.180,82.300,0.000,0.000,0.0000,600.000);
	SetObjectMaterial(objectswheel[10], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[11] = CreateObject(16328,1140.910,-2007.180,99.610,0.000,40.000,0.0000,600.000);
	SetObjectMaterial(objectswheel[11], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[12] = CreateObject(16328,1116.510,-2007.180,143.070,0.000,80.000,0.0000,600.000);
	SetObjectMaterial(objectswheel[12], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[13] = CreateObject(16328,1124.810,-2007.180,192.119,0.000,120.000,0.0000,600.000);
	SetObjectMaterial(objectswheel[13], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[14] = CreateObject(16328,1163.189,-2007.180,224.649,0.000,160.000,0.0000,600.000);
	SetObjectMaterial(objectswheel[14], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[15] = CreateObject(16328,1213.979,-2007.180,224.669,0.000,200.000,0.0000,600.000);
	SetObjectMaterial(objectswheel[15], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[16] = CreateObject(16328,1252.260,-2007.180,192.440,0.000,240.000,0.0000,600.000);
	SetObjectMaterial(objectswheel[16], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[17] = CreateObject(16328,1260.920,-2007.180,142.369,0.000,280.000,0.0000,600.000);
	SetObjectMaterial(objectswheel[17], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[18] = CreateObject(16328,1236.069,-2007.180,99.610,0.000,320.000,0.0000,600.000);
	SetObjectMaterial(objectswheel[18], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[19] = CreateObject(5837,1188.719,-2007.430,70.7355,0.000,0.000,90.0000,600.000);//готова )))))
	objectswheel[20] = CreateObject(5837,1135.430,-2007.339,90.6250,0.000,0.000,90.0000,600.000);
	objectswheel[21] = CreateObject(5837,1106.9310, -2007.4564, 139.4740,0.000,0.000,90.0000,600.000);  //готова типо)))))
	objectswheel[22] = CreateObject(5837,1116.699,-2007.400,199.9152,0.000,0.000,90.0000,600.000); //готова ))
	objectswheel[23] = CreateObject(5837,1160.170,-2007.410,235.7991,0.000,0.000,90.0000,600.000); //готова))
	objectswheel[24] = CreateObject(5837,1216.910,-2007.339,235.7847,0.000,0.000,90.0000,600.000);//готова))
	objectswheel[25] = CreateObject(5837,1260.510,-2007.329,199.0595,0.000,0.000,90.0000,600.000); //готова TIPO))
	objectswheel[26] = CreateObject(5837,1270.8339, -2007.4019, 139.3951,0.000,0.000,90.0000,1000.000); //готова
	objectswheel[27] = CreateObject(5837,1241.930,-2007.349,89.97,0.000,0.000,90.0000,1000.000); //готова
	for(new s = 19; s < 28; s++)
	{
		SetObjectMaterial(objectswheel[s], 0, 7511, "vgntrainstat", "awning4256", 0);
		SetObjectMaterial(objectswheel[s], 1, 10023, "bigwhitesfe", "sfe_arch6", 0);
	}
	objectswheel[28] = CreateObject(3498,1188.750,-2007.520,156.179,0.000,90.000,90.0000,1000.000);
	objectswheel[29] = CreateObject(19377,1141.229,-2007.369,99.419,0.000,-50.000,0.0000,1000.000);
	SetObjectMaterial(objectswheel[29], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[30] = CreateObject(19377,1116.560,-2007.300,142.979,0.000,-10.000,0.0000,1000.000);
	SetObjectMaterial(objectswheel[30], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[31] = CreateObject(19377,1125.130,-2007.329,192.289,0.000,30.000,0.0000,1000.000);
	SetObjectMaterial(objectswheel[31], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[32] = CreateObject(19377,1163.530,-2007.300,224.559,0.000,70.000,0.0000,1000.000);
	SetObjectMaterial(objectswheel[32], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[33] = CreateObject(19377,1213.729,-2007.319,224.559,0.000,70.000,180.0000,1000.000);
	SetObjectMaterial(objectswheel[33], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[34] = CreateObject(19377,1252.140,-2007.329,192.289,0.000,30.000,180.0000,1000.000);
	SetObjectMaterial(objectswheel[34], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[35] = CreateObject(19377,1260.819,-2007.359,142.979,0.000,-10.000,180.0000,1000.000);
	SetObjectMaterial(objectswheel[35], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[36] = CreateObject(19377,1235.729,-2007.329,99.559,0.000,-50.000,180.0000,1000.000);
	SetObjectMaterial(objectswheel[36], 0, 18036, "range_main", "gun_galss1", 0);
	objectswheel[37] = CreateObject(19377,1188.479,-2007.430,82.480,0.000,90.000,180.0000,1000.000);
	SetObjectMaterial(objectswheel[37], 0, 18036, "range_main", "gun_galss1", 0);
	for(new i = 1; i < 19; i++) //38 объектов
	{
		GetObjectPos(objectswheel[0],X[0],X[1],X[2]);
		GetObjectPos(objectswheel[i],X1[0],X1[1],X1[2]);
		GetObjectRot(objectswheel[i],RX[0],RX[1],RX[2]);
		AttachObjectToObject(objectswheel[i], objectswheel[0], X1[0]-X[0], X1[1]-X[1], X1[2]-X[2], RX[0],RX[1],RX[2], 1);
	}
	for(new s = 19; s < 28; s++)
	{
		GetObjectPos(objectswheel[0],X[0],X[1],X[2]);
		GetObjectPos(objectswheel[s],X1[0],X1[1],X1[2]);
		AttachObjectToObject(objectswheel[s], objectswheel[0], X1[0]-X[0], X1[1]-X[1], X1[2]-X[2],0.0,0.0,90.0, 0);
	}
	for(new i = 28; i < 38; i++)
	{
		GetObjectPos(objectswheel[0],X[0],X[1],X[2]);
		GetObjectPos(objectswheel[i],X1[0],X1[1],X1[2]);
		GetObjectRot(objectswheel[i],RX[0],RX[1],RX[2]);
		AttachObjectToObject(objectswheel[i], objectswheel[0], X1[0]-X[0], X1[1]-X[1], X1[2]-X[2], RX[0],RX[1],RX[2], 1);
	}
	FerrisAngle+=1;
	if(FerrisAngle>=360)FerrisAngle=0;
	if(FerrisAlternate)FerrisAlternate=0;
	else FerrisAlternate = 1;
	new Float:FerrisWheelModZPos=0.0;
	if(FerrisAlternate)FerrisWheelModZPos=0.05;
	MoveObject(objectswheel[0],1188.719,-2007.319,156.0+FerrisWheelModZPos,FERRIS_KOLESO_SPEED,0,FerrisAngle,0);
	return 1;
}


public OnObjectMoved(objectid)
{
	if(objectid==objectswheel[0])
	{
		FerrisAngle+=1;
		if(FerrisAngle>=360) FerrisAngle=0;
		if(FerrisAlternate)FerrisAlternate=0;
		else FerrisAlternate=1;
		new Float:FerrisWheelModZPos=0.0;
		if(FerrisAlternate)FerrisWheelModZPos=0.05;
		MoveObject(objectswheel[0],1188.719,-2007.319,156.0+FerrisWheelModZPos,FERRIS_KOLESO_SPEED,0,FerrisAngle,0);
	}
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
