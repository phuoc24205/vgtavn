task EMSUpdate[5000]()
{
	foreach(new i: Player)
	{
	    if(InsideTut{i} > 0)
	    {
		    if(gettime() - GetPVarInt(i, "pTutTime") > 20)
			{
				GameTextForPlayer(i, "~n~~n~~n~~n~~n~~n~~n~~n~~w~Press ~r~~k~~CONVERSATION_YES~~w~ to continue", 2000, 3);
			}
		}
	    if(GetPVarType(i, "Injured"))
	    {
			#if defined zombiemode
	        if(zombieevent == 1 && GetPVarType(i, "pZombieBit"))
			{
			    KillEMSQueue(i);
				ClearAnimations(i);
				MakeZombie(i);
			}
			#endif
	        if(GetPVarInt(i, "EMSAttempt") != 0)
			{

				new Float:health;
 				GetPlayerHealth(i,health);
				SetPlayerHealth(i, health-1);
				if(GetPVarInt(i, "EMSAttempt") == -1)
				{
					if(GetPlayerAnimationIndex(i) != 746) ClearAnimations(i), ApplyAnimation(i, "KNIFE", "KILL_Knife_Ped_Die", 4.0, 0, 1, 1, 1, 0, 1);
    				if(!GetPVarType(i, "StreamPrep") && !IsPlayerInRangeOfPoint(i, 3.0, GetPVarFloat(i,"MedicX"), GetPVarFloat(i,"MedicY"), GetPVarFloat(i,"MedicZ")) && !GetPVarInt(i, "OnStretcher"))
	    			{
	        			SendClientMessageEx(i, COLOR_WHITE, "You fell unconscious, you were immediately sent to the hospital.");
	        			KillEMSQueue(i);
						SpawnPlayer(i);
	    			}
					GameTextForPlayer(i, "~r~Injured~n~~w~/accept death or /service ems", 5000, 3);
				}
				if(GetPVarInt(i, "EMSAttempt") == 1)
				{
					if(GetPlayerAnimationIndex(i) != 746) ClearAnimations(i), ApplyAnimation(i, "KNIFE", "KILL_Knife_Ped_Die", 4.0, 0, 1, 1, 1, 0, 1);
	    			if(!GetPVarType(i, "StreamPrep") && !IsPlayerInRangeOfPoint(i, 3.0, GetPVarFloat(i,"MedicX"), GetPVarFloat(i,"MedicY"), GetPVarFloat(i,"MedicZ")) && !GetPVarInt(i, "OnStretcher"))
	    			{
	        			SendClientMessageEx(i, COLOR_WHITE, "You fell unconscious, you were immediately sent to the hospital.");
	        			KillEMSQueue(i);
						SpawnPlayer(i);
	    			}
					GameTextForPlayer(i, "~r~Injured~n~~w~Waiting for EMS to Arrive...", 5000, 3);
				}
				if(GetPVarInt(i, "EMSAttempt") == 2)
				{
	    			if(!GetPVarType(i, "StreamPrep") && !IsPlayerInRangeOfPoint(i, 3.0, GetPVarFloat(i,"MedicX"), GetPVarFloat(i,"MedicY"), GetPVarFloat(i,"MedicZ")) && !GetPVarInt(i, "OnStretcher"))
	    			{
	    			    SetPVarInt(i, "EMSWarns", GetPVarInt(i, "EMSWarns")+1);
	    			    if(GetPVarInt(i, "EMSWarns") == 2)
	    			    {
		        			SendClientMessageEx(i, COLOR_WHITE, "You fell unconscious, you were immediately sent to the hospital.");
		        			KillEMSQueue(i);
							SpawnPlayer(i);
							DeletePVar(i, "EMSWarns");
						}
	    			}
	    			GameTextForPlayer(i, "~g~Rescued~n~~w~Awaiting Treatment...", 5000, 3);
				}
				if(GetPVarInt(i, "EMSAttempt") == 3)
				{
	    			if(IsPlayerInAnyVehicle(i))
	    			{
	        			new ambmodel = GetPlayerVehicleID(i);
	        			if(IsAnAmbulance(ambmodel))
	        			{
	    					GameTextForPlayer(i, "~g~Rescued~n~~w~Waiting for EMS to take to Hospital...", 5000, 3);
						}
						else
						{
		    				SendClientMessageEx(i, COLOR_WHITE, "You fell unconscious due to no life support, you were immediately sent to the hospital.");
	        				KillEMSQueue(i);
							SpawnPlayer(i);
						}
					}
					else
					{
					    SetPVarInt(i, "EMSWarnst", GetPVarInt(i, "EMSWarnst")+1);
	    			    if(GetPVarInt(i, "EMSWarnst") == 2)
	    			    {
			    			SendClientMessageEx(i, COLOR_WHITE, "You fell out of the vehicle, you were immediately sent to the hospital.");
		        			KillEMSQueue(i);
							SpawnPlayer(i);
							DeletePVar(i, "EMSWarnst");
						}
					}
				}

				GetPlayerHealth(i, health);
				if(health <= 5)
				{
	    			SendClientMessageEx(i, COLOR_WHITE, "You fell unconscious, you were immediately sent to the hospital.");
	    			KillEMSQueue(i);
					SpawnPlayer(i);
				}
	        }
	    }
	}
}

