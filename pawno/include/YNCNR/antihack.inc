#include <a_samp>

new Float:CurrentPos[MAX_PLAYERS][3];
new Kontrol[MAX_PLAYERS];

#define TYPE_ONFOOT 0
#define TYPE_INVEHICLE 1

new Security[6];

public OnGameModeInit()
{
	Security[0] = funcidx("_OnPlayerConnect") != -1;
	Security[1] = funcidx("_OnPlayerDeath") != -1;
	Security[2] = funcidx("_SetPlayerPos") != 1;
	Security[3] = funcidx("_OnPlayerSpawn") != 1;
	Security[4] = funcidx("_OnPlayerUpdate") != -1;
	Security[5] = funcidx("_OnPlayerEnterDynamicCP") != -1;
	if (funcidx("_OnGameModeInit") != -1)
	{
		return CallLocalFunction("_OnGameModeInit", "");
	}
	return 1;
}

#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit _OnGameModeInit
forward _OnGameModeInit();

public OnPlayerConnect(playerid)
{
	Kontrol[playerid] = 0;
 	if (Security[0])
	{
		return CallLocalFunction("_OnPlayerConnect", "i",playerid);
	}
	return 1;
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect _OnPlayerConnect
forward _OnPlayerConnect(playerid);


public OnPlayerDeath(playerid, killerid, reason)
{
	Kontrol[playerid] = 0;
 	if (Security[1])
	{
		return CallLocalFunction("_OnPlayerDeath", "iii",playerid, killerid,  reason);
	}
	return 1;
}

#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath _OnPlayerDeath
forward _OnPlayerDeath(playerid, killerid,  reason);

public OnPlayerSpawn(playerid)
{
	SetPVarInt(playerid, "Check",  GetTickCount() + 1500);
	Kontrol[playerid] = 1;
	if (Security[3])
	{
		return CallLocalFunction("_OnPlayerSpawn", "i",playerid);
	}
	return 1;
}


#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn _OnPlayerSpawn
forward _OnPlayerSpawn(playerid);

public OnPlayerEnterDynamicCP(playerid,checkpointid)
{
	SetPVarInt(playerid, "Check",  GetTickCount() + 1500);
	if(Security[5])
	{
		return CallLocalFunction("_OnPlayerEnterDynamicCP","ii",playerid,checkpointid);
	}
	return 1;
}

#if defined _ALS_OnPlayerEnterDynamicCP
	#undef OnPlayerEnterDynamicCP
#else
	#define _ALS_OnPlayerEnterDynamicCP
#endif
#define OnPlayerEnterDynamicCP _OnPlayerEnterDynamicCP
forward _OnPlayerEnterDynamicCP(playerid,checkpointid);

stock _SetPlayerPos(playerid, Float:x, Float:y, Float:z)
{
	print("ss4");
	SetPVarInt(playerid, "Check",  GetTickCount() + 1500);
	Kontrol[playerid] = 0;
	
	CurrentPos[playerid][0] = x;
	CurrentPos[playerid][1] = y;
	CurrentPos[playerid][2] = z;
	
	SetPlayerPos(playerid, x, y, z);
	Kontrol[playerid] = 1;
	return 1;
}
#if defined _ALS_SetPlayerPos
	#undef SetPlayerPos
#else
	#define _ALS_SetPlayerPos
#endif
#define SetPlayerPos _SetPlayerPos

public OnPlayerUpdate(playerid)
{
	if(GetPVarInt(playerid,"Check") <= GetTickCount())
	{
		if(Kontrol[playerid] == 1)
		{
			if(!IsPlayerInAnyVehicle(playerid))
			{
				if(!IsPlayerInRangeOfPoint(playerid,15.0,CurrentPos[playerid][0],CurrentPos[playerid][1],CurrentPos[playerid][2]))
				{
					HileBulundu(playerid,TYPE_ONFOOT);
				}
			}
			if(IsPlayerInAnyVehicle(playerid))
			{
				if(!IsPlayerInRangeOfPoint(playerid,50.0,CurrentPos[playerid][0],CurrentPos[playerid][1],CurrentPos[playerid][2]))
				{
					HileBulundu(playerid,TYPE_INVEHICLE);
				}
			}		
		}	
	}
	GetPlayerPos(playerid,CurrentPos[playerid][0],CurrentPos[playerid][1],CurrentPos[playerid][2]);		
	SetPVarInt(playerid, "Check", GetTickCount() + 250);
	if (Security[4])
	{
		return CallLocalFunction("_OnPlayerUpdate", "i",playerid);
	}
	return 1;
}

#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate _OnPlayerUpdate
forward _OnPlayerUpdate(playerid);



stock HileBulundu(playerid,TYPE)
{
	new name[24];
	GetPlayerName(playerid,name,24);
	new str[256];
	if(TYPE == TYPE_ONFOOT)
	{
		format(str,sizeof str,"{59ACFF}[Y-Shield]{10F441} %s(%i) oyundan atýldý. Sebep : Teleport #1",name,playerid);
		SendClientMessageToAll(-1,str);
	//	DelayKick(playerid,50);
		return 1;
	}
	if(TYPE == TYPE_INVEHICLE)
	{
		format(str,sizeof str,"{59ACFF}[Y-Shield]{10F441} %s(%i) oyundan atýldý. Sebep : Teleport #2",name,playerid);
		SendClientMessageToAll(-1,str);
	//	DelayKick(playerid,50);		
		return 1;
	}
	return true;
}

forward Float:Mesafe(Float:XE, Float:YE, Float:ZE, Float:PointX, Float:PointY, Float:PointZ);
stock Float:Mesafe(Float:XE, Float:YE, Float:ZE, Float:PointX, Float:PointY, Float:PointZ)
{
	new Float:Distance;Distance = floatabs(floatsub(XE, PointX)) + floatabs(floatsub(YE, PointY)) + floatabs(floatsub(ZE, PointZ));
	return Distance;
}
//DelayKick(playerid, time = 500)
//{	
//	SetTimerEx("KickPlayerDelayed", time, false, "d", playerid);
//	return 1;
//}
forward KickPlayerDelayed(playerid);
public KickPlayerDelayed(playerid)
{
	Kick(playerid);
	return 1;
}