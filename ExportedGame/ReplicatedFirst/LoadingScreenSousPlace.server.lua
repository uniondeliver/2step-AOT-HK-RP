-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("StarterGui")
u1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
u1:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
u1:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedFirst")
local u4 = game:GetService("TweenService")
local u5 = v2.LocalPlayer
local v6 = u5:WaitForChild("PlayerGui")
local v7 = {
    ["TitleText"] = Color3.fromRGB(220, 220, 225),
    ["SubtitleGray"] = Color3.fromRGB(140, 140, 145),
    ["MainBg"] = Color3.fromRGB(18, 18, 20),
    ["SectionBg"] = Color3.fromRGB(16, 16, 20),
    ["InputBg"] = Color3.fromRGB(20, 20, 25),
    ["ButtonBg"] = Color3.fromRGB(25, 25, 30),
    ["StrokeColor"] = Color3.fromRGB(140, 140, 145),
    ["PureBlack"] = Color3.fromRGB(8, 8, 10)
}
local u8 = {
    "Les titans approchent des murailles...",
    "Pr\195\169parez les lames tridimensionnelles",
    "Le mur Maria tient toujours",
    "L\'humanit\195\169 ne c\195\169dera jamais",
    "Shinzou wo Sasageyo !"
}
v3:RemoveDefaultLoadingScreen()
local u9 = Instance.new("ScreenGui")
u9.Name = "LoadingScreen"
u9.ResetOnSpawn = false
u9.IgnoreGuiInset = true
u9.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
u9.DisplayOrder = 100
local u10 = Instance.new("Frame")
u10.Name = "Background"
u10.Size = UDim2.new(1, 0, 1, 0)
u10.BackgroundColor3 = v7.PureBlack
u10.BorderSizePixel = 0
u10.ZIndex = 1
u10.ClipsDescendants = true
u10.Parent = u9
local u11 = Instance.new("Frame", u10)
u11.Size = UDim2.new(1, 0, 1, 0)
u11.BackgroundTransparency = 1
u11.BorderSizePixel = 0
u11.ClipsDescendants = true
u11.ZIndex = 2
local u12 = true
local u13 = 0
task.spawn(function() --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u13
        [4] = u11
    --]]
    while u12 and u10.Parent do
        if u13 < 30 and math.random() < 0.5 then
            u13 = u13 + 1
            local u14 = Instance.new("Frame")
            local u15 = math.random(2, 8)
            u14.Size = UDim2.new(0, u15, 0, u15)
            u14.Position = UDim2.new(0.15 + math.random() * 0.7, 0, 1, 0)
            local v16 = math.random()
            u14.BackgroundColor3 = v16 < 0.3 and Color3.fromRGB(255, 80, 20) or v16 < 0.6 and Color3.fromRGB(255, 140, 40) or (v16 < 0.85 and Color3.fromRGB(255, 200, 80) or Color3.fromRGB(255, 230, 120))
            u14.BackgroundTransparency = 0.1
            u14.BorderSizePixel = 0
            u14.ZIndex = 3
            u14.Parent = u11
            Instance.new("UICorner", u14).CornerRadius = UDim.new(1, 0)
            task.spawn(function() --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u15
                    [3] = u13
                --]]
                local v17 = math.random(80, 140)
                local v18 = -0.005 - math.random() * 0.007
                local v19 = (math.random() - 0.5) * 0.002
                local v20 = 0
                for v21 = 1, v17 do
                    if not u14.Parent then
                        break
                    end
                    v20 = (v20 + (math.random() - 0.5) * 0.001) * 0.96
                    v18 = v18 * 0.98
                    local v22 = u14.Position.X.Scale + v19 + v20
                    local v23 = u14.Position.Y.Scale + v18
                    if v22 < 0 or (v22 > 1 or v23 < -0.1) then
                        break
                    end
                    u14.Position = UDim2.new(v22, 0, v23, 0)
                    local v24 = v21 / v17
                    u14.BackgroundTransparency = 0.1 + v24 * 0.9
                    u14.Size = UDim2.new(0, u15 * (1 - v24 * 0.5), 0, u15 * (1 - v24 * 0.5))
                    task.wait(0.03)
                end
                u13 = u13 - 1
                if u14.Parent then
                    u14:Destroy()
                end
            end)
        end
        task.wait(0.06)
    end
