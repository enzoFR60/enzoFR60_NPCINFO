-----------------------------------------------------------------
--	Auteur		= enzoFR60
-----------------------------------------------------------------


local blur = Material("pp/blurscreen")
local function DrawBlur( p, a, d )
	local x, y = p:LocalToScreen( 0, 0 )
	
	surface.SetDrawColor( 255, 255, 255 )
	surface.SetMaterial( blur )
	
	for i = 1, d do
		blur:SetFloat( "$blur", (i / d ) * ( a ) )
		blur:Recompute()
		
		render.UpdateScreenEffectTexture()
		
		surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )
	end
end

net.Receive( "enzoFR60npc:OpenMenu", function()
	local NPC = vgui.Create( "DFrame" )
	NPC:SetSize( 500, 500 )
	NPC:Center()
	NPC:SetTitle( "Npc Info" )
	NPC:SetDraggable( true )
	if enzoFR60NPC.SelectedLanguage == "en" or enzoFR60NPC.SelectedLanguage == "fr" then
	NPC:ShowCloseButton( false )
	elseif enzoFR60NPC.SelectedLanguage == "" then
	NPC:ShowCloseButton( true )
	end
	NPC:MakePopup()
	NPC.Paint = function( self, w, h )
		DrawBlur( self, 6, 30 )
		draw.RoundedBox( 6, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
		draw.RoundedBox( 1, 0, 0, w, 25, Color( 0, 0, 0, 80 ) )   
		draw.RoundedBox( 1, 0, 25, w, 1, Color( 0, 0, 0, 80 ) )    

		draw.SimpleText( enzoFR60NPC.LanguageHelp, "Trebuchet24", w / 2, 32, color_white, TEXT_ALIGN_CENTER )
		
		if enzoFR60NPC.Logo then
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.SetMaterial(Material(enzoFR60NPC.LogoLien))
			surface.DrawTexturedRect( w - 310, 350, 130, 130 )	
		end
		
	end
	
	local BoxSons = vgui.Create("DCheckBox", NPC)
	BoxSons:SetPos(435,38)
	if LocalPlayer():GetNWInt("enzoFR60NPCBoxSons") == true or LocalPlayer():GetNWInt("enzoFR60NPCBoxSons") == false then
		BoxSons:SetChecked(LocalPlayer():GetNWInt("enzoFR60NPCBoxSons"))
	elseif LocalPlayer():GetNWInt("enzoFR60NPCBoxSons") == nil then
		BoxSons:SetChecked(true)
	else
		BoxSons:SetChecked(true)
	end
	function BoxSons.OnChange()
		LocalPlayer():SetNWInt("enzoFR60NPCBoxSons", BoxSons:GetChecked())
	end
	
	local Base = vgui.Create( "DForm", NPC )
		Base:SetPos( 25, 50 )
		Base:SetSize( 450, 0 )
		Base:SetSpacing( 2 )
		Base:SetName( "" )
		Base.Paint = function()
		end

	if enzoFR60NPC.Collection then
	local Collection = vgui.Create( "ContentIcon", Base )
	Collection:SetSize( 450, 35 )
	Collection:SetPos( 25, Base:GetTall() - 420 )
	Collection:SetText( "Collection (Addons)" )
	Collection:SetName( "" )
	Collection:SetFont( "Trebuchet24" )
	Collection:SetTextColor(  Color( 255, 255, 255, 200 ) )
	Collection.OnCursorEntered = function( self ) self.hover = true if BoxSons:GetChecked() == true then surface.PlaySound("UI/buttonrollover.wav") end end
	Collection.OnCursorExited = function( self ) self.hover = false end
	Collection.Slide = 0
	Collection.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		end
	end	
	Collection.DoClick = function()
		net.Start( "enzoFR60npc:MenuWeb" )
		net.WriteString( enzoFR60NPC.CollectionLien )
		net.SendToServer()
		LocalPlayer():ChatPrint( enzoFR60NPC.LanguageLienVisite..enzoFR60NPC.CollectionLien )

		NPC:Remove()
	end
	Collection.OpenMenu = function()
		local menu = DermaMenu()
		menu:AddOption( enzoFR60NPC.LanguageCopier, function() SetClipboardText( enzoFR60NPC.CollectionLien ) end )
		menu:Open()
	end
	Base:AddItem( Collection )
	end

	if enzoFR60NPC.Groupe then
	local Groupe = vgui.Create( "ContentIcon", Base )
	Groupe:SetSize( 450, 35 )
	Groupe:SetPos( 25, Base:GetTall() - 370 )
	Groupe:SetText( enzoFR60NPC.LanguageGroupSteam )
	Groupe:SetFont( 'Trebuchet24' )
	Groupe:SetName( "" )
	Groupe:SetTextColor(  Color( 255, 255, 255, 200 ) )
	Groupe.OnCursorEntered = function( self ) self.hover = true if BoxSons:GetChecked() == true then surface.PlaySound("UI/buttonrollover.wav") end end
	Groupe.OnCursorExited = function( self ) self.hover = false end
	Groupe.Slide = 0
	Groupe.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		end
	end
	Groupe.DoClick = function()
		net.Start( "enzoFR60npc:MenuWeb" )
		net.WriteString( enzoFR60NPC.GroupeLien )
		net.SendToServer()
		LocalPlayer():ChatPrint( enzoFR60NPC.LanguageLienVisite..enzoFR60NPC.GroupeLien )

		NPC:Remove()
	end
	Groupe.OpenMenu = function()
		local menu = DermaMenu()
		menu:AddOption( enzoFR60NPC.LanguageCopier, function() SetClipboardText( enzoFR60NPC.GroupeLien ) end )
		menu:Open()
	end
	Base:AddItem( Groupe )
	end
	
	if enzoFR60NPC.Site then
	local Site = vgui.Create( "ContentIcon", Base )
	Site:SetSize( 450, 35 )
	Site:SetPos( 25, Base:GetTall() - 320 )
	Site:SetText( enzoFR60NPC.LanguageWebSite )
	Site:SetName( "" )
	Site:SetFont( 'Trebuchet24' )
	Site:SetTextColor(  Color( 255, 255, 255, 200 ) )
	Site.OnCursorEntered = function( self ) self.hover = true if BoxSons:GetChecked() == true then surface.PlaySound("UI/buttonrollover.wav") end end
	Site.OnCursorExited = function( self ) self.hover = false end
	Site.Slide = 0
	Site.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		end
	end
	Site.DoClick = function()
		net.Start( "enzoFR60npc:MenuWeb" )
		net.WriteString( enzoFR60NPC.SiteLien )
		net.SendToServer()
		LocalPlayer():ChatPrint( enzoFR60NPC.LanguageLienVisite..enzoFR60NPC.SiteLien )

		NPC:Remove()
	end
	Site.OpenMenu = function()
		local menu = DermaMenu()
		menu:AddOption( enzoFR60NPC.LanguageCopier, function() SetClipboardText( enzoFR60NPC.SiteLien ) end )
		menu:Open()
	end
	Base:AddItem( Site )
	end
	
	if enzoFR60NPC.Boutique then
	local Boutique = vgui.Create( "ContentIcon", Base )
	Boutique:SetSize( 450, 35 )
	Boutique:SetPos( 25, Base:GetTall() - 270 )
	Boutique:SetText( enzoFR60NPC.LanguageShop )
	Boutique:SetName( "" )
	Boutique:SetFont( 'Trebuchet24' )
	Boutique:SetTextColor(  Color( 255, 255, 255, 200 ) )
	Boutique.OnCursorEntered = function( self ) self.hover = true if BoxSons:GetChecked() == true then surface.PlaySound("UI/buttonrollover.wav") end end
	Boutique.OnCursorExited = function( self ) self.hover = false end
	Boutique.Slide = 0
	Boutique.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		end
	end
	Boutique.DoClick = function()
		net.Start( "enzoFR60npc:MenuWeb" )
		net.WriteString( enzoFR60NPC.BoutiqueLien )
		net.SendToServer()
		LocalPlayer():ChatPrint( enzoFR60NPC.LanguageLienVisite..enzoFR60NPC.BoutiqueLien )

		NPC:Remove()
	end
	Boutique.OpenMenu = function()
		local menu = DermaMenu()
		menu:AddOption( enzoFR60NPC.LanguageCopier, function() SetClipboardText( enzoFR60NPC.BoutiqueLien ) end )
		menu:Open()
	end
	Base:AddItem( Boutique )
	end
	
	if enzoFR60NPC.Discord then
	local Discord = vgui.Create( "ContentIcon", Base )
	Discord:SetSize( 450, 35 )
	Discord:SetPos( 25, Base:GetTall() - 220 )
	Discord:SetText( "Discord" )
	Discord:SetFont( 'Trebuchet24' )
	Discord:SetTextColor(  Color( 255, 255, 255, 200 ) )
	Discord.OnCursorEntered = function( self ) self.hover = true if BoxSons:GetChecked() == true then surface.PlaySound("UI/buttonrollover.wav") end end
	Discord.OnCursorExited = function( self ) self.hover = false end
	Discord.Slide = 0
	Discord:SetName( "" )
	Discord.Paint = function( self, w, h )
		if self.hover then
			self.Slide = Lerp( 0.05, self.Slide, w )

			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		else
			self.Slide = Lerp( 0.05, self.Slide, 0 )
			draw.RoundedBox(2, 0, 0, w, h, Color( 30, 30, 30, 200 ) )
			draw.RoundedBox(1, 0, 0, self.Slide, h, Color( 236, 100, 75, 200 ) )
		end
	end
	Discord.DoClick = function()
		gui.OpenURL( enzoFR60NPC.DiscordLien )
		LocalPlayer():ChatPrint( enzoFR60NPC.LanguageLienVisite.. enzoFR60NPC.DiscordLien )
		NPC:Remove()
	end
	Discord.OpenMenu = function()
		local menu = DermaMenu()
		menu:AddOption( enzoFR60NPC.LanguageCopier, function() SetClipboardText( enzoFR60NPC.DiscordLien ) end )
		menu:Open()
	end
	Base:AddItem( Discord )
	end
	
	local quit = vgui.Create( "DButton", NPC )
	quit:SetSize( 30,16 )
	quit:SetPos( NPC:GetWide() - 40,5 )
	quit:SetText( "X" )
	quit:SetTextColor( Color( 255, 255, 255 ) )
	quit.Paint = function( self, w, h )
	if quit.Depressed or quit.m_bSelected then 
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,200) )
				draw.RoundedBox( 0, 0, 0, 3, h, Color( 255, 255, 255, 255 ) ) -- color
			elseif quit.Hovered then
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,200) )
				draw.RoundedBox( 0, 0, 0, 3, h, Color( 255, 255, 255, 255 ) ) -- color
			else
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,200) )
				draw.RoundedBox( 0, 0, 0, 3, h, Color( 255, 255, 255, 255 ) ) -- color
		quit.DoClick = function()
        NPC:Close()
	         end
	      end
    end
