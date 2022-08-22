#include <YSI\y_hooks>
// 2219

new nhiemvu_actor;

hook OnGameModeInit()
{
	// actor nhiem vu tan thu
	nhiemvu_actor = CreateActor(282,1748.8628,-1860.1707,13.5791,2.2586);
	CreateDynamic3DTextLabel("{5FD068}Nhiem Vu Tan Thu\n{F5F5F5}Nhan {FFCD00}ALT {F5F5F5}de tuong tac",COLOR_YELLOW,1748.8628,-1860.1707,13.5791+0.3,30.0);
	PreloadAnimLib(nhiemvu_actor, "COP_AMBIENT");
	ApplyActorAnimation(nhiemvu_actor, "COP_AMBIENT", "Coplook_loop", 4.0, 1, 0, 0, 0, 0); // Pay anim
	SetActorPos(nhiemvu_actor, 1748.8628,-1860.1707,13.5791);
	SetActorFacingAngle(nhiemvu_actor, 2.2586);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 1748.8628,-1860.1707,13.5791))
	{
		if(newkeys & KEY_WALK)
		{
			if(PlayerInfo[playerid][pTienDo] == 0)
			{
				NhanNhiemVuChinh(playerid, PlayerInfo[playerid][pNhiemVu], PlayerInfo[playerid][pTienDo]);
			}
			else if(PlayerInfo[playerid][pTienDo] > 0)
			{
				DangLamNhiemVuChinh(playerid, PlayerInfo[playerid][pNhiemVu], PlayerInfo[playerid][pTienDo]);
			}
		}
	}
}
hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_NHIEMVU)
	{
		if(response)
		{
			if(PlayerInfo[playerid][pTienDo] == 0)
			{
				PlayerInfo[playerid][pTienDo] = 1;
				SendClientMessage(playerid, 0xF5F5F5FF, "Ban da nhan nhiem vu, hay di thuc hien di nao !");
			}
		}
	}
	else if(dialogid == DIALOG_NHIEMVU2)
	{
		if(response)
		{
			NhanThuongNhiemVuChinh(playerid, PlayerInfo[playerid][pNhiemVu], PlayerInfo[playerid][pTienDo]);
		}
	}
	return 1;
}

NhanNhiemVuChinh(playerid, nhiemvuid, tiendo)
{
	switch(nhiemvuid)
	{
		case 0:// nhiem vu 1
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 1", 
			"{F5F5F5}Nhan nut {F54D42}H {F5F5F5}de mo tui do, sau do su dung {FFCD00}Hop Qua Tan Thu\n\n\
			{F54D42}Phan Thuong: {5FD068}5.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 1:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 2", 
			"{F5F5F5}Giao {F54D42}10 chuyen Pizza {F5F5F5}, vui long di xin viec {FFCD00}Van Chuyen Banh\n\n\
			{F54D42}Phan Thuong: {5FD068}100 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 2:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 3", 
			"{F5F5F5}Giao {F54D42}10 chuyen Trucker {F5F5F5}, vui long di xin viec {FFCD00}Trucker\n\n\
			{F54D42}Phan Thuong: {5FD068}20.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
	}
	
}

DangLamNhiemVuChinh(playerid, nhiemvuid, tiendo)
{
	new string[512];
	switch(nhiemvuid)
	{
		case 0:
		{
			format(string, sizeof(string),
			"{F5F5F5}Nhan nut {F54D42}H {F5F5F5}de mo tui do, sau do su dung {FFCD00}Hop Qua Tan Thu\n\n\
			{F54D42}Phan Thuong: {5FD068}5.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 1", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 1:
		{
			format(string, sizeof(string),
			"{F5F5F5}Giao {F54D42}10 chuyen Pizza {F5F5F5}, vui long di xin viec {FFCD00}Van Chuyen Banh\n\n\
			{F54D42}Phan Thuong: {5FD068}100 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 2", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 2:
		{
			format(string, sizeof(string),
			"{F5F5F5}Giao {F54D42}10 chuyen Trucker {F5F5F5}, vui long di xin viec {FFCD00}Trucker\n\n\
			{F54D42}Phan Thuong: {5FD068}20.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 3", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
	}
}

stock DieuKienNhiemVu(nhiemvuid)
{
	switch(nhiemvuid)
	{
		case 0: return 2;
		case 1: return 11;
		case 2: return 11;
	}
	return 50;
}

NhanThuongNhiemVuChinh(playerid, nhiemvuid, tiendo)
{
	if( ((tiendo - DieuKienNhiemVu(nhiemvuid)) == 0) || (DieuKienNhiemVu(nhiemvuid) == 0 && PlayerInfo[playerid][pDaSuDungLD] == 1 ) )
	{
		switch(nhiemvuid)
		{
			case 0:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pCash] += 5000;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 1");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}$5.000 SAD {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 1:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 100;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 2");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}100 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 2:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pCash] += 20000;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 3");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}20.000$ SAD {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_GREY, "Ban chua hoan thanh tien do cua nhiem vu");
	}
	
	return 1;
}

