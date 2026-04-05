-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = game:GetService("Players")
local v2 = game:GetService("UserInputService")
local u3 = game:GetService("TweenService")
local u4 = game:GetService("StarterGui")
local u5 = u1.LocalPlayer:WaitForChild("PlayerGui")
local u6 = Enum.KeyCode.Tab
local u7 = {
    ["TitleText"] = Color3.fromRGB(220, 220, 225),
    ["SubtitleGray"] = Color3.fromRGB(140, 140, 145),
    ["MainBg"] = Color3.fromRGB(18, 18, 20),
    ["SectionBg"] = Color3.fromRGB(16, 16, 20),
    ["PlayerRow"] = Color3.fromRGB(22, 22, 26),
    ["PlayerRowAlt"] = Color3.fromRGB(20, 20, 24),
    ["StrokeColor"] = Color3.fromRGB(140, 140, 145)
}
local u8 = {
    ["Civil"] = Color3.fromRGB(120, 120, 125),
    ["Corps d\'Entra\195\174nement"] = Color3.fromRGB(95, 66, 41),
    ["Bataillon d\'Exploration"] = Color3.fromRGB(14, 16, 140),
    ["Garnison"] = Color3.fromRGB(160, 27, 15),
    ["Brigade Sp\195\169ciale"] = Color3.fromRGB(54, 170, 28),
    ["Gouvernement"] = Color3.fromRGB(180, 160, 60),
    ["Instructeur"] = Color3.fromRGB(0, 0, 0),
    ["Staff"] = Color3.fromRGB(20, 167, 200),
    ["R\195\169volutionnaire"] = Color3.fromRGB(180, 30, 30),
    ["La Meute"] = Color3.fromRGB(30, 30, 30)
}
local u9 = {
    "Civil",
    "Corps d\'Entra\195\174nement",
    "Bataillon d\'Exploration",
    "Garnison",
    "Brigade Sp\195\169ciale",
    "Gouvernement",
    "R\195\169volutionnaire",
    "La Meute",
    "Instructeur",
    "Staff"
}
pcall(function() --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
end)
task.spawn(function() --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    for _ = 1, 10 do
        task.wait(1)
        pcall(function() --[[ Line: 58 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            u4:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
        end)
    end
end)
local u10 = false
local u11 = nil
local function u25() --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u1
    --]]
    local v12 = {}
    for _, v13 in ipairs(u9) do
        v12[v13] = {}
    end
    for _, v14 in pairs(u1:GetPlayers()) do
        local v15 = v14.Character
        if not v15 then
            ::l7::
            local v16 = v14.Team
            v18 = not v16 and "Civil" or v16.Name
            goto l15
        end
        local v17 = v15:FindFirstChild("Regiment")
        if not v17 or v17.Value == "" then
            goto l7
        end
        local v18 = v17.Value
        if v18 == "Mod\195\169ration" then
            local v19 = v15:FindFirstChild("Rank")
            v18 = v19 and v19.Value == "Staff" and "Staff" or "Instructeur"
        end
        ::l15::
        local v20 = v14.Character
        local v21
        if v20 then
            local v22 = v20:FindFirstChild("Rank")
            v21 = not v22 and "\226\128\148" or v22.Value
        else
            v21 = "\226\128\148"
        end
        if not v12[v18] then
            v12[v18] = {}
        end
        local v23 = v12[v18]
        local v24 = {
            ["Player"] = v14,
            ["Name"] = v14.Name,
            ["Grade"] = v21
        }
        table.insert(v23, v24)
    end
    return v12
