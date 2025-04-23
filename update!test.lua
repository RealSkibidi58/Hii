-- Loadstring-friendly updated script with fixes and new features

-- Create GUI
local gui = Instance.new("ScreenGui") gui.Name = "PetSimGui" gui.ResetOnSpawn = false gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local frame = Instance.new("Frame") frame.Size = UDim2.new(0, 300, 0, 220) frame.Position = UDim2.new(0.5, -150, 0.5, -110) frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) frame.BorderSizePixel = 0 frame.Parent = gui

-- Top Right Icon
local topIcon = Instance.new("ImageLabel") topIcon.Size = UDim2.new(0, 40, 0, 40) topIcon.Position = UDim2.new(1, -45, 0, 5) topIcon.BackgroundTransparency = 1 topIcon.Image = "rbxthumb://type=Asset&id=136388825215109&w=150&h=150" topIcon.Parent = frame

-- Rainbow Name
Label local nameLabel = Instance.new("TextLabel") nameLabel.Size = UDim2.new(0, 280, 0, 30) nameLabel.Position = UDim2.new(0.5, -140, 0, -35) nameLabel.BackgroundTransparency = 1 nameLabel.Text = "Test Still by Aduanhvi" nameLabel.TextScaled = true nameLabel.Font = Enum.Font.GothamBold nameLabel.TextColor3 = Color3.new(1, 1, 1) nameLabel.TextStrokeTransparency = 0.5 nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0) nameLabel.RichText = true nameLabel.Parent = frame

-- Animate Rainbow Text spawn
(function() while true do for h = 0, 1, 0.01 do local color = Color3.fromHSV(h, 1, 1) local r = math.floor(color.R * 255) local g = math.floor(color.G * 255) local b = math.floor(color.B * 255) local rainbowName = '<font color="rgb(' .. r .. ',' .. g .. ',' .. b .. ')">Aduanhvi</font>' nameLabel.Text = "Test Still by " .. rainbowName wait(0.05) end end end)

-- Buttons
local function createButton(text, yPos, callback) local button = Instance.new("TextButton") button.Size = UDim2.new(0, 200, 0, 40) button.Position = UDim2.new(0.5, -100, 0, yPos) button.Text = text button.TextSize = 18 button.BackgroundColor3 = Color3.fromRGB(60, 60, 60) button.TextColor3 = Color3.fromRGB(255, 255, 255) button.Parent = frame button.MouseButton1Click:Connect(callback) return button end

-- Speed Toggle
local speedEnabled = false local defaultSpeed = 16 local fastSpeed = 50 createButton("Toggle Speed", 50, function() local char = game.Players.LocalPlayer.Character if char then speedEnabled = not speedEnabled char.Humanoid.WalkSpeed = speedEnabled and fastSpeed or defaultSpeed end end)

-- Dupe Pet
createButton("Dupe Pet (Need Alt Account!)", 100, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RealSkibidi58/Hii/main/dupepet.lua"))() end)

-- Server Hop
createButton("Hop Server", 150, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RealSkibidi58/Hii/main/dupepet.lua"))() wait(2) loadstring(game:HttpGet("https://raw.githubusercontent.com/RealSkibidi58/Hii/main/hopserver.lua"))() end)

-- Rainbow ESP for _, player in ipairs(game.Players:GetPlayers()) do if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then local box = Instance.new("BoxHandleAdornment") box.Adornee = player.Character:FindFirstChild("HumanoidRootPart") box.AlwaysOnTop = true box.ZIndex = 5 box.Size = Vector3.new(3, 5, 1) box.Transparency = 0.5 box.Parent = player.Character:FindFirstChild("HumanoidRootPart")

spawn(function()
        while box and box.Parent do
            for h = 0, 1, 0.01 do
                local color = Color3.fromHSV(h, 1, 1)
                box.Color3 = color
                wait(0.05)
            end
        end
    end)
end

end

