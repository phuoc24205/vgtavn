#include <a_samp>
#include <FCNPC>
stock SetPlayerPosFacing(playerid,Float:x ,Float:y,Float:z,Float:a)
{   SetPlayerPos(playerid , x , y ,z);
    SetPlayerFacingAngle(playerid, a);
    SetCameraBehindPlayer(playerid);
    return 1;
}
//	About: FCNPC Author: ziggi

/*
	As long as you use ctrl + H to change the name and xyz, Can mass produce this AI
    Ctrl + H
	Search for : WA3
	Replace with : you want change a name

	Search for : WalkAttack3
	Replace with : you want change a name
*/

//WA3***************************************************************************
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BRIGHTRED 0xFF0000AA

#define pWA3PlayerSP -2381.5, 2335.6, 4.9, 89.3
#define WA3InteriorID 0                
#define WA3facing 100.7
#define WA3xyz	 -2396.6, 2343.3, 4.8  
#define WA3pickupXYZ -2393.3, 2327.7 , 4.9  
new WA3timer=-1;  
new ReWA3timer=-1;
new StoneWA3timer=-1;
new WA3IsMabi[MAX_PLAYERS]=0; 		//Paralyzed variables, as switches

new WalkAttack3;        			//AI name in .pwn file

new WA3ragemodeBeforeShot = 0;      // Save the speed before the transformation, to cancel the transformation
new WA3ragemodeAfterShot = 150 ;    //The rate of fire after the transformation is scheduled to be 150
new WA3ragemode=0;					// The variables of the transformation mode,as switches
new WA3ragemodeOffcounter=0;		// The variables of the transformation mode,as counter
#define WA3ragemodeOffcounterMAX 2 	// The total number of players defeated, In order to lift the transformation
#define WA3skin 10123  				// skin
new SetWA3wepon = 26; 				// weapon
new WA3MOVETimer = 100 ;   			// Perform a move in a few seconds
#define WA3NOTICE 50  				// Warning range
#define WA3NEAR 40    				// shoot Range
#define WA3NEAR2 20					// shoot Range2 , for test
#define WA3MOVERANGE 10 			// If the preset moving range exceeds, it will return
#define StoneWA3TIME 500
#define RstStoneWA3Time 3000
#define WA3MAXHP 322
new WA3Load = 150 ;    				
new WA3Shot = 250 ;     			
new Float:WA3AIM =    1.0 ,
	WA3Shotmin =      50 ,         	
	WA3Shotmax =      750 ;         
new Float:WA3posx[MAX_PLAYERS],
	Float:WA3posy[MAX_PLAYERS],
	Float:WA3posz[MAX_PLAYERS];     
new WA3InBsSpawn = 0;				
new Text3D:WA3Label,Text3D:WA3Label2,WA3pickup;
#define WA3nameStatus "WA3[DSman]" 	//AI head display status 1 name
#define WA3nameStatus2 "[IsMabi]" 	//status 2 is paralyzed
#define WA3NameLabel -1 			//status 1 name color white white
#define WA3IsRageColor 0xFF0000FF	//status 1 transformation mode color bright red
#define WA3IsMabiColor 0xDABB3EFF  	//status 2 color YELLOW
#define WA3HPFull 0x9EC73DFF  		//AI displays HP GREEN above the head
#define WA3HPSome 0xFF9900FF  		// ORANGE
#define WA3HPLow 0xAA3333FF  		// RED
#define WA3HP1 "OOOOOOO"
#define WA3HP2 "OOOOOO-"
#define WA3HP3 "OOOOO--"
#define WA3HP4 "OOOO---"
#define WA3HP5 "OOO----"
#define WA3HP6 "OO-----"
#define WA3HP7 "O------"
#define WA3HP8 "-------"
new WA3AFK[MAX_PLAYERS];			//check player is afk
new WA3AFKTime = -1;				
new WA3checkSpawned[MAX_PLAYERS];	//check player is alive
new Float:WA3CheckPlayerIsAfk[3];

new WA3set1 = 1;					//AI mode ,example only hit player, or only hit AI

#define PyJoinAiNO 0				//check Ai is team
#define PyJoinAiYES 1
new AIteam[MAX_PLAYERS] = PyJoinAiNO;

