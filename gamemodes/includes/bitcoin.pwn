#include <YSI\y_hooks>

CMD:setseicoin(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 99999)
	{
		new string[128], giveplayerid, money;
		if(sscanf(params, "ud", giveplayerid, money)) return SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /setseicoin [player] [seicoin]");
		if(IsPlayerConnected(giveplayerid))
		{
			PlayerInfo[playerid][pSeicoin] = money;
			format(string, sizeof(string), "Ban da dieu chinh Seicoin cua %s's thanh %d !",GetPlayerNameEx(giveplayerid),money);
			SendClientMessageEx(playerid, COLOR_WHITE, string);
			format(string, sizeof(string), "%s da dieu chinh Seicoin %s's thanh %d (/setseicoin)", GetPlayerNameEx(playerid), GetPlayerNameEx(giveplayerid),money);
			Log("logs/setseicoin.log", string);
		}
	}
	else
	{
		SendClientMessageEx(playerid, COLOR_GRAD1, "Ban khong duoc phep su dung lenh nay.");
	}
	return 1;
}

enum eMayDaoSeicoin{
	Float:PosX,
	Float:PosY,
	Float:PosZ,
	idsqlSoHuu,
	tensoHuu[32],
	card1,
	card2,
	card3,
	card4,
	card5,
	card6,
	card7,
	card8,
	diennang,
	doben,
	Float:tocdo,
	Float:seicoinDangCo
}
new maydaoSeicoin[][eMayDaoSeicoin] = {
	//posX		posY       PosZ  idsql  tensh  c1 c2 c3 c4 c5 c6 c7 c8 diennanng doben tocdo dangco
	{2425.0518,-1778.5438,13.5628, 193, "HAC", 1, 10, 5, 6, 7, 8, 12, 17,    24,     6480,0.5, 0.0},
	{2424.9949,-1776.1885,13.5628, 1279, "LONG"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      2000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0},
	{2424.9949,-1773.4218,13.5628, 0, "VGTA"  , 0, 0, 0, 0, 0, 0, 0, 0,  24,      1000, 0.5, 0.0}
};
new Text3D:maydaoSeicoinText[19];

// loadSeicoin()
// {
// 	new Cache:rs, ten[32],qr[256],string[256];
// 	format(qr, sizeof(qr), "select `Username` from `accounts` where `id` = %i ", 193);
// 	rs = mysql_query(connectvgta, qr);
// 	cache_get_field_content(0, "Username", ten);
// 	if(cache_num_rows())
// 	{
// 		printf("%s chay thanh cong bitcoin", ten);
// 	}
// 	else
// 	{
// 		print("chay that bai bitcoin");
// 	}
// 	for(new i = 0; i < sizeof(maydaoSeicoin); i++)
// 	{
// 		if(maydaoSeicoin[i][idsqlSoHuu] == 0 )
// 		{
// 			format(string, sizeof(string), "May dao {f51e0f}%i\n{FFFFFF}Chua ai so huu\nGia: {73e615}200.000 VND\n{FFFFFF}Lien He Admin {f51e0f}HAC {FFFFFF}de mua\n{c97602}ALT {FFFFFF}de tuong tac", i+1);
// 		}
// 		else
// 		{
// 			format(string, sizeof(string), "May dao {f51e0f}%i\n{FFFFFF}So huu: {f51e0f}%s\n{FFFFFF}Dien nang: {dbc607}%d\n{FFFFFF}Do ben: {5c23de}%d\n{FFFFFF}Toc do: {c97602}%f/h\n{FFFFFF}Dang co: {73e615}%f\n{c97602}ALT {FFFFFF}de tuong tac", i+1, maydaoSeicoin[i][tensoHuu], maydaoSeicoin[i][diennang], maydaoSeicoin[i][doben], maydaoSeicoin[i][tocdo], maydaoSeicoin[i][seicoinDangCo]);
// 		}
// 		maydaoSeicoinText[i] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, maydaoSeicoin[i][PosX], maydaoSeicoin[i][PosY], maydaoSeicoin[i][PosZ], 1.0);
// 	}
	

	
// 	return 1;
// }

LoadSeiCoin()
{
	new sqlseicoin[256];
	format(sqlseicoin, sizeof(sqlseicoin), "select * from `bitcoin`");
	mysql_function_query(connectvgta, sqlseicoin, true, "LoadSQLSeiCoin", "i", 1);
}

