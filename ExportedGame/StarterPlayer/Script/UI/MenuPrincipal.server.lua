-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local u2 = game:GetService("UserInputService")
local u3 = game:GetService("TweenService")
local u4 = game:GetService("Lighting")
local u5 = game:GetService("RunService")
local u6 = v1.LocalPlayer
local u7 = u6:WaitForChild("PlayerGui")
local u8 = Enum.KeyCode.K
local u9 = tick()
local u10 = "Profil"
local u11 = 0
local u12 = nil
local u13 = nil
task.spawn(function() --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u11
        [4] = u9
    --]]
    u12 = game:GetService("ReplicatedStorage"):WaitForChild("GetPlayerData", 10)
    u13 = game:GetService("ReplicatedStorage"):WaitForChild("UpdatePlayTime", 10)
    local v14 = u12 and u12:InvokeServer()
    if v14 then
        u11 = v14.TotalPlayTime or 0
        u9 = v14.SessionStartTime or tick()
    end
end)
local u15 = {
    ["TitleText"] = Color3.fromRGB(220, 220, 225),
    ["SubtitleGray"] = Color3.fromRGB(140, 140, 145),
    ["MainBg"] = Color3.fromRGB(18, 18, 20),
    ["SectionBg"] = Color3.fromRGB(16, 16, 20),
    ["InputBg"] = Color3.fromRGB(20, 20, 25),
    ["ButtonBg"] = Color3.fromRGB(25, 25, 30),
    ["StrokeColor"] = Color3.fromRGB(140, 140, 145),
    ["DarkBg"] = Color3.fromRGB(8, 8, 10),
    ["ActiveTab"] = Color3.fromRGB(30, 30, 35)
}
local function u18(p16) --[[ Line: 174 ]]
    for _, v17 in pairs(p16:GetChildren()) do
        if not v17:IsA("UICorner") then
            v17:Destroy()
        end
    end
end
local function u25(p19) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u15
        [3] = u6
    --]]
    u18(p19)
    local v20 = Instance.new("TextLabel", p19)
    v20.Size = UDim2.new(1, 0, 0, 50)
    v20.Position = UDim2.new(0, 0, 0, 20)
    v20.BackgroundTransparency = 1
    v20.Text = "PROFIL DU JOUEUR"
    v20.Font = Enum.Font.Bodoni
    v20.TextSize = 28
    v20.TextColor3 = u15.TitleText
    v20.ZIndex = 4
    local v21 = Instance.new("TextLabel", p19)
    v21.Size = UDim2.new(0.9, 0, 0, 40)
    v21.Position = UDim2.new(0.05, 0, 0, 90)
    v21.BackgroundTransparency = 1
    v21.Text = "Nom: " .. u6.Name
    v21.Font = Enum.Font.Bodoni
    v21.TextSize = 22
    v21.TextColor3 = u15.SubtitleGray
    v21.TextXAlignment = Enum.TextXAlignment.Left
    v21.ZIndex = 4
    local v22 = Instance.new("TextLabel", p19)
    v22.Size = UDim2.new(0.9, 0, 0, 40)
    v22.Position = UDim2.new(0.05, 0, 0, 140)
    v22.BackgroundTransparency = 1
    v22.Text = "Pseudo: " .. u6.DisplayName
    v22.Font = Enum.Font.Bodoni
    v22.TextSize = 22
    v22.TextColor3 = u15.SubtitleGray
    v22.TextXAlignment = Enum.TextXAlignment.Left
    v22.ZIndex = 4
    local v23 = Instance.new("TextLabel", p19)
    v23.Size = UDim2.new(0.9, 0, 0, 40)
    v23.Position = UDim2.new(0.05, 0, 0, 190)
    v23.BackgroundTransparency = 1
    v23.Text = "ID: " .. u6.UserId
    v23.Font = Enum.Font.Bodoni
    v23.TextSize = 22
    v23.TextColor3 = u15.SubtitleGray
    v23.TextXAlignment = Enum.TextXAlignment.Left
    v23.ZIndex = 4
    local v24 = Instance.new("TextLabel", p19)
    v24.Name = "PlayTime"
    v24.Size = UDim2.new(0.9, 0, 0, 40)
    v24.Position = UDim2.new(0.05, 0, 0, 240)
    v24.BackgroundTransparency = 1
    v24.Text = "Temps de jeu: 00h 00m 00s"
    v24.Font = Enum.Font.Bodoni
    v24.TextSize = 22
    v24.TextColor3 = u15.SubtitleGray
    v24.TextXAlignment = Enum.TextXAlignment.Left
    v24.ZIndex = 4
