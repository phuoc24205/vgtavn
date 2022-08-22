/*------------------CASINO-ADVANCE-RP---------------
Credit
By Annihilator vk.com/annihilator_page

 Позиционируется как мод, который можно запустить в
 свободном режиме и протестировать саму систему.

 Строки 534 и 535 отвечают за проверку и снятия денег.
 Строка 1073 овтечает за начисление денег в случае выигрыша.*/

/*Данный мод куплен мною (Danny_Marcelo), имею право распространять его где угодно
Связь со мной:

ВКонтакте: https://vk.com/dannymarcelo
YouTube: https://www.youtube.com/MsDanFreedom*/
#include <a_samp>
#include <streamer>
#include <crashdetect>

main()
{
}


#define MAX_AVTOMATS 24
#define MAX_TEXTDRAWS 14

#define SLOT_SOUND 4202
#define JACKPOT_SOUND 4201

#define SET 0.006
#define MOVE 0.006

#define OBJ_WORLD 0
#define OBJ_INTERIOR 1

enum pAvtomat
{
    Float:xobj,
    Float:yobj,
    Float:zobj,
    Float:rxobj,
    Float:ryobj,
    Float:rzobj,
	Float:mx,
	Float:my,
	Float:mz,
	x1,
	x2,
	x3,
	bool:skipx1,
	bool:skipx2,
	bool:skipx3,
	x1obj,
	x2obj,
	x3obj,
	gobj,
	balance,
	stavka,
	xwin,
	bool:use,
	bool:playing,
	player,
	Float:mposx,
	Float:mposy,
	Float:mposz,
	x1group,
	x2group,
	x3group,
	timer0,
	timer1,
	timer2,
	timer3
};
new AvtomatInfo[MAX_AVTOMATS][pAvtomat];
enum ainfo
{
	Float:nx,
	Float:ny,
	Float:nz,
	Float:nmx,
	Float:nmy,
	Float:nmz,
	Float:nrx,
	Float:nry,
	Float:nrz,
	bool:framework
};
static AC[MAX_AVTOMATS][ainfo] =
{
	{2218.564453,1614.289062,1006.709777, 2218.6169,1613.687,     1006.184, 0.0, 0.0, 0.0 	,	false},
	{2218.627453,1614.6804,  1006.709777, 2218.6169,1615.2592,	  1006.184, 0.0, 0.0, 180.0	,	false},
	{2218.564453,1618.629287,1006.709777, 2218.6169,1618.0944,    1006.184, 0.0, 0.0, 0.0	,	false},
	{2218.627453,1619.016871,1006.709777, 2218.6169,1619.6398,    1006.184, 0.0, 0.0, 180.0	,	false},
	{2218.564453,1592.443023,1006.709777, 2218.6169,1591.875415,  1006.184, 0.0, 0.0, 0.0	,	false},
	{2218.627453,1592.838095,1006.709777, 2218.6169,1593.402065,  1006.184, 0.0, 0.0, 180.0	,	false},
	{2218.564453,1588.139051,1006.709777, 2218.6169,1587.563159,  1006.184, 0.0, 0.0, 0.0	,	false},
	{2218.627453,1588.533617,1006.709777, 2218.6169,1589.187377,  1006.184, 0.0, 0.0, 180.0	,	false},
	{2218.564453,1609.953247,1006.709777, 2218.616943,1609.351196,1006.1840,0.0,0.0,0.0	    ,	true},
	{2218.627441,1610.344604,1006.709777, 2218.679931,1610.946655,1006.184020,0.0,0.0,180.0	,	true},
	{2218.564453,1596.750000,1006.709777, 2218.616943,1596.147949,1006.184020,0.0,0.0,0.0	,	true},
	{2218.627441,1597.141357,1006.709777, 2218.679931,1597.743408,1006.184020,0.0,0.0,180.0	,	true},
	{2255.158203,1609.679687,1006.709777, 2255.210693,1609.077636,1006.184020,0.0,0.0,0.0	,	true},
	{2255.221191,1610.071044,1006.709777, 2255.273681,1610.673095,1006.184020,0.0,0.0,180.0	,	true},
	{2255.158203,1613.718750,1006.709777, 2255.210693,1613.116699,1006.184020,0.0,0.0,0.0	,	true},
	{2255.221191,1614.110107,1006.709777, 2255.273681,1614.712158,1006.184020,0.0,0.0,180.0	,	true},
	{2255.158203,1617.617187,1006.709777, 2255.210693,1617.015136,1006.184020,0.0,0.0,0.0	,	true},
	{2255.221191,1618.008544,1006.709777, 2255.273681,1618.610595,1006.184020,0.0,0.0,180.0	,	true},
	{2255.158203,1592.718750,1006.709777, 2255.210693,1592.116699,1006.184020,0.0,0.0,0.0	,	true},
	{2255.221191,1593.110107,1006.709777, 2255.273681,1593.712158,1006.184020,0.0,0.0,180.0	,	true},
	{2255.158203,1588.414062,1006.709777, 2255.210693,1587.812011,1006.184020,0.0,0.0,0.0	,	true},
	{2255.221191,1588.805419,1006.709777, 2255.273681,1589.407470,1006.184020,0.0,0.0,180.0	,	true},
	{2255.158203,1597.023437,1006.709777, 2255.210693,1596.421386,1006.184020,0.0,0.0,0.0	,	true},
	{2255.221191,1597.414794,1006.709777, 2255.273681,1598.016845,1006.184020,0.0,0.0,180.0 ,	true}
};
//========CASINO=======//
new bool:useavtomat[MAX_PLAYERS];
new numavtomat[MAX_PLAYERS];
new cp[MAX_AVTOMATS];

new Text:td1;
new Text:td2;
new Text:td3;
new Text:Balance[MAX_AVTOMATS];
new Text:Stavka[MAX_AVTOMATS];
new Text:Exit;
new Text:minus;
new Text:plus;
new Text:Start;
new Text:Add;
new Text:td11;
new Text:td12;
new Text:td13;
new Text:td14;
new Text:td15;

new Text:td[MAX_TEXTDRAWS];


new tsv1[64];
new pickup[2];
//========CASINO=======//

