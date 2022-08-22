#include <a_samp>
#include <FCNPC>
//CA1***************************************************************************
#define pCA1xyzf -2062.5 ,-108.8 ,35.3 ,193.0
#define CA1pickupXYZ -2057.7, -113.2, 35.3 //I point for description near AI
#define CA1xyz -2062.5 ,-150.0 ,35.3 //Initial point
#define CA1facing 0.8
#define CA1InteriorID 0 // Initial indoor ID
new CA1dtimer=-1; //Timer
new CA1timer=-1; //Timer
new ReCA1timer=-1;
new StoneCA1timer=-1;

new CarAttack1; //The name of the AI object in the script
new CarDriver1;
#define CA1aSkin 121 //skin
#define CA1dSkin 122 //skin
new CA1MOVETimer = 1000; //Perform a move in a few seconds
#define CA1GotoBack 25 // If the preset moving range exceeds, it will return
#define CA1NOTICE 100 //Warning range
#define CA1NEAR 50 //shoot Range

#define CA1MAXHP 1000

new Float:CA1posx[MAX_PLAYERS],
	Float:CA1posy[MAX_PLAYERS],
Float:CA1posz[MAX_PLAYERS]; //For rebirth in place

new Text3D:CA1DriverHPdisplay3DLabel,
Text3D:CA1AttackName3DLabel,
Text3D:CA1DriverName3DLabel,
CA1pickup;

#define CA1DriverName "CA1" //AI head display status 1 name
#define CA1DriverNameColor -1 //AI head display status 1 name color white

#define CA1HPFull 0x9EC73DFF //AI displays HP GREEN above the head
#define CA1HPSome 0xFF9900FF //AI displays HP ORANGE above the head
#define CA1HPLow 0xAA3333FF //AI displays HP RED above the head
#define CA1HP1 "OOOOO"
#define CA1HP2 "OOOO-"
#define CA1HP3 "OOO--"
#define CA1HP4 "OO---"
#define CA1HP5 "O----"
#define CA1HP8 "-----"

#define CA1AttackName ".ca1" 			// AI head display status 1 name
#define CA1AttackNameIsMabi "[IsMabi]" // status 2 is paralyzed
#define CA1IsMabiColor 0xDABB3EFF 		//status 2 color YELLOW
#define SetCA1wepon WEAPON_SNIPER 		//Weapon
#define StoneCA1TIME 2000 				//like paralysis timer
#define RstStoneCA1Time 3000 	//anti keep paralysis
new CA1IsMabi[MAX_PLAYERS]=0; 	//is paralysis var
new CA1Load = 50; 				// bullet load time
new CA1Shot = 1000;				 // Rate of fire
new CA1Clip = 7;
new Float:CA1AIM = 0.2; 	// shooting accuracy is up to 1.0% 100% accuracy

new CA1AFK[MAX_PLAYERS];
new CA1AFKTime = -1;
new CA1checkSpawned[MAX_PLAYERS];
new Float:CA1CheckPlayerIsAfk[3];

new CA1StartMove[MAX_PLAYERS] = 0;

new CA1CAR; 			//CAR1 car
new CA1CARid = 605; 	//CAR1 car id
new CA1CARid2 = 462 ;
new CA1CARid3 = 571 ;
new CA1CARid4 =  568;
new CA1CARid5 =  539;
new CA1CARid6 =  473;
new CA1CARid7 =  488;
#define CA1SPEED 1*2
#define CarAttack1InCarZ 1      //The height of attack_ai outside the car
#define FCNPCPATH FCNPC_MOVE_PATHFINDING_AUTO

