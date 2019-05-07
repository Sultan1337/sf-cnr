/*
 * Irresistible Gaming (c) 2018
 * Developed by Lorenc
 * Module:
 * Purpose:
 */

/* ** Includes ** */
#include 							< YSI\y_hooks >

/* ** Definitions ** */
#if defined MAX_FACILITIES
	#define MAX_TURFS 				( sizeof( g_gangzoneData ) + MAX_FACILITIES )
#else
	#define MAX_TURFS 				( sizeof( g_gangzoneData ) )
#endif

#define INVALID_GANG_TURF 			( -1 )
#define TAKEOVER_NEEDED_PEOPLE		( 1 )

#define COLOR_GANGZONE              0x00000080

/*
	Mean (μ): 61551.012315113
	Median: 38190.51
	Modes: 36520.39 56000.00
	Lowest value: 1561.59
	Highest value: 663634.31
	Range: 662072.72
	Interquartile range: 54438.43
	First quartile: 19224.91
	Third quartile: 73663.34
	Variance (σ2): 5620059337.0135
	Standard deviation (σ): 74967.055010941
	Quartile deviation: 27219.215
	Mean absolute deviation (MAD): 47203.259159645
*/

#define TURF_SIZE_SMALL 			19224.91
#define TURF_SIZE_LARGE 			73663.34

/* ** Variables ** */
enum e_GANG_ZONE_DATA
{
	E_NAME[ 16 ],
	Float: E_MIN_X,
	Float: E_MIN_Y,
	Float: E_MAX_X,
	Float: E_MAX_Y,
	Float: E_SIZE,
	E_CITY
};

