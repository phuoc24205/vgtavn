#include <YSI\y_hooks>
new chiemdong_giankhoan = 0;
new ChiemGianKhoan_Time;
new PlayerBar:Bar_ChiemGianKhoan[MAX_PLAYERS];
new Text3D:GianKhoan_Text;
new Text3D:LuongDau_Text;
new IdDangChiemGianKhoan;
new SQLIdDangChiemGianKhoan;
new Xe_GianKhoan[MAX_VEHICLES];

new ThoiGianKetThuc;
new FNGianKhoan_Time;
new PickUpBZ = -1;
new PhanLoaiGianKhoan = 0;
new tenGangSoHuuGianKhoan[64];
new idGangSoHuuGianKhoan;
new luongDauGianKhoan;
// new PickUpBZT = 0;
new tocdobom;
new GianKhoan_Zone;
new Text:HutDau_TD[1];
new PlayerBar:Bar_HutDau[MAX_PLAYERS];
new ND_DangHutDau[MAX_VEHICLES];
new ND_PlayerHutDau[MAX_PLAYERS];
new Float:PosPickUpBZ[][3] = {
{4201.7314,-1715.7354,0.4204},
{4226.5396,-1767.1803,-0.1028},
{4257.1372,-1849.9565,-1.3218},
{4243.5820,-1949.9764,0.5018},
{4189.9814,-1995.2382,1.2438},
{4146.2568,-2040.3503,0.8552},
{4097.1719,-2038.1768,0.3254},
{4051.4089,-2002.4252,0.8662},
{4019.1479,-1909.4797,-1.3960},
{4095.6902,-1810.3860,1.4842},
{4167.8184,-1750.1630,-1.4720},
{4266.9043,-1802.2148,0.9933},
{4224.8413,-1852.8076,-1.2065},
{4132.6816,-1868.0289,0.7763},
{4131.5303,-1887.0042,14.8124},
{4127.6753,-1895.9545,11.8911},
{4315.3945,-1790.6437,-1.5710},
{4287.7798,-1873.6964,-0.0127}
};

new Float:posHS_GK[][4] = {
	{4440.7227,-1908.4265,2.6859,94.6158},
	{4440.4585,-1906.2338,2.6859,83.5863},
	{4440.2593,-1904.1930,2.6859,83.5863},
	{4440.1406,-1901.6514,2.6859,83.5863},
	{4440.0273,-1899.1017,2.6859,83.5863},
	{4439.9272,-1896.3544,2.6859,83.5863},
	{4439.8174,-1893.5018,2.6859,83.5863},
	{4439.6396,-1891.2030,2.6859,83.5863},
	{4446.4258,-1892.6937,2.6859,87.7223},
	{4442.3828,-1897.2677,2.6859,96.9136},
	{4442.5747,-1903.3451,2.6859,89.3308}, // hs 1
	{3772.7830,-1898.0497,2.6859,268.9534},
	{3772.9541,-1900.4731,2.6859,262.2898},
	{3772.8811,-1903.0929,2.6859,262.2898},
	{3774.7581,-1905.5742,2.6859,262.2898},
	{3774.8435,-1908.2351,2.6859,262.2898},
	{3774.8877,-1911.2070,2.6859,262.2898},
	{3775.0449,-1913.3621,2.6859,262.2898},
	{3772.6406,-1912.8770,2.6859,262.2898},
	{3770.5188,-1912.7209,2.6859,264.5876},
	{3769.3550,-1914.1638,2.6859,264.5876}, // hs 2
	{4129.6060,-2224.9443,2.6859,5.0015},
	{4131.0898,-2224.0186,2.6859,5.0015},
	{4130.1143,-2221.1667,2.6859,5.0015},
	{4132.5703,-2220.5129,2.6859,5.0015},
	{4135.3457,-2220.6509,2.6859,5.0015},
	{4140.3452,-2221.5913,2.6859,22.2349},
	{4142.9561,-2221.2849,2.6859,8.2183},
	{4145.6611,-2221.4670,2.6859,8.2183},
	{4145.1543,-2224.5222,2.6859,8.2183},
	{4146.4219,-2226.0691,2.6859,8.2183}, // hs 3
	{4151.0801,-1560.4734,2.6859,178.1906},
	{4150.6396,-1557.3169,2.6859,178.4204},
	{4148.2769,-1562.3641,2.6859,178.4204},
	{4145.3984,-1562.6976,2.6859,178.4204},
	{4140.3789,-1561.6689,2.6859,178.1907},
	{4137.1084,-1562.0575,2.6859,178.1907},
	{4134.7998,-1562.4622,2.6859,178.1907},
	{4135.5361,-1559.0145,2.6859,178.1907},
	{4133.5933,-1559.2290,2.6859,178.1907},
	{4142.7651,-1565.3365,2.6859,175.8929}
};

