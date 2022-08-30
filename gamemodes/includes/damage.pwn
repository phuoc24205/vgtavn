#include <YSI\y_hooks>

hook OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid)
{
    new Float:health,
        Float:armour;
    switch(weaponid)
    {
        case 1: amount = 30;
        case 2: amount = 30;
        case 3: amount = 30;
        case 4: amount = 20;
        case 5: amount = 30;
        case 6: amount = 30;
        case 7: amount = 30;
        case 8: amount = 50;
        case 9: amount = 30;
        case 10: amount = 30;
        case 11: amount = 30;
        case 12: amount = 30;
        case 13: amount = 30;
        case 14: amount = 30;
        case 15: amount = 30;
        case 22: amount = 15;
        case 23: amount = 16;
        case 26: amount = 35;
        case 27: amount = 30;
        case 28: amount = 12;
        case 29: amount = 10;
        case 31: amount = 15;
        case 38: amount = 12;
        case 16: amount = 80;
        case 17: amount = 0;
        case 18: amount = 40;
        case 24: amount = 45;
        case 25: amount = 30;
        case 30: amount = 13;
        case 32: amount = 10;
        case 33: amount = 40;
        case 35: amount = 80;
        case 36: amount = 99;
        case 37: amount = 30;
        case 41: amount = 16;
        case 42: amount = 17;
    }
    new str[128];
    format(str, sizeof(str), "amount thuong %f", amount);
    SendClientMessage(playerid, COLOR_WHITE, str);
    if(CheckSung(weaponid) == true && GetGiapVatLi(damagedid) > 0) {
         amount = amount - (PlayerInfo[damagedid][pGiapVatLi] * amount / 100);
         SetArmorQuality(playerid, true);
    }
    else if(CheckSung(weaponid) == false && GetGiapPhep(damagedid) > 0) { 
        amount = amount - (PlayerInfo[damagedid][pGiapPhep] * amount / 100);
        SetArmorQuality(playerid, false);
    }
    format(str, sizeof(str), "amount co giap %f", amount);
    SendClientMessage(playerid, COLOR_WHITE, str);
    SendClientMessage(playerid, COLOR_WHITE, str);
    GetPlayerHealth(damagedid,health);
    GetPlayerArmour(damagedid,armour);
    armour = armour - amount;
	if(armour < 0.0) {
        health += armour;
        if(health <= 0.0) {
            health = 0.0;
        }
        armour = 0.0;
    }
    SetPlayerHealth(damagedid, health);
    SetPlayerArmour(damagedid, armour);
    GetPlayerHealth(damagedid, health);
	GetPlayerArmour(damagedid, armour);
    return 1;
}
stock CheckSung(weaponid)
{
    if(weaponid <= 15 || weaponid == 22 || weaponid == 23 || weaponid == 26 || weaponid == 27 || weaponid == 29 || weaponid == 31 || weaponid == 38)
    return true;
    else return false;
}
stock CheckArmor(armorid) // true : giap vat li || false : giap phep
{
    if(armorid == ITEM_GIAP || armorid == ITEM_GIAP2) return true;
    else return false;
}
stock SetArmorQuality(playerid, bool:loai)
{
    for(new i = 0; i < 6; i++)
    {
        if(CheckArmor(PlayerInfo[playerid][pInvArmor][i]) == loai && PlayerInfo[playerid][pInvArmor_Quality][i] >= 2) PlayerInfo[playerid][pInvArmor_Quality][i] -= 2;
    }
}
stock GetGiapVatLi(playerid)
{
    PlayerInfo[playerid][pGiapVatLi] = 0;
    for(new i = 0; i < 6; i++)
    {
        if(PlayerInfo[playerid][pInvArmor][i] == ITEM_GIAP) PlayerInfo[playerid][pGiapVatLi] += 5;
        else if(PlayerInfo[playerid][pInvArmor][i] == ITEM_GIAP2) PlayerInfo[playerid][pGiapVatLi] += 10;
    }
    return PlayerInfo[playerid][pGiapVatLi];
}
stock GetGiapPhep(playerid)
{
    PlayerInfo[playerid][pGiapPhep] = 0;
    for(new i = 0; i < 6; i++)
    {
        if(PlayerInfo[playerid][pInvArmor][i] == ITEM_GIAP1) PlayerInfo[playerid][pGiapPhep] += 5;
    }

    return PlayerInfo[playerid][pGiapPhep];
}