new const
	g_gangzoneData[ ] [ e_GANG_ZONE_DATA ] =
	{
		{ "SF-CITY", -2076.0, 1036.5, -1873.0, 1088.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -2014.0, 937.5, -1873.0, 1036.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -2014.0, 829.5, -1886.0, 937.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1873.0, 937.5, -1787.0, 1112.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -2014.0, 719.5, -1886.0, 829.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1886.0, 829.5, -1788.0, 937.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1886.0, 719.5, -1788.0, 829.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1788.0, 829.5, -1723.0, 937.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1723.0, 829.5, -1642.0, 937.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1642.0, 829.5, -1564.0, 937.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1564.0, 828.5, -1421.0, 1015.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1667.0, 720.5, -1563.0, 829.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1788.0, 719.5, -1667.0, 829.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1787.0, 935.5, -1704.0, 1037.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -1787.0, 1037.5, -1704.0, 1112.5, TURF_SIZE_LARGE, CITY_SF },
		{ "SF-CITY", -2130.0, 816.5, -2014.0, 1036.5, TURF_SIZE_LARGE, CITY_SF }
		// { "ELS3c",	2381.677,	-1494.030,	2421.030,	-1454.348,	1561.60,	CITY_LS },
		// { "LVA5",	1236.630,	1163.410,	1277.050,	1203.280,	1611.54,	CITY_LV },
		// { "BINT3",	1277.050,	1044.687,	1315.348,	1087.630,	1644.62,	CITY_LV },
		// { "SUN3c",	1252.328,	-926.999,	1357.000,	-910.169,	1761.63,	CITY_LS },
		// { "LVA4",	1315.348,	1044.687,	1375.598,	1087.630,	2587.31,	CITY_LV },
		// { "LFL1a",	2581.729,	-1454.348,	2632.830,	-1393.420,	3113.48,	CITY_LS },
		// { "LDT1a",	1370.848,	-1170.869,	1463.900,	-1130.848,	3724.03,	CITY_LS },
		// { "ESPE1",	-1620.300,	1176.520,	-1580.010,	1274.260,	3937.94,	CITY_SF },
		// { "JEF1a",	2185.330,	-1210.739,	2281.447,	-1154.588,	5397.06,	CITY_LS },
		// { "MUL7b",	1318.130,	-910.169,	1357.000,	-768.026,	5525.09,	CITY_LS },
		// { "JEF3a",	1996.910,	-1449.670,	2056.860,	-1350.718,	5932.18,	CITY_LS },
		// { "JTW2",	1236.630,	2142.860,	1297.468,	2243.229,	6106.24,	CITY_LV },
		// { "JEF3c",	2124.656,	-1494.030,	2266.208,	-1449.670,	6279.24,	CITY_LS },
		// { "JTN6",	1848.400,	2478.489,	1938.800,	2553.489,	6780.00,	CITY_LV },
		// { "ROD4c",	422.678,	-1570.197,	466.221,	-1406.050,	7147.45,	CITY_LS },
		// { "LDT1c",	1391.050,	-1026.328,	1463.900,	-926.999,	7236.11,	CITY_LS },
		// { "REDW4",	1704.588,	2243.229,	1777.390,	2342.830,	7251.15,	CITY_LV },
		// { "LMEX1b",	1758.900,	-1722.260,	1812.619,	-1577.588,	7771.63,	CITY_LS },
		// { "BINT4",	1375.598,	823.228,	1457.390,	919.447,	7869.94,	CITY_LV },
		// { "ROD1c",	334.502,	-1501.947,	422.678,	-1406.050,	8455.81,	CITY_LS },
		// { "RIH6a",	225.164,	-1369.619,	334.502,	-1292.067,	8479.38,	CITY_LS },
		// { "LDT6",	1724.760,	-1250.900,	1812.619,	-1150.869,	8788.62,	CITY_LS },
		// { "STRIP4",	2027.400,	1703.229,	2137.395,	1783.229,	8799.59,	CITY_LV },
		// { "LDT1b",	1378.328,	-1130.848,	1463.900,	-1026.328,	8943.98,	CITY_LS },
		// { "BINT2",	1197.390,	1044.687,	1277.050,	1163.390,	9455.88,	CITY_LV },
		// { "CONF1a",	1073.218,	-1842.270,	1323.900,	-1804.208,	9541.46,	CITY_LS },
		// { "SILLY3",	-2270.040,	-430.276,	-2178.687,	-324.114,	9698.21,	CITY_SF },
		// { "MUL5a",	1096.468,	-910.169,	1169.130,	-768.026,	10328.39,	CITY_LS },
		// { "YBELL2",	1457.458,	2723.229,	1534.560,	2863.229,	10794.28,	CITY_LV },
		// { "STRIP3",	2027.400,	1783.229,	2162.385,	1863.229,	10798.79,	CITY_LV },
		// { "JEF1b",	2056.860,	-1210.739,	2185.330,	-1126.317,	10845.69,	CITY_LS },
		// { "MUL5b",	952.604,	-937.184,	1096.468,	-860.619,	11014.94,	CITY_LS },
		// { "ALDEA",	-1372.140,	2498.520,	-1277.588,	2615.350,	11046.51,	CITY_DESERTS },
		// { "CHC2a",	2126.860,	-1126.317,	2185.330,	-934.489,	11216.17,	CITY_LS },
		// { "CHC1a",	1994.328,	-1100.817,	2056.860,	-920.815,	11255.90,	CITY_LS },
		// { "RIH5b",	647.557,	-954.661,	768.692,	-860.619,	11391.77,	CITY_LS },
		// { "LVA3",	1277.050,	1087.630,	1375.598,	1203.280,	11397.07,	CITY_LV },
		// { "JTN7",	1377.390,	2433.229,	1534.560,	2507.229,	11630.58,	CITY_LV },
		// { "LIND2b",	2201.820,	-2095.000,	2324.000,	-1989.900,	12841.10,	CITY_LS },
		// { "JTN8",	1704.588,	2342.830,	1848.400,	2433.229,	13000.45,	CITY_LV },
		// { "SUN3a",	1252.328,	-1130.848,	1378.328,	-1026.328,	13169.52,	CITY_LS },
		// { "LMEX1a",	1701.900,	-1842.270,	1812.619,	-1722.260,	13287.38,	CITY_LS },
		// { "WESTP3",	-2411.218,	373.539,	-2253.540,	458.411,	13382.44,	CITY_SF },
		// { "RIH6b",	225.164,	-1292.067,	466.221,	-1235.067,	13740.24,	CITY_LS },
		// { "SUN3b",	1252.328,	-1026.328,	1391.050,	-926.999,	13779.11,	CITY_LS },
		// { "ELS3b",	2266.260,	-1494.030,	2381.677,	-1372.040,	14079.71,	CITY_LS },
		// { "JTE2",	2623.177,	943.234,	2749.895,	1055.958,	14284.16,	CITY_LV },
		// { "LIND4c",	2541.697,	-1941.400,	2703.580,	-1852.869,	14331.66,	CITY_LS },
		// { "CHC1b",	2056.860,	-1126.317,	2126.860,	-920.815,	14385.14,	CITY_LS },
		// { "JTE3",	2625.156,	2202.760,	2685.156,	2442.550,	14387.40,	CITY_LV },
		// { "ROD1b",	225.164,	-1501.947,	334.502,	-1369.619,	14468.48,	CITY_LS },
		// { "JTE4",	2536.427,	2442.550,	2685.156,	2542.550,	14872.90,	CITY_LV },
		// { "ROD2a",	334.502,	-1406.050,	466.221,	-1292.067,	15013.73,	CITY_LS },
		// { "VIN1b",	647.557,	-1227.280,	787.460,	-1118.280,	15249.42,	CITY_LS },
		// { "ROD3b",	422.678,	-1684.650,	558.098,	-1570.197,	15499.22,	CITY_LS },
		// { "JTN1",	2498.208,	2542.550,	2685.156,	2626.550,	15703.63,	CITY_LV },
		// { "LDT7",	1724.760,	-1430.869,	1812.619,	-1250.900,	15811.89,	CITY_LS },
		// { "ROD1a",	225.164,	-1684.650,	312.803,	-1501.947,	16011.91,	CITY_LS },
		// { "JEF3b",	2056.860,	-1449.670,	2266.208,	-1372.040,	16251.67,	CITY_LS },
		// { "SUN4",	1096.468,	-1130.838,	1252.328,	-1026.328,	16288.92,	CITY_LS },
		// { "VERO2",	1046.150,	-1722.260,	1161.520,	-1577.588,	16690.80,	CITY_LS },
		// { "COM1a",	1323.900,	-1722.260,	1440.900,	-1577.588,	16926.62,	CITY_LS },
		// { "MUL7a",	1357.000,	-926.999,	1463.900,	-768.026,	16994.22,	CITY_LS },
		// { "ROD4b",	466.221,	-1570.197,	558.098,	-1385.067,	17009.19,	CITY_LS },
		// { "MUL5c",	911.802,	-860.619,	1096.468,	-768.026,	17098.78,	CITY_LS },
		// { "MUL4",	768.692,	-954.661,	952.604,	-860.619,	17295.44,	CITY_LS },
		// { "JTS2",	2377.385,	788.893,	2537.385,	897.901,	17441.27,	CITY_LV },
		// { "IWD3a",	1812.619,	-1852.869,	1971.660,	-1742.310,	17583.41,	CITY_LS },
		// { "LDOC1a",	2089.000,	-2394.330,	2201.820,	-2235.840,	17880.85,	CITY_LS },
		// { "COM1b",	1370.848,	-1577.588,	1463.900,	-1384.947,	17925.63,	CITY_LS },
		// { "JTN3",	2121.395,	2508.229,	2237.395,	2663.166,	17972.69,	CITY_LV },
		// { "SUN2",	1096.468,	-1026.328,	1252.328,	-910.169,	18104.53,	CITY_LS },
		// { "GLN2a",	1812.619,	-1449.670,	1996.910,	-1350.718,	18235.96,	CITY_LS },
		// { "SFAIR2",	-1242.979,	-50.096,	-1213.910,	578.395,	18269.58,	CITY_SF },
		// { "STRIP2",	2106.697,	1863.229,	2162.385,	2202.760,	18907.79,	CITY_LV },
		// { "LIND4a",	2541.697,	-2059.229,	2703.580,	-1941.400,	19074.51,	CITY_LS },
		// { "MAR2",	807.921,	-1577.588,	926.921,	-1416.250,	19199.22,	CITY_LS },
		// { "VAIR3",	1457.369,	1143.208,	1777.400,	1203.280,	19224.91,	CITY_LV },
		// { "IWD3b",	1812.619,	-1742.310,	1951.660,	-1602.310,	19465.74,	CITY_LS },
		// { "ESPE2",	-1580.010,	1025.979,	-1499.890,	1274.260,	19892.27,	CITY_SF },
		// { "LDT3",	1370.848,	-1384.947,	1463.900,	-1170.869,	19920.38,	CITY_LS },
		// { "ROD3a",	312.803,	-1684.650,	422.678,	-1501.947,	20074.49,	CITY_LS },
		// { "PER1",	1440.900,	-1722.260,	1583.500,	-1577.588,	20630.22,	CITY_LS },
		// { "MUL1a",	687.802,	-860.619,	911.802,	-768.026,	20740.83,	CITY_LS },
		// { "GANTB1",	-2741.070,	1490.468,	-2616.395,	1659.680,	21096.51,	CITY_SF },
		// { "CHC2b",	2185.330,	-1154.588,	2281.447,	-934.489,	21155.24,	CITY_LS },
		// { "MUL6",	1169.130,	-910.169,	1318.130,	-768.026,	21179.30,	CITY_LS },
		// { "JTN4",	1938.800,	2508.229,	2121.395,	2624.229,	21181.01,	CITY_LV },
		// { "COM3",	1667.958,	-1577.588,	1812.619,	-1430.869,	21224.51,	CITY_LS },
		// { "ROD5a",	72.648,		-1544.170,	225.164,	-1404.968,	21230.53,	CITY_LS },
		// { "ROCE2",	2536.427,	2202.760,	2625.156,	2442.550,	21276.33,	CITY_LV },
		// { "ROD5b",	72.648,		-1684.650,	225.164,	-1544.170,	21425.44,	CITY_LS },
		// { "MKT4",	952.663,	-1310.208,	1072.660,	-1130.848,	21522.66,	CITY_LS },
		// { "CHC4b",	2632.739,	-1135.040,	2747.739,	-945.033,	21850.80,	CITY_LS },
		// { "MUL1c",	861.085,	-674.885,	1156.550,	-600.895,	21861.45,	CITY_COUNTRY },
		// { "THEA3",	-2253.540,	373.539,	-1993.280,	458.411,	22088.78,	CITY_SF },
		// { "REDE3",	1848.400,	2342.830,	2011.937,	2478.489,	22185.25,	CITY_LV },
		// { "SFDWT4",	-1580.010,	744.267,	-1499.890,	1025.979,	22570.76,	CITY_SF },
		// { "CONF1b",	1046.150,	-1804.208,	1323.900,	-1722.260,	22761.05,	CITY_LS },
		// { "RIH5a",	647.557,	-1118.280,	787.460,	-954.661,	22890.79,	CITY_LS },
		// { "OCEAF1",	-2994.489,	277.411,	-2867.850,	458.411,	22921.64,	CITY_SF },
		// { "GGC2",	964.390,	930.890,	1166.530,	1044.687,	23002.92,	CITY_LV },
		// { "GLN1b",	1812.619,	-1100.817,	1994.328,	-973.380,	23156.44,	CITY_LS },
		// { "LVA2",	1375.598,	919.447,	1457.369,	1203.280,	23209.30,	CITY_LV },
		// { "TOM",	-405.769,	1712.859,	-276.717,	1892.750,	23215.29,	CITY_DESERTS },
		// { "VERO3",	1161.520,	-1722.260,	1323.900,	-1577.588,	23491.83,	CITY_LS },
		// { "ELS1a",	2281.447,	-1372.040,	2381.677,	-1135.040,	23754.50,	CITY_LS },
		// { "CALI2",	2137.395,	1703.229,	2437.385,	1783.229,	23999.19,	CITY_LV },
		// { "IWD4",	1951.660,	-1742.310,	2124.656,	-1602.310,	24219.43,	CITY_LS },
		// { "PILL2",	2624.395,	1383.229,	2685.156,	1783.229,	24304.39,	CITY_LV },
		// { "IWD2",	2124.656,	-1742.310,	2222.560,	-1494.030,	24307.62,	CITY_LS },
		// { "WESTP1",	-2533.040,	458.411,	-2329.310,	578.395,	24444.33,	CITY_SF },
		// { "SFDWT2",	-1871.718,	1176.420,	-1620.300,	1274.260,	24598.72,	CITY_SF },
		// { "COM4",	1583.500,	-1722.260,	1758.900,	-1577.588,	25375.47,	CITY_LS },
		// { "ELS1b",	2381.677,	-1454.348,	2462.125,	-1135.040,	25687.68,	CITY_LS },
		// { "MAR1",	647.710,	-1577.588,	807.921,	-1416.250,	25848.12,	CITY_LS },
		// { "RIH3a",	72.648,		-1404.968,	225.164,	-1235.067,	25912.61,	CITY_LS },
		// { "VIN1a",	647.710,	-1416.250,	787.460,	-1227.280,	26408.55,	CITY_LS },
		// { "ELS3a",	2222.560,	-1628.530,	2421.030,	-1494.030,	26694.21,	CITY_LS },
		// { "ROD4a",	558.098,	-1684.650,	647.520,	-1384.930,	26801.55,	CITY_LS },
		// { "ROD2b",	466.221,	-1385.067,	647.520,	-1235.067,	27194.85,	CITY_LS },
		// { "REDE2",	1817.390,	2202.760,	2011.937,	2342.830,	27250.21,	CITY_LV },
		// { "RING",	2162.385,	1783.229,	2437.385,	1883.229,	27500.00,	CITY_LV },
		// { "IWD5",	1971.660,	-1852.869,	2222.560,	-1742.310,	27739.24,	CITY_LS },
		// { "LIND1b",	2089.000,	-2235.840,	2201.820,	-1989.900,	27746.97,	CITY_LS },
		// { "SUN1",	952.663,	-1130.838,	1096.468,	-937.184,	27848.41,	CITY_LS },
		// { "PRP3",	1848.400,	2553.489,	1938.800,	2863.229,	28000.50,	CITY_LV },
		// { "VERO4b",	930.221,	-2006.780,	1073.218,	-1804.208,	28967.19,	CITY_LS },
		// { "BLUF1b",	1073.218,	-2006.780,	1249.619,	-1842.270,	29019.73,	CITY_LS },
		// { "VIN2",	787.460,	-1130.838,	952.604,	-954.661,	29094.57,	CITY_LS },
		// { "VIN3",	787.460,	-1310.208,	952.663,	-1130.838,	29632.46,	CITY_LS },
		// { "COM2",	1463.900,	-1577.588,	1667.958,	-1430.869,	29939.18,	CITY_LS },
		// { "MKT3",	787.460,	-1416.250,	1072.660,	-1310.208,	30243.17,	CITY_LS },
		// { "RSW2",	2377.385,	596.348,	2537.385,	788.893,	30807.19,	CITY_LV },
		// { "JTN2",	2237.395,	2542.550,	2498.208,	2663.166,	31458.21,	CITY_LV },
		// { "EBE2a",	2632.830,	-1668.130,	2747.739,	-1393.420,	31566.62,	CITY_LS },
		// { "LIND2a",	2089.000,	-1989.900,	2324.000,	-1852.869,	32202.28,	CITY_LS },
		// { "CHINA",	-2274.166,	578.395,	-2078.666,	744.169,	32408.81,	CITY_SF },
		// { "LDOC2",	2324.000,	-2145.100,	2703.580,	-2059.229,	32594.95,	CITY_LS },
		// { "EBAY",	-1132.817,	-768.026,	-956.476,	-578.117,	33488.74,	CITY_COUNTRY },
		// { "VISA2",	1817.390,	1703.229,	2027.400,	1863.229,	33601.60,	CITY_LV },
		// { "OCEAF3",	-2994.489,	-430.276,	-2831.885,	-222.589,	33770.73,	CITY_SF },
		// { "RIH1a",	321.355,	-860.619,	687.802,	-768.026,	33930.43,	CITY_LS },
		// { "RIH1b",	321.355,	-768.026,	700.794,	-674.885,	35341.32,	CITY_COUNTRY },
		// { "STAR1",	2162.385,	1883.229,	2437.385,	2012.180,	35461.53,	CITY_LV },
		// { "EBE2b",	2747.739,	-1668.130,	2959.350,	-1498.619,	35870.40,	CITY_LS },
		// { "JEF2",	2056.860,	-1372.040,	2281.447,	-1210.739,	36226.09,	CITY_LS },
		// { "LDT4",	1463.900,	-1290.869,	1724.760,	-1150.869,	36520.39,	CITY_LS },
		// { "LDT5",	1463.900,	-1430.869,	1724.760,	-1290.869,	36520.39,	CITY_LS },
		// { "JTS1",	1457.390,	823.228,	2377.385,	863.229,	36800.69,	CITY_LV },
		// { "ELS4",	2421.030,	-1628.530,	2632.830,	-1454.348,	36891.75,	CITY_LS },
		// { "GGC1",	964.390,	1044.687,	1197.390,	1203.218,	36937.72,	CITY_LV },
		// { "CHC4a",	2747.739,	-1120.040,	2959.350,	-945.033,	37033.42,	CITY_LS },
		// { "MUL1b",	737.572,	-768.026,	1142.290,	-674.885,	37695.83,	CITY_COUNTRY },
		// { "LDOC3b",	2201.820,	-2730.875,	2324.000,	-2418.330,	38186.71,	CITY_LS },
		// { "ELS2",	2462.125,	-1454.348,	2581.729,	-1135.040,	38190.51,	CITY_LS },
		// { "GAN1",	2222.560,	-1722.328,	2632.830,	-1628.530,	38482.49,	CITY_LS },
		// { "CUNTC2",	-2831.885,	-430.276,	-2646.395,	-222.589,	38523.85,	CITY_SF },
		// { "LIND1a",	1970.619,	-2179.250,	2089.000,	-1852.869,	38637.30,	CITY_LS },
		// { "ESPN3",	-1982.317,	1274.260,	-1524.239,	1358.900,	38771.73,	CITY_SF },
		// { "HIGH",	1817.390,	1283.229,	2027.390,	1469.229,	39060.00,	CITY_LV },
		// { "LDOC1b",	2201.820,	-2418.330,	2324.000,	-2095.000,	39504.44,	CITY_LS },
		// { "LDM",	1823.078,	596.348,	1997.218,	823.228,	39508.88,	CITY_LV },
		// { "SUNMA",	-2353.166,	2275.790,	-2153.166,	2475.790,	40000.00,	CITY_DESERTS },
		// { "THEA1",	-2329.310,	458.411,	-1993.280,	578.395,	40318.23,	CITY_SF },
		// { "ELCO1",	1692.619,	-2179.250,	1812.619,	-1842.270,	40437.59,	CITY_LS },
		// { "BFC1",	1375.598,	596.348,	1558.088,	823.228,	41403.32,	CITY_LV },
		// { "PINK",	1817.390,	1083.229,	2027.390,	1283.229,	42000.00,	CITY_LV },
		// { "JTW1",	1197.390,	1163.390,	1236.630,	2243.229,	42372.87,	CITY_LV },
		// { "LFL1b",	2581.729,	-1393.420,	2747.739,	-1135.040,	42893.66,	CITY_LS },
		// { "VISA1",	1817.390,	1863.229,	2106.697,	2011.828,	42990.73,	CITY_LV },
		// { "PRP4",	1938.800,	2624.229,	2121.395,	2861.550,	43333.62,	CITY_LV },
		// { "VERO1",	851.447,	-1804.208,	1046.150,	-1577.588,	44123.59,	CITY_LS },
		// { "LDS",	2749.895,	943.234,	2923.385,	1198.989,	44370.93,	CITY_LV },
		// { "LDOC3c",	2703.580,	-2302.330,	2959.350,	-2126.895,	44871.02,	CITY_LS },
		// { "LIND3",	2324.000,	-2059.229,	2541.697,	-1852.869,	44923.95,	CITY_LS },
		// { "THEA2",	-2411.218,	265.243,	-1993.280,	373.539,	45261.00,	CITY_SF },
		// { "THALL1",	1323.900,	-1842.270,	1701.900,	-1722.260,	45363.78,	CITY_LS },
		// { "MUL2b",	1269.130,	-768.026,	1414.067,	-452.424,	45742.41,	CITY_COUNTRY },
		// { "MAR3",	647.710,	-1804.208,	851.447,	-1577.588,	46170.87,	CITY_LS },
		// { "BATTP",	-2741.070,	1268.410,	-2533.040,	1490.468,	46194.73,	CITY_SF },
		// { "DRAG",	1817.390,	863.231,	2027.390,	1083.229,	46199.57,	CITY_LV },
		// { "BFLD1",	964.390,	1203.218,	1197.390,	1403.218,	46600.00,	CITY_LV },
		// { "JTN5",	1534.560,	2433.229,	1848.400,	2583.229,	47075.99,	CITY_LV },
		// { "YBELL1",	1117.400,	2723.229,	1457.458,	2863.229,	47608.11,	CITY_LV },
		// { "IWD1",	1812.619,	-1602.310,	2124.656,	-1449.670,	47629.33,	CITY_LS },
		// { "REDW1",	1297.468,	2142.860,	1777.390,	2243.229,	48169.24,	CITY_LV },
		// { "DOH1",	-2270.040,	-324.114,	-1794.920,	-222.589,	48236.56,	CITY_SF },
		// { "TOPFA",	967.382,	-450.390,	1176.780,	-217.899,	48683.15,	CITY_COUNTRY },
		// { "BARRA",	-926.130,	1398.729,	-719.234,	1634.687,	48818.76,	CITY_DESERTS },
		// { "PIRA",	1817.390,	1469.229,	2027.400,	1703.229,	49142.34,	CITY_LV },
		// { "CITYS",	-2867.850,	277.411,	-2593.437,	458.411,	49668.76,	CITY_SF },
		// { "SFGLF4",	-2646.395,	-355.493,	-2270.040,	-222.589,	50019.08,	CITY_SF },
		// { "STRIP1",	2027.400,	863.229,	2087.385,	1703.229,	50387.38,	CITY_LV },
		// { "HASH",	-2593.437,	-222.589,	-2411.218,	54.722,		50531.33,	CITY_SF },
		// { "LAIR2a",	1852.000,	-2394.330,	2089.000,	-2179.250,	50973.97,	CITY_LS },
		// { "WWE1",	1098.310,	1726.218,	1197.390,	2243.229,	51225.42,	CITY_LV },
		// { "SHERR",	-789.736,	1659.680,	-599.505,	1929.410,	51311.00,	CITY_DESERTS },
		// { "ELCO2",	1812.619,	-2179.250,	1970.619,	-1852.869,	51568.19,	CITY_LS },
		// { "SFDWT3",	-1700.010,	744.267,	-1580.010,	1176.520,	51870.35,	CITY_SF },
		// { "VALLE",	-936.668,	2611.437,	-715.960,	2847.895,	52188.17,	CITY_DESERTS },
		// { "PAYAS",	-354.332,	2580.360,	-133.625,	2816.820,	52188.36,	CITY_DESERTS },
		// { "BINT1",	1166.530,	795.010,	1375.598,	1044.687,	52199.46,	CITY_LV },
		// { "GAN2",	2222.560,	-1852.869,	2632.830,	-1722.328,	53557.06,	CITY_LS },
		// { "REDE1",	1817.390,	2011.828,	2106.697,	2202.760,	55237.96,	CITY_LV },
		// { "CALI1",	2087.385,	1543.229,	2437.385,	1703.229,	56000.00,	CITY_LV },
		// { "ROY",	2087.385,	1383.229,	2437.385,	1543.229,	56000.00,	CITY_LV },
		// { "RIH3b",	72.648,	-1235.067,	321.355,	-1008.150,		56435.84,	CITY_LS },
		// { "STAR2",	2437.385,	1783.229,	2685.156,	2012.180,	56727.42,	CITY_LV },
		// { "MUL2a",	1281.130,	-452.424,	1641.130,	-290.911,	58144.67,	CITY_COUNTRY },
		// { "SFDWT1",	-1982.317,	744.169,	-1871.718,	1274.260,	58627.53,	CITY_SF },
		// { "KACC",	2498.208,	2626.550,	2749.895,	2861.550,	59146.44,	CITY_LV },
		// { "HGP",	1777.390,	863.231,	1817.390,	2342.830,	59183.96,	CITY_LV },
		// { "LDOC3a",	2324.000,	-2302.330,	2703.580,	-2145.100,	59681.36,	CITY_LS },
		// { "RIH2",	321.355,	-1044.067,	647.557,	-860.619,	59841.10,	CITY_LS },
		// { "RIE",	1558.088,	596.348,	1823.078,	823.234,	60122.51,	CITY_LV },
		// { "EBE3c",	2632.830,	-1852.869,	2959.350,	-1668.130,	60320.98,	CITY_LS },
		// { "BLUEB",	19.607,		-404.135,	349.605,	-220.136,	60719.30,	CITY_COUNTRY },
		// { "LST",	2749.895,	1198.989,	2923.385,	1548.989,	60721.49,	CITY_LV },
		// { "GLN1",	1812.619,	-1350.718,	2056.860,	-1100.817,	61036.09,	CITY_LS },
		// { "SFDWT6",	-1993.280,	265.243,	-1794.920,	578.395,	62116.82,	CITY_SF },
		// { "REDW3",	1377.390,	2243.229,	1704.588,	2433.229,	62167.62,	CITY_LV },
		// { "RIH4",	321.355,	-1235.067,	647.520,	-1044.067,	62297.51,	CITY_LS },
		// { "GANTB",	-2741.447,	1659.680,	-2616.395,	2175.145,	64459.92,	CITY_DESERTS },
		// { "FLINTI",	-187.699,	-1596.760,	17.062,		-1276.598,	65556.68,	CITY_COUNTRY },
		// { "CHC3",	2281.447,	-1135.040,	2632.739,	-945.033,	66747.94,	CITY_LS },
		// { "SRY",	2749.895,	1548.989,	2923.385,	1937.250,	67359.39,	CITY_LV },
		// { "ISLE",	2011.937,	2202.760,	2237.395,	2508.229,	68870.42,	CITY_LV },
		// { "CIVI",	-2741.070,	458.411,	-2533.040,	793.411,	69690.06,	CITY_SF },
		// { "PLS",	2703.580,	-2126.895,	2959.350,	-1852.869,	70087.63,	CITY_LS },
		// { "MKT2",	926.921,	-1577.588,	1370.848,	-1416.250,	71622.29,	CITY_LS },
		// { "WESTP2",	-2593.437,	54.722,	-2411.218,		458.411,	73559.80,	CITY_SF },
		// { "PINT",	1098.390,	2243.229,	1377.390,	2507.229,	73656.00,	CITY_LV },
		// { "FINA",	-1871.718,	744.169,	-1701.300,	1176.420,	73663.34,	CITY_SF },
		// { "SPIN",	2121.395,	2663.166,	2498.208,	2861.550,	74753.67,	CITY_LV },
		// { "PILL1",	2437.385,	1383.229,	2624.395,	1783.229,	74804.00,	CITY_LV },
		// { "BFLD2",	964.390,	1403.218,	1197.390,	1726.218,	75259.00,	CITY_LV },
		// { "BIGE",	-410.019,	1403.338,	-137.968,	1681.229,	75600.53,	CITY_DESERTS },
		// { "DILLI",	580.794,	-674.885,	861.085,	-404.790,	75705.20,	CITY_COUNTRY },
		// { "ELQUE",	-1645.229,	2498.520,	-1372.140,	2777.850,	76281.96,	CITY_DESERTS },
		// { "ESPN1",	-2533.040,	1358.900,	-1996.660,	1501.208,	76331.15,	CITY_SF },
		// { "SFAIR3",	-1499.890,	-50.096,	-1242.979,	249.904,	77073.30,	CITY_SF },
		// { "MUL3",	1414.067,	-768.026,	1667.609,	-452.424,	80018.35,	CITY_COUNTRY },
		// { "EBE1",	2747.739,	-1498.619,	2959.350,	-1120.040,	80111.50,	CITY_LS },
		// { "MKT1",	1072.660,	-1416.250,	1370.848,	-1130.848,	85103.44,	CITY_LS },
		// { "RSW1",	1997.218,	596.348,	2377.385,	823.228,	86252.28,	CITY_LV },
		// { "PRP1",	1534.560,	2583.229,	1848.400,	2863.229,	87875.18,	CITY_LV },
		// { "EASB2",	-1794.920,	-50.096,	-1499.890,	249.904,	88509.00,	CITY_SF },
		// { "LEAFY",	-1166.968,	-1856.030,	-815.624,	-1602.067,	89228.38,	CITY_COUNTRY },
		// { "LVA1",	1457.390,	863.229,	1777.400,	1143.208,	89596.08,	CITY_LV },
		// { "PRP2",	1117.400,	2507.229,	1534.560,	2723.229,	90106.57,	CITY_LV },
		// { "BLUEB1",	104.528,	-220.136,	349.605,	152.235,	91259.20,	CITY_COUNTRY },
		// { "SFDWT5",	-2078.666,	578.395,	-1499.890,	744.267,	96002.73,	CITY_SF },
		// { "RSE",	2537.385,	676.549,	2902.350,	943.234,	97330.71,	CITY_LV },
		// { "SANB1",	-2616.395,	1501.208,	-1996.660,	1659.680,	98210.67,	CITY_SF },
		// { "PARA",	-2741.070,	793.411,	-2533.040,	1268.410,	98814.06,	CITY_SF },
		// { "CAM",	2087.385,	1203.229,	2640.395,	1383.229,	99541.80,	CITY_LV },
		// { "OVS",	2162.385,	2012.180,	2685.156,	2202.760,	99629.67,	CITY_LV },
		// { "JUNIHI",	-2533.040,	578.395,	-2274.166,	968.369,	100954.14,	CITY_SF },
		// { "JUNIHO",	-2533.040,	968.369,	-2274.166,	1358.900,	101098.33,	CITY_SF },
		// { "ROCE1",	2237.395,	2202.760,	2536.427,	2542.550,	101608.08,	CITY_LV },
		// { "JTE1",	2685.156,	1055.958,	2749.895,	2626.550,	101678.57,	CITY_LV },
		// { "VERO4a",	647.710,	-2173.290,	930.221,	-1804.208,	104269.72,	CITY_LS },
		// { "SILLY4",	-2178.687,	-599.882,	-1794.920,	-324.114,	105830.64,	CITY_SF },
		// { "ARCO",	-901.129,	2221.860,	-592.090,	2571.968,	108197.00,	CITY_DESERTS },
		// { "HAUL",	-792.254,	-698.554,	-452.403,	-380.040,	108247.30,	CITY_COUNTRY },
		// { "DAM",	-968.770,	1929.410,	-481.126,	2155.260,	110134.39,	CITY_DESERTS },
		// { "ESPN2",	-1996.660,	1358.900,	-1524.239,	1592.510,	110362.26,	CITY_SF },
		// { "ESPE3",	-1499.890,	578.395,	-1339.890,	1274.260,	111338.39,	CITY_SF },
		// { "GARC",	-2411.218,	-222.589,	-2173.040,	265.243,	116190.84,	CITY_SF },
		// { "MONT",	1119.510,	119.526,	1451.400,	493.321,	124058.83,	CITY_COUNTRY },
		// { "CREE",	2749.895,	1937.250,	2921.620,	2669.790,	125795.50,	CITY_LV },
		// { "LAIR1",	1249.619,	-2394.330,	1852.000,	-2179.250,	129560.14,	CITY_LS },
		// { "SMB2",	72.648,		-2173.290,	342.648,	-1684.650,	131932.79,	CITY_LS },
		// { "MULINT",	1463.900,	-1150.869,	1812.619,	-768.026,	133504.62,	CITY_LS },
		// { "ANGPI",	-2324.937,	-2584.290,	-1964.218,	-2212.110,	134252.37,	CITY_COUNTRY },
		// { "MEAD",	37.032,		2337.177,	435.988,	2677.895,	135931.50,	CITY_DESERTS },
		// { "OCTAN",	338.657,	1228.510,	664.307,	1655.050,	138902.76,	CITY_DESERTS },
		// { "LOT",	2087.385,	943.234,	2623.177,	1203.229,	139303.23,	CITY_LV },
		// { "REDW2",	1236.630,	1883.109,	1777.390,	2142.860,	140463.00,	CITY_LV },
		// { "SMB1",	342.648,	-2173.290,	647.710,	-1684.650,	149065.50,	CITY_LS },
		// { "BLUF2",	1249.619,	-2179.250,	1692.619,	-1842.270,	149282.12,	CITY_LS },
		// { "VAIR1",	1236.630,	1203.280,	1457.369,	1883.109,	150064.78,	CITY_LV },
		// { "FLINTR",	-594.190,	-1648.550,	-187.699,	-1276.598,	151195.15,	CITY_COUNTRY },
		// { "BLUF1a",	930.221,	-2488.416,	1249.619,	-2006.780,	153833.57,	CITY_LS },
		// { "PALO",	2160.218,	-149.003,	2576.916,	228.322,	157230.57,	CITY_COUNTRY },
		// { "LDOC4",	2373.770,	-2697.090,	2809.218,	-2330.458,	159649.20,	CITY_LS },
		// { "FARM",	-1209.670,	-1317.098,	-908.161,	-787.390,	159711.75,	CITY_COUNTRY },
		// { "SFAIR5",	-1213.910,	-50.096,	-947.979,	578.395,	167135.26,	CITY_COUNTRY },
		// { "QUARY",	337.243,	710.840,	860.554,	1031.708,	167913.75,	CITY_DESERTS },
		// { "WWE",	883.307,	1726.218,	1098.310,	2507.229,	167919.75,	CITY_LV },
		// { "CALT",	-2274.166,	744.169,	-1982.317,	1358.900,	179408.62,	CITY_SF },
		// { "EASB1",	-1794.920,	249.904,	-1242.979,	578.395,	181307.67,	CITY_SF },
		// { "DOH2",	-2173.040,	-222.589,	-1794.920,	265.243,	184459.04,	CITY_SF },
		// { "CARSO",	-376.233,	826.325,	123.717,	1220.437,	197036.29,	CITY_DESERTS },
		// { "SILLY1",	-2178.687,	-1115.578,	-1794.920,	-599.882,	197907.07,	CITY_SF },
		// { "OCEAF2",	-2994.489,	-222.589,	-2593.437,	277.411,	200526.00,	CITY_SF },
		// { "FERN",	508.187,	-139.259,	1306.660,	119.526,	206632.84,	CITY_COUNTRY },
		// { "SUNNN",	-2741.070,	2175.145,	-2353.166,	2722.790,	212433.71,	CITY_DESERTS },
		// { "VAIR2",	1457.369,	1203.280,	1777.390,	1883.109,	217559.54,	CITY_LV },
		// { "BLUAC",	-319.674,	-220.136,	104.528,	293.324,	217811.28,	CITY_COUNTRY },
		// { "BAYV",	-2994.489,	458.411,	-2741.070,	1339.609,	223312.26,	CITY_SF },
		// { "REST",	-91.583,	1655.050,	421.234,	2123.010,	239977.82,	CITY_DESERTS },
		// { "NROCK",	2285.370,	-768.026,	2770.590,	-269.739,	241778.79,	CITY_COUNTRY },
		// { "LAIR2b",	1382.729,	-2730.875,	2201.820,	-2394.330,	275660.93,	CITY_LS },
		// { "HILLP",	-2994.489,	-811.276,	-2178.687,	-430.276,	310820.56,	CITY_SF },
		// { "SANB2",	-2616.395,	1659.680,	-1996.660,	2175.145,	319451.68,	CITY_DESERTS },
		// { "SFAIR1",	-1794.920,	-730.117,	-1213.910,	-50.096,	395099.00,	CITY_SF },
		// { "PANOP",	-947.979,	-304.320,	-319.674,	327.071,	396706.12,	CITY_COUNTRY },
		// { "CREEK",	-1820.640,	-2643.677,	-1226.780,	-1771.660,	517855.96,	CITY_COUNTRY },
		// { "BACKO",	-1166.968,	-2641.187,	-321.743,	-1856.030,	663634.31,	CITY_COUNTRY }
	}
