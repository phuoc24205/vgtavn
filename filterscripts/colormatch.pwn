#define 	FILTERSCRIPT
#include 	<a_samp>
#include    <izcmd>

#define     CM_EVENT_TIME       (120)   // event time, in seconds (default: 120)
#define     CM_MIN_PLAYERS      (0)     // players required to start the event (default: 2)
#define     CM_MAX_PLAYERS      (16)    // max players allowed to join (default: 16)
#define     CM_SETUP_TIME       (15)    // setup time where players can join, in seconds (default: 15)
#define     CM_REWARD           (5000)  // how much money the winner will get (default: 5000)
#define     CM_SEPERATE                 // prevents player following by moving every player to a different virtual world, comment or remove this line if you don't want it
#define     CM_USEFENCES                // creates fences around the arena, comment or remove this line if you don't want it

enum    _:E_OBJECTID
{
	OBJ_ORANGE,
	OBJ_RED,
	OBJ_GREEN,
	OBJ_YELLOW,
	OBJ_PURPLE,
	OBJ_PINK,
	OBJ_MAROON,
	OBJ_BLUE,
	OBJ_WHITE
}

enum    _:E_GAMESTAGE
{
	STAGE_NONE,
	STAGE_SETUP,
	STAGE_PLAYING
}

new
	ColorMatchObjects[9] = {INVALID_OBJECT_ID, ...},
	ColorMatchNames[9][7] = {"Orange", "Red", "Green", "Yellow", "Purple", "Pink", "Maroon", "Blue", "White"},
	ColorMatchColors[9] = {0xFF7F00FF, 0xEE0000FF, 0x00EE00FF, 0xFFFF00FF, 0x9B30FFFF, 0xFF1493FF, 0x8B1A1AFF, 0x1E90FFFF, 0xFFFFFFFF};
	
#if defined CM_USEFENCES
new
	ColorMatchFences[8] = {INVALID_OBJECT_ID, ...};
#endif

new
    ColorMatchCurrent = -1,
    ColorMatchPlayers,
    ColorMatchTimer = -1,
    ColorMatchFallTimer = -1,
    ColorMatchEventTimer = -1,
    ColorMatchStage = STAGE_NONE,
    Text: ColorMatchTD;
	
new
	bool: InCMEvent[MAX_PLAYERS],
	PlayerText: ColorText[MAX_PLAYERS] = {PlayerText: INVALID_TEXT_DRAW, ...};

// http://forum.sa-mp.com/showpost.php?p=3117531&postcount=5
RGBAToARGB(rgba)
    return rgba >>> 8 | rgba << 24;

// http://forum.sa-mp.com/showpost.php?p=1120652&postcount=3
Float: frandom(Float:max, Float:min = 0.0, dp = 4)
{
	new
		Float:mul = floatpower(10.0, dp),
		imin = floatround(min * mul),
		imax = floatround(max * mul);
	return float(random(imax - imin) + imin) / mul;
}

// http://forum.sa-mp.com/showpost.php?p=3223897&postcount=11
ConvertToMinutes(time)
{
    new string[15];//-2000000000:00 could happen, so make the string 15 chars to avoid any errors
    format(string, sizeof(string), "%02d:%02d", time / 60, time % 60);
    return string;
}

