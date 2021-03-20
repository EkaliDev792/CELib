local path = 'celib'

local function Loading()
    if SERVER then
        local files = file.Find(path..'/shared/*.lua', 'LUA')
        for _, file in ipairs(files) do
            AddCSLuaFile(path..'/shared/'..file)
            include(path..'/shared/'..file)
        end
    
        local files = file.Find(path..'/client/core/*.lua', 'LUA')
        for _, file in ipairs(files) do
            AddCSLuaFile(path..'/client/'..file)
        end
    end
    
    if CLIENT then
        local files = file.Find(path..'/shared/*.lua', 'LUA')
        for _, file in ipairs(files) do
            include(path..'/shared/'..file)
        end
    
        local files = file.Find(path..'/client/core/*.lua', 'LUA')
        for _, file in ipairs(files) do
            include(path..'/client/'..file)
        end
    end
end

Loading()