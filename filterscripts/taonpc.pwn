#define FILTERSCRIPT

#include <a_samp>

#tryinclude <FCNPC>
#tryinclude "FCNPC"
#tryinclude "../FCNPC"
#if !defined _FCNPC_included
	#error Add FCNPC.inc to your scripts directory
#endif
new npcid;
public OnFilterScriptInit()
{

	

	npcid = FCNPC_Create("NguoiDan45");
	FCNPC_Spawn(npcid, 299, 1591.7151,2315.9788,10.8418);

	return 1;
}
public OnPlayerSpawn(playerid)
{
	FCNPC_GoToPlayer(npcid, playerid, FCNPC_MOVE_TYPE_AUTO,  FCNPC_MOVE_SPEED_AUTO, false, 0.0, true, 0.0,  1.5, 250);
	return 1;
}

public OnFilterScriptExit()
{
	FCNPC_Destroy(npcid);
	return 1;
}