public OnGameModeInit()
{
	//====================Серверное====================//
	SetGameModeText("Test CASINO");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	//====================Подгрузка====================//
	pickup[0] = CreateDynamicPickup(1239, 2, 2225.1201,1599.5363,1006.1797, -1, 1, -1);
	pickup[1] = CreateDynamicPickup(1239, 2, 2246.5232,1599.1763,1006.1860, -1, 1, -1);
	SetTimer("OnAvtomatUpdate", 30000, 0);
	//====================Текстдравы====================//
	td1 = TextDrawCreate(234.3999, 112.7466, "Balance:");
	TextDrawLetterSize(td1, 0.4499, 1.6);
	TextDrawAlignment(td1, 1);
	TextDrawColor(td1, 0xFFFFFFFF);
	TextDrawSetShadow(td1, 0);
	TextDrawSetOutline(td1, 1);
	TextDrawBackgroundColor(td1, 0x00000033);
	TextDrawFont(td1, 1);
	TextDrawSetProportional(td1, true);
	td2 = TextDrawCreate(425.2, 148.5933, "usebox");
	TextDrawLetterSize(td2, 0.0, -4.6308);
	TextDrawTextSize(td2, 222.7999, 0.0);
	TextDrawAlignment(td2, 1);
	TextDrawColor(td2, 0x00000000);
	TextDrawUseBox(td2, true);
	TextDrawBoxColor(td2, 0x00000066);
	TextDrawSetShadow(td2, 0);
	TextDrawSetOutline(td2, 0);
	TextDrawFont(td2, 0);
	td3 = TextDrawCreate(234.4, 127.6799, "Stavka:");
	TextDrawLetterSize(td3, 0.4499, 1.6);
	TextDrawAlignment(td3, 1);
	TextDrawColor(td3, 0xFFFFFFFF);
	TextDrawSetShadow(td3, 0);
	TextDrawSetOutline(td3, 1);
	TextDrawBackgroundColor(td3, 0x00000033);
	TextDrawFont(td3, 1);
	TextDrawSetProportional(td3, true);
	td11 = TextDrawCreate(230.0, 344.22, "usebox");
	TextDrawLetterSize(td11, 0.0, 2.587);
	TextDrawTextSize(td11, 170.8, 0.0);
	TextDrawAlignment(td11, 1);
	TextDrawColor(td11, 0x00000000);
	TextDrawUseBox(td11, true);
	TextDrawBoxColor(td11, 0x00000066);
	TextDrawSetShadow(td11, 0);
	TextDrawSetOutline(td11, 0);
	TextDrawFont(td11, 0);
	td12 = TextDrawCreate(315.6, 344.9666, "usebox");
	TextDrawLetterSize(td12, 0.0, 2.504);
	TextDrawTextSize(td12, 239.6, 0.0);
	TextDrawAlignment(td12, 1);
	TextDrawColor(td12, 0x00000000);
	TextDrawUseBox(td12, true);
	TextDrawBoxColor(td12, 0x00000066);
	TextDrawSetShadow(td12, 0);
	TextDrawSetOutline(td12, 0);
	TextDrawFont(td12, 0);
	td13 = TextDrawCreate(362.0, 344.9666, "usebox");
	TextDrawLetterSize(td13, 0.0, 2.504);
	TextDrawTextSize(td13, 322.7999, 0.0);
	TextDrawAlignment(td13, 1);
	TextDrawColor(td13, 0x00000000);
	TextDrawUseBox(td13, true);
	TextDrawBoxColor(td13, 0x00000066);
	TextDrawSetShadow(td13, 0);
	TextDrawSetOutline(td13, 0);
	TextDrawFont(td13, 0);
	td14 = TextDrawCreate(402.0, 344.9666, "usebox");
	TextDrawLetterSize(td14, 0.0, 2.504);
	TextDrawTextSize(td14, 362.7999, 0.0);
	TextDrawAlignment(td14, 1);
	TextDrawColor(td14, 0x00000000);
	TextDrawUseBox(td14, true);
	TextDrawBoxColor(td14, 0x00000066);
	TextDrawSetShadow(td14, 0);
	TextDrawSetOutline(td14, 0);
	TextDrawFont(td14, 0);
	td15 = TextDrawCreate(484.4, 344.9666, "usebox");
	TextDrawLetterSize(td15, 0.0, 2.504);
	TextDrawTextSize(td15, 413.2, 0.0);
	TextDrawAlignment(td15, 1);
	TextDrawColor(td15, 0x00000000);
	TextDrawUseBox(td15, true);
	TextDrawBoxColor(td15, 0x00000066);
	TextDrawSetShadow(td15, 0);
	TextDrawSetOutline(td15, 0);
	TextDrawFont(td15, 0);
	Exit = TextDrawCreate(178.3998, 344.96, "Exit");
	TextDrawLetterSize(Exit, 0.6787, 2.5034);
	TextDrawTextSize(Exit, 222.4001, 24.64);
	TextDrawAlignment(Exit, 1);
	TextDrawColor(Exit, 0x6697ffE1);
	TextDrawSetShadow(Exit, 0);
	TextDrawSetOutline(Exit, 1);
	TextDrawBackgroundColor(Exit, 0x00000033);
	TextDrawFont(Exit, 1);
	TextDrawSetProportional(Exit, true);
	TextDrawSetSelectable(Exit, 1);
	minus = TextDrawCreate(337.5999, 344.2134, "-");
	TextDrawLetterSize(minus, 0.7315, 2.8095);
	TextDrawTextSize(minus, 353.6, 24.9599);
	TextDrawAlignment(minus, 1);
	TextDrawColor(minus, 0x6697ffE1);
	TextDrawSetShadow(minus, 0);
	TextDrawSetOutline(minus, 1);
	TextDrawBackgroundColor(minus, 0x00000033);
	TextDrawFont(minus, 1);
	TextDrawSetProportional(minus, true);
	TextDrawSetSelectable(minus, 1);
	plus = TextDrawCreate(375.1998, 343.2733, "+");
	TextDrawLetterSize(plus, 0.7932, 2.7573);
	TextDrawTextSize(plus, 389.6, 24.9333);
	TextDrawAlignment(plus, 1);
	TextDrawColor(plus, 0x6697ffE1);
	TextDrawSetShadow(plus, 0);
	TextDrawSetOutline(plus, 1);
	TextDrawBackgroundColor(plus, 0x00000033);
	TextDrawFont(plus, 1);
	TextDrawSetProportional(plus, true);
	TextDrawSetSelectable(plus, 1);
	Start = TextDrawCreate(422.3999, 343.4667, "Start");
	TextDrawLetterSize(Start, 0.646, 2.6005);
	TextDrawTextSize(Start, 480.1999, 24.1599);
	TextDrawAlignment(Start, 1);
	TextDrawColor(Start, 0x6697ffE1);
	TextDrawSetShadow(Start, 0);
	TextDrawSetOutline(Start, 1);
	TextDrawBackgroundColor(Start, 0x00000033);
	TextDrawFont(Start, 1);
	TextDrawSetProportional(Start, true);
	TextDrawSetSelectable(Start, 1);
	Add = TextDrawCreate(248.0, 344.9601, "Add$");
	TextDrawLetterSize(Add, 0.6299, 2.5258);
	TextDrawTextSize(Add, 300.1997, 24.1066);
	TextDrawAlignment(Add, 1);
	TextDrawColor(Add, 0x6697ffE1);
	TextDrawBoxColor(Add, 0x000000FF);
	TextDrawSetShadow(Add, 0);
	TextDrawSetOutline(Add, 1);
	TextDrawBackgroundColor(Add, 0x00000033);
	TextDrawFont(Add, 1);
	TextDrawSetProportional(Add, true);
	TextDrawSetSelectable(Add, 1);
	LAvtomat();
	//****************************
	//td[1] = TextDrawCreate( 453.0, 288.0, "usebox");
	td[1] = TextDrawCreate( 438.0, 318.0, "usebox"); // 1 - ширина 2 - позиция y
	TextDrawLetterSize(td[1], 0.000000, 2.0);
	TextDrawTextSize(td[1], 184.0, 0.000000);// 1 - позиция x 2 - высота
	TextDrawAlignment(td[1], 1);
	TextDrawColor(td[1], 0);
	TextDrawUseBox(td[1], true);
	TextDrawBoxColor(td[1], 0x81818199);
	TextDrawSetShadow(td[1], 0);
	TextDrawSetOutline(td[1], 0);
	TextDrawFont(td[1], 0);

	td[2] = TextDrawCreate( 338.0, 348.0, "usebox");
	TextDrawLetterSize(td[2], 0.000000, 2.0);
	TextDrawTextSize(td[2], 184.0, 0.000000);
	TextDrawAlignment(td[2], 1);
	TextDrawColor(td[2], 0);
	TextDrawUseBox(td[2], true);
	TextDrawBoxColor(td[2], 0x81818199);
	TextDrawSetShadow(td[2], 0);
	TextDrawSetOutline(td[2], 0);
	TextDrawFont(td[2], 0);

	td[3] = TextDrawCreate( 338.0, 378.0, "usebox");
	TextDrawLetterSize(td[3], 0.000000, 2.0);
	TextDrawTextSize(td[3], 184.0, 0.000000);
	TextDrawAlignment(td[3], 1);
	TextDrawColor(td[3], 0);
	TextDrawUseBox(td[3], true);
	TextDrawBoxColor(td[3], 0x81818199);
	TextDrawSetShadow(td[3], 0);
	TextDrawSetOutline(td[3], 0);
	TextDrawFont(td[3], 0);

	td[4] = TextDrawCreate( 338.0, 408.0, "usebox");
	TextDrawLetterSize(td[4], 0.000000, 2.0);
	TextDrawTextSize(td[4], 184.0, 0.000000);
	TextDrawAlignment(td[4], 1);
	TextDrawColor(td[4], 0);
	TextDrawUseBox(td[4], true);
	TextDrawBoxColor(td[4], 0x81818199);
	TextDrawSetShadow(td[4], 0);
	TextDrawSetOutline(td[4], 0);
	TextDrawFont(td[4], 0);

	td[5] = TextDrawCreate( 192.000000, 317.5, "Group 1:");
	TextDrawLetterSize(td[5], 0.5, 2.0);//1.65);
	TextDrawAlignment(td[5], 1);
	TextDrawColor(td[5], -6881055);
	TextDrawSetShadow(td[5], 0);
	TextDrawSetOutline(td[5], 1);
	TextDrawBackgroundColor(td[5], 51);
	TextDrawFont(td[5], 1);
	TextDrawSetProportional(td[5], 1);

	td[6] = TextDrawCreate( 192.000030, 347.5, "Group 2:");
	TextDrawLetterSize(td[6], 0.5, 2.0);
	TextDrawAlignment(td[6], 1);
	TextDrawColor(td[6], -6881055);
	TextDrawSetShadow(td[6], 0);
	TextDrawSetOutline(td[6], 1);
	TextDrawBackgroundColor(td[6], 51);
	TextDrawFont(td[6], 1);
	TextDrawSetProportional(td[6], 1);
	
	td[7] = TextDrawCreate( 192.000030, 377.5, "Group 3:");
	TextDrawLetterSize(td[7], 0.5, 2.0);
	TextDrawAlignment(td[7], 1);
	TextDrawColor(td[7], -6881055);
	TextDrawSetShadow(td[7], 0);
	TextDrawSetOutline(td[7], 1);
	TextDrawBackgroundColor(td[7], 51);
	TextDrawFont(td[7], 1);
	TextDrawSetProportional(td[7], 1);

	td[8] = TextDrawCreate( 192.000030, 407.5, "Group 4:");
	TextDrawLetterSize(td[8], 0.5, 2.0);
	TextDrawAlignment(td[8], 1);
	TextDrawColor(td[8], -6881055);
	TextDrawSetShadow(td[8], 0);
	TextDrawSetOutline(td[8], 1);
	TextDrawBackgroundColor(td[8], 51);
	TextDrawFont(td[8], 1);
	TextDrawSetProportional(td[8], 1);
	
	td[0] = TextDrawCreate(290.0, 315.0, "LD_SLOT:cherry");
	TextDrawLetterSize(td[0], 0.000000, 0.000000);
	TextDrawTextSize(td[0], 36.000007, 32.336631);
	TextDrawAlignment(td[0], 1);
	TextDrawColor(td[0], -1);
	TextDrawSetShadow(td[0], 0);
	TextDrawSetOutline(td[0], 0);
	TextDrawFont(td[0], 4);
	
	td[9] = TextDrawCreate(335.0, 315.0, "LD_SLOT:bell");
	TextDrawLetterSize(td[9], 0.000000, 0.000000);
	TextDrawTextSize(td[9], 36.000007, 32.336631);
	TextDrawAlignment(td[9], 1);
	TextDrawColor(td[9], -1);
	TextDrawSetShadow(td[9], 0);
	TextDrawSetOutline(td[9], 0);
	TextDrawFont(td[9], 4);

	td[10] = TextDrawCreate(380.0, 315.0, "LD_SLOT:grapes");
	TextDrawLetterSize(td[10], 0.000000, 0.000000);
	TextDrawTextSize(td[10], 36.000007, 32.336631);
	TextDrawAlignment(td[10], 1);
	TextDrawColor(td[10], -1);
	TextDrawSetShadow(td[10], 0);
	TextDrawSetOutline(td[10], 0);
	TextDrawFont(td[10], 4);
	
	td[11] = TextDrawCreate(290.0, 345.0, "LD_SLOT:r_69");
	TextDrawLetterSize(td[11], 0.000000, 0.000000);
	TextDrawTextSize(td[11], 36.000007, 32.336631);
	TextDrawAlignment(td[11], 1);
	TextDrawColor(td[11], -1);
	TextDrawSetShadow(td[11], 0);
	TextDrawSetOutline(td[11], 0);
	TextDrawFont(td[11], 4);
	
	td[12] = TextDrawCreate(290.0, 375.0, "LD_SLOT:bar1_o");
	TextDrawLetterSize(td[12], 0.000000, 0.000000);
	TextDrawTextSize(td[12], 36.000007, 32.336631);
	TextDrawAlignment(td[12], 1);
	TextDrawColor(td[12], -1);
	TextDrawSetShadow(td[12], 0);
	TextDrawSetOutline(td[12], 0);
	TextDrawFont(td[12], 4);
	
	td[13] = TextDrawCreate(290.0, 405.0, "LD_SLOT:bar2_o");
	TextDrawLetterSize(td[13], 0.000000, 0.000000);
	TextDrawTextSize(td[13], 36.000007, 32.336631);
	TextDrawAlignment(td[13], 1);
	TextDrawColor(td[13], -1);
	TextDrawSetShadow(td[13], 0);
	TextDrawSetOutline(td[13], 0);
	TextDrawFont(td[13], 4);
	//====================Текстдравы====================//
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	numavtomat[playerid] = -1;
	//***************************
	ApplyAnimation(playerid, "CASINO", "null", 0.0, 0, 0, 0, 0, 0);
	RemoveBuildingForPlayer(playerid, 1837, 2216.5703, 1588.0938, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2216.5781, 1588.5703, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2216.5703, 1592.3984, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2216.5781, 1592.8750, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1833, 2217.0156, 1602.8125, 1005.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1833, 2217.5469, 1602.7969, 1005.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2217.0234, 1603.9297, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1835, 2217.0156, 1605.0469, 1005.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 2592, 2217.0313, 1603.9219, 1006.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2217.5469, 1603.8984, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 2592, 2217.5469, 1603.9141, 1006.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1834, 2217.5469, 1605.0391, 1005.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2216.5703, 1614.2422, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2216.5781, 1614.7188, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2216.5703, 1618.5781, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2216.5781, 1619.0547, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2220.7188, 1588.0938, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2218.6328, 1588.0781, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2218.6641, 1588.6016, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2220.6953, 1588.5703, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2218.6328, 1592.3828, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2218.6641, 1592.9063, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2220.7188, 1592.3984, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2220.6953, 1592.8750, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1833, 2220.6719, 1602.8125, 1005.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1833, 2221.2031, 1602.7969, 1005.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2220.6797, 1603.9297, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2221.2031, 1603.8984, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 2592, 2220.6875, 1603.9219, 1006.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 2592, 2221.2031, 1603.9141, 1006.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1834, 2221.2031, 1605.0391, 1005.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1835, 2220.6719, 1605.0469, 1005.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2218.6328, 1614.2266, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2220.7188, 1614.2422, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2218.6641, 1614.7500, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2220.6953, 1614.7188, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2220.7188, 1618.5781, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2218.6328, 1618.5625, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2218.6641, 1619.0859, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2220.6953, 1619.0547, 1006.0000, 0.25);
	//**********************
	RemoveBuildingForPlayer(playerid, 2786, 2258.2578, 1589.7969, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2786, 2253.2344, 1589.7969, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2786, 2258.2578, 1596.4766, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2786, 2253.2344, 1596.4844, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2786, 2254.1797, 1596.4844, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2786, 2259.2188, 1596.4844, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2786, 2259.1875, 1589.7969, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2786, 2254.1563, 1589.7969, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2785, 2258.2578, 1589.7969, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2785, 2253.2344, 1589.7969, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2785, 2259.1875, 1589.7969, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2785, 2254.1563, 1589.7969, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2785, 2258.2578, 1596.4766, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2785, 2253.2344, 1596.4844, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2785, 2254.1797, 1596.4844, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 2785, 2259.2188, 1596.4844, 1006.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2253.1250, 1609.6406, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2255.1563, 1609.6016, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2257.2422, 1609.6406, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2784, 2255.2109, 1609.8750, 1006.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2253.1016, 1610.1172, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2257.2500, 1610.1172, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2255.1875, 1610.1250, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2253.1016, 1614.1641, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2253.1250, 1613.6875, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2255.1563, 1613.6484, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2257.2500, 1614.1641, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2257.2422, 1613.6875, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2255.1875, 1614.1719, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 2784, 2255.2109, 1613.9141, 1006.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2253.1250, 1617.5781, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1836, 2257.2422, 1617.5781, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2255.1563, 1617.5469, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 2784, 2255.2109, 1617.8125, 1006.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2253.1016, 1618.0547, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1837, 2257.2500, 1618.0547, 1006.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 2325, 2255.1875, 1618.0703, 1006.7656, 0.25);
	RemoveBuildingForPlayer(playerid, 2784, 2255.2109, 1609.8750, 1006.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 2784, 2255.2109, 1613.9141, 1006.4922, 0.25);
	RemoveBuildingForPlayer(playerid, 2784, 2255.2109, 1617.8125, 1006.4922, 0.25);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    numavtomat[playerid] = -1;
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerPos(playerid, 2193.2497, 1676.8273, 12.3671);
	return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	if(pickupid == pickup[0] || pickupid == pickup[1])
	{
		for(new i; i < MAX_TEXTDRAWS; i++)
		{
			TextDrawShowForPlayer(playerid, td[i]);
		}
		new stravtomat[600];
		strcat(stravtomat, "{FFFFFF}Инструкция:\n- Подойдите к любому свободному автомату(отмечаются желтым цветом).\n");
		strcat(stravtomat, "- Нажмите кнопку Add $ чтобы внести деньги на баланс автомата.\n- Используйте кнопки +/- для изменения ставки с шагом в 2000$.\n");
		strcat(stravtomat, "- После выставления нужной ставки нажмите START для запуска игры.\n- Нажмите Exit или Esc на клавиатуре для выхода. Вам будет возвращен итоговый баланс.\n\n");
		strcat(stravtomat, "Основная цель игры на слот-машине - это выпадение трех одинаковых рисунков.\nВ зависимости от типа рисунка, определяется размер выигрыша:\n1 группа: 4х\n");
		strcat(stravtomat, "2 группа: 9x\n3 группа: 30x\n4 группа: 200x\n(группы рисунков показаны внизу)");
	    ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "{FFCD00}Игровые слот-машины", stravtomat, "Закрыть", "");
	}
	return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
 	if(dialogid == 1)
	{
		for(new i; i < MAX_TEXTDRAWS; i++)
		{
			TextDrawHideForPlayer(playerid, td[i]);
		}
		return 1;
	}
	if(dialogid == 1069)
	{
	    if(response)
	    {
	        if(!strlen(inputtext)) return ShowPlayerDialog(playerid, 1099, 1, "Пополнение баланса", "Введите сумму которую хотите занести на баланс:", "Пополнить", "Отмена");
            for(new i = strlen(inputtext); i != 0; --i)
            {
                switch(inputtext[i])
                {
                   case 'A'..'Z', 'a'..'z','А'..'Я','а'..'я',' ': return ShowPlayerDialog(playerid, 1099, 1, "Пополнение баланса", "Введите сумму которую хотите занести на баланс:", "Пополнить", "Отмена");
				}
			}
			/*if(strval(inputtext) > PlayerInfo[playerid][pCash]) return ShowPlayerDialog(playerid, 1099, 1, "Пополнение баланса", "Введите сумму которую хотите занести на баланс:", "Пополнить", "Отмена");
			PlayerInfo[playerid][pCash] -= strval(inputttext);*/
			AvtomatInfo[numavtomat[playerid]][balance] += strval(inputtext);
			format(tsv1, 64, " %i$", AvtomatInfo[numavtomat[playerid]][balance]);
			TextDrawSetString(Balance[numavtomat[playerid]], tsv1);
			format(tsv1, 64, "~r~-%i$", strval(inputtext));
			GameTextForPlayer(playerid, tsv1, 2000, 1);
		}
		return 1;
	}
	return 1;
}

