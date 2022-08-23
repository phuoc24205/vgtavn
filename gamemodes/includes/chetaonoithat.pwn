
#include <YSI\y_hooks>
new MayCheTaoNT;

Store:NoiThat_Shop(playerid, response, itemid, modelid, price, amount, itemname[])
{
    if(!response)
        return true;

    if(MayCheTaoNT == 1) return SendClientMessage(playerid, COLOR_GREY, "May che tao Noi That dang co nguoi lam roi, xin hay xep hang doi.");
    if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
    new szMessage[128];
    SendClientMessageEx(playerid, COLOR_YELLOW2, "Ban phai doi 30 giay de qua trinh lam Noi That hoan tat.");
    format(szMessage, sizeof(szMessage), "* %s bat dau qua trinh lam Noi That.", GetPlayerNameEx(playerid));
    ProxDetector(25.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    PreloadAnimLib(playerid, "BD_FIRE");
    ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.0, 1, 0, 0, 1, 0, 1);
    PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
    PlayerInfo[playerid][pHanhDong] = 1;
    SetPVarInt(playerid, "LamNoiThatTime", 30);
    SetTimerEx("LamNoiThat", 1000, false, "iid", playerid, itemid, price);
    MayCheTaoNT = 1;
    return true;
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_WALK)
    {
        if(IsPlayerInRangeOfPoint(playerid, 3.0, 2429.0349,-2467.7854,13.6321))
        {
            SetPlayerFacingAngle(playerid, 317.1946);
            MenuStore_AddItem(playerid, 1, 11737, "Tam Tham", 1000, "So ~r~Go~w~ can: ~g~1.000");
            MenuStore_AddItem(playerid, 2, 11729, "Tu Don", 1000, "So ~r~Go~w~ can: ~g~1.000");
            MenuStore_AddItem(playerid, 3, 11712, "Thanh Gia", 1000, "So ~r~Go~w~ can: ~g~1.000");
            MenuStore_AddItem(playerid, 4, 11685, "Ghe Doi", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 5, 11683, "Ghe Don", 2000, "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 6, 19916, "Tu Lanh", 2500, "So ~r~Go~w~ can: ~g~2.500");
            MenuStore_AddItem(playerid, 7, 19806, "Den Chum", 2700, "So ~r~Go~w~ can: ~g~2.700");
            MenuStore_AddItem(playerid, 8, 19609, "Bo Trong", 3000,  "So ~r~Go~w~ can: ~g~3.000");
            MenuStore_AddItem(playerid, 9, 2690, "Binh Chua Chay", 1000,  "So ~r~Go~w~ can: ~g~1.000");
            MenuStore_AddItem(playerid, 10, 2309, "Ghe Dua", 1000,  "So ~r~Go~w~ can: ~g~1.000");
            MenuStore_AddItem(playerid, 11, 2356, "Ghe Xoay", 1200,  "So ~r~Go~w~ can: ~g~1.200");
            MenuStore_AddItem(playerid, 12, 1999, "Ban Lam Viec", 3000,  "So ~r~Go~w~ can: ~g~3.000");
            MenuStore_AddItem(playerid, 13, 1661, "Quat Tran", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 14, 1829, "Tham Con Cop", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 15, 1794, "Giuong Ngu Doi", 4000,  "So ~r~Go~w~ can: ~g~4.000");
            MenuStore_AddItem(playerid, 16, 1796, "Giuong Ngu Don", 3000,  "So ~r~Go~w~ can: ~g~3.000");
            MenuStore_AddItem(playerid, 17, 1792, "Tivi Don", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 18, 2297, "Tivi co ke", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 19, 2229, "Loa", 1000,  "So ~r~Go~w~ can: ~g~1.000");
            MenuStore_AddItem(playerid, 20, 2627, "Gym chay bo", 800,  "So ~r~Go~w~ can: ~g~800");
            MenuStore_AddItem(playerid, 21, 2628, "Gym keo ta", 500,  "So ~r~Go~w~ can: ~g~500");
            MenuStore_AddItem(playerid, 22, 2517, "Hop Tam", 1000,  "So ~r~Go~w~ can: ~g~1.000");
            MenuStore_AddItem(playerid, 23, 14633, "Tu sach de tivi", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 24, 1742, "Tu sach", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 25, 2131, "Tu Quan Ao", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 26, 2133, "Tu Dung Do", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 27, 2380, "Quan Ao", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 28, 19893, "Laptop", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 29, 2725, "Ban Tron", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 30, 2747, "Ban Hinh CN", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_AddItem(playerid, 31, 2063, "Ke chat do", 2000,  "So ~r~Go~w~ can: ~g~2.000");
            MenuStore_Show(playerid, NoiThat_Shop, "Xuong Noi That", "", "Che Tao");
            return 1;
        }
    }
    return 1;
}

hook OnGameModeInit()
{
    MayCheTaoNT = 0;
    CreateDynamic3DTextLabel("{ff0000}[Noi che tao Noi That]{ffffff}\nSu dung [{66ff66}ALT (Ben Trai'){ffffff}] de che tao",COLOR_YELLOW,2429.0349,-2467.7854,13.6321+0.6,10.0);
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    if(GetPVarInt(playerid, "LamNoiThatTime"))
    {
        DeletePVar(playerid, "LamNoiThatTime");
        MayCheTaoNT = 0;
    }
    return 1;
}
forward LamNoiThat(playerid, itemid, price);
public LamNoiThat(playerid, itemid, price)
{
    if(GetPVarInt(playerid, "LamNoiThatTime") > 0)
    {
        SetPVarInt(playerid,"LamNoiThatTime", GetPVarInt(playerid, "LamNoiThatTime") - 1);
        new string[256];
        format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Lam Noi That~r~ %d ~w~giay con lai", GetPVarInt(playerid, "LamNoiThatTime"));
        GameTextForPlayer(playerid, string, 1100, 3);
        SetTimerEx("LamNoiThat", 1000, false, "iid", playerid, itemid, price);
    }
    else
    {
        MayCheTaoNT = 0;
        ClearAnimations(playerid);
        DeletePVar(playerid, "LamNoiThatTime");
        PlayerInfo[playerid][pHanhDong] = 0;
        TinhToanNVChinh(playerid, 24);
        new stringss[512];
        switch(itemid)
        {
            case 1:
            {

                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTAMTHAM, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTAMTHAM, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 2:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTUDON, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTUDON, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 3:
            {
               if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTHANHGIA, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTHANHGIA, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 4:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTGHEDOICU, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTGHEDOICU, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 5:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTGHEDONCU, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTGHEDONCU, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 6:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTULANH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTULANH, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 7:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTDENCHUM, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTDENCHUM, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 8:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTBOTRONG, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTBOTRONG, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 9:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTBINHCHUACHAY, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTBINHCHUACHAY, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 10:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTGHEDUA, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTGHEDUA, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 11:
            {
               if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTGHEXOAY, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTGHEXOAY, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 12:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTBANLAMVIEC, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTBANLAMVIEC, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 13:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTQUATTRAN, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTQUATTRAN, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 14:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTHAMCONCOP, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTHAMCONCOP, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 15:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTGIUONGNGUDOI, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTGIUONGNGUDOI, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 16:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTGIUONGDON, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTGIUONGDON, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 17:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTIVIDON, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTIVIDON, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 18:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTIVICOKE, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTIVICOKE, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 19:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTLOA, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTLOA, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 20:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTGYMCHAYBO, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTGYMCHAYBO, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 21:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTGYMKEOTA, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTGYMKEOTA, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 22:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTHOPTAM, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTHOPTAM, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 23:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTUSACHDETIVI, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTUSACHDETIVI, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 24:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTUSACH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTUSACH, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 25:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTUDUNGQUANAO, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTUDUNGQUANAO, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 26:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTTUDUNGDO, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTTUDUNGDO, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 27:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTQUANAO, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTQUANAO, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 28:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTLAPTOP, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTLAPTOP, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 29:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTBANTRON, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTBANTRON, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 30:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTBANHINHCN, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTBANHINHCN, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
            case 31:
            {
                if(InventoryItemCheck(playerid, ITEM_THUNGGO, price) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du so luong go de che tao Noi That nay");
                if(CheckTuido(playerid, ITEM_NTKECHATDO, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
                AddItem(playerid, ITEM_NTKECHATDO, 1);
                DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_THUNGGO, price), price);
                format(stringss, sizeof(stringss), "{ffff00}[CHE TAO NOI THAT] Ban vua che tao Noi That thanh cong tieu hao {ff335c}%s{ffff00} Go~).", number_format(price));
                SendClientMessageEx(playerid, COLOR_YELLOW, stringss);
                return 1;
            }
        }
    }
    return 1;
}