;

/* ** Variables ** */
enum E_TURF_ZONE_DATA {
	E_ID,

	E_OWNER,
	E_COLOR,

	E_AREA,
	E_FACILITY_GANG
};

new
	g_gangTurfData					[ MAX_TURFS ] [ E_TURF_ZONE_DATA ],
	Iterator: turfs 				< MAX_TURFS >,

	g_gangzoneAttacker				[ MAX_TURFS ] = { INVALID_GANG_ID, ... },
	g_gangzoneAttackCount           [ MAX_TURFS ],
	g_gangzoneAttackTimeout			[ MAX_TURFS ]
;

/* ** Forwards ** */
forward OnPlayerUpdateGangZone( playerid, zoneid );

/* ** Hooks ** */
hook OnScriptInit( )
{
	/* ** Gangzone Allocation ** */
	for ( new i = 0; i < sizeof( g_gangzoneData ); i++ ) {
		Turf_Create( g_gangzoneData[ i ] [ E_MIN_X ], g_gangzoneData[ i ] [ E_MIN_Y ], g_gangzoneData[ i ] [ E_MAX_X ], g_gangzoneData[ i ] [ E_MAX_Y ], INVALID_GANG_ID, COLOR_GANGZONE );
	}
	return 1;
}

hook OnGangUnload( gangid, bool: deleted )
{
	// Empty out the turfs
 	foreach ( new z : turfs )
 	{
 		if ( g_gangTurfData[ z ] [ E_OWNER ] == gangid )
 		{
			new
				facility_gang = g_gangTurfData[ z ] [ E_FACILITY_GANG ];

		   	if ( g_gangTurfData[ z ] [ E_FACILITY_GANG ] != INVALID_GANG_ID && Iter_Contains( gangs, g_gangTurfData[ z ] [ E_FACILITY_GANG ] ) )
		   	{
	    		g_gangTurfData[ z ] [ E_COLOR ] = setAlpha( g_gangData[ facility_gang ] [ E_COLOR ], 0x80 );
	 			g_gangTurfData[ z ] [ E_OWNER ] = facility_gang;
				GangZoneShowForAll( g_gangTurfData[ z ] [ E_ID ], g_gangTurfData[ z ] [ E_COLOR ] );
		   	}
		   	else
		   	{
	 			g_gangTurfData[ z ] [ E_COLOR ] = COLOR_GANGZONE;
	 			g_gangTurfData[ z ] [ E_OWNER ] = INVALID_GANG_ID;
				GangZoneShowForAll( g_gangTurfData[ z ] [ E_ID ], COLOR_GANGZONE );
		   	}
 		}
 	}

	return 1;
}

