concommand.Add("celib_derma", function ()
	local mainPanel = vgui.Create("CELib.Frame")
    mainPanel:SetTitle( "CELib - SuperFrame" )
	mainPanel:SetSize(500,460)
    mainPanel:MakePopup()
    mainPanel:Center()

    local button = vgui.Create("CELib.Button",mainPanel)
    button:SetPos(10,50)
    button:SetText( "Txt de teste" )
	button:SetSize(200,50)

    local button2 = vgui.Create("CELib.Button",mainPanel)
    button2:SetPos(255,50)
    button2:SetText( "Texte de test numero 1" )
	button2:SetSize(200,50)
    
    local color = vgui.Create("CELib.ColorPicker",mainPanel)
    color:SetPos(90,150)
	color:SetSize(300,300)

    local combo = vgui.Create("CELib.Combobox",mainPanel)
    combo:SetPos(145,120)
	combo:SetSize(200,25)
    combo:SetValue( "Test-CELIB" )
    combo:AddChoice("TEST - CHOICE 1")
    combo:AddChoice("TEST - CHOICE 2")
    combo:AddChoice("TEST - CHOICE 3")
    combo.OnSelect = function( self, index, value )
        print( value .." was selected at index " .. index )
    end

end)


concommand.Add( "celib_removeallpanel", function() 
    for i, v in ipairs( vgui.GetWorldPanel():GetChildren() ) do
        if v:IsVisible() then
            v:Remove()
        end
    end
end )