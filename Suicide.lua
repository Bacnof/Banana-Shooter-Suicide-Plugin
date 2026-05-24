hook:Add("PlayerSay","Test",function(player,text)

    if text == "/Suicide" then
        player:Kill()
        return "I committed Suicide"
    end
	
    return text

end)