ColorMatch_Arena()
{
    for(new i; i < sizeof(ColorMatchObjects); i++) DestroyObject(ColorMatchObjects[i]);
    
    ColorMatchObjects[OBJ_ORANGE] = CreateObject(19353, 2005.390, 3866.277, 101.323, 0.000, 90.000, 90.000); //  orange
	SetObjectMaterial(ColorMatchObjects[OBJ_ORANGE], 0, 18996, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_ORANGE]));

	ColorMatchObjects[OBJ_RED] = CreateObject(19353, 2008.590, 3866.277, 101.323, 0.000, 90.000, 90.000); // red
	SetObjectMaterial(ColorMatchObjects[OBJ_RED], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_RED]));

	ColorMatchObjects[OBJ_GREEN] = CreateObject(19353, 2002.190, 3866.277, 101.323, 0.000, 90.000, 90.000); // green
	SetObjectMaterial(ColorMatchObjects[OBJ_GREEN], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_GREEN]));

	ColorMatchObjects[OBJ_YELLOW] = CreateObject(19353, 2008.590, 3862.777, 101.323, 0.000, 90.000, 90.000); // yellow
	SetObjectMaterial(ColorMatchObjects[OBJ_YELLOW], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_YELLOW]));

	ColorMatchObjects[OBJ_PURPLE] = CreateObject(19353, 2008.590, 3869.777, 101.323, 0.000, 90.000, 90.000); // purple
	SetObjectMaterial(ColorMatchObjects[OBJ_PURPLE], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_PURPLE]));

	ColorMatchObjects[OBJ_PINK] = CreateObject(19353, 2005.390, 3862.777, 101.323, 0.000, 90.000, 90.000); // pink
	SetObjectMaterial(ColorMatchObjects[OBJ_PINK], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_PINK]));

	ColorMatchObjects[OBJ_MAROON] = CreateObject(19353, 2005.390, 3869.777, 101.323, 0.000, 90.000, 90.000); // maroon
	SetObjectMaterial(ColorMatchObjects[OBJ_MAROON], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_MAROON]));

	ColorMatchObjects[OBJ_BLUE] = CreateObject(19353, 2002.190, 3869.777, 101.323, 0.000, 90.000, 90.000); // blue
	SetObjectMaterial(ColorMatchObjects[OBJ_BLUE], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_BLUE]));

	ColorMatchObjects[OBJ_WHITE] = CreateObject(19353, 2002.190, 3862.777, 101.323, 0.000, 90.000, 90.000); // white
	SetObjectMaterial(ColorMatchObjects[OBJ_WHITE], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_WHITE]));
	
	#if defined CM_USEFENCES
	for(new i; i < sizeof(ColorMatchFences); i++) DestroyObject(ColorMatchFences[i]);
	
	ColorMatchFences[0] = CreateObject(8674, 2005.395, 3871.529, 102.859, 0.000, 0.000, 0.000);
	ColorMatchFences[1] = CreateObject(8674, 2000.584, 3866.285, 102.859, 0.000, 0.000, 90.000);
	ColorMatchFences[2] = CreateObject(8674, 2010.208, 3866.285, 102.859, 0.000, 0.000, 90.000);
	ColorMatchFences[3] = CreateObject(8674, 2005.395, 3861.021, 102.859, 0.000, 0.000, 0.000);
	
	ColorMatchFences[4] = CreateObject(8674, 2005.395, 3871.529, 105.809, 0.000, 0.000, 0.000);
	ColorMatchFences[5] = CreateObject(8674, 2000.584, 3866.285, 105.809, 0.000, 0.000, 90.000);
	ColorMatchFences[6] = CreateObject(8674, 2010.208, 3866.285, 105.809, 0.000, 0.000, 90.000);
	ColorMatchFences[7] = CreateObject(8674, 2005.395, 3861.021, 105.809, 0.000, 0.000, 0.000);
	#endif
	return 1;
}

ColorMatch_CleanUp(players = 0)
{
    KillTimer(ColorMatchTimer);
	KillTimer(ColorMatchFallTimer);
	KillTimer(ColorMatchEventTimer);
	ColorMatchStage = STAGE_NONE;
	ColorMatchPlayers = 0;
	ColorMatchTimer = -1;
	ColorMatchFallTimer = -1;
	ColorMatchEventTimer = -1;
	
	if(players)
	{
	    for(new i, mp = GetPlayerPoolSize(); i <= mp; i++)
		{
			if(!IsPlayerConnected(i) || !InCMEvent[i]) continue;
			InCMEvent[i] = false;
			PlayerTextDrawHide(i, ColorText[i]);
			TextDrawHideForPlayer(i, ColorMatchTD);
			SetPlayerVirtualWorld(i, 0);
			SpawnPlayer(i);
		}
	}

	return 1;
}

