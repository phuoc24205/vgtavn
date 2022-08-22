// #include <a_samp>
// #pragma disablerecursion
 
// #include <fcnpc>
// #include <YSI\y_timers>
// #include "../gamemodes/includes/M26RP.pwn"
#include <YSI\y_hooks>
#define MAX_ZOMBIES 200 // change this to whatever number you want
//zombie vgta
new ZombiesTimer;
new PickupZombie[MAX_PLAYERS];
new PickupZombieLoai[MAX_PLAYERS];
// new thenpc[MAX_ZOMBIES];

// new Float:ZombieSpawnsvgta[][4] =
// {
 
// {-2542.5759,2324.0122,4.9844,82.1170},
// {-2242.8242,2345.2800,5.3902,14.1956},
// {-1911.6620,2422.7727,52.6096,269.1553},
// {-1511.5007,2577.4980,55.8359,317.7225},
// {-1258.2908,2663.8604,48.5697,285.7621},
// {-821.8821,2749.8655,46.0000,285.7621},
// {-590.7568,2685.3401,73.8637,285.7621},
// {-286.6721,2701.0964,62.5391,270.0953},
// {-280.5756,2589.6130,63.3337,197.7147},
// {2786.2183,-2436.7859,13.6340,82.3043},
// {-1308.4493,504.9661,11.1953,132.5},
// {272.6040,1989.7307,17.6406,268.3605},
// {-26.9938,2373.4287,23.3340,47.1683},
// {1792.0466,2469.8860,7.1585,97.9287},
// {1803.1254,2019.6487,4.0078,52.5299},
// {2108.9143,1971.9635,10.6900,329.6292},
// {2235.9885,2441.8914,10.6719,59.6292},
// {2045.3735,2478.0754,10.8203,169.8510},
// {2763.3447,2264.9346,10.8203,193.3513},
// {2761.9985,1946.8805,12.1766,85.8769},
// {2776.7224,1289.0688,10.7500,207.4514},
// {2770.5554,1041.4323,10.7500,179.2511},
// {2556.0176,773.7820,10.4236,31.2115},
// {2031.5289,867.6794,6.9608,205.0897},
// {1803.5732,795.7164,11.2150,107.4971},
// {1683.2909,424.1697,19.1272,166.4043},
// {1635.5233,224.0716,30.7120,166.4043},
// {1568.2250,-1693.5483,5.8906,177.0983},
// {-1604.8442,732.9442,-5.2344,37.6041},
// {1609.5922,1820.9641,10.8280,348.1614},
// {1561.1786,-24.5144,20.5611,166.4043},
// {1251.6511,-359.6993,3.6166,21.8113},
// {659.4545,-484.1760,16.1875,49.0716},
// {287.5155,59.7256,2.0705,136.9508},
// {204.8613,-66.6794,2.0705,136.9508},
// {-150.9496,-189.0110,2.0705,136.9508},
// {-141.7663,-366.9684,2.3751,136.9508},
// {-61.0981,-1116.5044,1.0781,159.1977},
// {-72.2603,-1510.5847,2.3197,263.2253},
// {294.1158,-1730.1440,4.3490,83.2253},
// {758.9001,-1774.3301,13.0176,263.2253},
// {1051.0582,-1824.3665,13.4656,263.2253},
// {1117.5380,-1495.9845,14.8806,158.1127},
// {1255.0277,-1295.0862,13.2834,338.1127},
// {1737.1638,-1297.2551,15.0717,287.9790},
// {2043.2405,-1194.0485,23.4722,287.9790},
// {2295.2156,-1168.6434,26.2969,256.0187},
// {2719.5735,-1280.6475,57.3341,256.0187},
// {2737.5974,-1631.4252,12.8438,6.4580},
// {2503.5813,-1819.8751,12.8438,121.2840},
// {2444.7588,-1671.6128,12.8438,76.4770},
// {2080.0403,-1731.2953,12.8438,135.3842},
// {1957.6324,-2160.9009,13.3828,135.3842},
// {1418.9562,-2166.7876,13.3901,90.2638},
// {-2860.2517,123.7832,11.1912,331.1730},
// {-2840.0906,521.3478,4.8244,3.1333},
// {-2816.4668,905.3797,44.0547,183.1333},
// {-2602.4771,1378.9128,7.1784,120.4660,},
// {-2683.0396,2050.3188,56.6777,9.0867},
// {-1568.6206,2088.4973,50.4226,94.1458},
// {-1033.3961,1238.3406,32.2326,217.4319},
// {-306.0912,1531.4260,75.3594,131.5777},
// {-2723.4639,-314.8138,7.1839,43.5562},  // golf course spawn
// {-2694.5344,64.5550,4.3359,95.0190},  // in front of a house
// {-2458.2000,134.5419,35.1719,303.9446},  // hotel
// {-2796.6589,219.5733,7.1875,88.8288},  // house
// {-2706.5261,397.7129,4.3672,179.8611},  // park
// {-2866.7683,691.9363,23.4989,286.3060},  // house
// {-2764.9543,785.6434,52.7813,357.6817},  // donut shop
// {-2660.9402,883.2115,79.7738,357.4440},  // house
// {-2861.0796,1047.7109,33.6068,188.2750}, //  parking lot
// {-2629.2009,1383.1367,7.1833,179.7006},  // parking lot at the bridge
// {-2079.6802,1430.0189,7.1016,177.6486},  // pier
// {-1660.2294,1382.6698,9.8047,136.2952}, //  pier 69
// {-1674.1964,430.3246,7.1797,226.1357},  // gas station]
// {-1954.9982,141.8080,27.1747,277.7342},  // train station
// {-1956.1447,287.1091,35.4688,90.4465},  // car shop
// {-1888.1117,615.7245,35.1719,128.4498},  // random
// {-1922.5566,886.8939,35.3359,272.1293},  // random
// {-1983.3458,1117.0645,53.1243,271.2390},  // church
// {-2417.6458,970.1491,45.2969,269.3676},  // gas station
// {-2108.0171,902.8030,76.5792,5.7139},  // house
// {-2097.5664,658.0771,52.3672,270.4487},  // random
// {-2263.6650,393.7423,34.7708,136.4152},  // random
// {-2287.5027,149.1875,35.3125,266.3989},  // baseball parking lot
// {-2039.3571,-97.7205,35.1641,7.4744},  // driving school
// {-1867.5022,-141.9203,11.8984,22.4499},  // factory
// {-1537.8992,116.0441,17.3226,120.8537},  // docks ship
// {-1708.4763,7.0187,3.5489,319.3260},  // docks hangar
// {-1427.0858,-288.9430,14.1484,137.0812},  // airport
// {-2173.0654,-392.7444,35.3359,237.0159},  // stadium
// {-2320.5286,-180.3870,35.3135,179.6980},  // burger shot
// {-2930.0049,487.2518,4.9141,3.8258},
// {1435.8024,2662.3647,11.3926,1.1650}, //  Northern train station
// {1457.4762,2773.4868,10.8203,272.2754}, //  Northern golf club
// {1739.6390,2803.0569,14.2735,285.3929}, //  Northern housing estate 1
// {1870.3096,2785.2471,14.2734,42.3102}, //  Northern housing estate 2
// {1959.7142,2754.6863,10.8203,181.4731}, //  Northern house 1
// {2314.2556,2759.4504,10.8203,93.2711}, //  Northern industrial estate 1
// {2216.5674,2715.0334,10.8130,267.6540}, //  Northern industrial estate 2
// {2101.4192,2678.7874,10.8130,92.0607}, //  Northern near railway line
// {1951.1090,2660.3877,10.8203,180.8461}, //  Northern house 2
// {1666.6949,2604.9861,10.8203,179.8495}, //  Northern house 3
// {2808.3367,2421.5107,11.0625,136.2060}, //  Northern shopping centre
// {2633.3203,2349.7061,10.6719,178.7175}, //  V-Rock
// {2606.6348,2161.7490,10.8203,88.7508}, //  South V-Rock
// {2616.5286,2100.6226,10.8158,177.7834}, //  North Ammunation 1
// {2491.8816,2397.9370,10.8203,266.6003}, //  North carpark 1
// {2531.7891,2530.3223,21.8750,91.6686}, //  North carpark 2
// {2340.6677,2530.4324,10.8203,177.8630}, //  North Pizza Stack
// {2097.6855,2491.3313,14.8390,181.8117}, //  Emerald Isle
// {1893.1000,2423.2412,11.1782,269.4385}, //  Souvenir shop
// {1698.9330,2241.8320,10.8203,357.8584}, //  Northern casino
// {1479.4559,2249.0769,11.0234,306.3790}, //  Baseball stadium 1
// {1298.1548,2083.4016,10.8127,256.7034}, //  Baseball stadium 2
// {1117.8785,2304.1514,10.8203,81.5490}
// };

