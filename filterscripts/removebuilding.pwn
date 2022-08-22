#include <a_samp>
#pragma tabsize 0

#undef MAX_PLAYERS
#define MAX_PLAYERS 700


public OnFilterScriptInit() {

    print("RemoveBuilding Filterscript Initiated");
}

public OnPlayerConnect(playerid)
{
    RemoveBuildingForPlayer(playerid, 5536, 1866.3281, -1789.7813, 20.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 1524, 1837.1953, -1814.1875, 4.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1831.4688, -1798.2031, 12.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 1867.7188, -1798.2031, 12.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 5397, 1866.3281, -1789.7813, 20.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 5681, 1921.4844, -1778.9141, 18.5781, 0.25);
	return 1;
}
