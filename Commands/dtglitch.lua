local DragonThrow = game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Throw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Throw")

if DragonThrow then
	DragonThrow.Parent = Player.Character

	local Flip = DragonThrow.Activator:FindFirstChild("Flip")

	if Flip then
		Flip:Destroy()
	end
end
