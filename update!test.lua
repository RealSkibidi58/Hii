--[[ 
  Pet Simulator 1 - Fast Grind Mode with Toggle GUI and Swipe Animation by ChatGPT
  Auto Farm Coins + Auto Upgrade + Anti-Idle Active Immediately
  Toggle Switch to Show/Hide GUI with Swipe Animation
]]

-- Anti-Idle (Anti AFK)
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Auto Farm Coins
task.spawn(function()
    while task.wait(0.1) do
        for i,v in pairs(game:GetService("Workspace").Coins:GetChildren()) do
            if v:IsA("Model") then
                game:GetService("ReplicatedStorage").Network:FireServer("CollectCoin", v.Name)
            end
        end
    end
end)

-- Auto Upgrade Pet Storage
task.spawn(function()
    while task.wait(5) do
        game:GetService("ReplicatedStorage").Network:FireServer("Upgrade", "PetStorage")
    end
end)

-- Create GUI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Enabled = false  -- GUI is hidden initially

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0, 50, 0, 50)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.5
mainFrame.Parent = screenGui

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0, 50, 0, 25)
toggleButton.Text = "Toggle GUI"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 128, 255)
toggleButton.Parent = mainFrame

-- TweenService for smooth animations
local TweenService = game:GetService("TweenService")
local openTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local closeTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

local openTween = TweenService:Create(mainFrame, openTweenInfo, {Position = UDim2.new(0, 50, 0, 50)})
local closeTween = TweenService:Create(mainFrame, closeTweenInfo, {Position = UDim2.new(0, 50, 0, -120)})

toggleButton.MouseButton1Click:Connect(function()
    if screenGui.Enabled then
        -- Close the GUI with swipe down animation
        closeTween:Play()
        closeTween.Completed:Connect(function()
            screenGui.Enabled = false
        end)
    else
        -- Show the GUI with swipe up animation
        screenGui.Enabled = true
        openTween:Play()
    end
end)

print("Fast Grind Mode Activated! Enjoy leveling your pets fast!")
