-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local u3 = game:GetService("TweenService")
local u4 = v1.LocalPlayer
local u5 = u4:WaitForChild("PlayerGui")
local u6 = v2:WaitForChild("PurchaseFist", 10)
local u7 = v2:WaitForChild("GetTrainerItems", 10)
local u8 = {
    ["TitleText"] = Color3.fromRGB(220, 220, 225),
    ["SubtitleGray"] = Color3.fromRGB(140, 140, 145),
    ["MainBg"] = Color3.fromRGB(14, 14, 18),
    ["DialogueBg"] = Color3.fromRGB(10, 10, 14),
    ["ItemBg"] = Color3.fromRGB(24, 24, 30),
    ["ItemHover"] = Color3.fromRGB(32, 32, 40),
    ["ButtonBg"] = Color3.fromRGB(25, 25, 30),
    ["ButtonHover"] = Color3.fromRGB(35, 35, 42),
    ["StrokeColor"] = Color3.fromRGB(80, 80, 90),
    ["AccentGold"] = Color3.fromRGB(255, 200, 100),
    ["SuccessGreen"] = Color3.fromRGB(40, 120, 40),
    ["SuccessGreenHover"] = Color3.fromRGB(50, 150, 50),
    ["ErrorRed"] = Color3.fromRGB(120, 30, 30),
    ["ScrollbarColor"] = Color3.fromRGB(60, 60, 70)
}
local u9 = nil
local u10 = false
local u11 = false
local u12 = 0
local u13 = nil
local u14 = nil
local function u31() --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u11
        [4] = u9
        [5] = u8
        [6] = u5
    --]]
    u12 = u12 + 1
    u10 = false
    u11 = false
    if u9 then
        u9:Destroy()
        u9 = nil
    end
    local v15 = Instance.new("ScreenGui")
    v15.Name = "TrainerGUI"
    v15.ResetOnSpawn = false
    v15.IgnoreGuiInset = true
    v15.DisplayOrder = 60
    v15.Enabled = false
    local v16 = Instance.new("Frame", v15)
    v16.Name = "Overlay"
    v16.Size = UDim2.new(1, 0, 1, 0)
    v16.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v16.BackgroundTransparency = 0.65
    v16.BorderSizePixel = 0
    v16.ZIndex = 1
    local v17 = Instance.new("Frame", v15)
    v17.Name = "MainPanel"
    v17.Size = UDim2.new(0.85, 0, 0, 260)
    v17.Position = UDim2.new(0.075, 0, 1, 20)
    v17.AnchorPoint = Vector2.new(0, 1)
    v17.BackgroundColor3 = u8.MainBg
    v17.BorderSizePixel = 0
    v17.ZIndex = 10
    Instance.new("UICorner", v17).CornerRadius = UDim.new(0, 14)
    local v18 = Instance.new("UIStroke", v17)
    v18.Color = u8.StrokeColor
    v18.Thickness = 1.5
    v18.Transparency = 0.2
    local v19 = Instance.new("Frame", v17)
    v19.Name = "DialoguePanel"
    v19.Size = UDim2.new(0.42, -5, 1, -16)
    v19.Position = UDim2.new(0, 8, 0, 8)
    v19.BackgroundColor3 = u8.DialogueBg
    v19.BorderSizePixel = 0
    v19.ZIndex = 11
    Instance.new("UICorner", v19).CornerRadius = UDim.new(0, 10)
    local v20 = Instance.new("TextLabel", v19)
    v20.Name = "TrainerName"
    v20.Size = UDim2.new(1, -20, 0, 28)
    v20.Position = UDim2.new(0, 10, 0, 8)
    v20.BackgroundTransparency = 1
    v20.Text = "Trainer"
    v20.Font = Enum.Font.Bodoni
    v20.TextSize = 22
    v20.TextColor3 = u8.AccentGold
    v20.TextXAlignment = Enum.TextXAlignment.Left
    v20.ZIndex = 12
    local v21 = Instance.new("Frame", v19)
    v21.Size = UDim2.new(1, -20, 0, 1)
    v21.Position = UDim2.new(0, 10, 0, 38)
    v21.BackgroundColor3 = u8.StrokeColor
    v21.BackgroundTransparency = 0.5
    v21.BorderSizePixel = 0
    v21.ZIndex = 12
    local v22 = Instance.new("TextLabel", v19)
    v22.Name = "DialogueText"
    v22.Size = UDim2.new(1, -20, 0, 110)
    v22.Position = UDim2.new(0, 10, 0, 46)
    v22.BackgroundTransparency = 1
    v22.Text = ""
    v22.Font = Enum.Font.SourceSansItalic
    v22.TextSize = 18
    v22.TextColor3 = u8.TitleText
    v22.TextWrapped = true
    v22.TextYAlignment = Enum.TextYAlignment.Top
    v22.TextXAlignment = Enum.TextXAlignment.Left
    v22.ZIndex = 12
    local v23 = Instance.new("TextButton", v19)
    v23.Name = "LeaveButton"
    v23.Size = UDim2.new(1, -20, 0, 40)
    v23.Position = UDim2.new(0, 10, 1, -50)
    v23.BackgroundColor3 = u8.ButtonBg
    v23.Text = "Au revoir"
    v23.Font = Enum.Font.Bodoni
    v23.TextSize = 20
    v23.TextColor3 = u8.SubtitleGray
    v23.BorderSizePixel = 0
    v23.AutoButtonColor = false
    v23.ZIndex = 13
    Instance.new("UICorner", v23).CornerRadius = UDim.new(0, 8)
    local v24 = Instance.new("UIStroke", v23)
    v24.Color = u8.StrokeColor
    v24.Thickness = 1
    v24.Transparency = 0.5
    local v25 = Instance.new("Frame", v17)
    v25.Name = "ShopPanel"
    v25.Size = UDim2.new(0.58, -11, 1, -16)
    v25.Position = UDim2.new(0.42, 3, 0, 8)
    v25.BackgroundColor3 = u8.DialogueBg
    v25.BorderSizePixel = 0
    v25.ZIndex = 11
    Instance.new("UICorner", v25).CornerRadius = UDim.new(0, 10)
    local v26 = Instance.new("TextLabel", v25)
    v26.Size = UDim2.new(1, -20, 0, 28)
    v26.Position = UDim2.new(0, 10, 0, 8)
    v26.BackgroundTransparency = 1
    v26.Text = "\226\128\148 Entra\195\174nements \226\128\148"
    v26.Font = Enum.Font.Bodoni
    v26.TextSize = 20
    v26.TextColor3 = u8.TitleText
    v26.ZIndex = 12
    local v27 = Instance.new("Frame", v25)
    v27.Size = UDim2.new(1, -20, 0, 1)
    v27.Position = UDim2.new(0, 10, 0, 38)
    v27.BackgroundColor3 = u8.StrokeColor
    v27.BackgroundTransparency = 0.5
    v27.BorderSizePixel = 0
    v27.ZIndex = 12
    local v28 = Instance.new("ScrollingFrame", v25)
    v28.Name = "ItemScroll"
    v28.Size = UDim2.new(1, -16, 1, -48)
    v28.Position = UDim2.new(0, 8, 0, 44)
    v28.BackgroundTransparency = 1
    v28.BorderSizePixel = 0
    v28.ScrollBarThickness = 4
    v28.ScrollBarImageColor3 = u8.ScrollbarColor
    v28.CanvasSize = UDim2.new(0, 0, 0, 0)
    v28.AutomaticCanvasSize = Enum.AutomaticSize.Y
    v28.ZIndex = 12
    local v29 = Instance.new("UIListLayout", v28)
    v29.Padding = UDim.new(0, 6)
    v29.SortOrder = Enum.SortOrder.LayoutOrder
    Instance.new("UIPadding", v28).PaddingRight = UDim.new(0, 4)
    local v30 = Instance.new("TextButton", v17)
    v30.Name = "CloseButton"
    v30.Size = UDim2.new(0, 30, 0, 30)
    v30.Position = UDim2.new(1, -38, 0, 6)
    v30.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v30.BackgroundTransparency = 0.4
    v30.Text = "\226\156\149"
    v30.Font = Enum.Font.GothamBold
    v30.TextSize = 16
    v30.TextColor3 = Color3.fromRGB(200, 200, 200)
    v30.BorderSizePixel = 0
    v30.AutoButtonColor = false
    v30.ZIndex = 15
    Instance.new("UICorner", v30).CornerRadius = UDim.new(0, 6)
    v15.Parent = u5
    return v15
