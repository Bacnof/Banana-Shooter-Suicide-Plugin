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


local config = readConfig("./Configs/Suicide-Plugin-Config.txt")

if config["debug"] == "true" then
    print("Suicide-Plugin: debug is enabled")
    if config["log"] == "true" then
        print("Suicide-Plugin: Logs are enabled")
    end
end
if config["enabled"] == "true" then
    if config["debug"] == "true" then
        print("Suicide-Plugin: Plugin is enabled")
    end
    hook:Add("PlayerSay","Suicide",function(player,text)

        if text == "/Suicide" then
            player:Kill()
			if config["log"] == "true" then
                print("Suicide-Plugin: A Player committed Suicide")
            end
            return "I committed Suicide"
        end
	
        return text

    end) 
else
    if config["enabled"] == "false" then
        if config["debug"] == "true" then
            print("Suicide-Plugin: Plugin is deactivated")
        end
    end
end