forward LoadSQLSeiCoin(index);
public LoadSQLSeiCoin(index)
{
	new rows, fields;
	cache_get_data(rows, fields, connectvgta);
	new string[256];
	if(rows > 0)
	{
		for(new i = 0; i < rows; i++)
		{
			new result[32];

			cache_get_field_content(i, "PosX", result);
			maydaoSeicoin[i][PosX] = floatstr(result);

			cache_get_field_content(i, "PosY", result);
			maydaoSeicoin[i][PosY] = floatstr(result);

			cache_get_field_content(i, "PosZ", result);
			maydaoSeicoin[i][PosZ] = floatstr(result);

			maydaoSeicoin[i][idsqlSoHuu] = cache_get_field_content_int(i, "idsqlSoHuu");
			maydaoSeicoin[i][card1] = cache_get_field_content_int(i, "card1");
			maydaoSeicoin[i][card2] = cache_get_field_content_int(i, "card2");
			maydaoSeicoin[i][card3] = cache_get_field_content_int(i, "card3");
			maydaoSeicoin[i][card4] = cache_get_field_content_int(i, "card4");
			maydaoSeicoin[i][card5] = cache_get_field_content_int(i, "card5");
			maydaoSeicoin[i][card6] = cache_get_field_content_int(i, "card6");
			maydaoSeicoin[i][card7] = cache_get_field_content_int(i, "card7");
			maydaoSeicoin[i][card8] = cache_get_field_content_int(i, "card8");
			maydaoSeicoin[i][diennang] = cache_get_field_content_int(i, "diennang");
			maydaoSeicoin[i][doben] = cache_get_field_content_int(i, "doben");
			cache_get_field_content(i, "tensoHuu", maydaoSeicoin[i][tensoHuu]);

			cache_get_field_content(i, "tocdo", result);
			maydaoSeicoin[i][tocdo] = floatstr(result);

			cache_get_field_content(i, "seicoinDangCo", result);
			maydaoSeicoin[i][seicoinDangCo] = floatstr(result);
			new doBenText[32];
			if(maydaoSeicoin[i][doben] >= 4000)
			{
				doBenText = "{23de39}TOT";
			}
			else if (maydaoSeicoin[i][doben] < 4000 && maydaoSeicoin[i][doben] > 1000)
			{
				doBenText = "{dea323}BINH THUONG";
			}
			else if(maydaoSeicoin[i][doben] > 0 && maydaoSeicoin[i][doben] <= 1000)
			{
				doBenText = "{de2f23}SAP HONG";
			}
			else
			{
				doBenText = "{de2f23}HU HONG";
			}
			if(maydaoSeicoin[i][idsqlSoHuu] == 0 )
			{
				format(string, sizeof(string), "May dao {f51e0f}%i\n{FFFFFF}Chua ai so huu\nGia: {73e615}200.000 VND\n{FFFFFF}Lien He Admin {f51e0f}HAC {FFFFFF}de mua\n{c97602}ALT {FFFFFF}de tuong tac", i+1);
			}
			else
			{
				format(string, sizeof(string), "May dao {f51e0f}%i\n{FFFFFF}So huu: {f51e0f}%s\n{FFFFFF}Dien nang: {dbc607}%d\n{FFFFFF}Do ben: {5c23de}%s\n{FFFFFF}Toc do: {c97602}%f/h\n{FFFFFF}Dang co: {73e615}%f\n{c97602}ALT {FFFFFF}de tuong tac", i+1, maydaoSeicoin[i][tensoHuu], maydaoSeicoin[i][diennang], doBenText, maydaoSeicoin[i][tocdo], maydaoSeicoin[i][seicoinDangCo]);
			}
			maydaoSeicoinText[i] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, maydaoSeicoin[i][PosX], maydaoSeicoin[i][PosY], maydaoSeicoin[i][PosZ], 1.0);

		}
	}
	else
	{
		print("saiiiiiiiiiiiiiiiiii");
	}
	return 1;
}

hook OnGameModeInit()
{
	// loadSeicoin();
	CreateDynamic3DTextLabel("{ffffff}Nhan {c97602}ALT\n{ffffff}De dong {ff0000}Tien Dien{ffffff} cho \n{ffff00}May Dao Seicoin{ffffff} cua ban", 0xFFFFFFFF, 2438.6040,-1788.0612,13.5628, 5.0);
	LoadSeiCoin();
}

hook OnGameModeExit()
{

}

// time chạy bitcoin