stock LAvtomat()
{
	new i;
	while(i < MAX_AVTOMATS)
	{
	    AvtomatInfo[i][xobj] = AC[i][nx];
	    AvtomatInfo[i][yobj] = AC[i][ny];
      	AvtomatInfo[i][zobj] = AC[i][nz];
      	AvtomatInfo[i][mx] = AC[i][nmx];
	    AvtomatInfo[i][my] = AC[i][nmy];
      	AvtomatInfo[i][mz] = AC[i][nmz];
      	AvtomatInfo[i][rxobj] = AC[i][nrx];
	    AvtomatInfo[i][ryobj] = AC[i][nry];
      	AvtomatInfo[i][rzobj] = AC[i][nrz];
      	AvtomatInfo[i][x1] = -1;
      	AvtomatInfo[i][x2] = -1;
      	AvtomatInfo[i][x3] = -1;
      	AvtomatInfo[i][player] = -1;
	    if(AC[i][framework] == true
		&& i == 0 || i == 2 || i == 4 || i == 6
		|| i == 8 || i == 10 || i == 12 || i == 14
		|| i == 16 || i == 18 || i == 20 || i == 22)
		{
			new Float:tmp[3];//Float:tmpobj[3];
			tmp[0] = AvtomatInfo[i][xobj] + 0.052747;
			tmp[1] = AvtomatInfo[i][yobj] + 0.195338;
			tmp[2] = AvtomatInfo[i][zobj] - 0.217577;
			CreateDynamicObject(2784, tmp[0], tmp[1], tmp[2], 356.85840, 0.00000, 0.00000, -1, 1, -1);
		}
   		AvtomatInfo[i][gobj] = CreateDynamicObject(1948,AvtomatInfo[i][xobj],AvtomatInfo[i][yobj],AvtomatInfo[i][zobj],AvtomatInfo[i][rxobj],AvtomatInfo[i][ryobj],AvtomatInfo[i][rzobj], -1, 1, -1);
		new Float: xcor, Float: ycor, Float: zcor;
		xcor = AvtomatInfo[i][xobj] + 0.0380859375;
		ycor = AvtomatInfo[i][yobj] - 0.6842041016;
		zcor = AvtomatInfo[i][zobj] + 0.259809494018;
		if(AvtomatInfo[i][rzobj] == 0.0)
		{
		 	AvtomatInfo[i][x1obj] = CreateDynamicObject(2348,xcor-0.109375,ycor+0.6929931641-0.01,zcor-0.276809692382+0.001,0.0,0.0,0.0, -1, 1, -1);
			AvtomatInfo[i][x2obj] = CreateDynamicObject(2348,xcor-0.0029296875,ycor+0.6929931641-0.01,zcor-0.276809692382+0.001,0.0,0.0,0.0, -1, 1, -1);
			AvtomatInfo[i][x3obj] = CreateDynamicObject(2348,xcor+0.09765625,ycor+0.6929931641-0.01,zcor-0.276809692382+0.001,0.0,0.0,0.0, -1, 1, -1);
		}
		else
		{
			AvtomatInfo[i][x1obj] = CreateDynamicObject(2348,xcor-0.173375,ycor+0.6829931641,zcor-0.276809692382+0.005,0.0,0.0,180.0, -1, 1, -1);
			AvtomatInfo[i][x2obj] = CreateDynamicObject(2348,xcor-0.0669296875,ycor+0.6829931641,zcor-0.276809692382+0.005,0.0,0.0,180.0, -1, 1, -1);
			AvtomatInfo[i][x3obj] = CreateDynamicObject(2348,xcor+0.03465625,ycor+0.6829931641,zcor-0.276809692382+0.005,0.0,0.0,180.0, -1, 1, -1);
		}
		cp[i] = CreateDynamicCP(AvtomatInfo[i][mx], AvtomatInfo[i][my], AvtomatInfo[i][mz], 0.5, 0, -1, -1, 0.3);
        Balance[i] = TextDrawCreate(296.8, 112.7466, " 0 $");
		TextDrawLetterSize(Balance[i], 0.4499, 1.6);
		TextDrawAlignment(Balance[i], 1);
		TextDrawColor(Balance[i], 0x008000FF);
		TextDrawSetShadow(Balance[i], 0);
		TextDrawSetOutline(Balance[i], 1);
		TextDrawBackgroundColor(Balance[i], 0x00000033);
		TextDrawFont(Balance[i], 1);
		TextDrawSetProportional(Balance[i], true);
		Stavka[i] = TextDrawCreate(296.7998, 127.6799, " 2000 $");
		TextDrawLetterSize(Stavka[i], 0.4499, 1.6);
		TextDrawAlignment(Stavka[i], 1);
		TextDrawColor(Stavka[i], 0x800080FF);
		TextDrawSetShadow(Stavka[i], 0);
		TextDrawSetOutline(Stavka[i], 1);
		TextDrawBackgroundColor(Stavka[i], 0x00000033);
		TextDrawFont(Stavka[i], 1);
		TextDrawSetProportional(Stavka[i], true);
		i++;
	}
}
public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(numavtomat[playerid] != -1) return 1;
	new i;
    while(i < MAX_AVTOMATS)
    {
        if(checkpointid == cp[i])
        {
            if(AvtomatInfo[i][use] == true) return SendClientMessage(playerid, -1, "Автомат используется");
			TogglePlayerControllable(playerid, false);
			TogglePlayerDynamicCP(playerid, checkpointid, false);
			numavtomat[playerid] = i;
			TextDrawShowForPlayer(playerid, td1);
			TextDrawShowForPlayer(playerid, td2);
			TextDrawShowForPlayer(playerid, td3);
			TextDrawShowForPlayer(playerid, Balance[numavtomat[playerid]]);
			TextDrawShowForPlayer(playerid, Stavka[numavtomat[playerid]]);
			TextDrawShowForPlayer(playerid, Exit);
			TextDrawShowForPlayer(playerid, minus);
			TextDrawShowForPlayer(playerid, plus);
			TextDrawShowForPlayer(playerid, Start);
			TextDrawShowForPlayer(playerid, Add);
			TextDrawShowForPlayer(playerid, td11);
			TextDrawShowForPlayer(playerid, td12);
			TextDrawShowForPlayer(playerid, td13);
			TextDrawShowForPlayer(playerid, td14);
			TextDrawShowForPlayer(playerid, td15);
			SelectTextDraw(playerid, 0xFD5300E1);
			AvtomatInfo[i][use] = true;
	        useavtomat[playerid] = true;
	        AvtomatInfo[i][balance] = 0;
	   		AvtomatInfo[i][stavka] = 2000;
	   		AvtomatInfo[i][player] = playerid;
            SetDynamicObjectMaterial(AvtomatInfo[i][gobj], 0, 1948, "mattextures", "lime", 0);
            new Float:x, Float:y, Float:z;
			new Float:gx, Float:gy, Float:gz;
			GetPlayerCameraPos(playerid, x, y, z);
			new Float:ppp[3];
			GetPlayerPos(playerid, ppp[0], ppp[1], ppp[2]);
			if(i == 1 || i == 3 || i == 5 || i == 7 || i == 9 || i == 11 || i == 13 || i == 15
			|| i == 17 || i == 19 || i == 21 || i == 23)
			{
				SetPlayerFacingAngle(playerid, 180.0);
				InterpolateCameraPos(playerid, x, y, z, AvtomatInfo[i][xobj] - 0.0299, 0.875 + AvtomatInfo[i][yobj], 0.1 + AvtomatInfo[i][zobj], 2000, 1);
			    SetPlayerPos(playerid, ppp[0], ppp[1]+0.1, ppp[2]);
			}
			else
			{
				SetPlayerFacingAngle(playerid, 0.0);
				InterpolateCameraPos(playerid, x, y, z, 0.0299 + AvtomatInfo[i][xobj], AvtomatInfo[i][yobj] - 0.875, 0.1 + AvtomatInfo[i][zobj], 2000, 1);
    			SetPlayerPos(playerid, ppp[0], ppp[1]-0.1, ppp[2]);
			}
			GetPlayerCameraFrontVector(playerid, x, y, z);
			//GetDynamicObjectPos(AvtomatInfo[i][x], gx, gy, gz);
			GetPlayerPos(playerid, gx, gy, gz);
			if(i == 1 || i == 3 || i == 5 || i == 7 || i == 9 || i == 11 || i == 13 || i == 15
			|| i == 17 || i == 19 || i == 21 || i == 23)
			{
				InterpolateCameraLookAt(playerid, gx, gy, 0.6 + gz, AvtomatInfo[i][xobj] - 0.0099, AvtomatInfo[i][yobj] - 1.5, AvtomatInfo[i][zobj] - 0.1, 2000, 1);
			}
			else
			{
				InterpolateCameraLookAt(playerid, gx, gy, 0.6 + gz, 0.0099 + AvtomatInfo[i][xobj], 1.5 + AvtomatInfo[i][yobj], AvtomatInfo[i][zobj] - 0.1, 2000, 1);
			}
			break;
        }
        i++;
    }
	return 1;
}

