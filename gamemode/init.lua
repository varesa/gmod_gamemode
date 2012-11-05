
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_hud.lua" )

include( 'shared.lua' )
include( 'hooks.lua' )

// Serverside only stuff goes here

/*---------------------------------------------------------
   Name: gamemode:PlayerLoadout( )
   Desc: Give the player the default spawning weapons/ammo
---------------------------------------------------------*/
function GM:PlayerLoadout( pl )

	--pl:GiveAmmo( 255,	"Pistol", 		true )
	
	--pl:Give( "empty_weapon" )
	
end