end
local function u71(p32, u33, u34, p35) --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u11
        [4] = u10
        [5] = u6
        [6] = u9
        [7] = u12
    --]]
    local u36 = Instance.new("Frame")
    u36.Name = "Item_" .. u33.name
    u36.Size = UDim2.new(1, 0, 0, 64)
    u36.BackgroundColor3 = u8.ItemBg
    u36.BorderSizePixel = 0
    u36.LayoutOrder = p35
    u36.ZIndex = 13
    u36.Parent = p32
    Instance.new("UICorner", u36).CornerRadius = UDim.new(0, 8)
    local v37 = Instance.new("TextLabel", u36)
    v37.Size = UDim2.new(0.5, -10, 0, 22)
    v37.Position = UDim2.new(0, 12, 0, 8)
    v37.BackgroundTransparency = 1
    v37.Text = u33.name
    v37.Font = Enum.Font.Bodoni
    v37.TextSize = 19
    v37.TextColor3 = u8.TitleText
    v37.TextXAlignment = Enum.TextXAlignment.Left
    v37.ZIndex = 14
    local v38 = Instance.new("TextLabel", u36)
    v38.Size = UDim2.new(0.5, -10, 0, 18)
    v38.Position = UDim2.new(0, 12, 0, 32)
    v38.BackgroundTransparency = 1
    v38.Text = u33.description or ""
    v38.Font = Enum.Font.SourceSansItalic
    v38.TextSize = 14
    v38.TextColor3 = u8.SubtitleGray
    v38.TextXAlignment = Enum.TextXAlignment.Left
    v38.TextWrapped = true
    v38.ZIndex = 14
    local v39 = Instance.new("TextLabel", u36)
    v39.Size = UDim2.new(0, 80, 1, 0)
    v39.Position = UDim2.new(1, -190, 0, 0)
    v39.BackgroundTransparency = 1
    local v40 = u33.price
    v39.Text = tostring(v40) .. " G"
    v39.Font = Enum.Font.Bodoni
    v39.TextSize = 20
    v39.TextColor3 = u8.AccentGold
    v39.TextXAlignment = Enum.TextXAlignment.Right
    v39.ZIndex = 14
    local u41 = Instance.new("TextButton", u36)
    u41.Name = "BuyButton"
    u41.Size = UDim2.new(0, 85, 0, 34)
    u41.Position = UDim2.new(1, -95, 0.5, -17)
    u41.BackgroundColor3 = u8.SuccessGreen
    u41.Text = "Apprendre"
    u41.Font = Enum.Font.Bodoni
    u41.TextSize = 16
    u41.TextColor3 = u8.TitleText
    u41.BorderSizePixel = 0
    u41.AutoButtonColor = false
    u41.ZIndex = 15
    Instance.new("UICorner", u41).CornerRadius = UDim.new(0, 6)
    local v42 = Instance.new("UIStroke", u41)
    v42.Color = u8.StrokeColor
    v42.Thickness = 1
    v42.Transparency = 0.6
    u36.InputBegan:Connect(function(p43) --[[ Line: 324 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u36
            [3] = u8
        --]]
        if p43.UserInputType == Enum.UserInputType.MouseMovement then
            u3:Create(u36, TweenInfo.new(0.15), {
                ["BackgroundColor3"] = u8.ItemHover
            }):Play()
        end
    end)
    u36.InputEnded:Connect(function(p44) --[[ Line: 329 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u36
            [3] = u8
        --]]
        if p44.UserInputType == Enum.UserInputType.MouseMovement then
            u3:Create(u36, TweenInfo.new(0.15), {
                ["BackgroundColor3"] = u8.ItemBg
            }):Play()
        end
    end)
    u41.MouseEnter:Connect(function() --[[ Line: 335 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u11
            [3] = u3
            [4] = u8
        --]]
        if u41.Parent and not u11 then
            u3:Create(u41, TweenInfo.new(0.15), {
                ["BackgroundColor3"] = u8.SuccessGreenHover
            }):Play()
        end
    end)
    u41.MouseLeave:Connect(function() --[[ Line: 340 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u11
            [3] = u3
            [4] = u8
        --]]
        if u41.Parent and not u11 then
            u3:Create(u41, TweenInfo.new(0.15), {
                ["BackgroundColor3"] = u8.SuccessGreen
            }):Play()
        end
    end)
    u41.MouseButton1Click:Connect(function() --[[ Line: 346 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u3
            [4] = u41
            [5] = u8
            [6] = u6
            [7] = u33
            [8] = u9
            [9] = u34
            [10] = u12
        --]]
        if u10 and not u11 then
            u11 = true
            u3:Create(u41, TweenInfo.new(0.15), {
                ["BackgroundColor3"] = u8.AccentGold
            }):Play()
            u41.Text = "..."
            task.spawn(function() --[[ Line: 353 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u33
                    [3] = u10
                    [4] = u9
                    [5] = u11
                    [6] = u41
                    [7] = u3
                    [8] = u34
                    [9] = u12
                    [10] = u8
                --]]
                local v45, v46 = u6:InvokeServer(u33.name, u33.price)
                if u10 and u9 then
                    if v45 then
                        if u41.Parent then
                            u3:Create(u41, TweenInfo.new(0.2), {
                                ["BackgroundColor3"] = Color3.fromRGB(60, 180, 60)
                            }):Play()
                            u41.Text = "\226\156\147"
                        end
                        local u47 = u34
                        local u48 = v46 or "Tu as appris la technique !"
                        if u47 and u47.Parent then
                            u12 = u12 + 1
                            local u49 = u12
                            u47.Text = ""
                            local u50 = nil
                            task.spawn(function() --[[ Line: 75 ]]
                                --[[
                                Upvalues:
                                    [1] = u48
                                    [2] = u49
                                    [3] = u12
                                    [4] = u47
                                    [5] = u50
                                --]]
                                for v51 = 1, #u48 do
                                    if u49 ~= u12 then
                                        return
                                    end
                                    if not (u47 and u47.Parent) then
                                        return
                                    end
                                    local v52 = u48
                                    u47.Text = string.sub(v52, 1, v51)
                                    task.wait(0.02)
                                end
                                if u50 and u49 == u12 then
                                    u50()
                                end
                            end)
                        end
                        task.wait(2)
                        if u41 and u41.Parent then
                            u3:Create(u41, TweenInfo.new(0.3), {
                                ["BackgroundColor3"] = u8.SuccessGreen
                            }):Play()
                            u41.Text = "Apprendre"
                        end
                        if u10 and (u34 and u34.Parent) then
                            local u53 = u34
                            if u53 and u53.Parent then
                                u12 = u12 + 1
                                local u54 = u12
                                u53.Text = ""
                                local u55 = "Tu veux apprendre \195\160 te battre ? \195\135a te co\195\187tera quelques Galons."
                                local u56 = nil
                                task.spawn(function() --[[ Line: 75 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u55
                                        [2] = u54
                                        [3] = u12
                                        [4] = u53
                                        [5] = u56
                                    --]]
                                    for v57 = 1, #u55 do
                                        if u54 ~= u12 then
                                            return
                                        end
                                        if not (u53 and u53.Parent) then
                                            return
                                        end
                                        local v58 = u55
                                        u53.Text = string.sub(v58, 1, v57)
                                        task.wait(0.02)
                                    end
                                    if u56 and u54 == u12 then
                                        u56()
                                    end
                                end)
                            end
                        end
                        u11 = false
                    else
                        if u41.Parent then
                            u3:Create(u41, TweenInfo.new(0.2), {
                                ["BackgroundColor3"] = u8.ErrorRed
                            }):Play()
                            u41.Text = "\226\156\151"
                        end
                        local u59 = u34
                        local u60 = v46 or "Tu n\'as pas assez de Galons..."
                        if u59 and u59.Parent then
                            u12 = u12 + 1
                            local u61 = u12
                            u59.Text = ""
                            local u62 = nil
                            task.spawn(function() --[[ Line: 75 ]]
                                --[[
                                Upvalues:
                                    [1] = u60
                                    [2] = u61
                                    [3] = u12
                                    [4] = u59
                                    [5] = u62
                                --]]
                                for v63 = 1, #u60 do
                                    if u61 ~= u12 then
                                        return
                                    end
                                    if not (u59 and u59.Parent) then
                                        return
                                    end
                                    local v64 = u60
                                    u59.Text = string.sub(v64, 1, v63)
                                    task.wait(0.02)
                                end
                                if u62 and u61 == u12 then
                                    u62()
                                end
                            end)
                        end
                        task.wait(2)
                        if u41 and u41.Parent then
                            u3:Create(u41, TweenInfo.new(0.3), {
                                ["BackgroundColor3"] = u8.SuccessGreen
                            }):Play()
                            u41.Text = "Apprendre"
                        end
                        if u10 and (u34 and u34.Parent) then
                            local u65 = u34
                            if u65 and u65.Parent then
                                u12 = u12 + 1
                                local u66 = u12
                                u65.Text = ""
                                local u67 = "Tu veux apprendre \195\160 te battre ? \195\135a te co\195\187tera quelques Galons."
                                local u68 = nil
                                task.spawn(function() --[[ Line: 75 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u67
                                        [2] = u66
                                        [3] = u12
                                        [4] = u65
                                        [5] = u68
                                    --]]
                                    for v69 = 1, #u67 do
                                        if u66 ~= u12 then
                                            return
                                        end
                                        if not (u65 and u65.Parent) then
                                            return
                                        end
                                        local v70 = u67
                                        u65.Text = string.sub(v70, 1, v69)
                                        task.wait(0.02)
                                    end
                                    if u68 and u66 == u12 then
                                        u68()
                                    end
                                end)
                            end
                        end
                        u11 = false
                    end
                else
                    u11 = false
                    return
                end
            end)
        end
    end)
    return u36
