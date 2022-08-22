////////INCLUDES//////////
#include <a_samp>
#include <foreach>
////////COLORS////////////
#define WHITE      "{FFFFFF}"
#define RED        "{F81414}"
#define COLOR_RED   "{F81414}"
#define COLOR_BLUE 0x0000BBAA
#define RED 0xFF0000FF
////////DEFINES///////////
#define MAX_ARMOUR (99.0)
#define DIALOG_PRAVILA (1000) // 1000 = DIALOG ID
#define ResetMoneyBar ResetPlayerMoney
#define UpdateMoneyBar GivePlayerMoney
#define MAX_PING 600//////
#define GetPlayerSpeed

///////////////////////////////////////////////////////////////////////
new JetPack[MAX_PLAYERS];
new Cash[MAX_PLAYERS];
////////////////////////////////////////////////////////////////////////////////
public OnFilterScriptInit()
{
        print("\n-------------------------------------");
        print("| Lanix anticheat loaded |");
        print("-------------------------------------\n");
        return 1;
}
public OnPlayerUpdate(playerid)
{
/////////////////////////FLY HACK////////////////////////////////////////
        new Float:animX, Float:animY, Float:animZ;
        new anim = GetPlayerAnimationIndex(playerid);
        GetPlayerPos(playerid, animX, animY, animZ);
        if((anim >= 1538) && (anim <= 1542) && animZ > 5)
        {

        TogglePlayerControllable(playerid, false);
        SetPlayerPos(playerid, 1941.1534,-1100.2391,-23.7885);
        ShowPlayerDialog(playerid, DIALOG_PRAVILA,DIALOG_STYLE_MSGBOX,"Anti-Hack", "{FFCC00}[Anticheat]"WHITE"[Anti-Cheat] You Have Been Banned for using Fly Hack!!!","Ok","");
        KickEx(playerid, "Fly Hack");
        //}
        //return 1;
}
/////////////////////SPEED HACK///////////NOT WORKING///////////////////
        if(IsPlayerInAnyVehicle(playerid))
     	{
     	    if(GetPlayerSpeed(playerid) > 200)
     	    {
     	        TogglePlayerControllable(playerid, false);
                SetPlayerPos(playerid, 1941.1534,-1100.2391,-23.7885);
                ShowPlayerDialog(playerid, DIALOG_PRAVILA,DIALOG_STYLE_MSGBOX,"Anti-Hack", "{FFCC00}[Anticheat]"WHITE"[Anti-Cheat] You Have Been Banned for using Speed	Hack!!!","Ok","");
                BanEx(playerid, "Speed Hack");
			}
		}
///////////////////////ARMOUR HACK/////////////////////////////////////
        new Float:Armour;
        GetPlayerArmour(playerid, Armour);
        #if defined MAX_ARMOUR
        if(Armour > 99.0)
    {
        TogglePlayerControllable(playerid, false);
        SetPlayerPos(playerid, 1941.1534,-1100.2391,-23.7885);
        ShowPlayerDialog(playerid, DIALOG_PRAVILA,DIALOG_STYLE_MSGBOX,"Anti-Hack", "{FFCC00}[Anticheat]"WHITE"[Anti-Cheat] You Have Been Banned for using Armour hack!!!","Ok","");
        BanEx(playerid, "Armour Hack");
    }
    ///////////////JETPACK HACK//////////////////////////////////////////////
    if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK)
    {
        if(JetPack[playerid] == 0)
        {
           ShowPlayerDialog(playerid, DIALOG_PRAVILA,DIALOG_STYLE_MSGBOX,"Anti-Hack", "{FFCC00}[Anticheat]"WHITE"[Anti-Cheat] You Have Been Banned for using Jetpack Hack!!!","Ok","");
           BanEx(playerid, "Jetpack Hack");
        }
        else
            return 1;
    }
    else JetPack[playerid] = 0;
    return 1;
}
public OnGameModeInit()
{
	SetTimer("MoneyTimer", 1000, 1);
	SetTimer("PingChecker",5000,1);
	return 1;
}
public OnPlayerConnect(playerid)
{
        
        ResetPlayerCash(playerid);
        JetPack[playerid] = 1;
        SendClientMessage(playerid,COLOR_BLUE,"Server is using Anticheat made by Lanix");//You can edit this
        return 1;
}
public OnPlayerDisconnect(playerid)
{
    JetPack[playerid] = 0;
    return 1;
}
public OnPlayerSpawn(playerid)
{
        return 1;
}

stock GivePlayerCash(playerid, money)
{
	Cash[playerid] += money;
	ResetMoneyBar(playerid);
	UpdateMoneyBar(playerid,Cash[playerid]);
	return Cash[playerid];
}
stock SetPlayerCash(playerid, money)
{
	Cash[playerid] = money;
	ResetMoneyBar(playerid);
	UpdateMoneyBar(playerid,Cash[playerid]);
	return Cash[playerid];
}
stock ResetPlayerCash(playerid)
{
	Cash[playerid] = 0;
	ResetMoneyBar(playerid);
	UpdateMoneyBar(playerid,Cash[playerid]);
	return Cash[playerid];
}
stock GetPlayerCash(playerid)
{
	return Cash[playerid];
}
public MoneyTimer()
{
	new username[MAX_PLAYER_NAME];
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(GetPlayerCash(i) != GetPlayerMoney(i))
			{
				ResetMoneyBar(i);
				UpdateMoneyBar(i,GetPlayerCash(i));
				new hack = GetPlayerMoney(i) - GetPlayerCash(i);
				GetPlayerName(i,username,sizeof(username));
				printf("%s has picked up/attempted to spawn $%d.", username,hack);
			}
		}
	}
}
public OnVehicleMod(playerid, vehicleid, componentid)
{
	if(GetPlayerInterior(playerid)==0)
	{
	ShowPlayerDialog(playerid, DIALOG_PRAVILA,DIALOG_STYLE_MSGBOX,"Anti-Hack", "{FFCC00}[Anticheat]"WHITE"[Anti-Cheat] You Have Been Banned for using Tuning hack!!!","Ok","");
	BanEx(playerid, "Tuning Hack");
	}
	return 1;
}
public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	if(GetPlayerInterior(playerid)==0)
	{
	ShowPlayerDialog(playerid, DIALOG_PRAVILA,DIALOG_STYLE_MSGBOX,"Anti-Hack", "{FFCC00}[Anticheat]"WHITE"[Anti-Cheat] You Have Been Banned for using Tuning hack!!!","Ok","");
	BanEx(playerid, "Tuning Hack");
	}
	return 1;
}
#endif