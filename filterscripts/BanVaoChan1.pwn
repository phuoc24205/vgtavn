#include <a_samp>



#define MAU_DO 0xAA3333AA
#define BODY_PART_RIGHT_LEG 8
#define BODY_PART_LEFT_LEG 7
#define COLOR_GREY 0xAFAFAFAA

public OnFilterScriptInit()
{
	
    return 1;
}
public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
    //new bantrungchan = BODY_PART_LEFT_LEG || BODY_PART_RIGHT_LEG ;
    if(IsPlayerInAnyVehicle(playerid))
	{
	    
    }
    else
    {
        if(bodypart == 7 || bodypart == 8)
	    {
            new rand = random(2);
            if(rand == 1)
            {
                ApplyAnimation(playerid, "PED", "getup_front", 4.0, 0, 0, 0, 0, 0);
            }
	        
           
	        return 1;
        }
    }
    if(weaponid == 8)
    {
       amount = 35;
       new Float:HP, Float:giap;
       GetPlayerHealth(playerid, HP);
       GetPlayerArmour(playerid, giap);
       if(giap > 0)
       {
         SetPlayerArmour(playerid, 0);
       }
       else{
        SetPlayerHealth(playerid, HP-50);
       }
       
      

    }
    /* Float:HP, Float:giap;
    GetPlayerHealth(playerid, HP);
    GetPlayerArmour(playerid, giap);

     new Float: pX, Float: pY, Float: pZ;
     GetPlayerPos(playerid, pX, pY, pZ);
     //new Float: iX, Float: iY, Float: iZ;
    // GetPlayerPos(issuerid, iX, iY, iZ);
    if(weaponid == 25)
    {
         if(IsPlayerInRangeOfPoint(issuerid,3,pX ,pY,pZ))
         {
            if(bodypart == 3 || bodypart == 4)
                {
                    if(GetPVarInt(playerid, "EMSAttempt") != 0)     
                    {

                    }
                    else{


                        SetTimerEx("NamXuong", 2500, 0, "i", playerid);
                    
                        ApplyAnimation(playerid, "PED", "BIKE_fall_off", 4.0, 0, 1, 1, 1, 0, 1);
                        }
                }

                
                if(giap > 0.0)
                {
                    SetPlayerArmour(playerid, 0);
                    return 1;
                }
                else{
                    SetPlayerHealth(playerid, HP-50);
                }

        }
        else if (IsPlayerInRangeOfPoint(issuerid,5.0,pX ,pY,pZ)) 
        {
            if(giap > 0.0)
                {
                    if(giap < 55)
                    {
                        SetPlayerArmour(playerid, 0);
                        return 1;
                    }
                    SetPlayerArmour(playerid, giap-50);
                }
                else{
                    SetPlayerHealth(playerid, HP-25);
                }
        }
        else{
            if(giap > 0.0)
                {
                    if(giap < 12)
                    {
                        SetPlayerArmour(playerid, 0);
                        return 1;
                    }
                    SetPlayerArmour(playerid, giap-10);
                }
                else{
                    SetPlayerHealth(playerid, HP-5);
                }
        }
    }

    
     
     if(giap > 0.0)
    {

        if(weaponid == 1)
        {
            if(giap < 17)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-15);
        } 
        if(weaponid == 2) 
        {
            if(giap < 22)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-20);
        }
        if(weaponid == 3) 
        {
            if(giap < 32)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-30);
        }
        if(weaponid == 4)
        { 
            if(giap < 17)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-15);
        }
        if(weaponid == 5) 
        {
            if(giap < 22)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-20);
        }
        if(weaponid == 6) 
        {
            if(giap < 27)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-25);
        }
        if(weaponid == 7) 
        {
            if(giap < 22)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-20);
        }
        //if(weaponid == 8) SetPlayerArmour(playerid, A-35);
        if(weaponid == 8) 
        {
            if(giap < 36)
            {
                SetPlayerArmour(playerid, 0);
                return 1;
            }
            SetPlayerArmour(playerid, giap-35);
        }
        if(weaponid == 10) 
        {
            if(giap < 3)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-1);
        }
        if(weaponid == 11) 
        {
            if(giap < 3)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-1);
        }
        if(weaponid == 12) 
        {
            if(giap < 3)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-1);
        }
        if(weaponid == 13)
        {
            if(giap < 3)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-1);
        }
        if(weaponid == 14)
        {
            if(giap < 3)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-1);
        }
        if(weaponid == 15)
        {
            if(giap < 12)
            {
                 SetPlayerArmour(playerid, 0);
                 return 1;
            }
            SetPlayerArmour(playerid, giap-10);
        }
    }
    else{
        if(weaponid == 1) SetPlayerHealth(playerid, HP-15);
        if(weaponid == 2) SetPlayerHealth(playerid, HP-20);
        if(weaponid == 3) SetPlayerHealth(playerid, HP-30);
        if(weaponid == 4) SetPlayerHealth(playerid, HP-15);
        if(weaponid == 5) SetPlayerHealth(playerid, HP-20);
        if(weaponid == 6) SetPlayerHealth(playerid, HP-25);
        if(weaponid == 7) SetPlayerHealth(playerid, HP-20);
        if(weaponid == 8) SetPlayerHealth(playerid, HP-35);
        if(weaponid == 10) SetPlayerHealth(playerid, HP-1);
        if(weaponid == 11) SetPlayerHealth(playerid, HP-1);
        if(weaponid == 12) SetPlayerHealth(playerid, HP-1);
        if(weaponid == 13) SetPlayerHealth(playerid, HP-1);
        if(weaponid == 14) SetPlayerHealth(playerid, HP-1);
        if(weaponid == 15) SetPlayerHealth(playerid, HP-10);
    }*/

	return 1;
}