ColorMatch_InitPlayer(playerid)
{
    InCMEvent[playerid] = false;

    ColorText[playerid] = CreatePlayerTextDraw(playerid,317.000000, 150.000000, "_");
	PlayerTextDrawAlignment(playerid,ColorText[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,ColorText[playerid], 255);
	PlayerTextDrawFont(playerid,ColorText[playerid], 2);
	PlayerTextDrawLetterSize(playerid,ColorText[playerid], 0.700000, 3.000000);
	PlayerTextDrawColor(playerid,ColorText[playerid], -1);
	PlayerTextDrawSetOutline(playerid,ColorText[playerid], 1);
	PlayerTextDrawSetProportional(playerid,ColorText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,ColorText[playerid], 0);
	return 1;
}

ColorMatch_Eliminate(playerid)
{
	if(!InCMEvent[playerid]) return 1;
	TextDrawHideForPlayer(playerid, ColorMatchTD);
	PlayerTextDrawHide(playerid, ColorText[playerid]);
	SetPlayerVirtualWorld(playerid, 0);
	SpawnPlayer(playerid);
	ColorMatchPlayers--;
	
	new string[144], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	format(string, sizeof(string), "[SU KIEN O MAU VUI VE] {FFFFFF}%s(%d) got eliminated. Players Left: {F1C40F}%d", name, playerid, ColorMatchPlayers);
	for(new i, mp = GetPlayerPoolSize(); i <= mp; i++)
	{
		if(!IsPlayerConnected(i) || !InCMEvent[i]) continue;
		SendClientMessage(i, 0x3498DBFF, string);
	}
	
	InCMEvent[playerid] = false;
	
	if(ColorMatchStage == STAGE_PLAYING)
	{
	    if(ColorMatchPlayers < 2)
	    {
	        new winner = INVALID_PLAYER_ID;
	        for(new i, mp = GetPlayerPoolSize(); i <= mp; i++)
			{
				if(!IsPlayerConnected(i) || !InCMEvent[i]) continue;
				winner = i;
				break;
			}
			
			if(IsPlayerConnected(winner))
			{
			    GetPlayerName(winner, name, MAX_PLAYER_NAME);
			    format(string, sizeof(string), "[SU KIEN O MAU VUI VE] {FFFFFF}%s(%d) has won the event!", name, winner);
			    SendClientMessageToAll(0x3498DBFF, string);
			    GivePlayerMoney(winner, CM_REWARD);
			}
			
			SendClientMessageToAll(0x3498DBFF, "[SU KIEN O MAU VUI VE] {FFFFFF}Event ended.");
			ColorMatch_CleanUp(1);
	    }
	}
	
	return 1;
}

public OnFilterScriptInit()
{
	ColorMatchObjects[OBJ_ORANGE] = CreateObject(19353, 2005.390, 3866.277, 101.323, 0.000, 90.000, 90.000); //  orange
	SetObjectMaterial(ColorMatchObjects[OBJ_ORANGE], 0, 18996, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_ORANGE]));
	
	ColorMatchObjects[OBJ_RED] = CreateObject(19353, 2008.590, 3866.277, 101.323, 0.000, 90.000, 90.000); // red
	SetObjectMaterial(ColorMatchObjects[OBJ_RED], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_RED]));
	
	ColorMatchObjects[OBJ_GREEN] = CreateObject(19353, 2002.190, 3866.277, 101.323, 0.000, 90.000, 90.000); // green
	SetObjectMaterial(ColorMatchObjects[OBJ_GREEN], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_GREEN]));
	
	ColorMatchObjects[OBJ_YELLOW] = CreateObject(19353, 2008.590, 3862.777, 101.323, 0.000, 90.000, 90.000); // yellow
	SetObjectMaterial(ColorMatchObjects[OBJ_YELLOW], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_YELLOW]));
	
	ColorMatchObjects[OBJ_PURPLE] = CreateObject(19353, 2008.590, 3869.777, 101.323, 0.000, 90.000, 90.000); // purple
	SetObjectMaterial(ColorMatchObjects[OBJ_PURPLE], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_PURPLE]));

	ColorMatchObjects[OBJ_PINK] = CreateObject(19353, 2005.390, 3862.777, 101.323, 0.000, 90.000, 90.000); // pink
	SetObjectMaterial(ColorMatchObjects[OBJ_PINK], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_PINK]));
	
	ColorMatchObjects[OBJ_MAROON] = CreateObject(19353, 2005.390, 3869.777, 101.323, 0.000, 90.000, 90.000); // maroon
	SetObjectMaterial(ColorMatchObjects[OBJ_MAROON], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_MAROON]));
	
	ColorMatchObjects[OBJ_BLUE] = CreateObject(19353, 2002.190, 3869.777, 101.323, 0.000, 90.000, 90.000); // blue
	SetObjectMaterial(ColorMatchObjects[OBJ_BLUE], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_BLUE]));

	ColorMatchObjects[OBJ_WHITE] = CreateObject(19353, 2002.190, 3862.777, 101.323, 0.000, 90.000, 90.000); // white
	SetObjectMaterial(ColorMatchObjects[OBJ_WHITE], 0, 18646, "matcolours", "white", RGBAToARGB(ColorMatchColors[OBJ_WHITE]));
	
	#if defined CM_USEFENCES
	ColorMatchFences[0] = CreateObject(8674, 2005.395, 3871.529,102.859, 0.000, 0.000, 0.000);
	ColorMatchFences[1] = CreateObject(8674, 2000.584, 3866.285,102.859, 0.000, 0.000, 90.000);
	ColorMatchFences[2] = CreateObject(8674, 2010.208, 3866.285,102.859, 0.000, 0.000, 90.000);
	ColorMatchFences[3] = CreateObject(8674, 2005.395, 3861.021,102.859, 0.000, 0.000, 0.000);
	
	ColorMatchFences[4] = CreateObject(8674, 2005.395, 3871.529, 105.809, 0.000, 0.000, 0.000);
	ColorMatchFences[5] = CreateObject(8674, 2000.584, 3866.285, 105.809, 0.000, 0.000, 90.000);
	ColorMatchFences[6] = CreateObject(8674, 2010.208, 3866.285, 105.809, 0.000, 0.000, 90.000);
	ColorMatchFences[7] = CreateObject(8674, 2005.395, 3861.021, 105.809, 0.000, 0.000, 0.000);
	#endif
	
	ColorMatchTD = TextDrawCreate(39.000000, 300.000000, "_");
	TextDrawBackgroundColor(ColorMatchTD, 255);
	TextDrawFont(ColorMatchTD, 2);
	TextDrawLetterSize(ColorMatchTD, 0.260000, 1.400000);
	TextDrawColor(ColorMatchTD, -1);
	TextDrawSetOutline(ColorMatchTD, 1);
	TextDrawSetProportional(ColorMatchTD, 1);
	TextDrawSetSelectable(ColorMatchTD, 0);
	
	for(new i, mp = GetPlayerPoolSize(); i <= mp; i++) if(IsPlayerConnected(i)) ColorMatch_InitPlayer(i);
	return 1;
}

