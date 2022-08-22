//Map markers by Bombo
//v2.0

#define FILTERSCRIPT

#include <a_samp>
#include <streamer>

#define ZONE_MARK_INTERVAL 5000

new gPlayerMarker[MAX_PLAYERS];
new Text3D:gMarkerText[MAX_PLAYERS];
new gTimerPlayerZoneMark;

forward update_player_zone_mark();

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
    new i;
    
    print("\n--------------------------------------");
    print(" Map markers in Area 51 by Bombo");
    print("--------------------------------------\n");

    for(i = 0; i < MAX_PLAYERS; ++i)
    {
        gPlayerMarker[i] = INVALID_OBJECT_ID;
    }
    
    gTimerPlayerZoneMark = SetTimer("update_player_zone_mark", ZONE_MARK_INTERVAL, true);

    return 1;
}

public OnFilterScriptExit()
{
    new i;
    
    KillTimer(gTimerPlayerZoneMark);

    for(i = 0; i < MAX_PLAYERS; ++i)
    {
        if(gPlayerMarker[i] != INVALID_OBJECT_ID)
        {
            DestroyDynamicObject(gPlayerMarker[i]);
            gPlayerMarker[i] = INVALID_OBJECT_ID;
		    if(!IsPlayerNPC(i))
		    {
				if(IsValidDynamic3DTextLabel(gMarkerText[i]))
			        DestroyDynamic3DTextLabel(gMarkerText[i]);
			}
		}
    }
    return 1;
}

#else

main()
{
    print("\n----------------------------------");
    print(" Map markers in Area 51 by Bombo");
    print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
    // Don't use these lines if it's a filterscript
    SetGameModeText("Blank Script");
    AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
    return 1;
}

public OnGameModeExit()
{
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
    SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
    SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
    return 1;
}

public OnPlayerConnect(playerid)
{
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if(gPlayerMarker[playerid] != INVALID_OBJECT_ID)
    {
        DestroyDynamicObject(gPlayerMarker[playerid]);
        gPlayerMarker[playerid] = INVALID_OBJECT_ID;
	    if(!IsPlayerNPC(playerid))
			if(IsValidDynamic3DTextLabel(gMarkerText[playerid]))
		        DestroyDynamic3DTextLabel(gMarkerText[playerid]);
    }

    return 1;
}

//area 51 markers
public update_player_zone_mark()
{
	new i, j, col, Float:height;
	new Float:x, Float:y, Float:z;
	new Float:x0, Float:y0, Float:z0, Float:path, Float:speed;
	new name[64];
	static Float:MarkerXY[MAX_PLAYERS][2];

	for(i = 0; i < MAX_PLAYERS; ++i)
	{
		if(IsPlayerConnected(i))
		{
			strdel(name, 0, sizeof(name)-1);
			GetPlayerName(i, name, sizeof(name));
	        col = GetPlayerColor(i);
	        GetPlayerPos(i, x, y, z);

	        if(x > 3000.0) x = 3000.0;
			if(x < -3000.0)x = -3000.0;
			if(y > 3000.0) y = 3000.0;
			if(y < -3000.0) y = -3000.0;

   			for(j = 0, height = 0.0; j < i; ++j)
			{
			    if(IsPlayerInRangeOfPoint(j, 200, x, y, z))
			        height = floatadd(height, 0.04);
			}

			col = (col>>8)|(0xFF000000);
			y = floatsub(221.7,floatmul(3.45,floatdiv(floatadd(3000.0,y),6000.0)));
			x = floatadd(1821.1,floatmul(3.45,floatdiv(floatadd(3000.0,x),6000.0)));

	        if(gPlayerMarker[i] != INVALID_OBJECT_ID)
	        {
	            GetDynamicObjectPos(gPlayerMarker[i], y0, x0, z0);
	            path = VectorSize(y0-y, x0-x, 0);
				speed = floatdiv(path,floatdiv(ZONE_MARK_INTERVAL.0,1200.0));

				if(IsPlayerNPC(i))
					MoveDynamicObject(gPlayerMarker[i], y, x, 6.81, speed);
				else
				{
					MoveDynamicObject(gPlayerMarker[i], y, x, 7.41, speed);
					if(VectorSize(MarkerXY[i][0]-x, MarkerXY[i][1]-y, 0) > 0.03)
					{
						if(IsValidDynamic3DTextLabel(gMarkerText[i]))
							DestroyDynamic3DTextLabel(gMarkerText[i]);
						gMarkerText[i] = CreateDynamic3DTextLabel(name, GetPlayerColor(i), y, x, floatadd(7.51,height), 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
				        MarkerXY[i][0] = x;
				        MarkerXY[i][1] = y;
					}
				}
	        }
	        else
	        {
				if(IsPlayerNPC(i))
	        		gPlayerMarker[i] = CreateDynamicObject(2590, y, x, 6.81, 0, 0, 0);
				else
				{
	        		gPlayerMarker[i] = CreateDynamicObject(2590, y, x, 7.41, 0, 0, 0);
					gMarkerText[i] = CreateDynamic3DTextLabel(name, GetPlayerColor(i), y, x, floatadd(7.51,height), 7.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
				}
	        	if(gPlayerMarker[i] != INVALID_OBJECT_ID)
					SetDynamicObjectMaterial(gPlayerMarker[i], 0, 10770, "carrier_sfse", "ws_shipmetal4", col);
	        }
		}
	}

	for(j = 0; j < MAX_PLAYERS; ++j)
	{
	    if(!IsPlayerConnected(j))
	        continue;
		if(IsPlayerInRangeOfPoint(j, 10.0, 220, 1822, 7.4))
		{
		    GetPlayerPos(j, x, y, z);
		    SetPlayerPos(j, floatadd(x,0.00001), y, z);
		}
	}
}