public OnFilterScriptInit()
{
	WalkAttack3 = FCNPC_Create(WA3nameStatus); 
	SetWA3Spawn(WalkAttack3);
	//FCNPC_Spawn(WalkAttack3, WA3skin,WA3xyz);
	FCNPC_Spawn(WalkAttack3, 294,-2396.6, 2343.3, 4.8);
	WA3Label = Create3DTextLabel(WA3HP1, WA3HPFull, 0.0, 0.0, 0.0, 30.0, 0, 1);
	Attach3DTextLabelToPlayer(WA3Label, WalkAttack3, 0.0, 0.0, 0.1); 
	WA3Label2 = Create3DTextLabel(WA3nameStatus, WA3NameLabel, 0.0, 0.0, 0.0, 30.0, 0, 1);
	Attach3DTextLabelToPlayer(WA3Label2, WalkAttack3, 0.0, 0.0, 0.45);
	WA3pickup =  CreatePickup(1239, 2, WA3pickupXYZ,-1);
	
	return 1;
}
public OnFilterScriptExit()
{
	KillTimer(ReWA3timer);
	KillTimer(WA3timer);
	KillTimer(StoneWA3timer);
	FCNPC_Destroy(WalkAttack3);
	Delete3DTextLabel(WA3Label);
	Delete3DTextLabel(WA3Label2);
	DestroyPickup(WA3pickup);
	
	KillTimer(WA3AFKTime);
	
	return 1;
}
public OnPlayerConnect(playerid)
{
	SetPlayerColor(WalkAttack3,-1);
	WA3checkSpawned[playerid]=0;    //player is not alive

	return 1;
}
public OnPlayerSpawn(playerid)
{
	WA3checkSpawned[playerid]=1;	//player is alive
	WA3AFK[playerid]=0;
	WA3AFKTime = SetTimerEx("WA3AFKCheck",1000,false, "d", playerid);	//player is afk delect
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
    if (killerid == WalkAttack3)
    {
  		new Float:WA3HP;
  		WA3HP = FCNPC_GetHealth(WalkAttack3);
        if (WA3ragemode == 0)                           //In normal mode
        {
            FCNPC_SetHealth(WalkAttack3, FCNPC_GetHealth(WalkAttack3)+138 );    //+138 HP
            if (WA3HP > WA3MAXHP)FCNPC_SetHealth(WalkAttack3, 322);             
	        WA3HPUpdata(WalkAttack3);                   // updata hp and show
		}
        else                                            //Transforming mode
        {
 			FCNPC_SetHealth(WalkAttack3, 322);          //HP set full
 			if (WA3ragemodeOffcounter > WA3ragemodeOffcounterMAX )  //Knock down the player N times in a row
		 	{
				SendClientMessage(playerid, -1,"copld: {FF0000}you know who is big! {FFFFFF}rage mode off");
				WA3ragemodeOffcounter=0;                //counter set 0
				WA3ragemode = 0;                        //Untransform

				SetPlayerColor(WalkAttack3,WA3NameLabel); //set name color is normal mode
				Update3DTextLabelText(WA3Label2, WA3NameLabel, WA3nameStatus);
				WA3Shot = WA3ragemodeBeforeShot ;       //set shot speed is normal mode
				FCNPC_Respawn(WalkAttack3);             //Respawn AI prevents lying on the ground or shaking hands and not shooting
				
				KillTimer(WA3timer);                    //rerun timer
				KillTimer(ReWA3timer);
				WA3timer=SetTimerEx("WA3Move", WA3Shot, true, "i", WalkAttack3);
		 	}
 			else    ////Knock down the player N times in a row, but it has not reached the number of times the transformation has been cancelled
			{
				WA3ragemodeOffcounter++;           	//counter +1
			}
 			Update3DTextLabelText(WA3Label, WA3HPFull, WA3HP1);
		}
		if (WA3set1 != 2)WA3checkSpawned[playerid]=0;
		else    WA3checkSpawned[playerid]=1;
		
		KillTimer(WA3AFKTime);
	}

	return 1;
}
public FCNPC_OnSpawn(npcid)
{
	if (npcid == WalkAttack3)						
	{
		KillTimer(ReWA3timer);
		WA3timer=SetTimerEx("WA3Move", WA3MOVETimer, true, "i", npcid);
	}
	
	return 1;
}
public FCNPC_OnDeath(npcid, killerid, reason)
{
    if (npcid == WalkAttack3)
    {	ReWA3timer = SetTimerEx("SetWA3Spawn", 2500 , false, "d", npcid);

		if(WA3ragemode == 0 )
		Update3DTextLabelText(WA3Label, WA3HPLow, WA3HP8);
		else
		{	Update3DTextLabelText(WA3Label, WA3HPLow, WA3HP8);
		    WA3ragemodeOffcounter = 0;
		}
		WA3checkSpawned[killerid]=1;
	}
	
	return 1;
}
public FCNPC_OnTakeDamage(npcid, issuerid, Float:amount, weaponid, bodypart)
{
	if (npcid == WalkAttack3)  // Imitate the player being hit by weapons such as desert eagle or sniper
	{
		if ((weaponid == 24 || weaponid == 25|| weaponid == 34)&& FCNPC_IsSpawned(npcid))
  		{
		   	if (WA3IsMabi[npcid]==0 )//if AI is not paralyzed
  		    {
                WA3IsMabi[npcid]=1;  //ai will paralyzed
                StoneWA3timer =  SetTimerEx("StoneWA3Time", 100 , false, "d", npcid);
			}
		}
		FCNPC_GetHealth(WalkAttack3);
		WA3HPUpdata(npcid);
	}

	
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
//WA3***************************************************************************
	if(strcmp("/WA3", cmdtext, true) == 0)
	{
		SetPlayerPosFacing(playerid, pWA3PlayerSP  );
		return 1;
	}
	if(strcmp("/reWA3", cmdtext, true) == 0)
	{
		SendRconCommand("reloadfs WA3");
		return 1;
	}
	if(strcmp("/WA3shot", cmdtext, true) == 0)
	{
	    WA3Shot=WA3Shot-100;
	    if (WA3Shot <= WA3Shotmin) WA3Shot = WA3Shotmax;

		new string[128];
		format(string, sizeof(string), " AI speed -0.1 now: %d", WA3Shot);
		SendClientMessage(playerid, -1,string);
		return 1;
	}
	if(strcmp("/WA3shot2", cmdtext, true) == 0)
	{
	    WA3Shot=WA3Shot-200;
	    if (WA3Shot <= WA3Shotmin) WA3Shot = WA3Shotmax;

		new string[128];
		format(string, sizeof(string), " AI speed -0.2 now : %d", WA3Shot);
		SendClientMessage(playerid, -1,string);
		return 1;
	}
	if(strcmp("/WA3come", cmdtext, true) == 0) //change ai spawn point
	{
	    WA3InBsSpawn = 1 ;
		GetPlayerPos(playerid, WA3posx[WalkAttack3],WA3posy[WalkAttack3],WA3posz[WalkAttack3]);
        FCNPC_SetPosition(WalkAttack3, WA3posx[WalkAttack3]+1.5,WA3posy[WalkAttack3],WA3posz[WalkAttack3]);

		return 1;
	}
	if(strcmp("/WA3def", cmdtext, true) == 0)   // init
	{
		FCNPC_SetPosition(WalkAttack3, WA3xyz);
	    FCNPC_Stop(WalkAttack3);
		KillTimer(ReWA3timer);
		KillTimer(WA3timer);
		KillTimer(StoneWA3timer);
	    SetWA3wepon = 26;
		WA3Shot = 250 ;
		WA3AIM = 0.1 ;
		WA3set1 = 1;
		FCNPC_Respawn(WalkAttack3);
		FCNPC_StopAim(WalkAttack3);
		new string[128];
		format(string, sizeof(string), "speed now: %d", WA3Shot);
		SendClientMessage(playerid, -1,string);
		WA3ragemode=0;
		WA3InBsSpawn = 0;
		return 1;
	}
	if(strcmp("/WA3set2", cmdtext, true) == 0)
	{
	    WA3set1 = 2;
   	    AIteam[WalkAttack3] = PyJoinAiNO ;
	    SendClientMessage(playerid, -1,"AI set 2 AI shoot range is 15 , can fight with anothe AI");return 1;
	}
	if(strcmp("/WA3set1", cmdtext, true) == 0)
	{
	    WA3set1 = 1;
   	    AIteam[WalkAttack3] = PyJoinAiYES ;
	    SendClientMessage(playerid, -1,"AI set 1 if another AI is set1 too ,will dont fight with anothe AI");return 1;
	}
	if(strcmp("/WA3set0", cmdtext, true) == 0)
	{
	    WA3set1 = 0;
   	    AIteam[WalkAttack3] = PyJoinAiNO ;
	    SendClientMessage(playerid, -1,"AI set 0 if player is AFK, dont shoot afk player)");return 1;
	}
	if(strcmp("/WA3rage", cmdtext, true) == 0) 
	{
   		if (WA3ragemode == 0)                       //If ai haven't transformed
		{
			WA3ragemode = 1;                        //transformed
			SendClientMessage(playerid, -1,"{FFFFFF}copld: {FF0000}rage mode on");
			SendClientMessage(playerid, -1,"{FFFFFF}[]1.speed up , kill player will heal all health. ");
			SetPlayerColor(WalkAttack3,WA3IsRageColor);//change color
			Update3DTextLabelText(WA3Label2, WA3IsRageColor, WA3nameStatus);
			WA3ragemodeBeforeShot = WA3Shot;        //save now speed
			WA3Shot = WA3ragemodeAfterShot;         //change speed 

			KillTimer(WA3timer);                    //rerun timer
			KillTimer(ReWA3timer);
			WA3timer=SetTimerEx("WA3Move", WA3Shot, true, "i", WalkAttack3);
			FCNPC_Respawn(WalkAttack3);             //respawn ai
		}
 		else                       					//If ai is transformed
		{
			WA3ragemode = 0;                        //cnacel transformed
			SendClientMessage(playerid, -1,"copld: ragemode off");
			SetPlayerColor(WalkAttack3,WA3NameLabel);   //change color
			Update3DTextLabelText(WA3Label2, WA3NameLabel, WA3nameStatus);
			WA3Shot = WA3ragemodeBeforeShot;        //change speed before
			FCNPC_Respawn(WalkAttack3);             //respawn ai
			
			KillTimer(WA3timer);                    //rerun timer
			KillTimer(ReWA3timer);
			WA3timer=SetTimerEx("WA3Move", WA3Shot, true, "i", WalkAttack3);
		}
		return 1;
	}
	if(strcmp("/aiteam", cmdtext, true) == 0)
	{
	    if (AIteam[playerid] == PyJoinAiNO)
		{
			AIteam[playerid] = PyJoinAiYES;
			SendClientMessage(playerid, -1,"AI hit you No.");
		}
		else
		{
			AIteam[playerid] = PyJoinAiNO;
			SendClientMessage(playerid, -1,"AI hit you Yes.");
		}
		return 1;
	}
 	return 0;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
    if(pickupid == WA3pickup)
    {
		SendClientMessage(playerid, -1,"/WA3def¡@/WA3shot¡@speed-100¡@/WA3shot2¡@speed-200¡@/WA3come change AI spawn point");
		new str[128]; format(str, sizeof(str), "now Rate of fire :0.%d sec",WA3Shot);
		SendClientMessage(playerid, -1,str);
		SendClientMessage(playerid, -1,"/WA3def¡@Parameter initialization¡@/WA3shot¡@type once, rate of fire -100 ms");
		SendClientMessage(playerid, -1,"/WA3set0 /WA3set1¡@/WA3set2¡@{FF0000}/WA3rage Watch out!");
		SendClientMessage(playerid, -1,"WA3 is able to aim and hit the player's Position");
		SendClientMessage(playerid, -1,"Logic = Attack 2 times, then move 1 time, repeat the loop");
	}
    
    return 1;
}

