#include 								<a_samp>
#include 								<sscanf2>
#include 								<streamer>

#define START_WORK                      9000
#define END_WORK                        9001
#define TUMBA                           9002
#define PIZZA                           90
#define BURGER                          150
#define SALAD                           130
#define POTATO                          70

new PlayerText:test[MAX_PLAYERS];
new prigotov[MAX_PLAYERS];
new timer[MAX_PLAYERS];
new zarplata[MAX_PLAYERS];
new gotovka[MAX_PLAYERS][4];
new job[MAX_PLAYERS];
new pomidor[MAX_PLAYERS];
new kolbasa[MAX_PLAYERS];
new ogurec[MAX_PLAYERS];
new testo[MAX_PLAYERS];
new kotleta[MAX_PLAYERS];
new kotleta2[MAX_PLAYERS];
new zelen[MAX_PLAYERS];
new bulochka[MAX_PLAYERS];
new kartop[MAX_PLAYERS];
new procent[MAX_PLAYERS];
new PlayerText:SkinText[MAX_PLAYERS][8];
new PlayerText:Prog[MAX_PLAYERS][1];
new PlayerText:SelectMenu[MAX_PLAYERS][13];

public OnFilterScriptInit()
{
    SetTimer("GotTime", 1500, 1);
    
	CreatePickup(1275,23,2350.8323,-1355.4243,24.0300, -1);
	CreatePickup(1239,23,2344.5623,-1354.0228,24.0300, -1);
	
	Create3DTextLabel( "{FFFFFF}Нажмите {FFFF00}N\n{FFFFFF}чтобы открыть меню рабочего стола", 0xFFFF00FF, 2349.1953,-1352.4595,24.0300, 10.0, 0, -1);
	Create3DTextLabel( "{FFFFFF}Нажмите {FFFF00}N\n{FFFFFF}чтобы открыть меню тумбочку", 0xFFFF00FF, 2347.7537,-1352.2338,24.0300, 10.0, 0, -1);
	Create3DTextLabel( "{FFFFFF}Нажмите {FFFF00}N\n{FFFFFF}чтобы воспользоватся фритюром", 0xFFFF00FF, 2345.0024,-1352.3453,24.0300, 10.0, 0, -1);
	Create3DTextLabel( "{FFFFFF}Нажмите {FFFF00}N\n{FFFFFF}чтобы отдать заказ", 0xFFFF00FF, 2344.6536,-1358.8724,24.0300, 10.0, 0, -1);
	Create3DTextLabel( "{FFFFFF}Нажмите {FFFF00}N\n{FFFFFF}чтобы приступить к готовке", 0xFFFF00FF, 2347.0215,-1357.2031,24.0300, 10.0, 0, -1);
	Create3DTextLabel( "{FFFFFF}Нажмите {FFFF00}N\n{FFFFFF}воспользоватся плитой", 0xFFFF00FF, 2346.6050,-1352.4476,24.0300, 10.0, 0, -1);
	Create3DTextLabel( "{FFFFFF}Нажмите {FFFF00}N\n{FFFFFF}чтобы переодется", 0xFFFF00FF, 2350.8323,-1355.4243,24.0300, 10.0, 0, -1);
	Create3DTextLabel( "{FFFFFF}Нажмите {FFFF00}N\n{FFFFFF}чтобы прочитать информацию", 0xFFFF00FF, 2344.5623,-1354.0228,24.0300, 10.0, 0, -1);
	
	CreateObject(19391, 2361.13, -1352.40, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19390, 2360.95, -1352.41, 24.75,   0.00, 0.00, 0.00);
	CreateObject(3851, 2361.03, -1359.65, 24.50,   0.00, 0.00, 0.00);
	CreateObject(18981, 2348.66, -1361.89, 22.53,   0.00, 90.00, 0.00);
	CreateObject(19362, 2361.13, -1366.90, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19362, 2361.13, -1370.11, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19362, 2361.13, -1372.76, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19362, 2359.61, -1374.27, 24.75,   0.00, 0.00, 90.00);
	CreateObject(3851, 2352.36, -1374.19, 24.50,   0.00, 0.00, 90.00);
	CreateObject(19361, 2360.95, -1366.90, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19361, 2360.95, -1370.11, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19361, 2360.95, -1372.58, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19361, 2359.61, -1374.09, 24.75,   0.00, 0.00, 90.00);
	CreateObject(1522, 2359.75, -1352.68, 23.00,   0.00, 0.00, 342.14);
	CreateObject(19362, 2345.16, -1374.27, 24.75,   0.00, 0.00, 90.00);
	CreateObject(19362, 2343.65, -1372.75, 24.75,   0.00, 0.00, 180.00);
	CreateObject(19454, 2343.65, -1366.33, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19453, 2356.21, -1350.89, 24.75,   0.00, 0.00, 90.00);
	CreateObject(19454, 2348.38, -1350.88, 24.75,   0.00, 0.00, 90.00);
	CreateObject(19362, 2343.65, -1352.42, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19453, 2351.51, -1355.59, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19361, 2349.99, -1360.33, 24.75,   0.00, 0.00, 90.00);
	CreateObject(19390, 2347.60, -1360.33, 24.75,   0.00, 0.00, 90.00);
	CreateObject(19361, 2345.18, -1360.33, 24.75,   0.00, 0.00, 90.00);
	CreateObject(19391, 2343.65, -1355.63, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19362, 2343.65, -1358.84, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19362, 2343.65, -1361.84, 24.75,   0.00, 0.00, 0.00);
	CreateObject(1523, 2343.65, -1356.39, 23.00,   0.00, 0.00, 90.00);
	CreateObject(1523, 2346.00, 5664.00, -1362.00,   0.00, 0.00, 0.00);
	CreateObject(1523, 2346.80, -1360.34, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2688, 2348.55, -1360.27, 24.66,   0.00, 0.00, 180.00);
	CreateObject(2415, 2344.22, -1351.64, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2415, 2345.06, -1351.64, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2451, 2345.86, -1351.61, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2416, 2345.07, -1359.70, 23.00,   0.00, 0.00, 180.00);
	CreateObject(2421, 2347.90, -1350.96, 24.70,   0.00, 0.00, 0.00);
	CreateObject(2417, 2347.74, -1351.40, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2419, 2348.69, -1351.63, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2418, 2350.95, -1352.35, 23.00,   0.00, 0.00, 90.00);
	CreateObject(2418, 2350.93, -1354.22, 23.00,   0.00, 0.00, 90.00);
	CreateObject(2421, 2351.38, -1352.11, 24.70,   0.00, 0.00, 270.00);
	CreateObject(2685, 2348.83, -1360.22, 24.66,   0.00, 0.00, 180.00);
	CreateObject(2685, 2346.38, -1351.00, 24.66,   0.00, 0.00, 0.00);
	CreateObject(2418, 2346.51, -1358.22, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2418, 2348.38, -1358.22, 23.00,   0.00, 0.00, 0.00);
	CreateObject(19453, 2343.82, -1365.07, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19361, 2343.80, -1371.49, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19361, 2343.82, -1372.57, 24.75,   0.00, 0.00, 0.00);
	CreateObject(19361, 2345.17, -1374.09, 24.75,   0.00, 0.00, 90.00);
	CreateObject(2439, 2351.11, -1360.93, 23.00,   0.00, 0.00, 90.00);
	CreateObject(2439, 2351.11, -1361.93, 23.00,   0.00, 0.00, 90.00);
	CreateObject(2439, 2351.11, -1362.93, 23.00,   0.00, 0.00, 90.00);
	CreateObject(2439, 2351.11, -1363.94, 23.00,   0.00, 0.00, 90.00);
	CreateObject(2439, 2351.11, -1364.93, 23.00,   0.00, 0.00, 90.00);
	CreateObject(2439, 2351.11, -1365.93, 23.00,   0.00, 0.00, 90.00);
	CreateObject(2439, 2350.96, -1366.02, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2439, 2349.96, -1366.01, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2439, 2348.97, -1366.02, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2439, 2347.97, -1366.02, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2439, 2346.97, -1366.02, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2439, 2345.97, -1366.02, 23.00,   0.00, 0.00, 0.00);
	CreateObject(2753, 2351.21, -1361.86, 24.20,   0.00, 0.00, 90.00);
	CreateObject(2753, 2351.21, -1364.28, 24.20,   0.00, 0.00, 90.00);
	CreateObject(2753, 2349.19, -1366.16, 24.20,   0.00, 0.00, 0.00);
	CreateObject(2753, 2346.18, -1366.16, 24.20,   0.00, 0.00, 0.00);
	CreateObject(2453, 2351.08, -1366.16, 24.40,   0.00, 0.00, 0.00);
	CreateObject(2687, 2350.28, -1360.45, 25.00,   0.00, 0.00, 0.00);
	CreateObject(2635, 2353.94, -1354.34, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2358.10, -1355.90, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2354.27, -1359.88, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2357.88, -1361.97, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2354.37, -1364.54, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2357.59, -1367.41, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2353.56, -1368.54, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2358.60, -1371.77, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2355.25, -1371.73, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2351.42, -1370.76, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2347.09, -1368.42, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2635, 2347.16, -1371.91, 23.40,   0.00, 0.00, 0.00);
	CreateObject(2636, 2347.64, -1371.94, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2347.56, -1368.42, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2351.97, -1370.80, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2354.09, -1368.62, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2355.81, -1371.82, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2359.10, -1371.80, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2358.18, -1367.40, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2354.87, -1364.47, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2358.35, -1361.82, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2354.73, -1359.67, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2358.57, -1355.85, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2354.58, -1354.14, 23.60,   0.00, 0.00, 0.00);
	CreateObject(2636, 2353.54, -1354.32, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2357.73, -1355.96, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2357.44, -1361.98, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2353.88, -1359.85, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2353.94, -1364.42, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2357.11, -1367.37, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2358.07, -1371.81, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2354.67, -1371.71, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2353.06, -1368.47, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2350.88, -1370.71, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2346.45, -1371.84, 23.60,   0.00, 0.00, 180.00);
	CreateObject(2636, 2346.61, -1368.51, 23.60,   0.00, 0.00, 180.00);
	CreateObject(19172, 2351.60, -1352.60, 25.52,   0.00, 0.00, 90.00);
	CreateObject(19173, 2353.60, -1350.99, 25.19,   0.00, 0.00, 0.00);
	CreateObject(19174, 2357.40, -1350.99, 25.52,   0.00, 0.00, 0.00);
	CreateObject(19174, 2351.60, -1355.52, 25.52,   0.00, 0.00, 90.00);
	CreateObject(19175, 2351.60, -1358.67, 25.52,   0.00, 0.00, 90.00);
	CreateObject(19378, 2348.82, -1355.62, 26.42,   0.00, 90.00, 0.00);
	CreateObject(19378, 2348.81, -1365.25, 26.42,   0.00, 90.00, 0.00);
	CreateObject(19378, 2355.82, -1355.64, 26.43,   0.00, 90.00, 0.00);
	CreateObject(19378, 2355.83, -1365.28, 26.43,   0.00, 90.00, 0.00);
	CreateObject(19378, 2355.81, -1369.35, 26.42,   0.00, 90.00, 0.00);
	CreateObject(19378, 2348.82, -1369.36, 26.43,   0.00, 90.00, 0.00);
	CreateObject(19380, 2355.96, -1355.62, 26.60,   0.00, 90.00, 0.00);
	CreateObject(19380, 2355.96, -1365.25, 26.60,   0.00, 90.00, 0.00);
	CreateObject(19380, 2348.82, -1355.62, 26.60,   0.00, 90.00, 0.00);
	CreateObject(19380, 2348.82, -1365.20, 26.60,   0.00, 90.00, 0.00);
	CreateObject(19380, 2348.80, -1369.55, 26.60,   0.00, 90.00, 0.00);
	CreateObject(19380, 2355.99, -1369.56, 26.60,   0.00, 90.00, 0.00);
	CreateObject(2740, 2348.31, -1355.85, 26.20,   0.00, 0.00, 0.00);
	return true;
}