CMD:loadpt(playerid, params[])
{
    if(IsAMedic(playerid))
	{
        if(IsPlayerInAnyVehicle(playerid))
		{
            SendClientMessageEx(playerid, COLOR_GREY, "   Cannot use this while you're in a car!");
            return 1;
        }

        new string[128], giveplayerid, seat;
        if(sscanf(params, "ud", giveplayerid, seat)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /loadpt [player] [seatid]");

        if(IsPlayerConnected(giveplayerid))
		{
            if(giveplayerid != INVALID_PLAYER_ID)
			{
                if(!(2 <= seat <= 3))
				{
                    SendClientMessageEx(playerid, COLOR_GRAD1, "The seat ID cannot be above 3 or below 2.");
                    return 1;
                }
                if(GetPVarInt(giveplayerid, "Injured") != 1)
				{
                    SendClientMessageEx(playerid, COLOR_GREY, "That patient not injured - you can't load them.");
                    return 1;
                }
                if(IsPlayerInAnyVehicle(giveplayerid))
				{
                    SendClientMessageEx(playerid, COLOR_GREY, "That patient is inside a car - you can't load them.");
                    return 1;
                }
                if (ProxDetectorS(8.0, playerid, giveplayerid))
				{
                    if(giveplayerid == playerid) { SendClientMessageEx(playerid, COLOR_GREY, "You cannot load yourself!"); return 1; }
                    if(PlayerInfo[giveplayerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "You can't use this command on jailed players.");
                    new carid = gLastCar[playerid];
                    if(IsAnAmbulance(carid))
					{
                        if(IsVehicleOccupied(carid, seat)) {
							SendClientMessageEx(playerid, COLOR_GREY, "That seat is occupied.");
							return 1;
						}
						if(IsPlayerInRangeOfVehicle(giveplayerid, carid, 10.0) && IsPlayerInRangeOfVehicle(playerid, carid, 10.0)) {
							format(string, sizeof(string), "* You were loaded by paramedic %s.", GetPlayerNameEx(playerid));
							SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* You loaded patient %s.", GetPlayerNameEx(giveplayerid));
							SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
							format(string, sizeof(string), "* %s loads %s in the ambulance.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
							ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
							SetPVarInt(giveplayerid, "EMSAttempt", 3);
							ClearAnimations(giveplayerid);
							IsPlayerEntering{giveplayerid} = true;
							PutPlayerInVehicle(giveplayerid,carid,seat);
							TogglePlayerControllable(giveplayerid, false);
						}
						else SendClientMessageEx(playerid, COLOR_GREY, "Both you and your patient must be near the ambulance.");
                    }
                    else
					{
                        SendClientMessageEx(playerid, COLOR_GRAD2, "Your last car needs to be an ambulance!");
                    }
                }
                else
				{
                    SendClientMessageEx(playerid, COLOR_GREY, " You're not close enough to the person or your car!");
                    return 1;
                }
            }
        }
        else
		{
            SendClientMessageEx(playerid, COLOR_GREY, "Nguoi choi khong hop le.");
            return 1;
        }
    }
    else
	{
		SendClientMessageEx(playerid, COLOR_GRAD2, "   You are not a medic!");
    }
    return 1;
}
CMD:movept(playerid, params[])
{
	if(IsAMedic(playerid))
	{
		new string[128], giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /movepatient [player]");

		if(IsPlayerConnected(giveplayerid))
		{
			if(GetPVarInt(giveplayerid,"Injured") == 1)
			{
				if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GRAD2, "You can't use this command while in a vehicle.");
				if(PlayerInfo[giveplayerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GRAD2, "You can't use this command on jailed players.");
				if(GetPVarInt(giveplayerid, "OnStretcher") == 1)
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "The person is already on a stretcher, you can't do this right now!");
					return 1;
				}

				new Float:mX, Float:mY, Float:mZ;
				GetPlayerPos(giveplayerid, mX, mY, mZ);
				if(!IsPlayerInRangeOfPoint(playerid, 5.0, mX, mY, mZ))
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "You have to be close to the patient to be able to move them!");
					return 1;
				}
				SendClientMessageEx(playerid, COLOR_GRAD2, "You have 30 seconds to move to another location or you can either press the '{AA3333}FIRE{BFC0C2}' button.");
				format(string, sizeof(string), "* You have been put on a stretcher by %s.", GetPlayerNameEx(playerid));
				SendClientMessageEx(giveplayerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* You have put %s on a stretcher, you may move them now.", GetPlayerNameEx(giveplayerid));
				SendClientMessageEx(playerid, COLOR_LIGHTBLUE, string);
				format(string, sizeof(string), "* %s puts %s on a stretcher, tightening the belts securely.", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);

				SetPVarInt(giveplayerid, "OnStretcher", 1);
				SetPVarInt(playerid, "TickEMSMove", SetTimerEx("MoveEMS", 30000, false, "d", playerid));
				SetPVarInt(playerid, "MovingStretcher", giveplayerid);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_GRAD2, "The person has to be injured in-order to move them!");
			}
		}
	}
	return 1;
}
