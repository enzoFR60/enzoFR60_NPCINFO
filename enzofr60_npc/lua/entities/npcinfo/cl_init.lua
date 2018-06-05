include("shared.lua")

function ENT:Draw()
	self.Entity:DrawModel()
	
	local pos = self:GetPos()
	pos.z = (pos.z + 15)
	local ang = self:GetAngles()
	
	surface.SetFont("CloseCaption_Bold")
	local title = "NPC INFO"
	local tw = surface.GetTextSize(title)

	ang:RotateAroundAxis(ang:Forward(), 90)
	local textang = ang

	textang:RotateAroundAxis(textang:Right(), CurTime() * -60)

	cam.Start3D2D(pos + ang:Right() * -30, textang, 0.2)
		draw.WordBox(3, -tw *0.5 + 5, -180, title, "CloseCaption_Bold", Color(0,0,0,105), color_white)
	cam.End3D2D()

end