public OnFilterScriptInit()
{
//CA1***************************************************************************
	CarDriver1 = FCNPC_Create(CA1DriverName);
	SetCA1dSpawn(CarDriver1);
	FCNPC_Spawn(CarDriver1, CA1dSkin,CA1xyz);
	FCNPC_SetPosition(CarDriver1, CA1xyz);
	// show ai name and hp
	CA1DriverName3DLabel = Create3DTextLabel(CA1DriverName, CA1DriverNameColor, 0.0, 0.0, 0.0, CA1NOTICE, 0, 1);
	Attach3DTextLabelToPlayer(CA1DriverName3DLabel, CarDriver1, 0.0, 0.0, 0.45);

	CA1DriverHPdisplay3DLabel = Create3DTextLabel(CA1HP1, CA1HPFull, 0.0, 0.0, 0.0, CA1NOTICE, 0, 1);
	Attach3DTextLabelToPlayer(CA1DriverHPdisplay3DLabel, CarDriver1, 0.0, 0.0, 0.1); 


	CarAttack1 = FCNPC_Create(CA1AttackName);
	SetCA1aSpawn(CarAttack1);
	FCNPC_Spawn(CarAttack1, CA1aSkin,CA1xyz);
	FCNPC_SetPosition(CarAttack1, CA1xyz);
	// dont show ai name
	CA1AttackName3DLabel = Create3DTextLabel(CA1AttackName, CA1DriverNameColor, 0.0, 0.0, 0.0, CA1NOTICE,  0, 1);
	Attach3DTextLabelToPlayer(CA1AttackName3DLabel, CarAttack1, 0.0, 0.0, 0.45);
	Update3DTextLabelText(CA1AttackName3DLabel, 0xFFFFFF00, CA1AttackNameIsMabi);
	
	// attack_ai dont dead so IsInvulnerable
    FCNPC_IsInvulnerable(CarAttack1);

	//readme in game
	CA1pickup =  CreatePickup(1239, 2, CA1pickupXYZ,-1);

	// create a veh
	CA1CAR = CreateVehicle(CA1CARid,CA1xyz,  CA1facing, -1, -1, 0);
	SetVehicleHealth(CA1CAR, 10000);

	//set driver_ai in veh , attack_ai in veh outside
	FCNPC_PutInVehicle(CarDriver1, CA1CAR, 0);
	FCNPC_SetSurfingVehicle(CarAttack1, CA1CAR);
	FCNPC_SetSurfingOffsets(CarAttack1, 0, 0, CarAttack1InCarZ);

	return 1;
}
public OnFilterScriptExit()
{
//CA1***************************************************************************
	FCNPC_Stop(CarAttack1);
	FCNPC_Stop(CarDriver1);

	KillTimer(CA1timer);
	KillTimer(CA1dtimer);
	KillTimer(ReCA1timer);
	KillTimer(StoneCA1timer);
	FCNPC_Destroy(CarAttack1);
	FCNPC_Destroy(CarDriver1);

	Delete3DTextLabel(CA1DriverName3DLabel);
	Delete3DTextLabel(CA1DriverHPdisplay3DLabel);
	Delete3DTextLabel(CA1AttackName3DLabel);

	DestroyPickup(CA1pickup);
	DestroyVehicle(CA1CAR);

	KillTimer(CA1AFKTime);

	return 1;
}
public OnPlayerConnect(playerid)
{
//CA1***************************************************************************
	CA1checkSpawned[playerid]=0;
	SetPlayerColor(CarDriver1,0xFFFFFFFF);
	SetPlayerColor(CarAttack1,0xFFFFFF00);
	return 1;
}

public OnPlayerSpawn(playerid)
{
//CA1***************************************************************************
	CA1checkSpawned[playerid]=1;
	CA1AFK[playerid]=0;
	CA1AFKTime = SetTimerEx("CA1AFKCheck", 1000, false, "i", playerid); //check player is not afk
	return 1;
}
public OnPlayerDeath(playerid, killerid, reason)
{
//CA1***************************************************************************
	KillTimer(CA1AFKTime);
    if (killerid == CarAttack1)
    CA1checkSpawned[playerid]=0;
    
	return 1;
}

