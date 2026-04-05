-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("TweenService")
local u4 = v1.LocalPlayer:WaitForChild("PlayerGui")
v2:WaitForChild("ShowDeathScreen").OnClientEvent:Connect(function() --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    local v5 = Instance.new("ScreenGui")
    v5.Name = "DeathScreen"
    v5.ResetOnSpawn = false
    v5.IgnoreGuiInset = true
    v5.DisplayOrder = 999
    v5.Parent = u4
    local v6 = Instance.new("Frame", v5)
    v6.Size = UDim2.new(1, 0, 1, 0)
    v6.Position = UDim2.new(0, 0, 0, 0)
    v6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v6.BackgroundTransparency = 1
    v6.BorderSizePixel = 0
    v6.ZIndex = 999
    local v7 = Instance.new("TextLabel", v6)
    v7.Size = UDim2.new(0.8, 0, 0.2, 0)
    v7.Position = UDim2.new(0.1, 0, 0.4, 0)
    v7.BackgroundTransparency = 1
    v7.Text = "VOUS \195\138TES TOMB\195\137 AU COMBAT"
    v7.TextColor3 = Color3.fromRGB(220, 220, 225)
    v7.Font = Enum.Font.Bodoni
    v7.TextSize = 48
    v7.TextTransparency = 1
    v7.ZIndex = 1000
    local v8 = Instance.new("TextLabel", v6)
    v8.Size = UDim2.new(0.8, 0, 0.1, 0)
    v8.Position = UDim2.new(0.1, 0, 0.55, 0)
    v8.BackgroundTransparency = 1
    v8.Text = "Votre destin sera r\195\169initialis\195\169..."
    v8.TextColor3 = Color3.fromRGB(140, 140, 145)
    v8.Font = Enum.Font.SourceSansItalic
    v8.TextSize = 24
    v8.TextTransparency = 1
    v8.ZIndex = 1000
    local v9 = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
    u3:Create(v6, v9, {
        ["BackgroundTransparency"] = 0
    }):Play()
    task.wait(0.5)
    u3:Create(v7, v9, {
        ["TextTransparency"] = 0
    }):Play()
    task.wait(0.3)
    u3:Create(v8, v9, {
        ["TextTransparency"] = 0
    }):Play()
end)