task timeDaoBit[3600000](){

	for( new i = 0; i < sizeof(maydaoSeicoin); i++)
	{
		if(maydaoSeicoin[i][idsqlSoHuu] != 0 )
		{
			
			new Float:tocdoHT;
			tocdoHT = 0.5 + TinhTocDoCard(maydaoSeicoin[i][card1]) + TinhTocDoCard(maydaoSeicoin[i][card2]) + TinhTocDoCard(maydaoSeicoin[i][card3]) + TinhTocDoCard(maydaoSeicoin[i][card4]) + TinhTocDoCard(maydaoSeicoin[i][card5]) + TinhTocDoCard(maydaoSeicoin[i][card6]) + TinhTocDoCard(maydaoSeicoin[i][card7]) + TinhTocDoCard(maydaoSeicoin[i][card8]);
			if(maydaoSeicoin[i][diennang] > 0 && maydaoSeicoin[i][doben] > 0)
			{
				maydaoSeicoin[i][seicoinDangCo] += tocdoHT;
				maydaoSeicoin[i][diennang]--;
				maydaoSeicoin[i][doben]--;
			}
			CapNhatMayDao(i);
			sql_seicoin_save(i);
		}
	}
}
sql_seicoin_save(i)
{
	new string[512];
	format(string, sizeof(string), "UPDATE `bitcoin` SET \
	 `idsqlSoHuu` = '%i', `tensoHuu` = '%s', `card1` = '%i', `card2` = '%i', `card3` = '%i', \
	 `card4` = '%i', `card5` = '%i', `card6` = '%i', `card7` = '%i', `card8` = '%i', `diennang` = '%i', \
	 `doben` = '%i', `tocdo` = '%f', `seicoinDangCo` = '%f' WHERE `bitcoin`.`id` = %i"
	 , maydaoSeicoin[i][idsqlSoHuu], maydaoSeicoin[i][tensoHuu], maydaoSeicoin[i][card1], maydaoSeicoin[i][card2], maydaoSeicoin[i][card3],
	 maydaoSeicoin[i][card4], maydaoSeicoin[i][card5], maydaoSeicoin[i][card6], maydaoSeicoin[i][card7], maydaoSeicoin[i][card8],
	 maydaoSeicoin[i][diennang], maydaoSeicoin[i][doben], maydaoSeicoin[i][tocdo], maydaoSeicoin[i][seicoinDangCo], i+1 );
	mysql_query(connectvgta, string);
}
stock CapNhatMayDao(maydaoid)
{
	new Float:tocdoHTs;
	tocdoHTs = 0.5 + TinhTocDoCard(maydaoSeicoin[maydaoid][card1]) + TinhTocDoCard(maydaoSeicoin[maydaoid][card2]) + TinhTocDoCard(maydaoSeicoin[maydaoid][card3]) + TinhTocDoCard(maydaoSeicoin[maydaoid][card4]) + TinhTocDoCard(maydaoSeicoin[maydaoid][card5]) + TinhTocDoCard(maydaoSeicoin[maydaoid][card6]) + TinhTocDoCard(maydaoSeicoin[maydaoid][card7]) + TinhTocDoCard(maydaoSeicoin[maydaoid][card8]);
	new doBenText[32];
	if(maydaoSeicoin[maydaoid][doben] >= 4000)
	{
		doBenText = "{23de39}TOT";
	}
	else if (maydaoSeicoin[maydaoid][doben] < 4000 && maydaoSeicoin[maydaoid][doben] > 1000)
	{
		doBenText = "{dea323}BINH THUONG";
	}
	else if(maydaoSeicoin[maydaoid][doben] > 0 && maydaoSeicoin[maydaoid][doben] <= 1000)
	{
		doBenText = "{de2f23}SAP HONG";
	}
	else
	{
		doBenText = "{de2f23}HU HONG";
	}
	new string[256];
	format(string, sizeof(string), "May dao {f51e0f}%i\n{FFFFFF}So huu: {f51e0f}%s\n{FFFFFF}Dien nang: {dbc607}%d\n{FFFFFF}Do ben: %s\n{FFFFFF}Toc do: {c97602}%.2f/h\n{FFFFFF}Dang co: {73e615}%.3f\n{c97602}ALT {FFFFFF}de tuong tac", maydaoid+1, maydaoSeicoin[maydaoid][tensoHuu], maydaoSeicoin[maydaoid][diennang], doBenText , tocdoHTs , maydaoSeicoin[maydaoid][seicoinDangCo] );
	UpdateDynamic3DTextLabelText(maydaoSeicoinText[maydaoid], 0xFFFFFFFF, string);
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsPlayerInRangeOfPoint(playerid, 100.0, 2432.9023,-1781.9697,13.5628))
	{
		if(newkeys & KEY_WALK)
		{
			for( new i = 0; i < sizeof(maydaoSeicoin); i++)
			{
				if(IsPlayerInRangeOfPoint(playerid, 1.0, maydaoSeicoin[i][PosX], maydaoSeicoin[i][PosY], maydaoSeicoin[i][PosZ]))
				{
					if(GetPlayerSQLId(playerid) == maydaoSeicoin[i][idsqlSoHuu])
					{
						new Float:tocdoHT;	
						tocdoHT = 0.5 + TinhTocDoCard(maydaoSeicoin[i][card1]) + TinhTocDoCard(maydaoSeicoin[i][card2]) + TinhTocDoCard(maydaoSeicoin[i][card3])
						+ TinhTocDoCard(maydaoSeicoin[i][card4]) + TinhTocDoCard(maydaoSeicoin[i][card5]) + TinhTocDoCard(maydaoSeicoin[i][card6])
						+ TinhTocDoCard(maydaoSeicoin[i][card7]) + TinhTocDoCard(maydaoSeicoin[i][card8]) ;
						new string[1024];
						format(string, sizeof(string), "Ban dang so huu: {ff0000}%.5f {edda0c}Seicoin{ffffff}, Toc do hien tai: {ff0000}%.2f/h\n\
							{ffffff}Khe Card 1 -  %s\n\
							Khe Card 2 -  %s\n\
							Khe Card 3 -  %s\n\
							Khe Card 4 -  %s\n\
							Khe Card 5 -  %s\n\
							Khe Card 6 -  %s\n\
							Khe Card 7 -  %s\n\
							Khe Card 8 -  %s\n\
							Rut Seicoin ( rut vao tui do /thongtin )\n\
							Rut Seicoin (doi sang {edf72f}Coin{ffffff}) \n\
							Rut Seicoin (doi thanh {6aff19}VND{ffffff})\n\
							", maydaoSeicoin[i][seicoinDangCo], tocdoHT,LayTenCardGPU(maydaoSeicoin[i][card1]),
							LayTenCardGPU(maydaoSeicoin[i][card2]),LayTenCardGPU(maydaoSeicoin[i][card3]),LayTenCardGPU(maydaoSeicoin[i][card4]),
							LayTenCardGPU(maydaoSeicoin[i][card5]),LayTenCardGPU(maydaoSeicoin[i][card6]),LayTenCardGPU(maydaoSeicoin[i][card7]),
							LayTenCardGPU(maydaoSeicoin[i][card8]));
						ShowPlayerDialog(playerid, DIALOG_QUANLIMAYBITCOIN, DIALOG_STYLE_TABLIST_HEADERS, "Quan Li May Dao Seicoin", string, "Chon", "Thoat");
					}
					else
					{
						ShowPlayerDialog(playerid, DIALOG_MUAMAYBITCOIN, DIALOG_STYLE_MSGBOX, "{ffffff}Huong dan mua May Dao {fff826}Seicoin", 
							"May Dao {fff826}Seicoin{ffffff}, se tu dong dao ra {fff826}Seicoin {ffffff}toc do mac dinh {f068f7}0.5/h.\n\
							{fff826}Seicoin {ffffff}co the dung de doi ra {48ff05}VND{ffffff} ( thong qua Admin HAC ), doi ra {fff826}Coin \
							{ffffff}hoac nguoi choi tu buon ban voi nhau ( thong qua trung gian Admin {fff826}200 Seicoin{ffffff}/lan ).\n\
							Co the nang cap toc do dao cua may bang cach gan them {4df1f7}Card Do Hoa (GPU){ffffff}.\n\
							Gia: {48ff05}200.000 VND\n\
							{fa0000}Tuoi tho{ffffff} cua may {ffff00}9-12 thang\n\
							{ffffff}Lien he Admin {ff4b33}HAC{ffffff}:\n\
							\t{ff4b33}+ {f7d54d}0772.655.181\n\
							\t{ff4b33}+ {ffffff}FB Nguyen Van Hiep: {f7d54d}facebook.com/G.N.S.L.7{ffffff}", "OK","");
						
					}
				}
			}
		}
	}
	if(IsPlayerInRangeOfPoint(playerid, 5.0, 2438.6040,-1788.0612,13.5628))
	{
		if(newkeys & KEY_WALK)
		{
			new sh = 0;
			for(new i = 0; i < sizeof(maydaoSeicoin); i++)
			{
				if(maydaoSeicoin[i][idsqlSoHuu] == GetPlayerSQLId(playerid))
				{
					sh = 1;
					new string[512];
					format(string, sizeof(string), "{ffffff}Dien nang ban dang co\t{C97602}%i\n\
						{ffffff}8 {C97602}Dien Nang\t{07f50f}24.000$\n\
						{ffffff}16 {C97602}Dien Nang\t{07f50f}50.000$\n\
						{ffffff}24 {C97602}Dien Nang\t{07f50f}75.000$\n\
						{ffffff}48 {C97602}Dien Nang\t{07f50f}160.000$\n\
						{ffffff}96 {C97602}Dien Nang\t{07f50f}320.000$\n\
						{ffffff}168 {C97602}Dien Nang\t{07f50f}560.000$\n\
						{ffffff}672 {C97602}Dien Nang\t{07f50f}2.000.000$\n\
						", maydaoSeicoin[i][diennang]);
					ShowPlayerDialog(playerid, DIALOG_QUANLIMAYBITCOIN8, DIALOG_STYLE_TABLIST_HEADERS, "{ffff00}MUA DIEN NANG", 
						string, "MUA", "HUY BO");
				}

			}
			if( sh == 0)
			{
				ShowPlayerDialog(playerid, DIALOG_MUAMAYBITCOIN, DIALOG_STYLE_MSGBOX, "{ffffff}Huong dan mua May Dao {fff826}Seicoin", 
							"May Dao {fff826}Seicoin{ffffff}, se tu dong dao ra {fff826}Seicoin {ffffff}toc do mac dinh {f068f7}0.5/h.\n\
							{fff826}Seicoin {ffffff}co the dung de doi ra {48ff05}VND{ffffff} ( thong qua Admin HAC ), doi ra {fff826}Coin \
							{ffffff}hoac nguoi choi tu buon ban voi nhau ( thong qua trung gian Admin {fff826}200 Seicoin{ffffff}/lan ).\n\
							Co the nang cap toc do dao cua may bang cach gan them {4df1f7}Card Do Hoa (GPU){ffffff}.\n\
							Gia: {48ff05}200.000 VND\n\
							{fa0000}Tuoi tho{ffffff} cua may {ffff00}9-12 thang\n\
							{ffffff}Lien he Admin {ff4b33}HAC{ffffff}:\n\
							\t{ff4b33}+ {f7d54d}0772.655.181\n\
							\t{ff4b33}+ {ffffff}FB Nguyen Van Hiep: {f7d54d}facebook.com/G.N.S.L.7{ffffff}", "OK","");
			}
		}
	}
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_QUANLIMAYBITCOIN)
	{
		if(response)
		{
			if(listitem >= 0 && listitem <= 7)
			{
				SetPVarInt(playerid, "ChonCardGPU", listitem+1);// card 1
				ShowPlayerDialog(playerid, DIALOG_QUANLIMAYBITCOIN2, DIALOG_STYLE_LIST, "Quan Li Card GPU", 
						"Ban\nNang Cap", "Chon", "Thoat");
			}
			else if(listitem == 8)
			{
				ShowPlayerDialog(playerid, DIALOG_QUANLIMAYBITCOIN5, DIALOG_STYLE_INPUT, "{fa0000}Rut Seicoin /thongtin", "{ffffff}Nhap so luong: ", "RUT", "HUY");
			}
			else if(listitem == 9)
			{
				ShowPlayerDialog(playerid, DIALOG_QUANLIMAYBITCOIN6, DIALOG_STYLE_INPUT, "{fa0000}Doi Seicoin sang Coin", "{fa0000}1 Seicoin {ffffff}= {ffff00}1 Coin\n{ffffff}Nhap so luong muon doi: ", "RUT", "HUY");
			}
			else if(listitem == 10)
			{
				ShowPlayerDialog(playerid, DIALOG_QUANLIMAYBITCOIN7, DIALOG_STYLE_MSGBOX, "Doi Seicoin thanh VND", 
					"{ffffff}Huong dan doi {ffff00}Seicoin {ffffff}thanh{0eed37} VND\n\n\
					{ffffff}[{fa0000}*{ffffff}] Gia doi hien tai{ffff00} 110 Seicoin {ffffff}={0eed37} 10.000 VND\n\
					   {ffffff}[{fa0000}-{ffffff}] Lien he voi Admin {fa0000}HAC {ffffff}thong qua {fa0000}Facebook {ffffff}hoac {fa0000}SDT: 0772655181 {ffffff}de doi sang {0eed37}VND \n\
					       \n\t{ffffff}[{fa0000}+{ffffff}] Facebook: {fa0000}https://www.facebook.com/G.N.S.L.7/\n\
					       \t{ffffff}[{fa0000}+{ffffff}] SDT: {fa0000}0772655181\n\n\
					{ffffff}[{fa0000}*{ffffff}] Rut tien thong qua {fa0000}Momo, Ngan Hang {ffffff}hoac {fa0000}The Visa Quoc Te, Paypal,v.v....\n\
					{ffffff}[{fa0000}*{ffffff}] Tien se nhan duoc trong vong 15p !\n\
					\n\n\n\n\
					Cam On Ban da tin tuong va dau tu vao he thong {ffff00}Seicoin{ffffff} cua chung toi !\n\
					", "OK","" );
			}
		}
	}
	if(dialogid == DIALOG_QUANLIMAYBITCOIN2)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					new gpuDangchon;
					gpuDangchon = GetPVarInt(playerid, "ChonCardGPU");
					new string[256], tenGPUDangMuonBan[72], kiemtraGPU, giaGPUMuonBan;
					kiemtraGPU = KiemTraCardTrong(gpuDangchon, playerid);
					if(kiemtraGPU == 0) return SendClientMessage(playerid, COLOR_GREY, "Khe cam card trong, khong co card de ban !");
					tenGPUDangMuonBan = LayTenCardGPU(kiemtraGPU);
					giaGPUMuonBan = LayGiaGPU(kiemtraGPU);
					format(string, sizeof(string), "{ffffff}CPU ban muon ban la {9b40f5}%s{ffffff} voi gia {4ff540}%d {f5ef40}Seicoin", tenGPUDangMuonBan, giaGPUMuonBan/2);
					ShowPlayerDialog(playerid, DIALOG_QUANLIMAYBITCOIN3, DIALOG_STYLE_MSGBOX, "Ban Card GPU", string, "Ban", "Huy");
				
				}
				case 1:
				{
					new string[2048], szstring[2048];
					new gpuDangchon, kiemtraGPU, tenGPUDangMuonNangCap[72];
					gpuDangchon = GetPVarInt(playerid, "ChonCardGPU");
					kiemtraGPU = KiemTraCardTrong(gpuDangchon, playerid);
					tenGPUDangMuonNangCap = LayTenCardGPU(kiemtraGPU);
					for(new i = 0; i < 17; i++)
					{
						format(szstring, sizeof(szstring), "%s\n%s\tGia: {4ff540}%d {f5ef40}Seicoin", szstring,LayTenCardGPU(i+1), LayGiaGPU(i+1));
					}
					format(string, sizeof(string), "Khe %i dang xai GPU \t%s\n\
						%s\n\
						", gpuDangchon, tenGPUDangMuonNangCap, szstring);
					ShowPlayerDialog(playerid, DIALOG_QUANLIMAYBITCOIN4, DIALOG_STYLE_TABLIST_HEADERS, "Nang Cap GPU", string, "Nang Cap", "Huy");
				}
			}
		}
	}
	if(dialogid == DIALOG_QUANLIMAYBITCOIN3)
	{
		if(response)
		{
			new gpuDangchon, kiemtraGPU, giaGPUMuonBan;
			gpuDangchon = GetPVarInt(playerid, "ChonCardGPU");
			kiemtraGPU = KiemTraCardTrong(gpuDangchon, playerid);
			if(kiemtraGPU == 0) return SendClientMessage(playerid, COLOR_GREY, "LOI ! Khe cam card nay khong co card de ban.");
			giaGPUMuonBan = LayGiaGPU(kiemtraGPU)/2;
			// GivePlayerCash(playerid, giaGPUMuonBan);
			PlayerInfo[playerid][pSeicoin] += giaGPUMuonBan;
			new sgia[32];
			format(sgia, sizeof(sgia), "+%d Seicoin", giaGPUMuonBan);
			Notify_Send(playerid, sgia, 3000);
			XoaGPU(gpuDangchon, playerid);
			DeletePVar(playerid, "ChonCardGPU");

		}
	}
	if(dialogid == DIALOG_QUANLIMAYBITCOIN4)
	{
		if(response)
		{
			new gpuDangchon, kiemtraGPU, giaGPUMuonNangCap;
			gpuDangchon = GetPVarInt(playerid, "ChonCardGPU");
			kiemtraGPU = KiemTraCardTrong(gpuDangchon, playerid);
			if(kiemtraGPU >= listitem+1) return SendClientMessage(playerid, COLOR_GREY, "GPU cua ban dang xin xo hon, nang cap lam gi, khung ha !!");
			giaGPUMuonNangCap = LayGiaGPU(listitem+1);
			if(PlayerInfo[playerid][pSeicoin] < giaGPUMuonNangCap) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du Seicoin de nang cap.");
			PlayerInfo[playerid][pSeicoin] -= giaGPUMuonNangCap;
			new sgia[32];
			format(sgia, sizeof(sgia), "-%d Seicoin", giaGPUMuonNangCap);
			Notify_Send(playerid, sgia, 3000);
			NangCapGPU(gpuDangchon, playerid, listitem+1);
			DeletePVar(playerid, "ChonCardGPU");
		}
	}
	if(dialogid == DIALOG_QUANLIMAYBITCOIN5)
	{
		if(response)
		{
			if(!IsNumeric(inputtext))
			{
				return SendClientMessage(playerid, COLOR_GREY, "Khong Hop Le !");
			}
			else
			{
				new amount = strval(inputtext);
				RutSeiCoin(playerid, amount, 1);// rut seicoin vao tui do
			}
		}
	}
	if(dialogid == DIALOG_QUANLIMAYBITCOIN6)
	{
		if(response)
		{
			if(!IsNumeric(inputtext))
			{
				return SendClientMessage(playerid, COLOR_GREY, "Khong Hop Le !");
			}
			else
			{
				new amount = strval(inputtext);
				RutSeiCoin(playerid, amount, 2);// doi seicoin thanh coin
			}
		}
	}
	if(dialogid == DIALOG_QUANLIMAYBITCOIN8)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0: MuaDienNang(playerid, 24000, 8);
				case 1: MuaDienNang(playerid, 50000, 16);
				case 2: MuaDienNang(playerid, 75000, 24);
				case 3: MuaDienNang(playerid, 160000, 48);
				case 4: MuaDienNang(playerid, 320000, 96);
				case 5: MuaDienNang(playerid, 560000, 168);
				case 6: MuaDienNang(playerid, 2000000, 672);

			}
		}
	}
	return 1;
}