hook OnPlayerGangChangeColor( playerid, gangid )
{
	foreach ( new x : turfs )
	{
		// set the new color to the turfs
		if ( g_gangTurfData[ x ] [ E_OWNER ] == gangid ) {
			g_gangTurfData[ x ] [ E_COLOR ] = setAlpha( g_gangData[ gangid ] [ E_COLOR ], 0x80 );
		}

		// resume flashing if gang war
		if ( g_gangzoneAttacker[ x ] == gangid ) {
			GangZoneStopFlashForPlayer( playerid, g_gangTurfData[ x ] [ E_ID ] );
			GangZoneFlashForPlayer( playerid, g_gangTurfData[ x ] [ E_ID ], setAlpha( g_gangData[ gangid ] [ E_COLOR ], 0x80 ) );
		} else {
			GangZoneHideForPlayer( playerid, g_gangTurfData[ x ] [ E_ID ] );
			GangZoneShowForPlayer( playerid, g_gangTurfData[ x ] [ E_ID ], g_gangTurfData[ x ] [ E_COLOR ] );
		}
	}


	return 1;
}

hook OnPlayerSpawn( playerid )
{
	foreach( new zoneid : turfs )
	{
    	// resume flashing if gang war
    	if ( g_gangzoneAttacker[ zoneid ] != INVALID_GANG_ID && Iter_Contains( gangs, g_gangzoneAttacker[ zoneid ] ) ) {
    		GangZoneFlashForPlayer( playerid, g_gangTurfData[ zoneid ] [ E_ID ], setAlpha( g_gangData[ g_gangzoneAttacker[ zoneid ] ] [ E_COLOR ], 0x80 ) );
    	} else {
	        GangZoneShowForPlayer( playerid, g_gangTurfData[ zoneid ] [ E_ID ], g_gangTurfData[ zoneid ] [ E_COLOR ] );
    	}
	}

	return 1;
}

