CELib = CELib or {}
CELib.Version = "v 1.0"
CELib.Author = "Cafeur & Ekali"


local path = 'celib'

local function Loading()

    //////////////////
    // SERVEUR LOAD //
    //////////////////

    if SERVER then

        local files = file.Find(path..'/server/*.lua', 'LUA')
        for _, file in ipairs(files) do
            include(path..'/server/'..file)
        end

        local files = file.Find(path..'/client/vgui/*.lua', 'LUA')
        for _, file in ipairs(files) do
            include(path..'/client/vgui/'..file)
        end

        local files = file.Find(path..'/shared/*.lua', 'LUA')
        for _, file in ipairs(files) do
            AddCSLuaFile(path..'/shared/'..file)
            include(path..'/shared/'..file)
        end
    
        local files = file.Find(path..'/client/core/*.lua', 'LUA')
        for _, file in ipairs(files) do
            AddCSLuaFile(path..'/client/core/'..file)
        end
        
        -- Msg( "///////////////////////////////\n" )
        -- Msg( "//            CELIB By       //\n" )
        -- print("//          "..CELib.Author..  "   //")
        -- Msg( "//            Version :      //\n" )
        -- print("//             "..CELib.Version..  "         //")
        -- Msg( "///////////////////////////////\n" )
        -- Msg( "// Loading...                //\n" )
        -- Msg( "//  autorun/celib.lua        //\n" )
        -- Msg( "//  vgui/cebaseframe.lua     //\n" )
        -- Msg( "//  vgui/cebutton.lua        //\n" )
        -- Msg( "//  vgui/cl_anims.lua        //\n" )
        -- Msg( "//  core/baseshadow.lua      //\n" )
        -- Msg( "//  core/cl_derma.lua        //\n" )
        -- Msg( "//  core/draw.lua            //\n" )
        -- Msg( "//  core/utils.lua           //\n" )
        -- Msg( "//  core/resources_download.lua //\n" )
        -- Msg( "// Load Complete!            //\n" )
        -- Msg( "///////////////////////////////\n" )
    


    end
    
    //////////////////
    // CLIENT LOAD //
    //////////////////

    if CLIENT then
        local files = file.Find(path..'/shared/*.lua', 'LUA')
        for _, file in ipairs(files) do
            include(path..'/shared/'..file)
        end

        
        local files = file.Find(path..'/client/vgui/*.lua', 'LUA')
        for _, file in ipairs(files) do
            include(path..'/client/vgui/'..file)
        end
    
        local files = file.Find(path..'/client/core/*.lua', 'LUA')
        for _, file in ipairs(files) do
            include(path..'/client/core/'..file)
        end
    end
end

concommand.Add("celib_reload", Loading)

Loading()