--[[
steal this and ur weird for stealing my garbage code
]]

getgenv().GlobalSettings = {
	DebugMode = true, --just shows debug stuff
	Prefix = "$",

	Connections = {},

	Commands = {
		["cframespeed"] = {
			Alias = "cfs",
			Description = "Teleport yourself forward really fast by holding 'V', execute 'clearconnections' to disable",
		};

		["clearconnections"] = {
			Alias = "cc",
			Description = "Clear all connections and disable all booleans",
		};

		["noslow"] = {
			Alias = "ns",
			Description = "Toggle NoSlow, execute 'clearconnections' to disable",
		};

		["pgod"] = {
			Alias = "pg",
			Description = "Toggle passive mode, execute again or hard reset to disable",
		};

		["reset"] = {
			Alias = "hr",
			Description = "Sets your health to 0 to initiate a true respawn",
		};

		["rejoin"] = {
			Alias = "rj",
			Description = "Rejoins the game",
		};

		["egod"] = {
			Alias = "eg",
			Description = "Toggle Earth GodMode, execute 'clearconnections' to disable"
		};

		["refresh"] = {
			Alias = "ref",
			Description = "Respawn yourself"
		};

		["dtglitch"] = {
			Alias = "dtg",
			Description = "Glitch someone when you use your next dragon throw"
		};
	};
}

local loadCommand = function(...)
	local Parameters = {...}
	local Success, Error

	Success, Error = pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Doxifieq/DBZCommands/main/Commands/" .. Parameters[1] .. ".lua"))()
	end)

	return Error or "Executed command " .. Parameters[1]
end

local getCommand = function(...)
	local Parameters = {...}
	local Command

	for CN, CT in next, GlobalSettings.Commands do
		if (CN == Parameters[1]) or (CT.Alias == Parameters[1]) then
		    Command = CN
		end
	end

	return Command
end

game.Players.LocalPlayer.Chatted:Connect(function(Message)
	local splitString = string.split(Message, GlobalSettings.Prefix)
	local Command = getCommand(splitString[2])

	if (Command) then
		local Response = loadCommand(Command)

		if (getgenv().GlobalSettings.DebugMode) then
			print(Response)
		end
	end
end)