hook OnPlayerEnterDynArea( playerid, areaid )
{
	if ( ! IsPlayerNPC( playerid ) )
	{
		new
			first_turf = Turf_GetFirstTurf( playerid );

		CallLocalFunction( "OnPlayerUpdateGangZone", "dd", playerid, first_turf );
	}
	return Y_HOOKS_CONTINUE_RETURN_1;
}

hook OnPlayerLeaveDynArea( playerid, areaid )
{
	if ( ! IsPlayerNPC( playerid ) )
	{
		new
			total_areas = GetPlayerNumberDynamicAreas( playerid );

		// reduced to another area
		if ( total_areas )
		{
			new
				first_turf = Turf_GetFirstTurf( playerid );

			CallLocalFunction( "OnPlayerUpdateGangZone", "dd", playerid, first_turf );
		}

		// if the player is in no areas, then they left
		else CallLocalFunction( "OnPlayerUpdateGangZone", "dd", playerid, INVALID_GANG_TURF );
	}
	return Y_HOOKS_CONTINUE_RETURN_1;
}

public OnPlayerUpdateGangZone( playerid, zoneid )
{
	if ( ! IsPlayerMovieMode( playerid ) )
	{
		if ( zoneid == INVALID_GANG_TURF )
			return PlayerTextDrawSetString( playerid, g_ZoneOwnerTD[ playerid ], "_" );

		// if ( p_GangID[ playerid ] != INVALID_GANG_ID && g_gangTurfData[ zoneid ] [ E_OWNER ] == INVALID_GANG_ID )
		// 	ShowPlayerHelpDialog( playerid, 10000, "You can take over this turf by typing ~g~/takeover" );

		PlayerTextDrawSetString( playerid, g_ZoneOwnerTD[ playerid ], sprintf( "~r~~h~(%s)~n~~w~~h~%s", g_gangTurfData[ zoneid ] [ E_FACILITY_GANG ] != INVALID_GANG_ID ? ( "FACILITY" ) : ( "TERRITORY" ), g_gangTurfData[ zoneid ] [ E_OWNER ] == -1 ? ( "Uncaptured" ) : ( ReturnGangName( g_gangTurfData[ zoneid ] [ E_OWNER ] ) ) ) );
	}
	return 1;
}

