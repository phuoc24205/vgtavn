#include <YSI\y_hooks>
Store:Ammo_Shop(playerid, response, itemid, modelid, price, amount, itemname[])
{
    if(!response)
        return true;
    new stringss[512];
    switch(itemid)
    {
        case 1:
        {
            if(PlayerInfo[playerid][pGuns][2] == 0) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong co loai sung nay");
            if(IsACop(playerid))
            {
                price = 100;
            }
            else
            {
                price = 1500;
            }
            if(PlayerInfo[playerid][pMats] < price) return SendClientMessageEx(playerid, COLOR_RED, "Khong du vat lieu");
            amount = 20;
            PlayerInfo[playerid][pAmmo][1] += amount;
            PlayerInfo[playerid][pMats] -= price;
            GivePlayerWeapon(playerid, PlayerInfo[playerid][pGuns][2], amount);
            format(stringss, sizeof(stringss), "{ffff00}[MUA DAN] {ff335c}%d {ffff00}vien dan cho sung Luc voi gia {ff335c}%d {ffff00}Vat Lieu (so dan hien co: {ff335c}%s{ffff00}) ", amount, price, number_format(PlayerInfo[playerid][pAmmo][1]));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 2:
        {
            if(PlayerInfo[playerid][pGuns][3] == 0) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong co loai sung nay");
            if(IsACop(playerid))
            {
                price = 100;
            }
            else
            {
                price = 1500;
            }
            if(PlayerInfo[playerid][pMats] < price) return SendClientMessageEx(playerid, COLOR_RED, "Khong du vat lieu");
            PlayerInfo[playerid][pAmmo][2] += 10;
            PlayerInfo[playerid][pMats] -= price;
            GivePlayerWeapon(playerid, PlayerInfo[playerid][pGuns][3], 10);
            format(stringss, sizeof(stringss), "{ffff00}[MUA DAN] {ff335c}%d {ffff00}vien dan cho sung Shotgun voi gia {ff335c}%d {ffff00}Vat Lieu (so dan hien co: {ff335c}%d{ffff00}) ", amount, price, PlayerInfo[playerid][pAmmo][2]);
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 3:
        {
            if(PlayerInfo[playerid][pGuns][4] == 0) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong co loai sung nay");
            if(IsACop(playerid))
            {
                price = 200;
            }
            else
            {
                price = 1300;
            }
            if(PlayerInfo[playerid][pMats] < price) return SendClientMessageEx(playerid, COLOR_RED, "Khong du vat lieu");
            amount = 30;
            PlayerInfo[playerid][pAmmo][3] += amount;
            PlayerInfo[playerid][pMats] -= price;
            GivePlayerWeapon(playerid, PlayerInfo[playerid][pGuns][4], amount);
            format(stringss, sizeof(stringss), "{ffff00}[MUA DAN] {ff335c}%d {ffff00}vien dan cho sung May MP5 voi gia {ff335c}%d {ffff00}Vat Lieu (so dan hien co: {ff335c}%d{ffff00}) ", amount, price, PlayerInfo[playerid][pAmmo][3]);
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 4:
        {
            if(PlayerInfo[playerid][pGuns][5] == 0) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong co loai sung nay");
            if(IsACop(playerid))
            {
                price = 500;
            }
            else
            {
                price = 2000;
            }
            if(PlayerInfo[playerid][pMats] < price) return SendClientMessageEx(playerid, COLOR_RED, "Khong du vat lieu");
            amount = 20;
            PlayerInfo[playerid][pAmmo][4] += amount;
            PlayerInfo[playerid][pMats] -= price;
            GivePlayerWeapon(playerid, PlayerInfo[playerid][pGuns][5], amount);
            format(stringss, sizeof(stringss), "{ffff00}[MUA DAN] {ff335c}%d {ffff00}vien dan cho sung AK/M4 voi gia {ff335c}%d {ffff00}Vat Lieu (so dan hien co: {ff335c}%d{ffff00}) ", amount, price, PlayerInfo[playerid][pAmmo][4]);
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 5:
        {
            if(PlayerInfo[playerid][pGuns][6] == 0) return SendClientMessageEx(playerid, COLOR_RED, "Ban khong co loai sung nay");
            if(IsACop(playerid))
            {
                price = 500;
            }
            else
            {
                price = 3000;
            }
            if(PlayerInfo[playerid][pMats] < price) return SendClientMessageEx(playerid, COLOR_RED, "Khong du vat lieu");
            amount = 10;
            PlayerInfo[playerid][pAmmo][5] += amount;
            PlayerInfo[playerid][pMats] -= price;
            GivePlayerWeapon(playerid, PlayerInfo[playerid][pGuns][6], amount);
            format(stringss, sizeof(stringss), "{ffff00}[MUA DAN] {ff335c}%d {ffff00}vien dan cho sung Nham voi gia {ff335c}%d {ffff00}Vat Lieu (so dan hien co: {ff335c}%d{ffff00}) ", amount, price, PlayerInfo[playerid][pAmmo][5]);
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
    }

    return true;
}
CMD:chetaodan(playerid, params[])
{
    MenuStore_AddItem(playerid, 1, 2061, "Dan sung luc", 1500, "9mm, sdpid, DE~n~~g~1.500 Vat Lieu~n~~y~20 vien~n~~b~Canh sat~w~ chi can ~g~100 VL");
    MenuStore_AddItem(playerid, 2, 2061, "Dan sung Shotgun", 1500, "~g~1.500 Vat Lieu~n~~y~10 vien~n~~b~Canh sat~w~ chi can ~g~100 Vat Lieu");
    MenuStore_AddItem(playerid, 3, 2061, "Dan sung SMG", 1300, "Uzi, Tec9, Mp5~n~~g~1300 Vat Lieu~n~~y~30 vien~n~~b~Canh sat~w~ chi can ~g~200 VL");
    MenuStore_AddItem(playerid, 4, 2061, "Dan sung AK/M4", 2000,  "M4, Ak 47~n~~g~2.000 Vat Lieu~n~~y~20 vien~n~~b~Canh sat~w~ chi can ~g~500 VL");
    MenuStore_AddItem(playerid, 5, 2061, "Dan sung tam xa", 3000, "rifle, sniper~n~~g~3.000 Vat Lieu~n~~y~10 vien~n~~b~Canh sat~w~ chi can ~g~500 VL");
    MenuStore_Show(playerid, Ammo_Shop, "Mua dan", "", "Mua");
    return 1;
}
CMD:muadan(playerid, params[])
{
    return cmd_chetaodan(playerid, params);
}
// case 16, 17, 18, 39:
// 		{
// 			PlayerInfo[playerid][pGuns][ 8 ] = WeaponID;
// 			GivePlayerWeapon(playerid, WeaponID, Ammo);
// 			PlayerInfo[playerid][pAmmo][7] = Ammo;
// 		}
// 		case 22, 23, 24: // 9mm, sdpid, DE
// 		{
// 			PlayerInfo[playerid][pGuns][ 2 ] = WeaponID;
// 			PlayerInfo[playerid][pAmmo][1] = Ammo;
// 			GivePlayerWeapon(playerid, WeaponID, Ammo);
// 		}
// 		case 25,26,27: // Shotgun, spawn-off, combat shotgun
// 		{
// 			PlayerInfo[playerid][pGuns][ 3 ] = WeaponID;
// 			PlayerInfo[playerid][pAmmo][2] = Ammo;
// 			GivePlayerWeapon(playerid, WeaponID, Ammo);
// 		}
// 		case 28,29,32: // Uzi, Tec9, Mp5
// 		{
// 			PlayerInfo[playerid][pGuns][ 4 ] = WeaponID;
// 			PlayerInfo[playerid][pAmmo][3] = Ammo;
// 			GivePlayerWeapon(playerid, WeaponID, Ammo);
// 		}
// 		case 30,31: // M4, Ak 47
// 		{
// 			PlayerInfo[playerid][pGuns][ 5 ] = WeaponID;
// 			PlayerInfo[playerid][pAmmo][4] = Ammo;
// 			GivePlayerWeapon(playerid, WeaponID, Ammo);
// 		}
// 		case 33,34: // rifle, sniper
// 		{
// 			PlayerInfo[playerid][pGuns][ 6 ] = WeaponID;
// 			PlayerInfo[playerid][pAmmo][5] = Ammo;
// 			GivePlayerWeapon(playerid, WeaponID, Ammo);
// 		}