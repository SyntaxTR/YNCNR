#include <a_samp>
#include <Dini>

//native GetAKA(playerid);

public OnPlayerConnect(playerid)
{
	//ST
	new playerip[16];
    new data[128];
    new string[128];
    new idx = -1;
    if(!fexist("aka.txt")) dini_Create("aka.txt");
 	GetPlayerIp(playerid, playerip, 16);
	format(data, sizeof data, "%s", dini_Get("aka.txt", playerip));
    if(strlen(data) <= 2)
    {
        format(string,sizeof string, "%s,", GetName(playerid));
		dini_Set("aka.txt", playerip, string);
	}
	else
	{
	    idx = strfind(data, GetName(playerid), true);
	    if(idx == -1)
	    {
			format(string, sizeof string, "%s%s,", data, GetName(playerid));
			dini_Set("aka.txt", playerip, string);
		}
	}
	if(idx > -1)
	{
		if(data[idx + strlen(GetName(playerid))] != ',')
		{
			format(string, sizeof string, "%s%s,", data, GetName(playerid));
			dini_Set("aka.txt", playerip, string);
		}
	}
    #if defined AKA_OnPlayerConnect
        AKA_OnPlayerConnect(playerid);
    #endif
    return 1;
}
#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect AKA_OnPlayerConnect
#if defined AKA_OnPlayerConnect
    forward AKA_OnPlayerConnect(playerid);
#endif

static stock GetName(playerid)
{
	new name[24];
	GetPlayerName(playerid, name, 24);
	return name;
}

stock GetAKA(playerid)
{
	new playerip[16];
	new string[128];
    GetPlayerIp(playerid, playerip, sizeof(playerip));
	format(string, sizeof string, "%s", dini_Get("aka.txt", playerip));
	strdel(string, strlen(string), strlen(string) + 1);
	return string;
}