/*----------------------------------------------------------------------------*-
					==============================
					 y_als - Useful codes for ALS
					==============================
Description:
	Provides a number of macros for making ALS (Advanced Library System)
	callback hooking simpler.
Legal:
	Version: MPL 1.1
	
	The contents of this file are subject to the Mozilla Public License Version 
	1.1 (the "License"); you may not use this file except in compliance with 
	the License. You may obtain a copy of the License at 
	http://www.mozilla.org/MPL/
	
	Software distributed under the License is distributed on an "AS IS" basis,
	WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
	for the specific language governing rights and limitations under the
	License.
	
	The Original Code is the SA:MP script information include.
	
	The Initial Developer of the Original Code is Alex "Y_Less" Cole.
	Portions created by the Initial Developer are Copyright (C) 2008
	the Initial Developer. All Rights Reserved.
	
	Contributors:
		ZeeX, koolk
	
	Thanks:
		Peter, Cam - Support.
		ZeeX - Very productive conversations.
		koolk - IsPlayerinAreaEx code.
		TheAlpha - Danish translation.
		breadfish - German translation.
		Fireburn - Dutch translation.
		yom - French translation.
		50p - Polish translation.
		Zamaroht - Spanish translation.
		Dracoblue, sintax, mabako, Xtreme, other coders - Producing other modes
			for me to strive to better.
		Pixels^ - Running XScripters where the idea was born.
		Matite - Pestering me to release it and using it.
	
	Very special thanks to:
		Thiadmer - PAWN.
		Kye/Kalcor - SA:MP.
		SA:MP Team past, present and future - SA:MP.
Version:
	1.0
Changelog:
	21/10/10:
		First version
-*----------------------------------------------------------------------------*/

#include <YSI\internal\y_version>

// Allow multiple inclusions.
#undef _inc_y_als

#if !defined _Y_ALS_INCLUDED
	// This is an include guard with a purpose!
	
	#include <YSI\y_bit>
	#include <YSI\internal\y_shortfunc>
	
	enum ALS
	{
		Bit:ALS_OnGameModeInit,
		Bit:ALS_OnGameModeExit,
		Bit:ALS_OnFilterScriptInit,
		Bit:ALS_OnFilterScriptExit,
		Bit:ALS_OnPlayerConnect,
		Bit:ALS_OnPlayerDisconnect,
		Bit:ALS_OnPlayerSpawn,
		Bit:ALS_OnPlayerDeath,
		Bit:ALS_OnVehicleSpawn,
		Bit:ALS_OnVehicleDeath,
		Bit:ALS_OnPlayerText,
		Bit:ALS_OnPlayerCommandText,
		Bit:ALS_OnPlayerRequestClass,
		Bit:ALS_OnPlayerEnterVehicle,
		Bit:ALS_OnPlayerExitVehicle,
		Bit:ALS_OnPlayerStateChange,
		Bit:ALS_OnPlayerEnterCheckpoint,
		Bit:ALS_OnPlayerLeaveCheckpoint,
		Bit:ALS_OnPlayerEnterRaceCheckpoint,
		Bit:ALS_OnPlayerLeaveRaceCheckpoint,
		Bit:ALS_OnRconCommand,
		Bit:ALS_OnPlayerRequestSpawn,
		Bit:ALS_OnObjectMoved,
		Bit:ALS_OnPlayerObjectMoved,
		Bit:ALS_OnPlayerPickUpPickup,
		Bit:ALS_OnVehicleMod,
		Bit:ALS_OnEnterExitModShop,
		Bit:ALS_OnVehiclePaintjob,
		Bit:ALS_OnVehicleRespray,
		Bit:ALS_OnVehicleDamageStatusUpdate,
		Bit:ALS_OnPlayerSelectedMenuRow,
		Bit:ALS_OnPlayerExitedMenu,
		Bit:ALS_OnPlayerInteriorChange,
		Bit:ALS_OnPlayerKeyStateChange,
		Bit:ALS_OnRconLoginAttempt,
		Bit:ALS_OnPlayerUpdate,
		Bit:ALS_OnPlayerStreamIn,
		Bit:ALS_OnPlayerStreamOut,
		Bit:ALS_OnVehicleStreamIn,
		Bit:ALS_OnVehicleStreamOut,
		Bit:ALS_OnDialogResponse
	}
	
	#define ALS_DATA<> static stock BitArray:gs_ALS<_:ALS>;
	
	#define ALS_DETECT<%0> if(funcidx(#ALS_PREFIX"_"#%0)!=-1)Bit_Let(gs_ALS,_:ALS_%0);
	
	#define ALS_CALL<%0,%1> return Bit_GetBit(Bit:gs_ALS,_:ALS_%0)?P@(#ALS_PREFIX"_"#%0,%1):1;
	
	#define ALS_CALL_EX<%0,%1,%2> return Bit_GetBit(Bit:gs_ALS,_:ALS_%0)?P@(#ALS_PREFIX"_"#%0,%2):%1;
	
	#define _Y_ALS_INCLUDED
#endif

#if !defined ALS_PREFIX
	//#error You must define a callback prefix before including y_als.
	#define ALS_PREFIX Mode
#endif