new Float:xe_GK[][4] = {
	{4430.8008,-1903.9568,1.1319,74.1868},
	{4425.2183,-1891.2256,-0.4917,98.8070},
	{4431.4048,-1902.2930,0.9924,119.1363},
	{4407.9438,-1902.2728,0.5374,81.4198},// 1
	{3798.1191,-1901.6759,-1.3852,286.9325},
	{3789.6301,-1905.8584,-0.9676,308.3400},
	{3781.1519,-1886.7954,-0.9176,322.7313},
	{3772.9746,-1891.3501,1.1890,279.8105},// 2
	{4130.7744,-2208.3853,0.1351,4.4137},
	{4140.4644,-2194.4597,0.6014,0.0777},
	{4140.8960,-2214.1467,-0.5706,10.4356},
	{4153.6011,-2215.8357,-0.1140,12.3137},// 3
	{4135.9736,-1568.9357,-0.1105,163.3978},
	{4142.7207,-1582.9661,1.1002,163.4290},
	{4147.7495,-1571.9297,-0.9766,176.1511},
	{4155.7007,-1566.5665,1.0591,188.9787}// 4
};
task xhPickUpBZ[60000]()
{
	if(PickUpBZ == -1 && chiemdong_giankhoan == 1)
	{
		new rand = Random(1,18);
		PickUpBZ = CreatePickup(19056, 1, PosPickUpBZ[rand][0], PosPickUpBZ[rand][1], PosPickUpBZ[rand][2], 0);
		// PickUpBZT = 1;
		
	}
	return 1;
}
task tocdobomDauTime[600000]()
{
	luongDauGianKhoan += tocdobom;
	saveluongdau_SQL();
}
hook OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == PickUpBZ)
	{
		DestroyPickup(PickUpBZ);
		PickUpBZ = -1;
		// PickUpBZT = 0;
		new string[512];
		new rand = Random(1,8);
		switch(rand)
		{
			case 1:
			{
				GivePlayerWeapon(playerid, 35, 1);
				format(string, sizeof(string), "{FF8356}CHU Y !! {F54D42}%s {F5F5F5}vua nhat duoc vu khi {FFCD00}Bazooka {F5F5F5}tu hop qua trong cuoc chien {FFCD00}Gian Khoan Bach Ho", GetPlayerNameEx(playerid));
			}
			case 2:
			{
				GivePlayerWeapon(playerid, 16, 5);
				format(string, sizeof(string), "{FF8356}CHU Y !! {F54D42}%s {F5F5F5}vua nhat duoc 5 qua {FFCD00}Luu dan {F5F5F5}tu hop qua trong cuoc chien {FFCD00}Gian Khoan Bach Ho", GetPlayerNameEx(playerid));
			}
			case 3:
			{
				GivePlayerWeapon(playerid, 24, 50);
				format(string, sizeof(string), "{FF8356}CHU Y !! {F54D42}%s {F5F5F5}vua nhat duoc vu khi {FFCD00}Desert eagle {F5F5F5}tu hop qua trong cuoc chien {FFCD00}Gian Khoan Bach Ho", GetPlayerNameEx(playerid));
			}
			case 4:
			{
				GivePlayerWeapon(playerid, 31, 200);
				format(string, sizeof(string), "{FF8356}CHU Y !! {F54D42}%s {F5F5F5}vua nhat duoc vu khi {FFCD00}M4 {F5F5F5}tu hop qua trong cuoc chien {FFCD00}Gian Khoan Bach Ho", GetPlayerNameEx(playerid));
			}
			case 5:
			{
				SetPlayerHealth(playerid, 99);
				SetPlayerArmour(playerid, 99);
				format(string, sizeof(string), "{FF8356}CHU Y !! {F54D42}%s {F5F5F5}vua nhan duoc {FFCD00}FULL MAU GIAP {F5F5F5}tu hop qua trong cuoc chien {FFCD00}Gian Khoan Bach Ho", GetPlayerNameEx(playerid));
			}
			case 6:
			{
				GivePlayerWeapon(playerid, 25, 1000);
				format(string, sizeof(string), "{FF8356}CHU Y !! {F54D42}%s {F5F5F5}vua nhan duoc 1.000 vien dan {FFCD00}Shotgun {F5F5F5}tu hop qua trong cuoc chien {FFCD00}Gian Khoan Bach Ho", GetPlayerNameEx(playerid));
			}
			case 7:
			{
				GivePlayerWeapon(playerid, 29, 1000);
				format(string, sizeof(string), "{FF8356}CHU Y !! {F54D42}%s {F5F5F5}vua nhan duoc 1.000 vien dan {FFCD00}MP5 {F5F5F5}tu hop qua trong cuoc chien {FFCD00}Gian Khoan Bach Ho", GetPlayerNameEx(playerid));
			}
			default:
			{
				GivePlayerWeapon(playerid, 35, 1);
				format(string, sizeof(string), "{FF8356}CHU Y !! {F54D42}%s {F5F5F5}vua nhat duoc vu khi {FFCD00}Bazooka {F5F5F5}tu hop qua trong cuoc chien {FFCD00}Gian Khoan Bach Ho", GetPlayerNameEx(playerid));
			
			}
		}
		SendClientMessageToAll(0xf5f5f5ff, string);
	}
	
	return 1;
}
loadGianKhoan()
{
	new qr[256];
	format(qr, sizeof(qr), "select * from `giankhoan` where `idgiankhoan` = '%i'", 1);
	mysql_function_query(connectvgta, qr, true, "LoadGianKhoanSQL", "i", 1);
	return 1;
}
forward LoadGianKhoanSQL(index);
public LoadGianKhoanSQL(index)
{
	new rows, fields;
	cache_get_data(rows, fields, connectvgta);
	new string[256];
	if(rows > 0)
	{
		PhanLoaiGianKhoan = cache_get_field_content_int(0, "phanloai");
		idGangSoHuuGianKhoan = cache_get_field_content_int(0, "idgangsohuu");
		luongDauGianKhoan = cache_get_field_content_int(0, "luongdau");
		tocdobom = cache_get_field_content_int(0, "tocdobom");
		cache_get_field_content(0, "tengangsohuu", tenGangSoHuuGianKhoan);
		print("============== LOAD THANH CONG GIAN KHOAN BACH HO ===============");
		printf("Phan Loai Gian khoan: %i\nId Gang So huu: %i\nLuong dau Gian Khoan: %i\nTen gang: %s",
		PhanLoaiGianKhoan, idGangSoHuuGianKhoan, luongDauGianKhoan, tenGangSoHuuGianKhoan);
		new stringgk[256], stringld[256];
		if(PhanLoaiGianKhoan == 1)
		{
			format(stringgk, sizeof(stringgk), "{F54D42}Chinh Phu Los Santos {F5F5F5}dang so huu\n{FFCD00}Gian Khoan Bach Ho");
		}
		else if(PhanLoaiGianKhoan == 2)
		{
			format(stringgk, sizeof(stringgk), "{F5F5F5}Gangs {F54D42}%s {F5F5F5}dang so huu\n{FFCD00}Gian Khoan Bach Ho", tenGangSoHuuGianKhoan);
		}
		GianKhoan_Text = CreateDynamic3DTextLabel(stringgk, 0xf5f5f5ff, 4136.0767,-1900.1431,11.8911, 30.0);

		format(stringld, sizeof(stringld), 
			"{D4D925}Toc do bom {F5F5F5}dau vao mo~: {FFCD00}%d{F5F5F5}/h\n{D4D925}San luong dau {F5F5F5}dang co trong mo~: {0096FF}%d {F5F5F5}Lit",tocdobom ,luongDauGianKhoan);
		LuongDau_Text = CreateDynamic3DTextLabel(stringld, 0xf5f5f5ff, 4138.9355,-1885.8479,11.8911, 30.0);
	}
	else
	{
		print("============== KHONG LOAD DUOC GIAN KHOAN ==============");
	}
	return 1;
}
hook OnGameModeInit()
{
	loadGianKhoan();
	IdDangChiemGianKhoan = INVALID_PLAYER_ID;
	SQLIdDangChiemGianKhoan = 0;
	CreateDynamic3DTextLabel("{ffffff}Nhan {c97602}ENTER\n{ffffff}De dong {ff0000}Chiem Dong\n{ffff00}Gian Khoan Bach Ho", 0xFFFFFFFF, 4139.3115,-1893.2638,11.8911, 5.0);

	// cho lay thuyen sung
	CreateDynamic3DTextLabel("{F5F5F5}Nhan {FF8356}ALT\n{F5F5F5}De lay {F54D42}Vu Khi {f5f5f5}va {FFCD00}Thuyen", 0xF5F5F5FF, 4437.9712,-1899.3221,2.6859, 15.0); // qua 1
	CreateDynamic3DTextLabel("{F5F5F5}Nhan {FF8356}ALT\n{F5F5F5}De lay {F54D42}Vu Khi {f5f5f5}va {FFCD00}Thuyen", 0xF5F5F5FF, 3777.2278,-1906.3411,2.6859, 15.0); // qua 2
	CreateDynamic3DTextLabel("{F5F5F5}Nhan {FF8356}ALT\n{F5F5F5}De lay {F54D42}Vu Khi {f5f5f5}va {FFCD00}Thuyen", 0xF5F5F5FF, 4136.7354,-2217.6262,2.6859, 15.0); // qua 3
	CreateDynamic3DTextLabel("{F5F5F5}Nhan {FF8356}ALT\n{F5F5F5}De lay {F54D42}Vu Khi {f5f5f5}va {FFCD00}Thuyen", 0xF5F5F5FF, 4144.3608,-1565.3365,2.6859, 15.0); // qua 4

	HutDau_TD[0] = TextDrawCreate(326.599761, 420.599884, "DANG HUT DAU ....");
	TextDrawLetterSize(HutDau_TD[0], 0.229666, 0.977777);
	TextDrawAlignment(HutDau_TD[0], 3);
	TextDrawColor(HutDau_TD[0], -1);
	TextDrawSetShadow(HutDau_TD[0], 0);
	TextDrawSetOutline(HutDau_TD[0], 0);
	TextDrawBackgroundColor(HutDau_TD[0], 255);
	TextDrawFont(HutDau_TD[0], 2);
	TextDrawSetProportional(HutDau_TD[0], 1);
	TextDrawSetShadow(HutDau_TD[0], 0);

	for(new i = 0; i < MAX_VEHICLES; i++)
	{
		ND_DangHutDau[i] = INVALID_PLAYER_ID;
	}

	GianKhoan_Zone = GangZoneCreate(4025, -2015.60009765625, 4259, -1826.60009765625);
	// for(new i = 0 ; i < MAX_VEHICLES; i++)
	// {
	// 	Xe_GianKhoan[i] = INVALID_VEHICLE_ID;
	// }
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 4139.3306,-1893.2917,11.8911))
	{
		if(newkeys & KEY_SECONDARY_ATTACK)
		{
			if(GetPVarInt(playerid, "Injured") == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban dang chet khong the chiem dong.");
			if(PlayerInfo[playerid][pHanhDong] == 1) return 1;
			if(chiemdong_giankhoan == 0) return SendClientMessage(playerid, 0xAFAFAFFF, "Admin chua ban bo phat dong chiem dong, su kien dien ra tu {D72323}20h-21h thu 5 {AFAFAF}va {D72323}thu 7{AFAFAF} Hang tuan");
			if(PlayerInfo[playerid][pFMember] >= INVALID_FAMILY_ID && !IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Chi co {D72323}Gangster {AFAFAF}hoac {D72323}Canh Sat{AFAFAF} moi co the chiem dong");
			if(IdDangChiemGianKhoan != INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Gian khoan nay dang co nguoi chiem.");
			if(ThoiGianKetThuc > 0)
			{
				KillTimer(FNGianKhoan_Time);
			}
			PlayerInfo[playerid][pHanhDong] = 1;
			SetPlayerPos(playerid, 4139.3306,-1893.2917,11.8911);
			SetPlayerFacingAngle(playerid, 274.9159);
			ClearAnimations(playerid);
			PreloadAnimLib(playerid, "POLICE");
			ApplyAnimation(playerid, "POLICE", "CopTraf_Stop", 4.0, 1, 0, 0, 1, 0, 1);
			PlayerPlaySound(playerid, 1058, 0.0, 0.0, 0.0);
			new string[128];
			format(string, sizeof(string), "CHU Y !! %s dang chiem gian khoan", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			SetPVarInt(playerid, "ChiemGianKhoan", 60);
			ChiemGianKhoan_Time = SetTimerEx("ChiemGianKhoan_VGTA", 500, true, "i", playerid);
			IdDangChiemGianKhoan = playerid;
			SQLIdDangChiemGianKhoan = GetPlayerSQLId(playerid);
			

		}
	}
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 4437.9712,-1899.3221,2.6859) || IsPlayerInRangeOfPoint(playerid, 5.0, 3777.2278,-1906.3411,2.6859)
	|| IsPlayerInRangeOfPoint(playerid, 5.0, 4136.7354,-2217.6262,2.6859) || IsPlayerInRangeOfPoint(playerid, 5.0, 4144.3608,-1565.3365,2.6859) )
	{
		if(newkeys & KEY_WALK)
		{
			if(chiemdong_giankhoan == 0) return SendClientMessage(playerid, COLOR_GREY, "Tran chien chua dien ra, khong the nhan qua !");
			ShowPlayerDialog(playerid, DIALOG_NHANVUKHIGIANKHOAN, DIALOG_STYLE_MSGBOX, "{FFCD00}Nhan Vu Khi FREE", 
				"{F5F5F5}Nhan {F54D42}Vu Khi {F5F5F5}chien dau va {FF8356}Thuyen ( Free )\n\n\
				{F54D42}[*] Luu y: {F5F5F5}Toan bo vu khi dang tren nguoi {FF8356}se bien mat{F5F5F5}, vi vay hay thao ra cat vao tui do truoc khi nhan vu khi Free !!!"
				, "{FFCD00}Nhan Vu Khi", "{F5F5F5}Tu choi");
		}
	}
	return 1;
}
chiemgiankhoan_save()
{
	new string[256];
	format(string, sizeof(string), 
		"update `giankhoan` set `phanloai` = '%i', `idgangsohuu` = '%i', `tengangsohuu` = '%s' where `idgiankhoan` = '%i' "
		, PhanLoaiGianKhoan, IdDangChiemGianKhoan, tenGangSoHuuGianKhoan, 1);
	mysql_query(connectvgta, string);
}
luongdau_save()
{
	new string[256];
	format(string, sizeof(string), 
		"update `giankhoan` set `luongdau` = '%d' where `idgiankhoan` = '%i' "
		, luongDauGianKhoan, 1);
	mysql_query(connectvgta, string);
}
forward ChiemGianKhoan_VGTA(playerid);
public ChiemGianKhoan_VGTA(playerid)
{
	if(GetPVarInt(playerid, "ChiemGianKhoan") > 0)
	{
		SetPVarInt(playerid, "ChiemGianKhoan", GetPVarInt(playerid, "ChiemGianKhoan") - 1);
		// new string[128];
		// format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Dang chiem dong: %d giay con lai", GetPVarInt(playerid, "ChiemCanCu"));
		// GameTextForPlayer(playerid, string, 1100, 3);
		SetPlayerProgressBarValue(playerid, Bar_ChiemGianKhoan[playerid], GetPVarInt(playerid, "ChiemGianKhoan") );
		ShowPlayerProgressBar(playerid, Bar_ChiemGianKhoan[playerid]);
	}
	else
	{
		new string[256];
		if(IsACop(playerid))
		{
			PhanLoaiGianKhoan = 1;
			format(string, sizeof(string), "{F54D42}%s {F5F5F5}dang chiem Gian Khoan Bach Ho, sau 15 phut neu khong ai chiem se thuoc ve{F54D42} Chinh Phu Los Santos !", GetPlayerNameEx(playerid));
		}
		else
		{
			PhanLoaiGianKhoan = 2;
			format(string, sizeof(string), "{F54D42}%s {F5F5F5}dang chiem Gian Khoan Bach Ho, sau 15 phut neu khong ai chiem se thuoc ve Gangs {F54D42}%s !", GetPlayerNameEx(playerid), FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
		}
		SendClientMessageToAll(0xF5F5F5FF, string);
		IdDangChiemGianKhoan = INVALID_PLAYER_ID;
		DeletePVar(playerid, "ChiemGianKhoan");
		HidePlayerProgressBar(playerid, Bar_ChiemGianKhoan[playerid]);
		PlayerInfo[playerid][pHanhDong] = 0;
		ClearAnimations(playerid);
		KillTimer(ChiemGianKhoan_Time);
		ThoiGianKetThuc = 60;
		FNGianKhoan_Time = SetTimerEx("Time_FNGianKhoan", 1000, true, "i",playerid);
	}
	return 1;
}
hook OnPlayerSpawn(playerid) {
	GangZoneShowForPlayer(playerid, GianKhoan_Zone, 0x00FFFFFF);
	return 1;
}
forward Time_FNGianKhoan(playerid);
public Time_FNGianKhoan(playerid)
{
	if(ThoiGianKetThuc > 0)
	{
		ThoiGianKetThuc--;
	}
	else
	{
		KillTimer(FNGianKhoan_Time);
		KetThucChiemGianKhoan(playerid);
	}
	return 1;
}

stock KetThucChiemGianKhoan(playerid)
{
	if(SQLIdDangChiemGianKhoan != GetPlayerSQLId(playerid)) return SendClientMessageToAll(0xF54D42FF, "Nguoi choi dang chiem {FFCD00}Gian Khoan Bach Ho {F54D42}thoat ra trong luc chiem, chiem dong that bai.");
	new string[256];
	if(PhanLoaiGianKhoan == 1)
	{
		idGangSoHuuGianKhoan = 0;
		tenGangSoHuuGianKhoan = "Chinh Phu Los Santos";
		format(string, sizeof(string), "{F5F5F5}[THONG BAO] {F54D42}CHINH PHU LOS SANTOS {F5F5F5}da chiem thanh cong \n{FFCD00}Gian Khoan Bach Ho");
	}
	else if(PhanLoaiGianKhoan == 2)
	{
		idGangSoHuuGianKhoan = PlayerInfo[playerid][pFMember];
		format(tenGangSoHuuGianKhoan, sizeof(tenGangSoHuuGianKhoan), "%s", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
		format(string, sizeof(string), "{F5F5F5}[THONG BAO] Gangs {F54D42}%s {F5F5F5}da chiem thanh cong \n{FFCD00}Gian Khoan Bach Ho", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
	}
	SendClientMessageToAll(0xF5F5F5FF, string);
	if(PhanLoaiGianKhoan == 1)
	{
		format(string, sizeof(string), "{F54D42}CHINH PHU LOS SANTOS {F5F5F5}da chiem thanh cong \n{FFCD00}Gian Khoan Bach Ho");
	}
	else if(PhanLoaiGianKhoan == 2)
	{
		format(string, sizeof(string), "{F5F5F5}Gangs {F54D42}%s {F5F5F5}da chiem thanh cong \n{FFCD00}Gian Khoan Bach Ho", FamilyInfo[PlayerInfo[playerid][pFMember]][FamilyName]);
	}
	UpdateDynamic3DTextLabelText(GianKhoan_Text, 0xFFFFFFFF, string);
	chiemgiankhoan_save();
	IdDangChiemGianKhoan = INVALID_PLAYER_ID;
	SQLIdDangChiemGianKhoan = 0;
	chiemdong_giankhoan = 0;
	ThoiGianKetThuc = 0;
	return 1;
}

hook OnPlayerDeath(playerid)
{
	if(GetPVarInt(playerid, "ChiemGianKhoan"))
	{
		IdDangChiemGianKhoan = INVALID_PLAYER_ID;
		DeletePVar(playerid, "ChiemGianKhoan");
		HidePlayerProgressBar(playerid, Bar_ChiemGianKhoan[playerid]);
		PlayerInfo[playerid][pHanhDong] = 0;
		ClearAnimations(playerid);
		KillTimer(ChiemGianKhoan_Time);
		SQLIdDangChiemGianKhoan = 0;
	}
	if(IsPlayerInRangeOfPoint(playerid, 750.0, 4134.4922,-1890.7661,0.7778) && chiemdong_giankhoan == 1)
	{
		SetPlayerHealth(playerid, 99999);
		SetTimerEx("HoiSinhGK", 5000, false, "i", playerid);
		
	}
	if(Xe_GianKhoan[playerid] != INVALID_VEHICLE_ID)
	{
		DestroyVehicle(Xe_GianKhoan[playerid]);
	}
	return 1;
}

forward HoiSinhGK(playerid);
public HoiSinhGK(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HOISINHGIANKHOAN, DIALOG_STYLE_MSGBOX, "{FFCD00}Ban muon hoi sinh O Dau?", "{F5F5F5}Hoi sinh o {F54D42}Gan Day {F5F5F5}hoac hoi sinh ve {FF8356}Benh Vien", "{F54D42}Gan Day", "{FF8356}Benh Vien");
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(GetPVarInt(playerid, "ChiemGianKhoan"))
	{
		IdDangChiemGianKhoan = INVALID_PLAYER_ID;
		DeletePVar(playerid, "ChiemGianKhoan");
		HidePlayerProgressBar(playerid, Bar_ChiemGianKhoan[playerid]);
		PlayerInfo[playerid][pHanhDong] = 0;
		ClearAnimations(playerid);
		KillTimer(ChiemGianKhoan_Time);
		SQLIdDangChiemGianKhoan = 0;
	}
	if(ND_PlayerHutDau[playerid] != INVALID_PLAYER_ID) EndHutDau(playerid);
	if(Xe_GianKhoan[playerid] != INVALID_VEHICLE_ID)
	{
		DestroyVehicle(Xe_GianKhoan[playerid]);
	}
	return 1;
}
EndHutDau(playerid){
	ND_DangHutDau[ND_PlayerHutDau[playerid]] = INVALID_PLAYER_ID;
	ND_PlayerHutDau[playerid] = INVALID_PLAYER_ID;
	HidePlayerProgressBar(playerid, Bar_HutDau[playerid]);
	TextDrawHideForPlayer(playerid, HutDau_TD[0]);
	return 1;
}
hook OnPlayerConnect(playerid)
{
	Bar_ChiemGianKhoan[playerid] = CreatePlayerProgressBar(playerid, 245.000000, 401.000000, 151.000000, 11.199999, 869072810, 60.0000, 0);
	Bar_HutDau[playerid] = CreatePlayerProgressBar(playerid, 245.000000, 431.000000, 151.000000, 11.199999, 869072810, 100.0000, 0);
	ND_PlayerHutDau[playerid] = INVALID_PLAYER_ID;
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_HOISINHGIANKHOAN)
	{
		if(response)
		{
			ClearAnimations(playerid);
			KillEMSQueue(playerid);
            ResetPlayerWeaponsEx(playerid);
            PlayerInfo[playerid][pHanhDong] = 0;
            // SpawnPlayer(playerid);
   //          DeletePVar(playerid, "IsFrozen");
			// DeletePVar(playerid, "PlayerCuffed");
			PlayerCuffed[playerid] = 0;
			PlayerTied[playerid] = 0;
			TogglePlayerControllable(playerid, 1);
			GivePlayerWeapon(playerid, 29, 1000);
			GivePlayerWeapon(playerid, 25, 1000);
			GivePlayerWeapon(playerid, 44, 1);
			GivePlayerWeapon(playerid, 16, 3);
			new rand = random(42);
			SetPlayerPos(playerid, posHS_GK[rand][0], posHS_GK[rand][1], posHS_GK[rand][2]+0.5);
			SetPlayerFacingAngle(playerid, posHS_GK[rand][3]);
			SetPlayerInterior(playerid,0);
			SetPlayerVirtualWorld(playerid, 0);
			
			
		}
		else
		{
			KillEMSQueue(playerid);
            ResetPlayerWeaponsEx(playerid);
            PlayerInfo[playerid][pHanhDong] = 0;
            SpawnPlayer(playerid);
		}
	}
	else if(dialogid == DIALOG_TRIEUTAPGIANKHOAN)
	{
		if(response)
		{
			if(GetPVarInt(playerid, "Injured") == 1) return SendClientMessageEx(playerid, COLOR_GREY,"Ban dang bi thuong khong the tham gia");
			if(GetPVarInt(playerid, "EventCD")) return SendClientMessageEx(playerid, COLOR_GREY,"Ban dang tham gia su kien khong the tham gia");
			if(PlayerInfo[playerid][pJailTime] > 0) return SendClientMessageEx(playerid, COLOR_GREY,"Ban dang trong tu khong the tham gia");
			PlayerInfo[playerid][pHanhDong] = 0;
            DeletePVar(playerid, "IsFrozen");
			DeletePVar(playerid, "PlayerCuffed");
			PlayerCuffed[playerid] = 0;
			PlayerTied[playerid] = 0;
			TogglePlayerControllable(playerid, 1);
			new rand = random(42);
			SetPlayerPos(playerid, posHS_GK[rand][0], posHS_GK[rand][1], posHS_GK[rand][2]+0.5);
			SetPlayerFacingAngle(playerid, posHS_GK[rand][3]);
			SetPlayerInterior(playerid,0);
			SetPlayerVirtualWorld(playerid, 0);
			TinhToanNVChinh(playerid, 25);
		}
	}
	else if(dialogid == DIALOG_NHANVUKHIGIANKHOAN)
	{
		if(response)
		{
			ResetPlayerWeaponsEx(playerid);
			GivePlayerWeapon(playerid, 29, 1000);
			GivePlayerWeapon(playerid, 25, 1000);
			GivePlayerWeapon(playerid, 44, 1);
			GivePlayerWeapon(playerid, 16, 3);
			SetPlayerHealth(playerid, 99);
			SetPlayerArmour(playerid, 99);
			new randcl = Random(1,4);
			if(Xe_GianKhoan[playerid] != INVALID_VEHICLE_ID)
			{
				DestroyVehicle(Xe_GianKhoan[playerid]);
			}
			if(IsPlayerInRangeOfPoint(playerid, 30.0, 4437.9712,-1899.3221,2.6859) )
			{
				new rand = random(4);
				Xe_GianKhoan[playerid] = CreateVehicle(473, xe_GK[rand][0], xe_GK[rand][1], xe_GK[rand][2], xe_GK[rand][3], randcl, randcl, -1);
				
			}
			else if(IsPlayerInRangeOfPoint(playerid, 30.0, 3777.2278,-1906.3411,2.6859))
			{
				new rand = Random(4,8);
				Xe_GianKhoan[playerid] = CreateVehicle(473, xe_GK[rand][0], xe_GK[rand][1], xe_GK[rand][2], xe_GK[rand][3], randcl, randcl, -1);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 30.0, 4136.7354,-2217.6262,2.6859))
			{
				new rand = Random(8,12);
				Xe_GianKhoan[playerid] = CreateVehicle(473, xe_GK[rand][0], xe_GK[rand][1], xe_GK[rand][2], xe_GK[rand][3], randcl, randcl, -1);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 30.0, 4144.3608,-1565.3365,2.6859))
			{
				new rand = Random(12,16);
				Xe_GianKhoan[playerid] = CreateVehicle(473, xe_GK[rand][0], xe_GK[rand][1], xe_GK[rand][2], xe_GK[rand][3], randcl, randcl, -1);
			}
			VehicleFuel[Xe_GianKhoan[playerid]] = 100.0;
			Vehicle_ResetData(Xe_GianKhoan[playerid]);
			LinkVehicleToInterior(Xe_GianKhoan[playerid], 0);
			SetVehicleVirtualWorld(Xe_GianKhoan[playerid], 0);
			PutPlayerInVehicle(playerid, Xe_GianKhoan[playerid], 0);
		}
	}
	return 1;
}