end
local function u75() --[[ Line: 401 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u12
        [4] = u11
        [5] = u3
    --]]
    if u9 and u10 then
        u10 = false
        u12 = u12 + 1
        local v72 = u9:FindFirstChild("MainPanel")
        local v73 = u9:FindFirstChild("Overlay")
        if v72 then
            local v74 = u3:Create(v72, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                ["Position"] = UDim2.new(0.075, 0, 1, 20)
            })
            if v73 then
                u3:Create(v73, TweenInfo.new(0.35), {
                    ["BackgroundTransparency"] = 1
                }):Play()
            end
            v74:Play()
            v74.Completed:Connect(function() --[[ Line: 425 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u10
                    [3] = u11
                    [4] = u9
                --]]
                u12 = u12 + 1
                u10 = false
                u11 = false
                if u9 then
                    u9:Destroy()
                    u9 = nil
                end
            end)
        else
            u12 = u12 + 1
            u10 = false
            u11 = false
            if u9 then
                u9:Destroy()
                u9 = nil
            end
        end
    else
        return
    end
end
local function u100() --[[ Line: 433 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u31
        [4] = u3
        [5] = u12
        [6] = u13
        [7] = u7
        [8] = u71
        [9] = u75
        [10] = u8
    --]]
    if not u10 then
        u9 = u31()
        u10 = true
        local v76 = u9:FindFirstChild("MainPanel")
        local v77 = v76:FindFirstChild("DialoguePanel")
        local u78 = v77:FindFirstChild("DialogueText")
        local u79 = v77:FindFirstChild("LeaveButton")
        local u80 = v76:FindFirstChild("ShopPanel"):FindFirstChild("ItemScroll")
        local u81 = v76:FindFirstChild("CloseButton")
        u9.Enabled = true
        v76.Position = UDim2.new(0.075, 0, 1, 20)
        local v82 = u3:Create(v76, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            ["Position"] = UDim2.new(0.075, 0, 1, -20)
        })
        v82:Play()
        v82.Completed:Connect(function() --[[ Line: 457 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u78
                [3] = u12
            --]]
            local u83 = u10 and (u78 and (u78.Parent and u78))
            if u83 then
                if not u83.Parent then
                    return
                end
                u12 = u12 + 1
                local u84 = u12
                u83.Text = ""
                local u85 = "Tu veux apprendre \195\160 te battre ? \195\135a te co\195\187tera quelques Galons."
                local u86 = nil
                task.spawn(function() --[[ Line: 75 ]]
                    --[[
                    Upvalues:
                        [1] = u85
                        [2] = u84
                        [3] = u12
                        [4] = u83
                        [5] = u86
                    --]]
                    for v87 = 1, #u85 do
                        if u84 ~= u12 then
                            return
                        end
                        if not (u83 and u83.Parent) then
                            return
                        end
                        local v88 = u85
                        u83.Text = string.sub(v88, 1, v87)
                        task.wait(0.02)
                    end
                    if u86 and u84 == u12 then
                        u86()
                    end
                end)
            end
        end)
        task.spawn(function() --[[ Line: 463 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u7
                [3] = u80
                [4] = u71
                [5] = u78
            --]]
            local v89 = u13
            local v90
            if v89 then
                v90 = v89
            else
                local v91
                v91, v90 = pcall(function() --[[ Line: 466 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                    --]]
                    return u7:InvokeServer()
                end)
                if v91 and v90 then
                    u13 = v90
                else
                    v90 = v89
                end
            end
            if v90 and (u80 and u80.Parent) then
                for v92, v93 in ipairs(v90) do
                    u71(u80, v93, u78, v92)
                end
            end
        end)
        u79.MouseButton1Click:Connect(function() --[[ Line: 482 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u78
                [3] = u75
                [4] = u12
            --]]
            if u10 then
                local u94 = u78
                local function u95() --[[ Line: 484 ]]
                    --[[
                    Upvalues:
                        [1] = u75
                    --]]
                    task.wait(0.8)
                    u75()
                end
                if u94 and u94.Parent then
                    u12 = u12 + 1
                    local u96 = u12
                    u94.Text = ""
                    local u97 = "Reviens quand tu veux t\'entra\195\174ner."
                    task.spawn(function() --[[ Line: 75 ]]
                        --[[
                        Upvalues:
                            [1] = u97
                            [2] = u96
                            [3] = u12
                            [4] = u94
                            [5] = u95
                        --]]
                        for v98 = 1, #u97 do
                            if u96 ~= u12 then
                                return
                            end
                            if not (u94 and u94.Parent) then
                                return
                            end
                            local v99 = u97
                            u94.Text = string.sub(v99, 1, v98)
                            task.wait(0.02)
                        end
                        if u95 and u96 == u12 then
                            u95()
                        end
                    end)
                elseif u95 then
                    task.wait(0.8)
                    u75()
                    return
                end
            end
        end)
        u81.MouseButton1Click:Connect(function() --[[ Line: 490 ]]
            --[[
            Upvalues:
                [1] = u75
            --]]
            u75()
        end)
        u79.MouseEnter:Connect(function() --[[ Line: 494 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u3
                [3] = u8
            --]]
            if u79.Parent then
                u3:Create(u79, TweenInfo.new(0.15), {
                    ["BackgroundColor3"] = u8.ButtonHover
                }):Play()
            end
        end)
        u79.MouseLeave:Connect(function() --[[ Line: 499 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u3
                [3] = u8
            --]]
            if u79.Parent then
                u3:Create(u79, TweenInfo.new(0.15), {
                    ["BackgroundColor3"] = u8.ButtonBg
                }):Play()
            end
        end)
        u81.MouseEnter:Connect(function() --[[ Line: 505 ]]
            --[[
            Upvalues:
                [1] = u81
                [2] = u3
            --]]
            if u81.Parent then
                u3:Create(u81, TweenInfo.new(0.15), {
                    ["BackgroundColor3"] = Color3.fromRGB(150, 30, 30)
                }):Play()
            end
        end)
        u81.MouseLeave:Connect(function() --[[ Line: 510 ]]
            --[[
            Upvalues:
                [1] = u81
                [2] = u3
            --]]
            if u81.Parent then
                u3:Create(u81, TweenInfo.new(0.15), {
                    ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
                }):Play()
            end
        end)
    end
