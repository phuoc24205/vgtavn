/*
	xNavigator - Navigation System
							by XpDeviL
						
		
			~ Features ~
		* You can easily add your locations by typing {"Location Name", X, Y, Z} in the location list below.
		* You can open and use the navigation by typing /nav in the game.
		* After selecting a location, the selected position is marked on the map, and also you can see the direction of the location by the arrow that appears on the vehicle.
		* You can also see how much distance to the destination with textdraw, which is shown on the screen.
		* Navigation closes when you get out of the car, when you type /navclose or when you reach the destination.
		
	You can visit my personal website for all my releases and more;
	http://xpdevil.com
*/

#include <a_samp>
#include <zcmd>

new 
	ok[MAX_PLAYERS],
	pNavState[MAX_PLAYERS],
	pNavID[MAX_PLAYERS],
	pNavTimer[MAX_PLAYERS],
	PlayerText:NAVpTD[MAX_PLAYERS],
	Text:NAVTD[2]
;

enum NAV_DATA {
    NAV_NAME[32],
    Float:NAV_X,
    Float:NAV_Y,
    Float:NAV_Z
};

new const NavData[][NAV_DATA] = { // Location list in navigation:
	{"The Strip", 2039.6165, 1343.0740, 10.6719}, // {"Location Name", X, Y, Z}
	{"Come-A-Lot", 2166.6948,1123.8224,12.5687},  // You can add your locations like this.
	{"Las Venturas Airport", 1724.4327,1602.1609,10.0156} // Make sure that no comma at the end of the last one.
};

public OnFilterScriptInit()
{

	print("\n+----------------------------------------------------+");
	print("|                                                    |");
	print("|      xNavigator - Navigation System ~ Loaded!      |");
	print("|                                      by XpDeviL    |");
	print("|                                                    |");
	print("+----------------------------------------------------+\n");

	NAVTD[0] = TextDrawCreate(404.319183, 409.916809, "box");
	TextDrawLetterSize(NAVTD[0], 0.000000, 1.941436);
	TextDrawTextSize(NAVTD[0], 498.000000, 0.000000);
	TextDrawAlignment(NAVTD[0], 1);
	TextDrawColor(NAVTD[0], -1);
	TextDrawUseBox(NAVTD[0], 1);
	TextDrawBoxColor(NAVTD[0], 100);
	TextDrawSetShadow(NAVTD[0], 0);
	TextDrawSetOutline(NAVTD[0], 0);
	TextDrawBackgroundColor(NAVTD[0], 255);
	TextDrawFont(NAVTD[0], 1);
	TextDrawSetProportional(NAVTD[0], 1);
	TextDrawSetShadow(NAVTD[0], 0);

	// NAVTD[1] = TextDrawCreate(404.787597, 399.999847, "Navigation Info");
	// TextDrawLetterSize(NAVTD[1], 0.299736, 1.115833);
	// TextDrawAlignment(NAVTD[1], 1);
	// TextDrawColor(NAVTD[1], -5963521);
	// TextDrawSetShadow(NAVTD[1], 1);
	// TextDrawSetOutline(NAVTD[1], 0);
	// TextDrawBackgroundColor(NAVTD[1], 255);
	// TextDrawFont(NAVTD[1], 0);
	// TextDrawSetProportional(NAVTD[1], 1);
	// TextDrawSetShadow(NAVTD[1], 1);
	return 1;
}

public OnPlayerConnect(playerid)
{
	
	return 1;
}
public OnPlayerSpawn(playerid)
{
	NAVpTD[playerid] = CreatePlayerTextDraw(playerid, 405.724487, 415.166564, "Distance Left: ~y~0000.00m");
	PlayerTextDrawLetterSize(playerid, NAVpTD[playerid], 0.179326, 1.109999);
	PlayerTextDrawAlignment(playerid, NAVpTD[playerid], 1);
	PlayerTextDrawColor(playerid, NAVpTD[playerid], -1);
	PlayerTextDrawSetShadow(playerid, NAVpTD[playerid], 0);
	PlayerTextDrawSetOutline(playerid, NAVpTD[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, NAVpTD[playerid], 255);
	PlayerTextDrawFont(playerid, NAVpTD[playerid], 2);
	PlayerTextDrawSetProportional(playerid, NAVpTD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, NAVpTD[playerid], 0);
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	if(pNavState[playerid])
	{
		KillTimer(pNavTimer[playerid]);
		DestroyObject(ok[playerid]);
		DisablePlayerCheckpoint(playerid);
		pNavState[playerid] = 0;
	}
	return 1;
}

CMD:nav(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "{FF0000}<!> You must be in a vehicle to use navigation!");
	static string[sizeof(NavData) * 64];

	if (string[0] == EOS) 
	{
		for (new i; i < sizeof(NavData); i++) 
		{
			format(string, sizeof string, "%s{f4a442}» {f7f5bb}%s\n", string, NavData[i][NAV_NAME]);
		}
	} 
	ShowPlayerDialog(playerid, 112, DIALOG_STYLE_LIST, "[Navigation] Locations", string, "Select", "Close");
	return 1;
}

