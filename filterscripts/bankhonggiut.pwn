#define FILTERSCRIPT

#include <a_samp>

    new hitsInaRow[MAX_PLAYERS];
   	new Float:lastMiddle_X[MAX_PLAYERS];
	new Float:lastMiddle_Y[MAX_PLAYERS];
	new Float:lastMiddle_Z[MAX_PLAYERS];
    new Float:lastHit_X[MAX_PLAYERS];
    new Float:lastHit_Y[MAX_PLAYERS];
    new Float:lastHit_Z[MAX_PLAYERS];
    new weaponUsed[MAX_PLAYERS];
    new Float:averageSpread[MAX_PLAYERS];


    public OnFilterScriptInit()
    {
            print("\n--------------------------------------");
            print("No-spread detector by monday");
            print("--------------------------------------\n");
            return 1;
    }

	stock Float:GetPositiveNumber(Float:number)
	{
		if(0.0 > number)
		{
			number *= -1.0;
		}
		return number;
	}

     stock Float:GetDistanceBetweenPoints(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2)
	{
    	return VectorSize(x1-x2, y1-y2, z1-z2);
	}

    
    public OnPlayerConnect(playerid)
    {
        hitsInaRow[playerid]=0;
        lastMiddle_X[playerid]=0.0;
		lastMiddle_Y[playerid]=0.0;
		lastMiddle_Z[playerid]=0.0;
	    lastHit_X[playerid]=0.0;
	    lastHit_Y[playerid]=0.0;
		lastHit_Z[playerid]=0.0;
		averageSpread[playerid]=0.0;
		weaponUsed[playerid] = 0;
        return 1;
    }
    
    forward SpreadCheckReset(playerid);
    public SpreadCheckReset(playerid)
    {
        hitsInaRow[playerid]=0;
        lastMiddle_X[playerid]=0.0;
		lastMiddle_Y[playerid]=0.0;
		lastMiddle_Z[playerid]=0.0;
	    lastHit_X[playerid]=0.0;
	    lastHit_Y[playerid]=0.0;
		lastHit_Z[playerid]=0.0;
		averageSpread[playerid]=0.0;
		weaponUsed[playerid] = 0;
  		return 1;
    }

    
    
    
    forward OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
    public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
    {

            new
            Float:fOriginX, Float:fOriginY, Float:fOriginZ,
            Float:fVX, Float:fVY, Float:fVZ,
            Float:fHitPosX, Float:fHitPosY, Float:fHitPosZ,
            Float:middle_x, Float:middle_y, Float:middle_z,
            Float:compareMiddle_x, Float:compareMiddle_y, Float:compareMiddle_z,
            Float:compareHit_x, Float:compareHit_y, Float:compareHit_z,
            Float:compareBoth_x, Float:compareBoth_y, Float:compareBoth_z,
			Float:distance,
			Float:spreadValue,
			Float:spreadLimit,
			cheaterName[MAX_PLAYER_NAME],
			hitsNeeded,
			weaponTime,
			currentWeapon,
			finalMessage[128],
			gunName[32],
			spread[128];
			
			currentWeapon = GetPlayerWeapon(playerid);
			GetPlayerLastShotVectors(playerid, fOriginX, fOriginY, fOriginZ, fHitPosX, fHitPosY, fHitPosZ);
			distance = GetDistanceBetweenPoints(fOriginX, fOriginY, fOriginZ, fHitPosX, fHitPosY, fHitPosZ);
        	GetPlayerCameraFrontVector(playerid, fVX, fVY, fVZ);

        	middle_x = fOriginX + floatmul(fVX, distance);
        	middle_y = fOriginY + floatmul(fVY, distance);
        	middle_z = fOriginZ + floatmul(fVZ, distance);

            // middle_x, middle_y, middle_z = middle of the screen
        	// fHitPosX, fHitPosY, fHitPosZ = shooting point

        	//compare with the last shot
        	compareMiddle_x = GetPositiveNumber(middle_x - lastMiddle_X[playerid]);
        	compareMiddle_y = GetPositiveNumber(middle_y - lastMiddle_Y[playerid]);
        	compareMiddle_z = GetPositiveNumber(middle_z - lastMiddle_Z[playerid]);
        	compareHit_x = GetPositiveNumber(fHitPosX - lastHit_X[playerid]);
        	compareHit_y = GetPositiveNumber(fHitPosY - lastHit_Y[playerid]);
        	compareHit_z = GetPositiveNumber(fHitPosZ - lastHit_Z[playerid]);
			compareBoth_x = GetPositiveNumber(compareMiddle_x - compareHit_x);
        	compareBoth_y = GetPositiveNumber(compareMiddle_y - compareHit_y);
        	compareBoth_z = GetPositiveNumber(compareMiddle_z - compareHit_z);
			spreadValue = GetPositiveNumber(compareBoth_x + compareBoth_y + compareBoth_z);

        	//replace last shot data with new one
			lastMiddle_X[playerid] = middle_x;
			lastMiddle_Y[playerid] = middle_y;
			lastMiddle_Z[playerid] = middle_z;
			lastHit_X[playerid] = fHitPosX;
		    lastHit_Y[playerid] = fHitPosY;
		    lastHit_Z[playerid] = fHitPosZ;
		    
            if (weaponUsed[playerid] != currentWeapon)
			{
			    weaponUsed[playerid] = currentWeapon;
				SpreadCheckReset(playerid);
				return 1;
			}

			if (currentWeapon == 31 || currentWeapon == 30 ||currentWeapon == 28 || currentWeapon == 32 ||currentWeapon == 29) //m4, ak47, tec, uzi, mp5 - all of them are set to m4's limit which is the most accurate weapon. Mp5 has a bit faster shooting rate than other weapons included but its spread is also higher so it's not an issue, I tested it and it's not even close to get false detection
			{
			    hitsNeeded = 3; //
				weaponTime = 500; //time after which the stored hits will be reset(to make sure that there is no breaks between single shots)
				weaponUsed[playerid] = currentWeapon;
			}
			else
			{
			    if (currentWeapon == 24)//deagle
			    {
			    hitsNeeded = 2;
				weaponTime = 1600;
				weaponUsed[playerid] = currentWeapon;
				}
				else
				{
				return 1;
				}
			}
			
			if( GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_DUCK )
			{
				spreadLimit = 0.00075 * distance; //decreased limit if the player is crouching
			}
			else
			{
			    spreadLimit = 0.00140 * distance;
			}
			
			format(spread, sizeof(spread), "Spread: %f Limit: %f",spreadValue, spreadLimit);
            //SendClientMessage(playerid, -1, spread);

			if(spreadValue < spreadLimit && 200.0 > distance > 3.0)
			{
            hitsInaRow[playerid]++;
            averageSpread[playerid] = averageSpread[playerid] + spreadValue;
            }
            
            if (hitsInaRow[playerid] == 1)
            {
            	SetTimerEx("SpreadCheckReset", weaponTime, 0, "i", playerid);
			}
			
			if (hitsInaRow[playerid] == hitsNeeded || hitsInaRow[playerid] > hitsNeeded)
			{
			//send message to admins, kick, ban
			GetWeaponName(currentWeapon, gunName, sizeof(gunName));
			GetPlayerName(playerid, cheaterName, MAX_PLAYER_NAME);
			averageSpread[playerid] /= float(hitsInaRow[playerid]);
			format(finalMessage, sizeof(finalMessage), "%s is shooting under spread limit using %s. Average spread=%f Limit=%f", cheaterName, gunName, averageSpread[playerid], spreadLimit);
            SendClientMessageToAll(0xED6755AA,finalMessage);
            SpreadCheckReset(playerid);
            }
            return 1;
    }