end
local function u106() --[[ Line: 520 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u4
        [3] = u100
    --]]
    if u14 then
        u14:Disconnect()
        u14 = nil
    end
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    task.wait(3)
    local v101 = nil
    for _ = 1, 15 do
        v101 = workspace:FindFirstChild("VendeursF")
        if v101 then
            break
        end
        task.wait(2)
    end
    local v102 = v101 or workspace:WaitForChild("VendeursF", 60)
    if not v102 then
        return
    end
    local v103 = nil
    for _ = 1, 15 do
        v103 = v102:FindFirstChildOfClass("ProximityPrompt")
        if v103 then
            break
        end
        task.wait(1)
    end
    local v104 = v103 or v102:WaitForChild("ProximityPrompt", 30)
    if v104 then
        u14 = v104.Triggered:Connect(function(p105) --[[ Line: 568 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u100
            --]]
            if p105 == u4 then
                u100()
            end
        end)
    end
end
u4.CharacterAdded:Connect(function() --[[ Line: 575 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u10
        [3] = u11
        [4] = u9
        [5] = u106
    --]]
    u12 = u12 + 1
    u10 = false
    u11 = false
    if u9 then
        u9:Destroy()
        u9 = nil
    end
    task.wait(2)
    task.spawn(function() --[[ Line: 578 ]]
        --[[
        Upvalues:
            [1] = u106
        --]]
        local _, _ = pcall(u106)
    end)
end)
if u4.Character then
    task.spawn(function() --[[ Line: 586 ]]
        --[[
        Upvalues:
            [1] = u106
        --]]
        local _, _ = pcall(u106)
    end)
else
    u4.CharacterAdded:Wait()
    task.wait(2)
    task.spawn(function() --[[ Line: 594 ]]
        --[[
        Upvalues:
            [1] = u106
        --]]
        local _, _ = pcall(u106)
    end)
end