stock MuaDienNang(playerid, gia, luongdien)
{
	if(PlayerInfo[playerid][pCash] < gia) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du tien de mua dien nang");
	PlayerInfo[playerid][pCash] -= gia;
	for(new i = 0; i < sizeof(maydaoSeicoin); i++)
	{
		if(maydaoSeicoin[i][idsqlSoHuu] == GetPlayerSQLId(playerid) )
		{
			new string[128];
			maydaoSeicoin[i][diennang] += luongdien;
			format(string, sizeof(string), "Ban vua mua {E8F9FD}%i {C97602}dien nang voi gia {59CE8F}$%s", luongdien, number_format(gia));
			SendClientMessage(playerid, COLOR_CAM, string);
			format(string, sizeof(string), "{E8F9FD}%s {C97602}vua mua {E8F9FD}%i {C97602}dien nang voi gia {59CE8F}$%s", GetPlayerNameEx(playerid), luongdien, number_format(gia));
			SendClientMessageToAll(COLOR_CAM, string);
			Log("logs/muadiennang.log", string);
			CapNhatMayDao(i);
			sql_seicoin_save(i);
			return 1;
		}
	}
	return 1;
}

stock Float:TinhTocDoCard(cardid)
{
	new Float:tocdoCard;
	switch(cardid)
	{
		case 0: tocdoCard = 0.0;
		case 1: tocdoCard = 0.2;
		case 2: tocdoCard = 0.3;
		case 3: tocdoCard = 0.4;
		case 4: tocdoCard = 0.6;
		case 5: tocdoCard = 1.0;
		case 6: tocdoCard = 3.0;
		case 7: tocdoCard = 6.5;
		case 8: tocdoCard = 8.0;
		case 9: tocdoCard = 8.5;
		case 10: tocdoCard = 9.0;
		case 11: tocdoCard = 9.8;
		case 12: tocdoCard = 10.0;
		case 13: tocdoCard = 13.2;
		case 14: tocdoCard = 15.5;
		case 15: tocdoCard = 20.0;
		case 16: tocdoCard = 40.0;
		case 17: tocdoCard = 50.0;
	}
	return tocdoCard;
}

