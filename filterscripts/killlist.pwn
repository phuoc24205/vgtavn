//=========================iRANKS and Killing Spree System======================
//======================Please donot remove credits=============================
//========================Filterscript is made by inshal========================


#include <a_samp>
#include <dini>

#define dcmd(%1,%2,%3) if (!strcmp((%3)[1], #%1, true, (%2)) && ((((%3)[(%2) + 1] == '\0') && (dcmd_%1(playerid, ""))) || (((%3)[(%2) + 1] == ' ') && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

new Text:iRank[MAX_PLAYERS],Text:Stats[MAX_PLAYERS];
new PlayerTotalKills[MAX_PLAYERS] = 0;
new string[128];

#define COLOR_YELLOW 			0xFFFF00AA
#define COLOR_PINK     			0xFF66FFAA
#define COLOR_AQUA     			0x7CFC00AA
#define COLOR_WHITE 			0xFFFFFFAA
#define COLOR_RED 0xFF0000AA
#define Ranks                   353
new Kills[MAX_PLAYERS],Deaths[MAX_PLAYERS];

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("--iRanks and Killing spree system v1.1--");
	print("--------made by inshal - loaded---------");
	print("--------------------------------------\n");

	if(!dini_Exists("Deaths.cfg"))
	{
	  dini_Create("Deaths.cfg");
	}

	if(!dini_Exists("Kills.cfg"))
	{
	  dini_Create("Kills.cfg");
	}


	return 1;
}

public OnFilterScriptExit()
{
	printf("*** Rank System Unloaded *** ");

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

    new Pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, Pname, MAX_PLAYER_NAME);
 	Deaths[playerid] = dini_Int("Deaths.cfg", Pname);
 	Kills[playerid] = dini_Int("Kills.cfg", Pname);
	new Name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,Name,sizeof(Name));
	SendClientMessage(playerid,COLOR_AQUA,"Welcome to the server! iRank and Killing Spree System by inshal is being used!");
	iRank[playerid] = TextDrawCreate(498.000000, 100.000000, " ");
	TextDrawBackgroundColor(iRank[playerid], 255);
	TextDrawFont(iRank[playerid], 2);
	TextDrawLetterSize(iRank[playerid], 0.250000, 0.899999);
	TextDrawColor(iRank[playerid], -1);
	TextDrawSetOutline(iRank[playerid], 0);
	TextDrawSetProportional(iRank[playerid], 1);
	TextDrawSetShadow(iRank[playerid], 1);

	Stats[playerid] = TextDrawCreate(499.000000, 110.000000, "~r~Kills: ~w~0 ~g~Deaths: ~w~0");
	TextDrawBackgroundColor(Stats[playerid], 255);
	TextDrawFont(Stats[playerid], 2);
	TextDrawLetterSize(Stats[playerid], 0.159999, 1.000000);
	TextDrawColor(Stats[playerid], -1);
	TextDrawSetOutline(Stats[playerid], 0);
	TextDrawSetProportional(Stats[playerid], 1);
	TextDrawSetShadow(Stats[playerid], 1);



	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{

	new Pname[MAX_PLAYER_NAME];
  	GetPlayerName(playerid, Pname, MAX_PLAYER_NAME);
  	dini_IntSet("Deaths.cfg", Pname, Deaths[playerid]);
  	dini_IntSet("Kills.cfg", Pname, Kills[playerid]);
	return 1;
}

