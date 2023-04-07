local RunService = game:GetService("RunService")

table.insert(getgenv().GlobalSettings.Connections, RunService.Stepped:Connect(function()
	print("RUNNING")
	local Character = game.Players.LocalPlayer.Character

	if Character then
		local Humanoid = Character:FindFirstChildOfClass("Humanoid")

		if Humanoid and Humanoid.Health > 0 then
			firetouchinterest(workspace.Touchy.Part, Character.UpperTorso, 0)
		end
	end
end))
