#include <YSI\y_hooks>

hook OnPlayerConnect(playerid)
{
// 	RemoveBuildingForPlayer(playerid, 4057, 1479.5547, -1693.1406, 19.5781, 0.25);
// RemoveBuildingForPlayer(playerid, 4210, 1479.5625, -1631.4531, 12.0781, 0.25);
// RemoveBuildingForPlayer(playerid, 713, 1457.9375, -1620.6953, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 713, 1496.8672, -1707.8203, 13.4063, 0.25);
// RemoveBuildingForPlayer(playerid, 1226, 1467.9844, -1727.6719, 16.4219, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1468.9844, -1713.5078, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1231, 1479.6953, -1716.7031, 15.6250, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1488.7656, -1713.7031, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1289, 1504.7500, -1711.8828, 13.5938, 0.25);
// RemoveBuildingForPlayer(playerid, 1258, 1445.0078, -1704.7656, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 1258, 1445.0078, -1692.2344, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 712, 1445.8125, -1650.0234, 22.2578, 0.25);
// RemoveBuildingForPlayer(playerid, 673, 1457.7266, -1710.0625, 12.3984, 0.25);
// RemoveBuildingForPlayer(playerid, 620, 1461.6563, -1707.6875, 11.8359, 0.25);
// RemoveBuildingForPlayer(playerid, 700, 1463.0625, -1701.5703, 13.7266, 0.25);
// RemoveBuildingForPlayer(playerid, 1231, 1479.6953, -1702.5313, 15.6250, 0.25);
// RemoveBuildingForPlayer(playerid, 673, 1457.5547, -1697.2891, 12.3984, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1468.9844, -1694.0469, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1231, 1479.3828, -1692.3906, 15.6328, 0.25);
// RemoveBuildingForPlayer(playerid, 4186, 1479.5547, -1693.1406, 19.5781, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1468.9844, -1704.6406, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 620, 1461.1250, -1687.5625, 11.8359, 0.25);
// RemoveBuildingForPlayer(playerid, 700, 1463.0625, -1690.6484, 13.7266, 0.25);
// RemoveBuildingForPlayer(playerid, 641, 1458.6172, -1684.1328, 11.1016, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1457.2734, -1666.2969, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1468.9844, -1682.7188, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 712, 1471.4063, -1666.1797, 22.2578, 0.25);
// RemoveBuildingForPlayer(playerid, 1231, 1479.3828, -1682.3125, 15.6328, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1458.2578, -1659.2578, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 712, 1449.8516, -1655.9375, 22.2578, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1457.3516, -1650.5703, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1454.4219, -1642.4922, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 1231, 1466.4688, -1637.9609, 15.6328, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1449.5938, -1635.0469, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 3985, 1479.5625, -1631.4531, 12.0781, 0.25);
// RemoveBuildingForPlayer(playerid, 4206, 1479.5547, -1639.6094, 13.6484, 0.25);
// RemoveBuildingForPlayer(playerid, 1232, 1465.8359, -1608.3750, 15.3750, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1488.7656, -1704.5938, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 700, 1494.2109, -1694.4375, 13.7266, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1488.7656, -1693.7344, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 620, 1496.9766, -1686.8516, 11.8359, 0.25);
// RemoveBuildingForPlayer(playerid, 641, 1494.1406, -1689.2344, 11.1016, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1488.7656, -1682.6719, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 712, 1480.6094, -1666.1797, 22.2578, 0.25);
// RemoveBuildingForPlayer(playerid, 712, 1488.2266, -1666.1797, 22.2578, 0.25);
// RemoveBuildingForPlayer(playerid, 1232, 1494.3594, -1608.3750, 15.3750, 0.25);
// RemoveBuildingForPlayer(playerid, 1288, 1504.7500, -1705.4063, 13.5938, 0.25);
// RemoveBuildingForPlayer(playerid, 1287, 1504.7500, -1704.4688, 13.5938, 0.25);
// RemoveBuildingForPlayer(playerid, 1286, 1504.7500, -1695.0547, 13.5938, 0.25);
// RemoveBuildingForPlayer(playerid, 1285, 1504.7500, -1694.0391, 13.5938, 0.25);
// RemoveBuildingForPlayer(playerid, 673, 1498.9609, -1684.6094, 12.3984, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1504.1641, -1662.0156, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1504.7188, -1670.9219, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 620, 1503.1875, -1621.1250, 11.8359, 0.25);
// RemoveBuildingForPlayer(playerid, 673, 1501.2813, -1624.5781, 12.3984, 0.25);
// RemoveBuildingForPlayer(playerid, 673, 1498.3594, -1616.9688, 12.3984, 0.25);
// RemoveBuildingForPlayer(playerid, 712, 1508.4453, -1668.7422, 22.2578, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1505.6953, -1654.8359, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1508.5156, -1647.8594, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 625, 1513.2734, -1642.4922, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 1258, 1510.8906, -1607.3125, 13.6953, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1479.6094, -1653.2500, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1467.8516, -1646.5938, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1472.8984, -1651.5078, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1465.9375, -1639.8203, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1467.7109, -1632.8906, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1472.6641, -1627.8828, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1479.4688, -1626.0234, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1486.4063, -1651.3906, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1491.3672, -1646.3828, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1493.1328, -1639.4531, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1486.1797, -1627.7656, 13.4531, 0.25);
// RemoveBuildingForPlayer(playerid, 1280, 1491.2188, -1632.6797, 13.4531, 0.25);

// RemoveBuildingForPlayer(playerid, 4057, 1479.554688, -1693.140625, 19.578100, 0.250000);
// RemoveBuildingForPlayer(playerid, 1231, 1479.695313, -1702.531250, 15.625000, 0.250000);
// RemoveBuildingForPlayer(playerid, 1280, 1468.984375, -1694.046875, 13.453100, 0.250000);
// RemoveBuildingForPlayer(playerid, 1231, 1479.382813, -1692.390625, 15.632800, 0.250000);
// RemoveBuildingForPlayer(playerid, 4186, 1479.554688, -1693.140625, 19.578100, 0.250000);
// RemoveBuildingForPlayer(playerid, 1280, 1468.984375, -1682.718750, 13.453100, 0.250000);
// RemoveBuildingForPlayer(playerid, 1231, 1479.382813, -1682.312500, 15.632800, 0.250000);
// RemoveBuildingForPlayer(playerid, 700, 1494.210938, -1694.437500, 13.726600, 0.250000);
// RemoveBuildingForPlayer(playerid, 1280, 1488.765625, -1693.734375, 13.453100, 0.250000);
// RemoveBuildingForPlayer(playerid, 641, 1494.140625, -1689.234375, 11.101600, 0.250000);
// RemoveBuildingForPlayer(playerid, 1280, 1488.765625, -1682.671875, 13.453100, 0.250000);
// SetTimerEx("video", 60000, true, "i", playerid);
	return 1;
}

