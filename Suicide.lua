local function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local function readConfig(filename)
    local config = {}
    local file = io.open(filename, "r")
    if not file then
        return nil
    end
    for line in file:lines() do
        local key, value = line:match("^(.-)=(.-)$")
        if key and value then
            config[trim(key)] = trim(value)
        end
    end
    file:close()
    return config
end


local config1 = readConfig("./Servers/server/Lua/Configs/Suicide-Plugin-Config.txt")
local config2 = readConfig("./Servers/MyServer/Lua/Configs/Suicide-Plugin-Config.txt")
local config = config1 or config2


if config["debug"] == "true" then
    print("Suicide-Plugin: debug is enabled")
    if config["enabled"] == "true" then
        print("Suicide-Plugin: Plugin is enabled")
        hook:Add("PlayerSay","Test",function(player,text)

        if text == "/Suicide" then
            player:Kill()
            return "I committed Suicide"
        end
	
        return text

        end)
    else
        if config["enabled"] == "false" then
        print("Suicide-Plugin: Plugin is deactivated")
        else
        print("Suicide-Plugin: Config Error")
        end
    end
else
    if config["debug"] == "false" then
        if config["enabled"] == "true" then
            hook:Add("PlayerSay","Test",function(player,text)

            if text == "/Suicide" then
                player:Kill()
                return "I committed Suicide"
            end
        
            return text

            end)
        end
    end
end
