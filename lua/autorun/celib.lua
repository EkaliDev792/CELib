CELib = CELib or {}

local path = 'celib'

local function Loading()
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
        
        print("[CELib] Loaded with successfully !")
    end
    
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