end
local function u35() --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u7
        [4] = u1
    --]]
    if u11 then
        u11:Destroy()
    end
    u11 = Instance.new("ScreenGui")
    u11.Name = "CustomTabGUI"
    u11.ResetOnSpawn = false
    u11.IgnoreGuiInset = true
    u11.DisplayOrder = 200
    u11.Enabled = false
    u11.Parent = u5
    local v26 = Instance.new("Frame", u11)
    v26.Name = "Overlay"
    v26.Size = UDim2.new(1, 0, 1, 0)
    v26.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v26.BackgroundTransparency = 0.6
    v26.BorderSizePixel = 0
    v26.ZIndex = 1
    local v27 = Instance.new("Frame", v26)
    v27.Name = "MainFrame"
    v27.Size = UDim2.new(0, 750, 0, 700)
    v27.Position = UDim2.new(0.5, 0, 0.5, 0)
    v27.AnchorPoint = Vector2.new(0.5, 0.5)
    v27.BackgroundColor3 = u7.MainBg
    v27.BackgroundTransparency = 0.3
    v27.BorderSizePixel = 0
    v27.ZIndex = 2
    v27.ClipsDescendants = true
    Instance.new("UICorner", v27).CornerRadius = UDim.new(0, 12)
    local v28 = Instance.new("UIStroke", v27)
    v28.Color = u7.StrokeColor
    v28.Thickness = 1
    v28.Transparency = 0.5
    local v29 = Instance.new("Frame", v27)
    v29.Size = UDim2.new(1, 0, 0, 70)
    v29.Position = UDim2.new(0, 0, 0, 0)
    v29.BackgroundTransparency = 1
    v29.ZIndex = 3
    local v30 = Instance.new("TextLabel", v29)
    v30.Size = UDim2.new(1, 0, 0, 40)
    v30.Position = UDim2.new(0, 0, 0, 10)
    v30.BackgroundTransparency = 1
    v30.Text = "TAB"
    v30.Font = Enum.Font.Bodoni
    v30.TextSize = 36
    v30.TextColor3 = u7.TitleText
    v30.ZIndex = 4
    local v31 = Instance.new("TextLabel", v29)
    v31.Name = "PlayerCount"
    v31.Size = UDim2.new(1, 0, 0, 20)
    v31.Position = UDim2.new(0, 0, 0, 48)
    v31.BackgroundTransparency = 1
    v31.Text = #u1:GetPlayers() .. " joueurs connect\195\169s"
    v31.Font = Enum.Font.SourceSansItalic
    v31.TextSize = 16
    v31.TextColor3 = u7.SubtitleGray
    v31.ZIndex = 4
    local v32 = Instance.new("Frame", v27)
    v32.Size = UDim2.new(0.94, 0, 0, 1)
    v32.Position = UDim2.new(0.03, 0, 0, 72)
    v32.BackgroundColor3 = u7.StrokeColor
    v32.BackgroundTransparency = 0.5
    v32.BorderSizePixel = 0
    v32.ZIndex = 3
    local v33 = Instance.new("ScrollingFrame", v27)
    v33.Name = "ScrollFrame"
    v33.Size = UDim2.new(0.96, 0, 1, -85)
    v33.Position = UDim2.new(0.02, 0, 0, 80)
    v33.BackgroundTransparency = 1
    v33.BorderSizePixel = 0
    v33.ScrollBarThickness = 4
    v33.ScrollBarImageColor3 = u7.StrokeColor
    v33.ScrollBarImageTransparency = 0.3
    v33.ZIndex = 3
    v33.ClipsDescendants = true
    v33.CanvasSize = UDim2.new(0, 0, 0, 0)
    v33.AutomaticCanvasSize = Enum.AutomaticSize.Y
    local v34 = Instance.new("UIListLayout", v33)
    v34.SortOrder = Enum.SortOrder.LayoutOrder
    v34.Padding = UDim.new(0, 4)
    return u11, v33, v31
