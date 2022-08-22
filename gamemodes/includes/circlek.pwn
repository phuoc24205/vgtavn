#include <YSI\y_hooks>
Store:CircleK_Shop(playerid, response, itemid, modelid, price, amount, itemname[])
{
    if(!response)
        return true;
    new stringss[512];
    switch(itemid)
    {
        case 1:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_THUOCLA, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_THUOCLA, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}goi {ff335c}Thuoc la {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 2:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_NUOCCAM, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_NUOCCAM, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}hop {ff335c}Nuoc Cam {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            TinhToanNVChinh(playerid, 12);
            return 1;
        }
        case 3:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_NUOCTAO, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_NUOCTAO, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}hop {ff335c}Nuoc TAO {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 4:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_HOPSUA, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_HOPSUA, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}hop {ff335c}SUA {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 5:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_RUOU, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_RUOU, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}chai {ff335c}RUOU {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 6:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_CAFE, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_CAFE, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}ly {ff335c}CAFE {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 7:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_COMHOP, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_COMHOP, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}hop {ff335c}COM HOP {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 8:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_DANSUNGLUC, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_DANSUNGLUC, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}hop {ff335c}DAN {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 9:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_FISH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_FISH, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}con {ff335c}CA BIEN {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 10:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_CUIKHO, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_CUIKHO, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00} canh {ff335c}CUI KHO {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 11:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_HOTQUET, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_HOTQUET, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}chiec {ff335c}HOP QUET {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 12:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_THUNGGO, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_THUNGGO, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}cai {ff335c}THUNG GO {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 13:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_CUUTHUONG, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_CUUTHUONG, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}bo {ff335c}Tui Cuu Thuong {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 14:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_STAR, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_STAR, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}cai {ff335c}NGOI SAO {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 15:
        {
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien");
            if(CheckTuido(playerid, ITEM_JETP, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_JETP, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}cai {ff335c}JETPACK {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            return 1;
        }
        case 16:
        {
            if(InventoryItemCheck(playerid, ITEM_DIENTHOAI, 1) != 50) 
            {
                SendClientMessage(playerid, COLOR_GREY, "Ban da co dien thoai roi");
                return 1;
            }
            if(PlayerInfo[playerid][pCash] < price) return SendClientMessageEx(playerid, COLOR_GREY, "Ban khong du tien de mua");
            if(CheckTuido(playerid, ITEM_DIENTHOAI, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
            AddItem(playerid, ITEM_DIENTHOAI, 1);
            PlayerInfo[playerid][pCash] -= price;
            format(stringss, sizeof(stringss), "{ffff00}[CIRCLE K] Ban vua mua {ff335c}%d {ffff00}chiec {ff335c}DIEN THOAI {ffff00}voi gia {ff335c}%s{ffff00}).",amount, number_format(price));
            SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
            new randphone = 99999 + random(900000);
            new query[128], string[128];
            PlayerInfo[playerid][pPnumber] = randphone;
            format(string, sizeof(string), "Mua so dien thoai, so dien thoai moi cua ban la %d.", randphone);
            SendClientMessageEx(playerid, COLOR_GRAD4, string);
            SendClientMessageEx(playerid, COLOR_GRAD5, "Ban co the kiem tra so dien thoat cua ban bat cu luc nao bang /thongtin.");
            SendClientMessageEx(playerid, COLOR_WHITE, "HINT: Ban su dung /trogiupdienthoai de xem cac lenh lien quan toi dien thoai.");
            format(query, sizeof(query), "UPDATE `accounts` SET `PhoneNr` = %d WHERE `id` = '%d'", PlayerInfo[playerid][pPnumber], GetPlayerSQLId(playerid));
            mysql_query(MainPipeline, query);
            PlayerInfo[playerid][pPhoneBook] = 1;
            OnPlayerStatsUpdate(playerid);
            return 1;
        }
    }

    return true;
}
CMD:muavatpham(playerid, params[])
{
    MenuStore_AddItem(playerid, 1, 19897, "THUOC LA", 5000, "Tang 3 phut Buon ngu/lan hut~n~~g~5.000$");
    MenuStore_AddItem(playerid, 2, 19563, "NUOC CAM", 5000, "Tang 10 phut khat nuoc/lan uong~n~~g~5.000$");
    MenuStore_AddItem(playerid, 3, 19564, "NUOC TAO", 15000, "Tang 15 phut khat nuoc/lan uong~n~~g~15.000$");
    MenuStore_AddItem(playerid, 4, 19569, "HOP SUA", 12000,  "Tang 12 phut khat nuoc/lan uong~n~~g~12.000$");
    MenuStore_AddItem(playerid, 5, 1544, "RUOU", 15000, "Tang 10 phut khat nuoc va buon ngu/lan uong~n~~g~15.000$~n~~r~18+");
    MenuStore_AddItem(playerid, 6, 19835, "CAFE", 7000,  "Tang 30 phut buon ngu/lan uong~n~~g~7.000$");
    MenuStore_AddItem(playerid, 7, 19568, "COM HOP", 30000,  "Tang 50 phut no bung/lan an~n~~g~30.000$");
    MenuStore_AddItem(playerid, 8, 19995, "HOP DAN SUNG LUC", 30000,  "Tang 100 vien dan cho sung luc~n~~g~30.000$");
    MenuStore_AddItem(playerid, 9, 1604, "CA BIEN", 2000,  "An vao tang 2 phut no bung~n~~g~2.000$");
    MenuStore_AddItem(playerid, 10, 19793, "CUI KHO", 150000,  "Dung de dot lua trai~n~~g~150.000$~n~Can co~r~ HOP QUET");
    MenuStore_AddItem(playerid, 11, 19998, "HOP QUET", 20000,  "DOT LUA TRAI~n~~g~20.000$");
    MenuStore_AddItem(playerid, 12, 1463, "THUNG GO", 39999,  "Dung de che tao noi that~n~~g~39.999$");
    MenuStore_AddItem(playerid, 13, 11738, "Tui Cuu Thuong", 250000,  "Dung de cuu thuong nguoi khac~n~~g~250.000$");
    MenuStore_AddItem(playerid, 14, 1247, "NGOI SAO", 500000,  "Dung de giam toi khi bi truy na (1*)~n~~g~500.000$");
    MenuStore_AddItem(playerid, 15, 370, "JETPACK", 99999,  "Dung de bay len bau troi~n~~g~99.999$");
    MenuStore_AddItem(playerid, 16, 18873, "Dien Thoai 1280", 99000,  "Dung de goi dien ~n~~y~99.000$");
    MenuStore_Show(playerid, CircleK_Shop, "CIRCLE K", "", "Mua");
    return 1;
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
//circlek
forward UongNuocCircle(playerid, loai);
public UongNuocCircle(playerid, loai)
{
   
    if(loai == 1)
    {
        PlayerInfo[playerid][pDry] += 60*10;
        SetPlayerProgressBarValue(playerid, DryBar[playerid], PlayerInfo[playerid][pDry]);
        SendClientMessage(playerid, COLOR_CYAN, "Ban vua uong NUOC CAM, ban duoc tang 10 phut khat nuoc");
        PlayerInfo[playerid][pHanhDong] = 0;
        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
        ClearAnimations(playerid);
        if(PlayerInfo[playerid][pDry] >= 3600)
        {
            PlayerInfo[playerid][pDry] = 3600;
        }
    }
    if(loai == 2)
    {
        PlayerInfo[playerid][pDry] += 60*15;
        SetPlayerProgressBarValue(playerid, DryBar[playerid], PlayerInfo[playerid][pDry]);
        SendClientMessage(playerid, COLOR_CYAN, "Ban vua uong NUOC TAO, ban duoc tang 15 phut khat nuoc");
        PlayerInfo[playerid][pHanhDong] = 0;
        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
        ClearAnimations(playerid);
        if(PlayerInfo[playerid][pDry] >= 3600)
        {
            PlayerInfo[playerid][pDry] = 3600;
        }
    }
    if(loai == 3)
    {
        PlayerInfo[playerid][pDry] += 60*12;
        SetPlayerProgressBarValue(playerid, DryBar[playerid], PlayerInfo[playerid][pDry]);
        SendClientMessage(playerid, COLOR_CYAN, "Ban vua uong HOP SUA, ban duoc tang 12 phut khat nuoc");
        PlayerInfo[playerid][pHanhDong] = 0;
        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
        ClearAnimations(playerid);
        if(PlayerInfo[playerid][pDry] >= 3600)
        {
            PlayerInfo[playerid][pDry] = 3600;
        }
    }
    if(loai == 4)
    {
        new render = random(5);
        switch(render)
        {
            case 0,1:
            {
                PlayerInfo[playerid][pDry] += 60*10;
                PlayerInfo[playerid][pSleep] += 60*10;
                SetPlayerProgressBarValue(playerid, DryBar[playerid], PlayerInfo[playerid][pDry]);
                SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
                SendClientMessage(playerid, COLOR_CYAN, "Ban vua uong RUOU, ban duoc tang 10 phut Khat Nuoc va Buon Ngu");
                SendClientMessage(playerid, 0xFF0000FF, "Ban dang bi say, hay doi 20 giay de tiep tuc uong tiep");
                ApplyAnimation(playerid, "PED", "WALK_DRUNK", 4.1, 1, 1, 0, 1, 0, 1);
                SetTimerEx("UongRuouSay", 20000, 0, "i", playerid);
                if(PlayerInfo[playerid][pDry] >= 3600)
                {
                    PlayerInfo[playerid][pDry] = 3600;
                }
                if(PlayerInfo[playerid][pSleep] >= 7200)
                {
                    PlayerInfo[playerid][pSleep] = 7200;
                }
            }
            default:
            {
                PlayerInfo[playerid][pDry] += 60*10;
                PlayerInfo[playerid][pSleep] += 60*10;
                SetPlayerProgressBarValue(playerid, DryBar[playerid], PlayerInfo[playerid][pDry]);
                SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
                SendClientMessage(playerid, COLOR_CYAN, "Ban vua uong RUOU, ban duoc tang 10 phut Khat Nuoc va Buon Ngu");
                PlayerInfo[playerid][pHanhDong] = 0;
                PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
                ClearAnimations(playerid);
                if(PlayerInfo[playerid][pDry] >= 3600)
                {
                    PlayerInfo[playerid][pDry] = 3600;
                }
                if(PlayerInfo[playerid][pSleep] >= 7200)
                {
                    PlayerInfo[playerid][pSleep] = 7200;
                }
            }
        }
        
    }
    if(loai == 5)
    {
        PlayerInfo[playerid][pSleep] += 60*30;
        SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
        SendClientMessage(playerid, COLOR_CYAN, "Ban vua uong Cafe, ban duoc tang 30 phut Buon Ngu");
        PlayerInfo[playerid][pHanhDong] = 0;
        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
        ClearAnimations(playerid);
        if(PlayerInfo[playerid][pSleep] >= 7200)
        {
            PlayerInfo[playerid][pSleep] = 7200;
        }
    }
    if(loai == 6)
    {
        PlayerInfo[playerid][pSleep] += 60*3;
        SetPlayerProgressBarValue(playerid, SleepBar[playerid], PlayerInfo[playerid][pSleep]);
        SendClientMessage(playerid, COLOR_CYAN, "Ban vua hit 1 hoi thuoc, ban duoc tang 3 phut Buon Ngu, vut bo thuoc {ff0000}/vutbo");
        PlayerInfo[playerid][pHanhDong] = 0;
        PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
        ClearAnimations(playerid);
        if(PlayerInfo[playerid][pSleep] >= 7200)
        {
            PlayerInfo[playerid][pSleep] = 7200;
        }
    }
    return 1;
}

forward UongRuouSay(playerid, loai);
public UongRuouSay(playerid, loai)
{
    PlayerInfo[playerid][pHanhDong] = 0;
    PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
    ClearAnimations(playerid);
    SendClientMessage(playerid, COLOR_CYAN, "Ban da tinh tao");
    return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
     if(newkeys & KEY_WALK)
    {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, 1023.4122,-1915.8483,12.7890))
            {
                SetPlayerFacingAngle(playerid, 5.4539);
                ApplyActorAnimation(circlek_Actor, "PED", "IDLE_CHAT", 4.0, 1, 0, 0, 0, 0); // Pay anim
                SetTimerEx("circleActor", 10000, 0, "i",playerid);
                MenuStore_AddItem(playerid, 1, 19897, "THUOC LA", 5000, "Tang 3 phut Buon ngu/lan hut~n~~g~5.000$");
                MenuStore_AddItem(playerid, 2, 19563, "NUOC CAM", 5000, "Tang 10 phut khat nuoc/lan uong~n~~g~5.000$");
                MenuStore_AddItem(playerid, 3, 19564, "NUOC TAO", 7000, "Tang 15 phut khat nuoc/lan uong~n~~g~7.000$");
                MenuStore_AddItem(playerid, 4, 19569, "HOP SUA", 6000,  "Tang 12 phut khat nuoc/lan uong~n~~g~6.000$");
                MenuStore_AddItem(playerid, 5, 1544, "RUOU", 8000, "Tang 10 phut khat nuoc va buon ngu/lan uong~n~~g~8.000$~n~~r~18+");
                MenuStore_AddItem(playerid, 6, 19835, "CAFE", 7000,  "Tang 30 phut buon ngu/lan uong~n~~g~7.000$");
                MenuStore_AddItem(playerid, 7, 19568, "COM HOP", 30000,  "Tang 50 phut no bung/lan an~n~~g~30.000$");
                MenuStore_AddItem(playerid, 8, 19995, "HOP DAN SUNG LUC", 30000,  "Tang 100 vien dan cho sung luc~n~~g~30.000$");
                MenuStore_AddItem(playerid, 9, 19630, "CA BIEN", 2000,  "An vao tang 2 phut no bung~n~~g~2.000$");
                MenuStore_AddItem(playerid, 10, 19793, "CUI KHO", 150000,  "Dung de dot lua trai~n~~g~150.000$~n~~w~Can co~r~ HOP QUET");
                MenuStore_AddItem(playerid, 11, 19998, "HOP QUET", 20000,  "DOT LUA TRAI~n~~g~20.000$");
                MenuStore_AddItem(playerid, 12, 1463, "THUNG GO", 39999,  "Dung de che tao noi that~n~~g~39.999$");
                MenuStore_AddItem(playerid, 13, 11738, "Tui Cuu Thuong", 250000,  "Dung de cuu thuong nguoi khac~n~~g~250.000$");
                MenuStore_AddItem(playerid, 14, 1247, "NGOI SAO", 500000,  "Dung de giam toi khi bi truy na (1 sao)~n~~g~500.000$");
                MenuStore_AddItem(playerid, 15, 370, "JETPACK", 2000000,  "Dung de bay len bau troi~n~~g~2.000.000$");
                MenuStore_AddItem(playerid, 16, 18873, "Dien Thoai 1280", 99000,  "Dung de goi dien ~n~~y~99.000$");
                MenuStore_Show(playerid, CircleK_Shop, "CIRCLE K", "", "Mua");
                return 1;
            }
            if(IsPlayerInRangeOfPoint(playerid, 3.0, 1919.6464,-1776.0494,13.5827))
            {
                SetPlayerFacingAngle(playerid, 5.4539);
                ApplyActorAnimation(nhanvientaphoa, "PED", "IDLE_CHAT", 4.0, 1, 0, 0, 0, 0); // Pay anim
                SetTimerEx("taphoaActor", 10000, 0, "i",playerid);
                MenuStore_AddItem(playerid, 1, 19897, "THUOC LA", 3000, "Tang 3 phut Buon ngu/lan hut~n~~g~3.000$");
                MenuStore_AddItem(playerid, 2, 19563, "NUOC CAM", 3000, "Tang 10 phut khat nuoc/lan uong~n~~g~3.000$");
                MenuStore_AddItem(playerid, 3, 19564, "NUOC TAO", 4000, "Tang 15 phut khat nuoc/lan uong~n~~g~4.000$");
                MenuStore_AddItem(playerid, 4, 19569, "HOP SUA", 3000,  "Tang 12 phut khat nuoc/lan uong~n~~g~3.000$");
                MenuStore_AddItem(playerid, 5, 1544, "RUOU", 12000, "Tang 10 phut khat nuoc va buon ngu/lan uong~n~~g~12.000$~n~~r~18+");
                MenuStore_AddItem(playerid, 6, 19835, "CAFE", 5000,  "Tang 30 phut buon ngu/lan uong~n~~g~5.000$");
                MenuStore_AddItem(playerid, 7, 19568, "COM HOP", 30000,  "Tang 50 phut no bung/lan an~n~~g~30.000$");
                MenuStore_AddItem(playerid, 8, 19995, "HOP DAN SUNG LUC", 25000,  "Tang 100 vien dan cho sung luc~n~~g~25.000$");
                MenuStore_AddItem(playerid, 9, 19630, "CA BIEN", 1000,  "An vao tang 2 phut no bung~n~~g~1.000$");
                MenuStore_AddItem(playerid, 10, 19793, "CUI KHO", 150000,  "Dung de dot lua trai~n~~g~150.000$~n~~w~Can co~r~ HOP QUET");
                MenuStore_AddItem(playerid, 11, 19998, "HOP QUET", 25000,  "DOT LUA TRAI~n~~g~25.000$");
                MenuStore_AddItem(playerid, 12, 1463, "THUNG GO", 39999,  "Dung de che tao noi that~n~~g~39.999$");
                MenuStore_AddItem(playerid, 13, 11738, "Tui Cuu Thuong", 200000,  "Dung de cuu thuong nguoi khac~n~~g~200.000$");
                MenuStore_AddItem(playerid, 14, 1247, "NGOI SAO", 500000,  "Dung de giam toi khi bi truy na (1 sao)~n~~g~500.000$");
                MenuStore_AddItem(playerid, 15, 370, "JETPACK", 2000000,  "Dung de bay len bau troi~n~~g~2.000.000$");
                MenuStore_AddItem(playerid, 16, 18873, "Dien Thoai 1280", 99000,  "Dung de goi dien ~n~~y~99.000$");
                MenuStore_Show(playerid, CircleK_Shop, "Tap hoa 277", "", "Mua");
                return 1;
            }
    }
    return 1;
}
forward taphoaActor(playerid);
public taphoaActor(playerid)
{
    ClearActorAnimations(nhanvientaphoa);
    return 1;
}
forward circleActor(playerid);
public circleActor(playerid)
{
    ClearActorAnimations(circlek_Actor);
    return 1;
}
// hook OnPlayerDisconnect(playerid, reason)
// {
//     if(GetPVarInt(playerid, "DangSayRuou"))
//     {
//         DeletePVar(playerid, "DangSayRuou");
//     }
//     return 1;
// }