CMD:navclose(playerid, params[])
{
	if(pNavState[playerid])
	{
		KillTimer(pNavTimer[playerid]);
		DestroyObject(ok[playerid]);
		for(new i; i<sizeof(NAVTD); i++) TextDrawHideForPlayer(playerid, NAVTD[i]);
		PlayerTextDrawHide(playerid, NAVpTD[playerid]);	
		PlayerPlaySound(playerid,1137,0.0,0.0,0.0);
		DisablePlayerCheckpoint(playerid);
		pNavState[playerid] = 0;
		SendClientMessage(playerid, -1, "{FF0000}<!> Navigation cancelled!");
	} else SendClientMessage(playerid, -1, "{FF0000}<!> Navigation is already off!");
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(pNavState[playerid])
	{
		KillTimer(pNavTimer[playerid]);
		DestroyObject(ok[playerid]);
		for(new i; i<sizeof(NAVTD); i++) TextDrawHideForPlayer(playerid, NAVTD[i]);
		PlayerTextDrawHide(playerid, NAVpTD[playerid]);	
		PlayerPlaySound(playerid,1150,0.0,0.0,0.0);
		DisablePlayerCheckpoint(playerid);
		pNavState[playerid] = 0;
		SendClientMessage(playerid, -1, "{FF0000}<!> Navigation is cancelled because you are off the vehicle!");
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 112)
	{
		if(response)
		{
			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "{FF0000}<!> You must be in a vehicle to use navigation!");
			pNavID[playerid] = listitem;
			new str[128];
			SetPlayerCheckpoint(playerid, NavData[pNavID[playerid]][NAV_X], NavData[pNavID[playerid]][NAV_Y], NavData[pNavID[playerid]][NAV_Z], 3.0);
			format(str, 128, "{00FF00}<!> Destination is set to {FFA500}%s", NavData[pNavID[playerid]][NAV_NAME]);
			SendClientMessage(playerid, -1, str);
			SendClientMessage(playerid, -1, "{00FF00}<!> You can type {FF7D0A}/navclose {00FF00}to cancel the navigation.");
			if(IsValidObject(ok[playerid])) DestroyObject(ok[playerid]);
			ok[playerid] = CreateObject(19134, 0, 0, 0, 0, 0, 0);
			Refresh(playerid);
			KillTimer(pNavTimer[playerid]);
			pNavTimer[playerid] = SetTimerEx("Refresh", 100, true, "d", playerid);
			for(new i; i<sizeof(NAVTD); i++) TextDrawShowForPlayer(playerid, NAVTD[i]);
			PlayerTextDrawShow(playerid, NAVpTD[playerid]);
			PlayerPlaySound(playerid,1139,0.0,0.0,0.0);
			pNavState[playerid] = 1;
		}
	}
	return 1;
}

stock Float:PointAngle(playerid, Float:xa, Float:ya, Float:xb, Float:yb) // Don't know the owner.
{
	new Float:carangle;
	new Float:xc, Float:yc;
	new Float:angle;
	xc = floatabs(floatsub(xa,xb));
	yc = floatabs(floatsub(ya,yb));
	if (yc == 0.0 || xc == 0.0)
	{
		if(yc == 0 && xc > 0) angle = 0.0;
		else if(yc == 0 && xc < 0) angle = 180.0;
		else if(yc > 0 && xc == 0) angle = 90.0;
		else if(yc < 0 && xc == 0) angle = 270.0;
		else if(yc == 0 && xc == 0) angle = 0.0;
	}
	else
	{
		angle = atan(xc/yc);
		if(xb > xa && yb <= ya) angle += 90.0;
		else if(xb <= xa && yb < ya) angle = floatsub(90.0, angle);
		else if(xb < xa && yb >= ya) angle -= 90.0;
		else if(xb >= xa && yb > ya) angle = floatsub(270.0, angle);
	}
	GetVehicleZAngle(GetPlayerVehicleID(playerid), carangle);
	return floatadd(angle, -carangle);
}

forward Refresh(playerid);
public Refresh(playerid)
{
	new Float:pos[3], Float:pPos[3];
	pPos[0] = NavData[pNavID[playerid]][NAV_X];
	pPos[1] = NavData[pNavID[playerid]][NAV_Y];
	pPos[2] = NavData[pNavID[playerid]][NAV_Z];
	GetVehiclePos(GetPlayerVehicleID(playerid), pos[0], pos[1], pos[2]);
	new Float:rot = PointAngle(playerid, pos[0], pos[1], pPos[0], pPos[1]);
	AttachObjectToVehicle(ok[playerid], GetPlayerVehicleID(playerid), 0.000000, 0.000000, 1.399998, 0.000000, 90.0, rot + 180);
	new Float:mesafe, str[32];
	mesafe = GetPlayerDistanceFromPoint(playerid, pPos[0], pPos[1], pPos[2]);
	format(str, sizeof(str), "Khoang  cach: ~y~%0.2fm", mesafe);
	PlayerTextDrawSetString(playerid, NAVpTD[playerid], str);
	PlayerTextDrawLetterSize(playerid, NAVpTD[playerid], 0.179326, 1.109999);
	PlayerTextDrawAlignment(playerid, NAVpTD[playerid], 1);
	PlayerTextDrawColor(playerid, NAVpTD[playerid], -1);
	PlayerTextDrawSetShadow(playerid, NAVpTD[playerid], 0);
	PlayerTextDrawSetOutline(playerid, NAVpTD[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, NAVpTD[playerid], 255);
	PlayerTextDrawFont(playerid, NAVpTD[playerid], 2);
	PlayerTextDrawSetProportional(playerid, NAVpTD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, NAVpTD[playerid], 0);
	if(IsPlayerInRangeOfPoint(playerid, 10.0, pPos[0], pPos[1], pPos[2]))
	{
		KillTimer(pNavTimer[playerid]);
		DestroyObject(ok[playerid]);
		for(new i; i<sizeof(NAVTD); i++) TextDrawHideForPlayer(playerid, NAVTD[i]);
		PlayerTextDrawHide(playerid, NAVpTD[playerid]);	
		DisablePlayerCheckpoint(playerid);
		PlayerPlaySound(playerid,1137,0.0,0.0,0.0);
		pNavState[playerid] = 0;
		SendClientMessage(playerid, -1, "{00FF00}<!> You have reached your destination!");
	}
	return 1;
}