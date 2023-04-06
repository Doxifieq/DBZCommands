local Character = game.Players.LocalPlayer.Character

local PhysResist = Character.Stats:FindFirstChild("Phys-Resist")
local KiResist = Character.Stats:FindFirstChild("Ki-Resist")

if PhysResist then
	PhysResist:Destroy()
end

if KiResist then
	KiResist:Destroy()
end