public OnPlayerSpawn(playerid)
{
	TextDrawShowForPlayer(playerid,Text:Stats[playerid]);
	TextDrawShowForPlayer(playerid,Text:iRank[playerid]);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	Kills[killerid]++;
	Deaths[playerid]++;
	new Name[128];
    GetPlayerName(killerid, Name, sizeof(Name));
    PlayerTotalKills[killerid]++;
    PlayerTotalKills[playerid] = 0;
    if(PlayerTotalKills[killerid] == 1) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/firstblood.mp3");
		format(string,sizeof(string),"%s has killed 1 player (FIRST BLOOD)",Name);
		SendClientMessageToAll(COLOR_RED,string);
    }
    if(PlayerTotalKills[killerid] == 2) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/doublekill.mp3");
		format(string,sizeof(string),"%s has killed 2 players without getting killed (DOUBLE KILL)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
    if(PlayerTotalKills[killerid] == 3) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/triplekill.mp3");
		format(string,sizeof(string),"%s has killed 3 players without getting killed (TRIPLE KILL)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
    if(PlayerTotalKills[killerid] == 4) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/dominating.mp3");
		format(string,sizeof(string),"%s has killed 4 players without getting killed (DOMINATING)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
    if(PlayerTotalKills[killerid] == 5) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/killingspree.mp3");
		format(string,sizeof(string),"%s has killed 5 players without getting killed (KILLING SPREE)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
    if(PlayerTotalKills[killerid] == 7) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/monsterkill.mp3");
		format(string,sizeof(string),"%s has killed 7 players without getting killed (MONSTER KILL)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
    if(PlayerTotalKills[killerid] == 9) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/wickedsick.mp3");
		format(string,sizeof(string),"%s has killed 9 players without getting killed (WICKED SICK)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
    if(PlayerTotalKills[killerid] == 11) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/ludicrouskill.mp3");
		format(string,sizeof(string),"%s has killed 11 players without getting killed (LUDICROUS KILL)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
    if(PlayerTotalKills[killerid] == 13) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/ultrakill.mp3");
		format(string,sizeof(string),"%s has killed 13 players without getting kiled (ULTRA KILL)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
    if(PlayerTotalKills[killerid] == 15) {
        PlayAudioStreamForPlayer(killerid, "http://www.pamp3.site40.net/quake/unstoppable.mp3");
		format(string,sizeof(string),"%s has killed 15 players without getting killed (UNSTOPPABLE)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
    if(PlayerTotalKills[killerid] == 17) {
        PlayAudioStreamForPlayer(killerid, "http://k002.kiwi6.com/hotlink/hbnvs5u81m/counter_strike_jingle_-_quake_voice-godlike.mp3");
		format(string,sizeof(string),"%s has killed 17 players without getting killed (GOD-LIKE)",Name);
		SendClientMessageToAll(COLOR_RED,string);
        return 1;
    }
	return 1;
}

dcmd_ranks( playerid, params[])
{
	#pragma unused params
    ShowPlayerDialog(playerid, 35, DIALOG_STYLE_LIST, "iRANKS", "Newbie\nSurvivor\nKill Streaker\nDeath Tech\nRambo\nKill Machine", "okay", "Cancel");
    return 1;
}

dcmd_icredits( playerid, params[])
{
	#pragma unused params
	SendClientMessage(playerid, COLOR_AQUA, "iRanks v1.1 made by inshal");
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	dcmd(ranks,5,cmdtext);
	dcmd(icredits,8,cmdtext);

	return 0;
}


GetPlayerRank(playerid)
{
	if(Kills[playerid]<20)
	{
	TextDrawSetString(Text:iRank[playerid],"~r~RANK:~w~Newbie");
 	new Float:x,Float:y,Float:z;
  	new Text3D:label1 = Create3DTextLabel("RANK : Newbie", COLOR_RED,x,y,z, 40.0, 0, 0);
   	GetPlayerPos(playerid,x,y,z);
   	Attach3DTextLabelToPlayer(label1,playerid,0.0, 0.0, 0.7);
	}
	else if(Kills[playerid]<50 && Kills[playerid]>=20)
	{
	TextDrawSetString(Text:iRank[playerid],"~r~RANK:~w~Survivor");
 	new Float:x,Float:y,Float:z;
  	new Text3D:label2 = Create3DTextLabel("RANK : Survivor", COLOR_RED,x,y,z, 40.0, 0, 0);
   	GetPlayerPos(playerid,x,y,z);
   	Attach3DTextLabelToPlayer(label2,playerid,0.0, 0.0, 0.7);
	}
	else if(Kills[playerid]<100 && Kills[playerid]>=50)
	{
	TextDrawSetString(Text:iRank[playerid],"~r~RANK:~w~Kill Streaker");
 	new Float:x,Float:y,Float:z;
  	new Text3D:label3 = Create3DTextLabel("RANK : Kill Streaker", COLOR_RED,x,y,z, 40.0, 0, 0);
   	GetPlayerPos(playerid,x,y,z);
   	Attach3DTextLabelToPlayer(label3,playerid,0.0, 0.0, 0.7);
	}
	else if(Kills[playerid]<300 && Kills[playerid]>=100)
	{
	TextDrawSetString(Text:iRank[playerid],"~r~RANK:~w~Death Tech");
 	new Float:x,Float:y,Float:z;
  	new Text3D:label4 = Create3DTextLabel("RANK : Death Tech", COLOR_RED,x,y,z, 40.0, 0, 0);
   	GetPlayerPos(playerid,x,y,z);
   	Attach3DTextLabelToPlayer(label4,playerid,0.0, 0.0, 0.7);
   	}
	else if(Kills[playerid]<600 && Kills[playerid]>=300)
	{
	TextDrawSetString(Text:iRank[playerid],"~r~RANK:~w~Rambo");
 	new Float:x,Float:y,Float:z;
  	new Text3D:label5 = Create3DTextLabel("RANK : Rambo", COLOR_RED,x,y,z, 40.0, 0, 0);
   	GetPlayerPos(playerid,x,y,z);
   	Attach3DTextLabelToPlayer(label5,playerid,0.0, 0.0, 0.7);
	}
	else if(Kills[playerid]>= 600)
	{
	TextDrawSetString(Text:iRank[playerid],"~r~RANK:~w~Kill Machine");
 	new Float:x,Float:y,Float:z;
  	new Text3D:label6 = Create3DTextLabel("RANK : Kill Machine", COLOR_RED,x,y,z, 40.0, 0, 0);
   	GetPlayerPos(playerid,x,y,z);
   	Attach3DTextLabelToPlayer(label6,playerid,0.0, 0.0, 0.7);
	}
	return 1;
}

stock GetPlayerKills(playerid)
{
	return Kills[playerid];
}
stock GetPlayerDeaths(playerid)
{
	return Deaths[playerid];
}
public OnPlayerUpdate(playerid)
{
	new str[256];
	format(str,sizeof(str),"~r~Kills: ~w~%d ~g~Deaths: ~w~%d",Kills[playerid],Deaths[playerid]);
	TextDrawSetString(Text:Stats[playerid],str);
	GetPlayerRank(playerid);
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
if(response)
    {
    switch(dialogid)
        {
		case 35:
    	    {
           	switch(listitem)// Checking which listitem was selected
        	{
        	    case 0:
				{
				SendClientMessage(playerid,COLOR_AQUA,"Newbie : For less than 20 kills.");
        	    }
        	    case 1: // The second item listed
        	    {
        	    SendClientMessage(playerid,COLOR_AQUA,"Survivor : For more than 20 kills and less than 50 kills. ");
        	    }
        	    case 2: // The third item listed
        	    {
        	    SendClientMessage(playerid,COLOR_AQUA,"Kill Streaker : For more than 50 kills and less than 100 kills. ");
        	    }
        	    case 3: // The third item listed
        	    {
        	    SendClientMessage(playerid,COLOR_AQUA,"Death Tech : For more than 100 kills and less than 300 kills. ");
				}
        	    case 4: // The fourth item listed
        	    {
        	    SendClientMessage(playerid,COLOR_AQUA,"Rambo : For more than 300 kills and less than 600 kills. ");
				}
				case 5: // The fifht item listed
				{
				SendClientMessage(playerid,COLOR_AQUA,"Kill Machine : For more than 600 kills. ");
				}
        	}
    	    }
	}
    }
return 1;
}