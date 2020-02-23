util.AddNetworkString("HTMLTEST_OPENUI")

hook.Remove("PlayerSay", "HTMLTESTCOMMAND")
hook.Add("PlayerSay", "HTMLTESTCOMMAND", function(ply, message, isTeam, isDead)
	local command = string.Trim(string.lower(message))
	if(command != "!htmltest") then return end

    net.Start("HTMLTEST_OPENUI")
    net.Send(ply)
end)
