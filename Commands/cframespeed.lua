print("executed")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local CFrameSpeed = function()
	local Vector = Vector3.new(0, 0, -5)

	if (getgenv().GlobalSettings.Booleans.HoldingLeftControl) then
		Vector = Vector3.new(0, -5, -2.5)
	end

	if (getgenv().GlobalSettings.Booleans.HoldingSpace) then
		Vector = Vector3.new(0, 5, -2.5)
	end

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

		elseif (Input.KeyCode == Enum.KeyCode.LeftControl) then
			getgenv().GlobalSettings.Booleans.HoldingLeftControl = true

		elseif (Input.KeyCode == Enum.KeyCode.Space) then
			getgenv().GlobalSettings.Booleans.HoldingSpace = true
		end
	end
end))

table.insert(getgenv().GlobalSettings.Connections, UserInputService.InputEnded:Connect(function(Input, isTyping)
	if (not isTyping) then
		if (Input.KeyCode == Enum.KeyCode.V) then
			RunService:UnbindFromRenderStep("CFrameSpeed")

		elseif (Input.KeyCode == Enum.KeyCode.LeftControl) then
			getgenv().GlobalSettings.Booleans.HoldingLeftControl = false

		elseif (Input.KeyCode == Enum.KeyCode.Space) then
			getgenv().GlobalSettings.Booleans.HoldingSpace = false
		end
	end
end))