stock IsPlayerInRangeOfPlayer(playerid,targetid,range)
{
    if(!IsPlayerConnected(targetid)) return -1;
    new Float:pos[3];
    GetPlayerPos(targetid,pos[0],pos[1],pos[2]);
    if (   IsPlayerInRangeOfPoint(playerid,range,pos[0],pos[1],pos[2]) ) return 1;
    return 0;
}
//WA3***************************************************************************
stock WA3HPUpdata(npcid) 
{
	new Float: WA3HP = FCNPC_GetHealth(npcid);
	if ( WA3HP >= 276) Update3DTextLabelText(WA3Label, WA3HPFull, WA3HP2);
	else if (276 > WA3HP >= 230) Update3DTextLabelText(WA3Label, WA3HPFull, WA3HP3);
	else if (230 > WA3HP >= 184) Update3DTextLabelText(WA3Label, WA3HPSome, WA3HP4);
	else if (184 > WA3HP >= 138) Update3DTextLabelText(WA3Label, WA3HPSome, WA3HP5);
	else if (138 > WA3HP >= 92) Update3DTextLabelText(WA3Label, WA3HPLow, WA3HP6);
	else Update3DTextLabelText(WA3Label, WA3HPLow, WA3HP7);
}
forward WA3Move(npcid,playerid);
public WA3Move(npcid,playerid)
{
	if (npcid == WalkAttack3)
	{
		for(new i = 0; i < MAX_PLAYERS; i++)  //for avoid AI only play with id0 player
		{
		    if (!IsPlayerInRangeOfPlayer(i,WalkAttack3,WA3NOTICE) )	//if player is not enter notice range
			{
				FCNPC_StopAim(npcid);									// AI dont shot
			}
			else  //if ( IsPlayerInRangeOfPlayer(i,WalkAttack3,WA3NOTICE)//else This is moving randomly within its own range
			{
		       	if (WA3InBsSpawn == 0)  								//if ai in base spawn point
				{
					if (!IsPlayerInRangeOfPoint(npcid,WA3MOVERANGE,WA3xyz) )//If the AI runs out of the movable range
					{	FCNPC_GoTo(npcid, WA3xyz,FCNPC_MOVE_TYPE_SPRINT,FCNPC_MOVE_SPEED_SPRINT,true);}//Will move to the origin
					else
					{
						new Float:x, Float:y, Float:z;
						FCNPC_GetPosition(WalkAttack3, x, y, z);
						
					    if (IsPlayerNPC(i) == 0 && !IsPlayerInRangeOfPlayer(i,npcid,WA3NEAR) )  //If the player is not near the AI, the AI will move slowly
					    {
							switch( random(6) ) 
							{
								case 0:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x+13.7,y+3,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 1:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x+13.8,y,z,		FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 2:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x,y+13,z,		FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 3:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x,y-13.5,z,		FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 4:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x-13.7,y,z,		FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 5:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x-13.8,y-3.5,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
							}
						}
				    	else if (IsPlayerNPC(i) == 0 && IsPlayerInRangeOfPlayer(i,npcid,WA3NEAR) )  //If the player is near the AI, the AI will move fast
					    {
							switch( random(6) ) 
							{
								case 0:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x+13.7,y+1,z,	FCNPC_MOVE_TYPE_RUN,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 1:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x+13.8,y,z,		FCNPC_MOVE_TYPE_RUN,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 2:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x,y+13,z,		FCNPC_MOVE_TYPE_RUN,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 3:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x,y-13.5,z,		FCNPC_MOVE_TYPE_RUN,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 4:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x-13.7,y,z,		FCNPC_MOVE_TYPE_RUN,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 5:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x-13.8,y-1.5,z,	FCNPC_MOVE_TYPE_RUN,FCNPC_MOVE_SPEED_SPRINT,true);}
							}
						}
					}
				}
				else    					 //If it is currently respawned by another fixed point moved by the player /WA3COME
				{
					if (!IsPlayerInRangeOfPoint(npcid,WA3MOVERANGE,WA3posx[npcid],WA3posy[npcid],WA3posz[npcid]) )
					{	FCNPC_GoTo(npcid, WA3posx[npcid],WA3posy[npcid],WA3posz[npcid],FCNPC_MOVE_TYPE_SPRINT,FCNPC_MOVE_SPEED_SPRINT,true);}
					else 
					{
						new Float:x, Float:y, Float:z;
						FCNPC_GetPosition(npcid, x, y, z);
					    if (IsPlayerNPC(i) == 0 && !IsPlayerInRangeOfPlayer(i,npcid,WA3NEAR) )  //If the player is not near the AI, the AI will move slowly
					    {
							switch( random(6) ) 
							{
								case 0:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x+13.7,y+3,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 1:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x+13.8,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 2:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x,y+13,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 3:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x,y-13.5,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 4:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x-13.7,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 5:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x-13.8,y-3.5,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
							}
						}
				    	else if (IsPlayerNPC(i) == 0 && IsPlayerInRangeOfPlayer(i,npcid,WA3NEAR) )  //If the player is near the AI, the AI will move fast
					    {
							switch( random(6) )
							{
								case 0:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x+1.7,y+1,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 1:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x+1.8,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 2:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x,y+1,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 3:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x,y-1.5,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 4:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x-1.7,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 5:{if (!IsPlayerInRangeOfPoint(WalkAttack3,1, x+2,y,z))FCNPC_GoTo(WalkAttack3, x-1.8,y-1.5,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
							}
						}
					}
				}
			}
		}
		KillTimer(WA3timer);
		WA3timer=SetTimerEx("WA3Attack", WA3Shot, false, "i", npcid);//after move, will shoot
	}
}

