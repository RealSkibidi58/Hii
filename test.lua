loadstring([[
-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "PetSimGui"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Toggle Button
local toggleButton = Instance.new("ImageButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0, 10)
toggleButton.BackgroundTransparency = 1
toggleButton.Image = "rbxthumb://type=Asset&id=136388825215109&w=150&h=150"
toggleButton.Parent = gui

-- RGB icon loop
task.spawn(function()
    while true do
        for hue = 0, 1, 0.01 do
            toggleButton.ImageColor3 = Color3.fromHSV(hue, 1, 1)
            task.wait(0.05)
        end
    end
end)

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 300)
frame.Position = UDim2.new(0.5, -150, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = gui

-- Resize Grip
local resizeGrip = Instance.new("Frame")
resizeGrip.Size = UDim2.new(0, 20, 0, 20)
resizeGrip.Position = UDim2.new(1, -20, 1, -20)
resizeGrip.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
resizeGrip.BorderSizePixel = 0
resizeGrip.Parent = frame

-- Resize logic
local resizing = false
resizeGrip.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = input.Position
        local newWidth = math.clamp(mousePos.X - frame.AbsolutePosition.X, 100, 600)
        local newHeight = math.clamp(mousePos.Y - frame.AbsolutePosition.Y, 100, 400)
        frame.Size = UDim2.new(0, newWidth, 0, newHeight)
        resizeGrip.Position = UDim2.new(1, -20, 1, -20)
    end
end)

-- Icon inside frame
local icon = Instance.new("ImageLabel")
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 10, 0, 10)
icon.BackgroundTransparency = 1
icon.Image = "rbxthumb://type=Asset&id=136388825215109&w=150&h=150"
icon.Parent = frame

-- Dupe Script Button
local dupeButton = Instance.new("TextButton")
dupeButton.Size = UDim2.new(0, 200, 0, 50)
dupeButton.Position = UDim2.new(0.5, -100, 0.5, -25)
dupeButton.Text = "Dupe Pet [Need Alt account!]"
dupeButton.TextSize = 18
dupeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
dupeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dupeButton.Parent = frame

-- Confirmation Frame
local confirmFrame = Instance.new("Frame")
confirmFrame.Size = UDim2.new(0, 250, 0, 120)
confirmFrame.Position = UDim2.new(0.5, -125, 0.5, -60)
confirmFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
confirmFrame.BorderSizePixel = 0
confirmFrame.Visible = false
confirmFrame.Parent = gui

local confirmText = Instance.new("TextLabel")
confirmText.Size = UDim2.new(1, 0, 0, 40)
confirmText.Position = UDim2.new(0, 0, 0, 10)
confirmText.Text = "Are you sure you want to dupe a pet?"
confirmText.TextSize = 16
confirmText.BackgroundTransparency = 1
confirmText.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmText.Parent = confirmFrame

local yesBtn = Instance.new("TextButton")
yesBtn.Size = UDim2.new(0, 100, 0, 30)
yesBtn.Position = UDim2.new(0, 20, 1, -40)
yesBtn.Text = "Yes"
yesBtn.TextSize = 16
yesBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
yesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
yesBtn.Parent = confirmFrame

local noBtn = Instance.new("TextButton")
noBtn.Size = UDim2.new(0, 100, 0, 30)
noBtn.Position = UDim2.new(1, -120, 1, -40)
noBtn.Text = "No"
noBtn.TextSize = 16
noBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
noBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noBtn.Parent = confirmFrame

-- Actions
dupeButton.MouseButton1Click:Connect(function()
    confirmFrame.Visible = true
end)

yesBtn.MouseButton1Click:Connect(function()
    confirmFrame.Visible = false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MagzTVT/Pet-simulator-Dupe-script/refs/heads/main/Script"))()
end)

noBtn.MouseButton1Click:Connect(function()
    confirmFrame.Visible = false
    game.StarterGui:SetCore("SendNotification", {
        Title = "Okay!",
        Text = "Oh, then I'm not gonna do anything.",
        Duration = 4
    })
end)

-- Speed Input
local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0, 100, 0, 30)
speedInput.Position = UDim2.new(0.5, -150, 0.75, -15)
speedInput.PlaceholderText = "Speed"
speedInput.Text = ""
speedInput.TextSize = 16
speedInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.ClearTextOnFocus = false
speedInput.Parent = frame

-- Set Speed Button
local applySpeed = Instance.new("TextButton")
applySpeed.Size = UDim2.new(0, 90, 0, 30)
applySpeed.Position = UDim2.new(0.5, -40, 0.75, -15)
applySpeed.Text = "Set Speed"
applySpeed.TextSize = 16
applySpeed.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
applySpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
applySpeed.Parent = frame

-- Save & Load Buttons
local saveSpeed = Instance.new("TextButton")
saveSpeed.Size = UDim2.new(0, 90, 0, 30)
saveSpeed.Position = UDim2.new(0.5, -150, 0.9, -15)
saveSpeed.Text = "Save Speed"
saveSpeed.TextSize = 16
saveSpeed.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
saveSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
saveSpeed.Parent = frame

local loadSpeed = Instance.new("TextButton")
loadSpeed.Size = UDim2.new(0, 90, 0, 30)
loadSpeed.Position = UDim2.new(0.5, -40, 0.9, -15)
loadSpeed.Text = "Load Speed"
loadSpeed.TextSize = 16
loadSpeed.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
loadSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
loadSpeed.Parent = frame

-- Logic
getgenv().SavedSpeed = getgenv().SavedSpeed or nil

applySpeed.MouseButton1Click:Connect(function()
    local speed = tonumber(speedInput.Text)
    if speed then
        local human = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if human then
            human.WalkSpeed = speed
        end
    end
end)

saveSpeed.MouseButton1Click:Connect(function()
    local speed = tonumber(speedInput.Text)
    if speed then
        getgenv().SavedSpeed = speed
    end
end)

loadSpeed.MouseButton1Click:Connect(function()
    local saved = getgenv().SavedSpeed
    if saved then
        speedInput.Text = tostring(saved)
        local human = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if human then
            human.WalkSpeed = saved
        end
    end
end)

-- Toggle frame visibility
toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)
]])()