public OnFilterScriptExit()
{
	return true;
}

public OnPlayerConnect(playerid)
{
	LoadingText(playerid);
	Edit(playerid);
	PreloadAllAnimLibs(playerid);
	Clear(playerid);
	for(new e=0; e < 4; e++) gotovka[playerid][e] = 0;
	job[playerid] = 0;
	RemoveBuildingForPlayer(playerid, 955,2352.1797, -1357.1563, 23.7734,0.25);
	RemoveBuildingForPlayer(playerid, 17542,2347.9219, -1364.2891, 27.1563,0.25);
	RemoveBuildingForPlayer(playerid, 17966,2347.9219, -1364.2891, 27.1563,0.25);
	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
    Clear(playerid);
    for(new e=0; e < 4; e++) gotovka[playerid][e] = 0;
    job[playerid] = 0;
	return true;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    Clear(playerid);
    for(new e=0; e < 4; e++) gotovka[playerid][e] = 0;
    job[playerid] = 0;
	return true;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/cafe", cmdtext, true, 10) == 0)
	{
		SetPlayerPos(playerid,2363.4714,-1352.2458,24.0078);
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		return true;
	}
	return false;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_NO)
	{
	    if(PlayerToPoint(0.5,playerid, 2344.5623,-1354.0228,24.0300))
	    {
	        new scr1[600], stringstat[600];
			format(stringstat,sizeof(stringstat),"\n{FFFFFF}Здравствуйте {11A200}%s.\n", PlayerName(playerid));
			format(scr1, sizeof(scr1), "{FFFFFF}В этом кафе можно подработать поваром. Вам предстоит\n");
			strcat(stringstat, scr1);
			format(scr1, sizeof(scr1), "{FFFFFF}готовить блюда такие как: Пицца, Бургер, Салат, Картошка фри.\n");
			strcat(stringstat, scr1);
			format(scr1, sizeof(scr1), "{FFFFFF}За каждое приготовленное блюдо Вы будете получать деньги\n");
			strcat(stringstat, scr1);
			format(scr1, sizeof(scr1), "{FFFFFF}Пицца: {11A200}%d$\n", PIZZA);
			strcat(stringstat, scr1);
			format(scr1, sizeof(scr1), "{FFFFFF}Бургер: {11A200}%d$\n", BURGER);
			strcat(stringstat, scr1);
			format(scr1, sizeof(scr1), "{FFFFFF}Салат: {11A200}%d$\n", SALAD);
			strcat(stringstat, scr1);
			format(scr1, sizeof(scr1), "{FFFFFF}Картошка Фри: {11A200}%d$\n", POTATO);
			strcat(stringstat, scr1);
			format(scr1, sizeof(scr1), "{FFFFFF}Кол-во вакансий ограничено. В любое время можете приступить к работе.");
			strcat(stringstat, scr1);
			ShowPlayerDialog(playerid,0,DIALOG_STYLE_MSGBOX, "{FFFF00}Работа в кафе:", stringstat, "Понял", "");
	    }
	}
	if(newkeys == KEY_NO)
	{
	    if(PlayerToPoint(0.5,playerid, 2350.8323,-1355.4243,24.0300))
	    {
			if(job[playerid] == 0) ShowPlayerDialog(playerid,START_WORK, DIALOG_STYLE_MSGBOX,"{FFFFFF}Работа в {365FFF}Кафе:","\n{FFFFFF}Вы хотите переодется?","Да","Нет");
			else if(job[playerid] == 1) ShowPlayerDialog(playerid,END_WORK, DIALOG_STYLE_MSGBOX,"{FFFFFF}Работа в {365FFF}Кафе:","\n{FFFFFF}Вы хотите сдать форму?","Да","Нет");
		}
	}
	if(newkeys == KEY_NO)
	{
	    if(PlayerToPoint(0.5,playerid, 2346.6050,-1352.4476,24.0300))
	    {
			if(job[playerid] == 1)
			{
				if(kotleta[playerid] == 1)
				{
				    procent[playerid] = 0;
				    TogglePlayerControllable(playerid, 0);
				    ApplyAnimation(playerid, "INT_HOUSE", "WASH_UP", 4.1, 1, 1, 1, 0, 0, 1);
				    PlayerTextDrawShow(playerid, Prog[playerid][0]);
				    timer[playerid] = 1;
				}else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Для начала возьмите продукт, который хотите обжарить.");
			}
		}
	}
	if(newkeys == KEY_NO)
	{
	    if(PlayerToPoint(0.5,playerid, 2345.0024,-1352.3453,24.0300))
	    {
			if(job[playerid] == 1)
			{
			    if(gotovka[playerid][3] == 1)
			    {
			        if(kartop[playerid] == 1)
					{
					    TogglePlayerControllable(playerid, 0);
					    ApplyAnimation(playerid, "INT_HOUSE", "WASH_UP", 4.1, 1, 1, 1, 0, 0, 1);
					    procent[playerid] = 0;
			            PlayerTextDrawShow(playerid, Prog[playerid][0]);
			            timer[playerid] = 1;
			        }else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Для начала возьмите картошку.");
			    }else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Вы не взялись за готовку картошки фри!");
			}
		}
	}
	if(newkeys == KEY_NO)
	{
	    if(PlayerToPoint(0.5,playerid, 2344.6536,-1358.8724,24.0300))
	    {
			if(job[playerid] == 1)
			{
			    if(prigotov[playerid] == 1)
			    {
				    Clear(playerid);
				    for(new e=0; e < 4; e++) gotovka[playerid][e] = 0;
				    SendClientMessage(playerid, 0xFFFFFFFF, "{1663FE}[INFO]: {FFFFFF}Вы отдали продукт на раздачу.");
				}else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Вы еще ничего не приготовили!");
			}else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Вы не работник кафе!");
		}
	}
	if(newkeys == KEY_NO)
	{
	    if(PlayerToPoint(0.5,playerid, 2347.0215,-1357.2031,24.0300))
	    {
			if(job[playerid] == 1)
			{
			    if(gotovka[playerid][0] == 1)
			    {
			        if(pomidor[playerid] == 1 && kolbasa[playerid] == 1 && ogurec[playerid] == 1 && testo[playerid] == 1)
			        {
			            TogglePlayerControllable(playerid, 0);
			            ApplyAnimation(playerid, "INT_HOUSE", "WASH_UP", 4.1, 1, 1, 1, 0, 0, 1);
			            procent[playerid] = 0;
			            PlayerTextDrawShow(playerid, Prog[playerid][0]);
			            timer[playerid] = 1;
			        }else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Для начала возьмите продукты.");
			    }
			    if(gotovka[playerid][1] == 1)
			    {
			        if(pomidor[playerid] == 1 && bulochka[playerid] == 1 && ogurec[playerid] == 1 && kotleta2[playerid] == 1)
			        {
			            TogglePlayerControllable(playerid, 0);
			            ApplyAnimation(playerid, "INT_HOUSE", "WASH_UP", 4.1, 1, 1, 1, 0, 0, 1);
			            procent[playerid] = 0;
			            PlayerTextDrawShow(playerid, Prog[playerid][0]);
			            timer[playerid] = 1;
			        }else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Для начала возьмите продукты.");
			    }
			    if(gotovka[playerid][2] == 1)
			    {
			        if(pomidor[playerid] == 1 && zelen[playerid] == 1 && ogurec[playerid] == 1)
			        {
			            TogglePlayerControllable(playerid, 0);
			            ApplyAnimation(playerid, "INT_HOUSE", "WASH_UP", 4.1, 1, 1, 1, 0, 0, 1);
			            procent[playerid] = 0;
			            PlayerTextDrawShow(playerid, Prog[playerid][0]);
			            timer[playerid] = 1;
			        }else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Для начала возьмите продукты.");
			    }
			}else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Вы не работник кафе!");
	    }
	}
	if(newkeys == KEY_NO)
	{
	    if(PlayerToPoint(0.5,playerid, 2347.7537,-1352.2338,24.0300))
	    {
			if(job[playerid] == 1)
			{
			    ShowPlayerDialog(playerid, TUMBA, DIALOG_STYLE_LIST, "{FFFF00}Тумбочка:", "{1663FE}1. {FFFFFF}Помидор\n{1663FE}2. {FFFFFF}Колбаса\n{1663FE}3. {FFFFFF}Котлета\n{1663FE}4. {FFFFFF}Огурец\n{1663FE}5. {FFFFFF}Зелень\n{1663FE}6. {FFFFFF}Тесто\n{1663FE}7. {FFFFFF}Булочка\n{1663FE}8. {FFFFFF}Картошка", "Взять", "Закрыть");
			}else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Вы не работник кафе!");
	    }
	}
	if(newkeys == KEY_NO)
	{
	    if(PlayerToPoint(0.5,playerid, 2349.1953,-1352.4595,24.0300))
	    {
			if(job[playerid] == 1)
			{
			    for(new i=0; i < 13; i++) PlayerTextDrawShow(playerid, SelectMenu[playerid][i]);
			    SelectTextDraw(playerid, 0xDEFF8AFF);
			}else SendClientMessage(playerid, 0xFFFFFFFF, "{FF0000}[INFO]: {FFFFFF}Вы не работник кафе!");
		}
	}
	return true;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == PlayerText:INVALID_TEXT_DRAW)
 	{
		for(new i=0; i < 13; i++) PlayerTextDrawHide(playerid, SelectMenu[playerid][i]), CancelSelectTextDraw(playerid);
		for(new i=0; i < 8; i++) PlayerTextDrawHide(playerid, SkinText[playerid][i]), CancelSelectTextDraw(playerid);
 	}
	if(playertextid == SkinText[playerid][5])
	{
	    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
 		SetPVarInt(playerid, "SKINID", GetPlayerSkin(playerid));
   		SetPlayerSkin(playerid, 155);
   		job[playerid] = 1;
   		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[Шеф]: {FFFFFF}Можешь приступать к работе!");
		CancelSelectTextDraw(playerid);
        for(new i=0; i < 8; i++) PlayerTextDrawHide(playerid, SkinText[playerid][i]);
	}
	if(playertextid == SkinText[playerid][6])
	{
	    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
 		SetPVarInt(playerid, "SKINID", GetPlayerSkin(playerid));
   		SetPlayerSkin(playerid, 167);
   		job[playerid] = 1;
   		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[Шеф]: {FFFFFF}Можешь приступать к работе!");
		CancelSelectTextDraw(playerid);
        for(new i=0; i < 8; i++) PlayerTextDrawHide(playerid, SkinText[playerid][i]);
	}
	if(playertextid == SkinText[playerid][7])
	{
	    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
 		SetPVarInt(playerid, "SKINID", GetPlayerSkin(playerid));
   		SetPlayerSkin(playerid, 205);
   		job[playerid] = 1;
   		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[Шеф]: {FFFFFF}Можешь приступать к работе!");
		CancelSelectTextDraw(playerid);
        for(new i=0; i < 8; i++) PlayerTextDrawHide(playerid, SkinText[playerid][i]);
	}
	if(playertextid == SelectMenu[playerid][5])
	{
	    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
 		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взялись готовить пиццу.");
	    SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Возьмите из тумбочки: помидор, огурец, колбасу, тесто.");
	    gotovka[playerid][0] = 1;
	    for(new i=0; i < 13; i++) PlayerTextDrawHide(playerid, SelectMenu[playerid][i]);
	    CancelSelectTextDraw(playerid);
	}
	if(playertextid == SelectMenu[playerid][6])
	{
	    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
 		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взялись готовить бургер.");
		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Возьмите из тумбочки: булочку, помидор, огурец, котлету.");
	    gotovka[playerid][1] = 1;
	    for(new i=0; i < 13; i++) PlayerTextDrawHide(playerid, SelectMenu[playerid][i]);
	    CancelSelectTextDraw(playerid);
	}
	if(playertextid == SelectMenu[playerid][7])
	{
	    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
 		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взялись готовить салат.");
		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Возьмите из тумбочки: помидор, огурец, зелень.");
	    gotovka[playerid][2] = 1;
	    for(new i=0; i < 13; i++) PlayerTextDrawHide(playerid, SelectMenu[playerid][i]);
	    CancelSelectTextDraw(playerid);
	}
	if(playertextid == SelectMenu[playerid][8])
	{
	    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
 		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взялись готовить картошку фри.");
		SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Возьмите из тумбочки: картошку, затем обжарьте её во фритюре.");
	    gotovka[playerid][3] = 1;
	    for(new i=0; i < 13; i++) PlayerTextDrawHide(playerid, SelectMenu[playerid][i]);
	    CancelSelectTextDraw(playerid);
	}
	if(playertextid == SkinText[playerid][2]) for(new i=0; i < 8; i++) PlayerTextDrawHide(playerid, SkinText[playerid][i]), CancelSelectTextDraw(playerid), PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
	if(playertextid == SelectMenu[playerid][2]) for(new i=0; i < 13; i++) PlayerTextDrawHide(playerid, SelectMenu[playerid][i]), CancelSelectTextDraw(playerid), PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
	return true;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case TUMBA:
		{
		    if(response)
		    {
  				switch(listitem)
				{
				    case 0: pomidor[playerid] = 1, SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взяли помидор."), ShowPlayerDialog(playerid, TUMBA, DIALOG_STYLE_LIST, "{FFFF00}Тумбочка:", "{1663FE}1. {FFFFFF}Помидор\n{1663FE}2. {FFFFFF}Колбаса\n{1663FE}3. {FFFFFF}Котлета\n{1663FE}4. {FFFFFF}Огурец\n{1663FE}5. {FFFFFF}Зелень\n{1663FE}6. {FFFFFF}Тесто\n{1663FE}7. {FFFFFF}Булочка\n{1663FE}8. {FFFFFF}Картошка", "Взять", "Закрыть");
				    case 1: kolbasa[playerid] = 1, SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взяли колбасу."), ShowPlayerDialog(playerid, TUMBA, DIALOG_STYLE_LIST, "{FFFF00}Тумбочка:", "{1663FE}1. {FFFFFF}Помидор\n{1663FE}2. {FFFFFF}Колбаса\n{1663FE}3. {FFFFFF}Котлета\n{1663FE}4. {FFFFFF}Огурец\n{1663FE}5. {FFFFFF}Зелень\n{1663FE}6. {FFFFFF}Тесто\n{1663FE}7. {FFFFFF}Булочка\n{1663FE}8. {FFFFFF}Картошка", "Взять", "Закрыть");
				    case 2: kotleta[playerid] = 1, SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взяли котлету."), ShowPlayerDialog(playerid, TUMBA, DIALOG_STYLE_LIST, "{FFFF00}Тумбочка:", "{1663FE}1. {FFFFFF}Помидор\n{1663FE}2. {FFFFFF}Колбаса\n{1663FE}3. {FFFFFF}Котлета\n{1663FE}4. {FFFFFF}Огурец\n{1663FE}5. {FFFFFF}Зелень\n{1663FE}6. {FFFFFF}Тесто\n{1663FE}7. {FFFFFF}Булочка\n{1663FE}8. {FFFFFF}Картошка", "Взять", "Закрыть");
				    case 3: ogurec[playerid] = 1, SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взяли огурец."), ShowPlayerDialog(playerid, TUMBA, DIALOG_STYLE_LIST, "{FFFF00}Тумбочка:", "{1663FE}1. {FFFFFF}Помидор\n{1663FE}2. {FFFFFF}Колбаса\n{1663FE}3. {FFFFFF}Котлета\n{1663FE}4. {FFFFFF}Огурец\n{1663FE}5. {FFFFFF}Зелень\n{1663FE}6. {FFFFFF}Тесто\n{1663FE}7. {FFFFFF}Булочка\n{1663FE}8. {FFFFFF}Картошка", "Взять", "Закрыть");
				    case 4: zelen[playerid] = 1, SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взяли зелень."), ShowPlayerDialog(playerid, TUMBA, DIALOG_STYLE_LIST, "{FFFF00}Тумбочка:", "{1663FE}1. {FFFFFF}Помидор\n{1663FE}2. {FFFFFF}Колбаса\n{1663FE}3. {FFFFFF}Котлета\n{1663FE}4. {FFFFFF}Огурец\n{1663FE}5. {FFFFFF}Зелень\n{1663FE}6. {FFFFFF}Тесто\n{1663FE}7. {FFFFFF}Булочка\n{1663FE}8. {FFFFFF}Картошка", "Взять", "Закрыть");
				    case 5: testo[playerid] = 1, SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взяли тесто."), ShowPlayerDialog(playerid, TUMBA, DIALOG_STYLE_LIST, "{FFFF00}Тумбочка:", "{1663FE}1. {FFFFFF}Помидор\n{1663FE}2. {FFFFFF}Колбаса\n{1663FE}3. {FFFFFF}Котлета\n{1663FE}4. {FFFFFF}Огурец\n{1663FE}5. {FFFFFF}Зелень\n{1663FE}6. {FFFFFF}Тесто\n{1663FE}7. {FFFFFF}Булочка\n{1663FE}8. {FFFFFF}Картошка", "Взять", "Закрыть");
				    case 6: bulochka[playerid] = 1, SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взяли булочку."), ShowPlayerDialog(playerid, TUMBA, DIALOG_STYLE_LIST, "{FFFF00}Тумбочка:", "{1663FE}1. {FFFFFF}Помидор\n{1663FE}2. {FFFFFF}Колбаса\n{1663FE}3. {FFFFFF}Котлета\n{1663FE}4. {FFFFFF}Огурец\n{1663FE}5. {FFFFFF}Зелень\n{1663FE}6. {FFFFFF}Тесто\n{1663FE}7. {FFFFFF}Булочка\n{1663FE}8. {FFFFFF}Картошка", "Взять", "Закрыть");
				    case 7: kartop[playerid] = 1, SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы взяли картошку."), ShowPlayerDialog(playerid, TUMBA, DIALOG_STYLE_LIST, "{FFFF00}Тумбочка:", "{1663FE}1. {FFFFFF}Помидор\n{1663FE}2. {FFFFFF}Колбаса\n{1663FE}3. {FFFFFF}Котлета\n{1663FE}4. {FFFFFF}Огурец\n{1663FE}5. {FFFFFF}Зелень\n{1663FE}6. {FFFFFF}Тесто\n{1663FE}7. {FFFFFF}Булочка\n{1663FE}8. {FFFFFF}Картошка", "Взять", "Закрыть");
				}
		    }
		}
	    case END_WORK:
	    {
	        if(response)
	        {
	            new zp[128];
	            SetPlayerSkin(playerid, GetPVarInt(playerid, "SKINID"));
	            job[playerid] = 0;
				Clear(playerid);
				GivePlayerMoney(playerid, zarplata[playerid]);
				format(zp, sizeof(zp), "{365FFF}[Шеф]: {FFFFFF}Твоя зарплата: {365FFF}%d$", zarplata[playerid]);
				SendClientMessage(playerid, 0xFFFFFFFF, "{365FFF}[Шеф]: {FFFFFF}Ты закончил работу.");
				SendClientMessage(playerid, 0xFFFFFFFF, zp);
				zarplata[playerid] = 0;
	        }
	    }
	    case START_WORK:
	    {
	        if(response)
	        {
         		for(new i=0; i < 8; i++) PlayerTextDrawShow(playerid, SkinText[playerid][i]);
         		SelectTextDraw(playerid, 0xDEFF8AFF);
	        }
	    }
	}
	return true;
}

