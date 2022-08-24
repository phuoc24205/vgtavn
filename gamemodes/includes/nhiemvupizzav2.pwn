#include <YSI\y_hooks>

CMD:layhang(playerid, params[])
{
	if(GetPVarInt(playerid, "LayHangPizza")) return SendClientMessage(playerid, COLOR_GREY, "Ban dang lay Hang Pizza Roi !");
	if(!IsPlayerInRangeOfPoint(playerid, 100.0, 2121.090,-1777.442,13.472)) return SendClientMessage(playerid, COLOR_GREY, "Ban khong trong khu vuc lay hang.");
	new Vehicle_ID = GetPlayerVehicleID(playerid);
	if(!XeLayHangPizza(GetPlayerVehicleID(playerid)))
	{
        SendClientMessageEx(playerid, COLOR_YELLOW, "Ban khong ngoi tren chiec xe lay hang Pizza.");
        return 1;
    }
	return 1;
}