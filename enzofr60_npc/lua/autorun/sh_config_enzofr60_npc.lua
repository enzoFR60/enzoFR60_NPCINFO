-----------------------------------------------------------------
--	Auteur		= enzoFR60
-----------------------------------------------------------------

enzoFR60NPC = enzoFR60NPC or {}

-- Config Général

enzoFR60NPC.ActiverNpc = true -- true = Le npc marche, false = il marche pas ;)

enzoFR60NPC.ModelNpc = "models/Humans/Group01/male_08.mdl" -- model du npc

enzoFR60NPC.CheckVersionAddon = true -- true = La verification marche, false = elle marche pas ;)

enzoFR60NPC.SelectedLanguage = "fr" -- en = english , fr = french

-- Bontons 
enzoFR60NPC.Groupe = true -- true = Activé, false = Desactivé
enzoFR60NPC.Site = true -- true = Activé, false = Desactivé
enzoFR60NPC.Collection = true -- true = Activé, false = Desactivé
enzoFR60NPC.Discord = true -- true = Activé, false = Desactivé
enzoFR60NPC.Boutique = true -- true = Activé, false = Desactivé
enzoFR60NPC.Logo = true -- true = Activé, false = Desactivé

-- Lien
enzoFR60NPC.LogoLien = "enzofr60/npc/logo.png" -- Lien vers le material

enzoFR60NPC.GroupeLien = "https://www.youtube.com/channel/UC1OxQrjviVEWLDKCzAVMg0g/videos" -- Lien HTML De votre Groupe Steam (http)

enzoFR60NPC.SiteLien = "https://www.twitch.tv/enzofr60" -- Lien HTML De votre Site

enzoFR60NPC.CollectionLien = "https://livecounts.net/channel/enzofr60" -- Lien HTML De votre Collection Steam (Addons) (http)

enzoFR60NPC.BoutiqueLien = "https://twitter.com/EnzoNight" -- Lien HTML De votre Boutique (http)

enzoFR60NPC.DiscordLien = "https://discord.gg/BS7rMzK" -- Lien HTML De votre Discord (http)

-- Language config

if (enzoFR60NPC.SelectedLanguage == "en") then

 enzoFR60NPC.LanguageShop = "Shop"

 enzoFR60NPC.LanguageWebSite = "Web Site"

 enzoFR60NPC.LanguageGroupSteam = "Steam Group"

 enzoFR60NPC.LanguageLienVisite = "Link visited : "

 enzoFR60NPC.LanguageHelp = "Need of information ? Enable sounds? :"
 
 enzoFR60NPC.LanguageCopier = "Copy"
 
 -- Notif Check Version
 
 enzoFR60NPC.LanguageCheckVersionValide = "You have the right version of the addon enzoFR60_npcinfo."
 
 enzoFR60NPC.LanguageCheckVersionNonValide = "The version of the addon enzoFR60_npcinfo is not up to date."
 
 enzoFR60NPC.LanguageCheckVersionError = "There was an error at the time of the audit"

elseif (enzoFR60NPC.SelectedLanguage == "fr") then

 enzoFR60NPC.LanguageShop = "Boutique"

 enzoFR60NPC.LanguageWebSite = "Site"

 enzoFR60NPC.LanguageGroupSteam = "Groupe Steam"

 enzoFR60NPC.LanguageLienVisite = "Lien visité : "
 
 enzoFR60NPC.LanguageHelp = "Besoin d'information ? Activer les sons ? :"
 
 enzoFR60NPC.LanguageCopier = "Copié"
 
 -- Notif Check Version
 
 enzoFR60NPC.LanguageCheckVersionValide = "Vous avez la bonne version de l'addon enzoFR60_npcinfo."
 
 enzoFR60NPC.LanguageCheckVersionNonValide = "La version de l'addon enzoFR60_npcinfo est pas a jour."
 
 enzoFR60NPC.LanguageCheckVersionError = "Il y a eu une erreur au moment de la verification"
 
end