end)

-- Open Gui Web
net.Receive( "enzoFR60npc:OpenMenuWeb", function()

local web = net.ReadString()

local createdTime = CurTime()

	WebSite = vgui.Create( "DFrame" )
	WebSite:SetSize( 1000, 600 )
	WebSite:Center()
	WebSite:SetTitle( "" )
	WebSite:MakePopup()
	WebSite:ShowCloseButton( false )
	WebSite:SetDraggable( true )
	WebSite.Paint = function( self, w, h )
		if input.IsKeyDown(83) and input.IsKeyDown(13)  then
			if self.ReadyToCopy then
				SetClipboardText( web )
				return
			end
		else
			if CurTime() - createdTime > 0.2 then
				self.ReadyToCopy = true
			end
		end
	end

	WebSite_B = vgui.Create( "Panel", WebSite )
	WebSite_B:SetPos( 182, 47 + 75 )
	WebSite_B:SetSize( WebSite:GetWide() - 182, WebSite:GetTall() - 122 )
	WebSite_B.Paint = function( self, w, h )
    end

	WebSite_BM = vgui.Create( "Panel", WebSite_B )
	WebSite_BM:SetSize( WebSite_B:GetWide(), WebSite_B:GetTall() )
	local WebSite_F = vgui.Create( "Panel", WebSite_BM )
	WebSite_F:SetSize( WebSite_B:GetWide() - 56, WebSite_B:GetTall() - 50 )
	WebSite_F:SetPos( -400, 25 )
	WebSite_F.Paint = function( self, w, h )
        draw.RoundedBox(20, 0, 0, self:GetWide(), self:GetTall(), Color(0, 0, 0, 160))
		
		draw.SimpleText( web, "Trebuchet24", 24, 20, Color( 190, 190, 190 ) )
		
		surface.SetDrawColor( Color( 242, 242, 242 ) )
		surface.DrawLine( 24, 44, 182 - 26, 44 )

	end
	
	local WebSite_HTML = vgui.Create( "HTML", WebSite_F )
	WebSite_HTML:SetPos( 28, 54 )
	WebSite_HTML:SetSize( WebSite_F:GetWide() - 56, WebSite_F:GetTall() - 64 )
	WebSite_HTML:OpenURL( web )
	
	WebSite_F:MoveTo( 28, 25, 0.2, 0, 0.2 )
	
	local quit = vgui.Create( "DButton", WebSite )
	quit:SetSize( 48,23 )
	quit:SetPos( WebSite:GetWide() - 100,160 )
	quit:SetText( "X" )
	quit:SetTextColor( Color( 255, 255, 255 ) )
	quit.Paint = function( self, w, h )
	if quit.Depressed or quit.m_bSelected then 
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,200) )
				draw.RoundedBox( 0, 0, 0, 3, h, Color( 255, 255, 255, 255 ) ) -- color
			elseif quit.Hovered then
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,200) )
				draw.RoundedBox( 0, 0, 0, 3, h, Color( 255, 255, 255, 255 ) ) -- color
			else
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,200) )
				draw.RoundedBox( 0, 0, 0, 3, h, Color( 255, 255, 255, 255 ) ) -- color
		quit.DoClick = function()
        WebSite:Close()
	         end
	      end
    end
	
end)