stock LayTenCardGPU(cardid)
{
	new tencardGPU[72];
	switch(cardid)
	{
		case 0: tencardGPU = "{c7c5c5}Trong";
		case 1: tencardGPU = "{ffe70d}VGA VSPTech GT 210  {c317fc} (0.2h)";
		case 2: tencardGPU = "{ffe70d}VGA Gigabyte GT 420 2G  {c317fc} (0.3h)";
		case 3: tencardGPU = "{ffe70d}VGA Gigabyte GT 630  {c317fc} (0.4h)";
		case 4: tencardGPU = "{ffe70d}VGA INNO3D GT 710  {c317fc} (0.6h)";
		case 5: tencardGPU = "{ffe70d}VGA Gigabyte GT 730 2G  {c317fc} (1.0h)";
		case 6: tencardGPU = "{ffe70d}VGA Asus GT 710 1G  {c317fc} (3.0h)";
		case 7: tencardGPU = "{ffe70d}VGA Colorful GT 730 2G  {c317fc} (6.5h)";
		case 8: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Galax RTX 2080  {c317fc} (8.0h)";//vip
		case 9: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Radeon RX6800  {c317fc} (8.5h)";
		case 10: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Radeon RX5600XT  {c317fc} (9.0h)";
		case 11: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Radeon RX5700XT  {c317fc} (9.8h)";
		case 12: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Radeon RX5700  {c317fc} (10.0h)";
		case 13: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Gigabyte RTX 3070  {c317fc} (13.2h)";
		case 14: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Gigabyte RTX 3080  {c317fc} (15.5h)";
		case 15: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Radeon RX6900XT  {c317fc} (20.0h)";
		case 16: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Radeon RX6800  {c317fc} (40.0h)";
		case 17: tencardGPU = "{fa3232}(VIP) {ffe70d}VGA Asus RTX 3060Ti  {c317fc} (50.0h)";
	}
	return tencardGPU;
}