hook OnServerGameDayEnd( )
{
	foreach(new g : gangs)
	{
		new
			afk_members, online_members = GetOnlineGangMembers( g, .afk_members = afk_members );

		if ( online_members >= TAKEOVER_NEEDED_PEOPLE )
		{
			new
				profit = 0;

			foreach( new zoneid : turfs ) if ( g_gangTurfData[ zoneid ] [ E_OWNER ] != INVALID_GANG_ID && g_gangTurfData[ zoneid ] [ E_OWNER ] == g )
			{
				// facilities will not pay out respect
				if ( g_gangTurfData[ zoneid ] [ E_FACILITY_GANG ] == INVALID_GANG_ID ) {
					g_gangData[ g ] [ E_RESPECT ] ++;
				}

				// accumulate profit
				profit += Turf_GetProfitability( zoneid, online_members - afk_members );
			}

			g_gangData[ g ] [ E_BANK ] += profit;

			if ( profit > 0 ) {
				SaveGangData( g );
				SendClientMessageToGang( g, g_gangData[ g ] [ E_COLOR ], "[GANG] "COL_GOLD"%s"COL_WHITE" has been earned from territories and deposited in the gang bank account.", cash_format( profit ) );
			}
		}
	}

	return 1;
}

hook OnServerTickSecond( )
{
	new
		oCount = 0;

    foreach( new z : turfs )
	{
	    if ( g_gangzoneAttacker[ z ] != INVALID_GANG_ID )
	    {
	    	new
	    		attacker_member_count = GetPlayersInGangZone( z, g_gangzoneAttacker[ z ] );

	        if ( attacker_member_count >= TAKEOVER_NEEDED_PEOPLE )
	        {
	          	if ( g_gangTurfData[ z ] [ E_OWNER ] != INVALID_GANG_ID )
			      	oCount = GetPlayersInGangZone( z, g_gangTurfData[ z ] [ E_OWNER ] );

				new
					attacker_time_required = -10 * ( attacker_member_count - TAKEOVER_NEEDED_PEOPLE ) + ( g_gangTurfData[ z ] [ E_FACILITY_GANG ] == INVALID_GANG_ID ? 60 : 120 );

			   	// minimum of 20 seconds
				if ( attacker_time_required < 20 )
					attacker_time_required = 20;

	            if ( g_gangzoneAttackCount[ z ] < attacker_time_required && oCount == 0 )
	            {
	            	foreach ( new i : Player ) if ( p_Class[ i ] != CLASS_POLICE && p_GangID[ i ] == g_gangzoneAttacker[ z ] && IsPlayerInDynamicArea( i, g_gangTurfData[ z ] [ E_AREA ] ) ) {
						if ( p_WantedLevel[ i ] < 2 ) GivePlayerWantedLevel( i, 2 - p_WantedLevel[ i ] );
	            		ShowPlayerHelpDialog( i, 1500, "~r~Control~w~ the area for %d seconds!", attacker_time_required - g_gangzoneAttackCount[ z ] );
	            	}
	            	g_gangzoneAttackCount[ z ] ++;
                 	g_gangzoneAttackTimeout[ z ] = 0;
					continue;
				}
	            else if ( g_gangzoneAttackCount[ z ] >= attacker_time_required )
	            {
	            	static szLocation[ MAX_ZONE_NAME ], szCity[ MAX_ZONE_NAME ];

                 	new earned_money = 0;
                 	new owner_gang = g_gangTurfData[ z ] [ E_OWNER ];
                 	new attacker_gang = g_gangzoneAttacker[ z ];

					new Float: min_x, Float: min_y;
					Streamer_GetFloatData( STREAMER_TYPE_AREA, g_gangTurfData[ z ] [ E_AREA ], E_STREAMER_MIN_X, min_x );
					Streamer_GetFloatData( STREAMER_TYPE_AREA, g_gangTurfData[ z ] [ E_AREA ], E_STREAMER_MIN_Y, min_y );

				    Get2DCity 				( szCity, min_x, min_y );
				    GetZoneFromCoordinates 	( szLocation, min_x, min_y );

	                GangZoneStopFlashForAll	( g_gangTurfData[ z ] [ E_ID ] );
					GangZoneShowForAll 		( g_gangTurfData[ z ] [ E_ID ], setAlpha( g_gangData[ g_gangzoneAttacker[ z ] ] [ E_COLOR ], 0x80 ) );

					g_gangTurfData[ z ] [ E_COLOR ] = setAlpha( g_gangData[ g_gangzoneAttacker[ z ] ] [ E_COLOR ], 0x80 );
	                g_gangTurfData[ z ] [ E_OWNER ] = g_gangzoneAttacker[ z ];

                 	g_gangzoneAttacker 		[ z ] = INVALID_GANG_ID;
	                g_gangzoneAttackCount	[ z ] = 0;
                 	g_gangzoneAttackTimeout	[ z ] = 0;

                 	// Money Grub
                 	if ( Iter_Contains( gangs, owner_gang ) )
					{
						new afk_opmembers, online_opmembers = GetOnlineGangMembers( owner_gang, .afk_members = afk_opmembers );
						new zone_money = Turf_GetProfitability( z, online_opmembers - afk_opmembers );

						if ( g_gangData[ owner_gang ] [ E_BANK ] > zone_money )
						{
							// deduct from gang bank and give to op, take 10% as fee
				            g_gangData[ owner_gang ] [ E_BANK ] -= zone_money;
				            SaveGangData( owner_gang );

				           	earned_money = floatround( float( zone_money ) * 0.9 );
				            g_gangData[ attacker_gang ] [ E_BANK ] += earned_money;
				       	}

				      	// credit respect
						g_gangData[ attacker_gang ] [ E_RESPECT ] ++;
						SaveGangData( attacker_gang );
					}

					// Alert gang
					if ( earned_money ) {
						SendClientMessageToGang	( attacker_gang, g_gangData[ attacker_gang ] [ E_COLOR ], "[GANG]{FFFFFF} We have captured a turf near %s in %s and earned "COL_GOLD"%s"COL_WHITE"!", szLocation, szCity, cash_format( earned_money ) );
					} else {
						SendClientMessageToGang	( attacker_gang, g_gangData[ attacker_gang ] [ E_COLOR ], "[GANG]{FFFFFF} We have captured a turf near %s in %s!", szLocation, szCity );
					}

                 	// Give Gangmembers XP & Wanted
					foreach(new d : Player)
					{
						new in_area = IsPlayerInDynamicArea( d, g_gangTurfData[ z ] [ E_AREA ] );

						if ( in_area )
							PlayerTextDrawSetString( d, g_ZoneOwnerTD[ d ], sprintf( "~r~~h~(%s)~n~~w~~h~%s", g_gangTurfData[ z ] [ E_FACILITY_GANG ] != INVALID_GANG_ID ? ( "FACILITY" ) : ( "TERRITORY" ), ReturnGangName( attacker_gang ) ) );

						if ( IsPlayerSpawned( d ) && ! IsPlayerAFK( d ) && p_Class[ d ] == CLASS_CIVILIAN && p_GangID[ d ] == attacker_gang && ! IsPlayerInPaintBall( d ) ) {
							if ( in_area ) {
								GivePlayerScore( d, 2 );
								GivePlayerWantedLevel( d, 6 );
							}
							PlayerPlaySound( d, 36205, 0.0, 0.0, 0.0 );
						}
					}
				}
				else if ( g_gangTurfData[ z ] [ E_OWNER ] != INVALID_GANG_ID && oCount > 0 ) {
	            	foreach ( new i : Player ) if ( p_GangID[ i ] != INVALID_GANG_ID && IsPlayerInDynamicArea( i, g_gangTurfData[ z ] [ E_AREA ] ) ) {
	            		// message the attacker that they gotta attack
	            		if ( p_GangID[ i ] == g_gangzoneAttacker[ z ] ) {
		            		ShowPlayerHelpDialog( i, 1500, "~r~Kill~w~ the %d gang member%s in the area!", oCount, oCount == 1 ? ( "" ) : ( "s" ) );
		            	}
		            	// message the defender
		            	else if ( p_GangID[ i ] == g_gangTurfData[ z ] [ E_OWNER ] ) {
		            		ShowPlayerHelpDialog( i, 1500, "~b~Defend~w~ the area from the %d enemy gang member%s!", attacker_member_count, attacker_member_count == 1 ? ( "" ) : ( "s" ) );
		            	}
		            }
				}
	        }
	        else
	        {
	        	if ( ! g_gangzoneAttackTimeout[ z ] ) {
	        		g_gangzoneAttackTimeout[ z ] = g_iTime + 10;
                    SendClientMessageToGang( g_gangzoneAttacker[ z ], g_gangData[ g_gangzoneAttacker[ z ] ] [ E_COLOR ], "[GANG]{FFFFFF} You have 10 seconds to get back in the area until the turf war is stopped!" );
	        	}
	        	else if ( g_iTime >= g_gangzoneAttackTimeout[ z ] )
				{
		         	g_gangzoneAttackCount[ z ] = 0;
		         	g_gangzoneAttackTimeout[ z ] = 0;
		     		GangZoneStopFlashForAll( g_gangTurfData[ z ] [ E_ID ] );
		            g_gangzoneAttacker[ z ] = INVALID_GANG_ID;
				}
	        }
		}
	}

	return 1;
}