hook OnGameModeInit()
{
	
	// CinemaArea = CreateDynamicCircle(1479.914917, -1689.026733, 100.0, -1, -1, -1);// 100.0 радиус показа видео
	// map = CreateDynamicObject(7914, 1479.91492, -1689.02673, 19.55790,   0.00000, 0.00001, 0.00000); //Главный экран. Создадим его при включении команды /cef_block
	// SetDynamicObjectMaterial(map, 0, 10765, "airportgnd_sfse", "black64", 0);
	// map = CreateDynamicObject(7914, 1479.9149, -1689.0267, 19.5579, 0.000000, 0.000015, 179.999939); // 1
	// SetDynamicObjectMaterial(map, 0, 10765, "airportgnd_sfse", "white", 0);
	// //
	// CreateDynamicObject(19536, 1489.51294, -1696.17188, 12.31340,   0.00000, 0.00000, 0.00000);
	// CreateDynamicObject(639, 1491.31323, -1689.18604, 15.86182,   80.00000, 0.00000, 90.00000);
	// CreateDynamicObject(639, 1489.02966, -1689.18604, 20.32509,   50.00000, 0.00000, 90.00000);
	// CreateDynamicObject(19620, 1487.4745, -1688.5966, 16.6741,   90.0000, 180.0000, 0.0000);
	// map = CreateDynamicObject(3438, 1487.90051, -1689.04370, 12.88545,   -89.99999, 45.00000, 134.99998);
	// SetDynamicObjectMaterial(map, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map = CreateDynamicObject(3438, 1487.62793, -1689.04370, 14.95601,   -75.00001, 179.99997, -89.99999);
	// SetDynamicObjectMaterial(map, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map = CreateDynamicObject(3438, 1486.82874, -1689.04370, 16.88545,   -60.00000, 179.99998, -89.99998);
	// SetDynamicObjectMaterial(map, 0, 18646, "matcolours", "grey-80-percent", 0);
	// CreateDynamicObject(3438, 1485.55737, -1689.04370, 18.54231,   -45.00001, 179.99997, -89.99998);
	// SetDynamicObjectMaterial(map, 0, 18646, "matcolours", "grey-80-percent", 0);
	// CreateDynamicObject(639, 1484.78870, -1689.18604, 23.50384,   25.00000, 0.00000, 90.00000);
	// CreateDynamicObject(3438, 1483.90051, -1689.04370, 19.81367,   -30.00001, 179.99998, -89.99997);
	// CreateDynamicObject(3438, 1481.97107, -1689.04370, 20.61287,   -15.00000, 179.99998, -89.99996);
	// map = CreateDynamicObject(7666, 1479.9149, -1689.0267, 19.5579,   0.0000, 0.0000, 179.9999);
	// SetDynamicObjectMaterialText(map, 0, "Test Block", 140, "Arial", 70, 1, 0xFFFFFFFFFFFFFFFF, 0, 1);
	// CreateDynamicObject(3438, 1479.90051, -1689.04370, 20.88545,   0.00000, 180.00000, -89.99998);
	// CreateDynamicObject(639, 1479.76477, -1689.18604, 24.63618,   0.00000, 0.00000, 90.00000);
	// CreateDynamicObject(3438, 1477.82996, -1689.04370, 20.61287,   14.99999, 179.99998, -89.99998);
	// CreateDynamicObject(3438, 1475.90051, -1689.04370, 19.81367,   29.99999, 179.99998, -89.99998);
	// CreateDynamicObject(639, 1474.68225, -1689.18604, 23.44336,   -25.00000, 0.00000, 90.00000);
	// CreateDynamicObject(3438, 1474.26343, -1689.04089, 18.54231,   44.99999, 179.99997, -89.99997);
	// CreateDynamicObject(8650, 1479.41406, -1688.65771, 12.27527,   0.00001, 0.00000, 89.99995);
	// CreateDynamicObject(8650, 1479.41882, -1689.40723, 12.27427,   -0.00001, 0.00000, -89.99995);
	// CreateDynamicObject(3438, 1472.97229, -1689.04370, 16.88545,   59.99999, 179.99998, -89.99998);
	// CreateDynamicObject(3438, 1472.17310, -1689.04370, 14.95601,   74.99999, 179.99997, -89.99996);
	// CreateDynamicObject(3438, 1471.90051, -1689.04370, 12.88545,   89.99999, 135.00000, -44.99999);
	// CreateDynamicObject(639, 1470.79773, -1689.18604, 20.40482,   -50.00000, 0.00000, 90.00000);
	// CreateDynamicObject(639, 1468.52258, -1689.29919, 15.92513,   -75.00000, 0.00000, 90.00000);
	// CreateDynamicObject(19536, 1496.98779, -1634.33252, 12.30396,   0.00000, 0.00000, 0.00000);
	// CreateDynamicObject(19536, 1462.59827, -1620.28699, 12.27943,   0.00000, 0.00000, 0.00000);
	// CreateDynamicObject(6965, 1480.29944, -1640.43494, 15.92120,   0.00000, 0.00000, 0.00000);


	// new map1;
	// map1 = CreateDynamicObject(639, 1491.313232, -1689.186035, 15.861824, 80.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 65535, "none", "none", 0xFFFFFFFF);
	// map1 = CreateDynamicObject(639, 1489.029663, -1689.186035, 20.325087, 50.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 65535, "none", "none", 0xFFFFFFFF);
	// map1 = CreateDynamicObject(19620, 1488.067749, -1689.350098, 15.794082, 90.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterialText(map1, 0, "...", 100, "Arial", 199, 0, 0xFF59FF00, 0, 1);
	// map1 = CreateDynamicObject(3438, 1487.900513, -1689.043701, 12.885448, -89.999992, 45.000004, 134.999985, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(3438, 1487.627930, -1689.043701, 14.956005, -75.000008, 179.999969, -89.999992, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(3438, 1486.828735, -1689.043701, 16.885448, -60.000000, 179.999985, -89.999977, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(3438, 1485.557373, -1689.043701, 18.542309, -45.000008, 179.999969, -89.999985, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(639, 1484.788696, -1689.186035, 23.503841, 25.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 65535, "none", "none", 0xFFFFFFFF);
	// map1 = CreateDynamicObject(3438, 1483.900513, -1689.043701, 19.813671, -30.000010, 179.999985, -89.999969, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(19536, 1483.987549, -1686.541870, 12.323388, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 4004, "civic07_lan", "badmarb1_LAn", 0);
	// map1 = CreateDynamicObject(19536, 1483.987549, -1686.541870, 12.313400, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 500.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 4004, "civic07_lan", "badmarb1_LAn", 0);
	// map1 = CreateDynamicObject(3438, 1481.971069, -1689.043701, 20.612865, -15.000005, 179.999985, -89.999962, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(7666, 1480.052246, -1689.470703, 15.766437, 60.495564, 270.000000, 179.999908, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterialText(map1, 0, "VGTA.VN CINEMA", 140, "Arial", 70, 1, 0xFFFFFFFF, 0, 1);
	// map1 = CreateDynamicObject(7914, 1480.185181, -1688.996704, 18.697903, 0.000000, 0.000007, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 10765, "airportgnd_sfse", "black64", 0);
	// map1 = CreateDynamicObject(7914, 1480.185181, -1688.996704, 18.697903, 0.000000, 0.000015, 179.999939, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-93-percent", 0);
	// map1 = CreateDynamicObject(7914, 1480.185181, -1688.996704, 19.797903, 0.000000, 0.000007, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 10765, "airportgnd_sfse", "black64", 0);
	// map1 = CreateDynamicObject(7914, 1480.185181, -1688.996704, 19.797903, 0.000000, 0.000015, 179.999939, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-93-percent", 0);
	// map1 = CreateDynamicObject(7914, 1479.914917, -1689.026733, 19.557898, 0.000000, 0.000007, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 200.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 11009, "dkcargoshp", "frate64_blue", 0xFFFFFFFF);
	// map1 = CreateDynamicObject(3438, 1479.900513, -1689.043701, 20.885448, -0.000005, 180.000000, -89.999985, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(7914, 1479.684692, -1688.996704, 18.697903, 0.000000, 0.000007, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 10765, "airportgnd_sfse", "black64", 0);
	// map1 = CreateDynamicObject(7914, 1479.684692, -1688.996704, 18.697903, 0.000000, 0.000015, 179.999939, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-93-percent", 0);
	// map1 = CreateDynamicObject(639, 1479.764771, -1689.186035, 24.636181, 0.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 65535, "none", "none", 0xFFFFFFFF);
	// map1 = CreateDynamicObject(7914, 1479.684692, -1688.996704, 19.797903, 0.000000, 0.000007, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 10765, "airportgnd_sfse", "black64", 0);
	// map1 = CreateDynamicObject(7914, 1479.684692, -1688.996704, 19.797903, 0.000000, 0.000015, 179.999939, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-93-percent", 0);
	// CreateDynamicObject(1280, 1485.759521, -1677.473633, 12.713825, -0.000007, 0.000007, -0.000022, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 0
	// CreateDynamicObject(1280, 1485.759521, -1677.473633, 12.713825, -0.000007, 0.000007, -0.000022, -1, -1, -1, STREAMER_OBJECT_SD, 90.0); // 0
	// map1 = CreateDynamicObject(3438, 1477.829956, -1689.043701, 20.612865, 14.999992, 179.999985, -89.999977, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(4186, 1479.554688, -1683.018921, 18.328100, 0.000000, 0.000045, -0.000159, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 2
	// SetDynamicObjectMaterial(map1, 0, 4829, "airport_las", "Grass_128HV", 0);
	// SetDynamicObjectMaterial(map1, 3, 3979, "civic01_lan", "sl_concretewall1", 0);
	// map1 = CreateDynamicObject(4186, 1479.554688, -1683.018921, 18.338064, 0.000000, 0.000045, -0.000159, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 2
	// SetDynamicObjectMaterial(map1, 0, 4829, "airport_las", "Grass_128HV", 0);
	// SetDynamicObjectMaterial(map1, 3, 3979, "civic01_lan", "sl_concretewall1", 0);
	// map1 = CreateDynamicObject(3438, 1475.900513, -1689.043701, 19.813671, 29.999990, 179.999985, -89.999977, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// CreateDynamicObject(1231, 1479.811646, -1679.218994, 14.965218, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 0
	// CreateDynamicObject(1231, 1479.811646, -1679.218994, 14.965218, 0.000000, 0.000000, 0.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 0
	// map1 = CreateDynamicObject(639, 1474.682251, -1689.186035, 23.443359, -25.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 65535, "none", "none", 0xFFFFFFFF);
	// map1 = CreateDynamicObject(3438, 1474.243652, -1689.043701, 18.542309, 44.999992, 179.999969, -89.999969, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(8650, 1473.253296, -1689.018555, 12.275273, 0.000014, 0.000000, 89.999954, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 2
	// SetDynamicObjectMaterial(map1, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0);
	// SetDynamicObjectMaterial(map1, 1, 13691, "bevcunto2_lahills", "aamanbev96x", 0);
	// map1 = CreateDynamicObject(8650, 1473.253296, -1689.018555, 12.274271, -0.000014, 0.000000, -89.999954, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 2
	// SetDynamicObjectMaterial(map1, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0);
	// SetDynamicObjectMaterial(map1, 1, 13691, "bevcunto2_lahills", "aamanbev96x", 0);
	// map1 = CreateDynamicObject(8650, 1473.253296, -1689.018555, 12.275273, 0.000014, 0.000000, 89.999954, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 2
	// SetDynamicObjectMaterial(map1, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0);
	// SetDynamicObjectMaterial(map1, 1, 13691, "bevcunto2_lahills", "aamanbev96x", 0);
	// map1 = CreateDynamicObject(8650, 1473.253296, -1689.018555, 12.274271, -0.000014, 0.000000, -89.999954, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 2
	// SetDynamicObjectMaterial(map1, 0, 13691, "bevcunto2_lahills", "aamanbev96x", 0);
	// SetDynamicObjectMaterial(map1, 1, 13691, "bevcunto2_lahills", "aamanbev96x", 0);
	// map1 = CreateDynamicObject(3438, 1472.972290, -1689.043701, 16.885448, 59.999989, 179.999985, -89.999977, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(3438, 1472.173096, -1689.043701, 14.956005, 74.999992, 179.999969, -89.999962, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(3438, 1471.900513, -1689.043701, 12.885448, 89.999992, 135.000000, -44.999992, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 18646, "matcolours", "grey-80-percent", 0);
	// map1 = CreateDynamicObject(639, 1470.797729, -1689.186035, 20.404821, -50.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 65535, "none", "none", 0xFFFFFFFF);
	// map1 = CreateDynamicObject(639, 1468.454224, -1689.186035, 15.925125, -75.000000, 0.000000, 90.000000, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 1
	// SetDynamicObjectMaterial(map1, 0, 65535, "none", "none", 0xFFFFFFFF);
	// CreateDynamicObject(1280, 1473.968140, -1677.473633, 12.713825, 0.000000, 0.000007, 179.999969, -1, -1, -1, STREAMER_OBJECT_SD, 90.0); // 0
	// CreateDynamicObject(1280, 1473.968140, -1677.473633, 12.713825, 0.000000, 0.000007, 179.999969, -1, -1, -1, STREAMER_OBJECT_SD, 300.0); // 0

	

	return 1;

}