stock LayGiaGPU(cardid)
{
	new giaGPU;
	switch(cardid)
	{
		case 0: giaGPU = 0;
		case 1: giaGPU = 900;
		case 2: giaGPU = 1350;
		case 3: giaGPU = 1800;
		case 4: giaGPU = 2700;
		case 5: giaGPU = 4320;
		case 6: giaGPU = 12960;
		case 7: giaGPU = 27378;
		case 8: giaGPU = 33696;
		case 9: giaGPU = 35802;
		case 10: giaGPU = 37908;
		case 11: giaGPU = 41274;
		case 12: giaGPU = 44010;
		case 13: giaGPU = 55593;
		case 14: giaGPU = 65286;
		case 15: giaGPU = 84240;
		case 16: giaGPU = 168480;
		case 17: giaGPU = 210600;
	}
	return giaGPU;
}

stock KiemTraCardTrong(cardid, playerid)
{
	for(new i = 0; i < sizeof(maydaoSeicoin); i++)
	{
		if(maydaoSeicoin[i][idsqlSoHuu] == GetPlayerSQLId(playerid) )
		{
			new loaicard;
			switch(cardid)
			{
				case 1:
				{
					if(maydaoSeicoin[i][card1] == 0 )
					{
						return 0;	
					}
					else
					{
						loaicard = maydaoSeicoin[i][card1];
						return loaicard;
					} 
				}
				case 2:
				{
					if(maydaoSeicoin[i][card2] == 0 )
					{
						return 0;	
					}
					else
					{
						loaicard = maydaoSeicoin[i][card2];
						return loaicard;
					} 
				}
				case 3:
				{
					if(maydaoSeicoin[i][card3] == 0 )
					{
						return 0;	
					}
					else
					{
						loaicard = maydaoSeicoin[i][card3];
						return loaicard;
					} 
				}
				case 4:
				{
					if(maydaoSeicoin[i][card4] == 0 )
					{
						return 0;	
					}
					else
					{
						loaicard = maydaoSeicoin[i][card4];
						return loaicard;
					} 
				}
				case 5:
				{
					if(maydaoSeicoin[i][card5] == 0 )
					{
						return 0;	
					}
					else
					{
						loaicard = maydaoSeicoin[i][card5];
						return loaicard;
					} 
				}
				case 6:
				{
					if(maydaoSeicoin[i][card6] == 0 )
					{
						return 0;	
					}
					else
					{
						loaicard = maydaoSeicoin[i][card6];
						return loaicard;
					} 
				}
				case 7:
				{
					if(maydaoSeicoin[i][card7] == 0 )
					{
						return 0;	
					}
					else
					{
						loaicard = maydaoSeicoin[i][card7];
						return loaicard;
					} 
				}
				case 8:
				{
					if(maydaoSeicoin[i][card8] == 0 )
					{
						return 0;	
					}
					else
					{
						loaicard = maydaoSeicoin[i][card8];
						return loaicard;
					} 
				}

			}
	
			
		}			
			
	}
	return 1;
}

