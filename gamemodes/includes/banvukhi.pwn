

stock GetWeaponItemFromModel(modelid)
{
    new idweapon;
    switch(modelid)
    {
        case 331: idweapon = 1; // Brass Knuckles
        case 333: idweapon = 30200; // Golf Club
        case 334: idweapon = 30300; // Nightstick
        case 335: idweapon = 30400; // Knife
        case 336: idweapon = 30500; // Baseball Bat
        case 337: idweapon = 30600; // Shovel
        case 338: idweapon = 30700; // Pool Cue
        case 339: idweapon = 30800; // Katana
        case 341: idweapon = 30900; // Chainsaw
        case 321: idweapon = 31000; // Double-ended Dildo
        case 320: idweapon = 31100; // Double-ended Dildo
        case 319: idweapon = 31200; // Double-ended Dildo
        case 318: idweapon = 31300; // Double-ended Dildo
        case 325: idweapon = 31400; // Flowers
        case 326: idweapon = 31500; // Cane
        case 342: idweapon = 16; // Grenade
        case 343: idweapon = 17; // Tear Gas
        case 344: idweapon = 18; // Molotov Cocktail
        case 346: idweapon = 32200; // 9mm
        case 347: idweapon = 32300; // Silenced 9mm
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
Store:Weapon_Shop(playerid, response, itemid, modelid, price, amount, itemname[])
{
    if(!response)
        return true;

    if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong du tien de mua vu khi");
    new level = PlayerInfo[playerid][pLevel];
    switch(modelid)
    {
        case 353, 349: if(level < 2) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong du cap do de mua vu khi nay");
        case 348, 357: if(level < 3) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong du cap do de che vu khi nay");
        case 355     : if(level < 5) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong du cap do de che vu khi nay");
        case 351     : if(level < 10) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong du cap do de che vu khi nay");
        case 356     : if(level < 12) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong du cap do de che vu khi nay");
        case 358     : if(level < 15) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong du cap do de che vu khi nay");
    }
    SendClientMessageEx(playerid, COLOR_RED, "Mua vu khi thanh cong hay kiem tra tui do, nhan nut");
    SendClientMessageEx(playerid, COLOR_RED, "Ban duoc +1 Ki nang che sung");
    new str[128];
    format(str, sizeof(str), "%i %i",price,amount);
    print(str);
    PlayerInfo[playerid][pCash] -= price;
    PlayerInfo[playerid][pArmsSkill] += 1;
    AddItem(playerid, GetWeaponItemFromModel(modelid), amount);
    return true;
}
CMD:muavukhi(playerid, params[])
{
    if (!IsAtGunShop(playerid)) {
        SendClientMessageEx(playerid, COLOR_GRAD2, "Ban khong o trong cua hang vu khi! Nhan Y > Tim Duong > Shop Vu Khi");
        return 1;
    }
    else
    {
        new string[128];
        if(GetPVarInt(playerid, "IsInArena") >= 0) {
            SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the lam dieu nay ngay bay gio!");
            return 1;
        }
        if(GetPVarInt(playerid, "EventToken") != 0)
        {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay trong khi ban dang o trong su kien.");
            return 1;
        }
        // if(PlayerInfo[playerid][pJob] != 9 && PlayerInfo[playerid][pJob2] != 9) {
        //     SendClientMessageEx(playerid,COLOR_GREY,"Ban khong phai la Nguoi che sung!");
        //     return 1;
        // }
        if(WatchingTV[playerid] != 0) {
            SendClientMessageEx(playerid, COLOR_GREY, "Ban khong the lam dieu nay khi dang xem TV!");
            return 1;
        }
        /*if(PlayerInfo[playerid][pScrewdriver] == 0) {
            SendClientMessageEx(playerid,COLOR_GREY,"Ban can phai co tua vit tu cong viec Tho Thu Cong de che tao vu khi!");
            return 1;
        }*/
        if(PlayerInfo[playerid][pJailTime] > 0) {
            SendClientMessageEx(playerid,COLOR_GREY,"Ban khong the mua vu khi dang bi giam");
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
        MenuStore_AddItem(playerid, 1, 333, "Golf", 50000, "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 2, 334, "Nitestick", 50000, "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 4, 336, "Baseball", 50000, "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 3, 335, "Knife", 3000000,  "Level : ~r~1~n~~g~3.000.000$");
        MenuStore_AddItem(playerid, 5, 337, "Shovel", 50000, "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 6, 338, "Poolcue", 50000, "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 7, 339, "Katana", 500000, "Level : ~r~1~n~~g~500.000$");
        MenuStore_AddItem(playerid, 8, 321, "Purple dildo", 50000,  "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 9, 320, "Short vibrator", 50000,  "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 10, 319, "Long vibrator", 50000,  "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 11, 318, "White dildo", 50000,  "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 12, 325, "Flowers", 50000,  "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 13, 326, "Cane", 50000,  "Level : ~r~1~n~~g~50.000$");
        MenuStore_AddItem(playerid, 14, 346, "9mm", 80000, "Level : ~r~1~n~~g~80.000$");
        MenuStore_AddItem(playerid, 15, 347, "Sd Pistol", 100000, "Level : ~r~1~n~~g~100.000$");
        MenuStore_AddItem(playerid, 16, 348, "Desert Eagle", 300000, "Level : ~r~3~n~~g~300.000$");
        MenuStore_AddItem(playerid, 17, 349, "Shotgun", 200000,  "Level : ~r~2~n~~g~200.000$");
        MenuStore_AddItem(playerid, 18, 351, "Combat Shotgun", 2000000, "Level : ~r~10~n~~g~2.000.000$");
        MenuStore_AddItem(playerid, 19, 353, "MP5", 250000, "Level : ~r~2~n~~g~250.000$");
        MenuStore_AddItem(playerid, 20, 355, "AK-47", 700000, "Level : ~r~5~n~~g~700.000$");
        MenuStore_AddItem(playerid, 21, 356, "M4", 2000000,  "Level : ~r~12~n~~g~2.000.000$");
        MenuStore_AddItem(playerid, 22, 357, "Country Rifle", 500000,  "Level : ~r~3~n~~g~500.000$");
        MenuStore_AddItem(playerid, 23, 358, "Sniper Rifle", 2000000,  "Level : ~r~15~n~~g~2.000.000$");
        MenuStore_Show(playerid, Weapon_Shop, "Mua vu khi", "", "Thanh toan");
    }
    
	return 1;
}