CMD:phatdonggiankhoan(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1337) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay !");
	if(chiemdong_giankhoan == 0)
	{
		new string[256];
		format(string, sizeof(string), "{F54D42}Adminstrator %s{F5F5F5} vua {F54D42}PHAT DONG {FF8356}chiem dong {FFCD00}Gian Khoan Bach Ho{F5F5F5}", GetPlayerNameEx(playerid) );
		SendClientMessageToAll(COLOR_WHITE, string);
		SendClientMessageToAll(COLOR_WHITE, "{FF8356}Y {F5F5F5}> {FF8356}Tim Duong LS {F5F5F5}> {FF8356}Gian Khoan Bach Ho{F5F5F5}, de chiem dong !");
		chiemdong_giankhoan = 1;
	}
	else
	{
		SendClientMessageToAll(COLOR_WHITE, "{F54D42}Adminstrator {F5F5F5}vua {F54D42}KET THUC {FF8356}chiem dong {FFCD00}Gian Khoan Bach Ho{F5F5F5}, tat ca dung laiiii !!");
		chiemdong_giankhoan = 0;
	}
	foreach( new i: Player)
	{
		ShowPlayerDialog(i, DIALOG_TRIEUTAPGIANKHOAN, DIALOG_STYLE_MSGBOX, "{FFCD00}Trieu tap den Khu Chiem Dong Gian Khoan", 
			"{F5F5F5}Ban co muon dich chuyen den {F54D42}Khu Chiem Dong Gian Khoan {f5f5f5}khong?", "{f5f5f5}Dong Y", "Tu choi");
	}
	return 1;
}
CMD:chinhtocdodau(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 99999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay !");
	new string[128],stringld[128], money;
	if(sscanf(params, "d", money)) return SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /chinhtocdodau [toc do]/h");
	tocdobom = money;
	format(string, sizeof(string), "Ban da dieu chinh toc do bom dau cua gian khoan bach ho thanh %d/h !",money);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "%s da dieu chinh toc do bom dau cua gian khoan bach ho thanh %d/h (/chinhtocdodau)", GetPlayerNameEx(playerid),money);
	Log("logs/chinhtocdodau.log", string);
	saveluongdau_SQL();
	
	return 1;
}
CMD:chinhluongdau(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 99999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay !");
	new string[128],stringld[128], money;
	if(sscanf(params, "d", money)) return SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /chinhluongdau [luong dau]");
	luongDauGianKhoan = money;
	format(string, sizeof(string), "Ban da dieu chinh luong dau cua gian khoan bach ho thanh %d !",money);
	SendClientMessageEx(playerid, COLOR_WHITE, string);
	format(string, sizeof(string), "%s da dieu chinh luong dau cua gian khoan bach ho thanh %d (/chinhluongdau)", GetPlayerNameEx(playerid),money);
	Log("logs/chinhluongdau.log", string);
	saveluongdau_SQL();
	
	return 1;
}

