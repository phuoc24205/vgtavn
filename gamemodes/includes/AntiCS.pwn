#include <YSI\y_hooks>
IsACS(carid)
{
	new vehiclemodel = GetVehicleModel(carid);
	if(IsABoat(carid) || IsAPlane(carid)) return true;
	if(vehiclemodel == 578 || vehiclemodel == 554 || vehiclemodel == 543 || vehiclemodel == 478 || vehiclemodel == 406 || vehiclemodel == 422 || vehiclemodel == 470) return true;
	return false;
}
task AntiCS[1000]()
{
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i))
		{
			new cs_Vehicleid = GetPlayerSurfingVehicleID(i);
			if(cs_Vehicleid != INVALID_VEHICLE_ID)
			{
				new Float:Vx,Float:Vy,Float:Vz,Float:rtn;
				GetVehicleVelocity(GetPlayerSurfingVehicleID(i),Vx,Vy,Vz);
				rtn = floatsqroot(floatabs(floatpower(Vx + Vy + Vz,2)));
				if(!IsACS(cs_Vehicleid) && floatround(rtn*100*1.61,floatround_round) > MAX_SPEED_ANTICS)
				{
					 new Float:ac_Pos[3];
					 GetPlayerPos(i, ac_Pos[0], ac_Pos[1], ac_Pos[2]);
					 SetPlayerPos(i, ac_Pos[0], ac_Pos[1], ac_Pos[2]+3);
					 PlayAnimEx(i, "PED", "BIKE_fallR", 4.1, 0, 1, 1, 1, 0, 1);
					 SendClientMessageEx(i, COLOR_LIGHTRED, "Ban  bi truot chan");
				}
			}
		}
	}
	return 1;
}
hook OnGameModeInit()
{
	AntiCS();
	return 1;
}