public OnDynamicObjectMoved(objectid)
{
	new
	    Float:x,
	    Float:y,
	    Float:z,
	    Float:rx,
	    Float:ry,
	    Float:rz
		;
	for(new i; i < MAX_AVTOMATS; i++)
	{
		if(objectid == AvtomatInfo[i][x1obj])
		{
		    if(AvtomatInfo[i][player] == -1) return 1;
			GetDynamicObjectPos(AvtomatInfo[i][x2obj], x, y, z);
			SetDynamicObjectPos(AvtomatInfo[i][x2obj], x, y, z+SET);
			GetDynamicObjectRot(AvtomatInfo[i][x2obj], rx, ry, rz);
			PlayerPlaySound(AvtomatInfo[i][player], SLOT_SOUND, x, y, z);
			if(AvtomatInfo[i][skipx2] == false)
				MoveDynamicObject(AvtomatInfo[i][x2obj], x, y, z, MOVE, AvtomatInfo[i][x2] * 20, ry, rz);
			else
			    AvtomatInfo[i][timer2] = SetTimerEx("After", 450, 0, "ii", AvtomatInfo[i][player], 2),
				AvtomatInfo[i][skipx2] = false;
		    break;
		}
		if(objectid == AvtomatInfo[i][x2obj])
		{
		    if(AvtomatInfo[i][player] == -1) return 1;
 	  		GetDynamicObjectPos(AvtomatInfo[i][x3obj], x, y, z);
			SetDynamicObjectPos(AvtomatInfo[i][x3obj], x, y, z+SET);
			GetDynamicObjectRot(AvtomatInfo[i][x3obj], rx, ry, rz);
			PlayerPlaySound(AvtomatInfo[i][player], SLOT_SOUND, x, y, z);
			if(AvtomatInfo[i][skipx3] == false)
				MoveDynamicObject(AvtomatInfo[i][x3obj], x, y, z, MOVE, AvtomatInfo[i][x3] * 20, ry, rz);
			else
			    AvtomatInfo[i][timer3] = SetTimerEx("After", 450, 0, "ii", AvtomatInfo[i][player], 3),
				AvtomatInfo[i][skipx3] = false;
            break;
		}
		if(objectid == AvtomatInfo[i][x3obj])
		{
		    if(AvtomatInfo[i][player] == -1) return 1;
			switch(AvtomatInfo[i][x1])
		    {
		        case 0: AvtomatInfo[i][x1group] = 0;
		        case 1, 5, 8: AvtomatInfo[i][x1group] = 1;
		        case 2, 7: AvtomatInfo[i][x1group] = 2;
		        case 3,6: AvtomatInfo[i][x1group] = 3;
		        case 4: AvtomatInfo[i][x1group] = 4;
		        case 9: AvtomatInfo[i][x1group] = 5;
			}
			switch(AvtomatInfo[i][x2])
		    {
		        case 0: AvtomatInfo[i][x1group] = 0;
		        case 1, 5, 8: AvtomatInfo[i][x1group] = 1;
		        case 2, 7: AvtomatInfo[i][x1group] = 2;
		        case 3,6: AvtomatInfo[i][x1group] = 3;
		        case 4: AvtomatInfo[i][x1group] = 4;
		        case 9: AvtomatInfo[i][x1group] = 5;
			}
			switch(AvtomatInfo[i][x3])
		    {
		        case 0: AvtomatInfo[i][x1group] = 0;
		        case 1, 5, 8: AvtomatInfo[i][x1group] = 1;
		        case 2, 7: AvtomatInfo[i][x1group] = 2;
		        case 3,6: AvtomatInfo[i][x1group] = 3;
		        case 4: AvtomatInfo[i][x1group] = 4;
		        case 9: AvtomatInfo[i][x1group] = 5;
			}
			if(AvtomatInfo[i][x1group] == AvtomatInfo[i][x2group]  && AvtomatInfo[i][x2group] == AvtomatInfo[i][x3group])
			{
			    switch(AvtomatInfo[i][x1])
			    {
		        	case 0: AvtomatInfo[i][xwin] = 9;
			        case 1, 5, 8, 2, 6, 3: AvtomatInfo[i][xwin] = 4;
			        case 4: AvtomatInfo[i][xwin] = 200;
			        case 9: AvtomatInfo[i][xwin] = 30;
				}
				AvtomatInfo[i][balance] += AvtomatInfo[i][stavka] * AvtomatInfo[i][xwin];
				format(tsv1, 64, "~y~YOU WIN!~n~~g~+%i$", AvtomatInfo[i][stavka] * AvtomatInfo[i][xwin]);
				GameTextForPlayer(AvtomatInfo[i][player], tsv1, 2000, 5);
				PlayerPlaySound(AvtomatInfo[i][player], JACKPOT_SOUND, x, y, z);
   				format(tsv1, 64, "{C2A2DA}Поздравляем! Вы выиграли {9EC73D}%i$!", AvtomatInfo[i][stavka] * AvtomatInfo[i][xwin]);
			    SendClientMessage(AvtomatInfo[i][player], -1, tsv1);
			    ApplyAnimation(AvtomatInfo[i][player], "CASINO", "Slot_win_out", 9.33, 0, 1, 1, 0, 0);
				//PlayerInfo[AvtomatInfo[i][player]][pCash] += AvtomatInfo[i][stavka] * AvtomatInfo[i][xwin];
			}
			else
			{
			    AvtomatInfo[i][balance] -= AvtomatInfo[i][stavka];
			}
			format(tsv1, 64, " %i $", AvtomatInfo[i][balance]);
			TextDrawSetString(Balance[i], tsv1);
			format(tsv1, 64, " %i $", AvtomatInfo[i][stavka]);
			TextDrawSetString(Stavka[i], tsv1);
			AvtomatInfo[i][playing] = false;
            break;
		}
	}
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == Exit)
	{
 		if(numavtomat[playerid] == -1) return 1;
		KillTimer(timer0);
		KillTimer(timer1);
		KillTimer(timer2);
		KillTimer(timer3);
		AvtomatInfo[numavtomat[playerid]][playing] = false;
		TogglePlayerDynamicCP(playerid, cp[numavtomat[playerid]], true);
        AvtomatInfo[numavtomat[playerid]][use] = false;
        useavtomat[playerid] = false;
        AvtomatInfo[numavtomat[playerid]][balance] = 0;
   		AvtomatInfo[numavtomat[playerid]][stavka] = 2000;
		SetCameraBehindPlayer(playerid);
		CancelSelectTextDraw(playerid);
		format(tsv1, 64, " 0 $");
		TextDrawSetString(Balance[numavtomat[playerid]], tsv1);
		format(tsv1, 64, " 2000 $");
		TextDrawSetString(Stavka[numavtomat[playerid]], tsv1);
		TextDrawHideForPlayer(playerid, td1);
		TextDrawHideForPlayer(playerid, td2);
		TextDrawHideForPlayer(playerid, td3);
		TextDrawHideForPlayer(playerid, Balance[numavtomat[playerid]]);
		TextDrawHideForPlayer(playerid, Stavka[numavtomat[playerid]]);
		TextDrawHideForPlayer(playerid, Exit);
		TextDrawHideForPlayer(playerid, minus);
		TextDrawHideForPlayer(playerid, plus);
		TextDrawHideForPlayer(playerid, Start);
		TextDrawHideForPlayer(playerid, Add);
		TextDrawHideForPlayer(playerid, td11);
		TextDrawHideForPlayer(playerid, td12);
		TextDrawHideForPlayer(playerid, td13);
		TextDrawHideForPlayer(playerid, td14);
		TextDrawHideForPlayer(playerid, td15);
		SetDynamicObjectMaterial(AvtomatInfo[numavtomat[playerid]][gobj], 0, 1948, "kbslotnu", "wheel_o_tbl1a", 0);
		numavtomat[playerid] = -1;
  		TogglePlayerControllable(playerid, true);
  		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid,x, y, z);
		SetPlayerPos(playerid,x-0.5, y, z);
		return 1;
	}
	if(clickedid == minus)
	{
 		if(numavtomat[playerid] == -1) return 1;
 		if(AvtomatInfo[numavtomat[playerid]][stavka] == 2000) return SendClientMessage(playerid, -1, "2000$ минимальная ставка !");
		AvtomatInfo[numavtomat[playerid]][stavka] -= 2000;
		format(tsv1, 64, " %i $", AvtomatInfo[numavtomat[playerid]][stavka]);
		TextDrawSetString(Stavka[numavtomat[playerid]], tsv1);
		return 1;
	}
	if(clickedid == plus)
	{
		if(numavtomat[playerid] == -1) return 1;
		if(AvtomatInfo[numavtomat[playerid]][stavka] == 100000) return 1;
		AvtomatInfo[numavtomat[playerid]][stavka] += 2000;
		format(tsv1, 64, " %i $", AvtomatInfo[numavtomat[playerid]][stavka]);
		TextDrawSetString(Stavka[numavtomat[playerid]], tsv1);
		return 1;
	}
	if(clickedid == Start)
	{
	    if(numavtomat[playerid] == -1) return 1;
	    if(AvtomatInfo[numavtomat[playerid]][balance] < AvtomatInfo[numavtomat[playerid]][stavka]) return SendClientMessage(playerid, -1, "Недостаточно средств на балансе");
		if(IsDynamicObjectMoving(AvtomatInfo[numavtomat[playerid]][x1obj])) return 1;
		if(IsDynamicObjectMoving(AvtomatInfo[numavtomat[playerid]][x2obj])) return 1;
		if(IsDynamicObjectMoving(AvtomatInfo[numavtomat[playerid]][x3obj])) return 1;
		if(AvtomatInfo[numavtomat[playerid]][playing] == true) return 1;
		new tmpx[3];
		tmpx[0] = random(10);
		tmpx[1] = random(10);
		tmpx[2] = random(10);
		if(tmpx[0] == AvtomatInfo[numavtomat[playerid]][x1]) AvtomatInfo[numavtomat[playerid]][skipx1] = true;
		else
		{
		    AvtomatInfo[numavtomat[playerid]][skipx1] = false;
		    AvtomatInfo[numavtomat[playerid]][x1] = tmpx[0];
		}
		if(tmpx[1] == AvtomatInfo[numavtomat[playerid]][x2]) AvtomatInfo[numavtomat[playerid]][skipx2] = true;
		else
		{
            AvtomatInfo[numavtomat[playerid]][skipx2] = false;
		    AvtomatInfo[numavtomat[playerid]][x2] = tmpx[1];
		}
		if(tmpx[2] == AvtomatInfo[numavtomat[playerid]][x3]) AvtomatInfo[numavtomat[playerid]][skipx3] = true;
		else
		{
            AvtomatInfo[numavtomat[playerid]][skipx3] = false;
		    AvtomatInfo[numavtomat[playerid]][x3] = tmpx[2];
		}
		AvtomatInfo[numavtomat[playerid]][playing] = true;
		GameTextForPlayer(playerid, "~b~START...", 750, 5);
		if(AvtomatInfo[numavtomat[playerid]][skipx1] == false) SetTimerEx("After", 750, 0, "ii", playerid, 0);
		else AvtomatInfo[numavtomat[playerid]][timer1] = SetTimerEx("After", 1200, 0, "ii", playerid, 1),
			AvtomatInfo[numavtomat[playerid]][skipx1] = false;
		return 1;
	}
	if(clickedid == Add)
	{
 		if(numavtomat[playerid] == -1) return 1;
 		ShowPlayerDialog(playerid, 1069, 1, "Пополнение баланса", "Введите сумму которую хотите занести на баланс:", "Пополнить", "Отмена");
		return 1;
	}
	if(clickedid == Text:INVALID_TEXT_DRAW)
	{
		if(numavtomat[playerid] == -1) return 1;
		KillTimer(timer0);
		KillTimer(timer1);
		KillTimer(timer2);
		KillTimer(timer3);
		AvtomatInfo[numavtomat[playerid]][playing] = false;
		TogglePlayerDynamicCP(playerid, cp[numavtomat[playerid]], true);
        AvtomatInfo[numavtomat[playerid]][use] = false;
        useavtomat[playerid] = false;
        AvtomatInfo[numavtomat[playerid]][balance] = 0;
   		AvtomatInfo[numavtomat[playerid]][stavka] = 2000;
		SetCameraBehindPlayer(playerid);
		CancelSelectTextDraw(playerid);
		format(tsv1, 64, " 0 $");
		TextDrawSetString(Balance[numavtomat[playerid]], tsv1);
		format(tsv1, 64, " 2000 $");
		TextDrawSetString(Stavka[numavtomat[playerid]], tsv1);
		TextDrawHideForPlayer(playerid, td1);
		TextDrawHideForPlayer(playerid, td2);
		TextDrawHideForPlayer(playerid, td3);
		TextDrawHideForPlayer(playerid, Balance[numavtomat[playerid]]);
		TextDrawHideForPlayer(playerid, Stavka[numavtomat[playerid]]);
		TextDrawHideForPlayer(playerid, Exit);
		TextDrawHideForPlayer(playerid, minus);
		TextDrawHideForPlayer(playerid, plus);
		TextDrawHideForPlayer(playerid, Start);
		TextDrawHideForPlayer(playerid, Add);
		TextDrawHideForPlayer(playerid, td11);
		TextDrawHideForPlayer(playerid, td12);
		TextDrawHideForPlayer(playerid, td13);
		TextDrawHideForPlayer(playerid, td14);
		TextDrawHideForPlayer(playerid, td15);
		SetDynamicObjectMaterial(AvtomatInfo[numavtomat[playerid]][gobj], 0, 1948, "kbslotnu", "wheel_o_tbl1a", 0);
		numavtomat[playerid] = -1;
  		TogglePlayerControllable(playerid, true);
  		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid,x, y, z);
		SetPlayerPos(playerid,x-0.5, y, z);
	}
	return 1;
}

