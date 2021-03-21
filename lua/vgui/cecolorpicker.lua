local PANEL = {}
CELib.CreateFontSize("Espera", "CELib", 28)
function PANEL:Init()
	self:SetRGB(Color(255,255,255))
	self.Material = Material('CELib/colorpicker.png')
end