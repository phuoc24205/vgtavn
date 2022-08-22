/* MADE BY BRAUF OF SA-MP FORUMS */

#include <a_samp>
#include <zcmd> // replace this with #include <izcmd>

#define MAX_FARE_ACTORS 999

new Text3D:PassengerLabel[MAX_VEHICLES];

new bool:DestinationCheckpointCheck[MAX_PLAYERS];

new Float:gFareCollection[][3] = 
{ 
	{1958.3783,1343.1572,15.3746},
	{2199.6531,1393.3678,10.8203},
	{2483.5977,1222.0825,10.8203},
	{2637.2712,1129.2743,11.1797},
	{2000.0106,1521.1111,17.0625},
	{2024.8190,1917.9425,12.3386},
	{2261.9048,2035.9547,10.8203},
	{2262.0986,2398.6572,10.8203},
	{2244.2566,2523.7280,10.8203},
	{2335.3228,2786.4478,10.8203},
	{2150.0186,2734.2297,11.1763},
	{2158.0811,2797.5488,10.8203},
	{1969.8301,2722.8564,10.8203},
	{1652.0555,2709.4072,10.8265},
	{1564.0052,2756.9463,10.8203},
	{1271.5452,2554.0227,10.8203},
	{1441.5894,2567.9099,10.8203},
	{1480.6473,2213.5718,11.0234},
	{1400.5906,2225.6960,11.0234},
	{1598.8419,2221.5676,11.0625},
	{1318.7759,1251.3580,10.8203},
	{1558.0731,1007.8292,10.8125},
	{1705.2347,1025.6808,10.8203}
};

new Float:gFareDestination[][3] = 
{
	{-857.0551,1536.6832,22.5870}, 
	{817.3494,856.5039,12.7891},
	{116.9315,1110.1823,13.6094},
	{-18.8529,1176.0159,19.5634},
	{-315.0575,1774.0636,43.6406}
};


new fare_actor[MAX_FARE_ACTORS];

public OnFilterScriptInit()
{

	for(new id; id < MAX_FARE_ACTORS; id++)
	{
		fare_actor[id] = CreateActor(id, 0.0, 0.0, 0.0, 1.0);
		ApplyActorAnimation(fare_actor[id], "CAR", "Sit_relaxed", 0, 0, 0, 0, 0, 0);
		printf("Created actor %i", fare_actor[id]);
	}

	return 1;
}

public OnFilterScriptExit()
{
	for(new id; id < MAX_FARE_ACTORS; id++)
	{
		DestroyActor(fare_actor[id]);
	}	

	return 1;
}



#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))


#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))


#define PRESSING(%0,%1) \
	(%0 & (%1))

//new ActorFollowDriverTimer[MAX_PLAYERS];

new IsPlayerTaxiDriver[MAX_PLAYERS] = false;

new IsPlayerDoingAFare[MAX_PLAYERS] = false;

new TotalFaresEarnedInSession[MAX_PLAYERS] = 0;

new TotalFaresDoneInSession[MAX_PLAYERS] = 0;

new TotalAngryClientsInSession[MAX_PLAYERS] = 0;

new MoneyEarntInThisFare[MAX_PLAYERS] = 0;

new HasClientBeenAlerted[MAX_PLAYERS] = false;


CMD:taxi(playerid, params[])
{
	if(IsPlayerInTaxi(playerid))
	{
		if(IsPlayerTaxiDriver[playerid])
		{
			new TaxiSessionMessage[364];

			IsPlayerTaxiDriver[playerid] = false; // player is no longer a taxi driver

			format(TaxiSessionMessage, sizeof(TaxiSessionMessage), "{98FF98} [TAXI]:{FFFFFF} Your current taxi session has ended and you have earnt a total amount of %i with %i unhappy customers out of %i customers.", TotalFaresEarnedInSession[playerid], TotalAngryClientsInSession[playerid], TotalFaresDoneInSession[playerid]);
			SendClientMessage(playerid, -1, TaxiSessionMessage);

			return 1;
		}

		if(!IsPlayerTaxiDriver[playerid])
		{
			HasClientBeenAlerted[playerid] = false;

			IsPlayerTaxiDriver[playerid] = true; // player is a taxi driver

			TotalFaresEarnedInSession[playerid] = 0; // reset the money earnt from the last session

			MoneyEarntInThisFare[playerid] = 0;

			TotalFaresDoneInSession[playerid] = 0;

			TotalAngryClientsInSession[playerid] = 0;

			IsPlayerDoingAFare[playerid] = false;

			SendClientMessage(playerid, -1, "{98FF98} [TAXI]:{FFFFFF} You are now a taxi driver.");
			SendClientMessage(playerid, -1, "{98FF98} [TAXI]:{FFFFFF} Press Y to pick-up a fare. After you complete your fare, press Y again.");
		
			return 1;
		}
	}

	SendClientMessage(playerid, -1, "{98FF98} [TAXI]:{FFFFFF} You are not in a taxi.");

	return 1;

}


