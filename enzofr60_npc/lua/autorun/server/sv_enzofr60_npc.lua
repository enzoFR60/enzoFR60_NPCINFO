-----------------------------------------------------------------
--	Auteur		= enzoFR60
-----------------------------------------------------------------

util.AddNetworkString("enzoFR60npc:OpenMenu")
util.AddNetworkString("enzoFR60npc:OpenMenuWeb")
util.AddNetworkString("enzoFR60npc:MenuWeb")

net.Receive("enzoFR60npc:MenuWeb", function( len, Ply )	
		if not IsValid(Ply) then return end
		local web = net.ReadString()
		
		if SERVER then
			net.Start( "enzoFR60npc:OpenMenuWeb" )
			net.WriteString( web )
			net.Send(Ply)
		end
end)

-- Vesion Check

local version = "1.1" -- Don't touch ! Pas Touche !
local ranksAdmins = { ["superadmin"] = true }

function enzoFR60NPC_Notify(ply, pType, pTime, pMsg)
	if not IsValid(ply) then return end
	if DarkRP then DarkRP.notify(ply, tonumber(pType), tonumber(pTime), string.Trim(pMsg))
	else ply:PrintMessage(HUD_PRINTTALK, string.Trim(pMsg)) end
end

local function parsingVersion(pVersion)
  return tonumber(string.Replace(tostring(pVersion), ".", ""))
end

local function checkVersion(ply)
  if not IsValid(ply) then return end
  if ranksAdmins[ply:GetUserGroup()] and enzoFR60NPC.CheckVersionAddon then
    http.Fetch("https://raw.githubusercontent.com/enzoFR60/enzoFR60_NPCINFO/master/version.txt",
    	function(body, len, headers, code)
      	if code == 404 then
     	  	timer.Simple(300, function() if IsValid(ply) then checkVersion(ply) end end)
       	 	enzoFR60NPC_Notify(ply, 1, 20, "[enzoFR60NPC] " .. tostring(enzoFR60NPC.LanguageCheckVersionError))
          return
        end
        
	if parsingVersion(string.Trim(body)) > parsingVersion(version) then
        	enzoFR60NPC_Notify(ply, 1, 20, "[enzoFR60NPC] " .. tostring(enzoFR60NPC.LanguageCheckVersionNonValide))
	end
       end,
      function(err)
    	end)
  end
end

hook.Add( "PlayerInitialSpawn", "InitialVersionCheckCVoiture", function(ply)
  if not IsValid(ply) then return end
	if ranksAdmins[ply:GetUserGroup()] and enzoFR60NPC.CheckVersionAddon then
		timer.Simple(5, function() if IsValid(ply) then checkVersion(ply) end end)
	end
end)