forward GotTime(playerid);
public GotTime(playerid)
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(timer[i] == 1)
	    {
			procent[i] += random(7)+1;
			new progstring[50];
			format(progstring,50,"~w~PROGRESS: ~b~%d%",procent[i]);
			PlayerTextDrawSetString(i, Prog[i][0], progstring);
			if(procent[i] >= 100)
			{
	 			PlayerTextDrawHide(i, Prog[i][0]);
				if(gotovka[i][0] == 1)
			 	{
			 	    TogglePlayerControllable(playerid, 1);
			 	    ClearAnimations(playerid, 0);
			 		zarplata[i] += PIZZA;
					SendClientMessage(i, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы приготовили пиццу, отнесите её на раздачу.");
					Clear(i);
					prigotov[i] = 1;
					for(new e=0; e < 4; e++) gotovka[i][e] = 0;
			 	}
	 			if(gotovka[i][1] == 1 && kotleta2[playerid] == 1)
	 			{
	 			    TogglePlayerControllable(playerid, 1);
	 			    ClearAnimations(playerid, 0);
	 				zarplata[i] += BURGER;
					SendClientMessage(i, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы приготовили бургер, отнесите его на раздачу.");
					Clear(i);
					prigotov[i] = 1;
					for(new e=0; e < 4; e++) gotovka[i][e] = 0;
	 			}
			 	if(gotovka[i][2] == 1)
			 	{
			 	    TogglePlayerControllable(playerid, 1);
			 	    ClearAnimations(playerid, 0);
				 	zarplata[i] += SALAD;
					SendClientMessage(i, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы приготовили салат, отнесите его на раздачу.");
					Clear(i);
					prigotov[i] = 1;
					for(new e=0; e < 4; e++) gotovka[i][e] = 0;
			 	}
			 	if(gotovka[i][3] == 1)
			 	{
			 	    TogglePlayerControllable(playerid, 1);
			 	    ClearAnimations(playerid, 0);
				 	zarplata[i] += POTATO;
					SendClientMessage(i, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы приготовили картошку фри, её на раздачу.");
					Clear(i);
					prigotov[i] = 1;
					for(new e=0; e < 4; e++) gotovka[i][e] = 0;
			 	}
			 	if(gotovka[i][1] == 1 && kotleta[i] == 1)
			 	{
			 	    TogglePlayerControllable(playerid, 1);
			 	    ClearAnimations(playerid, 0);
			 	    timer[i] = 0;
				 	kotleta[i] = 0;
				 	kotleta2[i] = 1;
				 	SendClientMessage(i, 0xFFFFFFFF, "{365FFF}[INFO]: {FFFFFF}Вы обжарили котлету, теперь Вы можете приготовить бургер.");
			 	}
			}
		}
	}
	return true;
}

stock LoadingText(playerid)
{
	test[playerid] = CreatePlayerTextDraw(playerid, 484.108367, 135.083328, "usebox");
	PlayerTextDrawLetterSize(playerid, test[playerid], 0.000000, 2.081482);
	PlayerTextDrawTextSize(playerid, test[playerid], 145.584182, 0.000000);
	PlayerTextDrawAlignment(playerid, test[playerid], 1);
	PlayerTextDrawColor(playerid, test[playerid], 0);
	PlayerTextDrawUseBox(playerid, test[playerid], true);
	PlayerTextDrawBoxColor(playerid, test[playerid], -2147483393);
	PlayerTextDrawSetShadow(playerid, test[playerid], 0);
	PlayerTextDrawSetOutline(playerid, test[playerid], 0);
	PlayerTextDrawFont(playerid, test[playerid], 0);

	Prog[playerid][0] = CreatePlayerTextDraw(playerid, 238.008712, 366.916717, "_");
	PlayerTextDrawLetterSize(playerid, Prog[playerid][0], 0.478111, 2.183332);
	PlayerTextDrawAlignment(playerid, Prog[playerid][0], 1);
	PlayerTextDrawColor(playerid, Prog[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, Prog[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Prog[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, Prog[playerid][0], 51);
	PlayerTextDrawFont(playerid, Prog[playerid][0], 2);
	PlayerTextDrawSetProportional(playerid, Prog[playerid][0], 1);
	
	SkinText[playerid][0] = CreatePlayerTextDraw(playerid, 448.969268, 127.500000, "usebox");
	PlayerTextDrawLetterSize(playerid, SkinText[playerid][0], 0.000000, 1.627777);
	PlayerTextDrawTextSize(playerid, SkinText[playerid][0], 182.128845, 0.000000);
	PlayerTextDrawAlignment(playerid, SkinText[playerid][0], 1);
	PlayerTextDrawColor(playerid, SkinText[playerid][0], 0);
	PlayerTextDrawUseBox(playerid, SkinText[playerid][0], true);
	PlayerTextDrawBoxColor(playerid, SkinText[playerid][0], 102);
	PlayerTextDrawSetShadow(playerid, SkinText[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, SkinText[playerid][0], 0);
	PlayerTextDrawFont(playerid, SkinText[playerid][0], 0);

	SkinText[playerid][1] = CreatePlayerTextDraw(playerid, 291.607879, 127.050048, "WORK");
	PlayerTextDrawLetterSize(playerid, SkinText[playerid][1], 0.449999, 1.600000);
	PlayerTextDrawAlignment(playerid, SkinText[playerid][1], 1);
	PlayerTextDrawColor(playerid, SkinText[playerid][1], -1);
	PlayerTextDrawUseBox(playerid, SkinText[playerid][1], true);
	PlayerTextDrawBoxColor(playerid, SkinText[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, SkinText[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, SkinText[playerid][1], 1);
	PlayerTextDrawBackgroundColor(playerid, SkinText[playerid][1], 51);
	PlayerTextDrawFont(playerid, SkinText[playerid][1], 3);
	PlayerTextDrawSetProportional(playerid, SkinText[playerid][1], 1);

	SkinText[playerid][2] = CreatePlayerTextDraw(playerid, 431.039245, 127.166580, "X");
	PlayerTextDrawLetterSize(playerid, SkinText[playerid][2], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, SkinText[playerid][2], 444.158508, 18.666667);
	PlayerTextDrawAlignment(playerid, SkinText[playerid][2], 1);
	PlayerTextDrawColor(playerid, SkinText[playerid][2], -2147483393);
	PlayerTextDrawUseBox(playerid, SkinText[playerid][2], true);
	PlayerTextDrawBoxColor(playerid, SkinText[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, SkinText[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, SkinText[playerid][2], 1);
	PlayerTextDrawBackgroundColor(playerid, SkinText[playerid][2], 51);
	PlayerTextDrawFont(playerid, SkinText[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, SkinText[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, SkinText[playerid][2], true);

	SkinText[playerid][3] = CreatePlayerTextDraw(playerid, 448.969268, 147.916656, "usebox");
	PlayerTextDrawLetterSize(playerid, SkinText[playerid][3], 0.000000, 1.562965);
	PlayerTextDrawTextSize(playerid, SkinText[playerid][3], 182.128845, 0.000000);
	PlayerTextDrawAlignment(playerid, SkinText[playerid][3], 1);
	PlayerTextDrawColor(playerid, SkinText[playerid][3], 0);
	PlayerTextDrawUseBox(playerid, SkinText[playerid][3], true);
	PlayerTextDrawBoxColor(playerid, SkinText[playerid][3], 16777215);
	PlayerTextDrawSetShadow(playerid, SkinText[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, SkinText[playerid][3], 0);
	PlayerTextDrawFont(playerid, SkinText[playerid][3], 0);

	SkinText[playerid][4] = CreatePlayerTextDraw(playerid, 250.658599, 146.999984, "SKIN SELECT:");
	PlayerTextDrawLetterSize(playerid, SkinText[playerid][4], 0.449999, 1.600000);
	PlayerTextDrawAlignment(playerid, SkinText[playerid][4], 1);
	PlayerTextDrawColor(playerid, SkinText[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, SkinText[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, SkinText[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, SkinText[playerid][4], 51);
	PlayerTextDrawFont(playerid, SkinText[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, SkinText[playerid][4], 1);

	SkinText[playerid][5] = CreatePlayerTextDraw(playerid, 183.660232, 166.833374, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, SkinText[playerid][5], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, SkinText[playerid][5], 85.739372, 148.749938);
	PlayerTextDrawAlignment(playerid, SkinText[playerid][5], 1);
	PlayerTextDrawColor(playerid, SkinText[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, SkinText[playerid][5], true);
	PlayerTextDrawBoxColor(playerid, SkinText[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, SkinText[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, SkinText[playerid][5], 1);
	PlayerTextDrawBackgroundColor(playerid, SkinText[playerid][5], 51);
	PlayerTextDrawFont(playerid, SkinText[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, SkinText[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, SkinText[playerid][5], true);
	PlayerTextDrawSetPreviewModel(playerid, SkinText[playerid][5], 155);
	PlayerTextDrawSetPreviewRot(playerid, SkinText[playerid][5], 0.000000, 0.000000, 0.000000, 1.000000);

	SkinText[playerid][6] = CreatePlayerTextDraw(playerid, 362.230133, 166.666778, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, SkinText[playerid][6], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, SkinText[playerid][6], 84.802330, 148.749938);
	PlayerTextDrawAlignment(playerid, SkinText[playerid][6], 1);
	PlayerTextDrawColor(playerid, SkinText[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, SkinText[playerid][6], true);
	PlayerTextDrawBoxColor(playerid, SkinText[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, SkinText[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, SkinText[playerid][6], 1);
	PlayerTextDrawBackgroundColor(playerid, SkinText[playerid][6], 51);
	PlayerTextDrawFont(playerid, SkinText[playerid][6], 5);
	PlayerTextDrawSetProportional(playerid, SkinText[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, SkinText[playerid][6], true);
	PlayerTextDrawSetPreviewModel(playerid, SkinText[playerid][6], 167);
	PlayerTextDrawSetPreviewRot(playerid, SkinText[playerid][6], 0.000000, 0.000000, 0.000000, 1.000000);

	SkinText[playerid][7] = CreatePlayerTextDraw(playerid, 271.868347, 167.083419, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, SkinText[playerid][7], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, SkinText[playerid][7], 88.081977, 148.166610);
	PlayerTextDrawAlignment(playerid, SkinText[playerid][7], 1);
	PlayerTextDrawColor(playerid, SkinText[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, SkinText[playerid][7], true);
	PlayerTextDrawBoxColor(playerid, SkinText[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, SkinText[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, SkinText[playerid][7], 1);
	PlayerTextDrawBackgroundColor(playerid, SkinText[playerid][7], 51);
	PlayerTextDrawFont(playerid, SkinText[playerid][7], 5);
	PlayerTextDrawSetProportional(playerid, SkinText[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, SkinText[playerid][7], true);
	PlayerTextDrawSetPreviewModel(playerid, SkinText[playerid][7], 205);
	PlayerTextDrawSetPreviewRot(playerid, SkinText[playerid][7], 0.000000, 0.000000, 0.000000, 1.000000);
	
	SelectMenu[playerid][0] = CreatePlayerTextDraw(playerid, 446.626647, 131.583343, "usebox");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][0], 0.000000, 1.627777);
	PlayerTextDrawTextSize(playerid, SelectMenu[playerid][0], 175.101013, 0.000000);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][0], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][0], 0);
	PlayerTextDrawUseBox(playerid, SelectMenu[playerid][0], true);
	PlayerTextDrawBoxColor(playerid, SelectMenu[playerid][0], 102);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][0], 0);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][0], 0);

	SelectMenu[playerid][1] = CreatePlayerTextDraw(playerid, 292.357147, 131.250045, "WORK");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][1], 0.449999, 1.600000);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][1], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][1], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][1], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][1], 3);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][1], 1);

	SelectMenu[playerid][2] = CreatePlayerTextDraw(playerid, 427.010406, 130.958343, "X");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][2], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, SelectMenu[playerid][2], 440.878967, 18.666671);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][2], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][2], -2147483393);
	PlayerTextDrawUseBox(playerid, SelectMenu[playerid][2], true);
	PlayerTextDrawBoxColor(playerid, SelectMenu[playerid][2], 0);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][2], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][2], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][2], 2);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, SelectMenu[playerid][2], true);

	SelectMenu[playerid][3] = CreatePlayerTextDraw(playerid, 446.626647, 152.000000, "usebox");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][3], 0.000000, 1.562961);
	PlayerTextDrawTextSize(playerid, SelectMenu[playerid][3], 175.101013, 0.000000);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][3], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][3], 0);
	PlayerTextDrawUseBox(playerid, SelectMenu[playerid][3], true);
	PlayerTextDrawBoxColor(playerid, SelectMenu[playerid][3], -1523963137);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][3], 0);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][3], 0);

	SelectMenu[playerid][4] = CreatePlayerTextDraw(playerid, 244.099411, 151.083343, "Select a dish");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][4], 0.449999, 1.600000);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][4], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][4], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][4], 2);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][4], 1);

	SelectMenu[playerid][5] = CreatePlayerTextDraw(playerid, 177.100967, 169.750122, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][5], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, SelectMenu[playerid][5], 64.655921, 74.083183);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][5], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][5], -1);
	PlayerTextDrawUseBox(playerid, SelectMenu[playerid][5], true);
	PlayerTextDrawBoxColor(playerid, SelectMenu[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][5], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][5], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][5], 5);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, SelectMenu[playerid][5], true);
	PlayerTextDrawSetPreviewModel(playerid, SelectMenu[playerid][5], 19580);
	PlayerTextDrawSetPreviewRot(playerid, SelectMenu[playerid][5], 300.000000, 0.000000, 0.000000, 1.000000);

	SelectMenu[playerid][6] = CreatePlayerTextDraw(playerid, 242.693832, 169.750076, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][6], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, SelectMenu[playerid][6], 62.781837, 74.083274);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][6], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][6], -1);
	PlayerTextDrawUseBox(playerid, SelectMenu[playerid][6], true);
	PlayerTextDrawBoxColor(playerid, SelectMenu[playerid][6], 0);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][6], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][6], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][6], 5);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, SelectMenu[playerid][6], true);
	PlayerTextDrawSetPreviewModel(playerid, SelectMenu[playerid][6], 2703);
	PlayerTextDrawSetPreviewRot(playerid, SelectMenu[playerid][6], 300.000000, 0.000000, 0.000000, 1.000000);

	SelectMenu[playerid][7] = CreatePlayerTextDraw(playerid, 306.881072, 169.750091, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][7], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, SelectMenu[playerid][7], 66.530014, 74.083267);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][7], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][7], -1);
	PlayerTextDrawUseBox(playerid, SelectMenu[playerid][7], true);
	PlayerTextDrawBoxColor(playerid, SelectMenu[playerid][7], 0);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][7], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][7], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][7], 5);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][7], 1);
	PlayerTextDrawSetSelectable(playerid, SelectMenu[playerid][7], true);
	PlayerTextDrawSetPreviewModel(playerid, SelectMenu[playerid][7], 19568);
	PlayerTextDrawSetPreviewRot(playerid, SelectMenu[playerid][7], 300.000000, 0.000000, 200.000000, 1.000000);

	SelectMenu[playerid][8] = CreatePlayerTextDraw(playerid, 374.348907, 169.750030, "New Textdraw");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][8], 0.449999, 1.600000);
	PlayerTextDrawTextSize(playerid, SelectMenu[playerid][8], 70.278175, 74.666618);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][8], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][8], -1);
	PlayerTextDrawUseBox(playerid, SelectMenu[playerid][8], true);
	PlayerTextDrawBoxColor(playerid, SelectMenu[playerid][8], 0);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][8], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][8], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][8], 5);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][8], 1);
	PlayerTextDrawSetSelectable(playerid, SelectMenu[playerid][8], true);
	PlayerTextDrawSetPreviewModel(playerid, SelectMenu[playerid][8], 2219);
	PlayerTextDrawSetPreviewRot(playerid, SelectMenu[playerid][8], 200.000000, 200.000000, 0.000000, 1.000000);

	SelectMenu[playerid][9] = CreatePlayerTextDraw(playerid, 179.912063, 170.333435, "_");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][9], 0.186691, 1.296666);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][9], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][9], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][9], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][9], 2);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][9], 1);

	SelectMenu[playerid][10] = CreatePlayerTextDraw(playerid, 246.036666, 170.166702, "_");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][10], 0.186691, 1.296666);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][10], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][10], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][10], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][10], 2);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][10], 1);

	SelectMenu[playerid][11] = CreatePlayerTextDraw(playerid, 309.350097, 170.000198, "_");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][11], 0.186691, 1.296666);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][11], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][11], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][11], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][11], 2);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][11], 1);

	SelectMenu[playerid][12] = CreatePlayerTextDraw(playerid, 376.880859, 169.250183, "_");
	PlayerTextDrawLetterSize(playerid, SelectMenu[playerid][12], 0.186691, 1.296666);
	PlayerTextDrawAlignment(playerid, SelectMenu[playerid][12], 1);
	PlayerTextDrawColor(playerid, SelectMenu[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, SelectMenu[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, SelectMenu[playerid][12], 1);
	PlayerTextDrawBackgroundColor(playerid, SelectMenu[playerid][12], 51);
	PlayerTextDrawFont(playerid, SelectMenu[playerid][12], 2);
	PlayerTextDrawSetProportional(playerid, SelectMenu[playerid][12], 1);
	return true;
}

stock PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
    if(IsPlayerConnected(playerid))
    {
	     new Float:oldposx, Float:oldposy, Float:oldposz;
	     new Float:tempposx, Float:tempposy, Float:tempposz;
	     GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	     tempposx = (oldposx -x);
	     tempposy = (oldposy -y);
	     tempposz = (oldposz -z);
	     if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) return 1;
    }
	return false;
}

