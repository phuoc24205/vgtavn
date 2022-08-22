#include <a_samp>
#include <FCNPC>
#include <streamer>
//DH1***************************************************************************
#define pDH1xyzf -2269.0, 2435.2, 4.9, 318.5    //tp player pos
#define DH1pickupXYZ   -2258.5, 2437.6 ,4.9    	//note pickup
#define DH1xyz   -2233.5, 2471.0 ,10        	//AI xyz
#define DH1facing  135.1
#define DH1InteriorID 0
new DH1dtimer=-1;  	
new DH1timer=-1;  	
new StoneDH1timer=-1;

new DHAttack1;        				//AI  a name in .pwn file
new DHDriver1;
#define DH1aSkin 121  				//skin
#define DH1dSkin 122
new DH1MOVETimer = 1000;  			//Perform a move in a few seconds
#define DH1GotoBack 50 				//If the preset moving range exceeds, it will return
#define DH1NOTICE 200  				//Warning range
#define DH1NEAR 50  				//shoot Range

#define DH1MAXHP 1000

new Text3D:DH1DriverHPdisplay3DLabel,   //show ai HP in screen top.
	Text3D:DH1AttackName3DLabel,
	Text3D:DH1DriverName3DLabel,
	DH1pickup;

#define DH1DriverName "DH1" 		//AI head display status 1 name,but it will not show in game

#define DH1HPFull 0x9EC73DFF  		//AI displays HP GREEN above the head
#define DH1HPSome 0xFF9900FF  		// ORANGE
#define DH1HPLow 0xAA3333FF  		// RED
#define DH1HP1 "OOOOO"
#define DH1HP2 "OOOO-"
#define DH1HP3 "OOO--"
#define DH1HP4 "OO---"
#define DH1HP5 "O----"
#define DH1HP8 "-----"

#define DH1AttackName ".DH1" 		//attack_ai head display status 1 name
#define DH1AttackNameIsMabi "[IsMabi]" 	//status 2 paralyzed
#define DH1IsMabiColor 0xDABB3EFF  	//paralyzed color YELLOW
#define SetDH1wepon WEAPON_SNIPER	 	//weapon
#define StoneDH1TIME 2000  			//like paralysis timer
#define RstStoneDH1Time 3000		//anti keep paralysis
new DH1IsMabi[MAX_PLAYERS]=0; 		//is paralysis var
new DH1Load = 50 ;    				
new DH1Shot = 1000 ;     			
new DH1Clip = 7 ;
new Float:DH1AIM =    0.1;

new DH1AFK[MAX_PLAYERS];
new DH1AFKTime = -1 ;
new DH1checkSpawned[MAX_PLAYERS];
new Float:DH1CheckPlayerIsAfk[3];

new DH1StartMove[MAX_PLAYERS] = 0;

new DH1CAR;				
new DH1CARid = 508 ;
new DH1CARid2 = 573 ;
new DH1CARid3 =  579;
new DH1CARid4 =  512;
new DH1CARid5 =  513;
new DH1CARid6 =  519;
new DH1CARid7 =  520;
#define DH1SPEED 1*2
#define DHAttack1InCarZ -2
#define FCNPCPATH FCNPC_MOVE_PATHFINDING_AUTO
new DragonHead;
new DH1RockIsShoot[MAX_PLAYERS] = 0;
new DragonHeadSkillFireEffect;
new DragonHeadSkillRock;
new DragonHeadSkillRockClearTimer = -1;


new PlayerText:DH1DigiHP[MAX_PLAYERS];//DHA

