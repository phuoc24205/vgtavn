#include <a_samp>
#include <zcmd>

new Float: playerPrevPos[MAX_PLAYERS][3];
new playerQuakeProg[MAX_PLAYERS];
new playerQuakeTimer[MAX_PLAYERS];

CMD:thientai(playerid)
{
    new Float:Pos[3];

    SendClientMessage(playerid, -1, "Earthquake started");

    GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);
    PlayAudioStreamForPlayer(playerid, "http://damianc.us/anniversary/earthquake_sound.mp3");

    SetPlayerDrunkLevel(playerid, 5001);
    SetPlayerWeather(playerid, 19);

    playerPrevPos[playerid][0] = Pos[0];
    playerPrevPos[playerid][1] = Pos[1];
    playerPrevPos[playerid][2] = Pos[2];

    SetPlayerVelocity(playerid, 0.0, 0.0, 0.05);
    playerQuakeTimer[playerid] = SetTimer("VelocityModeOne", 500, true);

    return 1;
}

forward VelocityModeOne(playerid);
public VelocityModeOne(playerid)
{
    if(playerQuakeProg[playerid] == 0)
    {
        if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
        {
            SetPlayerPos(playerid, playerPrevPos[playerid][0], playerPrevPos[playerid][1], playerPrevPos[playerid][2]);
        }

        else if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
            SetVehiclePos(GetPlayerVehicleID(playerid), playerPrevPos[playerid][0], playerPrevPos[playerid][1], playerPrevPos[playerid][2]);
        }

        playerQuakeProg[playerid] = 1;
    }

    else if(playerQuakeProg[playerid] > 0)
    {
        switch(random(3))
        {
            case 0:
            {
                if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) SetPlayerVelocity(playerid, 0.03, 0.0, 0.05);
                else if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.03, 0.0, 0.05);
            }

            case 1:
            {
                if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) SetPlayerVelocity(playerid, 0.05, 0.0, 0.02);
                else if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.05, 0.0, 0.02);
            }

            case 2:
            {
                if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) SetPlayerVelocity(playerid, 0.01, 0.05, 0.03);
                else if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.05, 0.0, 0.02);
            }
        }

        SetPlayerDrunkLevel(playerid, 50000);
        playerQuakeProg[playerid] += 1;

        if(playerQuakeProg[playerid] > 6)
        {
            KillTimer(playerQuakeTimer[playerid]);
            SetTimer("VelocityModeTwo", 500, false);
        }
    }

    return 1;
}

forward VelocityModeTwo(playerid);
public VelocityModeTwo(playerid)
{
    SetPlayerDrunkLevel(playerid, 0);
    SetPlayerWeather(playerid, 0);

    playerQuakeProg[playerid] = 0;
    StopAudioStreamForPlayer(playerid);

    SendClientMessage(playerid, -1, "Kêt thúc thiên tai");

    return 1;
}