stock Clear(playerid)
{
    prigotov[playerid] = 0;
	timer[playerid] = 0;
	gotovka[playerid][0] = 0;
	pomidor[playerid] = 0;
	kolbasa[playerid] = 0;
	ogurec[playerid] = 0;
	testo[playerid] = 0;
	kotleta[playerid] = 0;
	kotleta2[playerid] = 0;
	zelen[playerid] = 0;
	bulochka[playerid] = 0;
	kartop[playerid] = 0;
	procent[playerid] = 0;
}

stock PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0);
 	return 1;
}

stock PreloadAllAnimLibs(playerid)
{
        PreloadAnimLib(playerid,"AIRPORT");
        PreloadAnimLib(playerid,"Attractors");
        PreloadAnimLib(playerid,"BAR");
        PreloadAnimLib(playerid,"BASEBALL");
        PreloadAnimLib(playerid,"BD_FIRE");
        PreloadAnimLib(playerid,"BEACH");
        PreloadAnimLib(playerid,"benchpress");
        PreloadAnimLib(playerid,"BF_injection");
        PreloadAnimLib(playerid,"BIKED");
        PreloadAnimLib(playerid,"BIKEH");
        PreloadAnimLib(playerid,"BIKELEAP");
        PreloadAnimLib(playerid,"BIKES");
        PreloadAnimLib(playerid,"BIKEV");
        PreloadAnimLib(playerid,"BIKE_DBZ");
        PreloadAnimLib(playerid,"BLOWJOBZ");
        PreloadAnimLib(playerid,"BMX");
        PreloadAnimLib(playerid,"BOMBER");
        PreloadAnimLib(playerid,"BOX");
        PreloadAnimLib(playerid,"BSKTBALL");
        PreloadAnimLib(playerid,"BUDDY");
        PreloadAnimLib(playerid,"BUS");
        PreloadAnimLib(playerid,"CAMERA");
        PreloadAnimLib(playerid,"CAR");
        PreloadAnimLib(playerid,"CARRY");
        PreloadAnimLib(playerid,"CAR_CHAT");
        PreloadAnimLib(playerid,"CASINO");
        PreloadAnimLib(playerid,"CHAINSAW");
        PreloadAnimLib(playerid,"CHOPPA");
        PreloadAnimLib(playerid,"CLOTHES");
        PreloadAnimLib(playerid,"COACH");
        PreloadAnimLib(playerid,"COLT45");
        PreloadAnimLib(playerid,"COP_AMBIENT");
        PreloadAnimLib(playerid,"COP_DVBYZ");
        PreloadAnimLib(playerid,"CRACK");
        PreloadAnimLib(playerid,"CRIB");
        PreloadAnimLib(playerid,"DAM_JUMP");
        PreloadAnimLib(playerid,"DANCING");
        PreloadAnimLib(playerid,"DEALER");
        PreloadAnimLib(playerid,"DILDO");
        PreloadAnimLib(playerid,"DODGE");
        PreloadAnimLib(playerid,"DOZER");
        PreloadAnimLib(playerid,"DRIVEBYS");
        PreloadAnimLib(playerid,"FAT");
        PreloadAnimLib(playerid,"FIGHT_B");
        PreloadAnimLib(playerid,"FIGHT_C");
        PreloadAnimLib(playerid,"FIGHT_D");
        PreloadAnimLib(playerid,"FIGHT_E");
        PreloadAnimLib(playerid,"FINALE");
        PreloadAnimLib(playerid,"FINALE2");
        PreloadAnimLib(playerid,"FLAME");
        PreloadAnimLib(playerid,"Flowers");
        PreloadAnimLib(playerid,"FOOD");
        PreloadAnimLib(playerid,"Freeweights");
        PreloadAnimLib(playerid,"GANGS");
        PreloadAnimLib(playerid,"GHANDS");
        PreloadAnimLib(playerid,"GHETTO_DB");
        PreloadAnimLib(playerid,"goggles");
        PreloadAnimLib(playerid,"GRAFFITI");
        PreloadAnimLib(playerid,"GRAVEYARD");
        PreloadAnimLib(playerid,"GRENADE");
        PreloadAnimLib(playerid,"GYMNASIUM");
        PreloadAnimLib(playerid,"HAIRCUTS");
        PreloadAnimLib(playerid,"HEIST9");
        PreloadAnimLib(playerid,"INT_HOUSE");
        PreloadAnimLib(playerid,"INT_OFFICE");
        PreloadAnimLib(playerid,"INT_SHOP");
        PreloadAnimLib(playerid,"JST_BUISNESS");
        PreloadAnimLib(playerid,"KART");
        PreloadAnimLib(playerid,"KISSING");
        PreloadAnimLib(playerid,"KNIFE");
        PreloadAnimLib(playerid,"LAPDAN1");
        PreloadAnimLib(playerid,"LAPDAN2");
        PreloadAnimLib(playerid,"LAPDAN3");
        PreloadAnimLib(playerid,"LOWRIDER");
        PreloadAnimLib(playerid,"MD_CHASE");
        PreloadAnimLib(playerid,"MD_END");
        PreloadAnimLib(playerid,"MEDIC");
        PreloadAnimLib(playerid,"MISC");
        PreloadAnimLib(playerid,"MTB");
        PreloadAnimLib(playerid,"MUSCULAR");
        PreloadAnimLib(playerid,"NEVADA");
        PreloadAnimLib(playerid,"ON_LOOKERS");
        PreloadAnimLib(playerid,"OTB");
        PreloadAnimLib(playerid,"PARACHUTE");
        PreloadAnimLib(playerid,"PARK");
        PreloadAnimLib(playerid,"PAULNMAC");
        PreloadAnimLib(playerid,"ped");
        PreloadAnimLib(playerid,"PLAYER_DVBYS");
        PreloadAnimLib(playerid,"PLAYIDLES");
        PreloadAnimLib(playerid,"POLICE");
        PreloadAnimLib(playerid,"POOL");
        PreloadAnimLib(playerid,"POOR");
        PreloadAnimLib(playerid,"PYTHON");
        PreloadAnimLib(playerid,"QUAD");
        PreloadAnimLib(playerid,"QUAD_DBZ");
        PreloadAnimLib(playerid,"RAPPING");
        PreloadAnimLib(playerid,"RIFLE");
        PreloadAnimLib(playerid,"RIOT");
        PreloadAnimLib(playerid,"ROB_BANK");
        PreloadAnimLib(playerid,"ROCKET");
        PreloadAnimLib(playerid,"RUSTLER");
        PreloadAnimLib(playerid,"RYDER");
        PreloadAnimLib(playerid,"SCRATCHING");
        PreloadAnimLib(playerid,"SHAMAL");
        PreloadAnimLib(playerid,"SHOP");
        PreloadAnimLib(playerid,"SHOTGUN");
        PreloadAnimLib(playerid,"SILENCED");
        PreloadAnimLib(playerid,"SKATE");
        PreloadAnimLib(playerid,"SMOKING");
        PreloadAnimLib(playerid,"SNIPER");
        PreloadAnimLib(playerid,"SPRAYCAN");
        PreloadAnimLib(playerid,"STRIP");
        PreloadAnimLib(playerid,"SUNBATHE");
        PreloadAnimLib(playerid,"SWAT");
        PreloadAnimLib(playerid,"SWEET");
        PreloadAnimLib(playerid,"SWIM");
        PreloadAnimLib(playerid,"SWORD");
        PreloadAnimLib(playerid,"TANK");
        PreloadAnimLib(playerid,"TATTOOS");
        PreloadAnimLib(playerid,"TEC");
        PreloadAnimLib(playerid,"TRAIN");
        PreloadAnimLib(playerid,"TRUCK");
        PreloadAnimLib(playerid,"UZI");
        PreloadAnimLib(playerid,"VAN");
        PreloadAnimLib(playerid,"VENDING");
        PreloadAnimLib(playerid,"VORTEX");
        PreloadAnimLib(playerid,"WAYFARER");
        PreloadAnimLib(playerid,"WEAPONS");
        PreloadAnimLib(playerid,"WUZI");
   		return true;
}

stock Edit(playerid)
{
	new edit[128];
	format(edit,128,"~G~COST: %d$", PIZZA);
	PlayerTextDrawSetString(playerid, SelectMenu[playerid][9], edit);
	format(edit,128,"~G~COST: %d$", BURGER);
	PlayerTextDrawSetString(playerid, SelectMenu[playerid][10], edit);
	format(edit,128,"~G~COST: %d$", SALAD);
	PlayerTextDrawSetString(playerid, SelectMenu[playerid][11], edit);
	format(edit,128,"~G~COST: %d$", POTATO);
	PlayerTextDrawSetString(playerid, SelectMenu[playerid][12], edit);
}

stock PlayerName(playerid)
{
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid,pname,sizeof(pname));
	return pname;
}
