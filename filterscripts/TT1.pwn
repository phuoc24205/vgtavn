#include <a_samp>
#include <FCNPC>
#include <streamer>
//TT1***************************************************************************
#define pTT1xyzf -2357.2, 2334.0 , 4.9  , 175.6
#define TT1pickupXYZ  -2359.3, 2330.3, 4.9  
#define TT1xyz   -2371.4, 2283.3 , -0.5+0.5    
#define TT1facing  5.1
#define TT1InteriorID 0        
new TT1dtimer=-1;
new TTDriver1;                      //AI name in this .pwn file
#define TT1dSkin 122                //skin
new TT1MOVETimer = 1000;
#define TT1GotoBack 50 				
#define TT1NOTICE 200  				
#define TT1NEAR 100  				

#define TT1MAXHP 1000

new Text3D:TT1DriverHPdisplay3DLabel,
	Text3D:TT1DriverName3DLabel,
	TT1pickup;

#define TT1DriverName "TT1" 		
#define TT1DriverNameColor -1 	

#define TT1HPFull 0x9EC73DFF  		
#define TT1HPSome 0xFF9900FF  		
#define TT1HPLow 0xAA3333FF  	
#define TT1HP1 "OOOOO"
#define TT1HP2 "OOOO-"
#define TT1HP3 "OOO--"
#define TT1HP4 "OO---"
#define TT1HP5 "O----"
#define TT1HP8 "-----"

new TT1AFK[MAX_PLAYERS];
new TT1AFKTime = -1 ;
new TT1checkSpawned[MAX_PLAYERS];
new Float:TT1CheckPlayerIsAfk[3];

new TT1StartMove[MAX_PLAYERS] = 0;

new TT1CAR;				
new TT1CARid = 485 ;      
new TT1CARid2 = 454 ;
new TT1CARid3 =  473;
new TT1CARid4 =  512;
new TT1CARid5 =  513;
new TT1CARid6 =  519;
new TT1CARid7 =  520;
#define TT1SPEED 1*2
#define FCNPCPATH FCNPC_MOVE_PATHFINDING_AUTO
new Tortoise1609;
new TT1RockIsShoot[MAX_PLAYERS] = 0;
new Tortoise1609SkillFireEffect;
new Tortoise1609SkillRock;
new Tortoise1609SkillRockClearTimer = -1;


new PlayerText:TT1DigiHP[MAX_PLAYERS];//DHA

