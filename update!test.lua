-- Check if in Pet Simulator 1 (PlaceId: 1599679393)
if game.PlaceId ~= 1599679393 then
    game.StarterGui:SetCore("SendNotification", {
        Title = "Incorrect Game!",
        Text = "This script only works in Pet Simulator 1.",
        Duration = 5
    })
    return -- Stop the script from running if not in the correct game
end

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "PetSimGui"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Add Icon (ImageLabel)
local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 10, 0, 10)
icon.BackgroundTransparency = 1
icon.Image = "rbxthumb://type=Asset&id=136388825215109&w=150&h=150"
icon.Parent = frame

-- Rainbow Text Label (Author Tag)
local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(0, 280, 0, 30)
nameLabel.Position = UDim2.new(0.5, -140, 0, -35) -- Slightly above the frame
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "Test Still by Aduanhvi"
nameLabel.TextScaled = true
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextColor3 = Color3.new(1, 1, 1)
nameLabel.TextStrokeTransparency = 0.5
nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
nameLabel.RichText = true
nameLabel.Parent = frame

-- Rainbow Animation Function (for "Aduanhvi" only)
task.spawn(function()
	while true do
		for h = 0, 1, 0.01 do
			local color = Color3.fromHSV(h, 1, 1)
			local r = math.floor(color.R * 255)
			local g = math.floor(color.G * 255)
			local b = math.floor(color.B * 255)
			local rainbowName = '<font color="rgb(' .. r .. ',' .. g .. ',' .. b .. ')">Aduanhvi</font>'
			nameLabel.Text = "Test Still by " .. rainbowName
			wait(0.05)
		end
	end
end)

-- Add Button to Dupe Pet
local dupeButton = Instance.new("TextButton")
dupeButton.Size = UDim2.new(0, 200, 0, 50)
dupeButton.Position = UDim2.new(0.5, -100, 0.7, -25)
dupeButton.Text = "Dupe Pet (Need Alt Account!)"
dupeButton.TextSize = 18
dupeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
dupeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dupeButton.Parent = frame

-- Add Button to Hop Server
local hopButton = Instance.new("TextButton")
hopButton.Size = UDim2.new(0, 200, 0, 50)
hopButton.Position = UDim2.new(0.5, -100, 0.8, -25)
hopButton.Text = "Hop Server"
hopButton.TextSize = 18
hopButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
hopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
hopButton.Parent = frame

-- Create Confirmation Frame
local confirmFrame = Instance.new("Frame")
confirmFrame.Size = UDim2.new(0, 300, 0, 150)
confirmFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
confirmFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
confirmFrame.BorderSizePixel = 0
confirmFrame.Visible = false
confirmFrame.Parent = gui

-- Create Confirmation Text
local confirmText = Instance.new("TextLabel")
confirmText.Size = UDim2.new(0, 280, 0, 50)
confirmText.Position = UDim2.new(0.5, -140, 0, 20)
confirmText.Text = "Are you sure?"
confirmText.TextSize = 18
confirmText.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmText.BackgroundTransparency = 1
confirmText.Parent = confirmFrame

-- Yes Button for confirmation
local yesButton = Instance.new("TextButton")
yesButton.Size = UDim2.new(0, 130, 0, 40)
yesButton.Position = UDim2.new(0.5, -145, 0.6, 0)
yesButton.Text = "Yes"
yesButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
yesButton.Parent = confirmFrame

-- No Button for confirmation
local noButton = Instance.new("TextButton")
noButton.Size = UDim2.new(0, 130, 0, 40)
noButton.Position = UDim2.new(0.5, 15, 0.6, 0)
noButton.Text = "No"
noButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noButton.Parent = confirmFrame

-- Action Type Variable
local actionType = ""

-- Dupe Pet Button Logic
dupeButton.MouseButton1Click:Connect(function()
	actionType = "dupe"
	game.StarterGui:SetCore("SendNotification", {
		Title = "Please Wait!",
		Text = "Don't spam! It will Censor your screen!",
		Duration = 4
	})
	confirmText.Text = "Are you sure you want to open Dupe Pet?"
	confirmFrame.Visible = true
end)

-- Hop Server Button Logic
hopButton.MouseButton1Click:Connect(function()
	actionType = "hop"
	game.StarterGui:SetCore("SendNotification", {
		Title = "Please Wait!",
		Text = "Don't spam! It will Censor your screen!",
		Duration = 4
	})
	confirmText.Text = "Are you sure you want to Hop Servers?\nDupe Pet will run first!"
	confirmFrame.Visible = true
end)

-- Yes Button Logic
yesButton.MouseButton1Click:Connect(function()
	confirmFrame.Visible = false

	if actionType == "dupe" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/RealSkibidi58/Hii/main/dupepet.lua"))()
	elseif actionType == "hop" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/RealSkibidi58/Hii/main/dupepet.lua"))()
		wait(2)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/RealSkibidi58/Hii/main/hopserver.lua"))()
	end
end)

-- No Button Logic
noButton.MouseButton1Click:Connect(function()
	confirmFrame.Visible = false
	game.StarterGui:SetCore("SendNotification", {
		Title = "Alright!",
		Text = "Not going to do anything.",
		Duration = 3
	})
end)