/* ** Functions ** */
stock Turf_Create( Float: min_x, Float: min_y, Float: max_x, Float: max_y, owner_id = INVALID_GANG_ID, color = COLOR_GANGZONE, facility_gang_id = INVALID_GANG_ID )
{
	new
		id = Iter_Free( turfs );

	if ( id != ITER_NONE )
	{
		// set turf owners
		g_gangTurfData[ id ] [ E_OWNER ] = owner_id;
		g_gangTurfData[ id ] [ E_COLOR ] = color;
		g_gangTurfData[ id ] [ E_FACILITY_GANG ] = facility_gang_id;

		// create area
		g_gangTurfData[ id ] [ E_ID ] = GangZoneCreate( min_x, min_y, max_x, max_y );
		g_gangTurfData[ id ] [ E_AREA ] = CreateDynamicRectangle( min_x, min_y, max_x, max_y, 0, 0 );

		// add to iterator
		Iter_Add( turfs, id );
	}
	return id;
}

stock Turf_GetCentrePos( zoneid, &Float: X, &Float: Y ) // should return the centre but will do for now
{
	Streamer_GetFloatData( STREAMER_TYPE_AREA, g_gangTurfData[ zoneid ] [ E_AREA ], E_STREAMER_MIN_X, X );
	Streamer_GetFloatData( STREAMER_TYPE_AREA, g_gangTurfData[ zoneid ] [ E_AREA ], E_STREAMER_MIN_Y, Y );
}