CMD:taxistats(playerid, params[])
{
	new TaxiSessionMessage[364];
	format(TaxiSessionMessage, sizeof(TaxiSessionMessage), "{98FF98} [TAXI]:{FFFFFF} You have earnt a total amount of %i with %i unhappy customers out of %i customers.", TotalFaresEarnedInSession[playerid], TotalAngryClientsInSession[playerid], TotalFaresDoneInSession[playerid]);
	SendClientMessage(playerid, -1, TaxiSessionMessage);


}


public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT) // player gets out of car
    {
    	if(IsPlayerTaxiDriver[playerid])
    	{
    		SetActorPos(fare_actor[playerid], 0, 0, 0);

    		HasClientBeenAlerted[playerid] = false;
    		IsPlayerTaxiDriver[playerid] = false;
    		IsPlayerDoingAFare[playerid] = false;
    		DestinationCheckpointCheck[playerid] = false;

    		DisablePlayerCheckpoint(playerid);
			new v_id = GetPlayerVehicleID(playerid);
			Delete3DTextLabel(PassengerLabel[v_id]);

    		SendClientMessage(playerid, -1, "{98FF98} [TAXI]:{FFFFFF} You are no longer a taxi driver since you have left the vehicle.");
    		return 1;
    	}

    	new v_id = GetPlayerVehicleID(playerid);
		Delete3DTextLabel(PassengerLabel[v_id]);

    	return 1;
    }
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PRESSED(KEY_YES))
	{
		if(IsPlayerTaxiDriver[playerid] && !IsPlayerDoingAFare[playerid])
		{
			SendClientMessage(playerid, -1, "{98FF98} [TAXI]:{FFFFFF} We have found you a fare, pelase collect the client.");
			IsPlayerDoingAFare[playerid] = true;
			printf("actor_fare for id: %i is actor_fare[%i]", playerid, playerid);


			new rand_actor_spawn = random(sizeof(gFareCollection));
			SetActorPos(fare_actor[playerid], gFareCollection[rand_actor_spawn][0], gFareCollection[rand_actor_spawn][1], gFareCollection[rand_actor_spawn][2]);
			
			ApplyActorAnimation(fare_actor[playerid], "CAR", "Sit_relaxed", 4.1, 0, 0, 0, 0, 0);
			
			new Float:actor_x, Float:actor_y, Float:actor_z;
			GetActorPos(fare_actor[playerid], Float:actor_x, Float:actor_y, Float:actor_z);
			SetPlayerCheckpoint(playerid, Float:actor_x, Float:actor_y, Float:actor_z, 2);

			SendClientMessage(playerid, -1, "{98FF98} [TAXI]:{FFFFFF} When you are near your client, press H [horn] to alert them you are here.");
			return 1;
		}
		return 1;
	}

	if(IsPlayerTaxiDriver[playerid] && IsPlayerDoingAFare[playerid] && !HasClientBeenAlerted[playerid])
	{
		if((newkeys & (KEY_CROUCH)) == (KEY_CROUCH))
		{
			new Float:actor_x, Float:actor_y, Float:actor_z;
			GetActorPos(fare_actor[playerid], Float:actor_x, Float:actor_y, Float:actor_z);

			new Float:player_x, Float:player_y, Float:player_z;
			GetPlayerPos(playerid, Float:player_x, Float:player_y, Float:player_z);
			if(IsPlayerInRangeOfPoint(playerid, Float:5.0, Float:actor_x, Float:actor_y, Float:actor_z))
			{
				HasClientBeenAlerted[playerid] = true;
				SendClientMessage(playerid, -1, "{98FF98} [TAXI]:{FFFFFF} The client has been alerted, please wait for them to enter your vehicle.");
				ApplyActorAnimation(fare_actor[playerid], "CAR", "Sit_relaxed", 2.3, 0, 0, 0, 1, 5000000);
				SetActorPos(fare_actor[playerid], Float:player_x, Float:player_y-0.7, Float:player_z);

				//ActorFollowDriverTimer[playerid] = SetTimerEx("ActorInPlayersCar", 250, true, "i", playerid);

				SendClientMessage(playerid, -1, "");
				

				new rand_actor_destination = random(sizeof(gFareDestination));
				SetPlayerCheckpoint(playerid, gFareDestination[rand_actor_destination][0], gFareDestination[rand_actor_destination][1], gFareDestination[rand_actor_destination][2], 3);
				DestinationCheckpointCheck[playerid] = true;
				SetActorPos(fare_actor[playerid], 0, 0, 0);
				new v_id = GetPlayerVehicleID(playerid);
				PassengerLabel[v_id] = Create3DTextLabel("Passenger", 0xFFFFF0,  0.0, 0.0, 0.0, 50.0, 0, 1);
				Attach3DTextLabelToVehicle(PassengerLabel[v_id], v_id, 0.0, -0.7, 1);
				return 1;
			}
			print("horn");
			return 1;
		}
	}
	return 1;
}


