-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("TweenService")
local u4 = v1.LocalPlayer:WaitForChild("PlayerGui")
v2:WaitForChild("PermanentDeathNotify").OnClientEvent:Connect(function(p5) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
    --]]
    local v6 = u4:FindFirstChild("PDPopup")
    if v6 then
        v6:Destroy()
    end
    local v7 = Instance.new("ScreenGui")
    v7.Name = "PDPopup"
    v7.ResetOnSpawn = false
    v7.IgnoreGuiInset = true
    v7.DisplayOrder = 1000
    v7.Parent = u4
    local v8 = Instance.new("Frame", v7)
    v8.Size = UDim2.new(1, 0, 1, 0)
    v8.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v8.BackgroundTransparency = 1
    v8.BorderSizePixel = 0
    v8.ZIndex = 1000
    if p5 then
        local v9 = Instance.new("TextLabel", v8)
        v9.Size = UDim2.new(0.8, 0, 0.12, 0)
        v9.Position = UDim2.new(0.1, 0, 0.3, 0)
        v9.BackgroundTransparency = 1
        v9.Text = "PERMANENT DEATH"
        v9.TextColor3 = Color3.fromRGB(255, 40, 40)
        v9.Font = Enum.Font.Bodoni
        v9.TextSize = 58
        v9.TextTransparency = 1
        v9.TextStrokeTransparency = 0.4
        v9.TextStrokeColor3 = Color3.fromRGB(80, 0, 0)
        v9.ZIndex = 1001
        local v10 = Instance.new("Frame", v8)
        v10.Size = UDim2.new(0.3, 0, 0, 2)
        v10.Position = UDim2.new(0.35, 0, 0.44, 0)
        v10.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        v10.BackgroundTransparency = 1
        v10.BorderSizePixel = 0
        v10.ZIndex = 1001
        local v11 = Instance.new("TextLabel", v8)
        v11.Size = UDim2.new(0.8, 0, 0.06, 0)
        v11.Position = UDim2.new(0.1, 0, 0.47, 0)
        v11.BackgroundTransparency = 1
        v11.Text = "Toute mort est desormais definitive."
        v11.TextColor3 = Color3.fromRGB(200, 200, 205)
        v11.Font = Enum.Font.SourceSansItalic
        v11.TextSize = 26
        v11.TextTransparency = 1
        v11.ZIndex = 1001
        local v12 = Instance.new("TextLabel", v8)
        v12.Size = UDim2.new(0.8, 0, 0.05, 0)
        v12.Position = UDim2.new(0.1, 0, 0.53, 0)
        v12.BackgroundTransparency = 1
        v12.Text = "Votre personnage sera supprime si vous tombez au combat."
        v12.TextColor3 = Color3.fromRGB(160, 160, 165)
        v12.Font = Enum.Font.SourceSans
        v12.TextSize = 20
        v12.TextTransparency = 1
        v12.ZIndex = 1001
        local v13 = Instance.new("Sound", v7)
        v13.Name = "PDSound"
        v13.SoundId = "rbxassetid://9125404044"
        v13.Volume = 1
        v13.PlayOnRemove = false
        v13:Play()
        local v14 = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local v15 = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        u3:Create(v8, v14, {
            ["BackgroundTransparency"] = 0.2
        }):Play()
        task.wait(0.5)
        u3:Create(v9, v14, {
            ["TextTransparency"] = 0
        }):Play()
        task.wait(0.8)
        u3:Create(v10, v15, {
            ["BackgroundTransparency"] = 0
        }):Play()
        task.wait(0.3)
        u3:Create(v11, v14, {
            ["TextTransparency"] = 0
        }):Play()
        task.wait(0.3)
        u3:Create(v12, v14, {
            ["TextTransparency"] = 0
        }):Play()
        task.wait(6)
        local v16 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        u3:Create(v8, v16, {
            ["BackgroundTransparency"] = 1
        }):Play()
        u3:Create(v9, v16, {
            ["TextTransparency"] = 1
        }):Play()
        u3:Create(v10, v16, {
            ["BackgroundTransparency"] = 1
        }):Play()
        u3:Create(v11, v16, {
            ["TextTransparency"] = 1
        }):Play()
        u3:Create(v12, v16, {
            ["TextTransparency"] = 1
        }):Play()
        u3:Create(v13, TweenInfo.new(2), {
            ["Volume"] = 0
        }):Play()
        task.wait(2.5)
        v7:Destroy()
    else
        local v17 = Instance.new("TextLabel", v8)
        v17.Size = UDim2.new(0.8, 0, 0.1, 0)
        v17.Position = UDim2.new(0.1, 0, 0.4, 0)
        v17.BackgroundTransparency = 1
        v17.Text = "Permanent Death desactive"
        v17.TextColor3 = Color3.fromRGB(100, 200, 100)
        v17.Font = Enum.Font.Bodoni
        v17.TextSize = 42
        v17.TextTransparency = 1
        v17.ZIndex = 1001
        local v18 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        u3:Create(v8, v18, {
            ["BackgroundTransparency"] = 0.4
        }):Play()
        task.wait(0.3)
        u3:Create(v17, v18, {
            ["TextTransparency"] = 0
        }):Play()
        task.wait(3)
        local v19 = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        u3:Create(v8, v19, {
            ["BackgroundTransparency"] = 1
        }):Play()
        u3:Create(v17, v19, {
            ["TextTransparency"] = 1
        }):Play()
        task.wait(2)
        v7:Destroy()
    end
end)