stock Turf_GetOwner( id ) {
	return g_gangTurfData[ id ] [ E_OWNER ];
}

stock Turf_GetFacility( id ) {
	return g_gangTurfData[ id ] [ E_FACILITY_GANG ];
}

stock Turf_GetFirstTurf( playerid )
{
	new
		current_areas[ 4 ];

	GetPlayerDynamicAreas( playerid, current_areas );

	foreach( new i : Reverse(turfs) )
	{
		if ( current_areas[ 0 ] == g_gangTurfData[ i ] [ E_AREA ] || current_areas[ 1 ] == g_gangTurfData[ i ] [ E_AREA ] || current_areas[ 2 ] == g_gangTurfData[ i ] [ E_AREA ] || current_areas[ 3 ] == g_gangTurfData[ i ] [ E_AREA ] )
		{
			return i;
		}
	}
	return -1;
}

stock Turf_GetProfitability( zoneid, Float: default_pay = 750.0 )
{
	// size adjustments
	if ( g_gangzoneData[ zoneid ] [ E_SIZE ] < TURF_SIZE_SMALL ) // lower than 1st quartile, decrease pay
		default_pay *= 0.75;

	if ( g_gangzoneData[ zoneid ] [ E_SIZE ] > TURF_SIZE_LARGE ) // higher than 1st quartile, increase pay
		default_pay *= 1.25;

	// city adjustments
	if ( g_gangzoneData[ zoneid ] [ E_CITY ] == CITY_SF )
		default_pay *= 1.25;

	if ( g_gangzoneData[ zoneid ] [ E_CITY ] == CITY_COUNTRY || g_gangzoneData[ zoneid ] [ E_CITY ] == CITY_DESERTS )
		default_pay *= 1.1;

	// return rounded number
	return floatround( default_pay );
}

stock GetGangCapturedTurfs( gangid )
{
	new
		z,
		c;

	foreach ( z : turfs ) if ( g_gangTurfData[ z ] [ E_OWNER ] != INVALID_GANG_ID && g_gangTurfData[ z ] [ E_OWNER ] == gangid ) {
		c++;
	}
	return c;
}

stock GetPlayersInGangZone( z, g, &is_afk = 0, &in_air = 0 )
{
	if ( g == INVALID_GANG_ID )
		return 0;

	new count = 0;
	new Float: Z;

	foreach ( new i : Player ) if ( p_Class[ i ] == CLASS_CIVILIAN && p_GangID[ i ] == g && IsPlayerInDynamicArea( i, g_gangTurfData[ z ] [ E_AREA ] ) )
	{
		if ( GetPlayerState( i ) != PLAYER_STATE_SPECTATING )
		{
            if ( IsPlayerAFK( i ) )
            {
            	is_afk++;
            	continue;
            }
            if ( GetPlayerPos( i, Z, Z, Z ) && Z >= 300.0 )
            {
            	in_air++;
            	continue;
            }
            count++;
		}
	}
	return count;
}

/* ** Commands ** */
CMD:takeover( playerid, params[ ] )
{
	if ( p_GangID[ playerid ] == INVALID_GANG_ID )
		return SendError( playerid, "You are not in any gang." );

	if ( p_Class[ playerid ] != CLASS_CIVILIAN )
		return SendError( playerid, "This is restricted to civilians only." );

	if ( GetPlayerInterior( playerid ) != 0 && GetPlayerVirtualWorld( playerid ) != 0 )
	    return SendError( playerid, "You cannot do this inside interiors." );

	if ( IsPlayerAdminOnDuty( playerid ) )
		return SendError( playerid, "You can't capture while on duty!" );

	if ( IsPlayerJailed( playerid ) || IsPlayerUsingOrbitalCannon( playerid ) )
		return SendError( playerid, "You cannot do this at the moment." );

	new
		g_isAFK = 0,
		g_inAir = 0
	;

    foreach ( new z : Reverse(turfs) )
	{
		if ( IsPlayerInDynamicArea( playerid, g_gangTurfData[ z ] [ E_AREA ] ) )
     	{
	    	new gangid = p_GangID[ playerid ];

	        if ( g_gangTurfData[ z ] [ E_OWNER ] == gangid ) return SendError( playerid, "This turf is already captured by your gang." );
			if ( g_gangzoneAttacker[ z ] != INVALID_GANG_ID ) return SendError( playerid, "This turf is currently being attacked." );

			new opposing_count = GetPlayersInGangZone( z, g_gangTurfData[ z ] [ E_OWNER ] ); // Opposing check
			// existing gang members
			if ( g_gangTurfData[ z ] [ E_OWNER ] != INVALID_GANG_ID && opposing_count ) {
				return SendError( playerid, "There are gang members within this turf, kill them!" );
	        }

	        new attacking_count = GetPlayersInGangZone( z, gangid, g_isAFK, g_inAir );

	        if ( attacking_count < TAKEOVER_NEEDED_PEOPLE && ( attacking_count + g_isAFK + g_inAir ) >= TAKEOVER_NEEDED_PEOPLE )
		   		return SendError( playerid, "You cannot start a turf war if gang members are AFK or extremely high above ground." );

	        //if ( g_gangTurfData[ z ] [ E_OWNER ] != INVALID_GANG_ID && dCount < TAKEOVER_NEEDED_PEOPLE + 1 && ( dCount + g_isAFK + g_inAir ) >= TAKEOVER_NEEDED_PEOPLE + 1 )
		   	//	return SendError( playerid, "You need at least %d gang members to start a gang war with another gang.", TAKEOVER_NEEDED_PEOPLE + 1 );

		   	// Facility check
		   	if ( g_gangTurfData[ z ] [ E_FACILITY_GANG ] != INVALID_GANG_ID && Iter_Contains( gangs, g_gangTurfData[ z ] [ E_FACILITY_GANG ] ) )
		   	{
		   		new facility_gang = g_gangTurfData[ z ] [ E_FACILITY_GANG ];
		   		new facility_members = GetOnlineGangMembers( facility_gang );

		   		if ( g_gangTurfData[ z ] [ E_OWNER ] == facility_gang ) {
			   		if ( facility_members < 3 ) {
			   			return SendError( playerid, "This facility requires at least %d of its gang members online for a takeover.", 3 - facility_members );
			   		}
			   		else if ( attacking_count < 3 ) {
		   				return SendError( playerid, "You need at least %d gang members to take over this facility.", 3 - attacking_count );
			   		}
		   		}
		   	}

		   	// Begin takeover
			if ( attacking_count >= TAKEOVER_NEEDED_PEOPLE && ! opposing_count )
	        {
				g_gangzoneAttacker[ z ] = gangid;
	            g_gangzoneAttackCount[ z ] = 0;
              	GangZoneFlashForAll( g_gangTurfData[ z ] [ E_ID ], setAlpha( g_gangData[ gangid ] [ E_COLOR ], 0x80 ) );
              	SendClientMessage( playerid, g_gangData[ gangid ] [ E_COLOR ], "[TURF]{FFFFFF} You are now beginning to take over the turf. Stay inside the area with your gang for 60 seconds. Don't die." );
	            if ( g_gangTurfData[ z ] [ E_OWNER ] != INVALID_GANG_ID ) {
	            	SendClientMessageToGang( g_gangTurfData[ z ] [ E_OWNER ], g_gangData[ g_gangTurfData[ z ] [ E_OWNER ] ] [ E_COLOR ], "[GANG]{FFFFFF} Our territory is being attacked by "COL_GREY"%s"COL_WHITE", defend it!", g_gangData[ g_gangzoneAttacker[ z ] ] [ E_NAME ] );
	            }
	        }
	        else
	        {
	        	SendError( playerid, "You need at least %d member(s) to take over this turf.", TAKEOVER_NEEDED_PEOPLE );
	        }
	        return 1;
	    }
	}
	return SendError( playerid, "You are not in any gangzone." );
}