forward WA3Attack(npcid,playerid);
public WA3Attack(npcid,playerid)
{
	if (npcid == WalkAttack3)
	{
		for(new i = 0; i < MAX_PLAYERS; i++)  
	    {
			if (IsPlayerInRangeOfPlayer(npcid,i,WA3NEAR) && WA3checkSpawned[i] == 1 && WA3set1 == 0 && AIteam[i] == PyJoinAiNO) //set0 if player in shoot range and no afk and no team
			{
			    if (WA3AFK[i] == 0) //if player is not AFK
				{
					new Float:px, Float: py, Float:pz;
					GetPlayerPos(i,px,py,pz);
					FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true); //attack_ai is shooting player
				}
				else if (WA3AFK[i] == 1)
				{
					FCNPC_StopAim(npcid);
				}
			}
			else if (IsPlayerInRangeOfPlayer(npcid,i,WA3NEAR) && WA3checkSpawned[i] == 1  && WA3set1 == 1 && AIteam[i] == PyJoinAiNO) //set1 if player in shoot range and no team
			{
				new Float:px, Float: py, Float:pz;
				GetPlayerPos(i,px,py,pz);
				FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
			}
			else if (IsPlayerInRangeOfPlayer(npcid,i,WA3NEAR2) && WA3checkSpawned[i] == 1  && WA3set1 == 2 && AIteam[i] == PyJoinAiNO) //set 2 test small range
			{
				new Float:px, Float: py, Float:pz;
				GetPlayerPos(i,px,py,pz);
				FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
			}
			else 
			{
	            KillTimer(WA3timer);
			    WA3timer=SetTimerEx("WA3Attack2", WA3Shot, false, "i", npcid);
			}
            KillTimer(WA3timer);
		    WA3timer=SetTimerEx("WA3Attack2", WA3Shot, false, "i", npcid);//after shoot , will shoot again
		}
    }
}

