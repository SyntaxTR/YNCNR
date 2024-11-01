// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <a_mysql>

new MySQL: g_SQL;

#define		MYSQL_HOST 			"localhost"
#define		MYSQL_USER 			"root"
#define 	MYSQL_PASSWORD 		"backup123tr"
#define		MYSQL_DATABASE 		"YNDB"

public OnFilterScriptInit()
{
	new MySQLOpt: option_id = mysql_init_options();

	mysql_set_option(option_id, AUTO_RECONNECT, true); // MySQL baðlantýsý koparsa tekrar olarak baðlanacak fonksiyon.

	g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
	if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
	{
		print("MySQL baðlantýsý kurulamadý. Sunucu kapatýlýyor...");
		SendRconCommand("exit"); // Baðlantý kurulamadýðýnda çýkýþ iþlemi gerçekleþtiriliyor.
		return 1;
	}
	new bitis = 20*86400;
	new Cache:veri;
	veri = mysql_query(g_SQL,"SELECT `username`, `Vip` FROM `players` WHERE `Vip` > 0");
	new
	playerName[MAX_PLAYER_NAME],
	cekilenskor,
 	query[256],
 	result_count;
	cache_get_row_count(result_count);
	for(new r; r < result_count; r++)
	{
		cache_set_result(r);
  		cache_get_value_name(r, "username", playerName);
        cache_get_value_name_int(r, "Vsure", cekilenskor);
        printf("%s %s",playerName,convertDate(cekilenskor));
        
        cekilenskor = cekilenskor + bitis;

		format(query,256,"UPDATE `players` SET `Vsure` = '%i'  WHERE username = '%s'",cekilenskor,playerName);
		mysql_query(g_SQL,query);
		printf(query);
		printf("%s %s",playerName,convertDate(cekilenskor));
	}
	cache_delete(veri);
	
	return 1;
}
stock convertDate(timestamp, _form=0) // http://forum.sa-mp.com/showthread.php?t=330861
{

	new year=1970, day=0, month=0, hour=0, mins=0, sec=0;
	new days_of_month[12] = { 31,28,31,30,31,30,31,31,30,31,30,31 };
	new names_of_month[12][10] = {"January","February","March","April","May","June","July","August","September","October","November","December"};
	new returnstring[56];
	while(timestamp>31622400)
	{
		timestamp -= 31536000;
		if ( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) ) timestamp -= 86400;
		year++;
	}
	if ( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) )
		days_of_month[1] = 29;
	else
		days_of_month[1] = 28;
	while(timestamp>86400)
	{
		timestamp -= 86400, day++;
		if(day==days_of_month[month]) day=0, month++;
	}
	while(timestamp>60)
	{
		timestamp -= 60, mins++;
		if( mins == 60) mins=0, hour++;
	}
	sec=timestamp;
	switch( _form )
	{
		case 1: format(returnstring, 56, "%02d/%02d/%d %02d:%02d:%02d", day+1, month+1, year, hour+3, mins, sec);
		case 2: format(returnstring, 56, "%s %02d, %d, %02d:%02d:%02d", names_of_month[month],day+1,year, hour+3, mins, sec);
		case 3: format(returnstring, 56, "%d %c%c%c %d, %02d:%02d", day+1,names_of_month[month][0],names_of_month[month][1],names_of_month[month][2], year,hour+3,mins);
		default: format(returnstring, 56, "%02d/%02d/%d %02d:%02d:%02d", day+1, month+1, year, hour+3, mins, sec);
	}
	return returnstring;
}
public OnFilterScriptExit()
{
	return 1;
}


public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