forward OnCefBrowserCreated(player_id, browser_id, status_code);
public OnCefBrowserCreated(player_id, browser_id, status_code)
{
        SCMf(player_id, -1, "public OnCefBrowserCreated(player_id(%i), browser_id(%i), status_code(%i))", player_id, browser_id, status_code);
    if (status_code != 200)
        {
                SendClientMessage(player_id, -1, "Ban da gap su cu voi internet.");
                return;
        }
        else
        {
            SendClientMessage(player_id, -1, "Ket noi thanh cong!");
        }
        return;
}

forward OnCefInitialize(player_id, success);
public OnCefInitialize(player_id, success)
{
        SCMf(player_id, -1, "public OnCefInitialize(player_id(%i), success(%i))", player_id, success);
        return;
}

stock initialize_interface(playerid)
{
        cef_create_browser(playerid, CEF_INTERFACE_BROWSER_ID, "lien ket cua ban", false, false);
        return 1;
}

CMD:test1(playerid, params[]) 
{
	return SetPlayerPos(playerid, 1480.587280, -1691.567261, 13.355384);
}

CMD:hidecef(playerid, params[])
{
	return cef_destroy_browser(playerid, CEF_INTERFACE_BROWSER_ID);
} 
CMD:cef(playerid, params[]){
	return initialize_interface(playerid);
} 
CMD:dev(playerid, params[]){
	cef_toggle_dev_tools(playerid, CEF_INTERFACE_BROWSER_ID, true);
	return 1;
} 
CMD:sound(playerid, params[]){
	return cef_set_audio_settings(playerid, CEF_INTERFACE_BROWSER_IDS, CEF_DEFAULT_MAX_DIST, CEF_DEFAULT_REF_DIST);
} 
CMD:plugin(playerid, params[]) {
	return SCMf(playerid, -1, "Cam vao - %s", cef_player_has_plugin(playerid) ? ("Nap vao") : ("van chuyen"));
}