forward After(playerid, skip);
public After(playerid, skip)
{
	if(skip == 0)
	{
	    new Float:x, Float:y, Float:z;
		new Float:rx, Float:ry, Float:rz;
		GetDynamicObjectPos(AvtomatInfo[numavtomat[playerid]][x1obj], x, y, z);
		SetDynamicObjectPos(AvtomatInfo[numavtomat[playerid]][x1obj], x, y, z+SET);
		GetDynamicObjectRot(AvtomatInfo[numavtomat[playerid]][x1obj], rx, ry, rz);
		PlayerPlaySound(playerid, SLOT_SOUND, x, y, z);
		MoveDynamicObject(AvtomatInfo[numavtomat[playerid]][x1obj], x, y, z, MOVE, AvtomatInfo[numavtomat[playerid]][x1] * 20, ry, rz);
		return 1;
	}
 	new
	    Float:x,
	    Float:y,
	    Float:z,
	    Float:rx,
	    Float:ry,
	    Float:rz
		;
	if(skip == 1)
	{
		GetDynamicObjectPos(AvtomatInfo[numavtomat[playerid]][x2obj], x, y, z);
		SetDynamicObjectPos(AvtomatInfo[numavtomat[playerid]][x2obj], x, y, z+SET);
		GetDynamicObjectRot(AvtomatInfo[numavtomat[playerid]][x2obj], rx, ry, rz);
		PlayerPlaySound(AvtomatInfo[numavtomat[playerid]][player], SLOT_SOUND, x, y, z);
		MoveDynamicObject(AvtomatInfo[numavtomat[playerid]][x2obj], x, y, z, MOVE, AvtomatInfo[numavtomat[playerid]][x2] * 20, ry, rz);
		return 1;
	}
	if(skip == 2)
	{
  		GetDynamicObjectPos(AvtomatInfo[numavtomat[playerid]][x3obj], x, y, z);
		SetDynamicObjectPos(AvtomatInfo[numavtomat[playerid]][x3obj], x, y, z+SET);
		GetDynamicObjectRot(AvtomatInfo[numavtomat[playerid]][x3obj], rx, ry, rz);
		MoveDynamicObject(AvtomatInfo[numavtomat[playerid]][x3obj], x, y, z, MOVE, AvtomatInfo[numavtomat[playerid]][x3] * 20, ry, rz);
		PlayerPlaySound(AvtomatInfo[numavtomat[playerid]][player], SLOT_SOUND, x, y, z);
		return 1;
	}
	if(skip == 3)
	{
		switch(AvtomatInfo[numavtomat[playerid]][x1])
	    {
	        case 0: AvtomatInfo[numavtomat[playerid]][x1group] = 0;
	        case 1, 5, 8: AvtomatInfo[numavtomat[playerid]][x1group] = 1;
	        case 2, 7: AvtomatInfo[numavtomat[playerid]][x1group] = 2;
	        case 3,6: AvtomatInfo[numavtomat[playerid]][x1group] = 3;
	        case 4: AvtomatInfo[numavtomat[playerid]][x1group] = 4;
	        case 9: AvtomatInfo[numavtomat[playerid]][x1group] = 5;
		}
		switch(AvtomatInfo[numavtomat[playerid]][x2])
	    {
	        case 0: AvtomatInfo[numavtomat[playerid]][x1group] = 0;
	        case 1, 5, 8: AvtomatInfo[numavtomat[playerid]][x1group] = 1;
	        case 2, 7: AvtomatInfo[numavtomat[playerid]][x1group] = 2;
	        case 3,6: AvtomatInfo[numavtomat[playerid]][x1group] = 3;
	        case 4: AvtomatInfo[numavtomat[playerid]][x1group] = 4;
	        case 9: AvtomatInfo[numavtomat[playerid]][x1group] = 5;
		}
		switch(AvtomatInfo[numavtomat[playerid]][x3])
	    {
	        case 0: AvtomatInfo[numavtomat[playerid]][x1group] = 0;
	        case 1, 5, 8: AvtomatInfo[numavtomat[playerid]][x1group] = 1;
	        case 2, 7: AvtomatInfo[numavtomat[playerid]][x1group] = 2;
	        case 3,6: AvtomatInfo[numavtomat[playerid]][x1group] = 3;
	        case 4: AvtomatInfo[numavtomat[playerid]][x1group] = 4;
	        case 9: AvtomatInfo[numavtomat[playerid]][x1group] = 5;
		}
		if(AvtomatInfo[numavtomat[playerid]][x1group] == AvtomatInfo[numavtomat[playerid]][x2group]  && AvtomatInfo[numavtomat[playerid]][x2group] == AvtomatInfo[numavtomat[playerid]][x3group])
		{
		    switch(AvtomatInfo[numavtomat[playerid]][x1])
		    {
	        	case 0: AvtomatInfo[numavtomat[playerid]][xwin] = 9;
		        case 1, 5, 8, 2, 6, 3: AvtomatInfo[numavtomat[playerid]][xwin] = 4;
		        case 4: AvtomatInfo[numavtomat[playerid]][xwin] = 200;
		        case 9: AvtomatInfo[numavtomat[playerid]][xwin] = 30;
			}
			AvtomatInfo[numavtomat[playerid]][balance] += AvtomatInfo[numavtomat[playerid]][stavka] * AvtomatInfo[numavtomat[playerid]][xwin];
			format(tsv1, 64, "~y~YOU WIN!~n~~g~+%i$", AvtomatInfo[numavtomat[playerid]][stavka] * AvtomatInfo[numavtomat[playerid]][xwin]);
			GameTextForPlayer(AvtomatInfo[numavtomat[playerid]][player], tsv1, 2000, 5);
			PlayerPlaySound(AvtomatInfo[numavtomat[playerid]][player], JACKPOT_SOUND, x, y, z);
			format(tsv1, 64, "{C2A2DA}Поздравляем! Вы выиграли {9EC73D}%i$!", AvtomatInfo[numavtomat[playerid]][stavka] * AvtomatInfo[numavtomat[playerid]][xwin]);
		    SendClientMessage(AvtomatInfo[numavtomat[playerid]][player], -1, tsv1);
		    ApplyAnimation(AvtomatInfo[numavtomat[playerid]][player], "CASINO", "Slot_win_out", 9.33, 0, 1, 1, 0, 0);
			//PlayerInfo[AvtomatInfo[numavtomat[playerid]][player]][pCash] += AvtomatInfo[numavtomat[playerid]][stavka] * AvtomatInfo[numavtomat[playerid]][xwin];
		}
		else
		{
		    AvtomatInfo[numavtomat[playerid]][balance] -= AvtomatInfo[numavtomat[playerid]][stavka];
		}
		format(tsv1, 64, " %i $", AvtomatInfo[numavtomat[playerid]][balance]);
		TextDrawSetString(Balance[numavtomat[playerid]], tsv1);
		format(tsv1, 64, " %i $", AvtomatInfo[numavtomat[playerid]][stavka]);
		TextDrawSetString(Stavka[numavtomat[playerid]], tsv1);
		AvtomatInfo[numavtomat[playerid]][playing] = false;
		return 1;
	}
	return 0;
}