public OnPlayerEnterCheckpoint(playerid)
{
	if(DestinationCheckpointCheck[playerid])
	{
		new Float:vhealth;
    	new veh = GetPlayerVehicleID(playerid);
    	GetVehicleHealth(veh, vhealth);

    	if(veh > 999)
    	{
    		TotalFaresDoneInSession[playerid] += 1;
    		MoneyEarntInThisFare[playerid] = randomEx(250, 650);
    		GivePlayerMoney(playerid, MoneyEarntInThisFare[playerid]);
    	}

    	if(veh > 640 && veh < 999)
    	{
    		TotalFaresDoneInSession[playerid] += 1;
    		MoneyEarntInThisFare[playerid] = randomEx(244, 540);
    		GivePlayerMoney(playerid, MoneyEarntInThisFare[playerid]);
    	}

    	if(veh > 350 && veh < 640)
    	{
    		TotalFaresDoneInSession[playerid] += 1;
    		MoneyEarntInThisFare[playerid] = randomEx(125, 366);
    		GivePlayerMoney(playerid, MoneyEarntInThisFare[playerid]);

    		TotalAngryClientsInSession[playerid] += 1;
    	}

    	if(veh > 0 && veh < 350)
    	{
    		TotalFaresDoneInSession[playerid] += 1;
    		MoneyEarntInThisFare[playerid] = randomEx(99, 233);
    		GivePlayerMoney(playerid, MoneyEarntInThisFare[playerid]);

    		TotalAngryClientsInSession[playerid] += 1;
    	}

    	else
    	{
    		MoneyEarntInThisFare[playerid] = randomEx(150, 600);
    		GivePlayerMoney(playerid, MoneyEarntInThisFare[playerid]);
    	}

    	IsPlayerDoingAFare[playerid] = false;

		DestinationCheckpointCheck[playerid] = false;

		HasClientBeenAlerted[playerid] = false;

		TotalFaresEarnedInSession[playerid] = TotalFaresEarnedInSession[playerid] + MoneyEarntInThisFare[playerid];

		TotalFaresDoneInSession[playerid] += 1;

		DisablePlayerCheckpoint(playerid);

		new v_id = GetPlayerVehicleID(playerid);
		Delete3DTextLabel(PassengerLabel[v_id]);

		
		new TaxiDoneMessage[144];
		format(TaxiDoneMessage, sizeof(TaxiDoneMessage), "{98FF98} [TAXI]:{FFFFFF} You have earnt a amount of $%i for this fare.", MoneyEarntInThisFare[playerid]); 
		SendClientMessage(playerid, -1, TaxiDoneMessage);

		return 1;
	}

	return 1;
}
/*forward ActorInPlayersCar(playerid);
public ActorInPlayersCar(playerid)
{
	if(IsPlayerDoingAFare[playerid] && HasClientBeenAlerted[playerid])
	{
		new Float:player_x, Float:player_y, Float:player_z;
		GetPlayerPos(playerid, Float:player_x, Float:player_y, Float:player_z);
		//SetActorPos(fare_actor[playerid], Float:player_x, Float:player_y-0.7, Float:player_z);
		return 1;
	}
	else
	{
		SetActorPos(fare_actor[playerid], 0, 0, 0);
		KillTimer(ActorFollowDriverTimer[playerid]);
	}

	return 1;
}*/


IsPlayerInTaxi(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid)) return false;
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) return false;
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 420 || 438 && GetPlayerVehicleSeat(playerid) == 0) return true; 
	return true;
}

randomEx(min, max)
{    
    //Credits to y_less    
    new rand = random(max-min)+min;    
    return rand;
}