CMD:url(playerid, params[]) // команда локального воспроизведения т.е видите видео только вы
{
	return ShowPlayerDialog(playerid,10124,DIALOG_STYLE_INPUT,"Video cua ban","{00FF40}duy tri video long tieng truc tiep","Ок","huy bo");
}

CMD:urlall(playerid, params[]) // команда глобального воспроизведения т.е видят видео все
{
	return ShowPlayerDialog(playerid,10125,DIALOG_STYLE_INPUT,"Video cua ban","{00FF40}duy tri video long tieng truc tiep","Ок","huy bo");
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 10124)
        {

                if(!strlen(inputtext)){
                    SendClientMessage(playerid,0xFF99FFFF,"Ban da khong nhap URL!");
                    return 1;
                }else{
                    cef_create_ext_browser(playerid, 1, "", inputtext, 10);//Видео будет показываться только у вас
                                        CinemaObject = CreatePlayerObject(playerid, 7914, 1479.91492, -1689.02673, 19.55790, 0.00000, 0.00001, 0.00000);
                                        SetPlayerObjectMaterial(playerid, CinemaObject, 0, 10765, "airportgnd_sfse", "black64", 0);
                                        cef_append_to_object(playerid, 1, CinemaObject);
                                        cef_set_audio_settings(playerid, 1, 100.0, 100.0);
        }
    }
    if(dialogid == 10125)
        {
        foreach(new i : Player)
                {
                if(!strlen(inputtext)){
                    SendClientMessage(playerid,0xFF99FFFF,"Ban da khong nhap URL!");
                    return 1;
                }else{
                    cef_create_ext_browser(i, 1, "", inputtext, 10);//Видео будет показываться у всех одновременно
                    CinemaObject = CreatePlayerObject(i, 7914, 1479.91492, -1689.02673, 19.55790, 0.00000, 0.00001, 0.00000);
                    SetPlayerObjectMaterial(i, CinemaObject, 0, 10765, "airportgnd_sfse", "black64", 0);
                    cef_append_to_object(i, 1, CinemaObject);
                    cef_set_audio_settings(i, 1, 100.0, 100.0);
                }
        }
    }
	return 1;
}