forward OnAvtomatUpdate();
public OnAvtomatUpdate()
{
	for(new i; i < MAX_AVTOMATS; i++)
	{
		if(!IsPlayerConnected(AvtomatInfo[i][player]) && AvtomatInfo[i][player] != -1)
		{
		    SetDynamicObjectMaterial(AvtomatInfo[i][gobj], 0, 1948, "kbslotnu", "wheel_o_tbl1a", 0);
		    format(tsv1, 64, " 0 $");
			TextDrawSetString(Balance[i], tsv1);
			format(tsv1, 64, " 2000 $");
			TextDrawSetString(Stavka[i], tsv1);
            AvtomatInfo[i][player] = INVALID_PLAYER_ID;
            AvtomatInfo[i][balance] = 0;
            AvtomatInfo[i][stavka] = 2000;
            AvtomatInfo[i][use] = false;
            AvtomatInfo[i][playing] = false;
		}
		if(i == 23) SetTimer("OnAvtomatUpdate", 30000, 0);
	}
}
/*------------------CASINO-ADVANCE-RP---------------
Credit
By Annihilator vk.com/annihilator_page

 Позиционируется как мод, который можно запустить в
 свободном режиме и протестировать саму систему.

 Строки 534 и 535 отвечают за проверку и снятия денег.
 Строка 1073 овтечает за начисление денег в случае выигрыша.*/

/*Данный мод куплен мною (Danny_Marcelo), имею право распространять его где угодно
Связь со мной:

ВКонтакте: https://vk.com/dannymarcelo
YouTube: https://www.youtube.com/MsDanFreedom*/
