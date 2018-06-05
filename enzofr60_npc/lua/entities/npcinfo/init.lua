AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

include('autorun/sh_config_enzofr60_npc.lua')


function ENT:Initialize( )
	
	self:SetModel( enzoFR60NPC.ModelNpc )
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal( )
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid(  SOLID_BBOX )
	self:CapabilitiesAdd( CAP_ANIMATEDFACE )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
	self:SetMaxYawSpeed( 90 )
	
end

function ENT:OnTakeDamage()
	return false 
end 

function ENT:AcceptInput( Name, Activator, Caller )	
	if not IsValid(Caller) then return end

	if Name == "Use" and Caller:IsPlayer() then
	
		 
		if enzoFR60NPC.ActiverNpc then
			if SERVER then
				net.Start( "enzoFR60npc:OpenMenu" )
				net.Send( Caller )
			end
		end
		
	end
	
end