forward video (playerid);
public video (playerid)
{
    initialize_cef_block(playerid);
        return 1;
}

stock initialize_cef_block(playerid)
{
 	cef_create_ext_browser(playerid, 1, "", "Tham khao cua ban cho mot video toan cau", 10);
	CinemaObject = CreateDynamicObject(7914, 1479.91492, -1689.02673, 19.55790, 0.00000, 0.00001, 0.00000);
	SetPlayerObjectMaterial(playerid, CinemaObject, 0, 10765, "airportgnd_sfse", "black64", 0);
	cef_append_to_object(playerid, 1, CinemaObject);
	cef_set_audio_settings(playerid, 1, 100.0, 100.0);
	return 1;
}
//Ëîêàëüíîå âèäåî
CMD:cef_local(playerid, params[])
{
initialize_cef_local(playerid);
}

stock initialize_cef_local(playerid)
{
 	cef_create_ext_browser(playerid, 1, "", "Lien ket cua ban cho vieo cuc bo", 10);
	CinemaObject = CreatePlayerObject(playerid, 7914, 1479.91492, -1689.02673, 19.55790, 0.00000, 0.00001, 0.00000);
	SetPlayerObjectMaterial(playerid, CinemaObject, 0, 10765, "airportgnd_sfse", "black64", 0);
	cef_append_to_object(playerid, 1, CinemaObject);
	cef_set_audio_settings(playerid, 1, 100.0, 100.0);
	return 1;
}
/////////////