public OnFilterScriptInit()
{
//DH1***************************************************************************
	DHDriver1 = FCNPC_Create(DH1DriverName);
	SetDH1dSpawn(DHDriver1);

	DHAttack1 = FCNPC_Create(DH1AttackName);
	DH1AttackName3DLabel = Create3DTextLabel(DH1AttackName, -1, 0.0, 0.0, 0.0, DH1NOTICE,  0, 1);
	Attach3DTextLabelToPlayer(DH1AttackName3DLabel, DHAttack1, 0.0, 0.0, 0.45);
	Update3DTextLabelText(DH1AttackName3DLabel, 0xFFFFFF00, DH1AttackName);
	SetDH1aSpawn(DHAttack1);

	DH1pickup =  CreatePickup(1239, 2, DH1pickupXYZ,-1);

	//create veh and use LinkVehicleToInterior set alpha
	DH1CAR = CreateVehicle(DH1CARid,DH1xyz,  DH1facing, -1, -1, 0);
    SetVehiclePos(DH1CAR,DH1xyz);
    LinkVehicleToInterior(DH1CAR, 1);
        
	FCNPC_PutInVehicle(DHDriver1, DH1CAR, 0);
	FCNPC_SetSurfingVehicle(DHAttack1, DH1CAR);
	FCNPC_SetSurfingOffsets(DHAttack1, 0, 0, DHAttack1InCarZ);

    //create object
	DragonHead = CreateDynamicObject(3528, DH1xyz, 0, 0.0, 0.0 );
    AttachDynamicObjectToVehicle(DragonHead, DH1CAR, 0.0, 0.0-0.3, 0.0+0.8, 360.0, 330.0, 80.0);

    DragonHeadSkillRock = CreateDynamicObject(2936, 0,0,0,0, 0.0, 0.0 );

    DragonHeadSkillFireEffect = CreateDynamicObject(18689, 0,0,0,0, 0.0, 0.0 );
	
	SetTimer("DH1ShowdigiHP",1000,true);//digi hp ar
	return 1;
}
public OnFilterScriptExit()
{
//DH1***************************************************************************
	FCNPC_Stop(DHAttack1);
	FCNPC_Stop(DHDriver1);

	KillTimer(DH1timer);
	KillTimer(DH1dtimer);
	KillTimer(StoneDH1timer);
	FCNPC_Destroy(DHAttack1);
	FCNPC_Destroy(DHDriver1);

	Delete3DTextLabel(DH1DriverName3DLabel);
	Delete3DTextLabel(DH1DriverHPdisplay3DLabel);
	Delete3DTextLabel(DH1AttackName3DLabel);

	DestroyPickup(DH1pickup);
	DestroyVehicle(DH1CAR);
    DestroyDynamicObject(DragonHead);

    DestroyDynamicObject(DragonHeadSkillFireEffect);
    DestroyDynamicObject(DragonHeadSkillRock);
    KillTimer(DragonHeadSkillRockClearTimer);
	KillTimer(DH1AFKTime);

 	for(new i; i<GetMaxPlayers(); i++)
	{
		if(IsPlayerConnected(i))
		{
			PlayerTextDrawDestroy(i,DH1DigiHP[i]);
		}
	}
	
	return 1;
}
public OnPlayerConnect(playerid)
{
//DH1***************************************************************************
	DH1checkSpawned[playerid]=0;
	SetPlayerColor(DHDriver1,0xFFFFFFFF);
	SetPlayerColor(DHAttack1,0xFFFFFF00);

	DH1DigiHP[playerid] = CreatePlayerTextDraw(playerid,325.000000, 10.000000, "1000"); //show hp on screen top
	PlayerTextDrawBackgroundColor(playerid,DH1DigiHP[playerid], 255);
	PlayerTextDrawFont(playerid,DH1DigiHP[playerid], 1);
	PlayerTextDrawTextSize(playerid,DH1DigiHP[playerid], 2.0, 3.6);
	PlayerTextDrawLetterSize(playerid,DH1DigiHP[playerid], 0.54, 2.16);
	PlayerTextDrawAlignment(playerid,DH1DigiHP[playerid], 2 );
	PlayerTextDrawColor(playerid,DH1DigiHP[playerid], -6291201);
	PlayerTextDrawSetOutline(playerid,DH1DigiHP[playerid], 1);
	PlayerTextDrawSetProportional(playerid,DH1DigiHP[playerid], 1);
	
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{   
	PlayerTextDrawDestroy(playerid,DH1DigiHP[playerid]);
	return 1;
}

public OnPlayerSpawn(playerid)
{
//DH1***************************************************************************
	DH1checkSpawned[playerid]=1;
	DH1AFK[playerid]=0;
	DH1AFKTime = SetTimerEx("DH1AFKCheck", 1000, false, "i", playerid);
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
//DH1***************************************************************************
	KillTimer(DH1AFKTime);
    if (killerid == DHAttack1)
    DH1checkSpawned[playerid]=0;

	return 1;
}

public FCNPC_OnSpawn(npcid)
{
//DH1***************************************************************************
	return 1;
}
public FCNPC_OnTakeDamage(npcid, issuerid, Float:amount, weaponid, bodypart)
{
//DH1***************************************************************************
	if (npcid == DHDriver1)
	{
	    if (DH1StartMove[DHDriver1] == 0)
		{
		    DH1StartMove[DHDriver1] = 1;
			DH1dtimer = SetTimerEx("DH1Move", DH1MOVETimer, true, "i", npcid); 
			DH1HPUpdata(npcid);
			KillTimer(DH1timer);
		    DH1timer=SetTimerEx("DH1IsShoot", DH1Shot, true, "d", DHAttack1);
		}
	    else DH1HPUpdata(npcid);
	}
	if (npcid == DHAttack1)
	{
		if ( (weaponid == 23 || weaponid == 24 || weaponid == 25|| weaponid == 34)&& FCNPC_IsSpawned(npcid))
  		{
  		    if (DH1IsMabi[npcid]==0)
  		    {
                DH1IsMabi[npcid]=1;
                StoneDH1timer =  SetTimerEx("StoneDH1Time", 100 , false, "d", npcid);
			}
		}
	}

	return 1;
}

new DH1LastAttackName[MAX_PLAYER_NAME];
new DH1LastAttackID;
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
//DH1***************************************************************************
    if (npcid == DHDriver1)
	{
		KillTimer(DH1dtimer);
		DH1dtimer = SetTimerEx("SetDH1dSpawn", 4000 , false, "d", npcid);
		DH1checkSpawned[killerid]=1;

		if(FCNPC_IsAiming(DHAttack1)) 	 {	FCNPC_StopAim(DHAttack1);	 }
		if(FCNPC_IsAttacking(DHAttack1)) {	FCNPC_StopAttack(DHAttack1); }
	    FCNPC_SetHealth(DHAttack1,1000);
	}
	return 1;
}

