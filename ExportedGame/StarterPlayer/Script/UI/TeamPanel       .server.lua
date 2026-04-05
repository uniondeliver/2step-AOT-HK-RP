-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v3 = game:GetService("UserInputService")
local u4 = game:GetService("TweenService")
local u5 = v1.LocalPlayer
local u6 = u5:WaitForChild("PlayerGui")
local u7 = Enum.KeyCode.N
local u8 = v2:WaitForChild("RequestTeamPanel")
local u9 = v2:WaitForChild("GetTeamPanelData")
local u10 = v2:WaitForChild("AssignTeam")
local v11 = v2:WaitForChild("TeamNotification")
local u12 = {
    ["TitleText"] = Color3.fromRGB(220, 220, 225),
    ["SubtitleGray"] = Color3.fromRGB(140, 140, 145),
    ["MainBg"] = Color3.fromRGB(18, 18, 20),
    ["SectionBg"] = Color3.fromRGB(16, 16, 20),
    ["InputBg"] = Color3.fromRGB(20, 20, 25),
    ["ButtonBg"] = Color3.fromRGB(25, 25, 30),
    ["StrokeColor"] = Color3.fromRGB(140, 140, 145),
    ["ActiveTab"] = Color3.fromRGB(30, 30, 35),
    ["SuccessGreen"] = Color3.fromRGB(30, 80, 30),
    ["WarningOrange"] = Color3.fromRGB(80, 60, 20),
    ["SelectedBorder"] = Color3.fromRGB(180, 180, 190),
    ["RevRed"] = Color3.fromRGB(180, 30, 30),
    ["CooldownGray"] = Color3.fromRGB(60, 60, 65)
}
local u13 = false
local u14 = false
local u15 = nil
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local u20 = nil
local u21 = u6:FindFirstChild("TeamNotificationGUI")
if not u21 then
    u21 = Instance.new("ScreenGui")
    u21.Name = "TeamNotificationGUI"
    u21.ResetOnSpawn = false
    u21.IgnoreGuiInset = true
    u21.DisplayOrder = 100
    u21.Parent = u6
end
local function u35(p22, p23) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u12
        [3] = u4
    --]]
    for _, v24 in pairs(u21:GetChildren()) do
        if v24:IsA("Frame") then
            v24:Destroy()
        end
    end
    local v25, v26, v27
    if p22 == "success" then
        v25 = Color3.fromRGB(50, 180, 80)
        v26 = "OK"
        v27 = "SUCCES"
    elseif p22 == "assigned" then
        v25 = Color3.fromRGB(180, 160, 80)
        v26 = ">>"
        v27 = "ASSIGNATION RECUE"
    elseif p22 == "error" then
        v25 = Color3.fromRGB(180, 50, 50)
        v26 = "X"
        v27 = "ERREUR"
    else
        v25 = u12.StrokeColor
        v26 = "i"
        v27 = "INFORMATION"
    end
    local u28 = Instance.new("Frame", u21)
    u28.Size = UDim2.new(0, 500, 0, 0)
    u28.Position = UDim2.new(0.5, 0, 0, 20)
    u28.AnchorPoint = Vector2.new(0.5, 0)
    u28.BackgroundColor3 = u12.MainBg
    u28.BorderSizePixel = 0
    u28.ClipsDescendants = true
    u28.ZIndex = 100
    Instance.new("UICorner", u28).CornerRadius = UDim.new(0, 10)
    local v29 = Instance.new("UIStroke", u28)
    v29.Color = v25
    v29.Thickness = 2
    v29.Transparency = 0.2
    local v30 = Instance.new("Frame", u28)
    v30.Size = UDim2.new(0, 4, 1, 0)
    v30.Position = UDim2.new(0, 0, 0, 0)
    v30.BackgroundColor3 = v25
    v30.BorderSizePixel = 0
    v30.ZIndex = 101
    local v31 = Instance.new("TextLabel", u28)
    v31.Size = UDim2.new(0, 50, 0, 50)
    v31.Position = UDim2.new(0, 15, 0, 15)
    v31.BackgroundTransparency = 1
    v31.Text = v26
    v31.Font = Enum.Font.GothamBold
    v31.TextSize = 28
    v31.TextColor3 = v25
    v31.ZIndex = 101
    local v32 = Instance.new("TextLabel", u28)
    v32.Size = UDim2.new(1, -80, 0, 30)
    v32.Position = UDim2.new(0, 70, 0, 12)
    v32.BackgroundTransparency = 1
    v32.Text = v27
    v32.Font = Enum.Font.Bodoni
    v32.TextSize = 22
    v32.TextColor3 = u12.TitleText
    v32.TextXAlignment = Enum.TextXAlignment.Left
    v32.ZIndex = 101
    local v33 = Instance.new("TextLabel", u28)
    v33.Size = UDim2.new(1, -80, 0, 80)
    v33.Position = UDim2.new(0, 70, 0, 40)
    v33.BackgroundTransparency = 1
    v33.Text = p23
    v33.Font = Enum.Font.SourceSans
    v33.TextSize = 16
    v33.TextColor3 = u12.SubtitleGray
    v33.TextXAlignment = Enum.TextXAlignment.Left
    v33.TextYAlignment = Enum.TextYAlignment.Top
    v33.TextWrapped = true
    v33.ZIndex = 101
    u4:Create(u28, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.new(0, 500, 0, 130)
    }):Play()
    task.delay(5, function() --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u4
        --]]
        if u28 and u28.Parent then
            local v34 = u4:Create(u28, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ["Size"] = UDim2.new(0, 500, 0, 0),
                ["Position"] = UDim2.new(0.5, 0, 0, -10)
            })
            v34:Play()
            v34.Completed:Connect(function() --[[ Line: 125 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                if u28 then
                    u28:Destroy()
                end
            end)
        end
    end)
end
v11.OnClientEvent:Connect(function(p36, p37) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    u35(p36, p37)
end)
local function u51(p38) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u5
    --]]
    if u18 and u18.AvailableTeams then
        if p38 then
            local v39 = p38.Regiment
            local v40 = p38.Rank
            local v41 = u18.AvailableTeams
            local v42 = {}
            if u18.Role == "Staff" then
                for v43, v44 in pairs(v41) do
                    v42[v43] = v44
                end
                return v42
            elseif u18.Role == "RevolutionaryHolder" then
                if p38.Name == u5.Name then
                    for v45, v46 in pairs(v41) do
                        v42[v45] = v46
                    end
                end
                return v42
            elseif u18.Role == "Instructeur" then
                if v39 == "Civil" then
                    if v41["Corps d\'Entra\195\174nement"] then
                        v42["Corps d\'Entra\195\174nement"] = v41["Corps d\'Entra\195\174nement"]
                    end
                elseif v39 == "Corps d\'Entra\195\174nement" then
                    if v41["Corps d\'Entra\195\174nement"] then
                        v42["Corps d\'Entra\195\174nement"] = v41["Corps d\'Entra\195\174nement"]
                    end
                    if v40 == "Cadet Phase 4" then
                        for v47, v48 in pairs(v41) do
                            if v47 ~= "Corps d\'Entra\195\174nement" and v47 ~= "R\195\169volutionnaire" then
                                v42[v47] = v48
                            end
                        end
                    end
                end
                if p38.Name == u5.Name and v41["R\195\169volutionnaire"] then
                    v42["R\195\169volutionnaire"] = v41["R\195\169volutionnaire"]
                end
                return v42
            else
                if u18.Role ~= "DivisionOfficer" then
                    return v42
                end
                for v49, v50 in pairs(v41) do
                    if v49 == "R\195\169volutionnaire" then
                        if p38.Name == u5.Name then
                            v42[v49] = v50
                        end
                    elseif v39 == v49 or (v39 == "Civil" or v39 == "Corps d\'Entra\195\174nement") then
                        v42[v49] = v50
                    end
                end
                return v42
            end
        else
            return u18.AvailableTeams
        end
    else
        return {}
    end
