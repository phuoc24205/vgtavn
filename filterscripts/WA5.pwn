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
	Search for : WA5
	Replace with : you want change a name
	
	Search for : WalkAttack5
	Replace with : you want change a name
*/
//WA5***************************************************************************
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BRIGHTRED 0xFF0000AA

#define pWA5PlayerSP -2264.6599, 2308.4172, 4.8202 , 182.3148
#define WA5InteriorID 0                
#define WA5facing 2.4598
#define WA5xyz	 -2262.6387,2284.1160,4.8202  //ai pos
#define WA5pickupXYZ -2280.1, 2297.4, 4.9 //note pickup
new WA5timer=-1;  
new ReWA5timer=-1;
new StoneWA5timer=-1;
new WA5IsMabi[MAX_PLAYERS]=0; 		//Paralyzed variables, as switches
new WalkAttack5;        			//AI name in .pwn file
new WA5ragemodeBeforeShot = 0;      // Save the speed before the transformation, to cancel the transformation
new WA5ragemodeAfterShot = 150 ;    // The rate of fire after the transformation is scheduled to be 150
new WA5ragemode=0;					// The variables of the transformation mode,as switches
new WA5ragemodeOffcounter=0;		// The variables of the transformation mode,as counter
#define WA5ragemodeOffcounterMAX 2 	// The total number of players defeated, In order to lift the transformation
#define WA5skin 310  				// skin
new SetWA5wepon = 24; 				// weapon
new WA5MOVETimer = 400 ;   			// perform a move in a few seconds
#define WA5NOTICE 50  				// Warning range
#define WA5NEAR 30    				// shoot range
#define WA5NEAR2 20					// shoot range, just test
#define WA5MOVERANGE 8 				// If the preset moving range exceeds, it will return
#define StoneWA5TIME 500  			// Paralyzed time
#define RstStoneWA5Time 3000		// dont Paralyzed again 3second
#define WA5MAXHP 322
new WA5Load = 150 ;    				// set weapon info
new WA5Shot = 250 ;     			// 
new Float:WA5AIM =    1.0 ,			// 
	WA5Shotmin =      150 ,         
	WA5Shotmax =      750 ;         
new Float:WA5posx[MAX_PLAYERS],
	Float:WA5posy[MAX_PLAYERS],
	Float:WA5posz[MAX_PLAYERS];    
new WA5InBsSpawn = 0;				//is base spawn point
new Text3D:WA5Label,Text3D:WA5Label2,WA5pickup; 
#define WA5nameStatus "WA5[copld]" 	//AI head display status 1 name
#define WA5nameStatus2 "[IsMabi]" 	//status 2 is paralyzed
#define WA5NameLabel -1 			//status 1 color  white
#define WA5IsRageColor 0xFF0000FF	//status 1 transformation mode color bright red
#define WA5IsMabiColor 0xDABB3EFF  	//status 2 color YELLOW
#define WA5HPFull 0x9EC73DFF  		//AI displays HP GREEN above the head
#define WA5HPSome 0xFF9900FF  		// ORANGE
#define WA5HPLow 0xAA3333FF  		// RED
#define WA5HP1 "OOOOOOO"
#define WA5HP2 "OOOOOO-"
#define WA5HP3 "OOOOO--"
#define WA5HP4 "OOOO---"
#define WA5HP5 "OOO----"
#define WA5HP6 "OO-----"
#define WA5HP7 "O------"
#define WA5HP8 "-------"
new WA5AFK[MAX_PLAYERS];			//check player is afk
new WA5AFKTime = -1;			
new WA5checkSpawned[MAX_PLAYERS];	//check player is alive
new Float:WA5CheckPlayerIsAfk[3];

new WA5set1 = 1;					//AI mode ,example only hit player, or only hit AI

#define PyJoinAiNO 0			//check Ai is team
#define PyJoinAiYES 1
new AIteam[MAX_PLAYERS] = PyJoinAiNO;

