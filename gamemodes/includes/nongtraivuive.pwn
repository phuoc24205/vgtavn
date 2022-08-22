#include <YSI\y_hooks>
new connectvgta;


new TrongCay_Timer[MAX_PLAYERS];
new LayNuoc_Timer[MAX_PLAYERS];
enum eNongTraiPos{
	Float:PosX,
    Float:PosY,
    Float:PosZ,
    idnguoitrong,
    loaicay,
    tangtruong,
    maxtangtruong,
    solanxoidat,
    idobject,
    tensohuu[32],
    phattriencay,
    dangtrong,
    idobjectsql
}
new Text3D:NongTraiText[30];
new NongTraiPoints[][eNongTraiPos] = {
	{976.6864, -365.3920, 68.9003, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{976.6864, -359.3620, 68.9003, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{976.6864, -353.3518, 68.7404, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{976.6864, -347.2219, 68.5904, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{976.6864, -341.3117, 68.4704, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{976.6864, -335.3118, 68.3604, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{976.6864, -329.2918, 68.1404, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{976.6864, -323.2619, 67.9703, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{976.6864, -317.2218, 67.9703, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{976.6864, -311.1719, 67.8103, 0, 0, 0, 240, 0, 19320, "VGTA", 0},// het lane 1
	{953.1219, -311.3925, 60.9509, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{953.1519, -317.4324, 61.3109, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{953.1165, -323.2125, 61.5380, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{953.1506, -329.3627, 61.8370, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{953.1044, -335.4325, 62.1334, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{953.1409, -341.3424, 62.4832, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{953.1889, -347.4124, 62.8247, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{953.1502, -353.4724, 63.0717, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{953.1130, -359.3025, 63.3088, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{953.0540, -365.4026, 63.6842, 0, 0, 0, 240, 0, 19320, "VGTA", 0},// het lane 2
	{930.4226, -365.4765, 57.1596, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{930.4623, -359.5065, 56.9027, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{930.5172, -353.4364, 56.5469, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{930.5767, -347.3264, 56.1615, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{930.6225, -341.4965, 55.8650, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{930.4810, -335.3466, 55.4688, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{930.5346, -329.4366, 55.1229, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{930.6002, -323.4266, 54.6980, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{930.6460, -317.4168, 54.4015, 0, 0, 0, 240, 0, 19320, "VGTA", 0},
	{930.4439, -311.3267, 54.1375, 0, 0, 0, 240, 0, 19320, "VGTA", 0}// het lane 3
};
task NongTraiVuiVe[1000]() 
{
	for(new i = 0; i < sizeof(NongTraiPoints); i++)
    {
    	if(NongTraiPoints[i][loaicay] >= 1)
    	{
    		NongTraiPoints[i][phattriencay] += 1;
    		if(NongTraiPoints[i][phattriencay] >= 2) // 55 giay/1 tang truong
    		{
    			NongTraiPoints[i][phattriencay] = 0;
    			NongTraiPoints[i][tangtruong] += 1;
	    		if(NongTraiPoints[i][tangtruong] <= NongTraiPoints[i][maxtangtruong])
	    		{
	    			new string[128];
	        		if(NongTraiPoints[i][loaicay] == 1)
	        		{
	        			format(string,sizeof(string),"Qua Bi Ngo nay cua {FA5760}%s\n{BEFA64}Do tang truong hien tai: {D53EFA}%i/%i\n{4BFAF9}Nhan {FA5760}N{4BFAF9} de thu hoach",NongTraiPoints[i][tensohuu], NongTraiPoints[i][tangtruong],NongTraiPoints[i][maxtangtruong]);
	        		}
	        		else if(NongTraiPoints[i][loaicay] == 2)
	        		{
	        			format(string,sizeof(string),"Cay LUA nay cua {FA5760}%s\n{BEFA64}Do tang truong hien tai: {D53EFA}%i/%i\n{4BFAF9}Nhan {FA5760}N{4BFAF9} de thu hoach",NongTraiPoints[i][tensohuu], NongTraiPoints[i][tangtruong],NongTraiPoints[i][maxtangtruong]);
	        		}
	        		UpdateDynamic3DTextLabelText(NongTraiText[i], 0x4BFAF9FF, string);
	    		}
    		}
    	}
    }
}

LoadNongTraiVuiVe()
{

	new SQL_HOST[64], SQL_DB[64], SQL_USER[32], SQL_PASS[128], SQL_DEBUG, SQL_DEBUGLOG;
	new SQL_SHOST[64], SQL_SDB[64], SQL_SUSER[32], SQL_SPASS[128];
	new fileString[128], File: fileHandle = fopen("mysql.cfg", io_read);

	while(fread(fileHandle, fileString, sizeof(fileString))) {
		if(ini_GetValue(fileString, "HOST", SQL_HOST, sizeof(SQL_HOST))) continue;
		if(ini_GetValue(fileString, "DB", SQL_DB, sizeof(SQL_DB))) continue;
		if(ini_GetValue(fileString, "USER", SQL_USER, sizeof(SQL_USER))) continue;
		if(ini_GetValue(fileString, "PASS", SQL_PASS, sizeof(SQL_PASS))) continue;
		if(ini_GetInt(fileString, "SHOPAUTOMATED", ShopToggle)) continue;
		if(ini_GetValue(fileString, "SHOST", SQL_SHOST, sizeof(SQL_SHOST))) continue;
		if(ini_GetValue(fileString, "SDB", SQL_SDB, sizeof(SQL_SDB))) continue;
		if(ini_GetValue(fileString, "SUSER", SQL_SUSER, sizeof(SQL_SUSER))) continue;
		if(ini_GetValue(fileString, "SPASS", SQL_SPASS, sizeof(SQL_SPASS))) continue;
		if(ini_GetInt(fileString, "SERVER", servernumber)) continue;
		if(ini_GetInt(fileString, "DEBUG", SQL_DEBUG)) continue;
		if(ini_GetInt(fileString, "DEBUGLOG", SQL_DEBUGLOG)) continue;
	}
	fclose(fileHandle);
	connectvgta = mysql_connect(SQL_HOST, SQL_USER, SQL_DB, SQL_PASS);
	new sqlnongtrai[128];
	format(sqlnongtrai, sizeof(sqlnongtrai),"SELECT * FROM `nongtraivuive` ");
	print("da chay den day nong trai vui ve");
	mysql_function_query(connectvgta, sqlnongtrai, true, "NongTraiVuiVeLoad","i", 1);
}
forward NongTraiVuiVeLoad(index);
public NongTraiVuiVeLoad(index)
{	

	new rows, fields, szDialog[512], sqlnongtraivv[512];
	new string[128];
	cache_get_data(rows, fields, MainPipeline);
    if(rows > 0)
	{
		for(new i; i < rows; i++)
		{
			new result[32];
			NongTraiPoints[i][loaicay] = cache_get_field_content_int(i, "loaicay");
			cache_get_field_content(i, "PosX",result);
			NongTraiPoints[i][PosX] = floatstr(result);
			cache_get_field_content(i, "PosY",result);
			NongTraiPoints[i][PosY] = floatstr(result);
			cache_get_field_content(i, "PosZ",result);
			NongTraiPoints[i][PosZ] = floatstr(result);
			NongTraiPoints[i][idnguoitrong] = cache_get_field_content_int(i, "idnguoitrong");
			NongTraiPoints[i][tangtruong] = cache_get_field_content_int(i, "tangtruong");
			NongTraiPoints[i][maxtangtruong] = cache_get_field_content_int(i, "maxtangtruong");
			NongTraiPoints[i][solanxoidat] = cache_get_field_content_int(i, "solanxoidat");
			NongTraiPoints[i][idobjectsql] = cache_get_field_content_int(i, "idobject");
			cache_get_field_content(i, "tensohuu", NongTraiPoints[i][tensohuu]);
			if(NongTraiPoints[i][loaicay] == 0)
			{
				format(string, sizeof(string), "Manh dat trong chua duoc xoi dat\nNhan {009094}N {19F9FF}de xoi dat\nSo lan da xoi: {009094}%i{19F9FF}/100",NongTraiPoints[i][solanxoidat]);
        		NongTraiText[i] = CreateDynamic3DTextLabel(string, 0x19F9FFFF, NongTraiPoints[i][PosX], NongTraiPoints[i][PosY], NongTraiPoints[i][PosZ], 3.0);
			}
			else
			{
				NongTraiPoints[i][idobject] = CreateDynamicObject(NongTraiPoints[i][idobjectsql], NongTraiPoints[i][PosX], NongTraiPoints[i][PosY], NongTraiPoints[i][PosZ], 0.0000, 0.0000, 0.0000);
				if(NongTraiPoints[i][loaicay] == 1)
				{
					format(string,sizeof(string),"Qua Bi Ngo nay cua {FA5760}%s\n{BEFA64}Do tang truong hien tai: {D53EFA}%i/%i\n{4BFAF9}Nhan {FA5760}N{4BFAF9} de thu hoach",NongTraiPoints[i][tensohuu], NongTraiPoints[i][tangtruong],NongTraiPoints[i][maxtangtruong]);
				}
				else if(NongTraiPoints[i][loaicay] == 2)
				{
					format(string,sizeof(string),"Cay LUA nay cua {FA5760}%s\n{BEFA64}Do tang truong hien tai: {D53EFA}%i/%i\n{4BFAF9}Nhan {FA5760}N{4BFAF9} de thu hoach",NongTraiPoints[i][tensohuu], NongTraiPoints[i][tangtruong],NongTraiPoints[i][maxtangtruong]);
				}
				NongTraiText[i] = CreateDynamic3DTextLabel(string, 0x4BFAF9FF, NongTraiPoints[i][PosX], NongTraiPoints[i][PosY], NongTraiPoints[i][PosZ]+1.0, 20.0);
				NongTraiPoints[i][solanxoidat] = 200;
				
			}
		}
		print("==========================");
		print("[NONG TRAI VUI VE] Load du lieu thanh cong !");
		print("==========================");
	}
	else
	{
		for(new i = 0; i < sizeof(NongTraiPoints); i++)
    	{
    		format(sqlnongtraivv, sizeof(sqlnongtraivv), "INSERT INTO `nongtraivuive` (`id`, `PosX`, `PosY`, `PosZ`, `idnguoitrong`, `loaicay`, `tangtruong`, `maxtangtruong`, `solanxoidat`, `idobject`, `tensohuu`, `phattriencay`) VALUES ('%i', '%f', '%f', '%f', '%d', '%d', '%i', '%i', '%i', '%d', '%s', '%i')",
    		i, NongTraiPoints[i][PosX], NongTraiPoints[i][PosY], NongTraiPoints[i][PosZ], NongTraiPoints[i][idnguoitrong], NongTraiPoints[i][loaicay], NongTraiPoints[i][tangtruong], NongTraiPoints[i][maxtangtruong], NongTraiPoints[i][solanxoidat], NongTraiPoints[i][idobject], NongTraiPoints[i][tensohuu], NongTraiPoints[i][phattriencay]);
			mysql_query(connectvgta, sqlnongtraivv);
			
    		
    	}
    	print("[NONG TRAI VUI VE] Tao du lieu thanh cong !");
	}

	return 1;
}
// LoadNongTraiPoints()
// {
	
	
//     for(new i = 0; i < sizeof(NongTraiPoints); i++)
//     {
//     	format(string, sizeof(string), "Manh dat trong chua duoc xoi dat\nNhan {009094}N {19F9FF}de xoi dat\nSo lan da xoi: {009094}%i{19F9FF}/100",NongTraiPoints[i][solanxoidat]);
//         NongTraiText[i] = CreateDynamic3DTextLabel(string, 0x19F9FFFF, NongTraiPoints[i][PosX], NongTraiPoints[i][PosY], NongTraiPoints[i][PosZ], 3.0);
//     }
//     // return 1;
// }
timer XoiDatTimeReset[1200](playerid)
{
    if(PlayerInfo[playerid][pMineTime] != 0) PlayerInfo[playerid][pMineTime] = 0;
    return 1;
}
timer XoiDatBarTimeReset[30000](playerid)
{
	for(new i = 0; i < sizeof(NongTraiPoints); i++)
    {
    	if(IsPlayerInRangeOfPoint(playerid, 5.0, NongTraiPoints[i][PosX], NongTraiPoints[i][PosY], NongTraiPoints[i][PosZ]))
    	{
    		return 1;
    	}
    }
    HidePlayerProgressBar(playerid, Bar_CuocDat[playerid]);
	TextDrawHideForPlayer(playerid, XoiDat_TD[0]);
    return 0;
}
timer BinhNuocTimeReset[2500](playerid)
{
	if(PlayerInfo[playerid][pMineTime] != 0) PlayerInfo[playerid][pMineTime] = 0;
	if(IsPlayerAttachedObjectSlotUsed(playerid, 0)) RemovePlayerAttachedObject(playerid, 0);
	StopAudioStreamForPlayerEx(playerid);
	return 1;
}
hook OnGameModeInit()
{
	CreateDynamic3DTextLabel("{FF0000}[Noi Mua hat giong]\n{00FF00}Nhan ALT de {FFFFFF}mua Hat Giong", -1, 1089.6877,-299.8478,73.9922+1.1,10.0);
	CreateDynamic3DTextLabel("{FF0000}[Gieng Nuoc]\n{00FF00}Nhan ALT de {FFFFFF}lay nuoc", -1, 1066.6349,-316.7890,75.1270+1.1,10.0);
	CreateDynamic3DTextLabel("{FF0000}[Noi lay cuoc]\n{00FF00}Nhan ALT de {FFFFFF}lay cuoc cao dat", -1, 1104.5362, -319.8571, 73.9883+1.1,10.0);
	// LoadNongTraiPoints();
	LoadNongTraiVuiVe();

	XoiDat_TD[0] = TextDrawCreate(326.599761, 385.599884, "DANG XOI DAT...");
	TextDrawLetterSize(XoiDat_TD[0], 0.229666, 0.977777);
	TextDrawAlignment(XoiDat_TD[0], 3);
	TextDrawColor(XoiDat_TD[0], -1);
	TextDrawSetShadow(XoiDat_TD[0], 0);
	TextDrawSetOutline(XoiDat_TD[0], 0);
	TextDrawBackgroundColor(XoiDat_TD[0], 255);
	TextDrawFont(XoiDat_TD[0], 2);
	TextDrawSetProportional(XoiDat_TD[0], 1);
	TextDrawSetShadow(XoiDat_TD[0], 0);

	TrongCay_TD[0] = TextDrawCreate(426.599761, 385.599884, "DANG TRONG HAT GIONG VUI LONG DOI...");
	TextDrawLetterSize(TrongCay_TD[0], 0.229666, 0.977777);
	TextDrawAlignment(TrongCay_TD[0], 3);
	TextDrawColor(TrongCay_TD[0], -1);
	TextDrawSetShadow(TrongCay_TD[0], 0);
	TextDrawSetOutline(TrongCay_TD[0], 0);
	TextDrawBackgroundColor(TrongCay_TD[0], 255);
	TextDrawFont(TrongCay_TD[0], 2);
	TextDrawSetProportional(TrongCay_TD[0], 1);
	TextDrawSetShadow(TrongCay_TD[0], 0);

	BinhNuoc_TD[0] = TextDrawCreate(356.599761, 385.599884, "Luong nuoc trong binh");
	TextDrawLetterSize(BinhNuoc_TD[0], 0.229666, 0.977777);
	TextDrawAlignment(BinhNuoc_TD[0], 3);
	TextDrawColor(BinhNuoc_TD[0], -1);
	TextDrawSetShadow(BinhNuoc_TD[0], 0);
	TextDrawSetOutline(BinhNuoc_TD[0], 0);
	TextDrawBackgroundColor(BinhNuoc_TD[0], 255);
	TextDrawFont(BinhNuoc_TD[0], 2);
	TextDrawSetProportional(BinhNuoc_TD[0], 1);
	TextDrawSetShadow(BinhNuoc_TD[0], 0);

	return 1;
}
hook OnGameModeExit()
{
	sql_nongtraivuive_save();
	return 1;
}
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsPlayerInRangeOfPoint(playerid, 3.0, 1089.6877,-299.8478,73.9922))
	{
		if(newkeys & KEY_WALK)
		{
			ShowPlayerDialog(playerid, DIALOG_MUAHATGIONGNT, DIALOG_STYLE_TABLIST_HEADERS,"Mua hat giong nong trai",
			"Hat giong\tGia Tien\tNhan duoc\tThoi gian trong\n\
			{EB7F00}Bi Ngo\t{73EB09}$20.000\t{15ABEB}(Bi Ngo event Halloween)\t4h\n\
			{EBCC06}Lua Nuoc\t{73EB09}$5.000\t{15EB83}(Bo Rom de cho bo an)\t2h","Mua","Huy bo"); 
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1104.5362, -319.8571, 73.9883))
	{
		if(newkeys & KEY_WALK)
		{
			ShowPlayerDialog(playerid, DIALOG_LAYCUOC, DIALOG_STYLE_TABLIST,"Lay cuoc cao dat",
			"{FFEDCF}Lay Cuoc\t{A8D1FF}(Dung de cao dat)\n\
			{FFB5EB}Nang Cap Cuoc\t{ACFF9C}(Nang cap cay cuoc cua ban)\n\
			","Chon","Huy bo"); 
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1066.6349,-316.7890,75.1270))
	{
		if(newkeys & KEY_WALK)
		{
			ShowPlayerDialog(playerid, DIALOG_LAYNUOC, DIALOG_STYLE_MSGBOX,"{BEFA64}Lay nuoc tuoi cay", "Ban co muon muc nuoc de tuoi cay?","OK","Huy bo");
		}
	}
	// 
	if(newkeys & KEY_NO)
	{
		for(new i = 0; i < sizeof(NongTraiPoints); i++)
        {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, NongTraiPoints[i][PosX],  NongTraiPoints[i][PosY],  NongTraiPoints[i][PosZ]))
            {
            	if(PlayerInfo[playerid][pDangDungCuoc] == 0 && NongTraiPoints[i][solanxoidat] != 200) return SendClientMessage(playerid, COLOR_GREY, "Ban phai di lay cuoc roi moi xoi dat duoc.");
            	if(PlayerInfo[playerid][pDangDungCuoc] == 1)
            	{
            		if(NongTraiPoints[i][solanxoidat] > 100 && NongTraiPoints[i][solanxoidat] < 200)
	            	{
	            		TextDrawHideForPlayer(playerid, XoiDat_TD[0]);
	            		HidePlayerProgressBar(playerid, Bar_CuocDat[playerid]);
	            		SendClientMessage(playerid, COLOR_GREY, "Manh dat nay da duoc xoi.");
	            		return 1;
	            	}
	            	if(NongTraiPoints[i][tangtruong] >= NongTraiPoints[i][maxtangtruong]) return SendClientMessage(playerid, COLOR_GREY, "Cay thu hoach da chin, de thu hoach hay /vutbo cuoc ");
	            	if(NongTraiPoints[i][solanxoidat] != 200)
	            	{
	            		if(PlayerInfo[playerid][pMineTime] != 0) return 0;
	            		PlayAudioStreamForPlayerEx(playerid, "http://127.0.0.1:81/audio/tiengcuocdat_vgta.mp3");
		            	PlayerInfo[playerid][pMineTime] = 1;
		                ApplyAnimation(playerid, "BASEBALL", "Bat_4", 4.1, 0, 0, 0, 0, 0, 1);
		                defer XoiDatTimeReset(playerid);
		                switch(PlayerInfo[playerid][pLevelCuoc])
		                {
		                	case 0,1:
		                	{
		                		NongTraiPoints[i][solanxoidat] += 1;
		                	}
		                	case 2:
		                	{
		                		NongTraiPoints[i][solanxoidat] += 3;
		                	}
		                	case 3:
		                	{
		                		NongTraiPoints[i][solanxoidat] += 10;
		                	}
		                }
		                TextDrawShowForPlayer(playerid, XoiDat_TD[0]);
		                SetPlayerProgressBarValue(playerid, Bar_CuocDat[playerid], NongTraiPoints[i][solanxoidat]);
		                ShowPlayerProgressBar(playerid, Bar_CuocDat[playerid]);
		                defer XoiDatBarTimeReset(playerid);
		                new string[128];
		                format(string, sizeof(string), "Manh dat trong chua duoc xoi dat\nNhan {009094}N {19F9FF}de xoi dat\nSo lan da xoi: {009094}%i{19F9FF}/100",NongTraiPoints[i][solanxoidat]);
		                UpdateDynamic3DTextLabelText(NongTraiText[i], 0x19F9FFFF, string);
		                if(NongTraiPoints[i][solanxoidat] > 100)
		                {
		                	UpdateDynamic3DTextLabelText(NongTraiText[i], 0xE05801FF, "Manh dat nay da xoi xong,\n nhan {009094}ALT {E05801}de trong cay");
		                	HidePlayerProgressBar(playerid, Bar_CuocDat[playerid]);
		                	TextDrawHideForPlayer(playerid, XoiDat_TD[0]);
		                }
	            	} 
	            	
	                return 1;
	            }
	            else if(PlayerInfo[playerid][pDangDungCuoc] == 0 && NongTraiPoints[i][tangtruong] >= NongTraiPoints[i][maxtangtruong])
	            {
	            	if(NongTraiPoints[i][idnguoitrong] != GetPlayerSQLId(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Khong phai cay trong cua ban khong the thu hoach.");
	            	PreloadAnimLib(playerid, "BOMBER");
					ApplyAnimation(playerid, "BOMBER","BOM_Plant_Crouch_Out", 4.1, 1, 0, 0, 1, 0, 1);
					SetTimerEx("ThuHoachNongTrai", 2000, false, "ii", playerid, i);
	            	PlayerInfo[playerid][pHanhDong] = 1;
	            }
            }
        }
	}
	// 
	if(newkeys & KEY_WALK)
	{
		for(new i = 0; i < sizeof(NongTraiPoints); i++)
        {
            if(IsPlayerInRangeOfPoint(playerid, 3.0, NongTraiPoints[i][PosX],  NongTraiPoints[i][PosY],  NongTraiPoints[i][PosZ]))
            {
            	if(NongTraiPoints[i][solanxoidat] >= 100)
            	{
            		if(NongTraiPoints[i][dangtrong] == 1) return SendClientMessage(playerid, COLOR_GREY, "Nguoi ta dang trong manh dat nay roi, hay tim manh dat khac.");
            		if(NongTraiPoints[i][solanxoidat] == 200) return SendClientMessage(playerid, COLOR_GREY, "Manh dat nay da co nguoi trong.");
            		if(!CheckCayTrong(playerid))
            		{
            			return SendClientMessage(playerid, COLOR_GREY, "[NONG TRAI VUI VE] Ban chi duoc trong toi da 3 cay thoi, neu muon trong tiep hay thu hoach 1 cay truoc do.");
            		}
            		SetPVarInt(playerid, "ManhDatDangChon", i);
            		ShowPlayerDialog(playerid, DIALOG_TRONGHATGIONG, DIALOG_STYLE_TABLIST_HEADERS,"Trong Hat Giong",
					"Hat giong\tNhan duoc\tThoi gian trong\n\
					{EB7F00}Bi Ngo\t{15ABEB}(Bi Ngo event Halloween)\t4h\n\
					{EBCC06}Lua Nuoc\t{15EB83}(Bo Rom de cho bo an)\t2h","Trong","Huy bo");
            	}
            	return 1;
            }
       	}
	}
	if(newkeys & KEY_NO)
	{
		if(PlayerInfo[playerid][pDangDungBinhNuoc] == 1)
		{
			if(PlayerInfo[playerid][pMineTime] != 0) return 0;
			if(PlayerInfo[playerid][pSoLuongNuoc] <= 0)
			{
				return SendClientMessage(playerid, COLOR_GREY, "Binh nay da het nuoc");
			}
        	PlayerInfo[playerid][pMineTime] = 1;
        	PlayAudioStreamForPlayerEx(playerid, "http://127.0.0.1:81/audio/tiengnuocchay_vgta.mp3");
        	PreloadAnimLib(playerid, "POLICE");
			ApplyAnimation(playerid, "POLICE", "CopTraf_Come", 4.1, 0, 0, 0, 0, 0, 1);
        	if(IsPlayerAttachedObjectSlotUsed(playerid, 0)) RemovePlayerAttachedObject(playerid, 0);
			SetPlayerAttachedObject(playerid, 0, 18687, 6, 0.2270, 1.6129, 0.4030, 97.9999, 0.0000, -53.2000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); //
			PlayerInfo[playerid][pSoLuongNuoc]--;
			SetPlayerProgressBarValue(playerid, Bar_BinhNuoc[playerid], PlayerInfo[playerid][pSoLuongNuoc]);
			defer BinhNuocTimeReset(playerid);
			for(new i = 0; i < sizeof(NongTraiPoints); i++)
        	{
	            if(IsPlayerInRangeOfPoint(playerid, 2.0, NongTraiPoints[i][PosX],  NongTraiPoints[i][PosY],  NongTraiPoints[i][PosZ]) && NongTraiPoints[i][solanxoidat] == 200)
	            {
	            	if(NongTraiPoints[i][tangtruong] < NongTraiPoints[i][maxtangtruong])
	            	{
	            		NongTraiPoints[i][tangtruong] += 1;
	            		new string[128];
	            		format(string,sizeof(string),"Qua Bi Ngo nay cua {FA5760}%s\n{BEFA64}Do tang truong hien tai: {D53EFA}%i/%i\n{4BFAF9}Nhan {FA5760}N{4BFAF9} de thu hoach",NongTraiPoints[i][tensohuu], NongTraiPoints[i][tangtruong],NongTraiPoints[i][maxtangtruong]);
	            		UpdateDynamic3DTextLabelText(NongTraiText[i], 0x4BFAF9FF, string);
	            	}
	            	else
	            	{
	            		return SendClientMessage(playerid, 0xBEFA64FF, "Cay nay da truong thanh, Nhan N de thu hoach.");
	            	}
	            	
	            }
            }
			
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_MUAHATGIONGNT)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(PlayerInfo[playerid][pCash] < 20000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $20.000 de mua hat giong Bi Ngo.");
					SendClientMessage(playerid, 0x5FD7FFFF, "Cam on ban da mua hat giong {EB8D2D}Bi Ngo{5FD7FF}.");
					// SendClientMessage(playerid, 0x5FD7FFFF, "Ra khu dat trong trot sau do nhan tui do {EB8D2D}H{5FD7FF}, chon hat giong muon trong an su dung.");
					AddItem(playerid, ITEM_HATGIONGBINGO, 1);
					PlayerInfo[playerid][pCash] -= 20000;
					Notify_Send(playerid, "+1 Hat Giong Bi Ngo", 2000);
					return 1;
				}
				case 1:
				{
					if(PlayerInfo[playerid][pCash] < 5000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $5.000 de mua hat giong Lua Nuoc.");
					SendClientMessage(playerid, 0x5FD7FFFF, "Cam on ban da mua hat giong {EB8D2D}Lua Nuoc{5FD7FF}.");
					// SendClientMessage(playerid, 0x5FD7FFFF, "Ra khu dat trong trot sau do nhan tui do {EB8D2D}H{5FD7FF}, chon hat giong muon trong an su dung.");
					AddItem(playerid, ITEM_HATGIONGLUA, 1);
					PlayerInfo[playerid][pCash] -= 5000;
					Notify_Send(playerid, "+1 Hat Giong Lua Nuoc", 2000);
					return 1;
				}
			}
		}
	}
	if(dialogid == DIALOG_LAYCUOC)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(PlayerInfo[playerid][pDangDungCuoc] == 1) return SendClientMessage(playerid, COLOR_GREY, "Ban dang su dung cuoc roi.");
					PlayerInfo[playerid][pDangDungCuoc] = 1;
					if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
					switch(PlayerInfo[playerid][pLevelCuoc])
					{
						case 0,1:
						{
							SetPlayerAttachedObject(playerid, 1, 18890, 6, 0.1169, 0.0779, -0.3549, 8.8000, 159.3000, 92.1999, 1.0000, 1.0000, 1.7630, 0xFFB8860B, 0xFFFFFFF0);
						}
						case 2:
						{
							SetPlayerAttachedObject(playerid, 1, 18890, 6, 0.1169, 0.0779, -0.3549, 8.8000, 159.3000, 92.1999, 1.0000, 1.0000, 1.7630, 0xFF00008B, 0xFFFFFAFA);
						}
						case 3:
						{
							SetPlayerAttachedObject(playerid, 1, 18890, 6, 0.1169, 0.0779, -0.3549, 8.8000, 159.3000, 92.1999, 1.0000, 1.0000, 1.7630, 0xFF8B0000, 0xFFFFFF00);
						}
					}
					
					SendClientMessage(playerid, 0x9CFAFFFF, "Ban da su dung Cuoc, khong the dung vu khi. Neu muon ket thuc {FFD2B5}/vutbo {EB9A65}cuoc.");
				}
				case 1:
				{
					ShowPlayerDialog(playerid, DIALOG_NANGCAPCUOC2, DIALOG_STYLE_TABLIST_HEADERS,"Nang cap cuoc",
					"Vat Pham\tGia Tien\tKi Nang Nong Trai \n\
					Cuoc {E6EEFC}Bac\t{93FF87}$10.000.000\t{FFE7B5}(Yeu cau ki nang Level 3)\n\
					Cuoc {FAED6B}Vang\t{93FF87}$25.000.000\t{15EB83}(Yeu cau ki nang Level 5)\n\
					Cuoc {FAED6B}Vang\t{C9B5FF}5.000 Coin\t{8865EB}(Khong yeu cau ki nang)","Nang cap","Huy bo"); 
				}
			}
		}
	}
	if(dialogid == DIALOG_NANGCAPCUOC2)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(PlayerInfo[playerid][pNongTraiSkill] < 401) return SendClientMessage(playerid, COLOR_GREY, "Ki nang trong trot NTVV cua ban khong du Level 3.");
					if(PlayerInfo[playerid][pCash] < 10000000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $10.000.000 de nang cap.");
					if(PlayerInfo[playerid][pLevelCuoc] >= 2) return SendClientMessage(playerid, COLOR_GREY, "Cuoc ban da duoc nang cap o cap do nay roi.");
					PlayerInfo[playerid][pLevelCuoc] = 2;
					PlayerInfo[playerid][pDangDungCuoc] = 1;
					if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
					SetPlayerAttachedObject(playerid, 1, 18890, 6, 0.1169, 0.0779, -0.3549, 8.8000, 159.3000, 92.1999, 1.0000, 1.0000, 1.7630, 0xFF00008B, 0xFFFFFAFA);
					PlayerInfo[playerid][pCash] -= 10000000;
					SendClientMessage(playerid, 0x86E9FAFF, "Chuc mung ban da nang cap cuoc {FFD7B5}BAC {86E9FA}thanh cong, va ton {D6FF87}$10.000.000.");
				}
				case 1:
				{
					if(PlayerInfo[playerid][pNongTraiSkill] < 801) return SendClientMessage(playerid, COLOR_GREY, "Ki nang trong trot NTVV cua ban khong du Level 5.");
					if(PlayerInfo[playerid][pCash] < 25000000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du $25.000.000 de nang cap.");
					if(PlayerInfo[playerid][pLevelCuoc] == 3) return SendClientMessage(playerid, COLOR_GREY, "Cuoc ban da duoc nang cap o cap do nay roi.");
					PlayerInfo[playerid][pLevelCuoc] = 3;
					PlayerInfo[playerid][pDangDungCuoc] = 1;
					if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
					SetPlayerAttachedObject(playerid, 1, 18890, 6, 0.1169, 0.0779, -0.3549, 8.8000, 159.3000, 92.1999, 1.0000, 1.0000, 1.7630, 0xFF8B0000, 0xFFFFFF00);
					PlayerInfo[playerid][pCash] -= 25000000;
					SendClientMessage(playerid, 0x86E9FAFF, "Chuc mung ban da nang cap cuoc {EBA165}VANG {86E9FA}thanh cong, va ton {D6FF87}$25.000.000.");
				}
				case 2:
				{
					if(PlayerInfo[playerid][pCredits] < 5000) return SendClientMessage(playerid, COLOR_GREY, "Ban khong du 5.000 Coin de nang cap.");
					if(PlayerInfo[playerid][pLevelCuoc] == 3) return SendClientMessage(playerid, COLOR_GREY, "Cuoc ban da duoc nang cap o cap do nay roi.");
					PlayerInfo[playerid][pLevelCuoc] = 3;
					PlayerInfo[playerid][pDangDungCuoc] = 1;
					if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
					SetPlayerAttachedObject(playerid, 1, 18890, 6, 0.1169, 0.0779, -0.3549, 8.8000, 159.3000, 92.1999, 1.0000, 1.0000, 1.7630, 0xFF8B0000, 0xFFFFFF00);
					PlayerInfo[playerid][pCredits] -= 5000;
					SendClientMessage(playerid, 0x86E9FAFF, "Chuc mung ban da nang cap cuoc {EBA165}VANG {86E9FA}thanh cong, va ton {D6FF87}5.000 Coin.");
					new string[512];
					format(string, sizeof(string),"Chuc Mung {FFD7B5}%s da dung {D6FF87}5.000 coin{86E9FA} de nang cap len {EBA165}Cuoc Vang{86E9FA}. Anh ay la mot dai gia chinh hieu.", GetPlayerNameEx(playerid));
					SendClientMessageToAll(0x86E9FAFF, string);
					Log("Logs/nangcapcuoc.log",string);
				}
			}
		}
	}
	if(dialogid == DIALOG_TRONGHATGIONG)
	{
		if(response)
		{
			switch(listitem)
			{
				case 0:
				{
					if(InventoryItemCheck(playerid, ITEM_HATGIONGBINGO, 1) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co hat giong bi ngo.");
					new iddat = GetPVarInt(playerid, "ManhDatDangChon");
					TrongHatGiongNTVV(playerid, iddat, 1);

					
				}
				case 1:
				{
					if(InventoryItemCheck(playerid, ITEM_HATGIONGLUA, 1) == 50) return SendClientMessage(playerid, COLOR_GREY, "Ban khong co hat giong lua nuoc.");
					new iddat = GetPVarInt(playerid, "ManhDatDangChon");
					TrongHatGiongNTVV(playerid, iddat, 2);

				}
			}
		}
		else
		{
			if(GetPVarInt(playerid, "ManhDatDangChon")) DeletePVar(playerid, "ManhDatDangChon");
		}
	}
	if(dialogid == DIALOG_LAYNUOC)
	{
		if(response)
		{
			if(PlayerInfo[playerid][pSoLuongNuoc] == 20) return SendClientMessage(playerid, COLOR_GREY, "Binh Nuoc cua ban da day roi.");
			PreloadAnimLib(playerid, "BD_FIRE");
			ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 1, 0, 0, 1, 0, 1);
			GameTextForPlayer(playerid, "~w~Dang lay nuoc....", 5000, 5);
			SetPVarInt(playerid, "LayNuocTime",1);
			LayNuoc_Timer[playerid] = SetTimerEx("LayNuoc", 5000, false, "i", playerid);
			PlayerInfo[playerid][pHanhDong] = 1;

		}
	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
	PlayerInfo[playerid][pDangDungCuoc] = 0;
	PlayerInfo[playerid][pDangDungBinhNuoc] = 0;
	PlayerInfo[playerid][pSoLuongNuoc] = 0;
	Bar_CuocDat[playerid] = CreatePlayerProgressBar(playerid, 245.000000, 401.000000, 151.000000, 11.199999, 869072810, 100.0000, 0);
	Bar_TrongCay[playerid] = CreatePlayerProgressBar(playerid, 245.000000, 401.000000, 151.000000, 11.199999, 869072810, 100.0000, 0);
	Bar_BinhNuoc[playerid] = CreatePlayerProgressBar(playerid, 245.000000, 401.000000, 151.000000, 11.199999, 869072810, 20.0000, 0);

	return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
	PlayerInfo[playerid][pDangDungCuoc] = 0;
	if(GetPVarInt(playerid, "TrongHatgiongTimer"))
	{
		KillTimer(TrongCay_Timer[playerid]);
		DeletePVar(playerid, "TrongHatgiongTimer");
		HidePlayerProgressBar(playerid, Bar_TrongCay[playerid]);
    	TextDrawHideForPlayer(playerid, TrongCay_TD[0]);
	}
	if(GetPVarInt(playerid, "ManhDatDangChon"))
	{
		new iddat = GetPVarInt(playerid, "ManhDatDangChon");
		NongTraiPoints[iddat][dangtrong] = 0;
		DeletePVar(playerid, "ManhDatDangChon");
	} 
	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
	if(PlayerInfo[playerid][pDangDungCuoc] == 1)
	{
		PlayerInfo[playerid][pDangDungCuoc] = 0;
		if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
		SendClientMessage(playerid, COLOR_GREY, "Ban da chet vao cay cuoc cua ban da bi gay.");
	}
	if(GetPVarInt(playerid, "TrongHatgiongTimer"))
	{
		KillTimer(TrongCay_Timer[playerid]);
		DeletePVar(playerid, "TrongHatgiongTimer");
		HidePlayerProgressBar(playerid, Bar_TrongCay[playerid]);
    	TextDrawHideForPlayer(playerid, TrongCay_TD[0]);
	}
	if(GetPVarInt(playerid, "ManhDatDangChon"))
	{
		new iddat = GetPVarInt(playerid, "ManhDatDangChon");
		NongTraiPoints[iddat][dangtrong] = 0;
		DeletePVar(playerid, "ManhDatDangChon");
	} 
	return 1;
}

forward TrongHatgiong(playerid, iddat, loai);
public TrongHatgiong(playerid, iddat, loai)
{
	if(GetPVarInt(playerid, "TrongHatgiongTimer") < 100)
	{
		SetPVarInt(playerid, "TrongHatgiongTimer", GetPVarInt(playerid, "TrongHatgiongTimer")+1);
		SetPlayerProgressBarValue(playerid, Bar_TrongCay[playerid], GetPVarInt(playerid, "TrongHatgiongTimer"));
	}
	else
	{
		new string[128];
		new idtensohuu[32];
		new idluuobject;
		format(idtensohuu, sizeof(idtensohuu),"%s", GetPlayerNameEx(playerid) );
		NongTraiPoints[iddat][tensohuu] = idtensohuu;
		NongTraiPoints[iddat][tangtruong] = 0;
		NongTraiPoints[iddat][phattriencay] = 0;
		NongTraiPoints[iddat][idnguoitrong] = GetPlayerSQLId(playerid);
		if(loai == 1)
		{
			idluuobject = 19320;
			NongTraiPoints[iddat][maxtangtruong] = 240;
			NongTraiPoints[iddat][idobject] = CreateDynamicObject(idluuobject, NongTraiPoints[iddat][PosX], NongTraiPoints[iddat][PosY], NongTraiPoints[iddat][PosZ], 0.0000, 0.0000, 0.0000);
			NongTraiPoints[iddat][loaicay] = 1;
			format(string,sizeof(string),"Qua Bi Ngo nay cua {FA5760}%s\n{BEFA64}Do tang truong hien tai: {D53EFA}%i/%i\n{4BFAF9}Nhan {FA5760}N{4BFAF9} de thu hoach",NongTraiPoints[iddat][tensohuu], NongTraiPoints[iddat][tangtruong],NongTraiPoints[iddat][maxtangtruong]);
		}
		else if(loai == 2)
		{
			idluuobject = 861;
			NongTraiPoints[iddat][maxtangtruong] = 120;
			NongTraiPoints[iddat][idobject] = CreateDynamicObject(idluuobject, NongTraiPoints[iddat][PosX], NongTraiPoints[iddat][PosY], NongTraiPoints[iddat][PosZ]-0.2, 0.0000, 0.0000, 0.0000);
			NongTraiPoints[iddat][loaicay] = 2;
			NongTraiPoints[iddat][PosZ] = NongTraiPoints[iddat][PosZ]-0.2;
			format(string,sizeof(string),"Cay LUA nay cua {FA5760}%s\n{BEFA64}Do tang truong hien tai: {D53EFA}%i/%i\n{4BFAF9}Nhan {FA5760}N{4BFAF9} de thu hoach",NongTraiPoints[iddat][tensohuu], NongTraiPoints[iddat][tangtruong],NongTraiPoints[iddat][maxtangtruong]);
		}
		DestroyDynamic3DTextLabel(NongTraiText[iddat]);
		NongTraiText[iddat] = Text3D:INVALID_3DTEXT_ID;
		NongTraiText[iddat] = CreateDynamic3DTextLabel(string, 0x4BFAF9FF, NongTraiPoints[iddat][PosX], NongTraiPoints[iddat][PosY], NongTraiPoints[iddat][PosZ]+1.0, 20.0);
		// UpdateDynamic3DTextLabelText(NongTraiText[iddat], 0x4BFAF9FF, string);
		NongTraiPoints[iddat][solanxoidat] = 200;
		KillTimer(TrongCay_Timer[playerid]);
		DeletePVar(playerid, "TrongHatgiongTimer");
		HidePlayerProgressBar(playerid, Bar_TrongCay[playerid]);
    	TextDrawHideForPlayer(playerid, TrongCay_TD[0]);
    	ClearAnimations(playerid, 1);
    	PlayerInfo[playerid][pHanhDong] = 0;
    	NongTraiPoints[iddat][dangtrong] = 0;
		DeletePVar(playerid, "ManhDatDangChon");
		new sqltronghatgiong[512];
		format(sqltronghatgiong,sizeof(sqltronghatgiong), "UPDATE `nongtraivuive` SET `idnguoitrong` = '%d', `loaicay` = '%i',`tangtruong` = '0', `maxtangtruong` = '%i', `solanxoidat` = '200', `idobject` = '%d', `tensohuu` = '%s', `phattriencay` = 0 WHERE `id` = '%i' ",
			GetPlayerSQLId(playerid), NongTraiPoints[iddat][loaicay], NongTraiPoints[iddat][maxtangtruong], idluuobject, NongTraiPoints[iddat][tensohuu], iddat);
		mysql_query(connectvgta, sqltronghatgiong);
		print("Trong hat giong thanh cong");
	}
	return 1;
}
forward LayNuoc(playerid);
public LayNuoc(playerid)
{
	ClearAnimations(playerid, 1);
	PlayerInfo[playerid][pHanhDong] = 0;
	PlayerInfo[playerid][pDangDungCuoc] = 0;
	PlayerInfo[playerid][pDangDungBinhNuoc] = 1;
	PlayerInfo[playerid][pSoLuongNuoc] = 20;
	if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
	SetPlayerAttachedObject(playerid, 1, 19621, 6, 0.0340, -0.0009, 0.0030, 0.0000, -10.3000, 92.5999, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
	SendClientMessage(playerid, 0x9CFAFFFF, "Ban da su dung Binh Nuoc de tuoi cay, vi the khong the dung vu khi. Neu muon ket thuc {FFD2B5}/vutbo {EB9A65}binhnuoc.");
	SendClientMessage(playerid, 0x9CFAFFFF, "Nhan {FFD2B5}N {9CFAFF}de tuoi nuoc.");
	TextDrawShowForPlayer(playerid, BinhNuoc_TD[0]);
    SetPlayerProgressBarValue(playerid, Bar_BinhNuoc[playerid], PlayerInfo[playerid][pSoLuongNuoc]);
    ShowPlayerProgressBar(playerid, Bar_BinhNuoc[playerid]);
	return 1;
}
forward ThuHoachNongTrai(playerid, iddat);
public ThuHoachNongTrai(playerid, iddat)
{
	new string[128];
	PlayerInfo[playerid][pHanhDong] = 0;
	ClearAnimations(playerid, 1);
	NongTraiPoints[iddat][tangtruong] = 0;
	if(NongTraiPoints[iddat][loaicay] == 1)
	{
		NongTraiPoints[iddat][maxtangtruong] = 240;
		new rand = Random(15,25);
		AddItem(playerid, ITEM_BINGO, rand);
		format(string,sizeof(string),"+%i BI NGO", rand);
		Notify_Send(playerid, string, 5000);
		format(string, sizeof(string), "Ban da nhan duoc {6E34D9}%i{71FFD9} qua {D94A1E}BI NGO.",rand);
		SendClientMessage(playerid, 0x71FFD9FF, string);
		
	}
	else if(NongTraiPoints[iddat][loaicay] == 2)
	{
		NongTraiPoints[iddat][maxtangtruong] = 120;
		new rand = Random(3,10);
		AddItem(playerid, ITEM_BOROM, rand);
		format(string,sizeof(string),"+%i BO ROM", rand);
		Notify_Send(playerid, string, 5000);
		format(string, sizeof(string), "Ban da nhan duoc {6E34D9}%i{71FFD9} qua {D94A1E}BO ROM.",rand);
		SendClientMessage(playerid, 0x71FFD9FF, string);
	}
	NongTraiPoints[iddat][loaicay] = 0;
	NongTraiPoints[iddat][phattriencay] = 0;
	NongTraiPoints[iddat][idnguoitrong] = 0;
	NongTraiPoints[iddat][solanxoidat] = 0;
	DestroyDynamicObject(NongTraiPoints[iddat][idobject]);
	DestroyDynamic3DTextLabel(NongTraiText[iddat]);
	NongTraiText[iddat] = Text3D:INVALID_3DTEXT_ID;
	format(string, sizeof(string), "Manh dat trong chua duoc xoi dat\nNhan {009094}N {19F9FF}de xoi dat\nSo lan da xoi: {009094}%i{19F9FF}/100",NongTraiPoints[iddat][solanxoidat]);
	NongTraiText[iddat] = CreateDynamic3DTextLabel(string, 0x19F9FFFF, NongTraiPoints[iddat][PosX], NongTraiPoints[iddat][PosY], NongTraiPoints[iddat][PosZ], 3.0);
	SendClientMessage(playerid, 0x71FFD9FF, "Ban nhan duoc 1 diem ki nang Nong Trai Vui Ve /kinang 12 de kiem tra.");
	PlayerInfo[playerid][pNongTraiSkill] += 1;
	Notify_Send(playerid, "+1 Ki Nang Nong Trai Vui Ve", 5000);
	sql_nongtraivuive_save_account(iddat);
	return 1;
}
CMD:sudungcuocvgta(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1337) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay");
	PlayerInfo[playerid][pDangDungCuoc] = 1;
	if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 1);
	switch(PlayerInfo[playerid][pLevelCuoc])
	{
		case 0,1:
		{
			SetPlayerAttachedObject(playerid, 1, 18890, 6, 0.1169, 0.0779, -0.3549, 8.8000, 159.3000, 92.1999, 1.0000, 1.0000, 1.7630, 0xFFB8860B, 0xFFFFFFF0);
		}
		case 2:
		{
			SetPlayerAttachedObject(playerid, 1, 18890, 6, 0.1169, 0.0779, -0.3549, 8.8000, 159.3000, 92.1999, 1.0000, 1.0000, 1.7630, 0xFF00008B, 0xFFFFFAFA);
		}
		case 3:
		{
			SetPlayerAttachedObject(playerid, 1, 18890, 6, 0.1169, 0.0779, -0.3549, 8.8000, 159.3000, 92.1999, 1.0000, 1.0000, 1.7630, 0xFF8B0000, 0xFFFFFF00);
		}
	}
	
	SendClientMessage(playerid, 0x9CFAFFFF, "Ban da su dung Cuoc, khong the dung vu khi. Neu muon ket thuc {FFD2B5}/vutbo {EB9A65}cuoc.");
	return 1;
}
CMD:setnongtrai(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 99999) return SendClientMessage(playerid, COLOR_GREY, "Ban khong the su dung lenh nay.");
	new szMessage[128], i, Amount;

	if(sscanf(params, "ud", i, Amount))
		return SendClientMessageEx(playerid, COLOR_GREY, "USAGE: /setnongtrai [id manh dat] [do tang truong]");
	NongTraiPoints[i][tangtruong] = Amount;
	new string[128];
	format(string,sizeof(string),"Qua Bi Ngo nay cua {FA5760}%s\n{BEFA64}Do tang truong hien tai: {D53EFA}%i/%i\n{4BFAF9}Nhan {FA5760}N{4BFAF9} de thu hoach",NongTraiPoints[i][tensohuu], NongTraiPoints[i][tangtruong],NongTraiPoints[i][maxtangtruong]);
	UpdateDynamic3DTextLabelText(NongTraiText[i], 0x4BFAF9FF, string);
	return 1;
}
TrongHatGiongNTVV(playerid, iddat, loai)
{
	if(loai == 1)
	{
		DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_HATGIONGBINGO, 1), 1);
		Notify_Send(playerid, "-1 Hat Giong Bi Ngo", 5000);
	}
	else if(loai == 2)
	{
		DeleteItem(playerid, InventoryItemCheck(playerid, ITEM_HATGIONGLUA, 1), 1);
		Notify_Send(playerid, "-1 Hat Giong LUA NUOC", 5000);
	}
	PreloadAnimLib(playerid, "BOMBER");
	ApplyAnimation(playerid, "BOMBER","BOM_Plant_Crouch_Out", 4.1, 1, 0, 0, 1, 0, 1);
	SetPVarInt(playerid, "TrongHatgiongTimer", 1);
	TrongCay_Timer[playerid] = SetTimerEx("TrongHatgiong", 100, true, "iii", playerid, iddat, loai);
	SetPlayerProgressBarValue(playerid, Bar_TrongCay[playerid], 1);
    ShowPlayerProgressBar(playerid, Bar_TrongCay[playerid]);
    TextDrawShowForPlayer(playerid, TrongCay_TD[0]);
    PlayerInfo[playerid][pHanhDong] = 1;
    NongTraiPoints[iddat][dangtrong] = 1;
}
sql_nongtraivuive_save()
{
	new sqltronghatgiong[512];
	for(new iddat = 0; iddat < sizeof(NongTraiPoints); iddat++)
	{
		format(sqltronghatgiong,sizeof(sqltronghatgiong), "UPDATE `nongtraivuive` SET `idnguoitrong` = '%d', `loaicay` = '%i',`tangtruong` = '%i', `maxtangtruong` = '%i', `solanxoidat` = '%i', `idobject` = '%d', `tensohuu` = '%s', `phattriencay` = '0' WHERE `id` = '%i' ",
			NongTraiPoints[iddat][idnguoitrong], NongTraiPoints[iddat][loaicay], NongTraiPoints[iddat][tangtruong], NongTraiPoints[iddat][maxtangtruong], NongTraiPoints[iddat][solanxoidat], NongTraiPoints[iddat][idobjectsql], NongTraiPoints[iddat][tensohuu], iddat);
		mysql_query(connectvgta, sqltronghatgiong);
	}

	print("[NONG TRAI VUI VE] Luu co so du lieu thanh cong.");	
}
sql_nongtraivuive_save_account(iddat)
{
	new sqltronghatgiong[512];
	format(sqltronghatgiong,sizeof(sqltronghatgiong), "UPDATE `nongtraivuive` SET `idnguoitrong` = '%d', `loaicay` = '%i',`tangtruong` = '%i', `maxtangtruong` = '%i', `solanxoidat` = '%i', `idobject` = '%d', `tensohuu` = '%s', `phattriencay` = '0' WHERE `id` = '%i' ",
			NongTraiPoints[iddat][idnguoitrong], NongTraiPoints[iddat][loaicay], NongTraiPoints[iddat][tangtruong], NongTraiPoints[iddat][maxtangtruong], NongTraiPoints[iddat][solanxoidat], NongTraiPoints[iddat][idobjectsql], NongTraiPoints[iddat][tensohuu], iddat);
	mysql_query(connectvgta, sqltronghatgiong);

	print("[NONG TRAI VUI VE] Luu co so du lieu thanh cong.");	
}
CMD:luunongtrai(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 99999) return SendClientMessage(playerid, -1, "Ban khong duoc phep dung lenh nay");
	sql_nongtraivuive_save();
	print("Luu thanh cong !");
	SendClientMessage(playerid, -1, "[NONG TRAI VUI VE] Luu co so du lieu thanh cong !");
	return 1;
}
CheckCayTrong(playerid)
{
	new count = 0;
	for(new i = 0; i < sizeof(NongTraiPoints); i++)
	{
		if(NongTraiPoints[i][idnguoitrong] == GetPlayerSQLId(playerid))
		{
			count++;
		}
	}
	if(count >= 3)
	{
		// SendClientMessage(playerid, COLOR_GREY, "Ban chi duoc trong toi da 3 cay.");
		return 0;
	}
	else
	{
		return 1;
	}
}