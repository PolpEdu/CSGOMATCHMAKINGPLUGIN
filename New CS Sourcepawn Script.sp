#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Paulo aka Polpy"
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
//#include <sdkhooks>

#pragma newdecls required

EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "Polpy",
	author = PLUGIN_AUTHOR,
	description = "Simple plugin to play rock, paper scissors",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnPluginStart()
{
	g_Game = GetEngineVersion();
	if(g_Game != Engine_CSGO)
	{
		SetFailState("This plugin is for CSGO only.");	
	}
	RegConsoleCmd("sm_ELO", CommandTeams, "Creates the teams.");
	RegConsoleCmd("sm_flip", CommandFlip, "Flips a coin.");
}

public Action CommandFlip(int client, int args){
	char nomedequemflip[32];
	GetClientName(client, nomedequemflip, sizeof(nomedequemflip));
	int randomnum = GetRandomInt(1, 101);
	if (randomnum == 101){
		PrintToChatAll("[\x06FLIP\x01] \x10 %s LANCOU UMA MOEDA E FICOU VERTICAL, INCRIVEL!", nomedequemflip);
	}
	else if(randomnum > 50){
		PrintToChatAll("[\x06FLIP\x01] %s LANCOU UMA MOEDA E CALHOU \x09T\x01!", nomedequemflip);
	}
	else if(randomnum < 50){
		PrintToChatAll("[\x06FLIP\x01] %s LANCOU UMA MOEDA E CALHOU \x0ACT\x01!", nomedequemflip);
	}
	return Plugin_Handled;
}

public Action CommandTeams() {
	
}