public OnFilterScriptInit()
{
	WalkAttack5 = FCNPC_Create(WA5nameStatus);
	SetWA5Spawn(WalkAttack5);
	FCNPC_Spawn(WalkAttack5, WA5skin,WA5xyz);
	WA5Label = Create3DTextLabel(WA5HP1, WA5HPFull, 0.0, 0.0, 0.0, 30.0, 0, 1);
	Attach3DTextLabelToPlayer(WA5Label, WalkAttack5, 0.0, 0.0, 0.1); //0.5 -2.3
	WA5Label2 = Create3DTextLabel(WA5nameStatus, WA5NameLabel, 0.0, 0.0, 0.0, 30.0, 0, 1);
	Attach3DTextLabelToPlayer(WA5Label2, WalkAttack5, 0.0, 0.0, 0.45);
	WA5pickup =  CreatePickup(1239, 2, WA5pickupXYZ,-1);
	
	return 1;
}
public OnFilterScriptExit()
{
	KillTimer(ReWA5timer);
	KillTimer(WA5timer);
	KillTimer(StoneWA5timer);
	FCNPC_Destroy(WalkAttack5);
	Delete3DTextLabel(WA5Label);
	Delete3DTextLabel(WA5Label2);
	DestroyPickup(WA5pickup);
	
	KillTimer(WA5AFKTime);
	
	return 1;
}
public OnPlayerConnect(playerid)
{

	SetPlayerColor(WalkAttack5,-1);
	WA5checkSpawned[playerid]=0;
	
	return 1;
}
public OnPlayerSpawn(playerid)
{
	WA5checkSpawned[playerid]=1;
	WA5AFK[playerid]=0;
	WA5AFKTime = SetTimerEx("WA5AFKCheck",1000,false, "d", playerid);	
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
    if (killerid == WalkAttack5)
    {
  		new Float:WA5HP;
  		WA5HP = FCNPC_GetHealth(WalkAttack5);
        if (WA5ragemode == 0)                           
        {
            FCNPC_SetHealth(WalkAttack5, FCNPC_GetHealth(WalkAttack5)+138 );    //+138 HP
            if (WA5HP > WA5MAXHP)FCNPC_SetHealth(WalkAttack5, 322);            
	        WA5HPUpdata(WalkAttack5);                   
		}
        else
        {
 			FCNPC_SetHealth(WalkAttack5, 322);          
 			if (WA5ragemodeOffcounter > WA5ragemodeOffcounterMAX )  
		 	{
				SendClientMessage(playerid, -1,"copld: {FF0000}rage mode off");
				WA5ragemodeOffcounter=0;                
				WA5ragemode = 0;                        

				SetPlayerColor(WalkAttack5,WA5NameLabel);
				Update3DTextLabelText(WA5Label2, WA5NameLabel, WA5nameStatus);
				WA5Shot = WA5ragemodeBeforeShot ;     
				FCNPC_Respawn(WalkAttack5);
				
				KillTimer(WA5timer);                    
				KillTimer(ReWA5timer);
				WA5timer=SetTimerEx("WA5Move", WA5Shot, true, "i", WalkAttack5);
		 	}
 			else
			{
				WA5ragemodeOffcounter++;           
			}
 			Update3DTextLabelText(WA5Label, WA5HPFull, WA5HP1); 
		}
		if (WA5set1 != 2)WA5checkSpawned[playerid]=0;
		else    WA5checkSpawned[playerid]=1;
		
		KillTimer(WA5AFKTime);
	}

	return 1;
}
public FCNPC_OnSpawn(npcid)
{
	if (npcid == WalkAttack5)						
	{
		KillTimer(ReWA5timer);
		WA5timer=SetTimerEx("WA5Move", WA5MOVETimer, true, "i", npcid);
	}
	
	return 1;
}
public FCNPC_OnDeath(npcid, killerid, reason)
{
    if (npcid == WalkAttack5)
    {	ReWA5timer = SetTimerEx("SetWA5Spawn", 2500 , false, "d", npcid);

		if(WA5ragemode == 0 )
		Update3DTextLabelText(WA5Label, WA5HPLow, WA5HP8);
		else
		{	Update3DTextLabelText(WA5Label, WA5HPLow, WA5HP8);
		    WA5ragemodeOffcounter = 0;
		}
		WA5checkSpawned[killerid]=1;
	}
	
	return 1;
}
public FCNPC_OnTakeDamage(npcid, issuerid, Float:amount, weaponid, bodypart)
{
	if (npcid == WalkAttack5)
	{
		if ((weaponid == 24 || weaponid == 25|| weaponid == 34)&& FCNPC_IsSpawned(npcid))
  		{
		   	if (WA5IsMabi[npcid]==0 )
  		    {
                WA5IsMabi[npcid]=1; 
                StoneWA5timer =  SetTimerEx("StoneWA5Time", 100 , false, "d", npcid);
			}
		}
		FCNPC_GetHealth(WalkAttack5);
		WA5HPUpdata(npcid); 
	}

	
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
//WA5***************************************************************************
   	if(strcmp("/wa5", cmdtext, true) == 0)
	{
		SetPlayerPosFacing(playerid,pWA5PlayerSP );
		SetPlayerInterior(playerid,0);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
	if(strcmp("/WA5shot", cmdtext, true) == 0)
	{
	    WA5Shot=WA5Shot-100;
	    if (WA5Shot <= WA5Shotmin) WA5Shot = WA5Shotmax;

		new string[128];
		format(string, sizeof(string), " AI speed -0.1 now: %d", WA5Shot);
		SendClientMessage(playerid, -1,string);
		return 1;
	}
	if(strcmp("/WA5come", cmdtext, true) == 0) 
	{
	    WA5InBsSpawn = 1 ;
		GetPlayerPos(playerid, WA5posx[WalkAttack5],WA5posy[WalkAttack5],WA5posz[WalkAttack5]);
        FCNPC_SetPosition(WalkAttack5, WA5posx[WalkAttack5]+1.5,WA5posy[WalkAttack5],WA5posz[WalkAttack5]);

		return 1;
	}
	if(strcmp("/WA5def", cmdtext, true) == 0)
	{
		FCNPC_SetPosition(WalkAttack5, WA5xyz);
	    FCNPC_Stop(WalkAttack5);
		FCNPC_StopAim(WalkAttack5);
		KillTimer(ReWA5timer);
		KillTimer(WA5timer);
		KillTimer(StoneWA5timer);
	    SetWA5wepon = 24;
		WA5Shot = 250 ;
		WA5AIM = 0.1 ;
		WA5set1 = 1;
		FCNPC_Respawn(WalkAttack5);
		new string[128];
		format(string, sizeof(string), "speed: %d", WA5Shot);
		SendClientMessage(playerid, -1,string);
		WA5ragemode=0;
		WA5InBsSpawn = 0;
		return 1;
	}
	if(strcmp("/WA5set2", cmdtext, true) == 0)
	{
	    WA5set1 = 2;
   	    AIteam[WalkAttack5] = PyJoinAiNO ;
	    SendClientMessage(playerid, -1,"AI set 2 ,range is 15 , can fight with anothe AI");return 1;
	}
	if(strcmp("/WA5set1", cmdtext, true) == 0)
	{
	    WA5set1 = 1;
   	    AIteam[WalkAttack5] = PyJoinAiYES ;
	    SendClientMessage(playerid, -1,"AI set 1 if another AI is set1 too ,will dont fight with anothe AI");return 1;
	}
	if(strcmp("/WA5set0", cmdtext, true) == 0)
	{
	    WA5set1 = 0;
   	    AIteam[WalkAttack5] = PyJoinAiNO ;
	    SendClientMessage(playerid, -1,"AI set 0 if player is AFK, dont shoot afk player)");return 1;
	}
	if(strcmp("/WA5rage", cmdtext, true) == 0)
	{
   		if (WA5ragemode == 0)                       
		{
			WA5ragemode = 1;                      
			SendClientMessage(playerid, -1,"{FFFFFF}copld: {FF0000} rage mode on");
			SendClientMessage(playerid, -1,"{FFFFFF}[]1.speed up , kill player will heal all health. ");
			SetPlayerColor(WalkAttack5,WA5IsRageColor);
			Update3DTextLabelText(WA5Label2, WA5IsRageColor, WA5nameStatus);
			WA5ragemodeBeforeShot = WA5Shot;        
			WA5Shot = WA5ragemodeAfterShot;         

			KillTimer(WA5timer);                   
			KillTimer(ReWA5timer);
			WA5timer=SetTimerEx("WA5Move", WA5Shot, true, "i", WalkAttack5);
			FCNPC_Respawn(WalkAttack5);           
		}
 		else                       				
		{
			WA5ragemode = 0;                       
			SendClientMessage(playerid, -1,"copld: ragemode off");
			SetPlayerColor(WalkAttack5,WA5NameLabel);  
			Update3DTextLabelText(WA5Label2, WA5NameLabel, WA5nameStatus);
			WA5Shot = WA5ragemodeBeforeShot;        
			FCNPC_Respawn(WalkAttack5);            
			
			KillTimer(WA5timer);                   
			KillTimer(ReWA5timer);
			WA5timer=SetTimerEx("WA5Move", WA5Shot, true, "i", WalkAttack5);
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
    if(pickupid == WA5pickup)
    {
		SendClientMessage(playerid, -1,"/WA5def¡@/WA5shot¡@speed-100¡@/wa5come change AI spawn point");
		new str[128]; format(str, sizeof(str), "now Rate of fire:0.%d sec",WA5Shot);
		SendClientMessage(playerid, -1,str);
		SendClientMessage(playerid, -1,"/WA5def¡@Parameter initialization¡@/WA5shot¡@type once, rate of fire -100 ms");
		SendClientMessage(playerid, -1,"/WA5set0 /WA5set1¡@/WA5set2¡@{FF0000}/WA5rage Watch out!");
		SendClientMessage(playerid, -1,"WA5 is able to aim and hit the player's Position");
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
//WA5***************************************************************************
stock WA5HPUpdata(npcid)
{
	new Float: WA5HP = FCNPC_GetHealth(npcid);
	if ( WA5HP >= 276) Update3DTextLabelText(WA5Label, WA5HPFull, WA5HP2);
	else if (276 > WA5HP >= 230) Update3DTextLabelText(WA5Label, WA5HPFull, WA5HP3);
	else if (230 > WA5HP >= 184) Update3DTextLabelText(WA5Label, WA5HPSome, WA5HP4);
	else if (184 > WA5HP >= 138) Update3DTextLabelText(WA5Label, WA5HPSome, WA5HP5);
	else if (138 > WA5HP >= 92) Update3DTextLabelText(WA5Label, WA5HPLow, WA5HP6);
	else Update3DTextLabelText(WA5Label, WA5HPLow, WA5HP7);
}

forward WA5Move(npcid,playerid);
public WA5Move(npcid,playerid) 
{
	if (npcid == WalkAttack5)
	{
		for(new i = 0; i < MAX_PLAYERS; i++) 
		{
		    if (!IsPlayerInRangeOfPlayer(i,WalkAttack5,WA5NOTICE) )	
			{
				FCNPC_StopAim(npcid);								
			}
			else
			{
		       	if (WA5InBsSpawn == 0)  								
				{
					if (!IsPlayerInRangeOfPoint(npcid,WA5MOVERANGE,WA5xyz) )
					{	FCNPC_GoTo(npcid, WA5xyz,FCNPC_MOVE_TYPE_SPRINT,FCNPC_MOVE_SPEED_SPRINT,true);}
					else
					{
						new Float:x, Float:y, Float:z;
						FCNPC_GetPosition(WalkAttack5, x, y, z);

					    if (IsPlayerNPC(i) == 0 && !IsPlayerInRangeOfPlayer(i,npcid,WA5NEAR) )
					    {
							switch( random(6) ) 
							{
								case 0:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x+13.7,y+3,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 1:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x+13.8,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 2:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x,y+13,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 3:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x,y-13.5,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 4:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x-13.7,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 5:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x-13.8,y-3.5,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
							}
						}
				    	else if (IsPlayerNPC(i) == 0 && IsPlayerInRangeOfPlayer(i,npcid,WA5NEAR) )  
					    {
							switch( random(6) ) 
							{
								case 0:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x+1.7,y+1,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 1:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x+1.8,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 2:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x,y+1,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 3:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x,y-1.5,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 4:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x-1.7,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 5:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x-1.8,y-1.5,z,FCNPC_MOVE_TYPE_RUN,FCNPC_MOVE_SPEED_SPRINT,true);}
							}
						}
					}
				}
				else    											
				{
					if (!IsPlayerInRangeOfPoint(npcid,WA5MOVERANGE,WA5posx[npcid],WA5posy[npcid],WA5posz[npcid]) ) 
					{	FCNPC_GoTo(npcid, WA5posx[npcid],WA5posy[npcid],WA5posz[npcid],FCNPC_MOVE_TYPE_SPRINT,FCNPC_MOVE_SPEED_SPRINT,true);}
					else 
					{
						new Float:x, Float:y, Float:z;
						FCNPC_GetPosition(npcid, x, y, z);
					    if (IsPlayerNPC(i) == 0 && !IsPlayerInRangeOfPlayer(i,npcid,WA5NEAR) )
					    {
							switch( random(6) ) 
							{
								case 0:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x+13.7,y+3,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 1:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x+13.8,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 2:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x,y+13,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 3:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x,y-13.5,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 4:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x-13.7,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
								case 5:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x-13.8,y-3.5,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_WALK,true);}
							}
						}
				    	else if (IsPlayerNPC(i) == 0 && IsPlayerInRangeOfPlayer(i,npcid,WA5NEAR) )  
					    {
							switch( random(6) ) 
							{
								case 0:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x+1.7,y+1,z,FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 1:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x+1.8,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 2:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x,y+1,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 3:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x,y-1.5,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 4:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x-1.7,y,z,	FCNPC_MOVE_TYPE_WALK,FCNPC_MOVE_SPEED_SPRINT,true);}
								case 5:{if (!IsPlayerInRangeOfPoint(WalkAttack5,1, x+2,y,z))FCNPC_GoTo(WalkAttack5, x-1.8,y-1.5,z,FCNPC_MOVE_TYPE_RUN,FCNPC_MOVE_SPEED_SPRINT,true);}
							}
						}
					}
				}
			}
		}
		KillTimer(WA5timer);
		WA5timer=SetTimerEx("WA5Attack", WA5Shot, false, "i", npcid);
	}
}
forward WA5Attack(npcid,playerid);
public WA5Attack(npcid,playerid) 
{
	if (npcid == WalkAttack5)
	{
		for(new i = 0; i < MAX_PLAYERS; i++) 
	    {
			if (IsPlayerInRangeOfPlayer(npcid,i,WA5NEAR) && WA5checkSpawned[i] == 1 && WA5set1 == 0 && AIteam[i] == PyJoinAiNO) 
			{
			    if (WA5AFK[i] == 0)
				{
					new Float:px, Float: py, Float:pz;
					GetPlayerPos(i,px,py,pz);
					FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true); 
				}
				else if (WA5AFK[i] == 1)
				{
					FCNPC_StopAim(npcid);
				}
			}
			else if (IsPlayerInRangeOfPlayer(npcid,i,WA5NEAR) && WA5checkSpawned[i] == 1  && WA5set1 == 1 && AIteam[i] == PyJoinAiNO) 
			{
				new Float:px, Float: py, Float:pz;
				GetPlayerPos(i,px,py,pz);
				FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
			}
			else if (IsPlayerInRangeOfPlayer(npcid,i,WA5NEAR2) && WA5checkSpawned[i] == 1  && WA5set1 == 2 && AIteam[i] == PyJoinAiNO)
			{
				new Float:px, Float: py, Float:pz;
				GetPlayerPos(i,px,py,pz);
				FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
			}
			else 
			{
	            KillTimer(WA5timer);
			    WA5timer=SetTimerEx("WA5Attack2", WA5Shot, false, "i", npcid);
			}
            KillTimer(WA5timer);
		    WA5timer=SetTimerEx("WA5Attack2", WA5Shot, false, "i", npcid);
		}
    }
}
forward WA5Attack2(npcid,playerid);
public WA5Attack2(npcid,playerid) 
{
	if (npcid == WalkAttack5)
	{
		for(new i = 0; i < MAX_PLAYERS; i++)  
	    {
			if (IsPlayerInRangeOfPlayer(npcid,i,WA5NEAR) && WA5checkSpawned[i] == 1  && WA5set1 == 0  && AIteam[i] == PyJoinAiNO)
			{
			    if (WA5AFK[i] == 0 )
				{
					new Float:px, Float: py, Float:pz;
					GetPlayerPos(i,px,py,pz);
					FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
				}
				else if (WA5AFK[i] == 1)
				{
					FCNPC_StopAim(npcid);
				}
			}
			else if (IsPlayerInRangeOfPlayer(npcid,i,WA5NEAR) && WA5checkSpawned[i] == 1  && WA5set1 == 1 && AIteam[i] == PyJoinAiNO) 
			{
				new Float:px, Float: py, Float:pz;
				GetPlayerPos(i,px,py,pz);
				FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
			}
			else if (IsPlayerInRangeOfPlayer(npcid,i,WA5NEAR2) && WA5checkSpawned[i] == 1  && WA5set1 == 2 && AIteam[i] == PyJoinAiNO)
			{
				new Float:px, Float: py, Float:pz;
				GetPlayerPos(i,px,py,pz);
				FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
			}
			else
			{
	            KillTimer(WA5timer);
			    WA5timer=SetTimerEx("WA5Attack2", WA5Shot, false, "i", npcid);
			}
            KillTimer(WA5timer);
		    WA5timer=SetTimerEx("WA5Move", WA5Shot, false, "i", npcid);
		}
    }
}

