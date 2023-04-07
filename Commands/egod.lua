local RunService = game:GetService("RunService")

table.insert(getgenv().GlobalSettings.Connections, RunService.Stepped:Connect(function()
	print("RUNNING")
	local Character = game.Players.LocalPlayer.Character

	if Character then
		local Root = Character:FindFirstChild("HumanoidRootPart")

		if Root then
			firetouchinterest(workspace.Touchy.Part, Root, 0)
			firetouchinterest(workspace.Touchy.Part, Root, 1)
		end
	end
end))
