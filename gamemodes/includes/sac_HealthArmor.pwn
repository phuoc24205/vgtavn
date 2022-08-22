#include <YSI\y_hooks>
timer sac_UpdateCheck[1000](playerid)
{
    new Float:sac_Healths,
    Float:sac_Armors;
    GetPlayerHealth(playerid,  sac_Healths);
    GetPlayerArmour(playerid, sac_Armors);
    if(sac_Healths != PlayerInfo[playerid][pHealths])
    {
        SendClientMessage(playerid, COLOR_WHITE, "ANTI HACK HEALTH");
    }
    if(sac_Armors != PlayerInfo[playerid][pArmors])
    {
        SendClientMessage(playerid, COLOR_WHITE, "ANTI HACK Armor");
    }
    return 1;
}
hook OnPlayerSpawn(playerid)
{
    repeat sac_UpdateCheck(playerid);
    return 1;
}
hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
    if(issuerid == INVALID_PLAYER_ID)
    {
        if(PlayerInfo[playerid][pHealths] - amount < 0) PlayerInfo[playerid][pHealths] = 0;
        else PlayerInfo[playerid][pHealths] -= amount;  
    }
    return 1;
}
