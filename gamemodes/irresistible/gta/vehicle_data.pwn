/*
 * Irresistible Gaming 2018
 * Developed by Lorenc Pekaj
 * Module: gta\vehicles.inc
 * Purpose: gta vehicle related data
 */

/* ** Macros ** */
#define GetVehicleName(%0)  ((%0 - 400) < 0 || (%0 - 400 >= sizeof(g_aVehicleNames)) ? ("Unknown") : g_aVehicleNames[%0 - 400])

/* ** Variables ** */
stock const g_aVehicleNames[ 212 ] [ ] =
{
	{ "Landstalker" },	{ "Bravura" },				{ "Buffalo" },			{ "Linerunner" },		{ "Perenniel" },		{ "Sentinel" },			{ "Dumper" },
	{ "Firetruck" },	{ "Trashmaster" },			{ "Stretch" },			{ "Manana" },			{ "Infernus" },			{ "Voodoo" },			{ "Pony" },				{ "Mule" },
	{ "Cheetah" },		{ "Ambulance" },			{ "Leviathan" },		{ "Moonbeam" },			{ "Esperanto" },		{ "Taxi" },				{ "Washington" },
	{ "Bobcat" },		{ "Mr Whoopee" },			{ "BF Injection" },		{ "Hunter" },			{ "Premier" },			{ "Enforcer" },			{ "Securicar" },
	{ "Banshee" },		{ "Predator" },				{ "Bus" },{ "Rhino" },	{ "Barracks" },			{ "Hotknife" },			{ "Trailer 1" },		{ "Previon" },
	{ "Coach" },		{ "Cabbie" },				{ "Stallion" },			{ "Rumpo" },			{ "RC Bandit" },		{ "Romero" },			{ "Packer" },			{ "Monster" },
	{ "Admiral" },		{ "Squalo" },				{ "Seasparrow" },		{ "Pizzaboy" },			{ "Tram" },				{ "Trailer 2" },		{ "Turismo" },
	{ "Speeder" },		{ "Reefer" },				{ "Tropic" },			{ "Flatbed" },			{ "Yankee" },			{ "Caddy" },			{ "Solair" },			{ "Berkley's RC Van" },
	{ "Skimmer" },		{ "PCJ-600" },				{ "Faggio" },			{ "Freeway" },			{ "RC Baron" },			{ "RC Raider" },		{ "Glendale" },			{ "Oceanic" },
	{ "Sanchez" },		{ "Sparrow" },				{ "Patriot" },			{ "Quad" },				{ "Coastguard" },		{ "Dinghy" },			{ "Hermes" },			{ "Sabre" },
	{ "Rustler" },		{ "ZR-350" },				{ "Walton" },			{ "Regina" },			{ "Comet" },			{ "BMX" },				{ "Burrito" },			{ "Camper" },			{ "Marquis" },
	{ "Baggage" },		{ "Dozer" },				{ "Maverick" },			{ "News Chopper" },		{ "Rancher" },			{ "FBI Rancher" },		{ "Virgo" },			{ "Greenwood" },
	{ "Jetmax" },		{ "Hotring" },				{ "Sandking" },			{ "Blista Compact" },	{ "Police Maverick" },	{ "Boxville" },			{ "Benson" },
	{ "Mesa" },			{ "RC Goblin" },			{ "Hotring Racer A" },	{ "Hotring Racer B" },	{ "Bloodring Banger" },	{ "Rancher" },
	{ "Super GT" },		{ "Elegant" },				{ "Journey" },			{ "Bike" },				{ "Mountain Bike" },	{ "Beagle" },			{ "Cropdust" },			{ "Stuntplane" },
	{ "Tanker" }, 		{ "Roadtrain" },			{ "Nebula" },			{ "Majestic" },			{ "Buccaneer" },		{ "Shamal" },			{ "Hydra" },			{ "FCR-900" },
	{ "NRG-500" },		{ "HPV1000" },				{ "Cement Truck" },		{ "Tow Truck" },		{ "Fortune" },			{ "Cadrona" },			{ "FBI Truck" },
	{ "Willard" },		{ "Forklift" },				{ "Tractor" },			{ "Combine" },			{ "Feltzer" },			{ "Remington" },		{ "Slamvan" },
	{ "Blade" },		{ "Freight" },				{ "Streak" },			{ "Vortex" },			{ "Vincent" },			{ "Bullet" },			{ "Clover" },			{ "Sadler" },
	{ "Firetruck LA" },	{ "Hustler" },				{ "Intruder" },			{ "Primo" },			{ "Cargobob" },			{ "Tampa" },			{ "Sunrise" },			{ "Merit" },
	{ "Utility" },		{ "Nevada" },				{ "Yosemite" },			{ "Windsor" },			{ "Monster A" },		{ "Monster B" },		{ "Uranus" },			{ "Jester" },
	{ "Sultan" },		{ "Stratum" },				{ "Elegy" },			{ "Raindance" },		{ "RC Tiger" },			{ "Flash" },			{ "Tahoma" },			{ "Savanna" },
	{ "Bandito" },		{ "Freight Flat" },			{ "Streak Carriage" },	{ "Kart" },				{ "Mower" },			{ "Duneride" },			{ "Sweeper" },
	{ "Broadway" },		{ "Tornado" },				{ "AT-400" },			{ "DFT-30" },			{ "Huntley" },			{ "Stafford" },			{ "BF-400" },			{ "Newsvan" },
	{ "Tug" },			{ "Trailer 3" },			{ "Emperor" },			{ "Wayfarer" },			{ "Euros" },			{ "Hotdog" },			{ "Club" },				{ "Freight Carriage" },
	{ "Trailer 3" },	{ "Andromada" },			{ "Dodo" },				{ "RC Cam" },			{ "Launch" },			{ "Police Car LSPD" },	{ "Police Car SFPD" },
	{ "Police LVPD" },	{ "Police Ranger" },		{ "Picador" },			{ "SWAT. Van" },		{ "Alpha" },			{ "Phoenix" },			{ "Glendale" },
	{ "Sadler" },		{ "Luggage Trailer A" },	{ "Luggage Trailer B" },{ "Stair Trailer" },	{ "Boxville" },			{ "Farm Plow" },
	{ "Utility Trailer"}
};

stock GetVehicleModelFromName( szVehicleName[ ] )
{
	for( new i = 400; i <= 611; i++ )
		if( strfind( g_aVehicleNames[ i - 400 ], szVehicleName, true ) != -1 )
			return i;

	return -1;
}