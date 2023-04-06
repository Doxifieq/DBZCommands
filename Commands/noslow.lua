local Removables = {
	"Using",
	"Attacking",
	"Action",
	"i",
	"evasive",
}

table.insert(getgenv().GlobalSettings.Connections, game.Players.LocalPlayer.Character.ChildAdded:Connect(function(Instance)
	if table.find(Removables, Instance.Name) then
		task.defer(function()
			Instance:Destroy()
		end)
	end
end))
