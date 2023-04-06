for _,C in next, getgenv().GlobalSettings.Connections do
	C:Disconnect()
end

for _,B in next, getgenv().GlobalSettings.Booleans do
	B = false
end
