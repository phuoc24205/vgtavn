#include <MenuStore>

stock GetWeaponItemFromModel(modelid)
{
    new idweapon;
    switch(modelid)
    {
        case 331: idweapon = 1; // Brass Knuckles
        case 333: idweapon = 2; // Golf Club
        case 334: idweapon = 3; // Nightstick
        case 335: idweapon = 4; // Knife
        case 336: idweapon = 5; // Baseball Bat
        case 337: idweapon = 6; // Shovel
        case 338: idweapon = 7; // Pool Cue
        case 339: idweapon = 8; // Katana
        case 341: idweapon = 9; // Chainsaw
        case 321: idweapon = 10; // Double-ended Dildo
        case 325: idweapon = 14; // Flowers
        case 326: idweapon = 15; // Cane
        case 342: idweapon = 16; // Grenade
        case 343: idweapon = 17; // Tear Gas
        case 344: idweapon = 18; // Molotov Cocktail
        case 346: idweapon = 22; // 9mm
        case 347: idweapon = 23; // Silenced 9mm
        case 348: idweapon = 32400; // Desert Eagle
        case 349: idweapon = 32500; // Shotgun
        case 350: idweapon = 26; // Sawnoff
        case 351: idweapon = 32700; // Combat Shotgun
        case 352: idweapon = 32800; // Micro SMG/Uzi
        case 353: idweapon = 32900; // MP5
        case 355: idweapon = 33000; // AK-47
        case 356: idweapon = 33100; // M4
        case 372: idweapon = 32; // Tec-9
        case 357: idweapon = 33300; // Country Rifle
        case 358: idweapon = 33400; // Sniper Rifle
        case 359: idweapon = 35; // RPG
        case 360: idweapon = 36; // HS Rocket
        case 361: idweapon = 37; // Flamethrower
        case 362: idweapon = 38; // Minigun
        case 363: idweapon = 39;// Satchel Charge + Detonator
        case 365: idweapon = 41; // Spraycan
        case 366: idweapon = 42; // Fire Extinguisher
        case 367: idweapon = 43; // Camera
    }
    return idweapon;
}
Store:Weapon_Shop(playerid, response, itemid, modelid, price, level, amount, itemname[])
{
    if(!response)
        return true;

    if(PlayerInfo[playerid][pMats] < price) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong du vat lieu de che tao");
    if(PlayerInfo[playerid][pArmsSkill] < level) return SendClientMessageEx(playerid, COLOR_RED, "Ki nang che sung cua ban khong du");
    SendClientMessageEx(playerid, COLOR_RED, "Che sung thanh cong hay kiem tra tui do");
    AddItem(playerid, GetWeaponItemFromModel(modelid), amount);
    return true;
}
CMD:banvukhi(playerid, params[])
{
    if(GetPVarInt(playerid, "IsInArena") >= 0) {
        SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the lam dieu nay ngay bay gio!");
        return 1;
    }
   	if(GetPVarInt(playerid, "EventToken") != 0)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay trong khi ban dang o trong su kien.");
		return 1;
	}
    if(PlayerInfo[playerid][pJob] != 9 && PlayerInfo[playerid][pJob2] != 9) {
        SendClientMessageEx(playerid,COLOR_GREY,"Ban khong phai la Nguoi che sung!");
        return 1;
    }
    if(WatchingTV[playerid] != 0) {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang xem TV!");
        return 1;
    }
    /*if(PlayerInfo[playerid][pScrewdriver] == 0) {
        SendClientMessageEx(playerid,COLOR_GREY,"Ban can phai co tua vit tu cong viec Tho Thu Cong de che tao vu khi!");
        return 1;
    }*/
    if(PlayerInfo[playerid][pJailTime] > 0) {
        SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the che tao sung khi dang bi giam");
        return 1;
    }
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu do ngay bay gio");

    if(GetPVarInt(playerid, "ArmsTimer") > 0) {
        format(string, sizeof(string), "Ban can phai doi %d giay nua truoc khi che tao them vu khi.", GetPVarInt(playerid, "ArmsTimer"));
        SendClientMessageEx(playerid,COLOR_GREY,string);
        return 1;
    }
    if(PlayerInfo[playerid][pHospital] == 1 || PlayerInfo[playerid][pHospital] == 2 || PlayerInfo[playerid][pHospital] == 3 || PlayerInfo[playerid][pHospital] == 4 || PlayerInfo[playerid][pHospital] == 5) {
        SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the che tao vu khi khi dang o trong benh vien.");
        return 1;
    }
    MenuStore_AddItem(playerid, 1, 348, "Desert Eagle", 500, 201, "KI NANG CHE SUNG : ~r~3");
    MenuStore_AddItem(playerid, 2, 349, "Shotgun", 500, 101, "KI NANG CHE SUNG : ~r~2");
    MenuStore_AddItem(playerid, 3, 351, "Combat Shotgun", 401, 500, "KI NANG CHE SUNG : ~r~5");
    MenuStore_AddItem(playerid, 4, 353, "MP5", 500, 201, "KI NANG CHE SUNG : ~r~3");
    MenuStore_AddItem(playerid, 5, 355, "AK-47", 500, 401, "KI NANG CHE SUNG : ~r~5");
    MenuStore_AddItem(playerid, 6, 356, "M4", 500, 401, "KI NANG CHE SUNG : ~r~5");
    MenuStore_AddItem(playerid, 7, 357, "Country Rifle", 201, 500, "KI NANG CHE SUNG : ~r~3");
    MenuStore_AddItem(playerid, 8, 358, "Sniper Rifle", 401, 500, "KI NANG CHE SUNG : ~r~5");
    MenuStore_Show(playerid, Weapon_Shop, "Che tao vu khi", "VAT LIEU", "Che tao");
	return 1;
}