forward DH1DelectLAID(playerid);
public DH1DelectLAID(playerid)
{
    for(new i = 0; i < MAX_PLAYERS; i++)
   	{
        PlayerTextDrawHide(i,DH1DigiHP[i]);
	}
	SetPlayerScore(DH1LastAttackID,GetPlayerScore(DH1LastAttackID)+10000);
 	SendClientMessage(DH1LastAttackID, -1,"you beat dragon head , get Sorce 10,000!");
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
	new Float:DH1dHP = FCNPC_GetHealth(DHDriver1);

	if (vehicleid == DH1CAR && npcid == DHDriver1)
	{
 	    if (DH1StartMove[DHDriver1] == 0)
		{
		    DH1StartMove[DHDriver1] = 1;
			DH1dtimer=SetTimerEx("DH1Move", DH1MOVETimer, true, "i", npcid); 
			DH1HPUpdata(npcid);
			KillTimer(DH1timer);
		    DH1timer=SetTimerEx("DH1IsShoot", DH1Shot, true, "d", DHAttack1);
		}
	    else
		{
			DH1HPUpdata(npcid);
			
		}

		switch( weaponid )
		{
			case 0..15:
			{
				FCNPC_SetHealth(DHDriver1, DH1dHP-50);
			}
			case 22,23:
			{
				FCNPC_SetHealth(DHDriver1, DH1dHP-150);
			}
			case 24:
			{
				FCNPC_SetHealth(DHDriver1, DH1dHP-75);
			}
			case 25..32,38:
			{
				FCNPC_SetHealth(DHDriver1, DH1dHP-30);
			}
			case 33:
			{
				FCNPC_SetHealth(DHDriver1, DH1dHP-20);
			}
			case 34:
			{
				FCNPC_SetHealth(DHDriver1, DH1dHP-50);
			}
			case 51:
			{
				FCNPC_SetHealth(DHDriver1, DH1dHP-100);
			}
		}
		SetVehicleHealth(DH1CAR, 10000);
		DH1dHP = FCNPC_GetHealth(DHDriver1);
		DH1HPUpdata(npcid);

	    GetPlayerName(issuerid,DH1LastAttackName,sizeof(DH1LastAttackName));
	    DH1LastAttackID = GetPlayerIdFromName ( DH1LastAttackName );

		if (DH1dHP == 0 )
		{
			SetTimer("DH1DelectLAID" , 100 ,false);
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
//DH1***************************************************************************
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
	if(strcmp("/DH1", cmdtext, true) == 0) 
	{
		SetPlayerPosFacing(playerid, pDH1xyzf);
		SetCameraBehindPlayer(playerid);
		return 1;
	}

	if(strcmp("/DH1CAR1", cmdtext, true) == 0)
	{
	    DestroyVehicle(DH1CAR);
        DH1CAR = CreateVehicle(DH1CARid,DH1xyz,  DH1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/DH1CAR2", cmdtext, true) == 0) 
	{
	    DestroyVehicle(DH1CAR);
        DH1CAR = CreateVehicle(DH1CARid2,DH1xyz,  DH1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/DH1CAR3", cmdtext, true) == 0) 
	{
	    DestroyVehicle(DH1CAR);
        DH1CAR = CreateVehicle(DH1CARid3,DH1xyz,  DH1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/DH1CAR4", cmdtext, true) == 0) 
	{
	    DestroyVehicle(DH1CAR);
        DH1CAR = CreateVehicle(DH1CARid4,DH1xyz,  DH1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/DH1CAR5", cmdtext, true) == 0)
	{
	    DestroyVehicle(DH1CAR);
        DH1CAR = CreateVehicle(DH1CARid5,DH1xyz,  DH1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/DH1CAR6", cmdtext, true) == 0)
	{
	    DestroyVehicle(DH1CAR);
        DH1CAR = CreateVehicle(DH1CARid6,DH1xyz,  DH1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/DH1CAR7", cmdtext, true) == 0) 
	{
	    DestroyVehicle(DH1CAR);
        DH1CAR = CreateVehicle(DH1CARid7,DH1xyz,  DH1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/reDH1car", cmdtext, true) == 0)
	{
		SetVehicleToRespawn(DH1CAR);

		FCNPC_PutInVehicle(DHDriver1, DH1CAR, 0);
		FCNPC_SetSurfingVehicle(DHAttack1, DH1CAR);
		FCNPC_SetSurfingOffsets(DHAttack1, 0, 0, DHAttack1InCarZ);
		return 1;
	}
	if(strcmp("/DH1def", cmdtext, true) == 0)
	{
		KillTimer(DH1dtimer);

		KillTimer(DH1timer);
		KillTimer(StoneDH1timer);
		if(FCNPC_IsAiming(DHAttack1)) 	 {	FCNPC_StopAim(DHAttack1);	 }
		if(FCNPC_IsAttacking(DHAttack1)) {	FCNPC_StopAttack(DHAttack1); }

	    DestroyVehicle(DH1CAR);
        DH1CAR = CreateVehicle(DH1CARid,DH1xyz,  DH1facing, -1, -1, 0);
        LinkVehicleToInterior(DH1CAR, 1);
        
		FCNPC_Respawn(DHDriver1);
		FCNPC_PutInVehicle(DHDriver1, DH1CAR, 0);
		FCNPC_SetHealth(DHDriver1, DH1MAXHP);

        DH1StartMove[DHDriver1] = 0;
		FCNPC_Stop(DHDriver1);

		FCNPC_Respawn(DHAttack1);
		FCNPC_SetSurfingVehicle(DHAttack1, DH1CAR);
		FCNPC_SetSurfingOffsets(DHAttack1, 0, 0, DHAttack1InCarZ);

	    for(new i = 0; i < MAX_PLAYERS; i++)
	   	{
	        PlayerTextDrawHide(i,DH1DigiHP[i]);
		}
		return 1;
	}
	if(strcmp("/reDH1", cmdtext, true) == 0)
	{
		KillTimer(DH1timer);
		KillTimer(DH1dtimer);
		KillTimer(StoneDH1timer);
		FCNPC_Destroy(DHAttack1);
		FCNPC_Destroy(DHDriver1);

		Delete3DTextLabel(DH1DriverName3DLabel);
		Delete3DTextLabel(DH1DriverHPdisplay3DLabel);
		Delete3DTextLabel(DH1AttackName3DLabel);

		DestroyPickup(DH1pickup);
		DestroyVehicle(DH1CAR);
	    DestroyDynamicObject(DragonHead);
	    DestroyDynamicObject(DragonHeadSkillFireEffect);
	    DestroyDynamicObject(DragonHeadSkillRock);
	    KillTimer(DragonHeadSkillRockClearTimer);

		KillTimer(DH1AFKTime);
		SendRconCommand("reloadfs DH1");
		return 1;
	}
	if(strcmp("/DH1a", cmdtext, true) == 0)
	{
		FCNPC_SetSurfingVehicle(DHAttack1, DH1CAR);
		FCNPC_SetSurfingOffsets(DHAttack1, 0, 0, DHAttack1InCarZ);
		return 1;
	}
	if(strcmp("/DH1aa", cmdtext, true) == 0)
	{
		FCNPC_StopSurfing(DHAttack1);
		return 1;
	}
	if(strcmp("/DH1cs", cmdtext, true) == 0)
	{
		DH1checkSpawned[playerid] = 1;
		return 1;
	}


 	return 0;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
//DH1***************************************************************************
    if(pickupid == DH1pickup)
    {
		SendClientMessage(playerid, -1,"[DragonHead]_________________________________________________");
		SendClientMessage(playerid, -1,"{D2B9D3}Use 2 FCNPCs + 1 vehicle + 3 objects, Retrofit from CA2.pwn.");
		SendClientMessage(playerid, -1,"note¡Gthis is roughly the same as CA2.pwn.");
		SendClientMessage(playerid, -1,"note¡GWhen ai is attacking, it will shoot stones (obj) towards the player.");
		SendClientMessage(playerid, -1,"{AFAFAF}¡uThe 'attack_ai' will not die and can be paralyzed for a short time with weapons such as Deagle.");
		SendClientMessage(playerid, -1,"Note: You must shoot the vehicle to cause damage (explosion damage is still invalid)");
		SendClientMessage(playerid, -1,"/DH1def");
    }
    return 1;
}

//DH1***************************************************************************
stock DH1HPUpdata(npcid)
{
	new Float: DH1HP = FCNPC_GetHealth(npcid);
	if (DH1MAXHP*1.0 > DH1HP >= DH1MAXHP*0.8) Update3DTextLabelText(DH1DriverHPdisplay3DLabel, DH1HPFull, DH1HP1);
	else if (DH1MAXHP*0.8 > DH1HP >= DH1MAXHP*0.6) Update3DTextLabelText(DH1DriverHPdisplay3DLabel, DH1HPFull, DH1HP2);
	else if (DH1MAXHP*0.6 > DH1HP >= DH1MAXHP*0.4) Update3DTextLabelText(DH1DriverHPdisplay3DLabel, DH1HPSome, DH1HP3);
	else if (DH1MAXHP*0.4 > DH1HP >= DH1MAXHP*0.2) Update3DTextLabelText(DH1DriverHPdisplay3DLabel, DH1HPSome, DH1HP4);
	else Update3DTextLabelText(DH1DriverHPdisplay3DLabel, DH1HPLow, DH1HP5);

}

forward DH1Move(npcid,playerid);
public DH1Move(npcid,playerid)
{
	if (npcid == DHDriver1)
	{
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
			if (IsPlayerInRangeOfPlayer(i,npcid,DH1NOTICE) && IsPlayerNPC(i) == 0 )
			{
		        new Float:DH1dHP = FCNPC_GetHealth(DHDriver1);
				new DH1dHPNum[15];
				format(DH1dHPNum, sizeof(DH1dHPNum), "%.0f", DH1dHP);
				PlayerTextDrawSetString(i,DH1DigiHP[i], DH1dHPNum);
				PlayerTextDrawShow(i, DH1DigiHP[i]);
				
				if ( !IsPlayerInRangeOfPoint(DHDriver1,DH1GotoBack,DH1xyz) )
				{
			 		FCNPC_GoTo(DHDriver1, DH1xyz, .mode = FCNPC_MOVE_MODE_NONE,.speed = DH1SPEED,.radius = 5, .set_angle = true);
				}
				else
				{
				 	if( IsPlayerNPC(i) == 0 && !FCNPC_IsDead(DHDriver1) )
					{
					    if (! IsPlayerInRangeOfPoint(DHDriver1,DH1NEAR,DH1xyz) )
					    FCNPC_GoTo(DHDriver1, DH1xyz, .mode = FCNPC_MOVE_MODE_NONE,.speed = DH1SPEED+1,.radius = 5, .set_angle = true);
					    else
					    {
							new Float:x, Float:y, Float:z;
							FCNPC_GetPosition(DHDriver1,x, y, z);
							switch( random(6) )
							{
								case 0:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x,			y+12	,z+3,		.mode = FCNPC_MOVE_MODE_NONE,.speed = DH1SPEED,.radius = 1, .set_angle = true);}
								case 1:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x+12,		y		,z+1,		.mode = FCNPC_MOVE_MODE_NONE,.speed = DH1SPEED,.radius = 1, .set_angle = true);}
								case 2:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x+12.2,	y+1		,z,			.mode = FCNPC_MOVE_MODE_NONE,.speed = DH1SPEED,.radius = 1, .set_angle = true);}
								case 3:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x,			y-12.8	,z+1,		.mode = FCNPC_MOVE_MODE_NONE,.speed = DH1SPEED,.radius = 1, .set_angle = true);}
								case 4:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x-12.5,	y	,z,				.mode = FCNPC_MOVE_MODE_NONE,.speed = DH1SPEED,.radius = 1, .set_angle = true);}
								case 5:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x-12,		y-14	,z-2,		.mode = FCNPC_MOVE_MODE_NONE,.speed = DH1SPEED,.radius = 1, .set_angle = true);}
							}
						}
					}
				}
			}
			else if (!IsPlayerInRangeOfPlayer(i,npcid,DH1NOTICE) && IsPlayerNPC(i) == 0 )
			{
                PlayerTextDrawHide(i,DH1DigiHP[i]);
			}
       }//for
	}
}
forward DH1IsShoot(npcid,playerid);
public DH1IsShoot(npcid,playerid)
{
	if (npcid == DHAttack1 )
	{
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
   			if (IsPlayerInRangeOfPlayer(i,npcid,DH1NEAR) && IsPlayerNPC(i) == 0 && DH1StartMove[DHDriver1] == 1 && !FCNPC_IsDead(DHDriver1) && DH1checkSpawned[i] == 1 )  
			{
			    if ( IsPlayerNPC(i) == 0 && DH1AFK[i] == 0)
				{
					new Float:px, Float: py, Float:pz;
					GetPlayerPos(i,px,py,pz);
					FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true);
					if( DH1RockIsShoot[DHAttack1] == 0 )        //shoot rock
					{
					    DH1RockIsShoot[DHAttack1] = 1;
						new Float:pDH1x, Float: pDH1y, Float:pDH1z; //get ai xyz angle
						GetVehiclePos(DH1CAR,pDH1x, pDH1y,pDH1z);
                        SetDynamicObjectPos(DragonHeadSkillRock, pDH1x+5, pDH1y, pDH1z+5);  //set obj xyz
	                    MoveDynamicObject(DragonHeadSkillRock, px,py,pz , 50.00);           //move obj

	                    SetDynamicObjectPos(DragonHeadSkillFireEffect, pDH1x+2, pDH1y, pDH1z);// obj2 (just smoke effect)
   	                    MoveDynamicObject(DragonHeadSkillFireEffect, px,py,pz-3 , 50.00);

						KillTimer(DragonHeadSkillRockClearTimer);
    	                DragonHeadSkillRockClearTimer = SetTimerEx("DH1RockClear", 3000, false, "i", DHAttack1); //CD time is 3 second
    	            }
				}
				else if ( IsPlayerNPC(i) == 0 && DH1AFK[i] == 1 )
				{
					FCNPC_StopAim(npcid);
				}
			}
			else if (IsPlayerInRangeOfPlayer(i,npcid,DH1NEAR) && IsPlayerNPC(i) == 0 && DH1StartMove[DHDriver1] == 1 && FCNPC_IsDead(DHDriver1) && DH1checkSpawned[i] == 1 )  
			{
				if(FCNPC_IsAiming(npcid)) 	 {	FCNPC_StopAim(npcid);	 }
				if(FCNPC_IsAttacking(npcid)) {	FCNPC_StopAttack(npcid); }
			}
			else if (IsPlayerInRangeOfPlayer(i,npcid,DH1NEAR) && IsPlayerNPC(i) == 0 && DH1StartMove[DHDriver1] == 0 && FCNPC_IsDead(DHDriver1) && DH1checkSpawned[i] == 1 ) 
			{
				if(FCNPC_IsAiming(npcid)) 	 {	FCNPC_StopAim(npcid);	 }
				if(FCNPC_IsAttacking(npcid)) {	FCNPC_StopAttack(npcid); }
			}
        }//for
	}
}

forward StoneDH1Time(npcid);
public StoneDH1Time(npcid)
{
	KillTimer(DH1timer);
    FCNPC_StopAim(npcid);
    Update3DTextLabelText(DH1AttackName3DLabel, DH1IsMabiColor, DH1AttackNameIsMabi);
    SetTimerEx("StoneDH1TimeEnd", StoneDH1TIME, false, "i", npcid); 
    SetTimerEx("ReSetStoneDH1Time", RstStoneDH1Time, false, "i", npcid); 
}
forward StoneDH1TimeEnd(npcid);
public StoneDH1TimeEnd(npcid)
{
    Update3DTextLabelText(DH1DriverName3DLabel, -1, DH1DriverName);
	Update3DTextLabelText(DH1AttackName3DLabel, 0xFFFFFF00, DH1AttackNameIsMabi);

    DH1timer=SetTimerEx("DH1IsShoot", DH1Shot, true, "d", DHAttack1);
}
forward ReSetStoneDH1Time(npcid);
public ReSetStoneDH1Time(npcid)
{
    DH1IsMabi[npcid] = 0;
}

forward DH1RockClear(npcid);
public DH1RockClear(npcid)
{
	new Float:pDH1x, Float: pDH1y, Float:pDH1z;
	FCNPC_GetPosition(DHAttack1, pDH1x, pDH1y,pDH1z);

	SetDynamicObjectPos(DragonHeadSkillRock, pDH1x, pDH1y, pDH1z);
    SetDynamicObjectPos(DragonHeadSkillFireEffect, pDH1x, pDH1y, pDH1z);
	DH1RockIsShoot[DHAttack1] = 0;
}

forward SetDH1dSpawn(npcid);
public SetDH1dSpawn(npcid)
{
	if(npcid == DHDriver1)
	{
		if(!FCNPC_IsSpawned(npcid))
		{
			FCNPC_Spawn(npcid, DH1dSkin,DH1xyz);
		}
		else
		{
	    	if(FCNPC_IsDead(npcid))
			{
		    	FCNPC_Respawn(npcid);
		    }
			FCNPC_SetSkin(npcid, DH1dSkin);
		}
		FCNPC_SetPosition(npcid, DH1xyz);
	    FCNPC_SetHealth(npcid, DH1MAXHP);
		FCNPC_SetInterior(npcid, DH1InteriorID);
		DH1StartMove[DHDriver1] = 0;

        SetVehiclePos(DH1CARid,DH1xyz);
		FCNPC_PutInVehicle(DHDriver1, DH1CAR, 0);
		FCNPC_SetSurfingVehicle(DHAttack1, DH1CAR);
		FCNPC_SetSurfingOffsets(DHAttack1, 0, 0, DHAttack1InCarZ);

		if(FCNPC_IsAiming(DHAttack1)) 	 {	FCNPC_StopAim(DHAttack1);	 }
		if(FCNPC_IsAttacking(DHAttack1)) {	FCNPC_StopAttack(DHAttack1); }
		FCNPC_SetPosition(npcid, DH1xyz);
        FCNPC_SetHealth(DHAttack1, 10000);
		SetVehicleHealth(DH1CAR, 10000);
	}
    return 1;
}
forward SetDH1aSpawn(npcid);
public SetDH1aSpawn(npcid)
{
	if(npcid == DHAttack1) {
		if(!FCNPC_IsSpawned(npcid)) {
				FCNPC_Spawn(npcid, DH1aSkin,DH1xyz);
		} else {
	    	if(FCNPC_IsDead(npcid)) {
		    	FCNPC_Respawn(npcid);
		    }
			FCNPC_SetSkin(npcid, DH1aSkin);
		}
		FCNPC_SetPosition(npcid, DH1xyz);
	    FCNPC_SetHealth(npcid, 10000);
		FCNPC_SetInterior(npcid, DH1InteriorID);
		FCNPC_SetWeapon(npcid, SetDH1wepon);
		FCNPC_SetWeaponInfo(npcid, SetDH1wepon , DH1Load, DH1Shot, DH1Clip, DH1AIM);
		FCNPC_UseInfiniteAmmo(npcid, true);
		FCNPC_SetSurfingVehicle(npcid, DH1CAR);
		FCNPC_SetSurfingOffsets(npcid, 0, 0, DHAttack1InCarZ);
		if(FCNPC_IsAiming(npcid)) 	 {	FCNPC_StopAim(npcid);	 }
		if(FCNPC_IsAttacking(npcid)) {	FCNPC_StopAttack(npcid); }
	}
    return 1;
}
forward DH1AFKCheck(playerid);
public DH1AFKCheck(playerid)
{
 	if( IsPlayerNPC(playerid) == 0 )
	{
	    GetPlayerPos(playerid,DH1CheckPlayerIsAfk[0],DH1CheckPlayerIsAfk[1],DH1CheckPlayerIsAfk[2]); // Gets the player position and saves into their variables.
	}
	KillTimer(DH1AFKTime);
	DH1AFKTime = SetTimerEx("DH1AFKCheck2", 1000, false, "i", playerid);

	return 1;
}
forward DH1AFKCheck2(playerid);
public DH1AFKCheck2(playerid)
{

 	if( IsPlayerNPC(playerid) == 0 )
	{
	    if(IsPlayerInRangeOfPoint(playerid,1,DH1CheckPlayerIsAfk[0],DH1CheckPlayerIsAfk[1],DH1CheckPlayerIsAfk[2])) // If player is around the position (if player is at the same place)
	    {
	       DH1AFK[playerid] = 1; // Increment the AFK variable (for every second if player is at same location, increase the AFK variable by 1)
 		}
	    else
	    {
	       DH1AFK[playerid]= 0;
		}
	}
	KillTimer(DH1AFKTime);
	DH1AFKTime = SetTimerEx("DH1AFKCheck", 1000, false, "i", playerid);
	return 1;
}

