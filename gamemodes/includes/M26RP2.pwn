#define SERVER_GM_TEXT "V3.2 - Los Santos"
#pragma tabsize 0
#pragma warning disable  217, 203, 204, 216, 219, 226
#pragma disablerecursion
#include <gangzones>
#include <a_samp>
// #include <fixes>
#include <progress2>


// #include <cef>
#include <sscanf2>
#include <foreach>
// #include <fmt>
// #include <notify_td>
#define DEBUG
// #include <nex-ac_en.lang>
// #include <nex-ac>
#include <a_mysql>
#include <a_actor>
// #include <Pawn.CMD>
#include <yom_buttons>
#include <ZCMD>
#include <MenuStore>

//#include <progress>

// #include <SimpleINI>
// #include <mxini>



//#include <tdw_vmath>

// #include <fcnpc>


#include <YSI\y_timers>
#include <YSI\y_utils>
#include <YSI\y_ini>
// #if defined SOCKET_ENABLED
// #include <socket>
// #endif

// #include <mapandreas>
// #include <sampvoice>
#include <compat>
#include <a_objects>
#include <streamer>
#include <keypad>
#include <crashdetect>
// #include <Rogue-AC>

#include "./includes/M26RP.pwn"
#include "./includes/trangthai.pwn"
// // #include "./includes/race.pwn"
#include "./includes/oil_transportion.pwn"
#include "./includes/capturegangs.pwn"
#include "./includes/banvukhi.pwn"
// // #include "./includes/zombie3.pwn"
#include "./includes/hqcuamember.pwn"
#include "./includes/ngudan.pwn"
#include "./includes/minerjob.pwn"
#include "./includes/AntiCS.pwn"
#include "./includes/donrac.pwn"
// #include "./includes/chatgo.pwn"
#include "./includes/trangtrils.pwn"
#include "./includes/cuoptaphoa.pwn"
#include "./includes/giaodichthucan.pwn"
#include "./includes/buyammo.pwn"
#include "./includes/circlek.pwn"
#include "./includes/doxe.pwn"

// #include "./includes/antihack_vgta.pwn"
// #include "./includes/cinema.pwn"
// #include "./includes/anticheat2.pwn"
main() {}

public OnGameModeInit()
{
	// MapAndreas_Init(MAP_ANDREAS_MODE_FULL, "scriptfiles/SAFull.hmap");
    // new Float:pos;
    // if (MapAndreas_FindAverageZ(20.001, 25.006, pos)) {
    //     // Found position - position saved in 'pos'
    // }
	

	// Uncomment the line to enable debug mode
    // SvDebug(SV_TRUE);


    // gstream = SvCreateGStream(0xffff0000, "Global");
    UsePlayerPedAnims();
	print("Dang chuan bi tai gamemode, xin vui long cho doi...");
	g_mysql_Init();
	return 1;
}

public OnGameModeExit()
{
	// if (gstream) SvDeleteStream(gstream);
	// 
    g_mysql_Exit();

	return 1;
}
