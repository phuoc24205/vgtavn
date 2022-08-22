#include <YSI\y_hooks>

new babikung_Object[85];
new hqAnhYang_Object[57];
new babikunbosung_Object[23];
new HQTruongTriThuan_Object[24];
new hqRin_Object[52];
new Babikunnhatrendoi_Object[51];
new MapBabikun_fix_Object[25];
new hqcuaMarcu_Object[25];
new Kevinn_Object[26];

hook OnGameModeInit()
{
	//babikun
	babikung_Object[0] = CreateDynamicObject(19447, 1010.7618, -823.5474, 94.4172, 0.0000, 90.0000, 28.5000); //wall087
	babikung_Object[1] = CreateDynamicObject(970, 1008.1815, -848.2463, 95.0112, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[2] = CreateDynamicObject(970, 981.3572, -846.3952, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[3] = CreateDynamicObject(970, 987.2501, -857.2492, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[4] = CreateDynamicObject(970, 985.2836, -853.6282, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[5] = CreateDynamicObject(970, 983.3080, -849.9898, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[6] = CreateDynamicObject(970, 990.0395, -858.0709, 95.0112, 0.0000, 0.0000, 28.1999); //fencesmallb
	babikung_Object[7] = CreateDynamicObject(970, 993.6887, -856.1140, 95.0112, 0.0000, 0.0000, 28.1999); //fencesmallb
	babikung_Object[8] = CreateDynamicObject(970, 997.3015, -854.1541, 95.0112, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[9] = CreateDynamicObject(970, 1000.9401, -852.1787, 95.0112, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[10] = CreateDynamicObject(970, 1004.5609, -850.2124, 95.0112, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[11] = CreateDynamicObject(970, 1011.8374, -846.2612, 95.0112, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[12] = CreateDynamicObject(970, 1015.4229, -844.3144, 95.0112, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[13] = CreateDynamicObject(970, 1020.2655, -841.6857, 95.0112, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[14] = CreateDynamicObject(970, 1018.4287, -842.6832, 95.0112, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[15] = CreateDynamicObject(970, 1021.0684, -838.8881, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[16] = CreateDynamicObject(970, 1019.1026, -835.2675, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[17] = CreateDynamicObject(970, 1017.1363, -831.6467, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[18] = CreateDynamicObject(970, 1015.5474, -828.7201, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[19] = CreateDynamicObject(970, 996.7689, -846.6364, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[20] = CreateDynamicObject(19447, 1006.2671, -815.2692, 94.4172, 0.0000, 90.0000, 28.5000); //wall087
	babikung_Object[21] = CreateDynamicObject(19447, 1000.8952, -818.5336, 93.0347, -17.0000, 90.0000, 117.2999); //wall087
	babikung_Object[22] = CreateDynamicObject(19447, 1002.4140, -821.4743, 93.0347, -17.0000, 90.0000, 117.2999); //wall087
	babikung_Object[23] = CreateDynamicObject(970, 1013.5950, -825.1254, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[24] = CreateDynamicObject(970, 1011.6382, -821.5219, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[25] = CreateDynamicObject(970, 1009.6720, -817.9011, 95.0112, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[26] = CreateDynamicObject(2311, 1003.3359, -838.5254, 98.8185, 0.0000, 0.0000, 28.0999); //CJ_TV_TABLE2
	babikung_Object[27] = CreateDynamicObject(970, 1014.9528, -836.7636, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[28] = CreateDynamicObject(970, 1011.2880, -838.7534, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[29] = CreateDynamicObject(970, 1007.6582, -840.7243, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[30] = CreateDynamicObject(970, 1004.0373, -842.6903, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[31] = CreateDynamicObject(970, 1000.3900, -844.6704, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[32] = CreateDynamicObject(970, 995.7407, -847.1944, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[33] = CreateDynamicObject(970, 992.8908, -846.1979, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[34] = CreateDynamicObject(970, 990.8582, -842.4544, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[35] = CreateDynamicObject(970, 979.0219, -843.8961, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[36] = CreateDynamicObject(970, 977.0418, -840.2486, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[37] = CreateDynamicObject(970, 975.1854, -836.8301, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[38] = CreateDynamicObject(970, 1015.7735, -833.9564, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[39] = CreateDynamicObject(970, 1013.8026, -830.3267, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[40] = CreateDynamicObject(970, 1011.8320, -826.6969, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[41] = CreateDynamicObject(970, 1009.8422, -823.0325, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[42] = CreateDynamicObject(970, 1007.8472, -819.3590, 99.3812, 0.0000, 0.0000, 118.4999); //fencesmallb
	babikung_Object[43] = CreateDynamicObject(970, 976.0236, -834.0379, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[44] = CreateDynamicObject(970, 984.8388, -829.2521, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[45] = CreateDynamicObject(970, 987.8406, -841.4473, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[46] = CreateDynamicObject(970, 981.8378, -844.7064, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[47] = CreateDynamicObject(970, 984.9663, -843.0078, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[48] = CreateDynamicObject(970, 988.4863, -827.2720, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[49] = CreateDynamicObject(970, 992.1510, -825.2821, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[50] = CreateDynamicObject(970, 995.7806, -823.3113, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[51] = CreateDynamicObject(970, 999.3928, -821.3500, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[52] = CreateDynamicObject(970, 1003.0139, -819.3839, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[53] = CreateDynamicObject(970, 1005.0178, -818.2960, 99.3812, 0.0000, 0.0000, 28.4999); //fencesmallb
	babikung_Object[54] = CreateDynamicObject(19376, 1009.8700, -834.0667, 98.7890, 0.0000, 90.0000, 28.4000); //wall024
	babikung_Object[55] = CreateDynamicObject(19608, 997.0048, -825.2958, 98.8617, 0.0000, 0.0000, 28.4999); //WoodenStage1
	babikung_Object[56] = CreateDynamicObject(19376, 996.2711, -841.4198, 98.7890, 0.0000, 90.0000, 28.4000); //wall024
	babikung_Object[57] = CreateDynamicObject(19376, 1003.6076, -837.4531, 98.8191, 0.0000, 90.0000, 28.4000); //wall024
	babikung_Object[58] = CreateDynamicObject(1727, 1004.4704, -840.2381, 98.6447, 0.0000, 0.0000, -165.3999); //mrk_seating2b
	babikung_Object[59] = CreateDynamicObject(1726, 1002.2456, -837.1085, 98.6422, 0.0000, 0.0000, 28.3000); //mrk_seating2
	babikung_Object[60] = CreateDynamicObject(1727, 1006.3689, -838.8949, 98.6447, 0.0000, 0.0000, -139.0998); //mrk_seating2b
	babikung_Object[61] = CreateDynamicObject(19376, 1005.3131, -825.6401, 98.7890, 0.0000, 90.0000, 28.4000); //wall024
	babikung_Object[62] = CreateDynamicObject(19376, 996.0853, -830.6292, 98.7890, 0.0000, 90.0000, 28.4000); //wall024
	babikung_Object[63] = CreateDynamicObject(19376, 986.8660, -835.6130, 98.7890, 0.0000, 90.0000, 28.4000); //wall024
	babikung_Object[64] = CreateDynamicObject(19376, 981.9313, -838.2816, 98.8090, 0.0000, 90.0000, 28.4000); //wall024
	babikung_Object[65] = CreateDynamicObject(870, 1005.3253, -838.6809, 103.0517, 0.0000, 0.0000, 74.6000); //veg_Pflowers2wee
	babikung_Object[66] = CreateDynamicObject(19609, 996.0292, -826.6018, 98.8881, 0.0000, 0.0000, 30.0000); //DrumKit1
	babikung_Object[67] = CreateDynamicObject(19157, 1004.1305, -838.2614, 100.1688, 0.0000, 0.0000, 28.2999); //MetalLightBars1
	babikung_Object[68] = CreateDynamicObject(11686, 1012.7486, -829.0969, 98.8127, 0.0000, 0.0000, -61.5999); //CBarSection1
	babikung_Object[69] = CreateDynamicObject(870, 1002.7413, -837.9689, 103.0517, 0.0000, 0.0000, 74.6000); //veg_Pflowers2wee
	babikung_Object[70] = CreateDynamicObject(870, 1004.4277, -836.8569, 103.0517, 0.0000, 0.0000, 74.6000); //veg_Pflowers2wee
	babikung_Object[71] = CreateDynamicObject(870, 1003.6790, -839.5755, 103.0517, 0.0000, 0.0000, 74.6000); //veg_Pflowers2wee
	babikung_Object[72] = CreateDynamicObject(1568, 994.0497, -847.8401, 98.8536, 0.0000, 0.0000, 28.6000); //chinalamp_sf
	babikung_Object[73] = CreateDynamicObject(1568, 1016.4824, -835.6096, 98.8536, 0.0000, 0.0000, 28.6000); //chinalamp_sf
	babikung_Object[74] = CreateDynamicObject(1568, 1006.7120, -817.6901, 98.8536, 0.0000, 0.0000, 28.6000); //chinalamp_sf
	babikung_Object[75] = CreateDynamicObject(1568, 989.4019, -840.2146, 98.8536, 0.0000, 0.0000, 28.6000); //chinalamp_sf
	babikung_Object[76] = CreateDynamicObject(19841, 994.6390, -857.8823, 81.1809, 0.0000, 0.0000, 19.6999); //WaterFall2
	babikung_Object[77] = CreateDynamicObject(1723, 1013.3821, -836.1909, 98.8010, 0.0000, 0.0000, 28.6999); //mrk_seating1
	babikung_Object[78] = CreateDynamicObject(1723, 994.5762, -846.4871, 98.8010, 0.0000, 0.0000, 28.6999); //mrk_seating1
	babikung_Object[79] = CreateDynamicObject(19604, 988.0257, -853.4060, 94.5076, 0.0000, 0.0000, -151.4999); //WaterPlane2
	babikung_Object[80] = CreateDynamicObject(19604, 992.4025, -851.0294, 94.5076, 0.0000, 0.0000, -151.4999); //WaterPlane2
	babikung_Object[81] = CreateDynamicObject(19604, 983.2448, -844.5997, 94.5076, 0.0000, 0.0000, -151.4999); //WaterPlane2
	babikung_Object[82] = CreateDynamicObject(19604, 987.6497, -842.2759, 94.5076, 0.0000, 0.0000, -151.4999); //WaterPlane2
	babikung_Object[83] = CreateDynamicObject(3471, 985.0577, -842.8017, 95.5533, 0.0000, 0.0000, -61.3999); //vgschinalion1
	babikung_Object[84] = CreateDynamicObject(18738, 985.2654, -843.1901, 94.3048, 38.9000, 0.0000, 27.5000); //water_fnt_tme

	

	babikunbosung_Object[0] = CreateDynamicObject(3515, 993.2529, -836.0750, 98.2350, 0.0000, 0.0000, 0.0000); //vgsfountain
	babikunbosung_Object[1] = CreateDynamicObject(869, 993.1159, -836.0946, 99.6557, 0.0000, 0.0000, 0.0000); //veg_Pflowerswee
	babikunbosung_Object[2] = CreateDynamicObject(1361, 991.9780, -833.7509, 99.6103, 0.0000, 0.0000, 28.2999); //CJ_BUSH_PROP2
	babikunbosung_Object[3] = CreateDynamicObject(1814, 1005.6721, -826.8167, 98.8255, 0.0000, 0.0000, 0.0000); //COFFEE_MED_1
	babikunbosung_Object[4] = CreateDynamicObject(1361, 990.9243, -837.3845, 99.6103, 0.0000, 0.0000, 28.2999); //CJ_BUSH_PROP2
	babikunbosung_Object[5] = CreateDynamicObject(1361, 995.5557, -834.8908, 99.6103, 0.0000, 0.0000, 28.2999); //CJ_BUSH_PROP2
	babikunbosung_Object[6] = CreateDynamicObject(1361, 994.4240, -838.2946, 99.6103, 0.0000, 0.0000, 28.2999); //CJ_BUSH_PROP2
	babikunbosung_Object[7] = CreateDynamicObject(638, 995.3142, -836.6826, 99.5009, 0.0000, 0.0000, -17.2000); //kb_planter+bush
	babikunbosung_Object[8] = CreateDynamicObject(638, 991.0299, -835.2722, 99.5009, 0.0000, 0.0000, -17.2000); //kb_planter+bush
	babikunbosung_Object[9] = CreateDynamicObject(638, 993.9528, -833.9918, 99.5009, 0.0000, 0.0000, 69.1999); //kb_planter+bush
	babikunbosung_Object[10] = CreateDynamicObject(638, 992.3331, -838.2548, 99.5009, 0.0000, 0.0000, 69.1999); //kb_planter+bush
	babikunbosung_Object[11] = CreateDynamicObject(3004, 1007.6934, -833.8140, 99.7628, 0.0000, 0.0000, 0.0000); //k_poolq2
	babikunbosung_Object[12] = CreateDynamicObject(1723, 1003.4451, -826.2706, 98.8609, 0.0000, 0.0000, 62.8998); //mrk_seating1
	babikunbosung_Object[13] = CreateDynamicObject(1724, 1008.4663, -824.8510, 98.8337, 0.0000, 0.0000, -74.1999); //mrk_seating1b
	babikunbosung_Object[14] = CreateDynamicObject(1724, 1005.8930, -828.6644, 98.8106, 0.0000, 0.0000, 161.1999); //mrk_seating1b
	babikunbosung_Object[15] = CreateDynamicObject(1670, 1005.8972, -826.5654, 99.3783, 0.0000, 0.0000, 0.0000); //propcollecttable
	babikunbosung_Object[16] = CreateDynamicObject(2964, 1010.3504, -831.7600, 98.8615, 0.0000, 0.0000, -61.5999); //k_pooltablesm
	babikunbosung_Object[17] = CreateDynamicObject(2964, 1007.7827, -833.1494, 98.8615, 0.0000, 0.0000, -61.5999); //k_pooltablesm
	babikunbosung_Object[18] = CreateDynamicObject(338, 1010.5703, -830.8259, 99.1269, 0.0000, 0.0000, 0.0000); //poolcue
	babikunbosung_Object[19] = CreateDynamicObject(1824, 1009.2006, -836.2969, 99.4114, 0.0000, 0.0000, 28.3999); //craps_table
	babikunbosung_Object[20] = CreateDynamicObject(2779, 1007.7166, -820.3342, 98.8338, 0.0000, 0.0000, -62.7000); //CJ_COIN_OP_2
	babikunbosung_Object[21] = CreateDynamicObject(2779, 1008.4682, -821.8369, 98.8338, 0.0000, 0.0000, -62.7000); //CJ_COIN_OP_2
	babikunbosung_Object[22] = CreateDynamicObject(1896, 993.8242, -841.6218, 99.7654, 0.0000, 0.0000, 0.0000); //wheel_table

	// 
	hqAnhYang_Object[0] = CreateDynamicObject(12839, 2526.6567, -1685.5987, 15.5947, 0.0000, 0.0000, 90.5998); //cos_sbanksteps02
	hqAnhYang_Object[1] = CreateDynamicObject(3583, 2451.7285, -1638.1286, 15.4043, 0.0999, 0.0000, 179.8999); //compbigho3_LAe
	hqAnhYang_Object[2] = CreateDynamicObject(19375, 2527.9040, -1678.4018, 18.7782, 0.0000, 90.3000, -0.1000); //wall023
	hqAnhYang_Object[3] = CreateDynamicObject(19433, 2529.8967, -1671.9176, 20.2007, 89.8999, 89.8999, 0.0000); //wall073
	hqAnhYang_Object[4] = CreateDynamicObject(16151, 2530.9482, -1673.0395, 19.1868, 0.0000, 0.0000, 89.9999); //ufo_bar
	hqAnhYang_Object[5] = CreateDynamicObject(19375, 2532.8835, -1678.4355, 18.7968, 0.0000, 90.0000, -0.3000); //wall023
	hqAnhYang_Object[6] = CreateDynamicObject(19375, 2527.8625, -1676.7042, 18.7992, 0.0000, 90.1998, -0.3998); //wall023
	hqAnhYang_Object[7] = CreateDynamicObject(19381, 2434.9135, -1643.6972, 12.4337, -0.1000, -90.5000, -89.7998); //wall029
	hqAnhYang_Object[8] = CreateDynamicObject(3660, 2485.5676, -1652.3802, 13.7974, 0.0000, 0.0000, 0.0000); //lasairfbed_LAS
	hqAnhYang_Object[9] = CreateDynamicObject(19375, 2532.8896, -1676.7772, 18.8092, 0.0000, 89.9999, 0.0000); //wall023
	hqAnhYang_Object[10] = CreateDynamicObject(1723, 2523.1833, -1682.7517, 18.8507, 0.0000, 0.0000, 89.2998); //mrk_seating1
	hqAnhYang_Object[11] = CreateDynamicObject(1215, 2425.3591, -1642.6258, 13.9108, 0.0000, 0.0000, 0.0000); //bollardlight
	hqAnhYang_Object[12] = CreateDynamicObject(19632, 2430.3706, -1675.5087, 13.4728, 0.0000, 0.0000, 0.0000); //FireWood1
	hqAnhYang_Object[13] = CreateDynamicObject(1711, 2427.8208, -1673.3432, 12.6532, 0.0000, 0.0000, 55.7998); //kb_chair01
	hqAnhYang_Object[14] = CreateDynamicObject(1723, 2523.2255, -1678.8879, 18.8507, 0.0000, 0.0000, 89.8000); //mrk_seating1
	hqAnhYang_Object[15] = CreateDynamicObject(19865, 2418.8159, -1668.9552, 11.7044, 0.0000, 0.0000, -89.9000); //MIFenceWood1
	hqAnhYang_Object[16] = CreateDynamicObject(19609, 2536.9267, -1676.8620, 18.8859, -0.2998, 0.0000, -72.6998); //DrumKit1
	hqAnhYang_Object[17] = CreateDynamicObject(18665, 2431.0783, -1680.9626, 15.8694, 0.0000, 0.0000, -89.9000); //SprayTag7
	hqAnhYang_Object[18] = CreateDynamicObject(18665, 2422.9594, -1682.2602, 14.0375, 0.0000, 0.0000, 0.0000); //SprayTag7
	hqAnhYang_Object[19] = CreateDynamicObject(1746, 2523.1987, -1679.7822, 18.8784, 0.0000, 0.0000, 0.0000); //SWANK_1_FootStool
	hqAnhYang_Object[20] = CreateDynamicObject(1728, 2430.1464, -1672.3028, 12.5978, 0.0000, 0.0000, -8.3999); //mrk_seating3
	hqAnhYang_Object[21] = CreateDynamicObject(1433, 2524.9995, -1677.9100, 19.0960, 0.0000, 0.0000, 0.0000); //DYN_TABLE_1
	hqAnhYang_Object[22] = CreateDynamicObject(19865, 2441.1132, -1668.8568, 11.6872, 0.0000, 0.0000, 90.4999); //MIFenceWood1
	hqAnhYang_Object[23] = CreateDynamicObject(1670, 2523.2353, -1679.7531, 19.3974, 0.0000, 0.0000, -79.3999); //propcollecttable
	hqAnhYang_Object[24] = CreateDynamicObject(2676, 2430.6413, -1676.9748, 12.8758, 0.0000, 0.3999, -175.3000); //PROC_RUBBISH_8
	hqAnhYang_Object[25] = CreateDynamicObject(1433, 2524.9721, -1681.7470, 19.0660, 0.0000, 0.0000, 0.0000); //DYN_TABLE_1
	hqAnhYang_Object[26] = CreateDynamicObject(632, 2522.1081, -1672.3408, 19.3218, 0.0000, 0.0000, 173.3999); //veg_palmkb7
	hqAnhYang_Object[27] = CreateDynamicObject(19381, 2427.3588, -1634.6383, 12.3996, 0.0999, -89.8000, 0.0000); //wall029
	hqAnhYang_Object[28] = CreateDynamicObject(19381, 2434.2207, -1634.6363, 12.3809, 0.0000, 89.9999, 0.0000); //wall029
	hqAnhYang_Object[29] = CreateDynamicObject(2670, 2429.9848, -1674.5260, 12.7932, 0.0000, 0.0000, 169.2999); //PROC_RUBBISH_1
	hqAnhYang_Object[30] = CreateDynamicObject(19157, 2535.7807, -1678.1407, 20.2495, 0.0000, 0.0000, 0.0000); //MetalLightBars1
	hqAnhYang_Object[31] = CreateDynamicObject(1728, 2428.1376, -1677.6859, 12.6379, 0.0000, 0.0000, 117.2998); //mrk_seating3
	hqAnhYang_Object[32] = CreateDynamicObject(19865, 2443.5764, -1671.3144, 11.6954, 0.0000, 0.0000, 0.0000); //MIFenceWood1
	hqAnhYang_Object[33] = CreateDynamicObject(19865, 2436.1022, -1668.9056, 11.6794, 0.0000, 0.0000, -89.6998); //MIFenceWood1
	hqAnhYang_Object[34] = CreateDynamicObject(1728, 2434.0202, -1676.6811, 12.6696, 0.0000, 0.0000, -118.9998); //mrk_seating3
	hqAnhYang_Object[35] = CreateDynamicObject(1509, 2432.1506, -1673.8739, 12.8541, 0.0000, 0.0000, 0.0000); //DYN_WINE_3
	hqAnhYang_Object[36] = CreateDynamicObject(19611, 2534.7407, -1678.6163, 18.9202, 0.0000, 0.0000, 0.0000); //MicrophoneStand1
	hqAnhYang_Object[37] = CreateDynamicObject(1487, 2432.2165, -1674.2203, 12.7114, -12.5000, 86.7000, -69.9999); //DYN_WINE_1
	hqAnhYang_Object[38] = CreateDynamicObject(2802, 2524.8813, -1674.2092, 19.2376, 0.0000, 0.0000, 144.4001); //castable1
	hqAnhYang_Object[39] = CreateDynamicObject(19865, 2423.8410, -1668.9604, 11.6936, 0.0000, 0.0000, -90.0000); //MIFenceWood1
	hqAnhYang_Object[40] = CreateDynamicObject(19610, 2534.7170, -1678.6170, 20.5748, 22.2999, 0.0000, -91.8000); //Microphone1
	hqAnhYang_Object[41] = CreateDynamicObject(19865, 2443.5732, -1676.2889, 11.6925, 0.0000, 0.0000, 0.0000); //MIFenceWood1
	hqAnhYang_Object[42] = CreateDynamicObject(19865, 2443.5749, -1681.2691, 11.7018, 0.0000, 0.0000, 0.0000); //MIFenceWood1
	hqAnhYang_Object[43] = CreateDynamicObject(19159, 2535.7800, -1678.1081, 22.6091, 0.0000, -0.5000, 0.4999); //MirrorBall1
	hqAnhYang_Object[44] = CreateDynamicObject(19865, 2428.8666, -1668.9284, 11.6828, 0.0000, 0.0000, 90.1998); //MIFenceWood1
	hqAnhYang_Object[45] = CreateDynamicObject(1362, 2430.3757, -1675.5404, 13.3028, 0.0000, 0.0000, 0.0000); //CJ_FIREBIN_(L0)
	hqAnhYang_Object[46] = CreateDynamicObject(19865, 2443.4423, -1686.2652, 11.7141, 0.0000, 0.0000, -2.8998); //MIFenceWood1
	hqAnhYang_Object[47] = CreateDynamicObject(19381, 2427.3134, -1644.2843, 12.4406, -0.4999, -89.9999, 0.0000); //wall029
	hqAnhYang_Object[48] = CreateDynamicObject(1711, 2433.8366, -1674.4768, 12.6798, 0.0000, 0.0000, -69.6999); //kb_chair01
	hqAnhYang_Object[49] = CreateDynamicObject(1711, 2430.5300, -1678.8128, 12.7638, 0.0000, 0.0000, 174.3999); //kb_chair01
	hqAnhYang_Object[50] = CreateDynamicObject(910, 2426.1166, -1680.4079, 13.6710, 0.0000, 0.0000, 179.5997); //BUST_CABINET_4
	hqAnhYang_Object[51] = CreateDynamicObject(3819, 2436.9255, -1644.6542, 13.4799, 0.0000, 0.0000, 0.0000); //bleacher_SFSx
	hqAnhYang_Object[52] = CreateDynamicObject(14781, 2427.6213, -1640.3706, 13.5275, 0.0000, 0.0000, 0.0000); //in_bxing05
	hqAnhYang_Object[53] = CreateDynamicObject(3819, 2436.9091, -1635.4534, 13.4738, 0.0000, 0.0000, 0.0000); //bleacher_SFSx
	hqAnhYang_Object[54] = CreateDynamicObject(1215, 2425.3515, -1637.1831, 13.9248, 0.0000, 0.0000, -40.7999); //bollardlight
	hqAnhYang_Object[55] = CreateDynamicObject(1215, 2430.7602, -1637.2224, 13.9220, 0.0000, 0.0000, 0.0000); //bollardlight
	hqAnhYang_Object[56] = CreateDynamicObject(1215, 2430.7453, -1642.6270, 13.9309, 0.0000, 0.0000, 0.0000); //bollardlight

	HQTruongTriThuan_Object[0] = CreateDynamicObject(3749, 1991.6323, -1725.7500, 18.3126, 0.0000, 0.0000, 90.0000); //ClubGate01_LAx
	HQTruongTriThuan_Object[1] = CreateDynamicObject(986, 1991.5799, -1738.2747, 15.4976, 0.0000, 0.0000, 90.0000); //gate_autoL
	HQTruongTriThuan_Object[2] = CreateDynamicObject(987, 1991.5495, -1714.5606, 14.0975, 0.0000, 0.0000, 180.0000); //elecfence_BAR
	HQTruongTriThuan_Object[3] = CreateDynamicObject(987, 1967.6722, -1742.0899, 14.8585, 0.0000, 0.0000, 0.0000); //elecfence_BAR
	HQTruongTriThuan_Object[4] = CreateDynamicObject(987, 1979.6505, -1742.0847, 14.8685, 0.0000, 0.0000, 0.0000); //elecfence_BAR
	HQTruongTriThuan_Object[5] = CreateDynamicObject(987, 1951.7548, -1742.0963, 14.8385, 0.0000, 0.0000, 0.0000); //elecfence_BAR
	HQTruongTriThuan_Object[6] = CreateDynamicObject(987, 1955.7235, -1742.1010, 14.8585, 0.0000, 0.0000, 0.0000); //elecfence_BAR
	HQTruongTriThuan_Object[7] = CreateDynamicObject(987, 1951.8941, -1718.2620, 14.8487, 0.0000, 0.0000, 270.0000); //elecfence_BAR
	HQTruongTriThuan_Object[8] = CreateDynamicObject(987, 1951.8941, -1714.4390, 14.8487, 0.0000, 0.0000, 270.0000); //elecfence_BAR
	HQTruongTriThuan_Object[9] = CreateDynamicObject(987, 1951.8941, -1730.2342, 14.8487, 0.0000, 0.0000, 270.0000); //elecfence_BAR
	HQTruongTriThuan_Object[10] = CreateDynamicObject(987, 1963.7733, -1714.5660, 14.8475, 0.0000, 0.0000, 180.0000); //elecfence_BAR
	HQTruongTriThuan_Object[11] = CreateDynamicObject(987, 1967.7814, -1714.5660, 14.8475, 0.0000, 0.0000, 180.0000); //elecfence_BAR
	HQTruongTriThuan_Object[12] = CreateDynamicObject(6965, 1955.6707, -1738.7475, 9.6177, 0.0000, 0.0000, 0.0000); //venefountain02
	HQTruongTriThuan_Object[13] = CreateDynamicObject(19129, 1962.9172, -1731.2844, 14.9648, 0.0000, 0.0000, 0.0000); //DanceFloor2
	HQTruongTriThuan_Object[14] = CreateDynamicObject(14608, 1965.3914, -1739.2412, 15.9726, 0.0000, 0.0000, -44.9999); //triad_buddha01
	HQTruongTriThuan_Object[15] = CreateDynamicObject(16151, 1954.0998, -1730.6467, 15.3618, 0.0000, 0.0000, 180.0000); //ufo_bar
	HQTruongTriThuan_Object[16] = CreateDynamicObject(1723, 1956.6947, -1721.7900, 15.0356, 0.0000, 0.0000, 0.0000); //mrk_seating1
	HQTruongTriThuan_Object[17] = CreateDynamicObject(1723, 1958.6966, -1724.5502, 15.0356, 0.0000, 0.0000, 180.0000); //mrk_seating1
	HQTruongTriThuan_Object[18] = CreateDynamicObject(2315, 1956.9552, -1723.1638, 15.0363, 0.0000, 0.0000, 0.0000); //CJ_TV_TABLE4
	HQTruongTriThuan_Object[19] = CreateDynamicObject(3811, 1955.2740, -1738.8265, 15.3051, 0.0000, 0.0000, 0.0000); //sfx_winplant08
	HQTruongTriThuan_Object[20] = CreateDynamicObject(3811, 1955.9847, -1738.8265, 15.3051, 0.0000, 0.0000, 0.0000); //sfx_winplant08
	HQTruongTriThuan_Object[21] = CreateDynamicObject(2778, 1978.5091, -1725.0491, 14.9206, 0.0000, 0.0000, 0.0000); //CJ_COIN_OP_1
	HQTruongTriThuan_Object[22] = CreateDynamicObject(2779, 1976.7415, -1725.0266, 14.9206, 0.0000, 0.0000, 0.0000); //CJ_COIN_OP_2
	HQTruongTriThuan_Object[23] = CreateDynamicObject(9482, 1994.1081, -1725.5218, 18.7903, 0.0000, 0.0000, 0.0000); //chinagate

	hqRin_Object[0] = CreateDynamicObject(19859, 227.1997, -1405.3936, 51.8757, 0.0000, 0.0000, -31.2000); //MIHouse1Door3
	hqRin_Object[1] = CreateDynamicObject(3515, 212.1450, -1399.6872, 49.7352, 0.0000, 0.0000, 0.0000); //vgsfountain
	hqRin_Object[2] = CreateDynamicObject(1724, 196.8018, -1395.9339, 48.9958, 0.0000, 0.0000, 122.3999); //mrk_seating1b
	hqRin_Object[3] = CreateDynamicObject(1361, 211.3294, -1397.3001, 50.8666, 0.0000, 0.0000, 0.0000); //CJ_BUSH_PROP2
	hqRin_Object[4] = CreateDynamicObject(2778, 207.8484, -1411.3671, 50.5612, 0.0000, 0.0000, 152.4998); //CJ_COIN_OP_1
	hqRin_Object[5] = CreateDynamicObject(2232, 193.2843, -1398.8876, 49.6646, 0.0000, 0.0000, 120.5000); //MED_SPEAKER_4
	hqRin_Object[6] = CreateDynamicObject(1897, 196.7821, -1402.6916, 49.3060, 0.0000, 31.1998, 0.0000); //wheel_support
	hqRin_Object[7] = CreateDynamicObject(1897, 197.3013, -1403.0528, 49.2612, 26.6000, -1.5000, 171.2998); //wheel_support
	hqRin_Object[8] = CreateDynamicObject(1897, 197.8439, -1402.7196, 49.3078, -1.7999, -28.7999, 0.0000); //wheel_support
	hqRin_Object[9] = CreateDynamicObject(19611, 195.9781, -1400.7326, 49.1633, -0.5999, 0.0000, -34.9999); //MicrophoneStand1
	hqRin_Object[10] = CreateDynamicObject(1545, 206.8800, -1400.2926, 51.0667, 0.0000, 0.0000, 67.4999); //CJ_B_OPTIC1
	hqRin_Object[11] = CreateDynamicObject(1670, 199.1478, -1394.2647, 49.6313, 0.0000, 0.0000, 0.0000); //propcollecttable
	hqRin_Object[12] = CreateDynamicObject(2779, 206.1705, -1410.4826, 50.5312, 0.0000, 0.0000, 153.3000); //CJ_COIN_OP_2
	hqRin_Object[13] = CreateDynamicObject(19608, 195.1672, -1402.0682, 49.0644, -0.6000, 1.8999, 148.1999); //WoodenStage1
	hqRin_Object[14] = CreateDynamicObject(19859, 221.6976, -1402.2728, 51.8536, 0.0000, 0.0000, -27.7000); //MIHouse1Door3
	hqRin_Object[15] = CreateDynamicObject(2311, 197.9308, -1394.4431, 49.1007, 0.0000, 0.0000, 12.2999); //CJ_TV_TABLE2
	hqRin_Object[16] = CreateDynamicObject(16151, 206.9053, -1397.8282, 49.5665, 0.0000, 0.0000, -24.2999); //ufo_bar
	hqRin_Object[17] = CreateDynamicObject(1670, 206.4930, -1396.3878, 50.2100, -2.9999, -0.3000, 76.2998); //propcollecttable
	hqRin_Object[18] = CreateDynamicObject(1723, 197.1900, -1392.8548, 49.1549, 0.0000, 0.0000, 11.6998); //mrk_seating1
	hqRin_Object[19] = CreateDynamicObject(19609, 193.3159, -1401.1534, 48.9953, 0.0000, 0.0000, 124.5999); //DrumKit1
	hqRin_Object[20] = CreateDynamicObject(1670, 205.1911, -1399.2182, 50.2146, 0.0000, 0.0000, 88.9000); //propcollecttable
	hqRin_Object[21] = CreateDynamicObject(1716, 196.4631, -1402.9709, 49.1055, 0.0000, 0.0000, -35.1999); //kb_slot_stool
	hqRin_Object[22] = CreateDynamicObject(2241, 206.6115, -1401.9449, 52.1309, 0.0000, 0.0000, -23.7999); //Plant_Pot_5
	hqRin_Object[23] = CreateDynamicObject(638, 213.9819, -1400.5338, 51.0807, 0.0000, 0.0000, 154.2006); //kb_planter+bush
	hqRin_Object[24] = CreateDynamicObject(1724, 201.3184, -1394.6495, 49.0993, -0.3000, 0.2000, -119.8001); //mrk_seating1b
	hqRin_Object[25] = CreateDynamicObject(2245, 205.2982, -1400.8818, 50.4552, 0.0000, 0.0000, -23.0998); //Plant_Pot_11
	hqRin_Object[26] = CreateDynamicObject(1361, 212.8493, -1401.9637, 50.8666, 0.0000, 0.0000, 0.0000); //CJ_BUSH_PROP2
	hqRin_Object[27] = CreateDynamicObject(1724, 196.8018, -1395.9339, 48.9958, 0.0000, 0.0000, 122.3999); //mrk_seating1b
	hqRin_Object[28] = CreateDynamicObject(638, 213.1029, -1397.8358, 51.1007, 0.0000, 0.0000, 62.8997); //kb_planter+bush
	hqRin_Object[29] = CreateDynamicObject(638, 210.2637, -1398.7342, 51.0807, 0.0000, 0.0000, 154.2006); //kb_planter+bush
	hqRin_Object[30] = CreateDynamicObject(2800, 198.2899, -1394.3319, 49.4342, 0.0000, 0.0000, 0.0000); //castable2top
	hqRin_Object[31] = CreateDynamicObject(1361, 214.4391, -1398.9017, 50.8666, 0.0000, 0.0000, 0.0000); //CJ_BUSH_PROP2
	hqRin_Object[32] = CreateDynamicObject(949, 195.8878, -1393.6098, 49.7103, 0.0000, 0.4999, -73.8000); //Plant_Pot_4
	hqRin_Object[33] = CreateDynamicObject(638, 211.1896, -1401.5750, 51.1007, 0.0000, 0.0000, 62.8997); //kb_planter+bush
	hqRin_Object[34] = CreateDynamicObject(1361, 211.3294, -1397.3001, 50.8666, 0.0000, 0.0000, 0.0000); //CJ_BUSH_PROP2
	hqRin_Object[35] = CreateDynamicObject(1361, 209.7994, -1400.4632, 50.8666, 0.0000, 0.0000, 0.0000); //CJ_BUSH_PROP2
	hqRin_Object[36] = CreateDynamicObject(625, 204.9606, -1410.4102, 51.4502, 0.0000, 0.0000, -55.7999); //veg_palmkb1
	hqRin_Object[37] = CreateDynamicObject(869, 212.3721, -1399.5748, 50.9244, 0.0000, 0.0000, 0.0000); //veg_Pflowerswee
	hqRin_Object[38] = CreateDynamicObject(3524, 197.5791, -1389.6010, 48.5447, 0.0000, 0.0000, -155.1000); //skullpillar01_lvs
	hqRin_Object[39] = CreateDynamicObject(1716, 194.9250, -1402.4127, 49.1332, 0.0000, 0.0000, 0.0000); //kb_slot_stool
	hqRin_Object[40] = CreateDynamicObject(3524, 203.2205, -1383.4552, 49.0848, 0.0000, 0.0000, -120.3998); //skullpillar01_lvs
	hqRin_Object[41] = CreateDynamicObject(1481, 201.7792, -1407.5621, 49.9499, 0.0000, 0.0000, 152.0000); //DYN_BAR_B_Q
	hqRin_Object[42] = CreateDynamicObject(2229, 198.5471, -1402.6818, 49.1698, 0.0000, 0.0000, 171.6999); //SWANK_SPEAKER
	hqRin_Object[43] = CreateDynamicObject(1568, 210.3789, -1393.9632, 50.5592, 0.0000, 0.0000, 0.0000); //chinalamp_sf
	hqRin_Object[44] = CreateDynamicObject(19317, 194.2272, -1401.0323, 49.8031, -20.3999, 0.0000, 101.5998); //bassguitar01
	hqRin_Object[45] = CreateDynamicObject(1897, 197.8439, -1402.7196, 49.3078, -1.7999, -28.7999, 0.0000); //wheel_support
	hqRin_Object[46] = CreateDynamicObject(1518, 197.3424, -1402.6635, 50.3242, 0.0000, 0.0000, 179.5998); //DYN_TV_2
	hqRin_Object[47] = CreateDynamicObject(19610, 195.9671, -1400.7292, 50.7861, 14.3999, 0.3998, 147.3999); //Microphone1
	hqRin_Object[48] = CreateDynamicObject(1481, 200.1954, -1406.7467, 49.9931, 0.0000, 0.0000, 152.3000); //DYN_BAR_B_Q
	hqRin_Object[49] = CreateDynamicObject(1568, 204.7060, -1406.3143, 50.5603, 0.0000, 0.0000, 0.0000); //chinalamp_sf
	hqRin_Object[50] = CreateDynamicObject(1209, 211.3801, -1411.0079, 50.5993, 0.0000, 0.0000, -117.0999); //vendmach
	hqRin_Object[51] = CreateDynamicObject(1775, 212.1052, -1409.8397, 51.6965, 0.0000, 0.0000, -118.1000); //CJ_SPRUNK1

	// babi kun nha tren doi
	Babikunnhatrendoi_Object[0] = CreateDynamicObject(1568, 2469.4531, -968.1364, 79.1063, 0.0000, 0.0000, 0.0000); //chinalamp_sf
	Babikunnhatrendoi_Object[1] = CreateDynamicObject(19497, 2456.8603, -953.0524, 81.4167, 0.0000, 0.0000, 89.3000); //lvhouse1
	Babikunnhatrendoi_Object[2] = CreateDynamicObject(19865, 2443.6274, -940.4760, 79.0344, 0.0000, 0.0000, 0.0000); //MIFenceWood1
	Babikunnhatrendoi_Object[3] = CreateDynamicObject(19865, 2443.5874, -945.4860, 79.0344, 0.0000, 0.0000, 0.0000); //MIFenceWood1
	Babikunnhatrendoi_Object[4] = CreateDynamicObject(19865, 2443.5273, -950.4859, 79.0344, 0.0000, 0.0000, 0.0000); //MIFenceWood1
	Babikunnhatrendoi_Object[5] = CreateDynamicObject(19865, 2443.4873, -955.4860, 79.0344, 0.0000, 0.0000, 0.0000); //MIFenceWood1
	Babikunnhatrendoi_Object[6] = CreateDynamicObject(19865, 2443.4172, -960.4760, 79.0344, 0.0000, 0.0000, -1.3997); //MIFenceWood1
	Babikunnhatrendoi_Object[7] = CreateDynamicObject(19865, 2443.3671, -965.2056, 78.9944, 0.0000, 0.0000, 0.0000); //MIFenceWood1
	Babikunnhatrendoi_Object[8] = CreateDynamicObject(12922, 2462.6140, -968.3950, 82.4310, 0.0000, 0.0000, 0.0000); //sw_farment02
	Babikunnhatrendoi_Object[9] = CreateDynamicObject(19498, 2456.8793, -953.0244, 81.4160, 0.0000, 0.0000, 89.1996); //lvhouse1int
	Babikunnhatrendoi_Object[10] = CreateDynamicObject(1568, 2443.6130, -967.5363, 79.0961, 0.0000, 0.0000, 0.0000); //chinalamp_sf
	Babikunnhatrendoi_Object[11] = CreateDynamicObject(869, 2458.1525, -965.5861, 79.9216, 0.0000, 0.0000, 0.0000); //veg_Pflowerswee
	Babikunnhatrendoi_Object[12] = CreateDynamicObject(869, 2457.7221, -961.3452, 79.9216, 0.0000, 0.0000, 0.0000); //veg_Pflowerswee
	Babikunnhatrendoi_Object[13] = CreateDynamicObject(1722, 2459.3151, -947.1306, 79.8377, 0.0000, 0.0000, 46.5000); //off_chairnu
	Babikunnhatrendoi_Object[14] = CreateDynamicObject(14651, 2457.6567, -946.0446, 82.0130, 0.0000, 0.0000, 0.0000); //trukstp05
	Babikunnhatrendoi_Object[15] = CreateDynamicObject(1828, 2448.5729, -949.7647, 79.8199, 0.0000, 0.0000, 92.4000); //man_sdr_rug
	Babikunnhatrendoi_Object[16] = CreateDynamicObject(11665, 2450.4116, -955.7241, 80.4962, 0.0000, 0.0000, -91.4999); //kb_chair03ext
	Babikunnhatrendoi_Object[17] = CreateDynamicObject(16151, 2449.2495, -958.8394, 79.9203, 0.0000, 0.0000, 87.9999); //ufo_bar
	Babikunnhatrendoi_Object[18] = CreateDynamicObject(2245, 2461.7880, -955.1867, 80.4962, 0.0000, 0.0000, 0.0000); //Plant_Pot_11
	Babikunnhatrendoi_Object[19] = CreateDynamicObject(19466, 2467.5632, -949.4666, 81.2758, 0.0000, 0.0000, 0.0000); //window001
	Babikunnhatrendoi_Object[20] = CreateDynamicObject(3802, 2459.2836, -955.4290, 82.0701, 0.0000, 0.0000, -86.9000); //sfx_plant03
	Babikunnhatrendoi_Object[21] = CreateDynamicObject(19466, 2460.7355, -954.8483, 81.2758, 0.0000, 0.0000, -90.8000); //window001
	Babikunnhatrendoi_Object[22] = CreateDynamicObject(19466, 2452.7600, -957.4467, 81.6856, 0.0000, 0.0000, -90.8000); //window001
	Babikunnhatrendoi_Object[23] = CreateDynamicObject(19466, 2448.2487, -957.3839, 81.6856, 0.0000, 0.0000, -90.8000); //window001
	Babikunnhatrendoi_Object[24] = CreateDynamicObject(19786, 2450.5429, -957.3717, 81.8600, 0.0000, 0.0000, 179.4998); //LCDTVBig1
	Babikunnhatrendoi_Object[25] = CreateDynamicObject(3810, 2462.1560, -955.5902, 82.0204, 0.0000, 0.0000, -94.5998); //sfx_plant04
	Babikunnhatrendoi_Object[26] = CreateDynamicObject(2245, 2460.7370, -955.1867, 80.4962, 0.0000, 0.0000, 0.0000); //Plant_Pot_11
	Babikunnhatrendoi_Object[27] = CreateDynamicObject(2245, 2459.6660, -955.1867, 80.4962, 0.0000, 0.0000, 0.0000); //Plant_Pot_11
	Babikunnhatrendoi_Object[28] = CreateDynamicObject(1722, 2454.0881, -945.1892, 79.8377, 0.0000, 0.0000, -87.8999); //off_chairnu
	Babikunnhatrendoi_Object[29] = CreateDynamicObject(2165, 2446.5205, -944.8317, 79.8251, 0.0000, 0.0000, 89.0998); //MED_OFFICE_DESK_1
	Babikunnhatrendoi_Object[30] = CreateDynamicObject(2356, 2448.0725, -944.8593, 79.8123, 0.0000, 0.0000, 65.8000); //police_OFF_CHAIR
	Babikunnhatrendoi_Object[31] = CreateDynamicObject(2842, 2456.4528, -954.4511, 79.7901, 0.0000, 0.0000, -0.2998); //gb_bedrug04
	Babikunnhatrendoi_Object[32] = CreateDynamicObject(19893, 2446.6428, -943.7194, 80.6295, 0.0000, 0.0000, 40.9999); //LaptopSAMP1
	Babikunnhatrendoi_Object[33] = CreateDynamicObject(2267, 2445.9938, -948.7072, 81.8815, 0.0000, 0.0000, 89.0998); //Frame_WOOD_3
	Babikunnhatrendoi_Object[34] = CreateDynamicObject(2258, 2452.3918, -943.4647, 81.8199, 0.0000, 0.0000, 0.0000); //Frame_Clip_5
	Babikunnhatrendoi_Object[35] = CreateDynamicObject(19318, 2462.2011, -949.9609, 82.1032, -0.2000, 80.2997, -90.2002); //flyingv01
	Babikunnhatrendoi_Object[36] = CreateDynamicObject(19317, 2462.1384, -951.4420, 82.0807, 0.0000, -78.4999, -91.7002); //bassguitar01
	Babikunnhatrendoi_Object[37] = CreateDynamicObject(3279, 2467.4887, -940.9982, 79.6305, 0.0000, 0.0000, -91.0998); //a51_spottower
	Babikunnhatrendoi_Object[38] = CreateDynamicObject(2725, 2448.4077, -950.0322, 80.1809, 0.0000, 0.0000, 0.0000); //LM_stripTable
	Babikunnhatrendoi_Object[39] = CreateDynamicObject(1726, 2448.6679, -952.4594, 79.7182, 0.0000, 0.0000, 152.5000); //mrk_seating2
	Babikunnhatrendoi_Object[40] = CreateDynamicObject(2801, 2448.4345, -949.9743, 80.2900, 0.0000, 0.0000, 0.0000); //castable1top
	Babikunnhatrendoi_Object[41] = CreateDynamicObject(1568, 2444.0075, -938.4249, 79.6725, 0.0000, 0.0000, 0.0000); //chinalamp_sf
	Babikunnhatrendoi_Object[42] = CreateDynamicObject(1726, 2446.8291, -948.1931, 79.7182, 0.0000, 0.0000, 26.7999); //mrk_seating2
	Babikunnhatrendoi_Object[43] = CreateDynamicObject(19609, 2460.7971, -949.2968, 79.8295, 0.0000, 0.0000, -39.9999); //DrumKit1
	Babikunnhatrendoi_Object[44] = CreateDynamicObject(19433, 2462.2441, -952.5499, 80.6756, 90.3000, 0.0000, 0.0000); //wall073
	Babikunnhatrendoi_Object[45] = CreateDynamicObject(19609, 2460.7985, -952.2841, 79.8295, 0.0000, 0.0000, -135.8000); //DrumKit1
	Babikunnhatrendoi_Object[46] = CreateDynamicObject(869, 2457.8613, -963.3956, 79.8815, 0.0000, 0.0000, 0.0000); //veg_Pflowerswee
	Babikunnhatrendoi_Object[47] = CreateDynamicObject(16779, 2448.1520, -949.7988, 83.1466, 0.0000, 0.0000, 0.0000); //ufo_light02
	Babikunnhatrendoi_Object[48] = CreateDynamicObject(1568, 2469.9177, -938.7451, 79.7526, 0.0000, 0.0000, 0.0000); //chinalamp_sf
	Babikunnhatrendoi_Object[49] = CreateDynamicObject(19433, 2462.2441, -949.0797, 80.6938, 90.3000, 0.0000, 0.0000); //wall073
	Babikunnhatrendoi_Object[50] = CreateDynamicObject(3425, 2443.4592, -940.4459, 90.9549, 0.0000, 0.0000, 0.0000); //nt_windmill

	MapBabikun_fix_Object[0] = CreateDynamicObject(11245, 317.5520, -1772.3006, 10.7917, 0.0000, 0.0000, -95.9000); //sfsefirehseflag
	MapBabikun_fix_Object[1] = CreateDynamicObject(16151, 327.1122, -1765.3015, 3.8587, 0.0000, 0.0000, -178.7998); //ufo_bar
	MapBabikun_fix_Object[2] = CreateDynamicObject(3471, 326.5907, -1771.3730, 5.1494, 0.0000, 0.0000, -97.8999); //vgschinalion1
	MapBabikun_fix_Object[3] = CreateDynamicObject(19815, 322.4392, -1759.5726, 5.3186, 0.0000, 0.0000, 0.0000); //ToolBoard1
	MapBabikun_fix_Object[4] = CreateDynamicObject(869, 332.2254, -1758.5277, 8.0317, 0.0000, 0.0000, 0.0000); //veg_Pflowerswee
	MapBabikun_fix_Object[5] = CreateDynamicObject(19157, 332.1889, -1757.4654, 4.9759, 0.0000, 0.0000, 0.0000); //MetalLightBars1
	MapBabikun_fix_Object[6] = CreateDynamicObject(869, 332.2153, -1755.8863, 8.0317, 0.0000, 0.0000, 0.0000); //veg_Pflowerswee
	MapBabikun_fix_Object[7] = CreateDynamicObject(2082, 331.4060, -1758.0212, 3.4979, 0.0000, 0.0000, 0.0000); //COFFEE_MED_3
	MapBabikun_fix_Object[8] = CreateDynamicObject(14791, 322.4884, -1753.7579, 4.9024, 0.0000, 0.0000, 0.0000); //a_vgsGymBoxa
	MapBabikun_fix_Object[9] = CreateDynamicObject(11717, 331.7763, -1755.5832, 3.4972, 0.0000, 0.0000, 0.0000); //WooziesCouch1
	MapBabikun_fix_Object[10] = CreateDynamicObject(11717, 331.1405, -1759.9289, 3.4672, 0.0000, 0.0000, 145.6999); //WooziesCouch1
	MapBabikun_fix_Object[11] = CreateDynamicObject(11717, 333.2778, -1759.7467, 3.4672, 0.0000, 0.0000, -143.1999); //WooziesCouch1
	MapBabikun_fix_Object[12] = CreateDynamicObject(19820, 332.1206, -1757.7662, 3.9888, 0.0000, 0.0000, 0.0000); //AlcoholBottle1
	MapBabikun_fix_Object[13] = CreateDynamicObject(19824, 331.6015, -1757.3282, 4.0187, 0.0000, 0.0000, 0.0000); //AlcoholBottle5
	MapBabikun_fix_Object[14] = CreateDynamicObject(1568, 334.2647, -1750.2927, 3.4435, 0.0000, 0.0000, 0.0000); //chinalamp_sf
	MapBabikun_fix_Object[15] = CreateDynamicObject(1568, 308.6546, -1750.2927, 3.4435, 0.0000, 0.0000, 0.0000); //chinalamp_sf
	MapBabikun_fix_Object[16] = CreateDynamicObject(1568, 326.3644, -1757.7530, 3.4335, 0.0000, 0.0000, 0.0000); //chinalamp_sf
	MapBabikun_fix_Object[17] = CreateDynamicObject(19831, 334.2308, -1768.4283, 3.7657, 0.0000, 0.0000, -90.0000); //Barbeque1
	MapBabikun_fix_Object[18] = CreateDynamicObject(19831, 334.2308, -1766.4482, 3.7657, 0.0000, 0.0000, -90.0000); //Barbeque1
	MapBabikun_fix_Object[19] = CreateDynamicObject(19847, 334.2520, -1766.3819, 4.6479, 0.0000, 0.0000, 25.7999); //LegHam1
	MapBabikun_fix_Object[20] = CreateDynamicObject(19582, 334.1299, -1768.4615, 4.6293, 0.0000, 0.0000, 0.0000); //MarcosSteak1
	MapBabikun_fix_Object[21] = CreateDynamicObject(19632, 334.2043, -1766.4853, 4.1392, 0.0000, 0.0000, -94.5998); //FireWood1
	MapBabikun_fix_Object[22] = CreateDynamicObject(19632, 334.2373, -1768.4444, 4.1490, 0.0000, 0.0000, -94.5998); //FireWood1
	MapBabikun_fix_Object[23] = CreateDynamicObject(3471, 334.0198, -1772.4039, 5.1494, 0.0000, 0.0000, -97.8999); //vgschinalion1
	MapBabikun_fix_Object[24] = CreateDynamicObject(3038, 329.6494, -1754.8491, 9.8615, 0.0000, 0.0000, -47.9999); //ct_lanterns

	// hq cua Marcu
	hqcuaMarcu_Object[0] = CreateDynamicObject(2990, 806.9063, -515.1198, 19.1532, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[0], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[0], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[0], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[1] = CreateDynamicObject(2990, 806.9063, -505.1698, 19.1532, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[1], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[1], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[1], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[2] = CreateDynamicObject(2990, 806.9063, -495.2698, 19.1532, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[2], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[2], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[2], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[3] = CreateDynamicObject(2990, 801.9271, -520.1417, 19.1532, 0.0000, 0.0000, 0.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[3], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[3], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[3], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[4] = CreateDynamicObject(2990, 806.9063, -487.7897, 19.1532, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[4], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[4], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[4], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[5] = CreateDynamicObject(2990, 806.9063, -487.7897, 25.6132, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[5], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[5], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[5], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[6] = CreateDynamicObject(2990, 806.9063, -497.6696, 25.6132, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[6], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[6], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[6], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[7] = CreateDynamicObject(2990, 806.9063, -507.5695, 25.6132, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[7], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[7], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[7], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[8] = CreateDynamicObject(2990, 806.9063, -514.4496, 25.6132, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[8], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[8], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[8], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[9] = CreateDynamicObject(2990, 781.8661, -515.0496, 20.0732, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[9], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[9], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[9], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[10] = CreateDynamicObject(2990, 781.8661, -505.1496, 20.0732, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[10], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[10], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[10], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[11] = CreateDynamicObject(2990, 781.8661, -495.2496, 20.0732, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[11], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[11], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[11], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[12] = CreateDynamicObject(2990, 781.8661, -487.7594, 20.0732, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[12], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[12], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[12], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[13] = CreateDynamicObject(2990, 781.8661, -487.7594, 26.4332, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[13], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[13], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[13], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[14] = CreateDynamicObject(2990, 781.8661, -497.6292, 26.4332, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[14], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[14], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[14], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[15] = CreateDynamicObject(2990, 781.8661, -507.5888, 26.4332, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[15], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[15], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[15], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[16] = CreateDynamicObject(2990, 781.8661, -515.0695, 26.4332, 0.0000, 0.0000, 90.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[16], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[16], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[16], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[17] = CreateDynamicObject(2990, 791.9956, -482.8093, 19.1632, 0.0000, 0.0000, 0.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[17], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[17], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[17], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[18] = CreateDynamicObject(2990, 786.8535, -482.8093, 19.1632, 0.0000, 0.0000, 0.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[18], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[18], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[18], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[19] = CreateDynamicObject(2990, 801.8855, -482.8093, 19.1632, 0.0000, 0.0000, 0.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[19], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[19], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[19], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[20] = CreateDynamicObject(2990, 801.8855, -482.8093, 25.6732, 0.0000, 0.0000, 0.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[20], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[20], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[20], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[21] = CreateDynamicObject(2990, 791.9859, -482.8093, 25.6732, 0.0000, 0.0000, 0.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[21], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[21], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[21], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[22] = CreateDynamicObject(2990, 786.8042, -482.8093, 25.6732, 0.0000, 0.0000, 0.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[22], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[22], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[22], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[23] = CreateDynamicObject(2990, 801.9271, -520.1417, 25.6232, 0.0000, 0.0000, 0.0000); //wongs_gate
	SetDynamicObjectMaterial(hqcuaMarcu_Object[23], 0, 3715, "archlax", "ws_greymetal", 0x00000000);
	SetDynamicObjectMaterialText(hqcuaMarcu_Object[23], 1, ".", OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0x00000000, 0);
	SetDynamicObjectMaterial(hqcuaMarcu_Object[23], 3, 3715, "archlax", "ws_greymetal", 0x00000000);
	hqcuaMarcu_Object[24] = CreateDynamicObject(3749, 790.9370, -520.3016, 20.9885, 0.0000, 0.0000, 0.0000); //ClubGate01_LAx


	// kevinn
	Kevinn_Object[0] = CreateDynamicObject(3749, -2804.4670, -329.5932, 11.6346, 0.0000, 0.0000, 84.5000); //ClubGate01_LAx
	Kevinn_Object[1] = CreateDynamicObject(19913, -2659.1225, -321.5296, 7.8892, 0.0000, 0.0000, 44.2999); //SAMPBigFence1
	Kevinn_Object[2] = CreateDynamicObject(3437, -2799.0532, -221.2196, 7.2066, 0.0000, 0.0000, 70.4000); //ballypllr01_lvs
	Kevinn_Object[3] = CreateDynamicObject(19913, -2802.6406, -296.5280, 7.5335, 0.0000, 0.0000, 85.9000); //SAMPBigFence1
	Kevinn_Object[4] = CreateDynamicObject(19913, -2800.0942, -246.7395, 7.5335, 0.0000, 0.0000, 87.9000); //SAMPBigFence1
	Kevinn_Object[5] = CreateDynamicObject(19913, -2774.0109, -220.2857, 7.5335, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	Kevinn_Object[6] = CreateDynamicObject(19913, -2723.7177, -220.2857, 7.5335, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	Kevinn_Object[7] = CreateDynamicObject(19913, -2686.9628, -220.2857, 7.5335, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	Kevinn_Object[8] = CreateDynamicObject(3749, -2655.2705, -221.3549, 8.8733, 0.0000, 0.0000, 0.0000); //ClubGate01_LAx
	Kevinn_Object[9] = CreateDynamicObject(19913, -2644.1838, -246.5323, 7.8534, 0.0000, 0.0000, -86.9999); //SAMPBigFence1
	Kevinn_Object[10] = CreateDynamicObject(19913, -2642.4814, -279.1564, 7.8534, 0.0000, 0.0000, -86.9999); //SAMPBigFence1
	Kevinn_Object[11] = CreateDynamicObject(19913, -2739.3186, -390.4475, 7.4994, 0.0000, 0.0000, 74.5998); //SAMPBigFence1
	Kevinn_Object[12] = CreateDynamicObject(19913, -2808.9401, -363.8695, 7.5335, 0.0000, 0.0000, 85.1999); //SAMPBigFence1
	Kevinn_Object[13] = CreateDynamicObject(19913, -2811.0671, -389.3403, 7.5335, 0.0000, 0.0000, 85.3000); //SAMPBigFence1
	Kevinn_Object[14] = CreateDynamicObject(19913, -2788.2114, -414.3167, 7.5335, 0.0000, 0.0000, 179.5998); //SAMPBigFence1
	Kevinn_Object[15] = CreateDynamicObject(19913, -2770.5864, -414.4399, 7.5335, 0.0000, 0.0000, 179.5998); //SAMPBigFence1
	Kevinn_Object[16] = CreateDynamicObject(9482, -2806.6647, -329.4700, 11.5824, 0.0000, 0.0000, -4.1999); //chinagate
	Kevinn_Object[17] = CreateDynamicObject(9482, -2655.2692, -218.9019, 8.3168, 0.0000, 0.0000, 90.0000); //chinagate
	Kevinn_Object[18] = CreateDynamicObject(3279, -2796.8022, -339.2557, 5.9783, 0.0000, 0.0000, 0.0000); //a51_spottower
	Kevinn_Object[19] = CreateDynamicObject(3279, -2666.4089, -228.9208, 3.5838, 0.0000, 0.0000, 0.0000); //a51_spottower
	Kevinn_Object[20] = CreateDynamicObject(14467, -2663.7119, -217.2161, 5.9798, 0.0000, 0.0000, 161.9999); //carter_statue
	Kevinn_Object[21] = CreateDynamicObject(14467, -2808.9023, -337.2541, 8.8442, 0.0000, 0.0000, -114.0999); //carter_statue
	Kevinn_Object[22] = CreateDynamicObject(14467, -2790.7045, -338.0874, 8.8442, 0.0000, 0.0000, 178.9000); //carter_statue
	Kevinn_Object[23] = CreateDynamicObject(14467, -2664.0151, -234.4038, 7.1498, 0.0000, 0.0000, 135.4998); //carter_statue
	Kevinn_Object[24] = CreateDynamicObject(3524, -2718.7980, -312.0332, 6.8505, 0.0000, 0.0000, -139.5999); //skullpillar01_lvs
	Kevinn_Object[25] = CreateDynamicObject(3524, -2726.2290, -319.5154, 6.8505, 0.0000, 0.0000, -139.5999); //skullpillar01_lvs

	return 1;
}

hook OnPlayerConnect(playerid)
{
	// babikun
	RemoveBuildingForPlayer(playerid, 710, 956.2420, -844.5939, 108.2109, 0.10); // vgs_palm01
	RemoveBuildingForPlayer(playerid, 710, 902.6329, -857.5159, 99.0233, 0.10); // vgs_palm01
	RemoveBuildingForPlayer(playerid, 617, 897.4769, -872.2579, 77.9297, 0.10); // veg_treeb1
	RemoveBuildingForPlayer(playerid, 620, 907.3519, -867.7969, 79.5702, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 620, 894.2340, -863.4769, 78.2188, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 1408, 930.5629, -861.8590, 93.0077, 0.10); // DYN_F_WOOD_2
	RemoveBuildingForPlayer(playerid, 1408, 935.6950, -859.8909, 93.0233, 0.10); // DYN_F_WOOD_2
	RemoveBuildingForPlayer(playerid, 659, 998.6719, -855.7420, 86.2500, 0.10); // pinetree01
	RemoveBuildingForPlayer(playerid, 617, 1018.9600, -845.9450, 83.5858, 0.10); // veg_treeb1
	RemoveBuildingForPlayer(playerid, 3262, 921.8519, -843.5780, 92.5233, 0.10); // privatesign1
	RemoveBuildingForPlayer(playerid, 1687, 985.5469, -839.9299, 99.6016, 0.10); // gen_roofbit1
	RemoveBuildingForPlayer(playerid, 1690, 994.5000, -830.3359, 99.5156, 0.10); // gen_roofbit4
	RemoveBuildingForPlayer(playerid, 1688, 1003.5800, -830.0469, 99.8358, 0.10); // gen_roofbit2
	RemoveBuildingForPlayer(playerid, 1409, 974.9219, -815.5159, 96.7266, 0.10); // CJ_Dump1_LOW
	RemoveBuildingForPlayer(playerid, 1328, 975.1250, -814.4299, 97.2343, 0.10); // BinNt10_LA
	//

	
	// hq anh yang
	RemoveBuildingForPlayer(playerid, 3594, 2532.9799, -1719.4300, 13.1796, 0.10); // la_fuckcar1
	RemoveBuildingForPlayer(playerid, 3594, 2537.9699, -1700.7099, 13.1796, 0.10); // la_fuckcar1
	RemoveBuildingForPlayer(playerid, 1265, 2491.2299, -1653.9599, 12.9218, 0.10); // BlackBag2
	RemoveBuildingForPlayer(playerid, 1230, 2492.2700, -1653.9899, 12.8984, 0.10); // cardboardbox
	RemoveBuildingForPlayer(playerid, 1265, 2505.6699, -1658.9100, 12.8125, 0.10); // BlackBag2
	RemoveBuildingForPlayer(playerid, 1265, 2510.9199, -1656.1300, 12.8125, 0.10); // BlackBag2
	RemoveBuildingForPlayer(playerid, 1230, 2501.9299, -1650.5100, 12.9140, 0.10); // cardboardbox
	RemoveBuildingForPlayer(playerid, 1468, 2522.1000, -1665.6500, 15.3281, 0.10); // DYN_MESH_05
	RemoveBuildingForPlayer(playerid, 3594, 2514.3898, -1658.5999, 13.1406, 0.10); // la_fuckcar1
	RemoveBuildingForPlayer(playerid, 762, 2446.5500, -1681.0699, 12.3828, 0.10); // new_bushtest
	RemoveBuildingForPlayer(playerid, 1468, 2468.3500, -1680.9799, 13.8125, 0.10); // DYN_MESH_05
	RemoveBuildingForPlayer(playerid, 3593, 2457.8701, -1679.6700, 12.9453, 0.10); // la_fuckcar2
	RemoveBuildingForPlayer(playerid, 1468, 2465.6999, -1676.4499, 13.8125, 0.10); // DYN_MESH_05
	RemoveBuildingForPlayer(playerid, 1468, 2463.8701, -1671.5200, 13.8125, 0.10); // DYN_MESH_05
	RemoveBuildingForPlayer(playerid, 1230, 2415.1999, -1653.1300, 12.6796, 0.10); // cardboardbox
	RemoveBuildingForPlayer(playerid, 1230, 2453.9599, -1653.6999, 12.6796, 0.10); // cardboardbox
	RemoveBuildingForPlayer(playerid, 1230, 2475.0000, -1653.6099, 12.7890, 0.10); // cardboardbox
	RemoveBuildingForPlayer(playerid, 3593, 2437.4799, -1644.1199, 12.9843, 0.10); // la_fuckcar2
	RemoveBuildingForPlayer(playerid, 3589, 2451.7299, -1637.4799, 15.1328, 0.10); // compfukhouse3
	RemoveBuildingForPlayer(playerid, 3592, 2451.7299, -1637.4799, 15.1328, 0.10); // LOD Model of compfukhouse3

	// truong tri thuan
	RemoveBuildingForPlayer(playerid, 620, 1958.3699, -1736.5500, 14.4843, 0.10); // veg_palm04

	// hq cua rin
	RemoveBuildingForPlayer(playerid, 620, 234.0549, -1412.9200, 48.2891, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 669, 212.8520, -1399.3000, 50.6094, 0.10); // sm_veg_tree4
	RemoveBuildingForPlayer(playerid, 620, 207.7660, -1401.1999, 50.3046, 0.10); // veg_palm04

	// nha tren doi babikun
	RemoveBuildingForPlayer(playerid, 710, 2412.9899, -1055.0100, 65.0156, 0.10); // vgs_palm01
	RemoveBuildingForPlayer(playerid, 710, 2422.8500, -1022.2000, 66.4452, 0.10); // vgs_palm01
	RemoveBuildingForPlayer(playerid, 708, 2308.5100, -956.6250, 65.4452, 0.10); // sm_veg_tree4_vbig
	RemoveBuildingForPlayer(playerid, 620, 2417.4899, -1015.3499, 50.3358, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 620, 2421.7700, -1061.7600, 44.0703, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 620, 2423.2900, -1051.1300, 49.1719, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 673, 2441.3701, -967.4769, 79.0702, 0.10); // sm_bevhiltree
	RemoveBuildingForPlayer(playerid, 1410, 2444.9699, -967.0629, 79.7343, 0.10); // DYN_F_R_WOOD_1b
	RemoveBuildingForPlayer(playerid, 1407, 2449.6899, -967.1090, 79.8125, 0.10); // DYN_F_R_WOOD_1
	RemoveBuildingForPlayer(playerid, 1410, 2462.2500, -967.0629, 79.7968, 0.10); // DYN_F_R_WOOD_1b
	RemoveBuildingForPlayer(playerid, 1410, 2471.5700, -967.0549, 79.8438, 0.10); // DYN_F_R_WOOD_1b
	RemoveBuildingForPlayer(playerid, 1407, 2466.9699, -967.1090, 79.8827, 0.10); // DYN_F_R_WOOD_1
	RemoveBuildingForPlayer(playerid, 1410, 2442.6999, -964.7109, 79.7343, 0.10); // DYN_F_R_WOOD_1b
	RemoveBuildingForPlayer(playerid, 1407, 2442.7500, -960.0000, 79.7968, 0.10); // DYN_F_R_WOOD_1
	RemoveBuildingForPlayer(playerid, 3285, 2449.5200, -961.8980, 81.0077, 0.10); // conhoos4
	RemoveBuildingForPlayer(playerid, 3300, 2449.5200, -961.8980, 81.0077, 0.10); // LOD Model of conhoos4
	RemoveBuildingForPlayer(playerid, 3283, 2466.2900, -959.1950, 79.6641, 0.10); // conhoos3
	RemoveBuildingForPlayer(playerid, 3299, 2466.2900, -959.1950, 79.6641, 0.10); // LOD Model of conhoos3
	RemoveBuildingForPlayer(playerid, 617, 2440.4699, -953.6329, 78.6406, 0.10); // veg_treeb1
	RemoveBuildingForPlayer(playerid, 1410, 2442.6999, -955.3980, 79.7422, 0.10); // DYN_F_R_WOOD_1b
	RemoveBuildingForPlayer(playerid, 3241, 2458.7099, -944.4920, 79.5391, 0.10); // conhoos2
	RemoveBuildingForPlayer(playerid, 3298, 2458.7099, -944.4920, 79.5391, 0.10); // LOD Model of conhoos2

	// Babikun
	RemoveBuildingForPlayer(playerid, 647, 328.5000, -1770.3199, 4.5546, 0.10); // new_bushsm
	RemoveBuildingForPlayer(playerid, 620, 328.5159, -1768.0400, 3.1250, 0.10); // veg_palm04
	RemoveBuildingForPlayer(playerid, 647, 331.7269, -1764.8800, 4.5546, 0.10); // new_bushsm

	// kevinn
	RemoveBuildingForPlayer(playerid, 1231, -2805.4099, -333.7969, 8.9218, 0.10); // Streetlamp2
	RemoveBuildingForPlayer(playerid, 1231, -2804.5200, -325.9689, 8.9218, 0.10); // Streetlamp2
	RemoveBuildingForPlayer(playerid, 1231, -2661.5500, -220.5160, 6.0625, 0.10); // Streetlamp2
	RemoveBuildingForPlayer(playerid, 1231, -2648.6298, -220.5700, 6.0625, 0.10); // Streetlamp2

	return 1;
}