end
local function u158() --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u6
        [3] = u20
        [4] = u12
        [5] = u4
        [6] = u15
        [7] = u16
        [8] = u17
        [9] = u18
        [10] = u5
        [11] = u51
        [12] = u35
        [13] = u10
        [14] = u9
    --]]
    if u19 then
        u19:Destroy()
    end
    u19 = Instance.new("ScreenGui")
    u19.Name = "TeamPanelGUI"
    u19.ResetOnSpawn = false
    u19.IgnoreGuiInset = true
    u19.DisplayOrder = 60
    u19.Enabled = false
    u19.Parent = u6
    local v52 = Instance.new("Frame", u19)
    v52.Name = "Overlay"
    v52.Size = UDim2.new(1, 0, 1, 0)
    v52.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v52.BackgroundTransparency = 0.5
    v52.BorderSizePixel = 0
    v52.ZIndex = 1
    u20 = Instance.new("Frame", v52)
    u20.Name = "MainFrame"
    u20.Size = UDim2.new(0, 800, 0, 750)
    u20.Position = UDim2.new(0.5, 0, 0.5, 0)
    u20.AnchorPoint = Vector2.new(0.5, 0.5)
    u20.BackgroundColor3 = u12.MainBg
    u20.BorderSizePixel = 0
    u20.ZIndex = 2
    u20.ClipsDescendants = true
    Instance.new("UICorner", u20).CornerRadius = UDim.new(0, 12)
    local v53 = Instance.new("UIStroke", u20)
    v53.Color = u12.StrokeColor
    v53.Thickness = 2
    v53.Transparency = 0.3
    local v54 = Instance.new("TextLabel", u20)
    v54.Size = UDim2.new(1, 0, 0, 70)
    v54.Position = UDim2.new(0, 0, 0, 15)
    v54.BackgroundTransparency = 1
    v54.Text = "TEAM PANEL"
    v54.Font = Enum.Font.Bodoni
    v54.TextSize = 46
    v54.TextColor3 = u12.TitleText
    v54.ZIndex = 3
    local v55 = Instance.new("TextLabel", u20)
    v55.Size = UDim2.new(1, 0, 0, 25)
    v55.Position = UDim2.new(0, 0, 0, 85)
    v55.BackgroundTransparency = 1
    v55.Text = "Attribution des equipes et grades"
    v55.Font = Enum.Font.SourceSansItalic
    v55.TextSize = 20
    v55.TextColor3 = u12.SubtitleGray
    v55.ZIndex = 3
    local v56 = Instance.new("Frame", u20)
    v56.Size = UDim2.new(0.92, 0, 0, 2)
    v56.Position = UDim2.new(0.04, 0, 0, 120)
    v56.BackgroundColor3 = u12.StrokeColor
    v56.BackgroundTransparency = 0.5
    v56.BorderSizePixel = 0
    v56.ZIndex = 3
    local v57 = Instance.new("TextButton", u20)
    v57.Size = UDim2.new(0, 40, 0, 40)
    v57.Position = UDim2.new(1, -50, 0, 10)
    v57.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v57.BackgroundTransparency = 0.3
    v57.Text = "X"
    v57.Font = Enum.Font.GothamBold
    v57.TextSize = 24
    v57.TextColor3 = Color3.fromRGB(255, 255, 255)
    v57.BorderSizePixel = 0
    v57.AutoButtonColor = true
    v57.ZIndex = 5
    Instance.new("UICorner", v57).CornerRadius = UDim.new(0, 4)
    local v58 = Instance.new("UIStroke", v57)
    v58.Color = Color3.fromRGB(80, 80, 80)
    v58.Thickness = 1
    local v59 = Instance.new("Frame", u20)
    v59.Size = UDim2.new(0.92, 0, 0, 110)
    v59.Position = UDim2.new(0.04, 0, 0, 135)
    v59.BackgroundColor3 = u12.SectionBg
    v59.BorderSizePixel = 0
    v59.ZIndex = 3
    Instance.new("UICorner", v59).CornerRadius = UDim.new(0, 10)
    local v60 = Instance.new("TextLabel", v59)
    v60.Size = UDim2.new(1, 0, 0, 30)
    v60.Position = UDim2.new(0, 0, 0, 8)
    v60.BackgroundTransparency = 1
    v60.Text = "1. SELECTIONNER UN JOUEUR"
    v60.Font = Enum.Font.Bodoni
    v60.TextSize = 20
    v60.TextColor3 = u12.TitleText
    v60.ZIndex = 4
    local u61 = Instance.new("TextButton", v59)
    u61.Name = "PlayerSelectBtn"
    u61.Size = UDim2.new(0.92, 0, 0, 50)
    u61.Position = UDim2.new(0.04, 0, 0, 45)
    u61.BackgroundColor3 = u12.InputBg
    u61.Text = "  Selectionner un joueur"
    u61.Font = Enum.Font.Bodoni
    u61.TextSize = 18
    u61.TextColor3 = u12.SubtitleGray
    u61.TextXAlignment = Enum.TextXAlignment.Left
    u61.BorderSizePixel = 0
    u61.AutoButtonColor = false
    u61.ZIndex = 4
    Instance.new("UICorner", u61).CornerRadius = UDim.new(0, 8)
    local v62 = Instance.new("UIStroke", u61)
    v62.Color = u12.StrokeColor
    v62.Thickness = 1
    v62.Transparency = 0.5
    local v63 = Instance.new("TextLabel", u61)
    v63.Size = UDim2.new(0, 30, 1, 0)
    v63.Position = UDim2.new(1, -35, 0, 0)
    v63.BackgroundTransparency = 1
    v63.Text = "v"
    v63.Font = Enum.Font.GothamBold
    v63.TextSize = 14
    v63.TextColor3 = u12.SubtitleGray
    v63.ZIndex = 5
    local u64 = Instance.new("ScrollingFrame", v59)
    u64.Name = "PlayerDropdown"
    u64.Size = UDim2.new(0.92, 0, 0, 0)
    u64.Position = UDim2.new(0.04, 0, 0, 97)
    u64.BackgroundColor3 = u12.InputBg
    u64.BorderSizePixel = 0
    u64.ScrollBarThickness = 5
    u64.ScrollBarImageColor3 = u12.StrokeColor
    u64.Visible = false
    u64.ZIndex = 20
    u64.ClipsDescendants = true
    Instance.new("UICorner", u64).CornerRadius = UDim.new(0, 8)
    local v65 = Instance.new("UIStroke", u64)
    v65.Color = u12.StrokeColor
    v65.Thickness = 1
    v65.Transparency = 0.5
    Instance.new("UIListLayout", u64).SortOrder = Enum.SortOrder.Name
    local v66 = Instance.new("Frame", u20)
    v66.Size = UDim2.new(0.92, 0, 0, 110)
    v66.Position = UDim2.new(0.04, 0, 0, 260)
    v66.BackgroundColor3 = u12.SectionBg
    v66.BorderSizePixel = 0
    v66.ZIndex = 3
    Instance.new("UICorner", v66).CornerRadius = UDim.new(0, 10)
    local v67 = Instance.new("TextLabel", v66)
    v67.Size = UDim2.new(1, 0, 0, 30)
    v67.Position = UDim2.new(0, 0, 0, 8)
    v67.BackgroundTransparency = 1
    v67.Text = "2. SELECTIONNER UNE TEAM"
    v67.Font = Enum.Font.Bodoni
    v67.TextSize = 20
    v67.TextColor3 = u12.TitleText
    v67.ZIndex = 4
    local u68 = Instance.new("TextButton", v66)
    u68.Name = "TeamSelectBtn"
    u68.Size = UDim2.new(0.92, 0, 0, 50)
    u68.Position = UDim2.new(0.04, 0, 0, 45)
    u68.BackgroundColor3 = u12.InputBg
    u68.Text = "  Selectionner une team"
    u68.Font = Enum.Font.Bodoni
    u68.TextSize = 18
    u68.TextColor3 = u12.SubtitleGray
    u68.TextXAlignment = Enum.TextXAlignment.Left
    u68.BorderSizePixel = 0
    u68.AutoButtonColor = false
    u68.ZIndex = 4
    Instance.new("UICorner", u68).CornerRadius = UDim.new(0, 8)
    local v69 = Instance.new("UIStroke", u68)
    v69.Color = u12.StrokeColor
    v69.Thickness = 1
    v69.Transparency = 0.5
    local v70 = Instance.new("TextLabel", u68)
    v70.Size = UDim2.new(0, 30, 1, 0)
    v70.Position = UDim2.new(1, -35, 0, 0)
    v70.BackgroundTransparency = 1
    v70.Text = "v"
    v70.Font = Enum.Font.GothamBold
    v70.TextSize = 14
    v70.TextColor3 = u12.SubtitleGray
    v70.ZIndex = 5
    local u71 = Instance.new("ScrollingFrame", v66)
    u71.Name = "TeamDropdown"
    u71.Size = UDim2.new(0.92, 0, 0, 0)
    u71.Position = UDim2.new(0.04, 0, 0, 97)
    u71.BackgroundColor3 = u12.InputBg
    u71.BorderSizePixel = 0
    u71.ScrollBarThickness = 5
    u71.ScrollBarImageColor3 = u12.StrokeColor
    u71.Visible = false
    u71.ZIndex = 18
    u71.ClipsDescendants = true
    Instance.new("UICorner", u71).CornerRadius = UDim.new(0, 8)
    local v72 = Instance.new("UIStroke", u71)
    v72.Color = u12.StrokeColor
    v72.Thickness = 1
    v72.Transparency = 0.5
    Instance.new("UIListLayout", u71).SortOrder = Enum.SortOrder.Name
    local v73 = Instance.new("Frame", u20)
    v73.Size = UDim2.new(0.92, 0, 0, 110)
    v73.Position = UDim2.new(0.04, 0, 0, 385)
    v73.BackgroundColor3 = u12.SectionBg
    v73.BorderSizePixel = 0
    v73.ZIndex = 3
    Instance.new("UICorner", v73).CornerRadius = UDim.new(0, 10)
    local v74 = Instance.new("TextLabel", v73)
    v74.Size = UDim2.new(1, 0, 0, 30)
    v74.Position = UDim2.new(0, 0, 0, 8)
    v74.BackgroundTransparency = 1
    v74.Text = "3. SELECTIONNER UN GRADE"
    v74.Font = Enum.Font.Bodoni
    v74.TextSize = 20
    v74.TextColor3 = u12.TitleText
    v74.ZIndex = 4
    local u75 = Instance.new("TextButton", v73)
    u75.Name = "GradeSelectBtn"
    u75.Size = UDim2.new(0.92, 0, 0, 50)
    u75.Position = UDim2.new(0.04, 0, 0, 45)
    u75.BackgroundColor3 = u12.InputBg
    u75.Text = "  Selectionner un grade"
    u75.Font = Enum.Font.Bodoni
    u75.TextSize = 18
    u75.TextColor3 = u12.SubtitleGray
    u75.TextXAlignment = Enum.TextXAlignment.Left
    u75.BorderSizePixel = 0
    u75.AutoButtonColor = false
    u75.ZIndex = 4
    Instance.new("UICorner", u75).CornerRadius = UDim.new(0, 8)
    local v76 = Instance.new("UIStroke", u75)
    v76.Color = u12.StrokeColor
    v76.Thickness = 1
    v76.Transparency = 0.5
    local v77 = Instance.new("TextLabel", u75)
    v77.Size = UDim2.new(0, 30, 1, 0)
    v77.Position = UDim2.new(1, -35, 0, 0)
    v77.BackgroundTransparency = 1
    v77.Text = "v"
    v77.Font = Enum.Font.GothamBold
    v77.TextSize = 14
    v77.TextColor3 = u12.SubtitleGray
    v77.ZIndex = 5
    local u78 = Instance.new("ScrollingFrame", v73)
    u78.Name = "GradeDropdown"
    u78.Size = UDim2.new(0.92, 0, 0, 0)
    u78.Position = UDim2.new(0.04, 0, 0, 97)
    u78.BackgroundColor3 = u12.InputBg
    u78.BorderSizePixel = 0
    u78.ScrollBarThickness = 5
    u78.ScrollBarImageColor3 = u12.StrokeColor
    u78.Visible = false
    u78.ZIndex = 16
    u78.ClipsDescendants = true
    Instance.new("UICorner", u78).CornerRadius = UDim.new(0, 8)
    local v79 = Instance.new("UIStroke", u78)
    v79.Color = u12.StrokeColor
    v79.Thickness = 1
    v79.Transparency = 0.5
    Instance.new("UIListLayout", u78).SortOrder = Enum.SortOrder.LayoutOrder
    local v80 = Instance.new("Frame", u20)
    v80.Size = UDim2.new(0.92, 0, 0, 100)
    v80.Position = UDim2.new(0.04, 0, 0, 510)
    v80.BackgroundColor3 = u12.SectionBg
    v80.BorderSizePixel = 0
    v80.ZIndex = 3
    Instance.new("UICorner", v80).CornerRadius = UDim.new(0, 10)
    local v81 = Instance.new("TextLabel", v80)
    v81.Size = UDim2.new(1, 0, 0, 30)
    v81.Position = UDim2.new(0, 0, 0, 8)
    v81.BackgroundTransparency = 1
    v81.Text = "RESUME"
    v81.Font = Enum.Font.Bodoni
    v81.TextSize = 20
    v81.TextColor3 = u12.TitleText
    v81.ZIndex = 4
    local u82 = Instance.new("TextLabel", v80)
    u82.Name = "SummaryPlayer"
    u82.Size = UDim2.new(1, -20, 0, 22)
    u82.Position = UDim2.new(0, 10, 0, 38)
    u82.BackgroundTransparency = 1
    u82.Text = "Joueur : --"
    u82.Font = Enum.Font.SourceSans
    u82.TextSize = 16
    u82.TextColor3 = u12.SubtitleGray
    u82.TextXAlignment = Enum.TextXAlignment.Left
    u82.ZIndex = 4
    local u83 = Instance.new("TextLabel", v80)
    u83.Name = "SummaryTeam"
    u83.Size = UDim2.new(1, -20, 0, 22)
    u83.Position = UDim2.new(0, 10, 0, 58)
    u83.BackgroundTransparency = 1
    u83.Text = "Team : --"
    u83.Font = Enum.Font.SourceSans
    u83.TextSize = 16
    u83.TextColor3 = u12.SubtitleGray
    u83.TextXAlignment = Enum.TextXAlignment.Left
    u83.ZIndex = 4
    local u84 = Instance.new("TextLabel", v80)
    u84.Name = "SummaryGrade"
    u84.Size = UDim2.new(1, -20, 0, 22)
    u84.Position = UDim2.new(0, 10, 0, 78)
    u84.BackgroundTransparency = 1
    u84.Text = "Grade : --"
    u84.Font = Enum.Font.SourceSans
    u84.TextSize = 16
    u84.TextColor3 = u12.SubtitleGray
    u84.TextXAlignment = Enum.TextXAlignment.Left
    u84.ZIndex = 4
    local u85 = Instance.new("TextButton", u20)
    u85.Size = UDim2.new(0.44, 0, 0, 55)
    u85.Position = UDim2.new(0.04, 0, 0, 630)
    u85.BackgroundColor3 = u12.ButtonBg
    u85.Text = "Confirmer l\'assignation"
    u85.Font = Enum.Font.Bodoni
    u85.TextSize = 20
    u85.TextColor3 = u12.SubtitleGray
    u85.BorderSizePixel = 0
    u85.AutoButtonColor = true
    u85.ZIndex = 3
    Instance.new("UICorner", u85).CornerRadius = UDim.new(0, 10)
    local v86 = Instance.new("UIStroke", u85)
    v86.Color = u12.StrokeColor
    v86.Thickness = 1
    v86.Transparency = 0.5
    local u87 = Instance.new("TextButton", u20)
    u87.Size = UDim2.new(0.44, 0, 0, 55)
    u87.Position = UDim2.new(0.52, 0, 0, 630)
    u87.BackgroundColor3 = u12.ButtonBg
    u87.Text = "Reinitialiser"
    u87.Font = Enum.Font.Bodoni
    u87.TextSize = 20
    u87.TextColor3 = u12.SubtitleGray
    u87.BorderSizePixel = 0
    u87.AutoButtonColor = true
    u87.ZIndex = 3
    Instance.new("UICorner", u87).CornerRadius = UDim.new(0, 10)
    local v88 = Instance.new("UIStroke", u87)
    v88.Color = u12.StrokeColor
    v88.Thickness = 1
    v88.Transparency = 0.5
    local v89 = Instance.new("TextLabel", u20)
    v89.Name = "RoleIndicator"
    v89.Size = UDim2.new(0.92, 0, 0, 30)
    v89.Position = UDim2.new(0.04, 0, 0, 700)
    v89.BackgroundTransparency = 1
    v89.Text = ""
    v89.Font = Enum.Font.SourceSansItalic
    v89.TextSize = 14
    v89.TextColor3 = u12.SubtitleGray
    v89.ZIndex = 3
    local u90 = false
    local u91 = false
    local u92 = false
    local function u93() --[[ Line: 463 ]]
        --[[
        Upvalues:
            [1] = u90
            [2] = u4
            [3] = u64
            [4] = u91
            [5] = u71
            [6] = u92
            [7] = u78
        --]]
        if u90 then
            u4:Create(u64, TweenInfo.new(0.2), {
                ["Size"] = UDim2.new(0.92, 0, 0, 0)
            }):Play()
            task.delay(0.2, function() --[[ Line: 466 ]]
                --[[
                Upvalues:
                    [1] = u64
                --]]
                u64.Visible = false
            end)
            u90 = false
        end
        if u91 then
            u4:Create(u71, TweenInfo.new(0.2), {
                ["Size"] = UDim2.new(0.92, 0, 0, 0)
            }):Play()
            task.delay(0.2, function() --[[ Line: 471 ]]
                --[[
                Upvalues:
                    [1] = u71
                --]]
                u71.Visible = false
            end)
            u91 = false
        end
        if u92 then
            u4:Create(u78, TweenInfo.new(0.2), {
                ["Size"] = UDim2.new(0.92, 0, 0, 0)
            }):Play()
            task.delay(0.2, function() --[[ Line: 476 ]]
                --[[
                Upvalues:
                    [1] = u78
                --]]
                u78.Visible = false
            end)
            u92 = false
        end
    end
    local function u102() --[[ Line: 496 ]]
        --[[
        Upvalues:
            [1] = u64
            [2] = u18
            [3] = u12
            [4] = u5
            [5] = u4
            [6] = u15
            [7] = u16
            [8] = u17
            [9] = u61
            [10] = u68
            [11] = u75
            [12] = u93
            [13] = u82
            [14] = u83
            [15] = u84
        --]]
        for _, v94 in pairs(u64:GetChildren()) do
            if v94:IsA("TextButton") then
                v94:Destroy()
            end
        end
        if u18 and u18.Players then
            for v95, u96 in ipairs(u18.Players) do
                local u97 = Instance.new("TextButton", u64)
                u97.Name = u96.Name
                u97.Size = UDim2.new(1, -6, 0, 45)
                u97.BackgroundColor3 = u12.ButtonBg
                u97.BorderSizePixel = 0
                u97.AutoButtonColor = false
                u97.ZIndex = 21
                u97.LayoutOrder = v95
                Instance.new("UICorner", u97).CornerRadius = UDim.new(0, 6)
                local v98 = u96.Name == u5.Name
                local v99 = v98 and u12.RevRed or u12.TitleText
                local v100 = Instance.new("TextLabel", u97)
                v100.Size = UDim2.new(0.6, -10, 0, 22)
                v100.Position = UDim2.new(0, 10, 0, 3)
                v100.BackgroundTransparency = 1
                v100.Text = u96.DisplayName .. " (@" .. u96.Name .. ")" .. (v98 and " (vous)" or "")
                v100.Font = Enum.Font.Bodoni
                v100.TextSize = 16
                v100.TextColor3 = v99
                v100.TextXAlignment = Enum.TextXAlignment.Left
                v100.ZIndex = 22
                local v101 = Instance.new("TextLabel", u97)
                v101.Size = UDim2.new(1, -20, 0, 18)
                v101.Position = UDim2.new(0, 10, 0, 24)
                v101.BackgroundTransparency = 1
                v101.Text = u96.Regiment .. " -- " .. u96.Rank
                v101.Font = Enum.Font.SourceSansItalic
                v101.TextSize = 13
                v101.TextColor3 = u12.SubtitleGray
                v101.TextXAlignment = Enum.TextXAlignment.Left
                v101.ZIndex = 22
                u97.MouseEnter:Connect(function() --[[ Line: 526 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u97
                        [3] = u12
                    --]]
                    u4:Create(u97, TweenInfo.new(0.15), {
                        ["BackgroundColor3"] = u12.ActiveTab
                    }):Play()
                end)
                u97.MouseLeave:Connect(function() --[[ Line: 527 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                        [2] = u97
                        [3] = u12
                    --]]
                    u4:Create(u97, TweenInfo.new(0.15), {
                        ["BackgroundColor3"] = u12.ButtonBg
                    }):Play()
                end)
                u97.Activated:Connect(function() --[[ Line: 529 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u96
                        [3] = u16
                        [4] = u17
                        [5] = u61
                        [6] = u12
                        [7] = u68
                        [8] = u75
                        [9] = u93
                        [10] = u82
                        [11] = u83
                        [12] = u84
                    --]]
                    u15 = u96
                    u16 = nil
                    u17 = nil
                    u61.Text = "  " .. u96.DisplayName .. " (@" .. u96.Name .. ")"
                    u61.TextColor3 = u12.TitleText
                    u68.Text = "  Selectionner une team"
                    u68.TextColor3 = u12.SubtitleGray
                    u75.Text = "  Selectionner un grade"
                    u75.TextColor3 = u12.SubtitleGray
                    u93()
                    u82.Text = u15 and "Joueur : " .. u15.DisplayName .. " (@" .. u15.Name .. ")" or "Joueur : --"
                    u83.Text = u16 and "Team : " .. u16 or "Team : --"
                    u84.Text = u17 and "Grade : " .. u17 or "Grade : --"
                end)
            end
            u64.CanvasSize = UDim2.new(0, 0, 0, #u18.Players * 47)
        end
    end
    local function u130() --[[ Line: 542 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u51
            [3] = u15
            [4] = u18
            [5] = u12
            [6] = u4
            [7] = u35
            [8] = u16
            [9] = u17
            [10] = u68
            [11] = u75
            [12] = u93
            [13] = u82
            [14] = u83
            [15] = u84
        --]]
        for _, v103 in pairs(u71:GetChildren()) do
            if v103:IsA("TextButton") then
                v103:Destroy()
            end
        end
        local v104 = u51(u15)
        if v104 then
            local v105 = 0
            local v106 = 0
            for u107, u108 in pairs(v104) do
                v105 = v105 + 1
                v106 = v106 + 1
                local u109 = u107 == "R\195\169volutionnaire"
                local u110 = u109 and u18.RevCooldown
                if u110 then
                    u110 = u18.RevCooldown > 0
                end
                local v111
                if u109 and u110 then
                    local v112 = "  [COOLDOWN] "
                    local v113 = "  ("
                    local v114 = u18.RevCooldown
                    local v115
                    if v114 <= 0 then
                        v115 = "Pret"
                    elseif v114 < 60 then
                        v115 = v114 .. "s"
                    else
                        local v116 = v114 / 60
                        local v117 = math.floor(v116)
                        local v118 = v114 % 60
                        if v117 < 60 then
                            v115 = v117 .. "m " .. v118 .. "s"
                        else
                            local v119 = v117 / 60
                            v115 = math.floor(v119) .. "h " .. v117 % 60 .. "m"
                        end
                    end
                    v111 = v112 .. u107 .. v113 .. v115 .. ")"
                elseif u109 then
                    v111 = "  " .. u107 .. "  (" .. #u108 .. " grade)"
                else
                    v111 = "  " .. u107 .. "  (" .. #u108 .. " grade" .. (#u108 > 1 and "s" or "") .. ")"
                end
                local u120 = Instance.new("TextButton", u71)
                u120.Name = u107
                u120.Size = UDim2.new(1, -6, 0, 40)
                u120.BackgroundColor3 = u109 and u110 and u12.CooldownGray or u12.ButtonBg
                u120.Text = v111
                u120.Font = Enum.Font.Bodoni
                u120.TextSize = 16
                u120.TextColor3 = u109 and u12.RevRed or u12.TitleText
                u120.TextXAlignment = Enum.TextXAlignment.Left
                u120.BorderSizePixel = 0
                u120.AutoButtonColor = not (u109 and u110)
                u120.ZIndex = 19
                u120.LayoutOrder = v105
                Instance.new("UICorner", u120).CornerRadius = UDim.new(0, 6)
                if not (u109 and u110) then
                    u120.MouseEnter:Connect(function() --[[ Line: 576 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u120
                            [3] = u12
                        --]]
                        u4:Create(u120, TweenInfo.new(0.15), {
                            ["BackgroundColor3"] = u12.ActiveTab
                        }):Play()
                    end)
                    u120.MouseLeave:Connect(function() --[[ Line: 577 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u120
                            [3] = u12
                        --]]
                        u4:Create(u120, TweenInfo.new(0.15), {
                            ["BackgroundColor3"] = u12.ButtonBg
                        }):Play()
                    end)
                end
                u120.Activated:Connect(function() --[[ Line: 580 ]]
                    --[[
                    Upvalues:
                        [1] = u109
                        [2] = u110
                        [3] = u35
                        [4] = u18
                        [5] = u16
                        [6] = u107
                        [7] = u17
                        [8] = u68
                        [9] = u12
                        [10] = u75
                        [11] = u108
                        [12] = u93
                        [13] = u82
                        [14] = u15
                        [15] = u83
                        [16] = u84
                    --]]
                    if u109 and u110 then
                        local v121 = u35
                        local v122 = "error"
                        local v123 = "Cooldown actif !\nVous devez attendre "
                        local v124 = u18.RevCooldown
                        local v125
                        if v124 <= 0 then
                            v125 = "Pret"
                        elseif v124 < 60 then
                            v125 = v124 .. "s"
                        else
                            local v126 = v124 / 60
                            local v127 = math.floor(v126)
                            local v128 = v124 % 60
                            if v127 < 60 then
                                v125 = v127 .. "m " .. v128 .. "s"
                            else
                                local v129 = v127 / 60
                                v125 = math.floor(v129) .. "h " .. v127 % 60 .. "m"
                            end
                        end
                        v121(v122, v123 .. v125 .. " avant de redevenir Revolutionnaire.")
                    else
                        u16 = u107
                        u17 = nil
                        u68.Text = "  " .. u107
                        u68.TextColor3 = u109 and u12.RevRed or u12.TitleText
                        u75.Text = "  Selectionner un grade"
                        u75.TextColor3 = u12.SubtitleGray
                        if #u108 == 1 then
                            u17 = u108[1]
                            u75.Text = "  " .. u108[1]
                            u75.TextColor3 = u109 and u12.RevRed or u12.TitleText
                        end
                        u93()
                        u82.Text = u15 and "Joueur : " .. u15.DisplayName .. " (@" .. u15.Name .. ")" or "Joueur : --"
                        u83.Text = u16 and "Team : " .. u16 or "Team : --"
                        u84.Text = u17 and "Grade : " .. u17 or "Grade : --"
                    end
                end)
            end
            u71.CanvasSize = UDim2.new(0, 0, 0, v106 * 42)
        end
    end
    local function u144() --[[ Line: 604 ]]
        --[[
        Upvalues:
            [1] = u78
            [2] = u16
            [3] = u51
            [4] = u15
            [5] = u18
            [6] = u12
            [7] = u4
            [8] = u17
            [9] = u75
            [10] = u93
            [11] = u82
            [12] = u83
            [13] = u84
        --]]
        for _, v131 in pairs(u78:GetChildren()) do
            if v131:IsA("TextButton") then
                v131:Destroy()
            end
        end
        if u16 then
            local v132 = u51(u15)
            if v132 then
                local v133 = v132[u16]
                if v133 then
                    local v134 = {}
                    if u18.GradesList and u18.GradesList[u16] then
                        for _, v135 in ipairs(u18.GradesList[u16].grades) do
                            v134[v135.name] = v135
                        end
                    end
                    for v136, u137 in ipairs(v133) do
                        local u138 = u137 == "R\195\169volutionnaire"
                        local u139 = Instance.new("TextButton", u78)
                        u139.Name = u137
                        u139.Size = UDim2.new(1, -6, 0, 45)
                        u139.BackgroundColor3 = u12.ButtonBg
                        u139.BorderSizePixel = 0
                        u139.AutoButtonColor = false
                        u139.ZIndex = 17
                        u139.LayoutOrder = v136
                        Instance.new("UICorner", u139).CornerRadius = UDim.new(0, 6)
                        local v140 = Instance.new("TextLabel", u139)
                        v140.Size = UDim2.new(0.6, -10, 0, 22)
                        v140.Position = UDim2.new(0, 10, 0, 3)
                        v140.BackgroundTransparency = 1
                        v140.Text = u137
                        v140.Font = Enum.Font.Bodoni
                        v140.TextSize = 16
                        v140.TextColor3 = u138 and u12.RevRed or u12.TitleText
                        v140.TextXAlignment = Enum.TextXAlignment.Left
                        v140.ZIndex = 18
                        local v141 = v134[u137]
                        local v142 = u138 and "Temporaire \226\128\148 Retour a votre team a la mort" or (v141 and v141.salary .. " Galons/10min" or "")
                        local v143 = Instance.new("TextLabel", u139)
                        v143.Size = UDim2.new(1, -20, 0, 16)
                        v143.Position = UDim2.new(0, 10, 0, 25)
                        v143.BackgroundTransparency = 1
                        v143.Text = v142
                        v143.Font = Enum.Font.SourceSansItalic
                        v143.TextSize = 12
                        v143.TextColor3 = u12.SubtitleGray
                        v143.TextXAlignment = Enum.TextXAlignment.Left
                        v143.ZIndex = 18
                        u139.MouseEnter:Connect(function() --[[ Line: 647 ]]
                            --[[
                            Upvalues:
                                [1] = u4
                                [2] = u139
                                [3] = u12
                            --]]
                            u4:Create(u139, TweenInfo.new(0.15), {
                                ["BackgroundColor3"] = u12.ActiveTab
                            }):Play()
                        end)
                        u139.MouseLeave:Connect(function() --[[ Line: 648 ]]
                            --[[
                            Upvalues:
                                [1] = u4
                                [2] = u139
                                [3] = u12
                            --]]
                            u4:Create(u139, TweenInfo.new(0.15), {
                                ["BackgroundColor3"] = u12.ButtonBg
                            }):Play()
                        end)
                        u139.Activated:Connect(function() --[[ Line: 650 ]]
                            --[[
                            Upvalues:
                                [1] = u17
                                [2] = u137
                                [3] = u75
                                [4] = u138
                                [5] = u12
                                [6] = u93
                                [7] = u82
                                [8] = u15
                                [9] = u83
                                [10] = u16
                                [11] = u84
                            --]]
                            u17 = u137
                            u75.Text = "  " .. u137
                            u75.TextColor3 = u138 and u12.RevRed or u12.TitleText
                            u93()
                            u82.Text = u15 and "Joueur : " .. u15.DisplayName .. " (@" .. u15.Name .. ")" or "Joueur : --"
                            u83.Text = u16 and "Team : " .. u16 or "Team : --"
                            u84.Text = u17 and "Grade : " .. u17 or "Grade : --"
                        end)
                    end
                    u78.CanvasSize = UDim2.new(0, 0, 0, #v133 * 47)
                end
            else
                return
            end
        else
            return
        end
    end
    u61.Activated:Connect(function() --[[ Line: 661 ]]
        --[[
        Upvalues:
            [1] = u90
            [2] = u93
            [3] = u102
            [4] = u64
            [5] = u18
            [6] = u4
        --]]
        local v145 = u90
        u93()
        if not v145 then
            u102()
            u64.Visible = true
            u64.Size = UDim2.new(0.92, 0, 0, 0)
            local v146 = (#u18.Players or 0) * 47
            local v147 = math.min(200, v146)
            u4:Create(u64, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                ["Size"] = UDim2.new(0.92, 0, 0, v147)
            }):Play()
            u90 = true
        end
    end)
    u68.Activated:Connect(function() --[[ Line: 674 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u91
            [3] = u93
            [4] = u130
            [5] = u71
            [6] = u51
            [7] = u4
        --]]
        if u15 then
            local v148 = u91
            u93()
            if not v148 then
                u130()
                u71.Visible = true
                u71.Size = UDim2.new(0.92, 0, 0, 0)
                local v149 = 0
                local v150 = u51(u15)
                if v150 then
                    for _ in pairs(v150) do
                        v149 = v149 + 1
                    end
                end
                local v151 = v149 * 42
                local v152 = math.min(200, v151)
                u4:Create(u71, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                    ["Size"] = UDim2.new(0.92, 0, 0, v152)
                }):Play()
                u91 = true
            end
        end
    end)
    u75.Activated:Connect(function() --[[ Line: 691 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u16
            [3] = u92
            [4] = u93
            [5] = u144
            [6] = u78
            [7] = u51
            [8] = u4
        --]]
        if u15 and u16 then
            local v153 = u92
            u93()
            if not v153 then
                u144()
                u78.Visible = true
                u78.Size = UDim2.new(0.92, 0, 0, 0)
                local v154 = 0
                local v155 = u51(u15)
                if v155 then
                    v154 = v155[u16] and #v155[u16] or v154
                end
                local v156 = v154 * 47
                local v157 = math.min(200, v156)
                u4:Create(u78, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                    ["Size"] = UDim2.new(0.92, 0, 0, v157)
                }):Play()
                u92 = true
            end
        end
    end)
    u85.Activated:Connect(function() --[[ Line: 709 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u16
            [3] = u17
            [4] = u35
            [5] = u10
            [6] = u4
            [7] = u85
            [8] = u12
            [9] = u61
            [10] = u68
            [11] = u75
            [12] = u93
            [13] = u82
            [14] = u83
            [15] = u84
            [16] = u18
            [17] = u9
        --]]
        if u15 and (u16 and u17) then
            u10:FireServer(u15.Name, u16, u17)
            u4:Create(u85, TweenInfo.new(0.2), {
                ["BackgroundColor3"] = u12.SuccessGreen
            }):Play()
            u85.Text = "Envoye !"
            task.delay(1.5, function() --[[ Line: 720 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u85
                    [3] = u12
                    [4] = u15
                    [5] = u16
                    [6] = u17
                    [7] = u61
                    [8] = u68
                    [9] = u75
                    [10] = u93
                    [11] = u82
                    [12] = u83
                    [13] = u84
                    [14] = u18
                    [15] = u9
                --]]
                u4:Create(u85, TweenInfo.new(0.3), {
                    ["BackgroundColor3"] = u12.ButtonBg
                }):Play()
                u85.Text = "Confirmer l\'assignation"
                u15 = nil
                u16 = nil
                u17 = nil
                u61.Text = "  Selectionner un joueur"
                u61.TextColor3 = u12.SubtitleGray
                u68.Text = "  Selectionner une team"
                u68.TextColor3 = u12.SubtitleGray
                u75.Text = "  Selectionner un grade"
                u75.TextColor3 = u12.SubtitleGray
                u93()
                u82.Text = u15 and "Joueur : " .. u15.DisplayName .. " (@" .. u15.Name .. ")" or "Joueur : --"
                u83.Text = u16 and "Team : " .. u16 or "Team : --"
                u84.Text = u17 and "Grade : " .. u17 or "Grade : --"
                u18 = u9:InvokeServer()
            end)
        else
            u35("error", "Veuillez selectionner un joueur, une team et un grade.")
        end
    end)
    u87.Activated:Connect(function() --[[ Line: 729 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u16
            [3] = u17
            [4] = u61
            [5] = u12
            [6] = u68
            [7] = u75
            [8] = u93
            [9] = u82
            [10] = u83
            [11] = u84
            [12] = u4
            [13] = u87
        --]]
        u15 = nil
        u16 = nil
        u17 = nil
        u61.Text = "  Selectionner un joueur"
        u61.TextColor3 = u12.SubtitleGray
        u68.Text = "  Selectionner une team"
        u68.TextColor3 = u12.SubtitleGray
        u75.Text = "  Selectionner un grade"
        u75.TextColor3 = u12.SubtitleGray
        u93()
        u82.Text = u15 and "Joueur : " .. u15.DisplayName .. " (@" .. u15.Name .. ")" or "Joueur : --"
        u83.Text = u16 and "Team : " .. u16 or "Team : --"
        u84.Text = u17 and "Grade : " .. u17 or "Grade : --"
        u4:Create(u87, TweenInfo.new(0.2), {
            ["BackgroundColor3"] = u12.ActiveTab
        }):Play()
        task.wait(0.3)
        u4:Create(u87, TweenInfo.new(0.3), {
            ["BackgroundColor3"] = u12.ButtonBg
        }):Play()
    end)
    v57.Activated:Connect(function() --[[ Line: 737 ]]
        togglePanel()
    end)
    return u19, u20, v89