saveluongdau_SQL()
{
	new string[128],stringld[256];
	format(string, sizeof(string), "update `giankhoan` set `tocdobom` = '%d', luongdau = '%d' where `idgiankhoan` = '%i'", 
		tocdobom, luongDauGianKhoan, 1);
	mysql_query(connectvgta, string);
	format(stringld, sizeof(stringld), 
			"{D4D925}Toc do bom {F5F5F5}dau vao mo~: {FFCD00}%d{F5F5F5}/h\n{D4D925}San luong dau {F5F5F5}dang co trong mo~: {0096FF}%d {F5F5F5}Lit",tocdobom ,luongDauGianKhoan);
	UpdateDynamic3DTextLabelText(LuongDau_Text, 0xf5f5f5FF, stringld);
	
}

CMD:hutdau(playerid)
{
	if(!IsPlayerInGangZone(playerid, GianKhoan_Zone)) return SendClientMessage(playerid, COLOR_WHITE, "Ban khong o trong khu vuc hut dau hay bat map len va di den vi tri hut dau");
	if(PlayerInfo[playerid][pHungers] <= 0)
	{
		return SendClientMessage(playerid, COLOR_GREY, "Ban doi bung khong the lam viec hay den cua hang {ff0000}Y > {ff0000}Tim Duong{afafaf} > {ff0000}CircleK {afafaf}hoac di {ff0000}Cau Ca.");
	}
	new Vehicle_ID = GetPlayerVehicleID(playerid);
	if(GetVehicleModel(Vehicle_ID) != 453) return SendClientMessage(playerid, COLOR_WHITE, "Ban phai ngoi tren thuyen hut dau (Reefer)");
	if(PhanLoaiGianKhoan == 1)
	{
		if(!IsACop(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Gian khoan nay dang bi Chinh Phu Los Santos chiem giu, chi co canh sat moi co the hut dau.");
	}
	else if(PhanLoaiGianKhoan == 2)
	{
		if(idGangSoHuuGianKhoan != PlayerInfo[playerid][pFMember]) return SendClientMessage(playerid, COLOR_GREY, "Gangs ban khong so huu gian khoan nay, khong the hut dau.");
	}
	
	ND_PlayerHutDau[playerid] = Vehicle_ID;
	new slotid = InventoryItemCheck(playerid, ITEM_DAUKHAITHAC, 1);
	if(InventoryItemCheck(playerid, ITEM_DAUKHAITHAC, 1) != 50) 
	{
		SetPlayerProgressBarValue(playerid, Bar_HutDau[playerid], PlayerInfo[playerid][pInvAmount][slotid]);
	}
	else SetPlayerProgressBarValue(playerid, Bar_HutDau[playerid], 0);
	ShowPlayerProgressBar(playerid, Bar_HutDau[playerid]);
	TextDrawShowForPlayer(playerid, HutDau_TD[0]);
	defer HutDau(playerid);

	TinhToanNVChinh(playerid, 27);
	// new string[256];
	// format(string, sizeof(string), "id xe nay dang la: %d - Vehicle_ID nay dang la %d", ND_DangHutDau[Vehicle_ID], Vehicle_ID);
	// SendClientMessage(playerid, -1, string);
	return 1;
}

timer HutDau[50000](playerid) {
	if(!IsPlayerInGangZone(playerid, GianKhoan_Zone))
	{
		SendClientMessage(playerid, 0xF54D42FF, "[Hut Dau Gian Khoan] Ban da roi khoi khu vuc hut dau");
		EndHutDau(playerid);
		return 1;
	}
	if(InventoryItemCheck(playerid, ITEM_DAUKHAITHAC, 100) == 50)
	{
		new strings[64];
		new render = Random(1,5);
		new kiemtra = luongDauGianKhoan - render;
		if(kiemtra >= 0)
		{
			format(strings, sizeof(strings), "+%i Thung Dau Khai Thac", render);
			Notify_Send(playerid, strings, 1000);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, strings);
			AddItem(playerid, ITEM_DAUKHAITHAC, render);
			new slotid = InventoryItemCheck(playerid, ITEM_DAUKHAITHAC, 1);
			SetPlayerProgressBarValue(playerid, Bar_HutDau[playerid], PlayerInfo[playerid][pInvAmount][slotid]);
			defer HutDau(playerid);
			luongDauGianKhoan -= render;
			saveluongdau_SQL();
		}
		else
		{
			SendClientMessage(playerid, 0xF54D42FF, "Luong dau trong gian khoan da het");
			EndHutDau(playerid);
		}
		
	}
	else if(InventoryItemCheck(playerid, ITEM_DAUKHAITHAC, 100) != 50)
	{
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ban da hut du 100 thung dau hay dem di ban");
		EndHutDau(playerid);
	}
	return 1;
}