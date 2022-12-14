#if defined _notify_td_included
    #endinput
#endif
#include <a_samp>
#define _notify_td_included


const MAX_NOTIFY_TD = 20;

enum E_NOTIFY {
	notify_time_id,
	bool:notify_Show[MAX_NOTIFY_TD],
	PlayerText:notify_TD[MAX_NOTIFY_TD]
}

static 
	notify_[MAX_PLAYERS][E_NOTIFY];

Notify_Send(playerid, text[], time) {
	new 
		l = 0, i = -0xFF;
	
	for(; l < MAX_NOTIFY_TD; l ++) {
		if(notify_[playerid][notify_Show][l] == false) {
			i = l;
			if(l > 0) KillTimer(notify_[playerid][notify_time_id]);
			break;
		}
	}
	if(i == -0xFF) { 
		Notify_Hide(playerid);
		i = 0;
	}
	notify_[playerid][notify_time_id] = SetTimerEx("Notify_Hide", time, 0, "d", playerid);
	PlayerTextDrawSetString(playerid, notify_[playerid][notify_TD][i], text);
	PlayerTextDrawShow(playerid, notify_[playerid][notify_TD][i]);
	notify_[playerid][notify_Show][i] = true;
	return 1;
}

forward Notify_Hide(const playerid);
public Notify_Hide(const playerid) {
	for(new j = 0; j < MAX_NOTIFY_TD; j ++) {
		notify_[playerid][notify_Show][j] = false;
		PlayerTextDrawHide(playerid, notify_[playerid][notify_TD][j]);
		PlayerTextDrawSetString(playerid, notify_[playerid][notify_TD][j], #);
	}
	return 1;
}

public OnPlayerConnect(playerid) {
	for(new i = 0; i < MAX_NOTIFY_TD; i ++) {
		notify_[playerid][notify_TD][i] = CreatePlayerTextDraw(playerid, 68.366676, 313.070495 - (float(11) * i), #);
		PlayerTextDrawLetterSize(playerid, notify_[playerid][notify_TD][i], 0.165666, 0.811852);
		PlayerTextDrawTextSize(playerid, notify_[playerid][notify_TD][i], 0.000000, 80.000000);
		PlayerTextDrawBackgroundColor(playerid, notify_[playerid][notify_TD][i], 255);
		PlayerTextDrawBoxColor(playerid, notify_[playerid][notify_TD][i], 168430280);
		PlayerTextDrawSetProportional(playerid, notify_[playerid][notify_TD][i], 1);		
		PlayerTextDrawAlignment(playerid, notify_[playerid][notify_TD][i], 2);
		PlayerTextDrawSetShadow(playerid, notify_[playerid][notify_TD][i], 0);
		PlayerTextDrawColor(playerid, notify_[playerid][notify_TD][i], -1);
		PlayerTextDrawUseBox(playerid, notify_[playerid][notify_TD][i], 1);
		PlayerTextDrawFont(playerid, notify_[playerid][notify_TD][i], 1);
		notify_[playerid][notify_Show][i] = false;
	}		
	CallLocalFunction("cb_prefix_OnPlayerConnect", "d", playerid);
	return 1;
}

//public OnPlayerDisconnect(playerid, reason) {
//	for(new i = 0; i < MAX_NOTIFY_TD; i ++) {
//		PlayerTextDrawDestroy(playerid, notify_[playerid][notify_TD][i]);
//	}
//	CallLocalFunction("cb_prefix_OnPlayerDisconnect", "ds[256]", playerid, reason);
//	return 1;
//}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect cb_prefix_OnPlayerConnect
#if defined cb_prefix_OnPlayerConnect
	forward cb_prefix_OnPlayerConnect(playerid);
#endif

//#if defined _ALS_OnPlayerDisconnect
//	#undef OnPlayerDisconnect
//#else
//	#define _ALS_OnPlayerDisconnect
//#endif

//#define OnPlayerDisconnect cb_prefix_OnPlayerDisconnect
//#if defined cb_prefix_OnPlayerDisconnect
//	forward cb_prefix_OnPlayerDisconnect(playerid, reason);
//#endif