new Float:ZombieSpawnsvgta[][4] =
{
 
{1479.6422,1580.6311,10.8125,316.5275},
{-137.1914,1288.3335,20.3879,275.8730},
{-139.4994,1083.6108,19.7422,173.9998},
{-1168.9298,1823.9957,42.1702,254.5896},
{-1449.2092,2337.6143,52.7899,266.2410},
{-1099.4330,2701.3247,46.0372,273.2252},
{-693.7467,2517.6565,75.4582,238.0033},
{2840.9727,922.5381,10.7500,99.0451},
{2100.9695,1739.2770,10.8203,0.6567},
{2128.0486,2743.8159,10.8203,5.7048},
{1818.1826,2853.0205,10.8359,141.2980},
{1379.1549,2835.2056,10.8203,205.7827},
{1125.0254,2093.0615,10.8203,12.3389},
{799.8802,1683.7439,5.2813,178.1860},
{571.6003,1704.6306,8.9972,124.4173},
{1009.9373,2757.2354,16.2324,264.7292},
{95.2746,1282.6306,20.6312,250.8170},
{160.4820,1174.9175,14.9905,235.9671},
{413.9289,629.0883,18.1286,208.7675},
{587.8985,901.5391,-44.3157,26.5547},
{1171.2957,918.3152,10.2993,169.8746},
{1168.8618,844.1594,11.0322,208.0402},
{1838.7672,605.7880,10.8203,269.4531},
{2393.4573,325.8145,32.6641,280.1684},
{2346.0374,97.2840,26.3328,168.9383},
{631.0110,-1188.1460,18.5353,43.2249},
{1347.1617,-1276.4296,13.3828,267.3862},
{1923.1943,-1404.4874,13.5703,231.1016},
{1820.5527,-1622.9198,13.5236,176.0802},
{1795.9779,-2006.3499,13.5069,159.1579},
{1347.8342,-2018.3193,52.0772,86.0880},
{363.4854,-1880.6146,2.6509,89.3502},
{-248.5037,-1621.6063,15.5392,155.9013},
{-1257.0588,-750.7785,65.2765,44.4770},
{-1628.0079,-486.0140,22.0938,59.3328},
{-1877.3170,157.1200,38.2448,0.0505},
{-1459.3627,774.3948,46.7228,315.9301},
{-1634.0535,1215.1075,7.0391,33.8255},
{-2210.8596,1277.3524,35.0704,75.8741},
{-2582.8242,661.2387,27.8125,186.5512},
{-1993.0100,-1580.4399,86.3963,113.9786},
{-2004.6584,-1752.1628,86.5981,164.9241},
{-1764.3369,-1688.2889,34.0061,305.3415},
{-2337.7273,-2244.9954,18.7593,36.5497},
{-2322.1567,-2173.8066,37.6881,301.0391},
{-2345.6387,-2179.1174,34.2665,104.0755},
{-2548.5034,-2188.4177,29.7217,17.4106},
{-2729.0537,-1996.3239,45.2255,55.3253},
{-1576.7869,-2753.0300,48.5328,203.0673},
{-985.2948,-2871.0618,67.0094,257.7148},
{9.0569,-2660.5464,40.2734,328.1525},
{798.2313,1479.6105,20.2334,120.5189},
{337.3215,1004.4887,28.4168,108.9874},
{274.5777,1418.6349,10.4541,142.8669},
{117.6833,1404.3628,10.5963,4.6239},
{182.7088,1470.7487,10.5891,254.8310},
{1456.8262,855.6422,6.8125,267.7423},
{2774.2251,279.8851,8.9282,23.5504},
{2506.9924,801.6945,10.8203,1.0000},
{2068.4763,611.4675,10.8203,247.7316},
{1608.6772,154.7690,35.5392,160.7537},
{1897.7899,269.3174,29.0758,293.7095},
{1412.6149,375.4764,19.3627,83.5468},  // golf course spawn
{1138.0745,418.2224,27.1376,79.9103},  // in front of a house
{717.1727,657.7452,10.3292,89.8765},  // hotel
{-455.0156,1504.3766,36.0900,355.1863},  // house
{-119.4252,1653.6343,18.6941,0.0739},  // park
{165.0003,2039.6400,18.5391,297.094},  // house
{328.1611,2122.1301,17.5782,274.7181},  // donut shop
{449.2831,1830.2983,23.0363,175.7077},  // house
{307.6792,1249.4930,14.6155,157.4094}, //  parking lot
{812.3094,859.6647,12.0469,271.3146},  // parking lot at the bridge
{1303.2583,757.1867,10.8203,138.9569},  // pier
{1525.6248,966.4037,10.8203,308.1612}, //  pier 69
{1590.8105,1196.1858,10.8125,76.3178},  // gas station]
{1425.7208,1442.2686,10.8203,356.4161},  // train station
{2079.4753,2631.3516,10.8203,265.7963},  // car shop
{2517.3403,2839.7083,10.8354,176.5606},  // random
{2367.7031,2747.6831,10.8203,74.9109},  // random
{1988.5637,750.6148,10.8394,86.6955},  // church
{1111.0150,794.1111,10.8203,55.7377},  // gas station
{849.1450,1086.3458,27.1616,38.0648},  // house
{1662.7822,2511.8765,8.9965,280.5688},  // random
{2092.8647,2657.6799,10.8203,197.5976},  // random
{2850.2878,2018.1398,10.6719,189.2620},  // baseball parking lot
{2826.3132,1769.9828,10.8203,173.0879},  // driving school
{2796.6091,1289.3265,10.8582,170.3266},  // factory
{1954.9727,238.0766,28.6059,275.0496},  // docks ship
{-1.3844,-350.8959,5.4297,203.3356},  // docks hangar
{-389.2845,273.8766,2.0781,96.0494},  // airport
{-423.3257,-1317.1229,32.8378,271.8318},  // stadium
{-1441.7374,-941.0751,201.0938,61.8666},  // burger shot
{-1895.2190,-540.4156,38.2344,1.6350},
{-1896.6993,-789.6547,44.9458,176.4144}, //  Northern train station
{-1900.7727,-1372.8250,40.5109,176.4144}, //  Northern golf club
{-1589.0197,-1157.9866,102.7733,30.8376}, //  Northern housing estate 1
{-1820.2129,-565.2661,16.3296,353.8653}, //  Northern housing estate 2
{-1748.9510,-718.3439,30.1410,177.9597}, //  Northern house 1
{-855.2883,1621.6494,26.9622,92.9956}, //  Northern industrial estate 1
{-1063.0170,1732.3726,31.5676,74.0046}, //  Northern industrial estate 2
{-1383.3586,2252.3000,55.0790,22.1802}, //  Northern near railway line
{-957.7122,1207.3850,33.2018,211.2887}, //  Northern house 2
{-299.6700,1066.5945,19.5938,218.4336}, //  Northern house 3
{-405.6286,2065.5771,61.9933,213.9595}, //  Northern shopping centre
{-248.1281,1483.9329,75.5625,91.3429}, //  V-Rock
{2679.0090,1318.5400,12.3497,103.9400}, //  South V-Rock
{1757.7240,1987.4441,10.7167,2.6048}, //  North Ammunation 1
{1493.3080,2066.6528,10.8203,170.9908}, //  North carpark 1
{262.8661,2489.9050,16.4844,89.0881}, //  North carpark 2
{237.0894,1809.0665,7.4141,355.5728}, //  North Pizza Stack
{248.2381,1834.1603,4.7335,180.3154}, //  Emerald Isle
{292.6853,1815.8707,4.7266,280.0190}, //  Souvenir shop
{279.3398,1838.0977,7.8281,153.0157}, //  Northern casino
{217.3965,1911.3964,17.7076,99.9603}, //  Baseball stadium 1
{297.3007,1867.9552,8.7644,198.1440}, //  Baseball stadium 2
{-324.0376,-1415.5936,14.2642,119.2693}
};

