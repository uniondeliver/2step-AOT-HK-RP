-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local u2 = game:GetService("RunService")
local v3 = game:GetService("UserInputService")
local u4 = game:GetService("TweenService")
local v5 = game:GetService("ReplicatedStorage")
local v6 = v1.LocalPlayer
local u7 = v6:GetMouse()
local v8 = v6:WaitForChild("PlayerGui")
local v9 = v5:WaitForChild("Assets"):WaitForChild("Remotes")
local u10 = v9:WaitForChild("TitanToolRemote")
local u11 = v9:WaitForChild("TitanInfoRemote")
local u12 = v9:WaitForChild("IsStaffRemote")
local u13 = v9:WaitForChild("StaffControlRemote")
local v14 = false
for _ = 1, 10 do
    local v15, v16 = pcall(function() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        return u12:InvokeServer()
    end)
    if v15 then
        v14 = v16
        break
    end
    task.wait(1)
end
if v14 then
    local u17 = false
    local u18 = false
    local u19 = "Normal"
    local u20 = {
        ["TitleText"] = Color3.fromRGB(220, 220, 225),
        ["SubtitleGray"] = Color3.fromRGB(140, 140, 145),
        ["MainBg"] = Color3.fromRGB(18, 18, 20),
        ["SectionBg"] = Color3.fromRGB(16, 16, 20),
        ["InputBg"] = Color3.fromRGB(20, 20, 25),
        ["ButtonBg"] = Color3.fromRGB(25, 25, 30),
        ["ButtonHover"] = Color3.fromRGB(35, 35, 42),
        ["StrokeColor"] = Color3.fromRGB(140, 140, 145),
        ["SelectedType"] = Color3.fromRGB(45, 45, 55),
        ["Kill"] = Color3.fromRGB(60, 15, 15),
        ["KillHover"] = Color3.fromRGB(80, 20, 20),
        ["Despawn"] = Color3.fromRGB(60, 40, 10),
        ["DespawnHover"] = Color3.fromRGB(80, 55, 15),
        ["Freeze"] = Color3.fromRGB(15, 35, 60),
        ["FreezeHover"] = Color3.fromRGB(20, 50, 80),
        ["Unfreeze"] = Color3.fromRGB(15, 50, 25),
        ["UnfreezeHover"] = Color3.fromRGB(20, 70, 35),
        ["SpawnActive"] = Color3.fromRGB(20, 60, 30),
        ["SpawnInactive"] = Color3.fromRGB(25, 25, 30),
        ["FrozenEntry"] = Color3.fromRGB(15, 25, 45),
        ["EntryBg"] = Color3.fromRGB(22, 22, 26),
        ["Indicator"] = Color3.fromRGB(220, 220, 225),
        ["Control"] = Color3.fromRGB(40, 20, 60),
        ["ControlHover"] = Color3.fromRGB(60, 30, 85),
        ["ControlActive"] = Color3.fromRGB(70, 40, 100)
    }
    local u21 = Instance.new("ScreenGui")
    u21.Name = "TitanHint"
    u21.ResetOnSpawn = false
    u21.IgnoreGuiInset = true
    u21.Parent = v8
    local u22 = Instance.new("TextLabel")
    u22.Size = UDim2.new(0, 340, 0, 36)
    u22.Position = UDim2.new(0.5, -170, 0, 15)
    u22.BackgroundColor3 = u20.MainBg
    u22.BackgroundTransparency = 0.1
    u22.Text = "Appuyez sur [L] pour ouvrir le Titan Spawner"
    u22.TextColor3 = u20.SubtitleGray
    u22.TextSize = 15
    u22.Font = Enum.Font.Bodoni
    u22.Parent = u21
    Instance.new("UICorner", u22).CornerRadius = UDim.new(0, 8)
    local v23 = Instance.new("UIStroke", u22)
    v23.Color = u20.StrokeColor
    v23.Thickness = 1
    v23.Transparency = 0.5
    task.delay(5, function() --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u22
            [3] = u21
        --]]
        local v24 = u4:Create(u22, TweenInfo.new(0.5), {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 1
        })
        v24:Play()
        v24.Completed:Connect(function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            if u21 then
                u21:Destroy()
            end
        end)
    end)
    local u25 = Instance.new("ScreenGui")
    u25.Name = "TitanSpawnerGui"
    u25.ResetOnSpawn = false
    u25.IgnoreGuiInset = true
    u25.Enabled = false
    u25.DisplayOrder = 45
    u25.Parent = v8
    local u26 = Instance.new("Frame")
    u26.Name = "MainFrame"
    u26.Size = UDim2.new(0, 360, 0, 700)
    u26.Position = UDim2.new(1, -380, 0, 20)
    u26.BackgroundColor3 = u20.MainBg
    u26.BorderSizePixel = 0
    u26.Parent = u25
    Instance.new("UICorner", u26).CornerRadius = UDim.new(0, 12)
    local v27 = Instance.new("UIStroke", u26)
    v27.Color = u20.StrokeColor
    v27.Thickness = 2
    v27.Transparency = 0.3
    local v28 = Instance.new("TextLabel")
    v28.Size = UDim2.new(1, 0, 0, 70)
    v28.Position = UDim2.new(0, 0, 0, 15)
    v28.BackgroundTransparency = 1
    v28.Text = "TITAN SPAWNER"
    v28.Font = Enum.Font.Bodoni
    v28.TextSize = 40
    v28.TextColor3 = u20.TitleText
    v28.Parent = u26
    local v29 = Instance.new("TextLabel")
    v29.Size = UDim2.new(1, 0, 0, 25)
    v29.Position = UDim2.new(0, 0, 0, 80)
    v29.BackgroundTransparency = 1
    v29.Text = "Gestion et invocation [L]"
    v29.Font = Enum.Font.SourceSansItalic
    v29.TextSize = 18
    v29.TextColor3 = u20.SubtitleGray
    v29.Parent = u26
    local v30 = Instance.new("Frame")
    v30.Size = UDim2.new(0.9, 0, 0, 2)
    v30.Position = UDim2.new(0.05, 0, 0, 115)
    v30.BackgroundColor3 = u20.StrokeColor
    v30.BackgroundTransparency = 0.5
    v30.BorderSizePixel = 0
    v30.Parent = u26
    local u31 = Instance.new("TextButton")
    u31.Size = UDim2.new(0, 36, 0, 36)
    u31.Position = UDim2.new(1, -48, 0, 12)
    u31.BackgroundColor3 = u20.ButtonBg
    u31.Text = "X"
    u31.TextColor3 = u20.SubtitleGray
    u31.TextSize = 20
    u31.Font = Enum.Font.GothamBold
    u31.BorderSizePixel = 0
    u31.AutoButtonColor = false
    u31.Parent = u26
    Instance.new("UICorner", u31).CornerRadius = UDim.new(0, 8)
    local v32 = Instance.new("UIStroke", u31)
    v32.Color = u20.StrokeColor
    v32.Thickness = 1
    v32.Transparency = 0.5
    local v33 = Instance.new("Frame")
    v33.Size = UDim2.new(0.9, 0, 0, 170)
    v33.Position = UDim2.new(0.05, 0, 0, 130)
    v33.BackgroundColor3 = u20.SectionBg
    v33.BorderSizePixel = 0
    v33.Parent = u26
    Instance.new("UICorner", v33).CornerRadius = UDim.new(0, 10)
    local v34 = Instance.new("TextLabel")
    v34.Size = UDim2.new(1, 0, 0, 35)
    v34.Position = UDim2.new(0, 0, 0, 8)
    v34.BackgroundTransparency = 1
    v34.Text = "INVOCATION"
    v34.Font = Enum.Font.Bodoni
    v34.TextSize = 22
    v34.TextColor3 = u20.TitleText
    v34.Parent = v33
    local v35 = Instance.new("Frame")
    v35.Size = UDim2.new(0.9, 0, 0, 45)
    v35.Position = UDim2.new(0.05, 0, 0, 45)
    v35.BackgroundTransparency = 1
    v35.Parent = v33
    local v36 = Instance.new("UIListLayout")
    v36.FillDirection = Enum.FillDirection.Horizontal
    v36.HorizontalAlignment = Enum.HorizontalAlignment.Center
    v36.Padding = UDim.new(0, 8)
    v36.Parent = v35
    local u37 = Instance.new("TextLabel")
    u37.Size = UDim2.new(1, 0, 0, 20)
    u37.Position = UDim2.new(0, 0, 0, 95)
    u37.BackgroundTransparency = 1
    u37.Text = "Selectionne : Normal"
    u37.Font = Enum.Font.SourceSansItalic
    u37.TextSize = 14
    u37.TextColor3 = u20.SubtitleGray
    u37.Parent = v33
    local u38 = Instance.new("TextButton")
    u38.Size = UDim2.new(0.9, 0, 0, 42)
    u38.Position = UDim2.new(0.05, 0, 0, 118)
    u38.BackgroundColor3 = u20.SpawnInactive
    u38.Text = "Activer le mode spawn"
    u38.TextColor3 = u20.SubtitleGray
    u38.TextSize = 17
    u38.Font = Enum.Font.Bodoni
    u38.BorderSizePixel = 0
    u38.AutoButtonColor = false
    u38.Parent = v33
    Instance.new("UICorner", u38).CornerRadius = UDim.new(0, 8)
    local v39 = Instance.new("UIStroke", u38)
    v39.Color = u20.StrokeColor
    v39.Thickness = 1
    v39.Transparency = 0.5
    local v40 = Instance.new("Frame")
    v40.Size = UDim2.new(0.9, 0, 0, 2)
    v40.Position = UDim2.new(0.05, 0, 0, 315)
    v40.BackgroundColor3 = u20.StrokeColor
    v40.BackgroundTransparency = 0.5
    v40.BorderSizePixel = 0
    v40.Parent = u26
    local v41 = Instance.new("Frame")
    v41.Size = UDim2.new(0.9, 0, 0, 340)
    v41.Position = UDim2.new(0.05, 0, 0, 330)
    v41.BackgroundColor3 = u20.SectionBg
    v41.BorderSizePixel = 0
    v41.Parent = u26
    Instance.new("UICorner", v41).CornerRadius = UDim.new(0, 10)
    local v42 = Instance.new("TextLabel")
    v42.Size = UDim2.new(1, 0, 0, 35)
    v42.Position = UDim2.new(0, 0, 0, 8)
    v42.BackgroundTransparency = 1
    v42.Text = "GESTION"
    v42.Font = Enum.Font.Bodoni
    v42.TextSize = 22
    v42.TextColor3 = u20.TitleText
    v42.Parent = v41
    local u43 = Instance.new("ScrollingFrame")
    u43.Size = UDim2.new(0.9, 0, 0, 210)
    u43.Position = UDim2.new(0.05, 0, 0, 45)
    u43.BackgroundColor3 = u20.InputBg
    u43.BorderSizePixel = 0
    u43.ScrollBarThickness = 5
    u43.ScrollBarImageColor3 = u20.StrokeColor
    u43.Parent = v41
    Instance.new("UICorner", u43).CornerRadius = UDim.new(0, 8)
    local v44 = Instance.new("UIStroke", u43)
    v44.Color = u20.StrokeColor
    v44.Thickness = 1
    v44.Transparency = 0.5
    local u45 = Instance.new("UIListLayout")
    u45.Padding = UDim.new(0, 3)
    u45.SortOrder = Enum.SortOrder.LayoutOrder
    u45.Parent = u43
    local v46 = Instance.new("UIPadding")
    v46.PaddingTop = UDim.new(0, 4)
    v46.PaddingLeft = UDim.new(0, 4)
    v46.PaddingRight = UDim.new(0, 4)
    v46.Parent = u43
    local u47 = Instance.new("Frame")
    u47.Size = UDim2.new(0.9, 0, 0, 70)
    u47.Position = UDim2.new(0.05, 0, 0, 262)
    u47.BackgroundTransparency = 1
    u47.Parent = v41
    local v48 = Instance.new("UIGridLayout")
    v48.CellSize = UDim2.new(0.48, 0, 0, 30)
    v48.CellPadding = UDim2.new(0.04, 0, 0, 6)
    v48.SortOrder = Enum.SortOrder.LayoutOrder
    v48.Parent = u47
    local function v57(p49, u50, u51, p52) --[[ Line: 289 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u47
            [3] = u4
        --]]
        local u53 = Instance.new("TextButton")
        u53.BackgroundColor3 = u50
        u53.Text = p49
        u53.TextColor3 = u20.SubtitleGray
        u53.TextSize = 13
        u53.Font = Enum.Font.Bodoni
        u53.BorderSizePixel = 0
        u53.LayoutOrder = p52
        u53.AutoButtonColor = false
        u53.Parent = u47
        Instance.new("UICorner", u53).CornerRadius = UDim.new(0, 6)
        local v54 = Instance.new("UIStroke", u53)
        v54.Color = u20.StrokeColor
        v54.Thickness = 1
        v54.Transparency = 0.6
        u53.MouseEnter:Connect(function() --[[ Line: 306 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u53
                [3] = u51
            --]]
            local v55 = {
                ["BackgroundColor3"] = u51
            }
            u4:Create(u53, TweenInfo.new(0.15), v55):Play()
        end)
        u53.MouseLeave:Connect(function() --[[ Line: 309 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u53
                [3] = u50
            --]]
            local v56 = {
                ["BackgroundColor3"] = u50
            }
            u4:Create(u53, TweenInfo.new(0.15), v56):Play()
        end)
        return u53
    end
    local v58 = v57("Kill All", u20.Kill, u20.KillHover, 1)
    local v59 = v57("Despawn All", u20.Despawn, u20.DespawnHover, 2)
    local v60 = v57("Freeze All", u20.Freeze, u20.FreezeHover, 3)
    local v61 = v57("Unfreeze All", u20.Unfreeze, u20.UnfreezeHover, 4)
    local u62 = Instance.new("Part")
    u62.Name = "SpawnIndicator"
    u62.Size = Vector3.new(8, 0.5, 8)
    u62.Anchored = true
    u62.CanCollide = false
    u62.CanQuery = false
    u62.CanTouch = false
    u62.Material = Enum.Material.Neon
    u62.Color = u20.Indicator
    u62.Transparency = 0.5
    u62.Shape = Enum.PartType.Cylinder
    u62.Parent = nil
    local u63 = {}
    local u64 = { "Normal", "Abnormal", "Crawler" }
    pcall(function() --[[ Line: 337 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u64
        --]]
        local v65 = u11:InvokeServer("GetTypes")
        if v65 and #v65 > 0 then
            u64 = v65
        end
    end)
    local function u68() --[[ Line: 342 ]]
        --[[
        Upvalues:
            [1] = u63
            [2] = u19
            [3] = u4
            [4] = u20
            [5] = u37
        --]]
        for v66, v67 in pairs(u63) do
            if v66 == u19 then
                u4:Create(v67, TweenInfo.new(0.15), {
                    ["BackgroundColor3"] = u20.SelectedType
                }):Play()
                v67.TextColor3 = u20.TitleText
            else
                u4:Create(v67, TweenInfo.new(0.15), {
                    ["BackgroundColor3"] = u20.ButtonBg
                }):Play()
                v67.TextColor3 = u20.SubtitleGray
            end
        end
        u37.Text = "Selectionne : " .. u19
    end
    local u69 = u19
    for v70, u71 in pairs(u64) do
        local u72 = Instance.new("TextButton")
        u72.Name = u71
        u72.Size = UDim2.new(0, 95, 0, 38)
        u72.BackgroundColor3 = u20.ButtonBg
        u72.Text = u71
        u72.TextColor3 = u20.SubtitleGray
        u72.TextSize = 16
        u72.Font = Enum.Font.Bodoni
        u72.BorderSizePixel = 0
        u72.LayoutOrder = v70
        u72.AutoButtonColor = false
        u72.Parent = v35
        Instance.new("UICorner", u72).CornerRadius = UDim.new(0, 8)
        local v73 = Instance.new("UIStroke", u72)
        v73.Color = u20.StrokeColor
        v73.Thickness = 1
        v73.Transparency = 0.5
        u72.MouseButton1Click:Connect(function() --[[ Line: 374 ]]
            --[[
            Upvalues:
                [1] = u69
                [2] = u71
                [3] = u68
            --]]
            u69 = u71
            u68()
        end)
        u72.MouseEnter:Connect(function() --[[ Line: 379 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u69
                [3] = u4
                [4] = u72
                [5] = u20
            --]]
            if u71 ~= u69 then
                u4:Create(u72, TweenInfo.new(0.1), {
                    ["BackgroundColor3"] = u20.ButtonHover
                }):Play()
            end
        end)
        u72.MouseLeave:Connect(function() --[[ Line: 384 ]]
            --[[
            Upvalues:
                [1] = u71
                [2] = u69
                [3] = u4
                [4] = u72
                [5] = u20
            --]]
            if u71 ~= u69 then
                u4:Create(u72, TweenInfo.new(0.1), {
                    ["BackgroundColor3"] = u20.ButtonBg
                }):Play()
            end
        end)
        u63[u71] = u72
    end
    u68()
    local function u92() --[[ Line: 399 ]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u11
            [3] = u20
            [4] = u4
            [5] = u13
            [6] = u92
            [7] = u10
            [8] = u45
        --]]
        for _, v74 in pairs(u43:GetChildren()) do
            if v74:IsA("Frame") then
                v74:Destroy()
            end
        end
        local v75, v76 = pcall(function() --[[ Line: 404 ]]
            --[[
            Upvalues:
                [1] = u11
            --]]
            return u11:InvokeServer("GetAll")
        end)
        if v75 and v76 then
            for v77, u78 in pairs(v76) do
                if not u78.Dead then
                    local u79 = Instance.new("Frame")
                    u79.Size = UDim2.new(1, -8, 0, 44)
                    u79.BackgroundColor3 = u78.Frozen and u20.FrozenEntry or u20.EntryBg
                    u79.BorderSizePixel = 0
                    u79.LayoutOrder = v77
                    u79.Parent = u43
                    Instance.new("UICorner", u79).CornerRadius = UDim.new(0, 6)
                    local v80 = Instance.new("TextLabel")
                    v80.Size = UDim2.new(0.35, 0, 0, 22)
                    v80.Position = UDim2.new(0, 10, 0, 3)
                    v80.BackgroundTransparency = 1
                    v80.Text = u78.Type .. (u78.Frozen and " F" or "") .. (u78.StaffControlled and " C" or "")
                    v80.TextColor3 = u20.TitleText
                    v80.TextSize = 13
                    v80.Font = Enum.Font.Bodoni
                    v80.TextXAlignment = Enum.TextXAlignment.Left
                    v80.Parent = u79
                    local v81 = Instance.new("TextLabel")
                    v81.Size = UDim2.new(0.4, 0, 0, 16)
                    v81.Position = UDim2.new(0, 10, 0, 25)
                    v81.BackgroundTransparency = 1
                    local v82 = u78.Health and (u78.Health.Nape or "?") or "?"
                    v81.Text = "Nape: " .. tostring(v82)
                    v81.TextColor3 = u20.SubtitleGray
                    v81.TextSize = 11
                    v81.Font = Enum.Font.SourceSansItalic
                    v81.TextXAlignment = Enum.TextXAlignment.Left
                    v81.Parent = u79
                    local function v91(p83, u84, u85, p86, p87) --[[ Line: 443 ]]
                        --[[
                        Upvalues:
                            [1] = u20
                            [2] = u79
                            [3] = u4
                        --]]
                        local u88 = Instance.new("TextButton")
                        u88.Size = UDim2.new(0, 28, 0, 28)
                        u88.Position = UDim2.new(1, p86, 0, 8)
                        u88.BackgroundColor3 = u84
                        u88.Text = p83
                        u88.TextSize = 13
                        u88.TextColor3 = u20.SubtitleGray
                        u88.BorderSizePixel = 0
                        u88.AutoButtonColor = false
                        u88.Font = Enum.Font.GothamBold
                        u88.Parent = u79
                        Instance.new("UICorner", u88).CornerRadius = UDim.new(0, 6)
                        u88.MouseEnter:Connect(function() --[[ Line: 457 ]]
                            --[[
                            Upvalues:
                                [1] = u4
                                [2] = u88
                                [3] = u85
                            --]]
                            local v89 = {
                                ["BackgroundColor3"] = u85
                            }
                            u4:Create(u88, TweenInfo.new(0.1), v89):Play()
                        end)
                        u88.MouseLeave:Connect(function() --[[ Line: 460 ]]
                            --[[
                            Upvalues:
                                [1] = u4
                                [2] = u88
                                [3] = u84
                            --]]
                            local v90 = {
                                ["BackgroundColor3"] = u84
                            }
                            u4:Create(u88, TweenInfo.new(0.1), v90):Play()
                        end)
                        u88.MouseButton1Click:Connect(p87)
                        return u88
                    end
                    v91("C", u78.StaffControlled and u20.ControlActive or u20.Control, u20.ControlHover, -140, function() --[[ Line: 470 ]]
                        --[[
                        Upvalues:
                            [1] = u13
                            [2] = u78
                            [3] = u92
                        --]]
                        if u13 then
                            if u78.StaffControlled then
                                u13:FireServer("StopControl")
                            else
                                u13:FireServer("StartControl", u78.UUID)
                            end
                            task.wait(0.3)
                            u92()
                        end
                    end)
                    v91("K", u20.Kill, u20.KillHover, -108, function() --[[ Line: 483 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u78
                            [3] = u92
                        --]]
                        u10:FireServer("Kill", u78.UUID)
                        task.wait(0.3)
                        u92()
                    end)
                    v91("D", u20.Despawn, u20.DespawnHover, -72, function() --[[ Line: 490 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u78
                            [3] = u92
                        --]]
                        u10:FireServer("Despawn", u78.UUID)
                        task.wait(0.3)
                        u92()
                    end)
                    if u78.Frozen then
                        v91("U", u20.Unfreeze, u20.UnfreezeHover, -36, function() --[[ Line: 498 ]]
                            --[[
                            Upvalues:
                                [1] = u10
                                [2] = u78
                                [3] = u92
                            --]]
                            u10:FireServer("Unfreeze", u78.UUID)
                            task.wait(0.3)
                            u92()
                        end)
                    else
                        v91("F", u20.Freeze, u20.FreezeHover, -36, function() --[[ Line: 504 ]]
                            --[[
                            Upvalues:
                                [1] = u10
                                [2] = u78
                                [3] = u92
                            --]]
                            u10:FireServer("Freeze", u78.UUID)
                            task.wait(0.3)
                            u92()
                        end)
                    end
                end
            end
            u43.CanvasSize = UDim2.new(0, 0, 0, u45.AbsoluteContentSize.Y + 10)
        end
    end
    v58.MouseButton1Click:Connect(function() --[[ Line: 515 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u92
        --]]
        u10:FireServer("KillAll")
        task.wait(0.5)
        u92()
    end)
    v59.MouseButton1Click:Connect(function() --[[ Line: 521 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u92
        --]]
        u10:FireServer("DespawnAll")
        task.wait(0.5)
        u92()
    end)
    v60.MouseButton1Click:Connect(function() --[[ Line: 527 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u92
        --]]
        u10:FireServer("FreezeAll")
        task.wait(0.5)
        u92()
    end)
    v61.MouseButton1Click:Connect(function() --[[ Line: 533 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u92
        --]]
        u10:FireServer("UnfreezeAll")
        task.wait(0.5)
        u92()
    end)
    local u93 = nil
    local function u95() --[[ Line: 541 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u38
            [3] = u20
            [4] = u4
            [5] = u62
            [6] = u93
            [7] = u2
            [8] = u7
        --]]
        if u18 then
            u38.Text = "Mode spawn actif - Cliquez pour placer"
            u38.TextColor3 = u20.TitleText
            u4:Create(u38, TweenInfo.new(0.2), {
                ["BackgroundColor3"] = u20.SpawnActive
            }):Play()
            u62.Parent = workspace
            if not u93 then
                u93 = u2.RenderStepped:Connect(function() --[[ Line: 549 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                        [2] = u7
                        [3] = u62
                    --]]
                    if u18 then
                        local v94 = u7.Hit
                        if v94 then
                            u62.CFrame = CFrame.new(v94.Position) * CFrame.Angles(0, 0, 1.5707963267948966)
                        end
                    end
                end)
                return
            end
        else
            u38.Text = "Activer le mode spawn"
            u38.TextColor3 = u20.SubtitleGray
            u4:Create(u38, TweenInfo.new(0.2), {
                ["BackgroundColor3"] = u20.SpawnInactive
            }):Play()
            u62.Parent = nil
            if u93 then
                u93:Disconnect()
                u93 = nil
            end
        end
    end
    u38.MouseButton1Click:Connect(function() --[[ Line: 570 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u95
        --]]
        u18 = not u18
        u95()
    end)
    local u96 = false
    local u97 = nil
    local function u99() --[[ Line: 578 ]]
        --[[
        Upvalues:
            [1] = u96
            [2] = u17
            [3] = u25
            [4] = u26
            [5] = u4
            [6] = u92
            [7] = u97
        --]]
        if not u96 then
            u96 = true
            u17 = true
            u25.Enabled = true
            u26.Size = UDim2.new(0, 0, 0, 0)
            u26.Position = UDim2.new(1, -200, 0, 20)
            local v98 = u4:Create(u26, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                ["Size"] = UDim2.new(0, 360, 0, 700),
                ["Position"] = UDim2.new(1, -380, 0, 20)
            })
            v98:Play()
            v98.Completed:Connect(function() --[[ Line: 593 ]]
                --[[
                Upvalues:
                    [1] = u96
                --]]
                u96 = false
            end)
            u92()
            u97 = task.spawn(function() --[[ Line: 598 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u92
                --]]
                while u17 do
                    task.wait(2)
                    if u17 then
                        u92()
                    end
                end
            end)
        end
    end
    local function u101() --[[ Line: 606 ]]
        --[[
        Upvalues:
            [1] = u96
            [2] = u17
            [3] = u18
            [4] = u95
            [5] = u4
            [6] = u26
            [7] = u25
        --]]
        if not u96 then
            u96 = true
            u17 = false
            u18 = false
            u95()
            local v100 = u4:Create(u26, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ["Size"] = UDim2.new(0, 0, 0, 0),
                ["Position"] = UDim2.new(1, -20, 0, 20)
            })
            v100:Play()
            v100.Completed:Connect(function() --[[ Line: 618 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u96
                --]]
                u25.Enabled = false
                u96 = false
            end)
        end
    end
    u31.MouseButton1Click:Connect(function() --[[ Line: 624 ]]
        --[[
        Upvalues:
            [1] = u101
        --]]
        u101()
    end)
    u31.MouseEnter:Connect(function() --[[ Line: 628 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u31
            [3] = u20
        --]]
        u4:Create(u31, TweenInfo.new(0.1), {
            ["BackgroundColor3"] = u20.ButtonHover
        }):Play()
    end)
    u31.MouseLeave:Connect(function() --[[ Line: 631 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u31
            [3] = u20
        --]]
        u4:Create(u31, TweenInfo.new(0.1), {
            ["BackgroundColor3"] = u20.ButtonBg
        }):Play()
    end)
    v3.InputBegan:Connect(function(p102, p103) --[[ Line: 635 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u101
            [3] = u99
        --]]
        if not p103 then
            if p102.KeyCode == Enum.KeyCode.L then
                if u17 then
                    u101()
                    return
                end
                u99()
            end
        end
    end)
    v3.InputBegan:Connect(function(p104, p105) --[[ Line: 646 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
            [3] = u7
            [4] = u10
            [5] = u69
            [6] = u4
            [7] = u38
            [8] = u20
            [9] = u92
        --]]
        if p105 then
            return
        elseif u17 and u18 then
            local v106 = p104.UserInputType == Enum.UserInputType.MouseButton1 and u7.Hit
            if v106 then
                u10:FireServer("Spawn", u69, v106.Position)
                u4:Create(u38, TweenInfo.new(0.1), {
                    ["BackgroundColor3"] = Color3.fromRGB(40, 90, 50)
                }):Play()
                task.delay(0.2, function() --[[ Line: 658 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                        [2] = u4
                        [3] = u38
                        [4] = u20
                    --]]
                    if u18 then
                        u4:Create(u38, TweenInfo.new(0.2), {
                            ["BackgroundColor3"] = u20.SpawnActive
                        }):Play()
                    end
                end)
                task.wait(0.5)
                u92()
            end
        end
    end)
end