end
local function u57(p36, p37) --[[ Line: 229 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u1
        [3] = u9
        [4] = u8
        [5] = u7
    --]]
    for _, v38 in pairs(p36:GetChildren()) do
        if v38:IsA("Frame") then
            v38:Destroy()
        end
    end
    local v39 = u25()
    local v40 = #u1:GetPlayers()
    p37.Text = v40 .. " joueur" .. (v40 > 1 and "s" or "") .. " connect\195\169" .. (v40 > 1 and "s" or "")
    local v41 = 0
    for _, v42 in ipairs(u9) do
        local v43 = v39[v42]
        if v43 and #v43 > 0 then
            v41 = v41 + 1
            local v44 = u8[v42] or u7.SubtitleGray
            local v45 = Instance.new("Frame", p36)
            v45.Name = "Team_" .. v42
            v45.Size = UDim2.new(1, 0, 0, #v43 * 35 + 40)
            v45.BackgroundTransparency = 1
            v45.BorderSizePixel = 0
            v45.ZIndex = 4
            v45.LayoutOrder = v41
            local v46 = Instance.new("Frame", v45)
            v46.Size = UDim2.new(1, 0, 0, 40)
            v46.Position = UDim2.new(0, 0, 0, 0)
            v46.BackgroundTransparency = 1
            v46.BorderSizePixel = 0
            v46.ZIndex = 5
            local v47 = Instance.new("Frame", v46)
            v47.Size = UDim2.new(0, 3, 0, 20)
            v47.Position = UDim2.new(0, 8, 0.5, 0)
            v47.AnchorPoint = Vector2.new(0, 0.5)
            v47.BackgroundColor3 = v44
            v47.BorderSizePixel = 0
            v47.ZIndex = 6
            Instance.new("UICorner", v47).CornerRadius = UDim.new(0, 2)
            local v48 = Instance.new("TextLabel", v46)
            v48.Size = UDim2.new(0.7, -20, 1, 0)
            v48.Position = UDim2.new(0, 20, 0, 0)
            v48.BackgroundTransparency = 1
            v48.Text = v42:upper()
            v48.Font = Enum.Font.Bodoni
            v48.TextSize = 18
            v48.TextColor3 = v44
            v48.TextXAlignment = Enum.TextXAlignment.Left
            v48.ZIndex = 6
            local v49 = Instance.new("TextLabel", v46)
            v49.Size = UDim2.new(0.3, -10, 1, 0)
            v49.Position = UDim2.new(0.7, 0, 0, 0)
            v49.BackgroundTransparency = 1
            v49.Text = #v43 .. " joueur" .. (#v43 > 1 and "s" or "")
            v49.Font = Enum.Font.SourceSansItalic
            v49.TextSize = 14
            v49.TextColor3 = u7.SubtitleGray
            v49.TextXAlignment = Enum.TextXAlignment.Right
            v49.ZIndex = 6
            for v50, v51 in ipairs(v43) do
                local v52 = v50 % 2 == 0 and u7.PlayerRowAlt or u7.PlayerRow
                local v53 = Instance.new("Frame", v45)
                v53.Size = UDim2.new(1, 0, 0, 35)
                v53.Position = UDim2.new(0, 0, 0, 40 + (v50 - 1) * 35)
                v53.BackgroundColor3 = v52
                v53.BackgroundTransparency = 0.3
                v53.BorderSizePixel = 0
                v53.ZIndex = 5
                Instance.new("UICorner", v53).CornerRadius = UDim.new(0, 4)
                local v54 = Instance.new("Frame", v53)
                v54.Size = UDim2.new(0, 6, 0, 6)
                v54.Position = UDim2.new(0, 15, 0.5, 0)
                v54.AnchorPoint = Vector2.new(0, 0.5)
                v54.BackgroundColor3 = v44
                v54.BackgroundTransparency = 0.3
                v54.BorderSizePixel = 0
                v54.ZIndex = 6
                Instance.new("UICorner", v54).CornerRadius = UDim.new(1, 0)
                local v55 = Instance.new("TextLabel", v53)
                v55.Size = UDim2.new(0.55, -30, 1, 0)
                v55.Position = UDim2.new(0, 30, 0, 0)
                v55.BackgroundTransparency = 1
                v55.Text = "@" .. v51.Name
                v55.Font = Enum.Font.Bodoni
                v55.TextSize = 16
                v55.TextColor3 = u7.TitleText
                v55.TextXAlignment = Enum.TextXAlignment.Left
                v55.ZIndex = 6
                local v56 = Instance.new("TextLabel", v53)
                v56.Size = UDim2.new(0.4, -15, 1, 0)
                v56.Position = UDim2.new(0.6, 0, 0, 0)
                v56.BackgroundTransparency = 1
                v56.Text = v51.Grade
                v56.Font = Enum.Font.SourceSansItalic
                v56.TextSize = 15
                v56.TextColor3 = u7.SubtitleGray
                v56.TextXAlignment = Enum.TextXAlignment.Right
                v56.ZIndex = 6
            end
        end
    end
end
local u58 = nil
local u59 = nil
local u60 = nil
local function u65() --[[ Line: 344 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u58
        [3] = u59
        [4] = u60
        [5] = u35
        [6] = u57
        [7] = u3
    --]]
    if not u10 then
        u10 = true
        local v61, v62, v63 = u35()
        u58 = v61
        u59 = v62
        u60 = v63
        u57(u59, u60)
        u58.Enabled = true
        local v64 = u58.Overlay.MainFrame
        v64.Size = UDim2.new(0, 0, 0, 0)
        u3:Create(v64, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            ["Size"] = UDim2.new(0, 750, 0, 700)
        }):Play()
    end
end
local function u68() --[[ Line: 357 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u58
        [3] = u3
    --]]
    if u10 then
        u10 = false
        if u58 then
            local v66 = u58.Overlay
            if v66 then
                v66 = u58.Overlay:FindFirstChild("MainFrame")
            end
            if v66 then
                local v67 = u3:Create(v66, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.new(0, 0, 0, 0)
                })
                v67:Play()
                v67.Completed:Connect(function() --[[ Line: 367 ]]
                    --[[
                    Upvalues:
                        [1] = u58
                    --]]
                    if u58 then
                        u58:Destroy()
                        u58 = nil
                    end
                end)
                return
            end
            u58:Destroy()
            u58 = nil
        end
    end
end
v2.InputBegan:Connect(function(p69, p70) --[[ Line: 380 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u65
    --]]
    if not p70 then
        if p69.KeyCode == u6 then
            u65()
        end
    end
end)
v2.InputEnded:Connect(function(p71, _) --[[ Line: 387 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u68
    --]]
    if p71.KeyCode == u6 then
        u68()
    end
end)
task.spawn(function() --[[ Line: 393 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u59
        [3] = u60
        [4] = u57
    --]]
    while true do
        repeat
            task.wait(2)
        until u10 and (u59 and u60)
        u57(u59, u60)
    end
end)