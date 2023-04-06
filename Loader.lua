--[[
steal this and ur weird for stealing my garbage code
]]

getgenv().GlobalSettings = {
	DebugMode = true, --just shows debug stuff
	Prefix = "-",

	Connections = {},

	Booleans = {
		HoldingLeftControl = false,
		HoldingSpace = false,
	};

	Commands = {
		["cframespeed"] = {
			Alias = "cfs",
			Description = "Teleport yourself forward really fast by holding 'V'",
		};

		["clearconnections"] = {
			Alias = "cc",
			Description = "'Restart' the script",
		};

		["noslow"] = {
			Alias = "ns",
			Description = "Toggles NoSlow",
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
