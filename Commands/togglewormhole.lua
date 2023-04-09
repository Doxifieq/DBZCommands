local Wormhole = workspace:FindFirstChild("Wormhole")

if Wormhole then
	if Wormhole.Position ~= Vector3.new(2656.72, 3945.04, -2516.38) then
		Wormhole.Position = Vector3.new(2656.72, 3945.04, -2516.38)
	else
		Wormhole.Position = Vector3.new(2656.72, 5000.04, -2516.38)
	end
end
