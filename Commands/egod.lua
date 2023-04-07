local RunService = game:GetService("RunService")

local Character = game.Players.LocalPlayer.Character
local Root = Character:FindFirstChild("HumanoidRootPart")

table.insert(getgenv().GlobalSettings.Connections, RunService.Stepped:Connect(function()
	print("RUNNING")
	Character = game.Players.LocalPlayer.Character

	if Character then
		Root = Character:FindFirstChild("HumanoidRootPart")

		if Root then
			firetouchinterest(workspace.Touchy.Part, Root, 0)
		end
	end
end))

table.insert(getgenv().GlobalSettings.Connections, workspace.Touchy.Part.TouchEnded:Connect(function(Instance)
	if string.match(Instance.Parent.Name, game.Players.LocalPlayer.Name) then
		firetouchinterest(workspace.Touchy.Part, Root, 0)
	end
end))