end
local function u29(p26) --[[ Line: 241 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u15
    --]]
    u18(p26)
    local v27 = Instance.new("TextLabel", p26)
    v27.Size = UDim2.new(1, 0, 0, 50)
    v27.Position = UDim2.new(0, 0, 0, 20)
    v27.BackgroundTransparency = 1
    v27.Text = "PARAM\195\136TRES G\195\137N\195\137RAUX"
    v27.Font = Enum.Font.Bodoni
    v27.TextSize = 28
    v27.TextColor3 = u15.TitleText
    v27.ZIndex = 4
    local v28 = Instance.new("TextLabel", p26)
    v28.Size = UDim2.new(0.9, 0, 0, 100)
    v28.Position = UDim2.new(0.05, 0, 0, 90)
    v28.BackgroundTransparency = 1
    v28.Text = "Utilisez les autres onglets pour configurer les param\195\168tres sp\195\169cifiques du jeu."
    v28.Font = Enum.Font.Bodoni
    v28.TextSize = 18
    v28.TextColor3 = u15.SubtitleGray
    v28.TextWrapped = true
    v28.TextXAlignment = Enum.TextXAlignment.Left
    v28.TextYAlignment = Enum.TextYAlignment.Top
    v28.ZIndex = 4
end
local function u56(p30) --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u15
        [3] = u4
        [4] = u5
        [5] = u2
    --]]
    u18(p30)
    local v31 = Instance.new("TextLabel", p30)
    v31.Size = UDim2.new(1, 0, 0, 50)
    v31.Position = UDim2.new(0, 0, 0, 20)
    v31.BackgroundTransparency = 1
    v31.Text = "PARAM\195\136TRES GRAPHIQUES"
    v31.Font = Enum.Font.Bodoni
    v31.TextSize = 28
    v31.TextColor3 = u15.TitleText
    v31.ZIndex = 4
    local v32 = 90
    local v33 = Instance.new("TextLabel", p30)
    v33.Size = UDim2.new(0.9, 0, 0, 30)
    v33.Position = UDim2.new(0.05, 0, 0, v32)
    v33.BackgroundTransparency = 1
    v33.Text = "Luminosit\195\169"
    v33.Font = Enum.Font.Bodoni
    v33.TextSize = 20
    v33.TextColor3 = u15.SubtitleGray
    v33.TextXAlignment = Enum.TextXAlignment.Left
    v33.ZIndex = 4
    local u34 = Instance.new("Frame", p30)
    u34.Size = UDim2.new(0.9, 0, 0, 40)
    u34.Position = UDim2.new(0.05, 0, 0, v32 + 35)
    u34.BackgroundColor3 = u15.InputBg
    u34.BorderSizePixel = 0
    u34.ZIndex = 4
    Instance.new("UICorner", u34).CornerRadius = UDim.new(0, 8)
    local u35 = Instance.new("Frame", u34)
    u35.Name = "BrightnessBar"
    u35.Size = UDim2.new(1, 0, 1, 0)
    u35.BackgroundColor3 = u15.ButtonBg
    u35.BorderSizePixel = 0
    u35.ZIndex = 5
    Instance.new("UICorner", u35).CornerRadius = UDim.new(0, 8)
    local v36 = v32 + 100
    local v37 = Instance.new("TextLabel", p30)
    v37.Size = UDim2.new(0.9, 0, 0, 30)
    v37.Position = UDim2.new(0.05, 0, 0, v36)
    v37.BackgroundTransparency = 1
    v37.Text = "Qualit\195\169 des textures"
    v37.Font = Enum.Font.Bodoni
    v37.TextSize = 20
    v37.TextColor3 = u15.SubtitleGray
    v37.TextXAlignment = Enum.TextXAlignment.Left
    v37.ZIndex = 4
    for v38, u39 in ipairs({ "Basse", "Moyenne", "Haute" }) do
        local v40 = Instance.new("TextButton", p30)
        v40.Name = "Texture" .. u39
        v40.Size = UDim2.new(0.28, 0, 0, 45)
        v40.Position = UDim2.new(0.05 + (v38 - 1) * 0.31, 0, 0, v36 + 35)
        v40.BackgroundColor3 = u15.ButtonBg
        v40.Text = u39
        v40.Font = Enum.Font.Bodoni
        v40.TextSize = 18
        v40.TextColor3 = u15.SubtitleGray
        v40.BorderSizePixel = 0
        v40.AutoButtonColor = true
        v40.ZIndex = 4
        Instance.new("UICorner", v40).CornerRadius = UDim.new(0, 8)
        local v41 = Instance.new("UIStroke", v40)
        v41.Color = u15.StrokeColor
        v41.Thickness = 1
        v41.Transparency = 0.5
        v40.Activated:Connect(function() --[[ Line: 347 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            if u39 == "Basse" then
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
                return
            elseif u39 == "Moyenne" then
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level10
            else
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level21
            end
        end)
    end
    local v42 = v36 + 100
    local v43 = Instance.new("TextLabel", p30)
    v43.Size = UDim2.new(0.9, 0, 0, 30)
    v43.Position = UDim2.new(0.05, 0, 0, v42)
    v43.BackgroundTransparency = 1
    v43.Text = "Ombres"
    v43.Font = Enum.Font.Bodoni
    v43.TextSize = 20
    v43.TextColor3 = u15.SubtitleGray
    v43.TextXAlignment = Enum.TextXAlignment.Left
    v43.ZIndex = 4
    local u44 = Instance.new("TextButton", p30)
    u44.Name = "ShadowToggle"
    u44.Size = UDim2.new(0.4, 0, 0, 45)
    u44.Position = UDim2.new(0.05, 0, 0, v42 + 35)
    u44.BackgroundColor3 = u15.ButtonBg
    u44.Text = "Activ\195\169"
    u44.Font = Enum.Font.Bodoni
    u44.TextSize = 18
    u44.TextColor3 = u15.SubtitleGray
    u44.BorderSizePixel = 0
    u44.AutoButtonColor = true
    u44.ZIndex = 4
    Instance.new("UICorner", u44).CornerRadius = UDim.new(0, 8)
    local v45 = Instance.new("UIStroke", u44)
    v45.Color = u15.StrokeColor
    v45.Thickness = 1
    v45.Transparency = 0.5
    local u46 = true
    u44.Activated:Connect(function() --[[ Line: 392 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u44
            [3] = u4
        --]]
        u46 = not u46
        u44.Text = u46 and "Activ\195\169" or "D\195\169sactiv\195\169"
        u4.GlobalShadows = u46
    end)
    local u47 = 1
    local u48 = false
    u34.InputBegan:Connect(function(p49) --[[ Line: 401 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        if p49.UserInputType == Enum.UserInputType.MouseButton1 then
            u48 = true
        end
    end)
    u34.InputEnded:Connect(function(p50) --[[ Line: 407 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        if p50.UserInputType == Enum.UserInputType.MouseButton1 then
            u48 = false
        end
    end)
    u5.RenderStepped:Connect(function() --[[ Line: 413 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u2
            [3] = u34
            [4] = u47
            [5] = u35
            [6] = u4
        --]]
        if u48 then
            local v51 = u2:GetMouseLocation()
            local v52 = u34.AbsolutePosition
            local v53 = u34.AbsoluteSize
            local v54 = v51.X - v52.X
            local v55 = v53.X
            u47 = math.clamp(v54, 0, v55) / v53.X
            u35.Size = UDim2.new(u47, 0, 1, 0)
            u4.Brightness = u47 * 3
        end
    end)
end
local function u60(p57) --[[ Line: 428 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u15
    --]]
    u18(p57)
    local v58 = Instance.new("TextLabel", p57)
    v58.Size = UDim2.new(1, 0, 0, 50)
    v58.Position = UDim2.new(0, 0, 0, 20)
    v58.BackgroundTransparency = 1
    v58.Text = "PARAM\195\136TRES AUDIO"
    v58.Font = Enum.Font.Bodoni
    v58.TextSize = 28
    v58.TextColor3 = u15.TitleText
    v58.ZIndex = 4
    local v59 = Instance.new("TextLabel", p57)
    v59.Size = UDim2.new(0.9, 0, 0, 80)
    v59.Position = UDim2.new(0.05, 0, 0, 90)
    v59.BackgroundTransparency = 1
    v59.Text = "Les param\195\168tres audio sont g\195\169r\195\169s par Roblox. Utilisez le menu Roblox (\195\137chap) pour ajuster le volume."
    v59.Font = Enum.Font.Bodoni
    v59.TextSize = 18
    v59.TextColor3 = u15.SubtitleGray
    v59.TextWrapped = true
    v59.TextXAlignment = Enum.TextXAlignment.Left
    v59.TextYAlignment = Enum.TextYAlignment.Top
    v59.ZIndex = 4
end
local function u67(p61) --[[ Line: 455 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u15
    --]]
    u18(p61)
    local v62 = Instance.new("TextLabel", p61)
    v62.Size = UDim2.new(1, 0, 0, 50)
    v62.Position = UDim2.new(0, 0, 0, 20)
    v62.BackgroundTransparency = 1
    v62.Text = "CONTR\195\148LES"
    v62.Font = Enum.Font.Bodoni
    v62.TextSize = 28
    v62.TextColor3 = u15.TitleText
    v62.ZIndex = 4
    local v63 = 90
    for _, v64 in ipairs({
        { "K", "Ouvrir/Fermer le menu" },
        { "V", "Ouvrir le porte-monnaie" },
        { "U", "Ouvrir le dossier d\'identit\195\169" },
        { "ZQSD", "D\195\169placements" },
        { "Espace", "Sauter" },
        { "Shift", "Courir" }
    }) do
        local v65 = Instance.new("TextLabel", p61)
        v65.Size = UDim2.new(0.3, 0, 0, 35)
        v65.Position = UDim2.new(0.05, 0, 0, v63)
        v65.BackgroundColor3 = u15.InputBg
        v65.Text = v64[1]
        v65.Font = Enum.Font.GothamBold
        v65.TextSize = 18
        v65.TextColor3 = u15.TitleText
        v65.BorderSizePixel = 0
        v65.ZIndex = 4
        Instance.new("UICorner", v65).CornerRadius = UDim.new(0, 6)
        local v66 = Instance.new("TextLabel", p61)
        v66.Size = UDim2.new(0.58, 0, 0, 35)
        v66.Position = UDim2.new(0.37, 0, 0, v63)
        v66.BackgroundTransparency = 1
        v66.Text = v64[2]
        v66.Font = Enum.Font.Bodoni
        v66.TextSize = 18
        v66.TextColor3 = u15.SubtitleGray
        v66.TextXAlignment = Enum.TextXAlignment.Left
        v66.ZIndex = 4
        v63 = v63 + 45
    end
end
local function u72(p68) --[[ Line: 507 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u15
    --]]
    u18(p68)
    local v69 = Instance.new("TextLabel", p68)
    v69.Size = UDim2.new(1, 0, 0, 50)
    v69.Position = UDim2.new(0, 0, 0, 20)
    v69.BackgroundTransparency = 1
    v69.Text = "STATISTIQUES"
    v69.Font = Enum.Font.Bodoni
    v69.TextSize = 28
    v69.TextColor3 = u15.TitleText
    v69.ZIndex = 4
    local v70 = Instance.new("TextLabel", p68)
    v70.Name = "FPS"
    v70.Size = UDim2.new(0.9, 0, 0, 35)
    v70.Position = UDim2.new(0.05, 0, 0, 90)
    v70.BackgroundTransparency = 1
    v70.Text = "FPS: 60"
    v70.Font = Enum.Font.Bodoni
    v70.TextSize = 20
    v70.TextColor3 = u15.SubtitleGray
    v70.TextXAlignment = Enum.TextXAlignment.Left
    v70.ZIndex = 4
    local v71 = Instance.new("TextLabel", p68)
    v71.Name = "Ping"
    v71.Size = UDim2.new(0.9, 0, 0, 35)
    v71.Position = UDim2.new(0.05, 0, 0, 135)
    v71.BackgroundTransparency = 1
    v71.Text = "Ping: 0 ms"
    v71.Font = Enum.Font.Bodoni
    v71.TextSize = 20
    v71.TextColor3 = u15.SubtitleGray
    v71.TextXAlignment = Enum.TextXAlignment.Left
    v71.ZIndex = 4
end
local u88, u89, u90, u91, v92 = (function() --[[ Name: createMainMenu, Line 55 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u15
    --]]
    local v73 = Instance.new("ScreenGui")
    v73.Name = "MainMenuGUI"
    v73.ResetOnSpawn = false
    v73.IgnoreGuiInset = true
    v73.DisplayOrder = 60
    v73.Enabled = false
    v73.Parent = u7
    local v74 = Instance.new("Frame", v73)
    v74.Size = UDim2.new(1, 0, 1, 0)
    v74.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v74.BackgroundTransparency = 0.5
    v74.BorderSizePixel = 0
    v74.ZIndex = 1
    local v75 = Instance.new("Frame", v74)
    v75.Size = UDim2.new(0, 1000, 0, 700)
    v75.Position = UDim2.new(0.5, 0, 0.5, 0)
    v75.AnchorPoint = Vector2.new(0.5, 0.5)
    v75.BackgroundColor3 = u15.MainBg
    v75.BorderSizePixel = 0
    v75.ZIndex = 2
    Instance.new("UICorner", v75).CornerRadius = UDim.new(0, 12)
    local v76 = Instance.new("UIStroke", v75)
    v76.Color = u15.StrokeColor
    v76.Thickness = 2
    v76.Transparency = 0.3
    local v77 = Instance.new("TextLabel", v75)
    v77.Size = UDim2.new(1, 0, 0, 70)
    v77.Position = UDim2.new(0, 0, 0, 15)
    v77.BackgroundTransparency = 1
    v77.Text = "MENU PRINCIPAL"
    v77.Font = Enum.Font.Bodoni
    v77.TextSize = 42
    v77.TextColor3 = u15.TitleText
    v77.TextStrokeTransparency = 1
    v77.ZIndex = 3
    local v78 = Instance.new("Frame", v75)
    v78.Size = UDim2.new(0.95, 0, 0, 2)
    v78.Position = UDim2.new(0.025, 0, 0, 95)
    v78.BackgroundColor3 = u15.StrokeColor
    v78.BorderSizePixel = 0
    v78.ZIndex = 3
    local v79 = Instance.new("Frame", v75)
    v79.Size = UDim2.new(0.25, 0, 0, 570)
    v79.Position = UDim2.new(0.025, 0, 0, 110)
    v79.BackgroundColor3 = u15.SectionBg
    v79.BorderSizePixel = 0
    v79.ZIndex = 3
    Instance.new("UICorner", v79).CornerRadius = UDim.new(0, 10)
    local v80 = {}
    for v81, v82 in ipairs({
        "Profil",
        "Param\195\168tres",
        "Graphismes",
        "Audio",
        "Contr\195\180les",
        "Statistiques"
    }) do
        local v83 = Instance.new("TextButton", v79)
        v83.Name = v82
        v83.Size = UDim2.new(0.9, 0, 0, 60)
        v83.Position = UDim2.new(0.05, 0, 0, (v81 - 1) * 70 + 15)
        v83.BackgroundColor3 = u15.ButtonBg
        v83.Text = v82
        v83.Font = Enum.Font.Bodoni
        v83.TextSize = 20
        v83.TextColor3 = u15.SubtitleGray
        v83.BorderSizePixel = 0
        v83.AutoButtonColor = false
        v83.ZIndex = 4
        Instance.new("UICorner", v83).CornerRadius = UDim.new(0, 8)
        local v84 = Instance.new("UIStroke", v83)
        v84.Color = u15.StrokeColor
        v84.Thickness = 1
        v84.Transparency = 0.5
        v80[v82] = {
            ["button"] = v83,
            ["stroke"] = v84
        }
    end
    local v85 = Instance.new("Frame", v75)
    v85.Name = "ContentArea"
    v85.Size = UDim2.new(0.68, 0, 0, 570)
    v85.Position = UDim2.new(0.3, 0, 0, 110)
    v85.BackgroundColor3 = u15.SectionBg
    v85.BorderSizePixel = 0
    v85.ZIndex = 3
    Instance.new("UICorner", v85).CornerRadius = UDim.new(0, 10)
    local v86 = Instance.new("TextButton", v75)
    v86.Name = "CloseButton"
    v86.Size = UDim2.new(0, 40, 0, 40)
    v86.Position = UDim2.new(1, -50, 0, 10)
    v86.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v86.BackgroundTransparency = 0.3
    v86.Text = "\226\156\149"
    v86.Font = Enum.Font.GothamBold
    v86.TextSize = 24
    v86.TextColor3 = Color3.fromRGB(255, 255, 255)
    v86.BorderSizePixel = 0
    v86.AutoButtonColor = true
    v86.ZIndex = 3
    Instance.new("UICorner", v86).CornerRadius = UDim.new(0, 4)
    local v87 = Instance.new("UIStroke", v86)
    v87.Color = Color3.fromRGB(80, 80, 80)
    v87.Thickness = 1
    v87.Transparency = 0
    return v73, v75, v85, v80, v86
end)()
local function u96(p93) --[[ Line: 547 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u91
        [3] = u15
        [4] = u25
        [5] = u90
        [6] = u29
        [7] = u56
        [8] = u60
        [9] = u67
        [10] = u72
    --]]
    u10 = p93
    for v94, v95 in pairs(u91) do
        if v94 == p93 then
            v95.button.BackgroundColor3 = u15.ActiveTab
            v95.button.TextColor3 = u15.TitleText
        else
            v95.button.BackgroundColor3 = u15.ButtonBg
            v95.button.TextColor3 = u15.SubtitleGray
        end
    end
    if p93 == "Profil" then
        u25(u90)
        return
    elseif p93 == "Param\195\168tres" then
        u29(u90)
        return
    elseif p93 == "Graphismes" then
        u56(u90)
        return
    elseif p93 == "Audio" then
        u60(u90)
        return
    elseif p93 == "Contr\195\180les" then
        u67(u90)
    elseif p93 == "Statistiques" then
        u72(u90)
    end
end
local u97 = u11
local u98 = u12
local u99 = u13
local u100 = u10
local u101 = u9
for u102, v103 in pairs(u91) do
    v103.button.Activated:Connect(function() --[[ Line: 576 ]]
        --[[
        Upvalues:
            [1] = u96
            [2] = u102
        --]]
        u96(u102)
    end)
end
u96("Profil")
local u104 = false
local u105 = false
local function u109() --[[ Line: 586 ]]
    --[[
    Upvalues:
        [1] = u105
        [2] = u104
        [3] = u88
        [4] = u98
        [5] = u97
        [6] = u101
        [7] = u89
        [8] = u3
    --]]
    if u105 then
        return
    else
        u104 = not u104
        if u104 then
            u88.Enabled = true
            u105 = true
            if u98 then
                task.spawn(function() --[[ Line: 596 ]]
                    --[[
                    Upvalues:
                        [1] = u98
                        [2] = u97
                        [3] = u101
                    --]]
                    local v106 = u98:InvokeServer()
                    if v106 then
                        u97 = v106.TotalPlayTime or 0
                        u101 = v106.SessionStartTime or tick()
                    end
                end)
            end
            u89.Size = UDim2.new(0, 0, 0, 0)
            local v107 = u3:Create(u89, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                ["Size"] = UDim2.new(0, 1000, 0, 700)
            })
            v107:Play()
            v107.Completed:Connect(function() --[[ Line: 610 ]]
                --[[
                Upvalues:
                    [1] = u105
                --]]
                u105 = false
            end)
        else
            u105 = true
            local v108 = u3:Create(u89, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ["Size"] = UDim2.new(0, 0, 0, 0)
            })
            v108:Play()
            v108.Completed:Connect(function() --[[ Line: 619 ]]
                --[[
                Upvalues:
                    [1] = u88
                    [2] = u105
                --]]
                u88.Enabled = false
                u105 = false
            end)
        end
    end
end
u2.InputBegan:Connect(function(p110, p111) --[[ Line: 626 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u109
    --]]
    if not p111 then
        if p110.KeyCode == u8 then
            local u112 = false
            if _G.IsInventoryOpen then
                pcall(function() --[[ Line: 631 ]]
                    --[[
                    Upvalues:
                        [1] = u112
                    --]]
                    u112 = _G.IsInventoryOpen()
                end)
            end
            if u112 then
                return
            end
            u109()
        end
    end
end)
v92.Activated:Connect(function() --[[ Line: 642 ]]
    --[[
    Upvalues:
        [1] = u109
    --]]
    u109()
end)
task.spawn(function() --[[ Line: 646 ]]
    --[[
    Upvalues:
        [1] = u104
        [2] = u100
        [3] = u90
        [4] = u101
        [5] = u97
    --]]
    while true do
        repeat
            task.wait(1)
            local v113 = u104 and (u100 == "Profil" and u90:FindFirstChild("PlayTime"))
        until v113
        local v114 = u97 + (tick() - u101)
        local v115 = v114 / 3600
        local v116 = math.floor(v115)
        local v117 = v114 % 3600 / 60
        local v118 = math.floor(v117)
        local v119 = v114 % 60
        local v120 = math.floor(v119)
        v113.Text = "Temps de jeu: " .. string.format("%02dh %02dm %02ds", v116, v118, v120)
    end
end)
task.spawn(function() --[[ Line: 660 ]]
    --[[
    Upvalues:
        [1] = u99
    --]]
    while true do
        repeat
            task.wait(60)
        until u99
        u99:FireServer()
    end
end)
task.spawn(function() --[[ Line: 669 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u104
        [3] = u100
        [4] = u90
        [5] = u6
    --]]
    local v121 = tick()
    local u122 = 0
    u5.RenderStepped:Connect(function() --[[ Line: 673 ]]
        --[[
        Upvalues:
            [1] = u122
        --]]
        u122 = u122 + 1
    end)
    local v123 = u122
    while true do
        task.wait(1)
        local v124
        if u104 and u100 == "Statistiques" then
            local v125 = u90:FindFirstChild("FPS")
            local v126 = u90:FindFirstChild("Ping")
            if v125 then
                v124 = tick()
                local v127 = v123 / (v124 - v121)
                v125.Text = "FPS: " .. math.floor(v127)
                u122 = 0
                v123 = u122
            else
                v124 = v121
            end
            if v126 then
                local v128 = u6:GetNetworkPing() * 1000
                v126.Text = "Ping: " .. math.floor(v128) .. " ms"
            end
        else
            v124 = v121
        end
        v121 = v124
    end
end)