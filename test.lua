loadstring([[
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

-- Add Button to run external script
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.7, -25)
button.Text = "Run Pet Sim Script"
button.TextSize = 18
button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame

-- Run the external script on click
button.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MagzTVT/Pet-simulator-Dupe-script/refs/heads/main/Script"))()
end)
]])()