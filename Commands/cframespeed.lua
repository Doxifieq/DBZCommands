local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Vector
local CFrameSpeed = function()
	if (game.Players.LocalPlayer.Character) then
		local Root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

		if (Root) then
			Root.CFrame = Root.CFrame * CFrame.new(Vector)
		end
	end
end

table.insert(getgenv().GlobalSettings.Connections, UserInputService.InputBegan:Connect(function(Input, isTyping)
	if (not isTyping) then
		if (Input.KeyCode == Enum.KeyCode.V) then
			RunService:BindToRenderStep("CFrameSpeed", 1, CFrameSpeed)
			Vector = Vector3.new(0, 0, -17.5)

		elseif (Input.KeyCode == Enum.KeyCode.LeftControl) then
			Vector = Vector3.new(0, -15, -7.5)

		elseif (Input.KeyCode == Enum.KeyCode.Space) then
			Vector = Vector3.new(0, 15, -7.5)
		end
	end
end))

table.insert(getgenv().GlobalSettings.Connections, UserInputService.InputEnded:Connect(function(Input, isTyping)
	if (not isTyping) then
		if (Input.KeyCode == Enum.KeyCode.V) then
			RunService:UnbindFromRenderStep("CFrameSpeed")

		elseif (Input.KeyCode == Enum.KeyCode.LeftControl) then
			Vector = Vector3.new(0, 0, -17.5)

		elseif (Input.KeyCode == Enum.KeyCode.Space) then
			Vector = Vector3.new(0, 0, -17.5)
		end
	end
end))