public OnFilterScriptExit()
{
	for(new i; i < sizeof(ColorMatchObjects); i++) DestroyObject(ColorMatchObjects[i]);
	
	#if defined CM_USEFENCES
	for(new i; i < sizeof(ColorMatchFences); i++) DestroyObject(ColorMatchFences[i]);
	#endif
	
	TextDrawDestroy(ColorMatchTD);
	
	for(new i, mp = GetPlayerPoolSize(); i <= mp; i++)
	{
		if(!IsPlayerConnected(i) || !InCMEvent[i]) continue;
		PlayerTextDrawDestroy(i, ColorText[i]);
		SetPlayerVirtualWorld(i, 0);
		SpawnPlayer(i);
	}
	
	return 1;
}

public OnPlayerConnect(playerid)
{
    ColorMatch_InitPlayer(playerid);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	ColorMatch_Eliminate(playerid);
	return 1;
}

CMD:colormatch(playerid, params[])
{
	if(InCMEvent[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You're already in the ColorMatch event.");
	if(ColorMatchStage == STAGE_PLAYING) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You can't join to the ColorMatch event because it started.");
	if(ColorMatchStage == STAGE_NONE) {
	    // init game
	    ColorMatchStage = STAGE_SETUP;
	    ColorMatchPlayers = 1;
	    ColorMatchTimer = SetTimerEx("CM_SetupTimer", 1000, false, "i", CM_SETUP_TIME);
	    ColorMatchFallTimer = ColorMatchEventTimer = -1;
		ColorMatch_Arena();
		
	    new string[144], name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	    format(string, sizeof(string), "[SU KIEN O MAU VUI VE] {FFFFFF}%s(%d) has started the event. Use {F1C40F}/colormatch {FFFFFF}to join.", name, playerid);
	    SendClientMessageToAll(0x3498DBFF, string);
	}else{
	    // player join
	    if(ColorMatchPlayers >= CM_MAX_PLAYERS) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You can't join to the ColorMatch event because its full.");
	    ColorMatchPlayers++;
	    
	    new string[144], name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	    format(string, sizeof(string), "[SU KIEN O MAU VUI VE] {FFFFFF}%s(%d) has joined the event. Use {F1C40F}/colormatch {FFFFFF}to join. [%d/%d]", name, playerid, ColorMatchPlayers, CM_MAX_PLAYERS);
	    SendClientMessageToAll(0x3498DBFF, string);
	}

    InCMEvent[playerid] = true;

	new Float: x, Float: y, Float: z;
	GetObjectPos(ColorMatchObjects[ random(9) ], x, y, z);
    SetPlayerPos(playerid, x + frandom(1.0, -1.0), y + frandom(1.0, -1.0), z + 1.0);
	SetPlayerVirtualWorld(playerid, 1);
	
	SendClientMessage(playerid, 0x3498DBFF, "[SU KIEN O MAU VUI VE] {FFFFFF}If you fall off/get stuck during setup time, don't worry because you'll get teleported again once the event begins.");
	return 1;
}

forward CM_SetupTimer(time);
public CM_SetupTimer(time)
{
	new string[144], soundid = 1056;
	time--;
	
	if(time < 1) {
		if(ColorMatchPlayers < CM_MIN_PLAYERS) {
	    	SendClientMessageToAll(0x3498DBFF, "[SU KIEN O MAU VUI VE] {FFFFFF}Event didn't start because not enough players joined.");
			ColorMatch_CleanUp(1);
			return 1;
		}else{
		    ColorMatchStage = STAGE_PLAYING;
		    ColorMatchTimer = SetTimer("CM_PickColor", 2000, false);
		    ColorMatchFallTimer = SetTimer("CM_FallTimer", 500, true);
		    ColorMatchEventTimer = SetTimerEx("CM_EndEvent", 1000, false, "i", CM_EVENT_TIME);
            TextDrawSetString(ColorMatchTD, "_");
            
		    format(string, sizeof(string), "~n~~n~~n~~b~~h~~h~Event ~g~~h~Started!");
		    soundid = 1057;
		}
	}else{
	    format(string, sizeof(string), "~n~~n~~n~~b~~h~~h~Event: ~g~~h~%d", time);
	    soundid = 1056;
	}
	
	for(new i = 0; i < 300; i++)
	{
		if(!IsPlayerConnected(i) || !InCMEvent[i]) continue;
		PlayerPlaySound(i, soundid, 0.0, 0.0, 0.0);
		GameTextForPlayer(i, string, 1000, 4);
		
		if(time < 1)
		{
		    TextDrawShowForPlayer(i, ColorMatchTD);
		
            new Float: x, Float: y, Float: z;
			GetObjectPos(ColorMatchObjects[ random(9) ], x, y, z);
		    SetPlayerPos(i, x + frandom(1.0, -1.0), y + frandom(1.0, -1.0), z + 1.0);
			
			#if defined CM_SEPERATE
			SetPlayerVirtualWorld(i, 100 + i);
			#endif
		}
  	}
  	
	if(time > 0) ColorMatchTimer = SetTimerEx("CM_SetupTimer", 1000, false, "i", time);
	return 1;
}

forward CM_FallTimer();
public CM_FallTimer()
{
	if(ColorMatchStage != STAGE_PLAYING) return 1;
	new Float: z;
	for(new i, mp = GetPlayerPoolSize(); i <= mp; i++)
	{
	    if(!IsPlayerConnected(i) || !InCMEvent[i]) continue;
	    GetPlayerPos(i, z, z, z);
	    if(z < 95.0) ColorMatch_Eliminate(i);
	}
	
	return 1;
}

forward CM_PickColor();
public CM_PickColor()
{
    if(ColorMatchStage != STAGE_PLAYING) return 1;
    new id = random(sizeof(ColorMatchNames));
    ColorMatchCurrent = id;

    for(new i, mp = GetPlayerPoolSize(); i <= mp; i++)
    {
        if(!IsPlayerConnected(i) || !InCMEvent[i]) continue;
        PlayerTextDrawColor(i, ColorText[i], ColorMatchColors[id]);
	    PlayerTextDrawSetString(i, ColorText[i], ColorMatchNames[ random(sizeof(ColorMatchNames)) ]);
		PlayerTextDrawShow(i, ColorText[i]);
    }

    ColorMatchTimer = SetTimer("CM_MoveObjects", 3000, false);
	return 1;
}

forward CM_MoveObjects();
public CM_MoveObjects()
{
    if(ColorMatchStage != STAGE_PLAYING) return 1;
    for(new i, mp = GetPlayerPoolSize(); i <= mp; i++)
    {
        if(!IsPlayerConnected(i) || !InCMEvent[i]) continue;
        PlayerTextDrawColor(i, ColorText[i], 0xFFFFFFFF);
	    PlayerTextDrawSetString(i, ColorText[i], "_");
		PlayerTextDrawHide(i, ColorText[i]);
    }
    
    new Float: x, Float: y, Float: z;
	for(new i; i < sizeof(ColorMatchObjects); i++)
	{
	    if(i == ColorMatchCurrent) continue;
	    GetObjectPos(ColorMatchObjects[i], x, y, z);
	    SetObjectPos(ColorMatchObjects[i], x, y, z - 1000.0);
	}

    ColorMatchTimer = SetTimer("CM_FixObjects", 3000, false);
	return 1;
}

forward CM_FixObjects();
public CM_FixObjects()
{
    if(ColorMatchStage != STAGE_PLAYING) return 1;
	new Float: x, Float: y, Float: z;
	for(new i; i < sizeof(ColorMatchObjects); i++)
	{
	    if(i == ColorMatchCurrent) continue;
	    GetObjectPos(ColorMatchObjects[i], x, y, z);
	    SetObjectPos(ColorMatchObjects[i], x, y, z + 1000.0);
	}
	
	ColorMatchTimer = SetTimer("CM_PickColor", 1000, false);
	return 1;
}

forward CM_EndEvent(time);
public CM_EndEvent(time)
{
    if(ColorMatchStage != STAGE_PLAYING) return 1;
    new string[32];
    
    if(time > 1) {
        time--;
        
        format(string, sizeof(string), "Time Left: %s%s", (time > 10) ? ("~y~~h~") : ("~r~~h~"), ConvertToMinutes(time));
        TextDrawSetString(ColorMatchTD, string);
        ColorMatchEventTimer = SetTimerEx("CM_EndEvent", 1000, false, "i", time);
    }else if(time == 1) {
        for(new i, mp = GetPlayerPoolSize(); i <= mp; i++)
	    {
	        if(!IsPlayerConnected(i) || !InCMEvent[i]) continue;
	        GivePlayerMoney(i, CM_REWARD);
	        SendClientMessage(i, 0x3498DBFF, "[SU KIEN O MAU VUI VE] {FFFFFF}You're all winners!");
	    }
	    
        SendClientMessageToAll(0x3498DBFF, "[SU KIEN O MAU VUI VE] {FFFFFF}Event ended.");
        ColorMatch_CleanUp(1);
    }
    
	return 1;
}