stock XoaGPU(cardid, playerid)
{
	for(new i = 0; i < sizeof(maydaoSeicoin); i++)
	{
		if(maydaoSeicoin[i][idsqlSoHuu] == GetPlayerSQLId(playerid) )
		{
			switch(cardid)
			{
				case 1: maydaoSeicoin[i][card1] = 0;
				case 2: maydaoSeicoin[i][card2] = 0;
				case 3: maydaoSeicoin[i][card3] = 0;
				case 4: maydaoSeicoin[i][card4] = 0;
				case 5: maydaoSeicoin[i][card5] = 0;
				case 6: maydaoSeicoin[i][card6] = 0;
				case 7: maydaoSeicoin[i][card7] = 0;
				case 8: maydaoSeicoin[i][card8] = 0;
			}
			sql_seicoin_save(i);
		}
	}
	return 1;
}

stock NangCapGPU(cardid, playerid, cardNangCap)
{
	for(new i = 0; i < sizeof(maydaoSeicoin); i++)
	{
		if(maydaoSeicoin[i][idsqlSoHuu] == GetPlayerSQLId(playerid) )
		{
			switch(cardid)
			{
				case 1: maydaoSeicoin[i][card1] = cardNangCap;
				case 2: maydaoSeicoin[i][card2] = cardNangCap;
				case 3: maydaoSeicoin[i][card3] = cardNangCap;
				case 4: maydaoSeicoin[i][card4] = cardNangCap;
				case 5: maydaoSeicoin[i][card5] = cardNangCap;
				case 6: maydaoSeicoin[i][card6] = cardNangCap;
				case 7: maydaoSeicoin[i][card7] = cardNangCap;
				case 8: maydaoSeicoin[i][card8] = cardNangCap;
			}
			sql_seicoin_save(i);
		}
	}
	return 1;
}

