local ChatStart = game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart
local ChatAdvance = game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance
local ChatUI = game.Players.LocalPlayer.PlayerGui.HUD.Bottom.ChatGui
local HairScript

local targetPosition = game.Players[getgenv().GlobalSettings.Arguments[1]].Character.HumanoidRootPart.Position

local repeatAdvance = function(Text, Parameter)
	repeat task.wait(.15)
		ChatAdvance:FireServer(Parameter)
	until ChatUI.TextLabel.Text == Text
end

ChatStart:FireServer(workspace.FriendlyNPCs["Hair Stylist"])
repeatAdvance("Alright", {"Yes"})

HairScript = game.Players.LocalPlayer.Backpack:WaitForChild("HairScript", 5)
HairScript.RemoteEvent:FireServer("woah")

game.Players.LocalPlayer.CharacterAdded:Wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(formerPosition)

table.clear(getgenv().GlobalSettings.Arguments)
