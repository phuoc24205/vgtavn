#include <YSI\y_hooks>
// 2219

new nhiemvu_actor;

CMD:settiendo(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 99999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay !");
	new string[128],giveplayerid, money;
	if(sscanf(params, "ud",giveplayerid, money)) return SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /settiendo [playerid] [tien do 0-50]");
	PlayerInfo[giveplayerid][pTienDo] = money;
	format(string, sizeof(string), "Ban da dieu chinh tien do Nhiem vu Chinh cua %s thanh %d !",GetPlayerNameEx(giveplayerid), money);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "%s da dieu chinh tien do nhiem cua %s thanh %d (/settiendo)", GetPlayerNameEx(playerid),GetPlayerNameEx(giveplayerid),money);
	Log("logs/settiendonv.log", string);
	return 1;
}

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
		case 3:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 4", 
			"{F5F5F5}Ban {F54D42}20 Giap {F5F5F5}, vui long di xin viec {FFCD00}Ve Si\n\n\
			{F54D42}Phan Thuong: {5FD068}200 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 4:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 5", 
			"{F5F5F5}Di {F54D42}Hoc Vo (Bat Ki) {F5F5F5}, vui long di tim duong {FFCD00}Hoc Vo\n\n\
			{F54D42}Phan Thuong: {5FD068}40.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 5:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 6", 
			"{F5F5F5}Giao {F54D42}50 chuyen Vat Lieu {F5F5F5}, vui long di xin viec {FFCD00}Buon Vat Lieu\n\n\
			{F54D42}Phan Thuong: {5FD068}300 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 6:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 7", 
			"{F5F5F5}Che tao {F54D42}30 mon do {F5F5F5}, vui long di xin viec {FFCD00}Tho Thu Cong\n\n\
			{F54D42}Phan Thuong: {5FD068}1.000 vat lieu {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 7:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 8", 
			"{F5F5F5}Trong {F54D42}10 cay can sa {F5F5F5}, tren Map nhung Vung Xanh La {FFCD00}moi duoc Trong Can Sa\n\n\
			{F54D42}Phan Thuong: {5FD068}500 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 8:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 9", 
			"{F5F5F5}Che tao {F54D42}20 Bang Dan (Bat Ki) {F5F5F5}, can vat lieu de che tao,  {FFCD00}/chetaodan\n\n\
			{F54D42}Phan Thuong: {5FD068}10.000 Vat Lieu {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 9:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 10", 
			"{F5F5F5}Mua {F54D42}1 Chiec Xe (Bat Ki) {F5F5F5}, vui long tim duong  {FFCD00}Shop Xe Binh Dan\n\n\
			{F54D42}Phan Thuong: {5FD068}100.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 10:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 11", 
			"{F5F5F5}Do Rac {F54D42}20 lan {F5F5F5}, vui long di xin viec {FFCD00}Don Rac\n\n\
			{F54D42}Phan Thuong: {5FD068}1 cay Shotgun {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 11:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 12", 
			"{F5F5F5}Sua {F54D42}5 chiec xe {F5F5F5}, vui long di xin viec {FFCD00}Tho Sua Xe\n\n\
			{F54D42}Phan Thuong: {5FD068}10 Hop Com {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 12:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 13", 
			"{F5F5F5}Mua {F54D42}10 Hop Nuoc Cam {F5F5F5}, vui long di tap hoa {FFCD00}Circle K\n\n\
			{F54D42}Phan Thuong: {5FD068}20.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 13:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 14", 
			"{F5F5F5}Mua {F54D42}10 Com Hop {F5F5F5}, vui long di tap hoa {FFCD00}Circle K\n\n\
			{F54D42}Phan Thuong: {5FD068}200 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 14:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 15", 
			"{F5F5F5}Mua {F54D42}10 Phieu An {F5F5F5}, vui long tim duong den {FFCD00}Quan An\n\n\
			{F54D42}Phan Thuong: {5FD068}250 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 15:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 16", 
			"{F5F5F5}Mua {F54D42}Bao Hiem (Benh vien Bat Ki) {F5F5F5}, vui long tim duong den {FFCD00}Benh Vien\n\n\
			{F54D42}Phan Thuong: {5FD068}300 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 16:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 17", 
			"{F5F5F5}Cau {F54D42}100 con Ca {F5F5F5}, vui long an vao Xin Viec {FFCD00}Cau Ca\n\n\
			{F54D42}Phan Thuong: {5FD068}300 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 17:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 18", 
			"{F5F5F5}Mua {F54D42}1 Trang Phuc Bat Ki {F5F5F5}, vui long tim duong {FFCD00}Binco\n\n\
			{F54D42}Phan Thuong: {5FD068}100 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 18:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 19", 
			"{F5F5F5}An Trom {F54D42}5 Cay Can Sa {F5F5F5}, vui long tim duong {FFCD00}Khu Vuc Xanh La Tren Map\n\n\
			{F54D42}Phan Thuong: {5FD068}500 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 19:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 20", 
			"{F5F5F5}Gui Tien vao {F54D42}Ngan Hang {F5F5F5}, vui long tim duong {FFCD00}Ngan Hang\n\n\
			{F54D42}Phan Thuong: {5FD068}300 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 20:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 21", 
			"{F5F5F5}Khai thac {F54D42}300 Quang (Bat Ki) {F5F5F5}, vui long xin viec {FFCD00}Dao Vang\n\n\
			{F54D42}Phan Thuong: {5FD068}1.200 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 21:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 22", 
			"{F5F5F5}Che tao {F54D42}5 Cay Xeng {F5F5F5}, vui long xin viec {FFCD00}Lo Luyen Kim\n\n\
			{F54D42}Phan Thuong: {5FD068}100.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
			, "{5FD068}Nhan", "{F5DF99}Tu choi");
		}
		case 22:
		{
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhiem Vu 23", 
			"{F5F5F5}Ra Dao Dau Lau {F54D42}Dao Kho Bau 100 Lan {F5F5F5}, vui long tim duong {FFCD00}Dao Dau Lau\n\n\
			{F54D42}Phan Thuong: {5FD068}1.500 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH"
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
		case 3:
		{
			format(string, sizeof(string),
			"{F5F5F5}Ban {F54D42}20 Giap {F5F5F5}, vui long di xin viec {FFCD00}Ve Si\n\n\
			{F54D42}Phan Thuong: {5FD068}200 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 4", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 4:
		{
			format(string, sizeof(string),
			"{F5F5F5}Di {F54D42}Hoc vo (Bat ki) {F5F5F5}, vui long di tim duong {FFCD00}Hoc Vo\n\n\
			{F54D42}Phan Thuong: {5FD068}40.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 5", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 5:
		{
			format(string, sizeof(string),
			"{F5F5F5}Giao {F54D42}50 chuyen Vat Lieu {F5F5F5}, vui long di xin viec {FFCD00}Buon Vat Lieu\n\n\
			{F54D42}Phan Thuong: {5FD068}300 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 6", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 6:
		{
			format(string, sizeof(string),
			"{F5F5F5}Che tao {F54D42}30 mon do {F5F5F5}, vui long di xin viec {FFCD00}Tho Thu Cong\n\n\
			{F54D42}Phan Thuong: {5FD068}1.000 Vat Lieu {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 7", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 7:
		{
			format(string, sizeof(string),
				"{F5F5F5}Trong {F54D42}10 cay can sa {F5F5F5}, tren Map nhung Vung Xanh La {FFCD00}moi duoc Trong Can Sa\n\n\
			{F54D42}Phan Thuong: {5FD068}500 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 8", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 8:
		{
			format(string, sizeof(string),
				"{F5F5F5}Che tao {F54D42}20 Bang Dan (Bat Ki) {F5F5F5}, can vat lieu de che tao,  {FFCD00}/chetaodan\n\n\
			{F54D42}Phan Thuong: {5FD068}10.000 Vat Lieu {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 9", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 9:
		{
			format(string, sizeof(string),
				"{F5F5F5}Mua {F54D42}1 Chiec Xe (Bat Ki) {F5F5F5}, vui long tim duong  {FFCD00}Shop Xe Binh Dan\n\n\
			{F54D42}Phan Thuong: {5FD068}100.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 10", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 10:
		{
			format(string, sizeof(string),
				"{F5F5F5}Do RAC {F54D42}20 lan {F5F5F5}, vui long di xin viec {FFCD00}Don Rac\n\n\
			{F54D42}Phan Thuong: {5FD068}1 cay Shotgun {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 11", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 11:
		{
			format(string, sizeof(string),
				"{F5F5F5}Sua {F54D42}5 chiec xe {F5F5F5}, vui long di xin viec {FFCD00}Tho Sua Xe\n\n\
			{F54D42}Phan Thuong: {5FD068}10 Hop Com {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 12", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 12:
		{
			format(string, sizeof(string),
				"{F5F5F5}Mua {F54D42}10 Hop Nuoc Cam {F5F5F5}, vui long di tap hoa {FFCD00}Circle K\n\n\
			{F54D42}Phan Thuong: {5FD068}20.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 13", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 13:
		{
			format(string, sizeof(string),
				"{F5F5F5}Mua {F54D42}10 Com Hop {F5F5F5}, vui long di tap hoa {FFCD00}Circle K\n\n\
			{F54D42}Phan Thuong: {5FD068}200 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 14", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 14:
		{
			format(string, sizeof(string),
				"{F5F5F5}Mua {F54D42}10 Phieu An {F5F5F5}, vui long tim duong den {FFCD00}Quan An\n\n\
			{F54D42}Phan Thuong: {5FD068}250 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 15", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 15:
		{
			format(string, sizeof(string),
				"{F5F5F5}Mua {F54D42}Bao Hiem (Benh vien Bat Ki) {F5F5F5}, vui long tim duong den {FFCD00}Benh Vien\n\n\
			{F54D42}Phan Thuong: {5FD068}300 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 16", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 16:
		{
			format(string, sizeof(string),
				"{F5F5F5}Cau {F54D42}100 con Ca {F5F5F5}, vui long an vao Xin Viec {FFCD00}Cau Ca\n\n\
			{F54D42}Phan Thuong: {5FD068}300 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 17", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 17:
		{
			format(string, sizeof(string),
				"{F5F5F5}Mua {F54D42}1 Trang Phuc Bat Ki {F5F5F5}, vui long tim duong {FFCD00}Binco\n\n\
			{F54D42}Phan Thuong: {5FD068}100 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 18", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 18:
		{
			format(string, sizeof(string),
				"{F5F5F5}An Trom {F54D42}5 Cay Can Sa {F5F5F5}, vui long tim duong {FFCD00}Khu Vuc Xanh La Tren Map\n\n\
			{F54D42}Phan Thuong: {5FD068}500 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 19", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 19:
		{
			format(string, sizeof(string),
				"{F5F5F5}Gui Tien vao {F54D42}Ngan Hang {F5F5F5}, vui long tim duong {FFCD00}Ngan Hang\n\n\
			{F54D42}Phan Thuong: {5FD068}300 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 20", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 20:
		{
			format(string, sizeof(string),
				"{F5F5F5}Khai thac {F54D42}300 Quang (Bat Ki) {F5F5F5}, vui long xin viec {FFCD00}Dao Vang\n\n\
			{F54D42}Phan Thuong: {5FD068}1.200 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 21", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 21:
		{
			format(string, sizeof(string),
				"{F5F5F5}Che tao {F54D42}5 Cay Xeng (Thanh Cong moi duoc tinh) {F5F5F5}, vui long xin viec {FFCD00}Lo Luyen Kim\n\n\
			{F54D42}Phan Thuong: {5FD068}100.000$ SAD {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 22", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}
		case 22:
		{
			format(string, sizeof(string),
				"{F5F5F5}Ra Dao Dau Lau {F54D42}Dao Kho Bau 100 Lan {F5F5F5}, vui long tim duong {FFCD00}Dao Dau Lau\n\n\
			{F54D42}Phan Thuong: {5FD068}1.500 XP {F5F5F5}va 1 Manh {FF8356}Sieu Xe FLASH\n\n\
			{F54D42}Tien do dang hoan thanh: {FFCD00}%i{F5F5F5}/{FF8356}%i\n\n"
				, tiendo-1,DieuKienNhiemVu(nhiemvuid)-1);
			ShowPlayerDialog(playerid, DIALOG_NHIEMVU2, DIALOG_STYLE_MSGBOX,"{FFCD00}Nhiem Vu 23", string, "{5FD068}Nhan thuong", "{F5DF99}Tu choi");
		}

	}
}


NhanThuongNhiemVuChinh(playerid, nhiemvuid, tiendo)
{
	if( ((tiendo - DieuKienNhiemVu(nhiemvuid)) == 0)  )
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
			case 3:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 200;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 4");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}200 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 4:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pCash] += 40000;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 5");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}40.000$ SAD {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 5:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 300;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 6");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}300 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 6:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pMats] += 1000;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 7");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}1.000 Vat Lieu {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 7:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 500;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 8");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}500 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 8:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pMats] += 10000;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 9");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}10.000 Vat Lieu {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 9:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pCash] += 100000;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 10");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}100.000$ SAD {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 10:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				AddItem(playerid, 32500, 1);
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 11");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}1 cay Shotgun {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 11:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				AddItem(playerid, ITEM_COMHOP, 1);
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 12");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}10 Hop Com {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 12:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pCash] += 20000;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 13");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}20.000$ SAD {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 13:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 200;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 14");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}200 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 14:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 250;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 15");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}250 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 15:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 300;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 16");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}300 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 16:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 300;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 17");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}300 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 17:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 300;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 18");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}300 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 18:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 500;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 19");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}500 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 19:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 300;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 20");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}300 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 20:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 1200;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 21");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}1.200 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 21:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pCash] += 100000;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 22");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}100.000$ SAD {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
			case 22:
			{
				if(CheckTuido(playerid, ITEM_MANHXEFLASH, 1 ) == 0) return SendClientMessageEx(playerid, COLOR_GREY, "Ban phai co it nhat 1 o tui do trong");
				AddItem(playerid, ITEM_MANHXEFLASH, 1);
				PlayerInfo[playerid][pXP] += 1500;
				PlayerInfo[playerid][pNhiemVu]++;
				PlayerInfo[playerid][pTienDo] = 0;
				SendClientMessage(playerid, 0xf5f5f5ff, "Chuc mung ban vua hoan thanh {FFCD00}Nhiem Vu 23");
				SendClientMessage(playerid, 0xf5f5f5ff, "Ban nhan duoc {5FD068}1.500 XP {f5f5f5}va 1 manh {FF8356}Sieu xe Flash");
			}
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_GREY, "Ban chua hoan thanh tien do cua nhiem vu");
	}
	
	return 1;
}