stock RutSeiCoin(playerid, amount, loai)
{
	for(new i = 0; i < sizeof(maydaoSeicoin); i++)
	{
		if(maydaoSeicoin[i][idsqlSoHuu] == GetPlayerSQLId(playerid) )
		{
			if(maydaoSeicoin[i][seicoinDangCo] < amount) return SendClientMessage(playerid, COLOR_GREY, "May dao khong co du luong Seicon muon RUT");
			maydaoSeicoin[i][seicoinDangCo] -= float(amount);
			new string[128];
			if(loai == 1)// rut seicoin vao tui do
			{
				PlayerInfo[playerid][pSeicoin] += amount;
				format(string, sizeof(string), "{f09713}%s{ffffff} da rut thanh cong {fa0000}%d Seicoin{ffffff} vao tui do !",GetPlayerNameEx(playerid), amount);
				Log("logs/rutseicoin.log", string);
			}
			else if(loai == 2)// rut seicoin thanh coin
			{
				PlayerInfo[playerid][pCredits] += amount;
				format(string, sizeof(string), "{f09713}%s{ffffff} da doi thanh cong {fa0000}%d Seicoin{ffffff} thanh {ffff00}%d Coin ",GetPlayerNameEx(playerid), amount, amount);
				Log("logs/doiseicoin.log", string);
			}
			SendClientMessage(playerid, COLOR_WHITE, string);
			CapNhatMayDao(i);
			sql_seicoin_save(i);
		}
	}
	return 1;
}

hook OnPlayerDeath(playerid)
{
	if(GetPVarInt(playerid, "ChonCardGPU")) DeletePVar(playerid, "ChonCardGPU");
	return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	if(GetPVarInt(playerid, "ChonCardGPU")) DeletePVar(playerid, "ChonCardGPU");
	return 1;
}
hook OnPlayerConnect(playerid)
{
	if(GetPVarInt(playerid, "ChonCardGPU")) DeletePVar(playerid, "ChonCardGPU");
	return 1;
}

stock KiemTraSoHuuMayDao(playerid)
{
	for(new i = 0; i < sizeof(maydaoSeicoin); i++)
	{
		if(maydaoSeicoin[i][idsqlSoHuu] == GetPlayerSQLId(playerid) )
		{
			return false;
		}

	}
	return true;
}

CMD:setmayseicoin(playerid, params[])
{
	
	new string[128], giveplayerid, maydaoid, tennguoimua[64];
	if(sscanf(params, "ui", giveplayerid, maydaoid)) return SendClientMessageEx(playerid, COLOR_GREY, "Su Dung: /setmayseicoin [player] [So May]");
	if(IsPlayerConnected(giveplayerid))
	{
		if(KiemTraSoHuuMayDao(giveplayerid) == false) 
		{
			SendClientMessage(playerid, COLOR_GREY, "Nguoi nay da so huu may dao !");
			return 1;
		}
		else
		{
			maydaoid = maydaoid - 1;
			if(maydaoid > 17) return SendClientMessage(playerid, COLOR_GREY, "Chi co 18 may dao thoi !");
			if(maydaoSeicoin[maydaoid][idsqlSoHuu] != 0) return SendClientMessage(playerid, COLOR_GREY, "May dao nay da co nguoi so huu");
			maydaoSeicoin[maydaoid][idsqlSoHuu] = GetPlayerSQLId(giveplayerid);
			format(maydaoSeicoin[maydaoid][tensoHuu], 64, "%s", GetPlayerNameEx(giveplayerid));		
			maydaoSeicoin[maydaoid][card1] = 0;
			maydaoSeicoin[maydaoid][card2] = 0;
			maydaoSeicoin[maydaoid][card3] = 0;
			maydaoSeicoin[maydaoid][card4] = 0;
			maydaoSeicoin[maydaoid][card5] = 0;
			maydaoSeicoin[maydaoid][card6] = 0;
			maydaoSeicoin[maydaoid][card7] = 0;
			maydaoSeicoin[maydaoid][card8] = 0;
			maydaoSeicoin[maydaoid][diennang] = 24;
			maydaoSeicoin[maydaoid][doben] = 6480;
			maydaoSeicoin[maydaoid][tocdo] = 0.5;
			maydaoSeicoin[maydaoid][seicoinDangCo] = 0;
			sql_seicoin_save(maydaoid);
			CapNhatMayDao(maydaoid);
			new string[256];
			format(string, sizeof(string), "CHUC MUNG {fce91e}%s {fc1e8d}vua mua thanh cong {fce91e}May Dao Seicoin{fc1e8d}, chuc ban mau chong tro thanh ty phu !!", maydaoSeicoin[maydaoid][tensoHuu]);
			SendClientMessageToAll(0xfc1e8dff, string);
			Log("log/setmaydaoseicoin.log", string);
		}
		
	}

	return 1;
}