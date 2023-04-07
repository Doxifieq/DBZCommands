local RunService = game:GetService("RunService")

table.insert(getgenv().GlobalSettings.Connections, RunService.Stepped:Connect(function()
	local Character = game.Players.LocalPlayer.Character

	if Character then
		local Root = Character:FindFirstChild("HumanoidRootPart")

		if Root then
			firetouchinterest(workspace.Touchy.Part, Root, 0)
			firetouchinterest(workspace.Touchy.Part, Root, 1)
		end
	end
end))

table.insert(getgenv().GlobalSettings.Connections, game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(Instance)
	if string.match(Instance.Name, "Popup") then
		task.defer(function()
			Instance:Destroy()
		end)
	end
end))