end
function togglePanel()
    --[[
    Upvalues:
        [1] = u14
        [2] = u13
        [3] = u8
        [4] = u35
        [5] = u18
        [6] = u9
        [7] = u158
        [8] = u19
        [9] = u4
        [10] = u15
        [11] = u16
        [12] = u17
    --]]
    if u14 then
        return
    else
        u13 = not u13
        if u13 then
            if u8:InvokeServer() then
                u18 = u9:InvokeServer()
                if u18 then
                    if u18.Players then
                        local v159 = {}
                        for _, v160 in ipairs(u18.Players) do
                            if typeof(v160) == "Instance" then
                                local v161 = "Civil"
                                local v162 = "Citoyen"
                                if v160.Character then
                                    local v163 = v160.Character:FindFirstChild("Regiment")
                                    local v164 = v160.Character:FindFirstChild("Rank")
                                    if v163 then
                                        v161 = v163.Value
                                    end
                                    if v164 then
                                        v162 = v164.Value
                                    end
                                end
                                local v165 = {
                                    ["Name"] = v160.Name,
                                    ["DisplayName"] = v160.DisplayName,
                                    ["Regiment"] = v161,
                                    ["Rank"] = v162,
                                    ["UserId"] = v160.UserId
                                }
                                table.insert(v159, v165)
                            else
                                table.insert(v159, v160)
                            end
                        end
                        u18.Players = v159
                    end
                    local _, v166, v167 = u158()
                    if u18.Role then
                        local v168 = u18.Role == "Staff" and "Mode Staff \226\128\148 Acces illimite" or (u18.Role == "Instructeur" and "Mode Instructeur \226\128\148 Assignation Cadet" or (u18.Role == "DivisionOfficer" and "Officier de Division" or (u18.Role == "RevolutionaryHolder" and "Pass Revolutionnaire" or "")))
                        if u18.IsRevolutionary then
                            v168 = v168 .. "  |  REVOLUTIONNAIRE ACTIF"
                        elseif u18.RevCooldown and u18.RevCooldown > 0 then
                            local v169 = "  |  Cooldown: "
                            local v170 = u18.RevCooldown
                            local v171
                            if v170 <= 0 then
                                v171 = "Pret"
                            elseif v170 < 60 then
                                v171 = v170 .. "s"
                            else
                                local v172 = v170 / 60
                                local v173 = math.floor(v172)
                                local v174 = v170 % 60
                                if v173 < 60 then
                                    v171 = v173 .. "m " .. v174 .. "s"
                                else
                                    local v175 = v173 / 60
                                    v171 = math.floor(v175) .. "h " .. v173 % 60 .. "m"
                                end
                            end
                            v168 = v168 .. v169 .. v171
                        end
                        v167.Text = v168
                    end
                    u19.Enabled = true
                    u14 = true
                    v166.Size = UDim2.new(0, 0, 0, 0)
                    local v176 = u4:Create(v166, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        ["Size"] = UDim2.new(0, 800, 0, 750)
                    })
                    v176:Play()
                    v176.Completed:Connect(function() --[[ Line: 819 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                        --]]
                        u14 = false
                    end)
                    u15 = nil
                    u16 = nil
                    u17 = nil
                else
                    u13 = false
                    u35("error", "Impossible de charger les donnees.")
                end
            else
                u13 = false
                u35("error", "Vous n\'avez pas acces au Team Panel.")
                return
            end
        elseif u19 then
            u14 = true
            local v177 = u19:FindFirstChild("Overlay")
            if v177 then
                v177 = u19.Overlay:FindFirstChild("MainFrame")
            end
            if v177 then
                local v178 = u4:Create(v177, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    ["Size"] = UDim2.new(0, 0, 0, 0)
                })
                v178:Play()
                v178.Completed:Connect(function() --[[ Line: 830 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u14
                    --]]
                    u19.Enabled = false
                    u14 = false
                end)
            else
                u19.Enabled = false
                u14 = false
            end
        else
            return
        end
    end
end
v3.InputBegan:Connect(function(p179, p180) --[[ Line: 843 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if not p180 then
        if p179.KeyCode == u7 then
            togglePanel()
        end
    end
end)