public FCNPC_OnSpawn(npcid)
{
//CA1***************************************************************************
	if (npcid == CarAttack1)
	{
		KillTimer(ReCA1timer);
	    FCNPC_SetPosition(npcid,  CA1posx[npcid],CA1posy[npcid],CA1posz[npcid]);
	}
	if (npcid == CarDriver1)
	{
		KillTimer(ReCA1timer);
	    FCNPC_SetPosition(CarDriver1,  CA1posx[npcid],CA1posy[npcid],CA1posz[npcid]);
	}

	return 1;
}
public FCNPC_OnTakeDamage(npcid, issuerid, Float:amount, weaponid, bodypart)
{
//CA1***************************************************************************
	if (npcid == CarDriver1)
	{
	    if (CA1StartMove[CarDriver1] == 0)  //if player attack driver_aia or veh by gun shoot
		{
		    CA1StartMove[CarDriver1] = 1;
			CA1dtimer = SetTimerEx("CA1Move", CA1MOVETimer, true, "i", npcid); //ai start run
			CA1HPUpdata(npcid);
			KillTimer(CA1timer);
		    CA1timer=SetTimerEx("CA1IsShoot", CA1Shot, true, "d", CarAttack1); // ai start attack player
		}
	    else CA1HPUpdata(npcid);
	}
	if (npcid == CarAttack1)    // Imitate the player being hit by weapons such as desert eagle or sniper
	{
		if ( (weaponid == 23 || weaponid == 24 || weaponid == 25|| weaponid == 34)&& FCNPC_IsSpawned(npcid))
  		{
  		    if (CA1IsMabi[npcid]==0)
  		    {
                CA1IsMabi[npcid]=1;
                StoneCA1timer =  SetTimerEx("StoneCA1Time", 100 , false, "d", npcid);
			}
		}
	}

	return 1;
}
public FCNPC_OnDeath(npcid, killerid, reason)
{
//CA1***************************************************************************
    if (npcid == CarDriver1)
	{
		KillTimer(CA1dtimer);
		CA1dtimer = SetTimerEx("SetCA1dSpawn", 1000 , false, "d", npcid);
		Update3DTextLabelText(CA1DriverHPdisplay3DLabel, CA1HPLow, CA1HP8); // update show driver_ai a hp
		FCNPC_GetPosition(npcid, CA1posx[npcid],CA1posy[npcid],CA1posz[npcid]); //ai Rebirth at the place of death
		CA1checkSpawned[killerid]=1;

		if(FCNPC_IsAiming(CarAttack1)) 	 {	FCNPC_StopAim(CarAttack1);	 }  //attack_ai stop attack
		if(FCNPC_IsAttacking(CarAttack1)) {	FCNPC_StopAttack(CarAttack1); }
	    FCNPC_SetHealth(CarAttack1,1000); //attack_ai no need dead
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

public FCNPC_OnVehicleEntryComplete(npcid, vehicleid, seatid)
{
	return 1;
}
public FCNPC_OnVehicleTakeDamage(npcid, issuerid, vehicleid, Float:amount, weaponid, Float:fX, Float:fY, Float:fZ)
{
	new Float:CA1dHP = FCNPC_GetHealth(CarDriver1);

	if (vehicleid == CA1CAR && npcid == CarDriver1) //if player attack driver_aia or veh by gun shoot
	{
 	    if (CA1StartMove[CarDriver1] == 0)
		{
		    CA1StartMove[CarDriver1] = 1;
			CA1dtimer=SetTimerEx("CA1Move", CA1MOVETimer, true, "i", npcid); //ai start run
			CA1HPUpdata(npcid);
			KillTimer(CA1timer);
		    CA1timer=SetTimerEx("CA1IsShoot", CA1Shot, true, "d", CarAttack1);//ai start attack player
		}
	    else CA1HPUpdata(npcid);

		switch( weaponid )          //Detect the weapon the player used to hit the vehicle,Give AI customized damage
		{
			case 0..15:
			{
				FCNPC_SetHealth(CarDriver1, CA1dHP-50);
			}
			case 22,23:
			{
				FCNPC_SetHealth(CarDriver1, CA1dHP-150);
			}
			case 24:
			{
				FCNPC_SetHealth(CarDriver1, CA1dHP-75);
			}
			case 25..32,38:
			{
				FCNPC_SetHealth(CarDriver1, CA1dHP-30);
			}
			case 33:
			{
				FCNPC_SetHealth(CarDriver1, CA1dHP-20);
			}
			case 34:
			{
				FCNPC_SetHealth(CarDriver1, CA1dHP-50);
			}
			case 51:
			{
				FCNPC_SetHealth(CarDriver1, CA1dHP-100);
			}
		}
		SetVehicleHealth(CA1CAR, 10000);        //i want ai a veh IsInvulnerable
		CA1dHP = FCNPC_GetHealth(CarDriver1);   //get ai a hp
		CA1HPUpdata(npcid);                     //update show ai a hp
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
//CA1***************************************************************************
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
	if(strcmp("/ca1", cmdtext, true) == 0)
	{
		SetPlayerPosFacing(playerid, pCA1xyzf);
		SetCameraBehindPlayer(playerid);
		return 1;
	}
	if(strcmp("/CA1CAR1", cmdtext, true) == 0)
	{
	    DestroyVehicle(CA1CAR);
        CA1CAR = CreateVehicle(CA1CARid,CA1xyz,  CA1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/CA1CAR2", cmdtext, true) == 0)
	{
	    DestroyVehicle(CA1CAR);
        CA1CAR = CreateVehicle(CA1CARid2,CA1xyz,  CA1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/CA1CAR3", cmdtext, true) == 0) 
	{
	    DestroyVehicle(CA1CAR);
        CA1CAR = CreateVehicle(CA1CARid3,CA1xyz,  CA1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/CA1CAR4", cmdtext, true) == 0) 
	{
	    DestroyVehicle(CA1CAR);
        CA1CAR = CreateVehicle(CA1CARid4,CA1xyz,  CA1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/CA1CAR5", cmdtext, true) == 0) 
	{
	    DestroyVehicle(CA1CAR);
        CA1CAR = CreateVehicle(CA1CARid5,CA1xyz,  CA1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/CA1CAR6", cmdtext, true) == 0)
	{
	    DestroyVehicle(CA1CAR);
        CA1CAR = CreateVehicle(CA1CARid6,CA1xyz,  CA1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/CA1CAR7", cmdtext, true) == 0) 
	{
	    DestroyVehicle(CA1CAR);
        CA1CAR = CreateVehicle(CA1CARid7,CA1xyz,  CA1facing, -1, -1, 0);
		return 1;
	}
	if(strcmp("/reca1car", cmdtext, true) == 0) 
	{
		SetVehicleToRespawn(CA1CAR);

		FCNPC_PutInVehicle(CarDriver1, CA1CAR, 0);
		FCNPC_SetSurfingVehicle(CarAttack1, CA1CAR);
		FCNPC_SetSurfingOffsets(CarAttack1, 0, 0, CarAttack1InCarZ);
		return 1;
	}

	if(strcmp("/CA1def", cmdtext, true) == 0)
	{
	    DestroyVehicle(CA1CAR);
        CA1CAR = CreateVehicle(CA1CARid,CA1xyz,  CA1facing, -1, -1, 0);
        
		KillTimer(CA1dtimer);

		KillTimer(CA1timer);
		KillTimer(ReCA1timer);
		KillTimer(StoneCA1timer);
		if(FCNPC_IsAiming(CarAttack1)) 	 {	FCNPC_StopAim(CarAttack1);	 }
		if(FCNPC_IsAttacking(CarAttack1)) {	FCNPC_StopAttack(CarAttack1); }

		FCNPC_Respawn(CarDriver1);
		FCNPC_PutInVehicle(CarDriver1, CA1CAR, 0);
		FCNPC_SetHealth(CarDriver1, CA1MAXHP);

        CA1StartMove[CarDriver1] = 0;
		FCNPC_Stop(CarDriver1);

		FCNPC_Respawn(CarAttack1);
		FCNPC_SetSurfingVehicle(CarAttack1, CA1CAR);
		FCNPC_SetSurfingOffsets(CarAttack1, 0, 0, CarAttack1InCarZ);

		return 1;
	}
	if(strcmp("/ca1a", cmdtext, true) == 0)
	{
		FCNPC_SetSurfingVehicle(CarAttack1, CA1CAR);
		FCNPC_SetSurfingOffsets(CarAttack1, 0, 0, CarAttack1InCarZ);
		return 1;
	}
	if(strcmp("/ca1aa", cmdtext, true) == 0)
	{
		FCNPC_StopSurfing(CarAttack1);
		return 1;
	}
	if(strcmp("/ca1cs", cmdtext, true) == 0)    //When you reloadfs ai does not attack you,And you are too lazy to rebirth and gain variables
	{
		CA1checkSpawned[playerid] = 1;
		return 1;
	}


 	return 0;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
//CA1***************************************************************************
    if(pickupid == CA1pickup)
    {
		SendClientMessage(playerid, -1,"[CarAttack1]_________________________________________________");
		SendClientMessage(playerid, -1,"Note: You must shoot the vehicle to cause damage (explosion damage is still invalid)");
		SendClientMessage(playerid, -1,"{C6AEC7}If the AI's 'vehicle' is shot, it will run, if it is out of range, it will return to its position until death.");
		SendClientMessage(playerid, -1,"{C6AEC7}If the vehicle is moving and the 'attack_ai' is shot, it will begin to attack the player until the driver_ai is dead.");
		SendClientMessage(playerid, -1,"{AFAFAF} The 'attack_ai' will not die and can be paralyzed for a short time with weapons such as Deagle.");
		SendClientMessage(playerid, -1,"/CA1def¡@initialization¡@/CA1car1 /CA1car2 /CA1car3 change veh ");
    }
    return 1;
}

//CA1***************************************************************************
stock CA1HPUpdata(npcid)
{
	new Float: CA1HP = FCNPC_GetHealth(npcid);
	if (CA1MAXHP*1.0 > CA1HP >= CA1MAXHP*0.8) Update3DTextLabelText(CA1DriverHPdisplay3DLabel, CA1HPFull, CA1HP1);
	else if (CA1MAXHP*0.8 > CA1HP >= CA1MAXHP*0.6) Update3DTextLabelText(CA1DriverHPdisplay3DLabel, CA1HPFull, CA1HP2);
	else if (CA1MAXHP*0.6 > CA1HP >= CA1MAXHP*0.4) Update3DTextLabelText(CA1DriverHPdisplay3DLabel, CA1HPSome, CA1HP3);
	else if (CA1MAXHP*0.4 > CA1HP >= CA1MAXHP*0.2) Update3DTextLabelText(CA1DriverHPdisplay3DLabel, CA1HPSome, CA1HP4);
	else Update3DTextLabelText(CA1DriverHPdisplay3DLabel, CA1HPLow, CA1HP5);

}

forward CA1Move(npcid,playerid);
public CA1Move(npcid,playerid)
{
	if (npcid == CarDriver1)
	{
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
			if (IsPlayerInRangeOfPlayer(i,npcid,CA1NOTICE) && IsPlayerNPC(i) == 0 ) //If the player is in the AI's alert range
			{
				if ( !IsPlayerInRangeOfPoint(CarDriver1,CA1NOTICE,CA1xyz)) //If the AI is not in his alert range
				{   
			 		FCNPC_GoTo(CarDriver1, CA1xyz, .mode = FCNPC_MOVE_MODE_NONE,.speed = CA1SPEED,.radius = 5, .set_angle = true);//Will move to the origin
				}
				else
				{
				 	if( IsPlayerNPC(i) == 0 && !FCNPC_IsDead(CarDriver1) ) //If the AI is not in his alert range
					{
					    if (! IsPlayerInRangeOfPoint(CarDriver1,CA1GotoBack,CA1xyz) ) //If the AI runs out of the movable range
					    FCNPC_GoTo(CarDriver1, CA1xyz, .mode = FCNPC_MOVE_MODE_NONE,.speed = CA1SPEED+1,.radius = 5, .set_angle = true);//Will move to the origin
					    else        //else This is moving randomly within its own range
					    {
							new Float:x, Float:y, Float:z;
							FCNPC_GetPosition(CarDriver1,x, y, z);
							switch( random(6) )
							{
								case 0:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x,			y+17	,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = CA1SPEED,.radius = 1, .set_angle = true);}
								case 1:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x+15,		y		,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = CA1SPEED,.radius = 1, .set_angle = true);}
								case 2:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x+15.2,	y+1		,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = CA1SPEED,.radius = 1, .set_angle = true);}
								case 3:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x,			y-15.8	,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = CA1SPEED,.radius = 1, .set_angle = true);}
								case 4:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x-15.5,	y		,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = CA1SPEED,.radius = 1, .set_angle = true);}
								case 5:{if (!IsPlayerInRangeOfPoint(npcid,1, x+11,y,z))FCNPC_GoTo(npcid, x-15,		y-14	,z,		.mode = FCNPC_MOVE_MODE_NONE,.speed = CA1SPEED,.radius = 1, .set_angle = true);}
							}
						}
					}
				}
			}
       }//for
	}
}
forward CA1IsShoot(npcid,playerid);
public CA1IsShoot(npcid,playerid)
{
	if (npcid == CarAttack1 )
	{
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
   			if (IsPlayerInRangeOfPlayer(i,npcid,CA1NEAR) && IsPlayerNPC(i) == 0 && CA1StartMove[CarDriver1] == 1 && !FCNPC_IsDead(CarDriver1) && CA1checkSpawned[i] == 1 )//If the player is near the attack_ai and the driver_ai driving is moving and alive and playe is spawned
			{
			    if ( IsPlayerNPC(i) == 0 && CA1AFK[i] == 0)     //if player is not AFK
				{
					new Float:px, Float: py, Float:pz;
					GetPlayerPos(i,px,py,pz);
					FCNPC_AimAt(npcid ,px,py,pz, .shoot = true ,.set_angle =true); //attack_ai is shooting player
				}
				else if ( IsPlayerNPC(i) == 0 && CA1AFK[i] == 1 )       //if player is AFK
				{
					FCNPC_StopAim(npcid);                               // stop shoot afking player
				}
			}
			else if (IsPlayerInRangeOfPlayer(i,npcid,CA1NEAR) && IsPlayerNPC(i) == 0 && CA1StartMove[CarDriver1] == 1 && FCNPC_IsDead(CarDriver1) && CA1checkSpawned[i] == 1 )  //If the player is near the attack_ai and the driver_ai driving is moving and dead , the attack_ai will stop
			{
				if(FCNPC_IsAiming(npcid)) 	 {	FCNPC_StopAim(npcid);	 }
				if(FCNPC_IsAttacking(npcid)) {	FCNPC_StopAttack(npcid); }
			}
			else if (IsPlayerInRangeOfPlayer(i,npcid,CA1NEAR) && IsPlayerNPC(i) == 0 && CA1StartMove[CarDriver1] == 0 && FCNPC_IsDead(CarDriver1) && CA1checkSpawned[i] == 1 )  //If the player is near the attack_ai and the driver_ai not moving and dead , the attack_ai will stop
			{
				if(FCNPC_IsAiming(npcid)) 	 {	FCNPC_StopAim(npcid);	 }
				if(FCNPC_IsAttacking(npcid)) {	FCNPC_StopAttack(npcid); }
			}
        }//for
	}
}

forward StoneCA1Time(npcid);
public StoneCA1Time(npcid)
{
	KillTimer(CA1timer);
    FCNPC_StopAim(npcid);                                                   //attack_ai stop shoot
    Update3DTextLabelText(CA1AttackName3DLabel, CA1IsMabiColor, CA1AttackNameIsMabi);   //show attack_ai is paralyzed
    SetTimerEx("StoneCA1TimeEnd", StoneCA1TIME, false, "i", npcid); //paralyzed timer
    SetTimerEx("ReSetStoneCA1Time", RstStoneCA1Time, false, "i", npcid); //when attack_ai is paralyzed, No longer numb within three seconds
}
forward StoneCA1TimeEnd(npcid);
public StoneCA1TimeEnd(npcid)
{
    Update3DTextLabelText(CA1DriverName3DLabel, CA1DriverNameColor, CA1DriverName);
	Update3DTextLabelText(CA1AttackName3DLabel, 0xFFFFFF00, CA1AttackNameIsMabi);   //show attack_ai name

    CA1timer=SetTimerEx("CA1IsShoot", CA1Shot, true, "d", CarAttack1);  //attack_ai start shoot
}
forward ReSetStoneCA1Time(npcid);
public ReSetStoneCA1Time(npcid)
{
    CA1IsMabi[npcid] = 0;                                           //attack_ai can paralyzed again
}
forward SetCA1dSpawn(npcid);
public SetCA1dSpawn(npcid)
{
	if(npcid == CarDriver1)
	{
		if(!FCNPC_IsSpawned(npcid))
		{
			FCNPC_Spawn(npcid, CA1dSkin,CA1xyz);
		}
		else
		{
	    	if(FCNPC_IsDead(npcid))
			{
		    	FCNPC_Respawn(npcid);
		    }
			FCNPC_SetSkin(npcid, CA1dSkin);
		}
		FCNPC_SetPosition(npcid, CA1posx[npcid],CA1posy[npcid],CA1posz[npcid]);
	    FCNPC_SetHealth(npcid, CA1MAXHP);
		FCNPC_SetInterior(npcid, CA1InteriorID);
		CA1StartMove[npcid] = 0;

		FCNPC_PutInVehicle(npcid, CA1CAR, 0);
		Update3DTextLabelText(CA1DriverHPdisplay3DLabel, CA1HPFull, CA1HP1);

		if(FCNPC_IsAiming(CarAttack1)) 	 {	FCNPC_StopAim(CarAttack1);	 }
		if(FCNPC_IsAttacking(CarAttack1)) {	FCNPC_StopAttack(CarAttack1); }
        FCNPC_SetHealth(CarAttack1, 10000);
		SetVehicleHealth(CA1CAR, 10000);

	}
    return 1;
}
forward SetCA1aSpawn(npcid);
public SetCA1aSpawn(npcid)
{
	if(npcid == CarAttack1) {
		if(!FCNPC_IsSpawned(npcid)) {
				FCNPC_Spawn(npcid, CA1aSkin,CA1xyz);
		} else {
	    	if(FCNPC_IsDead(npcid)) {
		    	FCNPC_Respawn(npcid);
		    }
			FCNPC_SetSkin(npcid, CA1aSkin);
		}
		FCNPC_SetPosition(npcid, CA1posx[npcid],CA1posy[npcid],CA1posz[npcid]);
	    FCNPC_SetHealth(npcid, 10000);
		FCNPC_SetInterior(npcid, CA1InteriorID);
		FCNPC_SetWeapon(npcid, SetCA1wepon);
		FCNPC_SetWeaponInfo(npcid, SetCA1wepon , CA1Load, CA1Shot, CA1Clip, CA1AIM);
		FCNPC_UseInfiniteAmmo(npcid, true);
		FCNPC_SetSurfingVehicle(npcid, CA1CAR);
		FCNPC_SetSurfingOffsets(npcid, 0, 0, CarAttack1InCarZ);
		if(FCNPC_IsAiming(npcid)) 	 {	FCNPC_StopAim(npcid);	 }
		if(FCNPC_IsAttacking(npcid)) {	FCNPC_StopAttack(npcid); }
	}
    return 1;
}
forward CA1AFKCheck(playerid);
public CA1AFKCheck(playerid)
{
 	if( IsPlayerNPC(playerid) == 0 )
	{
	    GetPlayerPos(playerid,CA1CheckPlayerIsAfk[0],CA1CheckPlayerIsAfk[1],CA1CheckPlayerIsAfk[2]); // Gets the player position and saves into their variables.
	}
	KillTimer(CA1AFKTime);
	CA1AFKTime = SetTimerEx("CA1AFKCheck2", 1000, false, "i", playerid);

	return 1;
}
forward CA1AFKCheck2(playerid);
public CA1AFKCheck2(playerid)
{

 	if( IsPlayerNPC(playerid) == 0 )
	{
	    if(IsPlayerInRangeOfPoint(playerid,1,CA1CheckPlayerIsAfk[0],CA1CheckPlayerIsAfk[1],CA1CheckPlayerIsAfk[2])) // If player is around the position (if player is at the same place)
	    {
	       CA1AFK[playerid] = 1; // Increment the AFK variable (for every second if player is at same location, increase the AFK variable by 1)
 		}
	    else
	    {
	       CA1AFK[playerid]= 0;
		}
	}
	KillTimer(CA1AFKTime);
	CA1AFKTime = SetTimerEx("CA1AFKCheck", 1000, false, "i", playerid);
	return 1;
}
