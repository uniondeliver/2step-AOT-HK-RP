-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = game:GetService("Players")
local v2 = game:GetService("UserInputService")
local u3 = game:GetService("TweenService")
local u4 = v1.LocalPlayer
local u5 = u4:WaitForChild("PlayerGui")
local u6 = nil
local u7 = false
local u8 = {
    ["Bataillon d\'Exploration"] = {
        ["logo"] = "rbxassetid://75230468870163",
        ["color"] = Color3.fromRGB(0, 100, 180),
        ["name"] = "BATAILLON D\'EXPLORATION"
    },
    ["Garnison"] = {
        ["logo"] = "rbxassetid://127931163920884",
        ["color"] = Color3.fromRGB(180, 50, 50),
        ["name"] = "GARNISON"
    },
    ["Brigade Sp\195\169ciale"] = {
        ["logo"] = "rbxassetid://94090394830162",
        ["color"] = Color3.fromRGB(0, 0, 0),
        ["name"] = "BRIGADE SP\195\137CIALE"
    },
    ["Police Militaire"] = {
        ["logo"] = "rbxassetid://94090394830162",
        ["color"] = Color3.fromRGB(40, 140, 80),
        ["name"] = "POLICE MILITAIRE"
    },
    ["Gouvernement"] = {
        ["logo"] = "",
        ["color"] = Color3.fromRGB(140, 120, 180),
        ["name"] = "GOUVERNEMENT"
    },
    ["Civil"] = {
        ["logo"] = "",
        ["color"] = Color3.fromRGB(120, 120, 120),
        ["name"] = "CIVIL"
    }
}
local function u71() --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u4
        [4] = u8
    --]]
    if u6 and u6.Parent then
        u6:Destroy()
    end
    u6 = Instance.new("ScreenGui")
    u6.Name = "CharacterBook"
    u6.ResetOnSpawn = false
    u6.Parent = u5
    local v9 = Instance.new("Frame")
    v9.Name = "Overlay"
    v9.Size = UDim2.new(1, 0, 1, 0)
    v9.BackgroundTransparency = 1
    v9.BorderSizePixel = 0
    v9.Visible = false
    v9.Parent = u6
    local v10 = Instance.new("Frame")
    v10.Name = "LeftPage"
    v10.Size = UDim2.new(0, 380, 0, 750)
    v10.Position = UDim2.new(0.5, 0, 0.5, 0)
    v10.AnchorPoint = Vector2.new(1, 0.5)
    v10.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    v10.BorderSizePixel = 0
    v10.Visible = false
    v10.Parent = u6
    Instance.new("UICorner", v10).CornerRadius = UDim.new(0, 15)
    local v11 = Instance.new("UIStroke", v10)
    v11.Color = Color3.fromRGB(100, 100, 110)
    v11.Thickness = 3
    v11.Transparency = 0.4
    local u12 = Instance.new("ImageLabel")
    u12.Name = "Logo"
    u12.Size = UDim2.new(0, 180, 0, 180)
    u12.Position = UDim2.new(0.5, -90, 0, 50)
    u12.BackgroundTransparency = 1
    u12.Image = ""
    u12.ScaleType = Enum.ScaleType.Fit
    u12.Parent = v10
    local v13 = Instance.new("Frame")
    v13.Name = "CircleFrame"
    v13.Size = UDim2.new(0, 220, 0, 220)
    v13.Position = UDim2.new(0.5, -110, 0, 30)
    v13.BackgroundTransparency = 1
    v13.Parent = v10
    Instance.new("UICorner", v13).CornerRadius = UDim.new(1, 0)
    local u14 = Instance.new("UIStroke", v13)
    u14.Name = "CircleStroke"
    u14.Color = Color3.fromRGB(120, 120, 120)
    u14.Thickness = 3
    u14.Transparency = 0.5
    local u15 = Instance.new("TextLabel")
    u15.Name = "RegName"
    u15.Size = UDim2.new(1, -40, 0, 50)
    u15.Position = UDim2.new(0, 20, 0, 260)
    u15.BackgroundTransparency = 1
    u15.Text = "CIVIL"
    u15.TextColor3 = Color3.fromRGB(220, 220, 225)
    u15.Font = Enum.Font.Bodoni
    u15.TextSize = 24
    u15.TextWrapped = true
    u15.Parent = v10
    local u16 = Instance.new("Frame")
    u16.Name = "Line"
    u16.Size = UDim2.new(0, 150, 0, 2)
    u16.Position = UDim2.new(0.5, -75, 0, 320)
    u16.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    u16.BorderSizePixel = 0
    u16.Parent = v10
    local v17 = Instance.new("TextLabel")
    v17.Size = UDim2.new(1, -40, 0, 25)
    v17.Position = UDim2.new(0, 20, 0, 340)
    v17.BackgroundTransparency = 1
    v17.Text = "GRADE"
    v17.TextColor3 = Color3.fromRGB(140, 140, 145)
    v17.Font = Enum.Font.Bodoni
    v17.TextSize = 18
    v17.Parent = v10
    local u18 = Instance.new("TextLabel")
    u18.Name = "RankBox"
    u18.Size = UDim2.new(1, -40, 0, 55)
    u18.Position = UDim2.new(0, 20, 0, 370)
    u18.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    u18.Text = "Citoyen"
    u18.TextColor3 = Color3.fromRGB(230, 230, 240)
    u18.Font = Enum.Font.Bodoni
    u18.TextSize = 30
    u18.BorderSizePixel = 0
    u18.Parent = v10
    Instance.new("UICorner", u18).CornerRadius = UDim.new(0, 10)
    local u19 = Instance.new("UIStroke", u18)
    u19.Name = "RankStroke"
    u19.Color = Color3.fromRGB(120, 120, 120)
    u19.Thickness = 2
    u19.Transparency = 0.5
    local u20 = Instance.new("Frame")
    u20.Name = "RightPage"
    u20.Size = UDim2.new(0, 380, 0, 750)
    u20.Position = UDim2.new(0.5, 0, 0.5, 0)
    u20.AnchorPoint = Vector2.new(0, 0.5)
    u20.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    u20.BorderSizePixel = 0
    u20.Visible = false
    u20.Parent = u6
    Instance.new("UICorner", u20).CornerRadius = UDim.new(0, 15)
    local v21 = Instance.new("UIStroke", u20)
    v21.Color = Color3.fromRGB(100, 100, 110)
    v21.Thickness = 3
    v21.Transparency = 0.4
    local v22 = Instance.new("TextLabel")
    v22.Size = UDim2.new(1, -40, 0, 60)
    v22.Position = UDim2.new(0, 20, 0, 40)
    v22.BackgroundTransparency = 1
    v22.Text = "DOSSIER PERSONNEL"
    v22.TextColor3 = Color3.fromRGB(220, 220, 225)
    v22.Font = Enum.Font.Bodoni
    v22.TextSize = 30
    v22.Parent = u20
    local v23 = Instance.new("TextLabel")
    v23.Size = UDim2.new(1, -40, 0, 25)
    v23.Position = UDim2.new(0, 20, 0, 95)
    v23.BackgroundTransparency = 1
    v23.Text = "Informations du soldat"
    v23.TextColor3 = Color3.fromRGB(140, 140, 145)
    v23.Font = Enum.Font.SourceSansItalic
    v23.TextSize = 17
    v23.Parent = u20
    local function v31(p24, p25, p26) --[[ Line: 206 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        local v27 = Instance.new("Frame")
        v27.Size = UDim2.new(1, -80, 0, 85)
        v27.Position = UDim2.new(0, 40, 0, p26)
        v27.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        v27.BorderSizePixel = 0
        v27.Parent = u20
        Instance.new("UICorner", v27).CornerRadius = UDim.new(0, 10)
        local v28 = Instance.new("Frame")
        v28.Name = "Bar"
        v28.Size = UDim2.new(0, 4, 1, 0)
        v28.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
        v28.BorderSizePixel = 0
        v28.Parent = v27
        Instance.new("UICorner", v28).CornerRadius = UDim.new(0, 10)
        local v29 = Instance.new("TextLabel")
        v29.Size = UDim2.new(1, -40, 0, 25)
        v29.Position = UDim2.new(0, 20, 0, 12)
        v29.BackgroundTransparency = 1
        v29.Text = p24
        v29.TextColor3 = Color3.fromRGB(140, 140, 145)
        v29.Font = Enum.Font.Bodoni
        v29.TextSize = 16
        v29.TextXAlignment = Enum.TextXAlignment.Left
        v29.Parent = v27
        local v30 = Instance.new("TextLabel")
        v30.Name = "Value"
        v30.Size = UDim2.new(1, -40, 0, 40)
        v30.Position = UDim2.new(0, 20, 0, 38)
        v30.BackgroundTransparency = 1
        v30.Text = p25
        v30.TextColor3 = Color3.fromRGB(230, 230, 240)
        v30.Font = Enum.Font.Bodoni
        v30.TextSize = 26
        v30.TextXAlignment = Enum.TextXAlignment.Left
        v30.TextWrapped = true
        v30.Parent = v27
        return v30, v28
    end
    local u32, u33 = v31("NOM COMPLET", "...", 160)
    local u34, u35 = v31("\195\130GE", "...", 260)
    local u36, u37 = v31("LIEU D\'ORIGINE", "...", 360)
    local v38 = Instance.new("Frame")
    v38.Size = UDim2.new(1, -80, 0, 105)
    v38.Position = UDim2.new(0, 40, 0, 460)
    v38.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    v38.BorderSizePixel = 0
    v38.Parent = u20
    Instance.new("UICorner", v38).CornerRadius = UDim.new(0, 10)
    local u39 = Instance.new("Frame")
    u39.Name = "Bar"
    u39.Size = UDim2.new(0, 4, 1, 0)
    u39.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    u39.BorderSizePixel = 0
    u39.Parent = v38
    Instance.new("UICorner", u39).CornerRadius = UDim.new(0, 10)
    local v40 = Instance.new("TextLabel")
    v40.Size = UDim2.new(1, -40, 0, 20)
    v40.Position = UDim2.new(0, 20, 0, 10)
    v40.BackgroundTransparency = 1
    v40.Text = "LIGN\195\137E"
    v40.TextColor3 = Color3.fromRGB(140, 140, 145)
    v40.Font = Enum.Font.Bodoni
    v40.TextSize = 16
    v40.TextXAlignment = Enum.TextXAlignment.Left
    v40.Parent = v38
    local u41 = Instance.new("TextLabel")
    u41.Name = "LineageTitleVal"
    u41.Size = UDim2.new(1, -40, 0, 28)
    u41.Position = UDim2.new(0, 20, 0, 32)
    u41.BackgroundTransparency = 1
    u41.Text = "\226\128\148"
    u41.TextColor3 = Color3.fromRGB(230, 230, 240)
    u41.Font = Enum.Font.Bodoni
    u41.TextSize = 22
    u41.TextXAlignment = Enum.TextXAlignment.Left
    u41.Parent = v38
    local u42 = Instance.new("TextLabel")
    u42.Name = "LineageDescVal"
    u42.Size = UDim2.new(1, -40, 0, 30)
    u42.Position = UDim2.new(0, 20, 0, 64)
    u42.BackgroundTransparency = 1
    u42.Text = ""
    u42.TextColor3 = Color3.fromRGB(160, 160, 170)
    u42.Font = Enum.Font.SourceSansItalic
    u42.TextSize = 15
    u42.TextXAlignment = Enum.TextXAlignment.Left
    u42.TextWrapped = true
    u42.Parent = v38
    local u43, u44 = v31("TITANS \195\137LIMIN\195\137S", "0", 580)
    local v45 = Instance.new("TextLabel")
    v45.Size = UDim2.new(1, 0, 0, 50)
    v45.Position = UDim2.new(0, 0, 1, -70)
    v45.BackgroundTransparency = 1
    v45.Text = "Appuyez sur [U] pour fermer"
    v45.TextColor3 = Color3.fromRGB(100, 100, 110)
    v45.Font = Enum.Font.SourceSansItalic
    v45.TextSize = 14
    v45.Parent = u20
    local function u61() --[[ Line: 323 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u32
            [3] = u34
            [4] = u36
            [5] = u41
            [6] = u42
            [7] = u43
            [8] = u18
            [9] = u8
            [10] = u12
            [11] = u15
            [12] = u14
            [13] = u16
            [14] = u19
            [15] = u33
            [16] = u35
            [17] = u37
            [18] = u39
            [19] = u44
        --]]
        local v46 = u4.Character
        if v46 then
            task.wait(0.5)
            local v47 = v46:WaitForChild("RPName", 5)
            local v48 = v46:WaitForChild("Age", 5)
            local v49 = v46:WaitForChild("Origin", 5)
            local v50 = v46:WaitForChild("Regiment", 5)
            local v51 = v46:WaitForChild("Rank", 5)
            if v47 and v47.Value ~= "" then
                u32.Text = v47.Value
            else
                u32.Text = u4.DisplayName
            end
            if v48 and v48.Value ~= 0 then
                local v52 = u34
                local v53 = v48.Value
                v52.Text = tostring(v53) .. " ans"
            else
                u34.Text = "18 ans"
            end
            if v49 and v49.Value ~= "" then
                u36.Text = v49.Value
            else
                u36.Text = "Trost"
            end
            local v54 = v46:FindFirstChild("LineageTitle")
            local v55 = v46:FindFirstChild("LineageDesc")
            u41.Text = v54 and v54.Value ~= "" and (v54.Value or "\226\128\148") or "\226\128\148"
            u42.Text = v55 and v55.Value ~= "" and (v55.Value or "") or ""
            local v56 = u4:FindFirstChild("leaderstats")
            local v57
            if v56 then
                local v58 = v56:FindFirstChild("TitansKilled")
                v57 = not v58 and 0 or v58.Value
            else
                v57 = 0
            end
            u43.Text = tostring(v57)
            local v59 = v50 and v50.Value ~= "" and (v50.Value or "Civil") or "Civil"
            u18.Text = v51 and v51.Value ~= "" and (v51.Value or "Citoyen") or "Citoyen"
            local v60 = u8[v59]
            if v60 then
                u12.Image = v60.logo
                u15.Text = v60.name
                u14.Color = v60.color
                u16.BackgroundColor3 = v60.color
                u19.Color = v60.color
                u33.BackgroundColor3 = v60.color
                u35.BackgroundColor3 = v60.color
                u37.BackgroundColor3 = v60.color
                u39.BackgroundColor3 = v60.color
                u44.BackgroundColor3 = v60.color
            end
        end
    end
    local function v65() --[[ Line: 384 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u43
        --]]
        local v62 = u4:WaitForChild("leaderstats", 15)
        if v62 then
            local u63 = v62:WaitForChild("TitansKilled", 15)
            if u63 then
                u63.Changed:Connect(function() --[[ Line: 390 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                        [2] = u43
                    --]]
                    local v64 = u63.Value
                    u43.Text = tostring(v64)
                end)
            end
        else
            return
        end
    end
    local function u69(p66) --[[ Line: 396 ]]
        --[[
        Upvalues:
            [1] = u61
        --]]
        task.wait(1)
        for _, v67 in pairs({
            "RPName",
            "Age",
            "Origin",
            "Regiment",
            "Rank",
            "LineageTitle",
            "LineageDesc"
        }) do
            local v68 = p66:WaitForChild(v67, 10)
            if v68 then
                v68.Changed:Connect(function() --[[ Line: 402 ]]
                    --[[
                    Upvalues:
                        [1] = u61
                    --]]
                    task.wait(0.1)
                    u61()
                end)
            end
        end
        task.wait(0.5)
        u61()
    end
    task.spawn(v65)
    if u4.Character then
        u69(u4.Character)
    end
    u4.CharacterAdded:Connect(function(p70) --[[ Line: 419 ]]
        --[[
        Upvalues:
            [1] = u69
        --]]
        task.wait(1)
        u69(p70)
    end)
end
v2.InputBegan:Connect(function(p72, p73) --[[ Line: 426 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u71
        [3] = u7
        [4] = u4
        [5] = u8
        [6] = u3
    --]]
    if p73 then
        return
    end
    if p72.KeyCode ~= Enum.KeyCode.U then
        return
    end
    if not (u6 and u6.Parent) then
        u71()
        task.wait(0.1)
    end
    local v74 = u6:FindFirstChild("Overlay")
    local v75 = u6:FindFirstChild("LeftPage")
    local v76 = u6:FindFirstChild("RightPage")
    if not (v74 and (v75 and v76)) then
        return
    end
    u7 = not u7
    if not u7 then
        local v77 = u3:Create(v75, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            ["Size"] = UDim2.new(0, 0, 0, 750)
        })
        local v78 = u3:Create(v76, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            ["Size"] = UDim2.new(0, 0, 0, 750)
        })
        v77:Play()
        v78:Play()
        v78.Completed:Wait()
        v74.Visible = false
        v75.Visible = false
        v76.Visible = false
        return
    end
    local v79 = u4.Character
    if v79 then
        task.wait(0.2)
        local v80 = v79:FindFirstChild("RPName")
        local v81 = v79:FindFirstChild("Age")
        local v82 = v79:FindFirstChild("Origin")
        local v83 = v79:FindFirstChild("Regiment")
        local v84 = v79:FindFirstChild("Rank")
        local v85 = v79:FindFirstChild("LineageTitle")
        local v86 = v79:FindFirstChild("LineageDesc")
        for _, v87 in pairs(v76:GetDescendants()) do
            if v87.Name == "Value" and v87:IsA("TextLabel") then
                local v88 = v87.Parent
                if v88 and v88:IsA("Frame") then
                    local v89 = nil
                    for _, v90 in pairs(v88:GetChildren()) do
                        if v90:IsA("TextLabel") and v90.Name ~= "Value" then
                            v89 = v90
                            break
                        end
                    end
                    if v89 then
                        if v89.Text == "NOM COMPLET" then
                            v87.Text = v80 and v80.Value ~= "" and v80.Value or u4.DisplayName
                        elseif v89.Text == "\195\130GE" then
                            local v91
                            if v81 and v81.Value ~= 0 then
                                local v92 = v81.Value
                                v91 = tostring(v92) .. " ans" or "18 ans"
                            else
                                v91 = "18 ans"
                            end
                            v87.Text = v91
                        elseif v89.Text == "LIEU D\'ORIGINE" then
                            v87.Text = v82 and v82.Value ~= "" and (v82.Value or "Trost") or "Trost"
                        elseif v89.Text == "TITANS \195\137LIMIN\195\137S" then
                            local v93 = u4:FindFirstChild("leaderstats")
                            local v94
                            if v93 then
                                local v95 = v93:FindFirstChild("TitansKilled")
                                v94 = not v95 and 0 or v95.Value
                            else
                                v94 = 0
                            end
                            v87.Text = tostring(v94)
                        end
                    end
                end
            end
        end
        local v96 = v76:FindFirstChild("LineageTitleVal", true)
        local v97 = v76:FindFirstChild("LineageDescVal", true)
        if v96 then
            v96.Text = v85 and v85.Value ~= "" and (v85.Value or "\226\128\148") or "\226\128\148"
        end
        if v97 then
            v97.Text = v86 and v86.Value ~= "" and (v86.Value or "") or ""
        end
        local v98 = v83 and v83.Value ~= "" and (v83.Value or "Civil") or "Civil"
        local v99 = v84 and v84.Value ~= "" and (v84.Value or "Citoyen") or "Citoyen"
        local v100 = v75:FindFirstChild("RankBox")
        if v100 then
            v100.Text = v99
        end
        local v101 = u8[v98]
        if v101 then
            local v102 = v75:FindFirstChild("Logo")
            local v103 = v75:FindFirstChild("RegName")
            local v104 = v75:FindFirstChild("CircleFrame")
            if v104 then
                v104 = v104:FindFirstChild("CircleStroke")
            end
            local v105 = v75:FindFirstChild("Line")
            if v100 then
                v100 = v100:FindFirstChild("RankStroke")
            end
            if v102 then
                v102.Image = v101.logo
            end
            if v103 then
                v103.Text = v101.name
            end
            if v104 then
                v104.Color = v101.color
            end
            if v105 then
                v105.BackgroundColor3 = v101.color
            end
            if v100 then
                v100.Color = v101.color
            end
            for _, v106 in pairs(v76:GetDescendants()) do
                if v106.Name == "Bar" then
                    v106.BackgroundColor3 = v101.color
                end
            end
        end
    end
    v74.Visible = true
    v75.Visible = true
    v76.Visible = true
    v75.Size = UDim2.new(0, 0, 0, 750)
    v76.Size = UDim2.new(0, 0, 0, 750)
    u3:Create(v75, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.new(0, 380, 0, 750)
    }):Play()
    u3:Create(v76, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.new(0, 380, 0, 750)
    }):Play()
end)
task.wait(2)
if u4.Character then
    task.wait(1)
    u71()
end
u4.CharacterAdded:Connect(function() --[[ Line: 555 ]]
    --[[
    Upvalues:
        [1] = u71
    --]]
    task.wait(2)
    u71()
end)