PlayAnimVGTA(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
    ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}
 
 

new SpawnedZombies=0, IsAZombie[MAX_PLAYERS], Text3D:ZombieLabel[MAX_PLAYERS], Timer:ZombieTimer[MAX_PLAYERS], ZombieIsAttack[MAX_PLAYERS];
 
hook OnGameModeInit()
{
    // for( new j = 0 ; j < MAX_ZOMBIES; j++)
    // {
    //     thenpc_ = -1;
    // }
    
    for(new i = 0 ; i < MAX_PLAYERS; i++)
    {
        PickupZombie[i] = -1;
        PickupZombieLoai[i] = -1;
    }
    ZombiesTimer = SetTimer("CreateZombies", 50, true);
}
// CMD:taozombie(playerid, params[])
// {
//     if(PlayerInfo[playerid][pAdmin] > 4)
//     {
//         ZombiesTimer = SetTimer("CreateZombies", 50, true);
//         for(new i = 0 ; i < MAX_PLAYERS; i++)
//         {
//             PickupZombie[i] = -1;
//             PickupZombieLoai[i] = -1;
//         }

//     }
//     return 1;
// }
 
forward CreateZombies();
public CreateZombies()
{  
    new str[50]; //objects[7];
    new Random = random(sizeof(ZombieSpawnsvgta));
    new Randomx = random(35);
    new Randomy = random(35);
    if(SpawnedZombies < MAX_ZOMBIES)
    {
      
        new thenpc_;
        format(str,sizeof(str),"Zombie%d",MAX_PLAYERS-(SpawnedZombies));
        thenpc_ = FCNPC_Create(str);
        ZombieLabel[thenpc_] = Create3DTextLabel("[Zombie Covid-19]\n{ff0000}Health:{ffffff} 1500", -1, 30.0, 40.0, 50.0, 60.0, -1, 0);
        Attach3DTextLabelToPlayer(ZombieLabel[thenpc_], thenpc_, 0.0, 0.0, 0.4);    
        FCNPC_Spawn(thenpc_,162,ZombieSpawnsvgta[Random][0]+Randomx,ZombieSpawnsvgta[Random][1]+Randomy,ZombieSpawnsvgta[Random][2]);
        // printf("FCNPC_Spawn"); 
        FCNPC_SetWeapon(thenpc_, 1);
        FCNPC_SetHealth(thenpc_, 1500);
        // printf("FCNPC_SetHealth"); 
        ZombieTimer[thenpc_] = repeat ZombieMove(thenpc_);
        SetPlayerColor(thenpc_,0x000000AA);
        IsAZombie[thenpc_] = 1;
        SpawnedZombies++;
        // printf("SpawnedZombies++"); 
        return 1;
    }
    else
    {
        KillTimer(ZombiesTimer);
        printf("Zombies creation done!");      
    }
    return 1;
}
public FCNPC_OnDeath(npcid, killerid, reason)
{
    ZombieIsAttack[npcid] = 0;
    GameTextForPlayer(killerid, "Zombie killed!", 3000, 4);
    SendClientMessage(killerid, -1, "{ac87e7}Ban da giet chet 1 con zombie Covid-19!");
    PlayAnimVGTA(npcid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
    SetTimerEx("OnPlayerKillZombie", 300000, 0, "ii",killerid,npcid);
    new string[128];
    format(string, sizeof(string), "%s vua giet chet 1 con zombie Covid-19", GetPlayerNameEx(killerid));
    SetPlayerChatBubble(killerid, string, 0x6ee7ffff, 30.0, 10000);
    // CallLocalFunction("OnPlayerKillZombie","ii",killerid,npcid);
    new Float:x, Float:y, Float:z;
    GetPlayerPos(npcid, x, y, z);
    for(new i = 0 ; i < MAX_PLAYERS; i++)
    {
        if(PickupZombie[i] == -1)
        {
            new rand = random(200);
            switch(rand)
            {
                case 0..40: 
                {
                    PickupZombie[i] = CreatePickup(1212, 1, x, y, z, 0);//tien
                    PickupZombieLoai[i] = 0;
                }
                case 41..80: 
                {
                    PickupZombie[i] = CreatePickup(1240, 1, x, y, z, 0);//mau
                    PickupZombieLoai[i] = 1;
                }
                case 81..120: 
                {
                    PickupZombie[i] = CreatePickup(1242, 1, x, y, z, 0);//giap
                    PickupZombieLoai[i] = 2;
                }
                case 121..160: 
                {
                    PickupZombie[i] = CreatePickup(1220, 1, x, y, z, 0);//vatlieu
                    PickupZombieLoai[i] = 3;
                }
                case 161..171:
                {
                    PickupZombie[i] = CreatePickup(353, 1, x, y, z, 0);//mp5
                    PickupZombieLoai[i] = 4;
                }
                case 172..182: 
                {
                    PickupZombie[i] = CreatePickup(349, 1, x, y, z, 0);//shotgun
                    PickupZombieLoai[i] = 5;
                }
                case 183..188: 
                {
                    PickupZombie[i] = CreatePickup(11738, 1, x, y, z, 0);//tui cuu thuong
                    PickupZombieLoai[i] = 6;
                }
                case 189..193: 
                {
                    PickupZombie[i] = CreatePickup(1247, 1, x, y, z, 0);//ngoi sao
                    PickupZombieLoai[i] = 7;
                }
                case 194..197: 
                {
                    PickupZombie[i] = CreatePickup(19998, 1, x, y, z, 0);//hotquet
                    PickupZombieLoai[i] = 8;
                }
                case 198: 
                {
                    PickupZombie[i] = CreatePickup(355, 1, x, y, z, 0);//ak47
                    PickupZombieLoai[i] = 9;
                }
                case 199: 
                {
                    PickupZombie[i] = CreatePickup(19793, 1, x, y, z, 0);//cui kho
                    PickupZombieLoai[i] = 10;
                }
                default:
                {
                    PickupZombie[i] = CreatePickup(1212, 1, x, y, z, 0);//tien
                    PickupZombieLoai[i] = 0;
                }

            }
            
            return 1;
        }
        
    }
    
    
    return 1;
}
public FCNPC_OnTakeDamage(npcid, issuerid, Float:amount, weaponid, bodypart)
{
    new str[128];
    format(str, sizeof str, "[Zombie Covid-19]\n{ff0000}Health: {ffffff}%.2f",FCNPC_GetHealth(npcid));
    Update3DTextLabelText(ZombieLabel[npcid], -1, str);
    if(ZombieIsAttack[npcid] == 0)
    {
        ZombieIsAttack[npcid] = 1;
        FCNPC_GoToPlayerEx(npcid, issuerid,5,5,FCNPC_MOVE_TYPE_RUN);
    }
    if(bodypart == 7 || bodypart == 8)
    {
        new rand = random(2);
        if(rand == 1 && !GetPVarInt(npcid, "DangTe"))
        {
            SetPVarInt(npcid, "DangTe", 1);
            FCNPC_Stop(npcid);
            FCNPC_StopAttack(npcid);
            FCNPC_ApplyAnimation(npcid, "PED", "getup_front", 4.0, 0, 0, 0, 0, 0);
            SetTimerEx("ZombieDungLen", 1000, 0, "ii", npcid, issuerid);
        }
    }
    return 1;
}
forward ZombieDungLen(npcid, issuerid);
public ZombieDungLen(npcid, issuerid)
{
    DeletePVar(npcid, "DangTe");
    ZombieIsAttack[npcid] = 1;
    FCNPC_GoToPlayerEx(npcid, issuerid,5,5,FCNPC_MOVE_TYPE_RUN);
    return 1;
}
public FCNPC_OnGiveDamage(npcid, damagedid, Float:amount, weaponid, bodypart)
{
    new Float:Health, Float:Giap;
    GetPlayerHealth(damagedid, Health);
    GetPlayerArmour(damagedid, Giap);
    if(Giap > 20)
    {
        SetPlayerArmour(damagedid, Giap-20);
    }
    else if(0 < Giap <= 20)
    {
        SetPlayerArmour(damagedid, 0);
    }
    else if(Giap <= 0.0)
    {
        SetPlayerHealth(damagedid, Health-10);
    }
    
    return 1;
}
timer ZombieMove[500](zombieid)
{
    new Float:xa,Float:ya,Float:za;
    if(FCNPC_IsDead(zombieid)) return 1;
    foreach(Player, playerid)
    {
        GetPlayerPos(playerid,xa,ya,za);
        if(IsPlayerInRangeOfPoint(zombieid,1.5,xa,ya,za) && !GetPVarInt(zombieid, "DangTe"))// here playerid not zombieid
        {
            ZombieIsAttack[zombieid] = 2;


            FCNPC_MeleeAttack(zombieid,2000,true);
            break;
        }
        else if(IsPlayerInRangeOfPoint(zombieid,10.0,xa,ya,za) && !GetPVarInt(zombieid, "DangTe"))
        {
            if(ZombieIsAttack[zombieid] == 2)
            {
                FCNPC_Stop(zombieid);
                FCNPC_StopAttack(zombieid);
            }
            ZombieIsAttack[zombieid] = 1;
            FCNPC_GoTo(zombieid,xa,ya,za,FCNPC_MOVE_TYPE_RUN,0.6);
            break;
        }
        else if(IsPlayerInRangeOfPoint(zombieid,30.0,xa,ya,za) && !GetPVarInt(zombieid, "DangTe"))
        {
            if(ZombieIsAttack[zombieid] == 2)
            {
                FCNPC_Stop(zombieid);
                FCNPC_StopAttack(zombieid);
            }
            ZombieIsAttack[zombieid] = 1;
            FCNPC_GoToPlayerEx(zombieid, playerid,5,5,FCNPC_MOVE_TYPE_RUN);
            break;
        }
        else
        {
            ZombieIsAttack[zombieid] = 0;          
        }
    }
    return 1;
}
stock FCNPC_GoToPlayerEx(npcid, playerid, Float:dist, Float:rangle, movetype = FCNPC_MOVE_TYPE_RUN)
{
    new Float:xa, Float:ya, Float:za, Float:fa;
    GetPlayerPos(playerid, xa, ya, za);
    GetPlayerFacingAngle(playerid, fa);
    rangle += fa;
    xa = (xa + dist * floatsin(-rangle,degrees));
    ya = (ya + dist * floatcos(-rangle,degrees));
    FCNPC_GoTo(npcid,xa,ya,za,movetype,0.7);
    return 1;
}
forward OnPlayerKillZombie(playerid, zombieid);
public OnPlayerKillZombie(playerid,zombieid)
{
    FCNPC_Respawn(zombieid);
    
           
    return 1;
}
public FCNPC_OnRespawn(npcid)
{
    new Random = random(sizeof(ZombieSpawnsvgta));
    new Randomx = random(8);
    new Randomy = random(8);
    FCNPC_SetWeapon(npcid,1);
    FCNPC_ApplyAnimation(npcid, "PED", "WALK_DRUNK", 4.1, 1, 1,  1,  0,  0);   
    FCNPC_SetAmmo(npcid,1);
    FCNPC_SetPosition(npcid,ZombieSpawnsvgta[Random][0]+Randomx,ZombieSpawnsvgta[Random][1]+Randomy,ZombieSpawnsvgta[Random][2]);
    FCNPC_SetHealth(npcid, 1500);
    return 1;
}
hook OnPlayerPickUpPickup(playerid, pickupid)
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(pickupid == PickupZombie[i])
        {
            if(PickupZombieLoai[i] == 0)//tien
            {
                DestroyPickup(PickupZombie[i]);
                new rand = random(2000)+1000;
                GivePlayerCash(playerid, rand);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                new string[128];
                format(string, sizeof(string), "Ban nhan duoc %d$ tu viec giet chet zombie Covid-19 .",rand);
                SendClientMessage(playerid, 0xe3844dFF, string);
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua nhat duoc %d$ tu xac Zombie Covid-19.", GetPlayerNameEx(playerid), rand);
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                return 1;
            }
            else if(PickupZombieLoai[i] == 1)//mau
            {
                DestroyPickup(PickupZombie[i]);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                new Float:health;
                GetPlayerHealth(playerid, health);
                if(health >= 80)
                {
                    SetPlayerHealth(playerid, 99);
                }
                else
                {
                    SetPlayerHealth(playerid, health+20);
                }
                SendClientMessage(playerid, 0xe3844dFF, "Ban nhan duoc 20HP tu viet giet Zombie Covid-19");
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua duoc hoi phuc 20 HP tu xac Zombie Covid-19.", GetPlayerNameEx(playerid));
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            }
            else if(PickupZombieLoai[i] == 2)//giap
            {
                DestroyPickup(PickupZombie[i]);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                
                new Float:armour;
                GetPlayerArmour(playerid, armour);
                if(armour >= 80)
                {
                    SetPlayerArmour(playerid, 99);
                }
                else
                {
                    SetPlayerArmour(playerid, armour+20);
                }
                SendClientMessage(playerid, 0xe3844dFF, "Ban nhan duoc 20 Giap tu viet giet Zombie Covid-19");
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua duoc 20 GIAP tu xac Zombie Covid-19.", GetPlayerNameEx(playerid));
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
            }
            else if(PickupZombieLoai[i] == 3)//vat lieu
            {
                DestroyPickup(PickupZombie[i]);
                new rand = random(200)+100;
                PlayerInfo[playerid][pMats] += rand;
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                
                new string[128];
                format(string, sizeof(string), "Ban nhan duoc %d vat lieu tu viec giet chet zombie Covid-19 .",rand);
                SendClientMessage(playerid, 0xe3844dFF, string);
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua nhat duoc %d vat lieu tu xac Zombie Covid-19.", GetPlayerNameEx(playerid), rand);
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                return 1;
            }
            else if(PickupZombieLoai[i] == 4)//mp5
            {
                DestroyPickup(PickupZombie[i]);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                
                AddItem(playerid, 32900, 1);
                new string[128];
                format(string, sizeof(string), "Ban nhan duoc 1 khau MP5 tu viec giet chet zombie Covid-19, hay kiem tra tui do H .");
                SendClientMessage(playerid, 0xe3844dFF, string);
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua nhat duoc 1 khau MP5 tu xac Zombie Covid-19.", GetPlayerNameEx(playerid));
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                return 1;
            }
            else if(PickupZombieLoai[i] == 5)//shotgun
            {
                DestroyPickup(PickupZombie[i]);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                
                AddItem(playerid, 32500, 1);
                new string[128];
                format(string, sizeof(string), "Ban nhan duoc 1 khau Shotgun tu viec giet chet zombie Covid-19, hay kiem tra tui do H .");
                SendClientMessage(playerid, 0xe3844dFF, string);
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua nhat duoc 1 khau Shotgun tu xac Zombie Covid-19.", GetPlayerNameEx(playerid));
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                return 1;
            }
            else if(PickupZombieLoai[i] == 6)//tui cuu thuong
            {
                DestroyPickup(PickupZombie[i]);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
               
                AddItem(playerid, 50002, 1);
                new string[128];
                format(string, sizeof(string), "Ban nhan duoc 1 tui cuu thuong tu viec giet chet zombie Covid-19, hay kiem tra tui do H .");
                SendClientMessage(playerid, 0xe3844dFF, string);
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua nhat duoc 1 tui cuu thuong tu xac Zombie Covid-19.", GetPlayerNameEx(playerid));
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                return 1;
            }
            else if(PickupZombieLoai[i] == 7)//ngoi sao
            {
                DestroyPickup(PickupZombie[i]);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                
                AddItem(playerid, 50008, 1);
                new string[128];
                format(string, sizeof(string), "Ban nhan duoc 1 NGOI SAO rua toi tu viec giet chet zombie Covid-19, hay kiem tra tui do H .");
                SendClientMessage(playerid, 0xe3844dFF, string);
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua nhat duoc 1 NGOI SAO rua toi tu xac Zombie Covid-19.", GetPlayerNameEx(playerid));
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                return 1;
            }
            else if(PickupZombieLoai[i] == 8)//hot quet
            {
                DestroyPickup(PickupZombie[i]);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                
                AddItem(playerid, 50012, 1);
                new string[128];
                format(string, sizeof(string), "Ban nhan duoc 1 HOP QUET tu viec giet chet zombie Covid-19, hay kiem tra tui do H .");
                SendClientMessage(playerid, 0xe3844dFF, string);
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua nhat duoc 1 HOP QUET tu xac Zombie Covid-19.", GetPlayerNameEx(playerid));
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                return 1;
            }
            else if(PickupZombieLoai[i] == 9)//ak
            {
                DestroyPickup(PickupZombie[i]);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                
                AddItem(playerid, 33000, 1);
                new string[128];
                format(string, sizeof(string), "Ban nhan duoc 1 khau AK-47 tu viec giet chet zombie Covid-19, hay kiem tra tui do H .");
                SendClientMessage(playerid, 0xe3844dFF, string);
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua nhat duoc 1 khau AK-47 tu xac Zombie Covid-19.", GetPlayerNameEx(playerid));
                ProxDetector(100.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                return 1;
            }
             else if(PickupZombieLoai[i] == 10)//cui kho
             {
                DestroyPickup(PickupZombie[i]);
                PickupZombie[i] = -1;
                PickupZombieLoai[i] = -1;
                
                AddItem(playerid, 50011, 1);
                new string[128];
                format(string, sizeof(string), "Ban nhan duoc 1 canh cui kho tu viec giet chet zombie Covid-19, hay kiem tra tui do H .");
                SendClientMessage(playerid, 0xe3844dFF, string);
                new szMessage[128];
                format(szMessage, sizeof(szMessage), "* %s vua nhat duoc 1 canh CUI KHO tu xac Zombie Covid-19.", GetPlayerNameEx(playerid));
                ProxDetector(30.0, playerid, szMessage, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
                return 1;
            }
           
        }
    }
    
    return 1;
}
public FCNPC_OnUpdate(npcid)
{
    FCNPC_GetPosition(npcid, posNPC[0][npcid], posNPC[1][npcid], posNPC[2][npcid]);
    MapAndreas_FindZ_For2DCoord(posNPC[0][npcid], posNPC[1][npcid], posNPC[2][npcid]);
    FCNPC_SetPosition(npcid, posNPC[0][npcid], posNPC[1][npcid], posNPC[2][npcid]+1);

    return 1;
 }