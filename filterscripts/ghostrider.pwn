#define FILTERSCRIPT

#include <a_samp>
#include <streamer>

new isGhostRider[MAX_PLAYERS], ghostFire[MAX_PLAYERS][2], ghostExp[MAX_PLAYERS]; // Ghost Rider Objects
new isTransforming;

forward Step1(vehicleid); forward Step2(vehicleid); forward Step3(vehicleid); forward Step4(vehicleid);
forward Step5(vehicleid); forward Step6(vehicleid); forward Step7(vehicleid);

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Super vehicles by UnuAlex");
	print("--------------------------------------\n");

	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(isGhostRider[playerid] == 1)
	{
	    DestroyObject(ghostFire[playerid][0]);
    	DestroyObject(ghostFire[playerid][1]);
	    DestroyObject(ghostExp[playerid]);
	    RemovePlayerAttachedObject(playerid,0); RemovePlayerAttachedObject(playerid,1);
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(isGhostRider[playerid] == 1)
	{
	    isGhostRider[playerid] = 0;
	    DestroyObject(ghostFire[playerid][0]);
    	DestroyObject(ghostFire[playerid][1]);
	    DestroyObject(ghostExp[playerid]);
	    RemovePlayerAttachedObject(playerid,0); RemovePlayerAttachedObject(playerid,1);
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/ghostrider", cmdtext, true, 10) == 0)
	{
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 463)
		{
		    if(isGhostRider[playerid] == 0)
		    {
			    isGhostRider[playerid] = 1;
			    new Float:pPos[3]; GetPlayerPos(playerid,pPos[0],pPos[1],pPos[2]);
			    SetPlayerSkin(playerid,122);
			    ghostExp[playerid] = CreateObject(18685,pPos[0],pPos[1],pPos[2],0,0,0,300.0);
			    SetPlayerAttachedObject(playerid,1,1254,2,0.055999,0.001000,0.000000,0.000000,86.899993,0.000000,0.887000,1.295000,0.984000);
			    SetPlayerAttachedObject(playerid,0,18693,2,-1.554999,0.027000,-0.212999,0.000000,82.100021,0.000000,1.000000,1.000000,1.000000);
	  			ghostFire[playerid][0] = CreateObject(18689,0.0,0.0,-1000.0,0.0,0.0,0.0,300.0);
			    AttachObjectToVehicle(ghostFire[playerid][0], GetPlayerVehicleID(playerid), 0.000, 0.609, -1.810, 0.000, 0.000, 0.000);
			    ghostFire[playerid][1] = CreateObject(18689,0.0,0.0,-1000.0,0.0,0.0,0.0,300.0);
			    AttachObjectToVehicle(ghostFire[playerid][1], GetPlayerVehicleID(playerid), 0.000, -1.370, -1.810, 0.000, 0.000, 0.000);
			}
			else
			{
			    isGhostRider[playerid] = 0;
			    DestroyObject(ghostFire[playerid][0]);
			    DestroyObject(ghostFire[playerid][1]);
			    DestroyObject(ghostExp[playerid]);
			}
		}
		else SendClientMessage(playerid,-1,"(!) Nu te afli pe o motocicleta Freeway!");
		return 1;
	}
	if (strcmp("/supertaxi", cmdtext, true, 10) == 0)
	{
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 560)
		{
		    if(isTransforming == 0)
		    {
				isTransforming = 1;
    			new tmpobjid = CreateObject(19311,0.0,0.0,-1000.0,0.0,0.0,0.0,300.0);
    			AttachObjectToVehicle(tmpobjid, GetPlayerVehicleID(playerid), 0.000, -0.290, 0.920, 0.000, 0.000, 0.000);
				SetTimerEx("Step1",1500,false,"i",GetPlayerVehicleID(playerid));
				PlayerPlaySound(playerid,1133,0,0,0);
		    }
		    else SendClientMessage(playerid,-1,"(!) Te rugam sa astepti!");
		}
		else SendClientMessage(playerid,-1,"(!) Nu te afli intr-un Sultan!");
		return 1;
	}
	if (strcmp("/ufo", cmdtext, true, 10) == 0)
	{
		if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 520)
		{
			LinkVehicleToInterior(GetPlayerVehicleID(playerid),1);
  			new tmpobjid = CreateObject(18846,0.0,0.0,-1000.0,0.0,0.0,0.0,300.0);
		    AttachObjectToVehicle(tmpobjid, GetPlayerVehicleID(playerid), 0.000, -0.760, -1.280, 0.000, 0.000, 0.000);
		    tmpobjid = CreateObject(19134,0.0,0.0,-1000.0,0.0,0.0,0.0,300.0);
		    AttachObjectToVehicle(tmpobjid, GetPlayerVehicleID(playerid), 0.000, -0.740, 0.679, 0.000, 90.000, 90.000);
		}
		else SendClientMessage(playerid,-1,"(!) Nu te afli intr-o Hydra!");
		return 1;
	}
	return 0;
}

public Step1(vehicleid)
{
    AddVehicleComponent(vehicleid, 1139);
    SetTimerEx("Step2",500,false,"i",vehicleid);
	return 1;
}
public Step2(vehicleid)
{
    AddVehicleComponent(vehicleid, 1031);
    AddVehicleComponent(vehicleid, 1030);
    SetTimerEx("Step3",1500,false,"i",vehicleid);
	return 1;
}
public Step3(vehicleid)
{
    AddVehicleComponent(vehicleid, 1029);
    SetTimerEx("Step4",1500,false,"i",vehicleid);
	return 1;
}
public Step4(vehicleid)
{
    AddVehicleComponent(vehicleid, 1079);
    SetTimerEx("Step5",1500,false,"i",vehicleid);
	return 1;
}
public Step5(vehicleid)
{
    AddVehicleComponent(vehicleid, 1169);
    SetTimerEx("Step6",1500,false,"i",vehicleid);
	return 1;
}
public Step6(vehicleid)
{
    AddVehicleComponent(vehicleid, 1140);
    SetTimerEx("Step7",1500,false,"i",vehicleid);
	return 1;
}
public Step7(vehicleid)
{
	AddVehicleComponent(vehicleid, 1010);
    AddVehicleComponent(vehicleid, 1087);
    isTransforming = 0;
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	if(isGhostRider[playerid] == 1)
	{
	    isGhostRider[playerid] = 0;
	    DestroyObject(ghostFire[playerid][0]);
    	DestroyObject(ghostFire[playerid][1]);
	    DestroyObject(ghostExp[playerid]);
	    RemovePlayerAttachedObject(playerid,0); RemovePlayerAttachedObject(playerid,1);
	}
	return 1;
}


public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}


public OnPlayerUpdate(playerid)
{
	return 1;
}