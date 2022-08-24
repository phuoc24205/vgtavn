#include <YSI\y_hooks>

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 1830.7617,-1583.0134,13.5429))
	{
		if(newkeys & KEY_WALK)
		{
			ShowPlayerDialog(playerid, DIALOG_DOIMANHXE, DIALOG_STYLE_TABLIST, "Doi Manh Xe (Can 30 manh)",
			 "{F5F5F5}Sieu Xe {FF8356}FLASH\t{FFCD00}(167 km/h)\n\
			 {F5F5F5}Xe Tong Thong {FF8356}Stretch\t{FFCD00}(160 km/h)\n\
			 {F5F5F5}Sieu Xe {FF8356}Turismo\t{FFCD00}(195 km/h)\n\
			 {F5F5F5}Xe {FF8356}Rancher\t{FFCD00}(158 km/h)\n\
			 {F5F5F5}Sieu Xe {FF8356}Bullet\t{FFCD00}(205 km/h)\n\
			 {F5F5F5}Sieu Xe {FF8356}Banshee\t{FFCD00}(205 km/h)\n\
			 {F5F5F5}Sieu Xe {FF8356}Cheetah\t{FFCD00}(194 km/h)\n\
			 {F5F5F5}Xe Quoc Dan {FF8356}Sultan\t{FFCD00}(171 km/h)\n\
			 {F5F5F5}Xe Faction {FF8356}LVPD\t{FFCD00}(160 km/h)\n\
			 {F5F5F5}Xe Faction {FF8356}SFPD\t{FFCD00}(160 km/h)\n\
			 {FF8356}Police Maverick\t{FFCD00}(??? km/h)\n\
			 "
			 , "Doi", "Huy Bo");
		}
	}
	return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_DOIMANHXE)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(InventoryItemCheck(playerid, ITEM_MANHXEFLASH, 30) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du manh xe nay, can 30 manh.");
					if(!vehicleCountCheck(playerid)) return SendClientMessageEx(playerid, COLOR_GREY, "Slot xe cua ban khong con cho trong, hay kiem tra lai Y > Chinh Xe.");
					new Float: arr_fPlayerPos[4];
					GetPlayerPos(playerid, arr_fPlayerPos[0], arr_fPlayerPos[1], arr_fPlayerPos[2]);
					GetPlayerFacingAngle(playerid, arr_fPlayerPos[3]);
					new	slotid = InventoryItemCheck(playerid, ITEM_MANHXEFLASH, 30);
					DeleteItem(playerid, slotid, 30);
					CreatePlayerVehicle(playerid, GetPlayerFreeVehicleId(playerid), 565, arr_fPlayerPos[0]+3.0, arr_fPlayerPos[1]+3.0, arr_fPlayerPos[2]+3.0, arr_fPlayerPos[3], 0, 1, 2000000, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
					SendClientMessage(playerid, 0xe7a6ffff, "Chuc mung ban da nhan duoc 1 chiec Sieu Xe Flash.");
				}
			}
		}
	}

	return 1;
}