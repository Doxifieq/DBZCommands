for _,C in next, getgenv().GlobalSettings.Connections do
	C:Disconnect()
end
