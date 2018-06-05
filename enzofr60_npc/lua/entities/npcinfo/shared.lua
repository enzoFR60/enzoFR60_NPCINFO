ENT.PrintName = "Npc Info" 
ENT.Author = "enzoFR60" 
ENT.Category    = "enzofr60 NPC" 
ENT.Spawnable        = true 
ENT.AdminSpawnable    = true 
ENT.AutomaticFrameAdvance = true
ENT.Type = "ai"
ENT.Base = "base_ai"


function ENT:SetAutomaticFrameAdvance( bUsingAnim )
    self.AutomaticFrameAdvance = bUsingAnim
end

function ENT:PhysicsCollide(data, physobj)
end;

function ENT:PhysicsUpdate(physobj)
end;