forward WA3Attack2(npcid,playerid);
public WA3Attack2(npcid,playerid)   //The logic of this character is to move once and attack twice, so the attack has a two times
{
	if (npcid == WalkAttack3)
	{
		for(new i = 0; i < MAX_PLAYERS; i++) 
	    {
			if (IsPlayerInRangeOfPlayer(npcid,i,WA3NEAR) && WA3checkSpawned[i] == 1  && WA3set1 == 0  && AIteam[i] == PyJoinAiNO)
			{
			    if (WA3AFK[i] == 0 )
				{
					new Float:px, Float: py, Float:pz;
					GetPlayerPos(i,px,py,pz);
					FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true); 
				}
				else if (WA3AFK[i] == 1)
				{
					FCNPC_StopAim(npcid);
				}
			}
			else if (IsPlayerInRangeOfPlayer(npcid,i,WA3NEAR) && WA3checkSpawned[i] == 1  && WA3set1 == 1 && AIteam[i] == PyJoinAiNO) 
			{
				new Float:px, Float: py, Float:pz;
				GetPlayerPos(i,px,py,pz);
				FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true); 
			}
			else if (IsPlayerInRangeOfPlayer(npcid,i,WA3NEAR2) && WA3checkSpawned[i] == 1  && WA3set1 == 2 && AIteam[i] == PyJoinAiNO)
			{
				new Float:px, Float: py, Float:pz;
				GetPlayerPos(i,px,py,pz);
				FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
			}
			else 
			{
	            KillTimer(WA3timer);
			    WA3timer=SetTimerEx("WA3Attack2", WA3Shot, false, "i", npcid);
			}
            KillTimer(WA3timer);
		    WA3timer=SetTimerEx("WA3Move", WA3Shot, false, "i", npcid);//after shoot, will move
		}
    }
}
forward StoneWA3Time(npcid);
public StoneWA3Time(npcid)	
{
    if (npcid == WalkAttack3)
    {
		KillTimer(WA3timer);
	    FCNPC_StopAim(npcid);FCNPC_Stop(npcid);
	    Update3DTextLabelText(WA3Label2, WA3IsMabiColor, WA3nameStatus2); //Refresh the head status and change the status 2 paralysis
	    SetTimerEx("StoneWA3TimeEnd", StoneWA3TIME, false, "i", npcid);   
	    SetTimerEx("ReSetStoneWA3Time", RstStoneWA3Time, false, "i", npcid);
	}
}
forward StoneWA3TimeEnd(npcid);
public StoneWA3TimeEnd(npcid) 
{
	if (WA3ragemode != 0 )
	{		Update3DTextLabelText(WA3Label2, WA3IsRageColor, WA3nameStatus); }//Refresh the head status and change the status 1
	else {	Update3DTextLabelText(WA3Label2, WA3NameLabel,   WA3nameStatus); } //if ai is rage mode ,Refresh the head status and change the status 1
    if (npcid == WalkAttack3){WA3timer=SetTimerEx("WA3Move", WA3MOVETimer, true, "i", npcid);}  //rerun move timer
}
forward ReSetStoneWA3Time(npcid);
public ReSetStoneWA3Time(npcid)	
{
    WA3IsMabi[npcid] = 0; //can paralysis again
}
forward SetWA3Spawn(npcid);
public SetWA3Spawn(npcid)
{
	if(npcid == WalkAttack3) {
		if(!FCNPC_IsSpawned(npcid))
		{
			if (WA3InBsSpawn != 0)	FCNPC_Spawn(npcid, WA3skin,WA3posx[npcid],WA3posy[npcid],WA3posz[npcid]);
        	else FCNPC_Spawn(npcid, WA3skin,WA3xyz);
		}
		else
		{
			if(FCNPC_IsDead(npcid)) {FCNPC_Respawn(npcid);}
            if (WA3InBsSpawn != 0)	FCNPC_SetPosition(npcid, WA3posx[npcid],WA3posy[npcid],WA3posz[npcid]);
			else FCNPC_SetPosition(npcid, WA3xyz);
		}
		FCNPC_SetAngle(npcid,WA3facing);
	    FCNPC_SetHealth(npcid, WA3MAXHP);FCNPC_SetInterior(npcid, WA3InteriorID);
		FCNPC_SetWeapon(npcid, SetWA3wepon);
		FCNPC_SetWeaponInfo(npcid, SetWA3wepon , WA3Load, WA3Shot, 7, WA3AIM);
		FCNPC_UseInfiniteAmmo(npcid, true);
		Update3DTextLabelText(WA3Label, WA3HPFull, WA3HP1);
		if (WA3ragemode == 0) SetPlayerColor(WalkAttack3,COLOR_WHITE);
		else SetPlayerColor(WalkAttack3,COLOR_BRIGHTRED);
	}
    return 1;
}

forward WA3AFKCheck(playerid);
public WA3AFKCheck(playerid)
{
 	if( IsPlayerNPC(playerid) == 0 )
	{
	    GetPlayerPos(playerid,WA3CheckPlayerIsAfk[0],WA3CheckPlayerIsAfk[1],WA3CheckPlayerIsAfk[2]);
	}
	KillTimer(WA3AFKTime);
	WA3AFKTime = SetTimerEx("WA3AFKCheck2", 1000, false, "i", playerid);

	return 1;
}
forward WA3AFKCheck2(playerid);
public WA3AFKCheck2(playerid)
{
 	if( IsPlayerNPC(playerid) == 0 )
	{
	    if(IsPlayerInRangeOfPoint(playerid,1,WA3CheckPlayerIsAfk[0],WA3CheckPlayerIsAfk[1],WA3CheckPlayerIsAfk[2])) // If player is around the position (if player is at the same place)
	    {
	       WA3AFK[playerid] = 1;
 		}
	    else
	    {
	       WA3AFK[playerid]= 0;
		}
	}
	KillTimer(WA3AFKTime);
	WA3AFKTime = SetTimerEx("WA3AFKCheck", 1000, false, "i", playerid);
	return 1;
}