public OnFilterScriptInit()
{
//TT1***************************************************************************
	TTDriver1 = FCNPC_Create(TT1DriverName);
	TT1DriverName3DLabel = Create3DTextLabel(TT1DriverName, TT1DriverNameColor, 0.0, 0.0, 0.0, TT1NOTICE/3, 0, 1);
	Attach3DTextLabelToPlayer(TT1DriverName3DLabel, TTDriver1, 0.0, 0.0, 0.45);

	TT1DriverHPdisplay3DLabel = Create3DTextLabel(TT1HP1, TT1HPFull, 0.0, 0.0, 0.0, TT1NOTICE/3, 0, 1);
	Attach3DTextLabelToPlayer(TT1DriverHPdisplay3DLabel, TTDriver1, 0.0, 0.0, 0.1); //0.5 -2.3

	SetTT1dSpawn(TTDriver1);


	TT1pickup =  CreatePickup(1239, 2, TT1pickupXYZ,-1);

	TT1CAR = CreateVehicle(TT1CARid,TT1xyz,  TT1facing, -1, -1, 0);
    SetVehiclePos(TT1CARid,TT1xyz);
    LinkVehicleToInterior(TT1CAR, 1);
	FCNPC_PutInVehicle(TTDriver1, TT1CAR, 0);

	Tortoise1609 = CreateDynamicObject(1609, TT1xyz, 0, 0.0, 0.0 );
    AttachDynamicObjectToVehicle(Tortoise1609, TT1CAR, 0.0, 0.0+0.5, 0.0-0.1, 00.0, 0.0, 0.0);

    Tortoise1609SkillRock = CreateDynamicObject(2936, 0,0,0,0, 0.0, 0.0 );

    Tortoise1609SkillFireEffect = CreateDynamicObject(18689, 0,0,0,0, 0.0, 0.0 );
	
	SetTimer("TT1ShowdigiHP",1000,true);//digi hp ar
	return 1;
}
public OnFilterScriptExit()
{
//TT1***************************************************************************
	FCNPC_Stop(TTDriver1);

	KillTimer(TT1dtimer);
	FCNPC_Destroy(TTDriver1);

	Delete3DTextLabel(TT1DriverName3DLabel);
	Delete3DTextLabel(TT1DriverHPdisplay3DLabel);

	DestroyPickup(TT1pickup);
	DestroyVehicle(TT1CAR);
    DestroyDynamicObject(Tortoise1609);

    DestroyDynamicObject(Tortoise1609SkillFireEffect);
    DestroyDynamicObject(Tortoise1609SkillRock);
    KillTimer(Tortoise1609SkillRockClearTimer);
	KillTimer(TT1AFKTime);

 	for(new i; i<GetMaxPlayers(); i++)
	{
		if(IsPlayerConnected(i))
		{
			PlayerTextDrawDestroy(i,TT1DigiHP[i]);
		}
	}//DHA
	
	return 1;
}
public OnPlayerConnect(playerid)
{
//TT1***************************************************************************
	TT1checkSpawned[playerid]=0;
	SetPlayerColor(TTDriver1,0xFFFFFFFF);

	TT1DigiHP[playerid] = CreatePlayerTextDraw(playerid,325.000000, 0.000000, "1000");
	PlayerTextDrawBackgroundColor(playerid,TT1DigiHP[playerid], 255);
	PlayerTextDrawFont(playerid,TT1DigiHP[playerid], 1);
	PlayerTextDrawTextSize(playerid,TT1DigiHP[playerid], 2.0, 3.6);
	PlayerTextDrawLetterSize(playerid,TT1DigiHP[playerid], 0.54, 2.16);
	PlayerTextDrawAlignment(playerid,TT1DigiHP[playerid], 2 );
	PlayerTextDrawColor(playerid,TT1DigiHP[playerid], 0xFFFFFFFF);
	PlayerTextDrawSetOutline(playerid,TT1DigiHP[playerid], 1);
	PlayerTextDrawSetProportional(playerid,TT1DigiHP[playerid], 1);
	
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{   
	PlayerTextDrawDestroy(playerid,TT1DigiHP[playerid]);
	return 1;
}

public OnPlayerSpawn(playerid)
{
//TT1***************************************************************************
	TT1checkSpawned[playerid]=1;
	TT1AFK[playerid]=0;
	TT1AFKTime = SetTimerEx("TT1AFKCheck", 1000, false, "i", playerid);
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
//TT1***************************************************************************
	KillTimer(TT1AFKTime);
	
	return 1;
}

public FCNPC_OnSpawn(npcid)
{
//TT1***************************************************************************
	return 1;
}
public FCNPC_OnTakeDamage(npcid, issuerid, Float:amount, weaponid, bodypart)
{
//TT1***************************************************************************
	if (npcid == TTDriver1)
	{
	    if (TT1StartMove[TTDriver1] == 0)
		{
		    TT1StartMove[TTDriver1] = 1;
			TT1dtimer = SetTimerEx("TT1Move", TT1MOVETimer, true, "i", npcid); 
			TT1HPUpdata(npcid);
		}
	    else TT1HPUpdata(npcid);
	}
	return 1;
}

new TT1LastAttackName[MAX_PLAYER_NAME];
new TT1LastAttackID;
stock GetPlayerIdFromName(playername[])
{
  for(new i = 0; i <= MAX_PLAYERS; i++)
  {
    if(IsPlayerConnected(i))
    {
      new playername2[MAX_PLAYER_NAME];
      GetPlayerName(i, playername2, sizeof(playername2));
      if(strcmp(playername2, playername, true, strlen(playername)) == 0)
      {
        return i;
      }
    }
  }
  return INVALID_PLAYER_ID;
}

public FCNPC_OnDeath(npcid, killerid, reason)
{
//TT1***************************************************************************
    if (npcid == TTDriver1)
	{
		KillTimer(TT1dtimer);
		TT1dtimer = SetTimerEx("SetTT1dSpawn", 4000 , false, "d", npcid);
		Update3DTextLabelText(TT1DriverHPdisplay3DLabel, TT1HPLow, TT1HP8);
		TT1checkSpawned[killerid]=1;
	}
	return 1;
}

forward TT1DelectLAID(playerid);
public TT1DelectLAID(playerid)
{
    for(new i = 0; i < MAX_PLAYERS; i++)
   	{
        PlayerTextDrawHide(i,TT1DigiHP[i]);
	}
	SetPlayerScore(TT1LastAttackID,GetPlayerScore(TT1LastAttackID)+100);
 	SendClientMessage(TT1LastAttackID, -1,"you beat Tortoise , get Sorce 100!");
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

public FCNPC_OnVehicleEntryComplete(npcid, vehicleid, seatid)
{
	return 1;
}

public FCNPC_OnVehicleTakeDamage(npcid, issuerid, vehicleid, Float:amount, weaponid, Float:fX, Float:fY, Float:fZ)
{
	new Float:TT1dHP = FCNPC_GetHealth(TTDriver1);

	if (vehicleid == TT1CAR && npcid == TTDriver1)
	{
 	    if (TT1StartMove[TTDriver1] == 0)
		{
		    TT1StartMove[TTDriver1] = 1;
			TT1dtimer=SetTimerEx("TT1Move", TT1MOVETimer, true, "i", npcid);
			TT1HPUpdata(npcid);
		}
	    else
		{
			TT1HPUpdata(npcid);
			
		}

		switch( weaponid )
		{
			case 0..15:
			{
				FCNPC_SetHealth(TTDriver1, TT1dHP-50);
			}
			case 22,23:
			{
				FCNPC_SetHealth(TTDriver1, TT1dHP-150);
			}
			case 24:
			{
				FCNPC_SetHealth(TTDriver1, TT1dHP-75);
			}
			case 25..32,38:
			{
				FCNPC_SetHealth(TTDriver1, TT1dHP-30);
			}
			case 33:
			{
				FCNPC_SetHealth(TTDriver1, TT1dHP-20);
			}
			case 34:
			{
				FCNPC_SetHealth(TTDriver1, TT1dHP-50);
			}
			case 51:
			{
				FCNPC_SetHealth(TTDriver1, TT1dHP-100);
			}
		}
		SetVehicleHealth(TT1CAR, 10000);
		TT1dHP = FCNPC_GetHealth(TTDriver1);
		TT1HPUpdata(npcid);

	    GetPlayerName(issuerid,TT1LastAttackName,sizeof(TT1LastAttackName));
	    TT1LastAttackID = GetPlayerIdFromName ( TT1LastAttackName );

		if (TT1dHP == 0 )
		{
			SetTimer("TT1DelectLAID" , 100 ,false);
		}
	}


	return 1;
}
stock SetPlayerPosFacing(playerid,Float:x ,Float:y,Float:z,Float:a)
{   SetPlayerPos(playerid , x , y ,z);
    SetPlayerFacingAngle(playerid, a);
    return 1;
}
stock bool:GetPosInFrontOfPoint(&Float:OutputX, &Float:OutputY, Float:Angle, Float:Distance)
{	if(!Distance) return false;
	OutputX += floatmul(Distance, floatsin(-Angle, degrees));
	OutputY += floatmul(Distance, floatcos(-Angle, degrees));
	return true;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
//TT1***************************************************************************
	if(strcmp(cmdtext, "/23", true) == 0)
	{
		GivePlayerWeapon(playerid, 23, 8000);
		return 1;
	}
	if(strcmp(cmdtext, "/24", true) == 0)
	{
		GivePlayerWeapon(playerid, 24, 8000);
		return 1;
	}
	if(strcmp("/TT1", cmdtext, true) == 0) 
	{
		SetPlayerPosFacing(playerid, pTT1xyzf);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
	if(strcmp("/TT1CAR1", cmdtext, true) == 0) 
	{
	    DestroyVehicle(TT1CAR);
        TT1CAR = CreateVehicle(TT1CARid,TT1xyz,  TT1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/TT1CAR2", cmdtext, true) == 0)
	{
	    DestroyVehicle(TT1CAR);
        TT1CAR = CreateVehicle(TT1CARid2,TT1xyz,  TT1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/TT1CAR3", cmdtext, true) == 0)
	{
	    DestroyVehicle(TT1CAR);
        TT1CAR = CreateVehicle(TT1CARid3,TT1xyz,  TT1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/TT1CAR4", cmdtext, true) == 0)
	{
	    DestroyVehicle(TT1CAR);
        TT1CAR = CreateVehicle(TT1CARid4,TT1xyz,  TT1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/TT1CAR5", cmdtext, true) == 0)
	{
	    DestroyVehicle(TT1CAR);
        TT1CAR = CreateVehicle(TT1CARid5,TT1xyz,  TT1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/TT1CAR6", cmdtext, true) == 0) 
	{
	    DestroyVehicle(TT1CAR);
        TT1CAR = CreateVehicle(TT1CARid6,TT1xyz,  TT1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/TT1CAR7", cmdtext, true) == 0)
	{
	    DestroyVehicle(TT1CAR);
        TT1CAR = CreateVehicle(TT1CARid7,TT1xyz,  TT1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/reTT1car", cmdtext, true) == 0)
	{
		SetVehicleToRespawn(TT1CAR);

		FCNPC_PutInVehicle(TTDriver1, TT1CAR, 0);
		return 1;
	}
	if(strcmp("/TT1def", cmdtext, true) == 0)
	{
		KillTimer(TT1dtimer);

	    DestroyVehicle(TT1CAR);
        TT1CAR = CreateVehicle(TT1CARid,TT1xyz,  TT1facing, -1, -1, 0);

		FCNPC_Respawn(TTDriver1);
		FCNPC_PutInVehicle(TTDriver1, TT1CAR, 0);
		FCNPC_SetHealth(TTDriver1, TT1MAXHP);

        TT1StartMove[TTDriver1] = 0;
		FCNPC_Stop(TTDriver1);
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
		    PlayerTextDrawHide(i,TT1DigiHP[i]);
		}
		return 1;
	}
	if(strcmp("/TT1home", cmdtext, true) == 0)
	{
		SetVehicleToRespawn(TT1CAR);
		return 1;
	}
	if(strcmp("/reTT1", cmdtext, true) == 0)
	{
		KillTimer(TT1dtimer);

		FCNPC_Destroy(TTDriver1);

		Delete3DTextLabel(TT1DriverName3DLabel);
		Delete3DTextLabel(TT1DriverHPdisplay3DLabel);

		DestroyPickup(TT1pickup);
		DestroyVehicle(TT1CAR);
	    DestroyDynamicObject(Tortoise1609);
	    DestroyDynamicObject(Tortoise1609SkillFireEffect);
	    DestroyDynamicObject(Tortoise1609SkillRock);
	    KillTimer(Tortoise1609SkillRockClearTimer);

		KillTimer(TT1AFKTime);
		SendRconCommand("reloadfs TT1");
		return 1;
	}
	if(strcmp("/TT1cs", cmdtext, true) == 0)
	{
		TT1checkSpawned[playerid] = 1;
		return 1;
	}

 	return 0;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
//TT1***************************************************************************
    if(pickupid == TT1pickup)
    {
		SendClientMessage(playerid, -1,"[Tortoise1609]_________________________________________________");
		SendClientMessage(playerid, -1,"{D2B9D3}Use 1 FCNPC + 1 vehicle + 1 objects, Retrofit from DH1.pwn.");
		SendClientMessage(playerid, -1,"note: Non-aggressive, move when attacked.");
    }
    return 1;
}


//TT1***************************************************************************
stock TT1HPUpdata(npcid)
{
	new Float: TT1HP = FCNPC_GetHealth(npcid);
	if (TT1MAXHP*1.0 > TT1HP >= TT1MAXHP*0.8) Update3DTextLabelText(TT1DriverHPdisplay3DLabel, TT1HPFull, TT1HP1);
	else if (TT1MAXHP*0.8 > TT1HP >= TT1MAXHP*0.6) Update3DTextLabelText(TT1DriverHPdisplay3DLabel, TT1HPFull, TT1HP2);
	else if (TT1MAXHP*0.6 > TT1HP >= TT1MAXHP*0.4) Update3DTextLabelText(TT1DriverHPdisplay3DLabel, TT1HPSome, TT1HP3);
	else if (TT1MAXHP*0.4 > TT1HP >= TT1MAXHP*0.2) Update3DTextLabelText(TT1DriverHPdisplay3DLabel, TT1HPSome, TT1HP4);
	else Update3DTextLabelText(TT1DriverHPdisplay3DLabel, TT1HPLow, TT1HP5);

}

forward TT1Move(npcid,playerid);
public TT1Move(npcid,playerid)
{
	if (npcid == TTDriver1)
	{
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
			if (IsPlayerInRangeOfPlayer(i,npcid,TT1NOTICE) && IsPlayerNPC(i) == 0 )
			{
		        new Float:TT1dHP = FCNPC_GetHealth(TTDriver1);
				new TT1dHPNum[15];
				format(TT1dHPNum, sizeof(TT1dHPNum), "%.0f", TT1dHP);
				PlayerTextDrawSetString(i,TT1DigiHP[i], TT1dHPNum);
				PlayerTextDrawShow(i, TT1DigiHP[i]);
				
				if ( !IsPlayerInRangeOfPoint(TTDriver1,TT1NOTICE,TT1xyz) )
				{
			 		FCNPC_GoTo(TTDriver1, TT1xyz, .mode = FCNPC_MOVE_MODE_NONE,.speed = TT1SPEED,.radius = 5, .set_angle = true);
				}
				else
				{
				 	if( IsPlayerNPC(i) == 0 && !FCNPC_IsDead(TTDriver1) )
					{
					    if (! IsPlayerInRangeOfPoint(TTDriver1,TT1GotoBack,TT1xyz) )
					    FCNPC_GoTo(TTDriver1, TT1xyz, .mode = FCNPC_MOVE_MODE_NONE,.speed = TT1SPEED+1,.radius = 5, .set_angle = true);
					    else
					    {
							new Float:x, Float:y, Float:z;
							FCNPC_GetPosition(TTDriver1,x, y, z);
							switch( random(6) )
							{
								case 0:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x,			y+17	,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = TT1SPEED,.radius = 1, .set_angle = true);}
								case 1:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x+15,		y		,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = TT1SPEED,.radius = 1, .set_angle = true);}
								case 2:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x+15.2,	y+1		,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = TT1SPEED,.radius = 1, .set_angle = true);}
								case 3:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x,			y-15.8	,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = TT1SPEED,.radius = 1, .set_angle = true);}
								case 4:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x-15.5,		y	,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = TT1SPEED,.radius = 1, .set_angle = true);}
								case 5:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x-15,		y-14	,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = TT1SPEED,.radius = 1, .set_angle = true);}
							}
						}
					}
				}
			}
			else if (!IsPlayerInRangeOfPlayer(i,npcid,TT1NOTICE) && IsPlayerNPC(i) == 0 )
			{
                PlayerTextDrawHide(i,TT1DigiHP[i]);
			}
       }//for
	}
}
forward TT1IsShoot(npcid,playerid);
public TT1IsShoot(npcid,playerid)
{
	if (npcid == TTDriver1 )
	{
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
   			if (IsPlayerInRangeOfPlayer(i,npcid,TT1NOTICE) && IsPlayerNPC(i) == 0 && TT1StartMove[TTDriver1] == 1 && !FCNPC_IsDead(TTDriver1) && TT1checkSpawned[i] == 1 ) 
			{
			    if ( IsPlayerNPC(i) == 0 && TT1AFK[i] == 0)
				{
					new Float:px, Float: py, Float:pz;
					GetPlayerPos(i,px,py,pz);
					FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
					if( TT1RockIsShoot[TTDriver1] == 0 )
					{
					    TT1RockIsShoot[TTDriver1] = 1;
						new Float:pTT1x, Float: pTT1y, Float:pTT1z;
						FCNPC_GetPosition(npcid, pTT1x, pTT1y,pTT1z);

						SetDynamicObjectPos(Tortoise1609SkillRock, pTT1x, pTT1y, pTT1z);
	                    MoveDynamicObject(Tortoise1609SkillRock, px,py,pz , 50.00);

	                    SetDynamicObjectPos(Tortoise1609SkillFireEffect, pTT1x, pTT1y, pTT1z);
   	                    MoveDynamicObject(Tortoise1609SkillFireEffect, px,py,pz-3 , 50.00);

						KillTimer(Tortoise1609SkillRockClearTimer);
    	                Tortoise1609SkillRockClearTimer = SetTimerEx("TT1RockClear", 3000, false, "i", TTDriver1);
    	            }
				}
				else if ( IsPlayerNPC(i) == 0 && TT1AFK[i] == 1 )
				{
					FCNPC_Stop(npcid);
				}
			}
			else if (IsPlayerInRangeOfPlayer(i,npcid,TT1NOTICE) && IsPlayerNPC(i) == 0 && TT1StartMove[TTDriver1] == 1 && FCNPC_IsDead(TTDriver1) && TT1checkSpawned[i] == 1 )  
			{
				FCNPC_Stop(npcid);
			}
			else if (IsPlayerInRangeOfPlayer(i,npcid,TT1NOTICE) && IsPlayerNPC(i) == 0 && TT1StartMove[TTDriver1] == 0 && FCNPC_IsDead(TTDriver1) && TT1checkSpawned[i] == 1 ) 
			{
				FCNPC_Stop(npcid);
			}
        }//for
	}
}

forward TT1RockClear(npcid);
public TT1RockClear(npcid)
{
	new Float:pTT1x, Float: pTT1y, Float:pTT1z;
	FCNPC_GetPosition(TTDriver1, pTT1x, pTT1y,pTT1z);

	SetDynamicObjectPos(Tortoise1609SkillRock, pTT1x, pTT1y, pTT1z);
    SetDynamicObjectPos(Tortoise1609SkillFireEffect, pTT1x, pTT1y, pTT1z);
	TT1RockIsShoot[TTDriver1] = 0;
}

forward SetTT1dSpawn(npcid);
public SetTT1dSpawn(npcid)
{
	if(npcid == TTDriver1)
	{
		if(!FCNPC_IsSpawned(npcid))
		{
			FCNPC_Spawn(npcid, TT1dSkin,TT1xyz);
		}
		else
		{
	    	if(FCNPC_IsDead(npcid))
			{
		    	FCNPC_Respawn(npcid);
		    }
			FCNPC_SetSkin(npcid, TT1dSkin);
		}

		FCNPC_SetPosition(npcid, TT1xyz);
	    FCNPC_SetHealth(npcid, TT1MAXHP);
		FCNPC_SetInterior(npcid, TT1InteriorID);
		TT1StartMove[TTDriver1] = 0;
		Update3DTextLabelText(TT1DriverHPdisplay3DLabel, TT1HPFull, TT1HP1);
		
        SetVehiclePos(TT1CARid,TT1xyz);
		FCNPC_PutInVehicle(npcid, TT1CAR, 0);

		FCNPC_SetPosition(npcid, TT1xyz);

		SetVehicleHealth(TT1CAR, 10000);
	}
    return 1;
}

forward TT1AFKCheck(playerid);
public TT1AFKCheck(playerid)
{
 	if( IsPlayerNPC(playerid) == 0 )
	{
	    GetPlayerPos(playerid,TT1CheckPlayerIsAfk[0],TT1CheckPlayerIsAfk[1],TT1CheckPlayerIsAfk[2]); // Gets the player position and saves into their variables.
	}
	KillTimer(TT1AFKTime);
	TT1AFKTime = SetTimerEx("TT1AFKCheck2", 1000, false, "i", playerid);

	return 1;
}
forward TT1AFKCheck2(playerid);
public TT1AFKCheck2(playerid)
{

 	if( IsPlayerNPC(playerid) == 0 )
	{
	    if(IsPlayerInRangeOfPoint(playerid,1,TT1CheckPlayerIsAfk[0],TT1CheckPlayerIsAfk[1],TT1CheckPlayerIsAfk[2])) // If player is around the position (if player is at the same place)
	    {
	       TT1AFK[playerid] = 1; // Increment the AFK variable (for every second if player is at same location, increase the AFK variable by 1)
 		}
	    else
	    {
	       TT1AFK[playerid]= 0;
		}
	}
	KillTimer(TT1AFKTime);
	TT1AFKTime = SetTimerEx("TT1AFKCheck", 1000, false, "i", playerid);
	return 1;
}