forward StoneWA5Time(npcid);
public StoneWA5Time(npcid)	
{
    if (npcid == WalkAttack5)
    {
		KillTimer(WA5timer);
	    FCNPC_StopAim(npcid);FCNPC_Stop(npcid); 
	    Update3DTextLabelText(WA5Label2, WA5IsMabiColor, WA5nameStatus2); 
	    SetTimerEx("StoneWA5TimeEnd", StoneWA5TIME, false, "i", npcid);   
	    SetTimerEx("ReSetStoneWA5Time", RstStoneWA5Time, false, "i", npcid);
	}
}
forward StoneWA5TimeEnd(npcid);
public StoneWA5TimeEnd(npcid) 
{
	if (WA5ragemode != 0 )
	{		Update3DTextLabelText(WA5Label2, WA5IsRageColor, WA5nameStatus); }
	else {	Update3DTextLabelText(WA5Label2, WA5NameLabel,   WA5nameStatus); } 
    if (npcid == WalkAttack5){WA5timer=SetTimerEx("WA5Move", WA5MOVETimer, true, "i", npcid);} 
}
forward ReSetStoneWA5Time(npcid);
public ReSetStoneWA5Time(npcid)
{
    WA5IsMabi[npcid] = 0; 
}
forward SetWA5Spawn(npcid);
public SetWA5Spawn(npcid)
{
	if(npcid == WalkAttack5) {
		if(!FCNPC_IsSpawned(npcid))
		{
			if (WA5InBsSpawn != 0)	FCNPC_Spawn(npcid, WA5skin,WA5posx[npcid],WA5posy[npcid],WA5posz[npcid]);
        	else FCNPC_Spawn(npcid, WA5skin,WA5xyz);
		}
		else
		{
			if(FCNPC_IsDead(npcid)) {FCNPC_Respawn(npcid);}//FCNPC_SetSkin(npcid, WA5skin);
            if (WA5InBsSpawn != 0)	FCNPC_SetPosition(npcid, WA5posx[npcid],WA5posy[npcid],WA5posz[npcid]);
			else FCNPC_SetPosition(npcid, WA5xyz);
		}
		FCNPC_SetAngle(npcid,WA5facing);
	    FCNPC_SetHealth(npcid, WA5MAXHP);FCNPC_SetInterior(npcid, WA5InteriorID);
		FCNPC_SetWeapon(npcid, SetWA5wepon);
		FCNPC_SetWeaponInfo(npcid, SetWA5wepon , WA5Load, WA5Shot, 7, WA5AIM);
		FCNPC_UseInfiniteAmmo(npcid, true);
		Update3DTextLabelText(WA5Label, WA5HPFull, WA5HP1);
		if (WA5ragemode == 0) SetPlayerColor(WalkAttack5,COLOR_WHITE);
		else SetPlayerColor(WalkAttack5,COLOR_BRIGHTRED);
	}
    return 1;
}

forward WA5AFKCheck(playerid);
public WA5AFKCheck(playerid)
{
 	if( IsPlayerNPC(playerid) == 0 )
	{
	    GetPlayerPos(playerid,WA5CheckPlayerIsAfk[0],WA5CheckPlayerIsAfk[1],WA5CheckPlayerIsAfk[2]);
	}
	KillTimer(WA5AFKTime);
	WA5AFKTime = SetTimerEx("WA5AFKCheck2", 1000, false, "i", playerid);

	return 1;
}
forward WA5AFKCheck2(playerid);
public WA5AFKCheck2(playerid)
{

 	if( IsPlayerNPC(playerid) == 0 )
	{
	    if(IsPlayerInRangeOfPoint(playerid,1,WA5CheckPlayerIsAfk[0],WA5CheckPlayerIsAfk[1],WA5CheckPlayerIsAfk[2])) // If player is around the position (if player is at the same place)
	    {
	       WA5AFK[playerid] = 1;
 		}
	    else
	    {
	       WA5AFK[playerid]= 0;
		}
	}
	KillTimer(WA5AFKTime);
	WA5AFKTime = SetTimerEx("WA5AFKCheck", 1000, false, "i", playerid);
	return 1;
}