end)
local u25 = Instance.new("Frame", u10)
u25.Size = UDim2.new(0, 900, 0, 480)
u25.Position = UDim2.new(0.5, -450, 0.5, -240)
u25.BackgroundColor3 = v7.MainBg
u25.BorderSizePixel = 0
u25.ZIndex = 4
Instance.new("UICorner", u25).CornerRadius = UDim.new(0, 12)
local u26 = Instance.new("UIStroke", u25)
u26.Color = v7.StrokeColor
u26.Thickness = 3
local v27 = Instance.new("Frame", u25)
v27.Size = UDim2.new(1, -20, 1, -20)
v27.Position = UDim2.new(0, 10, 0, 10)
v27.BackgroundTransparency = 1
v27.ZIndex = 5
local u28 = Instance.new("UIStroke", v27)
u28.Color = Color3.fromRGB(100, 100, 110)
u28.Thickness = 1
u28.Transparency = 0.5
Instance.new("UICorner", v27).CornerRadius = UDim.new(0, 10)
local u29 = Instance.new("TextLabel", u25)
u29.Size = UDim2.new(1, 0, 0, 85)
u29.Position = UDim2.new(0, 0, 0, 25)
u29.BackgroundTransparency = 1
u29.Text = "HUMANITY\'S KINGDOM"
u29.Font = Enum.Font.Bodoni
u29.TextSize = 52
u29.TextColor3 = v7.TitleText
u29.TextStrokeTransparency = 0.8
u29.ZIndex = 6
local u30 = Instance.new("TextLabel", u25)
u30.Size = UDim2.new(1, 0, 0, 35)
u30.Position = UDim2.new(0, 0, 0, 115)
u30.BackgroundTransparency = 1
u30.Text = "Chargement de votre destin"
u30.Font = Enum.Font.Bodoni
u30.TextSize = 26
u30.TextColor3 = v7.SubtitleGray
u30.ZIndex = 6
local u31 = Instance.new("Frame", u25)
u31.Size = UDim2.new(0.85, 0, 0, 110)
u31.Position = UDim2.new(0.075, 0, 0, 230)
u31.BackgroundColor3 = v7.SectionBg
u31.BorderSizePixel = 0
u31.ZIndex = 5
Instance.new("UICorner", u31).CornerRadius = UDim.new(0, 10)
local u32 = Instance.new("Frame", u31)
u32.Size = UDim2.new(0.9, 0, 0, 50)
u32.Position = UDim2.new(0.05, 0, 0.5, -25)
u32.BackgroundColor3 = v7.InputBg
u32.BorderSizePixel = 0
u32.ZIndex = 6
Instance.new("UICorner", u32).CornerRadius = UDim.new(0, 10)
local u33 = Instance.new("Frame", u32)
u33.Size = UDim2.new(0, 0, 1, 0)
u33.BackgroundColor3 = v7.ButtonBg
u33.BorderSizePixel = 0
u33.ZIndex = 7
Instance.new("UICorner", u33).CornerRadius = UDim.new(0, 10)
local u34 = Instance.new("TextLabel", u32)
u34.Size = UDim2.new(1, 0, 1, 0)
u34.BackgroundTransparency = 1
u34.Text = "0%"
u34.Font = Enum.Font.Bodoni
u34.TextSize = 28
u34.TextColor3 = v7.TitleText
u34.ZIndex = 8
local u35 = Instance.new("TextLabel", u25)
u35.Size = UDim2.new(1, -40, 0, 60)
u35.Position = UDim2.new(0, 20, 1, -90)
u35.BackgroundTransparency = 1
u35.Text = u8[1]
u35.Font = Enum.Font.SourceSansItalic
u35.TextSize = 20
u35.TextColor3 = v7.SubtitleGray
u35.TextWrapped = true
u35.ZIndex = 6
task.spawn(function() --[[ Line: 202 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u35
    --]]
    local v36 = 1
    while u9.Parent do
        task.wait(2.5)
        local v37 = v36 + 1
        v36 = #u8 < v37 and 1 or v37
        if u35.Parent then
            u35.Text = u8[v36]
        end
    end
end)
u9.Parent = v6
local u38 = tick()
spawn(function() --[[ Line: 219 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u38
        [3] = u33
        [4] = u34
        [5] = u30
        [6] = u12
        [7] = u4
        [8] = u10
        [9] = u25
        [10] = u31
        [11] = u26
        [12] = u28
        [13] = u29
        [14] = u35
        [15] = u32
        [16] = u9
        [17] = u1
    --]]
    local v39 = u5.Character or u5.CharacterAdded:Wait()
    local v40 = v39:WaitForChild("HumanoidRootPart")
    local v41 = v39:WaitForChild("Humanoid")
    v40.Anchored = true
    v41.WalkSpeed = 0
    v41.JumpPower = 0
    v41.JumpHeight = 0
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    local u42 = 0
    task.spawn(function() --[[ Line: 234 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u38
            [3] = u33
            [4] = u34
        --]]
        while u42 < 0.99 do
            local v43 = (tick() - u38) / 6
            local v44 = math.min(v43, 1)
            if u42 < v44 then
                u42 = u42 + 0.02
                if v44 < u42 then
                    u42 = v44
                end
            end
            if u33.Parent then
                u33.Size = UDim2.new(u42, 0, 1, 0)
                local v45 = u34
                local v46 = u42 * 100
                v45.Text = math.floor(v46) .. "%"
            end
            task.wait(0.1)
        end
    end)
    while tick() - u38 < 6 do
        task.wait(0.5)
    end
    if u33.Parent then
        u33.Size = UDim2.new(1, 0, 1, 0)
        u34.Text = "100%"
    end
    if u30.Parent then
        u30.Text = "Votre destin est scell\195\169"
    end
    task.wait(0.8)
    u12 = false
    task.wait(0.1)
    local v47 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    u4:Create(u10, v47, {
        ["BackgroundTransparency"] = 1
    }):Play()
    u4:Create(u25, v47, {
        ["BackgroundTransparency"] = 1
    }):Play()
    u4:Create(u31, v47, {
        ["BackgroundTransparency"] = 1
    }):Play()
    u4:Create(u26, v47, {
        ["Transparency"] = 1
    }):Play()
    u4:Create(u28, v47, {
        ["Transparency"] = 1
    }):Play()
    u4:Create(u29, v47, {
        ["TextTransparency"] = 1,
        ["TextStrokeTransparency"] = 1
    }):Play()
    u4:Create(u30, v47, {
        ["TextTransparency"] = 1
    }):Play()
    u4:Create(u34, v47, {
        ["TextTransparency"] = 1
    }):Play()
    u4:Create(u35, v47, {
        ["TextTransparency"] = 1
    }):Play()
    u4:Create(u32, v47, {
        ["BackgroundTransparency"] = 1
    }):Play()
    u4:Create(u33, v47, {
        ["BackgroundTransparency"] = 1
    }):Play()
    task.wait(0.3)
    u9:Destroy()
    u1:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
    u1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
    u1:SetCoreGuiEnabled(Enum.CoreGuiType.Health, true)
    if v40 and v40.Parent then
        v40.Anchored = false
    end
    if v41 and v41.Parent then
        v41.WalkSpeed = 16
        v41.JumpPower = 50
        v41.JumpHeight = 7.2
    end
end)